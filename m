Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Introduce shutdown-ack irq for Q6V5
Date: Mon, 24 Dec 2018 14:18:21 +0530
Message-Id: <20181224084824.25193-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce shutdown-irq binding required for sysmon shutdown for Q6V5 MSS
on SDM845/MSM8996 SoCs and for WCSS Q6V5 on QCS404 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v2:
  Make shutdown-ack mandatory for MSS on SDM845/MSM8996 and
  for WCSS on QCS404 (Dropping Rob's reviewed-by due to this)

 .../bindings/remoteproc/qcom,adsp.txt           | 17 ++++++++++++++---
 .../bindings/remoteproc/qcom,q6v5.txt           | 15 ++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 9c0cff3a5ed8..50df9936763b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -19,13 +19,24 @@ on the Qualcomm ADSP Hexagon core.
 - interrupts-extended:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: must list the watchdog, fatal IRQs ready, handover and
-		    stop-ack IRQs
+	Definition: reference to the interrupts that match interrupt-names
 
 - interrupt-names:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
+	Definition: The interrupts needed depends on the compatible
+		    string:
+	qcom,msm8974-adsp-pil:
+	qcom,msm8996-adsp-pil:
+	qcom,msm8996-slpi-pil:
+	qcom,qcs404-adsp-pas:
+	qcom,qcs404-cdsp-pas:
+	qcom,sdm845-adsp-pas:
+	qcom,sdm845-cdsp-pas:
+		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
+	qcom,qcs404-wcss-pas:
+		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
+		    "shutdown-ack"
 
 - clocks:
 	Usage: required
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 5d0b2975387e..cacbdd368fe1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -28,13 +28,22 @@ on the Qualcomm Hexagon core.
 - interrupts-extended:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: must list the watchdog, fatal IRQs ready, handover and
-		    stop-ack IRQs
+	Definition: reference to the interrupts that match interrupt-names
 
 - interrupt-names:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
+	Definition: The interrupts needed depends on the the compatible
+		    string:
+	qcom,q6v5-pil:
+	qcom,ipq8074-wcss-pil:
+	qcom,msm8916-mss-pil:
+	qcom,msm8974-mss-pil:
+		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
+	qcom,msm8996-mss-pil:
+	qcom,sdm845-mss-pil:
+		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
+		    "shutdown-ack"
 
 - clocks:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
