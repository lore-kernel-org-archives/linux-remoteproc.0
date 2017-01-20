Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC PATCH v2 1/3] remoteproc: qcom: make adsp resource handling generic.
Date: Fri, 20 Jan 2017 21:40:34 +0530
Message-Id: <1484928636-27351-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
References: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch make resource handling generic in adsp remoteproc driver.
Resources which were initialized with hard definition are being
initialized now based on compatible string. Generic way of resource
initialization and handling is required so that slpi processor boot
support can also be enabled with same driver.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_adsp_pil.c | 259 +++++++++++++++++++++++++++++--------
 1 file changed, 208 insertions(+), 51 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 43a4ed2..ab2632b 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -32,9 +32,26 @@
 #include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
 
-#define ADSP_CRASH_REASON_SMEM		423
-#define ADSP_FIRMWARE_NAME		"adsp.mdt"
-#define ADSP_PAS_ID			1
+struct reg_info {
+	struct regulator *reg;
+	int uV;
+	int uA;
+};
+
+struct regulator_res {
+	const char *supply;
+	int uV;
+	int uA;
+};
+
+struct generic_rproc_res {
+	int crash_reason_smem;
+	const char *firmware_name;
+	int fw_pas_id;
+	struct regulator_res reg_res[3];
+	char **clocks_name;
+};
+
 
 struct qcom_adsp {
 	struct device *dev;
@@ -49,9 +66,13 @@ struct qcom_adsp {
 	struct qcom_smem_state *state;
 	unsigned stop_bit;
 
-	struct clk *xo;
+	struct clk *clocks[3];
+	int clk_count;
+	struct reg_info regulators[3];
+	int reg_count;
 
-	struct regulator *cx_supply;
+	int fw_pas_id;
+	int crash_reason_smem;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -62,6 +83,136 @@ struct qcom_adsp {
 	size_t mem_size;
 };
 
+static int generic_regulator_init(struct device *dev, struct reg_info *regs,
+				const struct regulator_res *reg_res)
+{
+	int rc;
+	int i;
+
+	for (i = 0; reg_res[i].supply; i++) {
+		regs[i].reg = devm_regulator_get(dev, reg_res[i].supply);
+		if (IS_ERR(regs[i].reg)) {
+			rc = PTR_ERR(regs[i].reg);
+			if (rc != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get %s\n regulator",
+						reg_res[i].supply);
+			return rc;
+		}
+
+		regs[i].uV = reg_res[i].uV;
+		regs[i].uA = reg_res[i].uA;
+	}
+
+	return i;
+}
+
+static int generic_regulator_enable(struct qcom_adsp *adsp,
+			struct reg_info *regs, int count)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < count; i++) {
+		if (regs[i].uV > 0) {
+			ret = regulator_set_voltage(regs[i].reg,
+					regs[i].uV, INT_MAX);
+			if (ret) {
+				dev_err(adsp->dev,
+					"Failed to request voltage for %d.\n",
+						i);
+				goto err;
+			}
+		}
+
+		ret = regulator_enable(regs[i].reg);
+		if (ret) {
+			dev_err(adsp->dev, "Regulator enable failed\n");
+			goto err;
+		}
+	}
+
+	return 0;
+err:
+	for (; i >= 0; i--) {
+		if (regs[i].uV > 0)
+			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+
+		regulator_disable(regs[i].reg);
+	}
+
+	return ret;
+}
+
+static void generic_regulator_disable(struct qcom_adsp *adsp,
+			struct reg_info *regs, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		if (regs[i].uV > 0)
+			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+
+		regulator_disable(regs[i].reg);
+	}
+}
+
+static int generic_init_clocks(struct device *dev,
+				struct clk **clks, char **clk_names)
+{
+	int i;
+
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
+
+	}
+
+	return i;
+}
+
+static int generic_clk_enable(struct device *dev,
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
+static void generic_clk_disable(struct device *dev,
+			struct clk **clks, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		clk_disable_unprepare(clks[i]);
+}
+
+
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -70,7 +221,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	bool relocate;
 	int ret;
 
-	ret = qcom_scm_pas_init_image(ADSP_PAS_ID, fw->data, fw->size);
+	ret = qcom_scm_pas_init_image(adsp->fw_pas_id, fw->data, fw->size);
 	if (ret) {
 		dev_err(&rproc->dev, "invalid firmware metadata\n");
 		return ret;
@@ -85,7 +236,8 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	if (relocate) {
 		adsp->mem_reloc = fw_addr;
 
-		ret = qcom_scm_pas_mem_setup(ADSP_PAS_ID, adsp->mem_phys, fw_size);
+		ret = qcom_scm_pas_mem_setup(adsp->fw_pas_id,
+					adsp->mem_phys, fw_size);
 		if (ret) {
 			dev_err(&rproc->dev, "unable to setup memory for image\n");
 			return ret;
@@ -105,15 +257,14 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int ret;
 
-	ret = clk_prepare_enable(adsp->xo);
+	ret = generic_clk_enable(adsp->dev, adsp->clocks, adsp->clk_count);
 	if (ret)
 		return ret;
-
-	ret = regulator_enable(adsp->cx_supply);
+	ret = generic_regulator_enable(adsp,
+			adsp->regulators, adsp->reg_count);
 	if (ret)
 		goto disable_clocks;
-
-	ret = qcom_scm_pas_auth_and_reset(ADSP_PAS_ID);
+	ret = qcom_scm_pas_auth_and_reset(adsp->fw_pas_id);
 	if (ret) {
 		dev_err(adsp->dev,
 			"failed to authenticate image and release reset\n");
@@ -124,7 +275,7 @@ static int adsp_start(struct rproc *rproc)
 					  msecs_to_jiffies(5000));
 	if (!ret) {
 		dev_err(adsp->dev, "start timed out\n");
-		qcom_scm_pas_shutdown(ADSP_PAS_ID);
+		qcom_scm_pas_shutdown(adsp->fw_pas_id);
 		ret = -ETIMEDOUT;
 		goto disable_regulators;
 	}
@@ -132,9 +283,9 @@ static int adsp_start(struct rproc *rproc)
 	ret = 0;
 
 disable_regulators:
-	regulator_disable(adsp->cx_supply);
+	generic_regulator_disable(adsp, adsp->regulators, adsp->reg_count);
 disable_clocks:
-	clk_disable_unprepare(adsp->xo);
+	generic_clk_disable(adsp->dev, adsp->clocks, adsp->clk_count);
 
 	return ret;
 }
@@ -157,7 +308,7 @@ static int adsp_stop(struct rproc *rproc)
 				    BIT(adsp->stop_bit),
 				    0);
 
-	ret = qcom_scm_pas_shutdown(ADSP_PAS_ID);
+	ret = qcom_scm_pas_shutdown(adsp->fw_pas_id);
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
@@ -197,7 +348,7 @@ static irqreturn_t adsp_fatal_interrupt(int irq, void *dev)
 	size_t len;
 	char *msg;
 
-	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, ADSP_CRASH_REASON_SMEM, &len);
+	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, adsp->crash_reason_smem, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(adsp->dev, "fatal error received: %s\n", msg);
 
@@ -232,32 +383,6 @@ static irqreturn_t adsp_stop_ack_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int adsp_init_clock(struct qcom_adsp *adsp)
-{
-	int ret;
-
-	adsp->xo = devm_clk_get(adsp->dev, "xo");
-	if (IS_ERR(adsp->xo)) {
-		ret = PTR_ERR(adsp->xo);
-		if (ret != -EPROBE_DEFER)
-			dev_err(adsp->dev, "failed to get xo clock");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int adsp_init_regulator(struct qcom_adsp *adsp)
-{
-	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
-	if (IS_ERR(adsp->cx_supply))
-		return PTR_ERR(adsp->cx_supply);
-
-	regulator_set_load(adsp->cx_supply, 100000);
-
-	return 0;
-}
-
 static int adsp_request_irq(struct qcom_adsp *adsp,
 			     struct platform_device *pdev,
 			     const char *name,
@@ -311,20 +436,25 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 
 static int adsp_probe(struct platform_device *pdev)
 {
+	const struct generic_rproc_res *desc;
 	struct qcom_adsp *adsp;
 	struct rproc *rproc;
 	int ret;
 
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
-	if (!qcom_scm_pas_supported(ADSP_PAS_ID)) {
+	if (!qcom_scm_pas_supported(desc->fw_pas_id)) {
 		dev_err(&pdev->dev, "PAS is not available for ADSP\n");
 		return -ENXIO;
 	}
 
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
-			    ADSP_FIRMWARE_NAME, sizeof(*adsp));
+			    desc->firmware_name, sizeof(*adsp));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
@@ -344,13 +474,24 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_init_clock(adsp);
-	if (ret)
+	adsp->fw_pas_id = desc->fw_pas_id;
+	adsp->crash_reason_smem = desc->crash_reason_smem;
+
+	ret = generic_init_clocks(&pdev->dev,
+			adsp->clocks, desc->clocks_name);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get clocks.\n");
 		goto free_rproc;
+	}
+	adsp->clk_count = ret;
 
-	ret = adsp_init_regulator(adsp);
-	if (ret)
+	ret = generic_regulator_init(&pdev->dev,
+				adsp->regulators, desc->reg_res);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get regulators.\n");
 		goto free_rproc;
+	}
+	adsp->reg_count = ret;
 
 	ret = adsp_request_irq(adsp, pdev, "wdog", adsp_wdog_interrupt);
 	if (ret < 0)
@@ -407,9 +548,25 @@ static int adsp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct generic_rproc_res adsp_resource_init = {
+		.crash_reason_smem = 423,
+		.firmware_name = "adsp.mdt",
+		.fw_pas_id = 1,
+		.reg_res = (struct regulator_res[]) {
+			{
+				.supply = "vdd_cx",
+			},
+			{},
+			{}
+		},
+		.clocks_name = (char*[]){
+			"xo",
+			NULL
+		},
+};
 static const struct of_device_id adsp_of_match[] = {
-	{ .compatible = "qcom,msm8974-adsp-pil" },
-	{ .compatible = "qcom,msm8996-adsp-pil" },
+	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
