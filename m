Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add firmware bindings for Q6V5 MSS
Date: Wed, 12 Dec 2018 18:14:55 +0530
Message-Id: <20181212124456.3164-2-sibis@codeaurora.org>
In-Reply-To: <20181212124456.3164-1-sibis@codeaurora.org>
References: <20181212124456.3164-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org
Cc: briannorris@chromium.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add optional firmware bindings for Q6V5 MSS. It lists the two relative
firmware paths which are used for booting and authenticating the Hexagon
core.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 9ff5b0309417..1f6988a60636 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -36,6 +36,13 @@ on the Qualcomm Hexagon core.
 	Value type: <stringlist>
 	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
 
+- qcom,firmware:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: must list the 2 relative firmware paths (mba and modem
+		    metadata respectively) which are used for booting and
+		    authenticating the Hexagon core.
+
 - clocks:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
