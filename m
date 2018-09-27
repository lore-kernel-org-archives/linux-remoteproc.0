Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] remoteproc: qcom: pas: Add QCS404 remoteprocs
Date: Thu, 27 Sep 2018 12:03:46 -0700
Message-Id: <20180927190346.2984-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add compatibles for the three PAS based remote processors found in
QCS404.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Fixed incorrect sysmon_name, as pointed out by Sibi.

 .../devicetree/bindings/remoteproc/qcom,adsp.txt     |  3 +++
 drivers/remoteproc/qcom_adsp_pil.c                   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index b7d058228185..9c0cff3a5ed8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -10,6 +10,9 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,msm8974-adsp-pil"
 		    "qcom,msm8996-adsp-pil"
 		    "qcom,msm8996-slpi-pil"
+		    "qcom,qcs404-adsp-pas"
+		    "qcom,qcs404-cdsp-pas"
+		    "qcom,qcs404-wcss-pas"
 		    "qcom,sdm845-adsp-pas"
 		    "qcom,sdm845-cdsp-pas"
 
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index da2254ea1135..d5e58235e83a 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -362,10 +362,22 @@ static const struct adsp_data slpi_resource_init = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data wcss_resource_init = {
+	.crash_reason_smem = 421,
+	.firmware_name = "wcnss.mdt",
+	.pas_id = 6,
+	.ssr_name = "mpss",
+	.sysmon_name = "wcnss",
+	.ssctl_id = 0x12,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &slpi_resource_init},
+	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
+	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
 	{ },
-- 
2.18.0
