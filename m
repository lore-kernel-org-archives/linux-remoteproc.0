Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V4 1/9] dt-bindings: soc: qcom: Add label for GLINK bindings
Date: Fri, 27 Jul 2018 17:47:21 +0530
Message-Id: <1532693849-7037-2-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
References: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, robh+dt@kernel.org, arnaud.pouliquen@st.com, andy.gross@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Chris Lew <clew@codeaurora.org>

There are GLINK clients who open the same channel on multiple GLINK
links. These clients need a way to distinguish which remoteproc they
are communicating to. Add a label property to identify the edge this
node represents.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index 9663cab..0b8cc53 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -10,6 +10,11 @@ edge.
 	Value type: <stringlist>
 	Definition: must be "qcom,glink-rpm"
 
+- label:
+	Usage: optional
+	Value type: <string>
+	Definition: should specify the subsystem name this edge corresponds to.
+
 - interrupts:
 	Usage: required
 	Value type: <prop-encoded-array>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
