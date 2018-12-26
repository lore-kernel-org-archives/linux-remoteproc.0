Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 7/8] dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5
Date: Wed, 26 Dec 2018 18:22:28 +0530
Message-Id: <20181226125229.20149-7-sibis@codeaurora.org>
In-Reply-To: <20181226125229.20149-1-sibis@codeaurora.org>
References: <20181226125229.20149-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add power-domain bindings for Q6V5 MSS on MSM8996 and SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v3:
  * Fixup dt-binding documentation as suggested by Doug
  * Dropping Rob's Reviewed-by due to documentation style
    change

v2:
  * Add load_state power-domain
  * List cx and mx power-domains for MSM8996

 .../bindings/remoteproc/qcom,q6v5.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 65713de70be5..17ecaae5e5e0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -106,6 +106,25 @@ For the compatible string below the following supplies are required:
 	Definition: reference to the regulators to be held on behalf of the
 		    booting of the Hexagon core
 
+- power-domains:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to power-domains that match power-domain-names
+
+- power-domain-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: The power-domains needed depend on the compatible string:
+	qcom,q6v5-pil:
+	qcom,ipq8074-wcss-pil:
+	qcom,msm8916-mss-pil:
+	qcom,msm8974-mss-pil:
+		    no power-domain names required
+	qcom,msm8996-mss-pil:
+		    must be "cx", "mx"
+	qcom,sdm845-mss-pil:
+		    must be "cx", "mx", "mss", "load_state"
+
 - qcom,smem-states:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
