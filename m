Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 5/8] dt-bindings: remoteproc: qcom: Fixup regulator dependencies
Date: Sat, 29 Dec 2018 00:23:04 +0530
Message-Id: <20181228185307.25645-5-sibis@codeaurora.org>
In-Reply-To: <20181228185307.25645-1-sibis@codeaurora.org>
References: <20181228185307.25645-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Fixup regulator supply dependencies for Q6V5 MSS on MSM996 SoCs.

Fixes: 9f058fa2efb1 ("remoteproc: qcom: Add support for mss remoteproc
on msm8996")

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v3:
  * Fixup dt-binding documentation as suggested by Doug

 .../bindings/remoteproc/qcom,q6v5.txt         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index bba3d6be71c0..9db371da4897 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -76,6 +76,19 @@ on the Qualcomm Hexagon core.
 		    must be "mss_restart", "pdc_reset" for the modem
 		    sub-system on SDM845 SoCs
 
+For the compatible strings below the following supplies are required:
+  "qcom,q6v5-pil"
+  "qcom,msm8916-mss-pil",
+- cx-supply:
+- mx-supply:
+- pll-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the regulators to be held on behalf of the
+		    booting of the Hexagon core
+
+For the compatible string below the following supplies are required:
+  "qcom,msm8974-mss-pil"
 - cx-supply:
 - mss-supply:
 - mx-supply:
@@ -85,6 +98,14 @@ on the Qualcomm Hexagon core.
 	Definition: reference to the regulators to be held on behalf of the
 		    booting of the Hexagon core
 
+For the compatible string below the following supplies are required:
+  "qcom,msm8996-mss-pil"
+- pll-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the regulators to be held on behalf of the
+		    booting of the Hexagon core
+
 - qcom,smem-states:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
