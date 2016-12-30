Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v6 2/3] remoteproc: qcom: Initialize and enable proxy and active clocks.
Date: Fri, 30 Dec 2016 19:24:01 +0530
Message-Id: <1483106042-32118-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1483106042-32118-1-git-send-email-akdwived@codeaurora.org>
References: <1483106042-32118-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Certain clocks need voting by rproc on behalf of hexagon only during
restart operation but certain clocks need to be voted till hexagon is
up, these clocks are identified as proxy and active clocks respectively.
This patch provide interface to initialize, enable and disable proxy and
active clocks separately.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 152 +++++++++++++++++++++++++++----------
 1 file changed, 111 insertions(+), 41 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index d875448..1e5e27b 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -95,6 +95,8 @@
 
 struct rproc_hexagon_res {
 	const char *hexagon_mba_image;
+	char **proxy_clk_names;
+	char **active_clk_names;
 };
 
 struct q6v5 {
@@ -114,11 +116,13 @@ struct q6v5 {
 	struct qcom_smem_state *state;
 	unsigned stop_bit;
 
+	struct clk *active_clks[8];
+	struct clk *proxy_clks[4];
+	int active_clk_count;
+	int proxy_clk_count;
+
 	struct regulator_bulk_data supply[4];
 
-	struct clk *ahb_clk;
-	struct clk *axi_clk;
-	struct clk *rom_clk;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -193,6 +197,37 @@ static void q6v5_regulator_disable(struct q6v5 *qproc)
 	regulator_set_voltage(mss, 0, 1150000);
 }
 
+static int q6v5_clk_enable(struct device *dev,
+			struct clk **clks, int count)
+{
+	int rc;
+	int i;
+
+	for (i = 0; i < count; i++) {
+		rc = clk_prepare_enable(clks[i]);
+		if (rc) {
+			dev_err(dev, "Clock enable failed\n");
+			goto err;
+		}
+	}
+
+	return 0;
+err:
+	for (i--; i >= 0; i--)
+		clk_disable_unprepare(clks[i]);
+
+	return rc;
+}
+
+static void q6v5_clk_disable(struct device *dev,
+			struct clk **clks, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		clk_disable_unprepare(clks[i]);
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -488,23 +523,24 @@ static int q6v5_start(struct rproc *rproc)
 		return ret;
 	}
 
+	ret = q6v5_clk_enable(qproc->dev, qproc->proxy_clks,
+					qproc->proxy_clk_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable proxy clocks\n");
+		goto disable_vdd;
+	}
 	ret = reset_control_deassert(qproc->mss_restart);
 	if (ret) {
 		dev_err(qproc->dev, "failed to deassert mss restart\n");
-		goto disable_vdd;
+		goto disable_proxy_clk;
 	}
 
-	ret = clk_prepare_enable(qproc->ahb_clk);
-	if (ret)
+	ret = q6v5_clk_enable(qproc->dev, qproc->active_clks,
+					qproc->active_clk_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable clocks\n");
 		goto assert_reset;
-
-	ret = clk_prepare_enable(qproc->axi_clk);
-	if (ret)
-		goto disable_ahb_clk;
-
-	ret = clk_prepare_enable(qproc->rom_clk);
-	if (ret)
-		goto disable_axi_clk;
+	}
 
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
 
@@ -547,14 +583,13 @@ static int q6v5_start(struct rproc *rproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
-
-	clk_disable_unprepare(qproc->rom_clk);
-disable_axi_clk:
-	clk_disable_unprepare(qproc->axi_clk);
-disable_ahb_clk:
-	clk_disable_unprepare(qproc->ahb_clk);
+	q6v5_clk_disable(qproc->dev, qproc->active_clks,
+				qproc->active_clk_count);
 assert_reset:
 	reset_control_assert(qproc->mss_restart);
+disable_proxy_clk:
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+				qproc->proxy_clk_count);
 disable_vdd:
 	q6v5_regulator_disable(qproc);
 
@@ -583,9 +618,10 @@ static int q6v5_stop(struct rproc *rproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
 	reset_control_assert(qproc->mss_restart);
-	clk_disable_unprepare(qproc->rom_clk);
-	clk_disable_unprepare(qproc->axi_clk);
-	clk_disable_unprepare(qproc->ahb_clk);
+	q6v5_clk_disable(qproc->dev, qproc->active_clks,
+				qproc->active_clk_count);
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+				qproc->proxy_clk_count);
 	q6v5_regulator_disable(qproc);
 
 	return 0;
@@ -706,27 +742,29 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 	return 0;
 }
 
-static int q6v5_init_clocks(struct q6v5 *qproc)
+static int q6v5_init_clocks(struct device *dev, struct clk **clks,
+		char **clk_names)
 {
-	qproc->ahb_clk = devm_clk_get(qproc->dev, "iface");
-	if (IS_ERR(qproc->ahb_clk)) {
-		dev_err(qproc->dev, "failed to get iface clock\n");
-		return PTR_ERR(qproc->ahb_clk);
-	}
+	int i;
 
-	qproc->axi_clk = devm_clk_get(qproc->dev, "bus");
-	if (IS_ERR(qproc->axi_clk)) {
-		dev_err(qproc->dev, "failed to get bus clock\n");
-		return PTR_ERR(qproc->axi_clk);
-	}
+	if (!clk_names)
+		return 0;
+
+	for (i = 0; clk_names[i]; i++) {
+		clks[i] = devm_clk_get(dev, clk_names[i]);
+		if (IS_ERR(clks[i])) {
+
+			int rc = PTR_ERR(clks[i]);
+
+			if (rc != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get %s clock\n",
+					clk_names[i]);
+			return rc;
+		}
 
-	qproc->rom_clk = devm_clk_get(qproc->dev, "mem");
-	if (IS_ERR(qproc->rom_clk)) {
-		dev_err(qproc->dev, "failed to get mem clock\n");
-		return PTR_ERR(qproc->rom_clk);
 	}
 
-	return 0;
+	return i;
 }
 
 static int q6v5_init_reset(struct q6v5 *qproc)
@@ -843,9 +881,21 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = q6v5_init_clocks(qproc);
-	if (ret)
+	ret = q6v5_init_clocks(&pdev->dev, qproc->proxy_clks,
+					desc->proxy_clk_names);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get proxy clocks.\n");
 		goto free_rproc;
+	}
+	qproc->proxy_clk_count = ret;
+
+	ret = q6v5_init_clocks(&pdev->dev, qproc->active_clks,
+					desc->active_clk_names);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get active clocks.\n");
+		goto free_rproc;
+	}
+	qproc->active_clk_count = ret;
 
 	ret = q6v5_regulator_init(qproc);
 	if (ret)
@@ -901,10 +951,30 @@ static int q6v5_remove(struct platform_device *pdev)
 
 static const struct rproc_hexagon_res msm8916_mss = {
 	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+			"xo",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"mem",
+			NULL
+	},
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
 	.hexagon_mba_image = "mba.b00",
+	.proxy_clk_names = (char*[]){
+			"xo",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"mem",
+			NULL
+	},
 };
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
