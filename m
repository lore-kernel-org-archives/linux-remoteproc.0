Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 1/3] remoteproc: qcom: Embed private data structure for hexagon dsp.
Date: Mon,  7 Nov 2016 18:07:18 +0530
Message-Id: <1478522240-11036-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
References: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Embed resources specific to version of hexagon chip in device
structure to avoid conditional check for manipulation of those
resources in driver code.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 148 +++++++++++++++++----
 2 files changed, 126 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 57cb49e..cbc165c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -8,6 +8,7 @@ on the Qualcomm Hexagon core.
 	Value type: <string>
 	Definition: must be one of:
 		    "qcom,q6v5-pil"
+		"qcom,q6v56-pil"
 
 - reg:
 	Usage: required
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2e0caaa..b60dff3 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -30,13 +30,13 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/of_device.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
 
 #include <linux/qcom_scm.h>
 
-#define MBA_FIRMWARE_NAME		"mba.b00"
 #define MPSS_FIRMWARE_NAME		"modem.mdt"
 
 #define MPSS_CRASH_REASON_SMEM		421
@@ -93,13 +93,32 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+struct q6_rproc_res {
+	char **proxy_clks;
+	int proxy_clk_cnt;
+	char **active_clks;
+	int active_clk_cnt;
+	char **proxy_regs;
+	int proxy_reg_cnt;
+	char **active_regs;
+	int active_reg_cnt;
+	int **proxy_reg_action;
+	int **active_reg_action;
+	int *proxy_reg_load;
+	int *active_reg_load;
+	int *proxy_reg_voltage;
+	int *active_reg_voltage;
+	char *q6_version;
+	char *q6_mba_image;
+	int (*q6_reset_init)(void *q, void *p);
+};
 struct q6v5 {
 	struct device *dev;
 	struct rproc *rproc;
 
 	void __iomem *reg_base;
 	void __iomem *rmb_base;
-
+	void __iomem *restart_reg;
 	struct regmap *halt_map;
 	u32 halt_q6;
 	u32 halt_modem;
@@ -111,7 +130,7 @@ struct q6v5 {
 	unsigned stop_bit;
 
 	struct regulator_bulk_data supply[4];
-
+	const struct q6_rproc_res *q6_rproc_res;
 	struct clk *ahb_clk;
 	struct clk *axi_clk;
 	struct clk *rom_clk;
@@ -198,7 +217,7 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
-static const struct rproc_fw_ops q6v5_fw_ops = {
+static const struct rproc_fw_ops q6_fw_ops = {
 	.find_rsc_table = qcom_mdt_find_rsc_table,
 	.load = q6v5_load,
 };
@@ -599,7 +618,7 @@ static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
 	return qproc->mpss_region + offset;
 }
 
-static const struct rproc_ops q6v5_ops = {
+static const struct rproc_ops q6_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
 	.da_to_va = q6v5_da_to_va,
@@ -725,17 +744,36 @@ static int q6v5_init_clocks(struct q6v5 *qproc)
 	return 0;
 }
 
-static int q6v5_init_reset(struct q6v5 *qproc)
+static int q6v5_init_reset(void *q, void *p)
 {
-	qproc->mss_restart = devm_reset_control_get(qproc->dev, NULL);
+	struct q6v5 *qproc = q;
+	struct platform_device *pdev = p;
+
+	qproc->mss_restart = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(qproc->mss_restart)) {
-		dev_err(qproc->dev, "failed to acquire mss restart\n");
+		dev_err(&pdev->dev, "failed to acquire mss restart\n");
 		return PTR_ERR(qproc->mss_restart);
 	}
 
 	return 0;
 }
 
+static int q6v56_init_reset(void *q, void *p)
+{
+	struct resource *res;
+	struct q6v5 *qproc = q;
+	struct platform_device *pdev = p;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "restart_reg");
+	qproc->restart_reg = devm_ioremap(qproc->dev, res->start,
+							resource_size(res));
+	if (IS_ERR(qproc->restart_reg)) {
+		dev_err(qproc->dev, "failed to get restart_reg\n");
+		return PTR_ERR(qproc->restart_reg);
+	}
+
+	return 0;
+}
 static int q6v5_request_irq(struct q6v5 *qproc,
 			     struct platform_device *pdev,
 			     const char *name,
@@ -803,20 +841,25 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	return 0;
 }
 
-static int q6v5_probe(struct platform_device *pdev)
+static int q6_probe(struct platform_device *pdev)
 {
 	struct q6v5 *qproc;
 	struct rproc *rproc;
+	const struct q6_rproc_res *desc;
 	int ret;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
-			    MBA_FIRMWARE_NAME, sizeof(*qproc));
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6_ops,
+			    desc->q6_mba_image, sizeof(*qproc));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
 	}
 
-	rproc->fw_ops = &q6v5_fw_ops;
+	rproc->fw_ops = &q6_fw_ops;
 
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
@@ -826,6 +869,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	init_completion(&qproc->start_done);
 	init_completion(&qproc->stop_done);
 
