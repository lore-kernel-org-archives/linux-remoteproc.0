Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5
Date: Wed, 21 Nov 2018 02:38:28 +0530
Message-Id: <20181120210828.12590-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add power-domain bindings for Q6V5 MSS on SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

Add dt-binding corresponding to https://patchwork.kernel.org/patch/10586893/
(remoteproc: q6v5: Add support to vote for rpmh power domains)

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 14947562bc67..bd9f4882fcf0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -75,6 +75,17 @@ on the Qualcomm Hexagon core.
 	Definition: reference to the regulators to be held on behalf of the
 		    booting of the Hexagon core
 
+- power-domains:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the cx, mx and mss power-domains to be held on
+		    behalf of the booting the Hexagon core
+
+- power-domain-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "cx", "mx", "mss"
+
 - qcom,smem-states:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
