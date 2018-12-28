Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware bindings for Q6V5
Date: Fri, 28 Dec 2018 10:18:18 +0530
Message-Id: <20181228044819.5697-2-sibis@codeaurora.org>
In-Reply-To: <20181228044819.5697-1-sibis@codeaurora.org>
References: <20181228044819.5697-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org
Cc: briannorris@chromium.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add optional "firmware-name" bindings for Q6V5 MSS and PAS based
remoteprocs. For Q6V5 MSS/PAS the two/one relative firmware
paths/path are to be listed respectively. Fallback to the default
images for mba/modem for Q6V5 MSS or the default Hexagon image
for Q6V5 PAS if the "firmware-name" binding is not present.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 9c0cff3a5ed8..60ee0f73071a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -27,6 +27,12 @@ on the Qualcomm ADSP Hexagon core.
 	Value type: <stringlist>
 	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    Hexagon Core.
+
 - clocks:
 	Usage: required
 	Value type: <prop-encoded-array>
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 9ff5b0309417..3a99e7379d8c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -36,6 +36,13 @@ on the Qualcomm Hexagon core.
 	Value type: <stringlist>
 	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: must list the relative firmware image paths for mba and
+		    modem. They are used for booting and authenticating the
+		    Hexagon core.
+
 - clocks:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