+	qproc->q6_rproc_res = desc;
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
 		goto free_rproc;
@@ -842,7 +886,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = q6v5_init_reset(qproc);
+	ret = qproc->q6_rproc_res->q6_reset_init(qproc, pdev);
 	if (ret)
 		goto free_rproc;
 
@@ -873,14 +917,12 @@ static int q6v5_probe(struct platform_device *pdev)
 		goto free_rproc;
 
 	return 0;
-
 free_rproc:
 	rproc_free(rproc);
-
 	return ret;
 }
 
-static int q6v5_remove(struct platform_device *pdev)
+static int q6_remove(struct platform_device *pdev)
 {
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 
@@ -890,20 +932,80 @@ static int q6v5_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id q6v5_of_match[] = {
-	{ .compatible = "qcom,q6v5-pil", },
+char *proxy_8x96_reg_str[] = {"mx", "cx", "vdd_pll"};
+int  proxy_8x96_reg_action[3][2] = { {0, 1}, {1, 1}, {1, 0} };
+int  proxy_8x96_reg_load[] = {0, 100000, 100000};
+int  proxy_8x96_reg_min_voltage[] = {1050000, 1250000, 0};
+char *proxy_8x96_clk_str[] = {"xo", "pnoc", "qdss"};
+char *active_8x96_clk_str[] = {"iface", "bus", "mem", "gpll0_mss_clk",
+		"snoc_axi_clk", "mnoc_axi_clk"};
+
+static const struct q6_rproc_res msm_8996_res = {
+	.proxy_clks = proxy_8x96_clk_str,
+	.proxy_clk_cnt = 3,
+	.active_clks = active_8x96_clk_str,
+	.active_clk_cnt = 6,
+	.proxy_regs = proxy_8x96_reg_str,
+	.active_regs = NULL,
+	.proxy_reg_action = (int **)proxy_8x96_reg_action,
+	.proxy_reg_load = (int *)proxy_8x96_reg_load,
+	.active_reg_action = NULL,
+	.active_reg_load = NULL,
+	.proxy_reg_voltage = (int *)proxy_8x96_reg_min_voltage,
+	.active_reg_voltage = NULL,
+	.proxy_reg_cnt = 3,
+	.active_reg_cnt = 0,
+	.q6_reset_init = q6v56_init_reset,
+	.q6_version = "v56",
+	.q6_mba_image = "mba.mbn",
+};
+
+char *proxy_8x16_reg_str[] = {"mx", "cx", "pll"};
+char *active_8x16_reg_str[] = {"mss"};
+int  proxy_8x16_reg_action[4][2] = { {0, 1}, {1, 0}, {1, 0} };
+int  active_8x16_reg_action[1][2] = { {1, 1} };
+int  proxy_8x16_reg_load[] = {100000, 0, 100000, 100000};
+int  active_8x16_reg_load[] = {100000};
+int  proxy_8x16_reg_min_voltage[] = {1050000, 0, 0};
+int  active_8x16_reg_min_voltage[] = {1000000};
+char *proxy_8x16_clk_str[] = {"xo"};
+char *active_8x16_clk_str[] = {"iface", "bus", "mem"};
+
+static const struct q6_rproc_res msm_8916_res = {
+	.proxy_clks = proxy_8x16_clk_str,
+	.proxy_clk_cnt = 1,
+	.active_clks = active_8x16_clk_str,
+	.active_clk_cnt = 3,
+	.proxy_regs = proxy_8x16_reg_str,
+	.active_regs = active_8x16_reg_str,
+	.proxy_reg_action = (int **)proxy_8x16_reg_action,
+	.proxy_reg_load = (int *)proxy_8x16_reg_load,
+	.active_reg_action = (int **)active_8x16_reg_action,
+	.active_reg_load = (int *)active_8x16_reg_load,
+	.proxy_reg_voltage = (int *)proxy_8x16_reg_min_voltage,
+	.active_reg_voltage = active_8x16_reg_min_voltage,
+	.proxy_reg_cnt = 3,
+	.active_reg_cnt = 1,
+	.q6_reset_init = q6v5_init_reset,
+	.q6_version = "v5",
+	.q6_mba_image = "mba.b00",
+};
+
+static const struct of_device_id q6_of_match[] = {
+	{ .compatible = "qcom,q6v5-pil", .data = &msm_8916_res},
+	{ .compatible = "qcom,q6v56-pil", .data = &msm_8996_res},
 	{ },
 };
 
-static struct platform_driver q6v5_driver = {
-	.probe = q6v5_probe,
-	.remove = q6v5_remove,
+static struct platform_driver q6_driver = {
+	.probe = q6_probe,
+	.remove = q6_remove,
 	.driver = {
 		.name = "qcom-q6v5-pil",
-		.of_match_table = q6v5_of_match,
+		.of_match_table = q6_of_match,
 	},
 };
-module_platform_driver(q6v5_driver);
+module_platform_driver(q6_driver);
 
 MODULE_DESCRIPTION("Peripheral Image Loader for Hexagon");
 MODULE_LICENSE("GPL v2");
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
