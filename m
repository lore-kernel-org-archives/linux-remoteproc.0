Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/5] dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
Date: Wed, 18 Dec 2019 18:52:14 +0530
Message-Id: <20191218132217.28141-3-sibis@codeaurora.org>
In-Reply-To: <20191218132217.28141-1-sibis@codeaurora.org>
References: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org
Cc: ohad@wizery.com, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh@kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add ADSP and SLPI compatibles for MSM8998 SoC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index a54465d938f64..9938918b2fea3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -10,6 +10,8 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,msm8974-adsp-pil"
 		    "qcom,msm8996-adsp-pil"
 		    "qcom,msm8996-slpi-pil"
+		    "qcom,msm8998-adsp-pas"
+		    "qcom,msm8998-slpi-pas"
 		    "qcom,qcs404-adsp-pas"
 		    "qcom,qcs404-cdsp-pas"
 		    "qcom,qcs404-wcss-pas"
@@ -33,6 +35,8 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,msm8974-adsp-pil:
 	qcom,msm8996-adsp-pil:
 	qcom,msm8996-slpi-pil:
+	qcom,msm8998-adsp-pas:
+	qcom,msm8998-slpi-pas:
 	qcom,qcs404-adsp-pas:
 	qcom,qcs404-cdsp-pas:
 	qcom,sdm845-adsp-pas:
@@ -86,9 +90,12 @@ on the Qualcomm ADSP Hexagon core.
 	Definition: The power-domains needed depend on the compatible string:
 	qcom,msm8974-adsp-pil:
 	qcom,msm8996-adsp-pil:
+	qcom,msm8998-adsp-pas:
 		    must be "cx"
 	qcom,msm8996-slpi-pil:
 		    must be "ss_cx"
+	qcom,msm8998-slpi-pas:
+		    must be "ssc_cx"
 	qcom,qcs404-adsp-pas:
 		    must be "lpi_cx"
 	qcom,qcs404-cdsp-pas:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
