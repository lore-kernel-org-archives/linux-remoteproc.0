Return-Path: <linux-arm-msm-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 08/16] dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
Date: Mon, 18 Nov 2019 21:43:45 +0000
Message-ID: <0101016e8078b957-e3cf34ad-0bd0-41b0-9d92-ec1d86df352c-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add ADSP and SLPI compatibles for MSM8998 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index fea25b8b050ed..34dc1d94a78c7 100644
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
@@ -29,6 +31,8 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,msm8974-adsp-pil:
 	qcom,msm8996-adsp-pil:
 	qcom,msm8996-slpi-pil:
+	qcom,msm8998-adsp-pas:
+	qcom,msm8998-slpi-pas:
 	qcom,qcs404-adsp-pas:
 	qcom,qcs404-cdsp-pas:
 	qcom,sdm845-adsp-pas:
@@ -78,9 +82,12 @@ on the Qualcomm ADSP Hexagon core.
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
