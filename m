Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH v2 1/6] dt-bindings: soc: qcom: Add label for GLINK bindings
Date: Wed, 25 Apr 2018 19:07:47 -0700
Message-Id: <1524708472-18263-2-git-send-email-clew@codeaurora.org>
In-Reply-To: <1524708472-18263-1-git-send-email-clew@codeaurora.org>
References: <1524708472-18263-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

There are GLINK clients who open the same channel on multiple GLINK
links. These clients need a way to distinguish which remoteproc they
are communicating to. Add a label property to identify the edge this
node represents.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---

Changes since v1:
- Add explanation for label in commit message

 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index 9663cab52246..0b8cc533ca83 100644
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
