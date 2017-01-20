Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC PATCH v2 2/3] remoteproc: qcom: Add slpi boot support in adsp rproc driver.
Date: Fri, 20 Jan 2017 21:40:35 +0530
Message-Id: <1484928636-27351-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
References: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add support to boot slpi processor in existing adsp rproc
driver. Resource differentitation is done based on compatible string.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 29 ++++++++++++++++++++++
 drivers/remoteproc/qcom_adsp_pil.c                 | 23 +++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index b85885a..274bc8d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -9,6 +9,7 @@ on the Qualcomm ADSP Hexagon core.
 	Definition: must be one of:
 		    "qcom,msm8974-adsp-pil"
 		    "qcom,msm8996-adsp-pil"
+			"qcom,msm8996-slpi-pil"
 
 - interrupts-extended:
 	Usage: required
@@ -96,3 +97,31 @@ ADSP, as it is found on MSM8974 boards.
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
+
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index ab2632b..47b2a29 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -564,9 +564,32 @@ static int adsp_remove(struct platform_device *pdev)
 			NULL
 		},
 };
+
+static const struct generic_rproc_res slpi_resource_init = {
+		.crash_reason_smem = 424,
+		.firmware_name = "slpi.mdt",
+		.fw_pas_id = 12,
+		.reg_res = (struct regulator_res[]) {
+			{
+				.supply = "vdd_cx",
+				.uV = 5,
+			},
+			{
+				.supply = "vdd_px",
+			},
+			{}
+		},
+		.clocks_name = (char*[]){
+			"xo",
+			"aggre2",
+			NULL
+		},
+};
+
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
