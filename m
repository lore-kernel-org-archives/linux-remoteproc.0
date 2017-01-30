Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 3/4] remoteproc: qcom: Add SLPI rproc support to load and boot slpi proc.
Date: Mon, 30 Jan 2017 20:33:08 +0530
Message-Id: <1485788589-21968-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add slpi remoteproc support in existing adsp rproc driver.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 28 ++++++++++++++++++++++
 drivers/remoteproc/qcom_adsp_pil.c                 | 10 +++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index b85885a..1fb63b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -9,6 +9,7 @@ on the Qualcomm ADSP Hexagon core.
 	Definition: must be one of:
 		    "qcom,msm8974-adsp-pil"
 		    "qcom,msm8996-adsp-pil"
+			"qcom,msm8996-slpi-pil"
 
 - interrupts-extended:
 	Usage: required
@@ -96,3 +97,30 @@ ADSP, as it is found on MSM8974 boards.
 			qcom,smd-edge = <1>;
 		};
 	};
+
+The following example describes the resources needed to boot control the
+SLPI, as it is found on MSM8996 boards.
+
+	slpi {
+		compatible = "qcom,msm8996-slpi-pil";
+		interrupts-extended = <&intc 0 390 IRQ_TYPE_EDGE_RISING>,
+				<&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				"fatal",
+				"ready",
+				"handover",
+				"stop-ack";
+
+		clocks = <&rpmcc MSM8996_RPM_SMD_XO_CLK_SRC>,
+			<&rpmcc MSM8996_RPM_SMD_AGGR2_NOC_CLK>;
+		clock-names = "xo",
+			"aggre2";
+		vdd_cx-supply = <&pm8994_l26_corner>;
+		vdd_px-supply = <&pm8994_lvs2>;
+		memory-region = <&slpi_region>;
+		qcom,smem-states = <&slpi_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+        };
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 58cc46d..e6bb1f0 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -1,5 +1,5 @@
 /*
- * Qualcomm ADSP Peripheral Image Loader for MSM8974 and MSM8996
+ * Qualcomm ADSP/SLPI Peripheral Image Loader for MSM8974 and MSM8996
  *
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
@@ -455,9 +455,17 @@ static int adsp_remove(struct platform_device *pdev)
 		.pas_id = 1,
 		.has_aggre2_clk = 0,
 };
+
+static const struct adsp_data slpi_resource_init = {
+		.crash_reason_smem = 424,
+		.firmware_name = "slpi.mdt",
+		.pas_id = 12,
+		.has_aggre2_clk = 1,
+};
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8996-slpi-pil", .data = &slpi_resource_init},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
