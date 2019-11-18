Return-Path: <0101016e80788e53-8ebebb09-640d-41b2-ad48-69e4c01ff53a-000000@us-west-2.amazonses.com>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 06/16] dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5 PAS
Date: Mon, 18 Nov 2019 21:43:34 +0000
Message-ID: <0101016e80788e53-8ebebb09-640d-41b2-ad48-69e4c01ff53a-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add power-domain bindings for Q6V5 PAS on MSM8974/MSM8996/QCS404/SDM845
SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/remoteproc/qcom,adsp.txt         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 292dfda9770d7..fea25b8b050ed 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -67,6 +67,29 @@ on the Qualcomm ADSP Hexagon core.
 	Definition: reference to the px regulator to be held on behalf of the
 		    booting Hexagon core
 
+- power-domains:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to power-domains that match the power-domain-names
+
+- power-domain-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: The power-domains needed depend on the compatible string:
+	qcom,msm8974-adsp-pil:
+	qcom,msm8996-adsp-pil:
+		    must be "cx"
+	qcom,msm8996-slpi-pil:
+		    must be "ss_cx"
+	qcom,qcs404-adsp-pas:
+		    must be "lpi_cx"
+	qcom,qcs404-cdsp-pas:
+	qcom,qcs404-wcss-pas:
+		    must be "mx"
+	qcom,sdm845-adsp-pas:
+	qcom,sdm845-cdsp-pas:
+		    must be "cx", "load_state"
+
 - memory-region:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
