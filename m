Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 2/4] remoteproc: qcom: Add additional agree2_clk and px regulator resource.
Date: Mon, 30 Jan 2017 20:33:07 +0530
Message-Id: <1485788589-21968-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add additional clock and regulator resource which are
initialized based on compatible and has no impact on existing driver
working. This resourse addition enable the existing driver to handle.
low pass sensor processor device also.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_adsp_pil.c | 43 +++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index f674301..58cc46d 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -36,6 +36,7 @@ struct adsp_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	int pas_id;
+	bool has_aggre2_clk;
 };
 
 
@@ -53,11 +54,13 @@ struct qcom_adsp {
 	unsigned stop_bit;
 
 	struct clk *xo;
-
+	struct clk *aggre2_clk;
 	struct regulator *cx_supply;
+	struct regulator *px_supply;
 
 	int pas_id;
 	int crash_reason_smem;
+	bool has_aggre2_clk;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -115,16 +118,22 @@ static int adsp_start(struct rproc *rproc)
 	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
 		return ret;
+	ret = clk_prepare_enable(adsp->aggre2_clk);
+	if (ret)
+		goto disable_xo_clk;
 
 	ret = regulator_enable(adsp->cx_supply);
 	if (ret)
-		goto disable_clocks;
+		goto disable_aggre2_clk;
+	ret = regulator_enable(adsp->px_supply);
+	if (ret)
+		goto disable_cx_supply;
 
 	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
 	if (ret) {
 		dev_err(adsp->dev,
 			"failed to authenticate image and release reset\n");
-		goto disable_regulators;
+		goto disable_px_supply;
 	}
 
 	ret = wait_for_completion_timeout(&adsp->start_done,
@@ -133,14 +142,18 @@ static int adsp_start(struct rproc *rproc)
 		dev_err(adsp->dev, "start timed out\n");
 		qcom_scm_pas_shutdown(adsp->pas_id);
 		ret = -ETIMEDOUT;
-		goto disable_regulators;
+		goto disable_px_supply;
 	}
 
 	ret = 0;
 
-disable_regulators:
+disable_px_supply:
+	regulator_disable(adsp->px_supply);
+disable_cx_supply:
 	regulator_disable(adsp->cx_supply);
-disable_clocks:
+disable_aggre2_clk:
+	clk_disable_unprepare(adsp->aggre2_clk);
+disable_xo_clk:
 	clk_disable_unprepare(adsp->xo);
 
 	return ret;
@@ -251,17 +264,31 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
 		return ret;
 	}
 
+	if (adsp->has_aggre2_clk) {
+		adsp->aggre2_clk = devm_clk_get(adsp->dev, "aggre2");
+		if (IS_ERR(adsp->aggre2_clk)) {
+			ret = PTR_ERR(adsp->aggre2_clk);
+			if (ret != -EPROBE_DEFER)
+				dev_err(adsp->dev,
+					"failed to get aggre2 clock");
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
 static int adsp_init_regulator(struct qcom_adsp *adsp)
 {
-	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
+	adsp->cx_supply = devm_regulator_get(adsp->dev, "vdd_cx");
 	if (IS_ERR(adsp->cx_supply))
 		return PTR_ERR(adsp->cx_supply);
 
 	regulator_set_load(adsp->cx_supply, 100000);
 
+	adsp->px_supply = devm_regulator_get(adsp->dev, "vdd_px");
+	if (IS_ERR(adsp->px_supply))
+		return PTR_ERR(adsp->px_supply);
 	return 0;
 }
 
@@ -358,6 +385,7 @@ static int adsp_probe(struct platform_device *pdev)
 
 	adsp->pas_id = desc->pas_id;
 	adsp->crash_reason_smem = desc->crash_reason_smem;
+	adsp->has_aggre2_clk = desc->has_aggre2_clk;
 	ret = adsp_init_clock(adsp);
 	if (ret)
 		goto free_rproc;
@@ -425,6 +453,7 @@ static int adsp_remove(struct platform_device *pdev)
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
+		.has_aggre2_clk = 0,
 };
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
