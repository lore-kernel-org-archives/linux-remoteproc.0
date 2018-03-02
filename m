Return-Path: <sibis@codeaurora.org>
From: sibis <sibis@codeaurora.org>
Subject: [PATCH 4/6] dt-bindings: remoteproc: Add Q6v5 Modem PIL binding for SDM845
Date: Fri,  2 Mar 2018 14:53:37 +0530
Message-Id: <1519982619-28336-5-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1519982619-28336-1-git-send-email-sibis@codeaurora.org>
References: <1519982619-28336-1-git-send-email-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, p.zabel@pengutronix.de, ohad@wizery.com, mark.rutland@arm.com, robh+dt@kernel.org, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add new compatible string for Qualcomm SDM845 SoCs

Signed-off-by: sibis <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 00d3d58..11907db 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -9,8 +9,9 @@ on the Qualcomm Hexagon core.
 	Definition: must be one of:
 		    "qcom,q6v5-pil",
 		    "qcom,msm8916-mss-pil",
-		    "qcom,msm8974-mss-pil"
-		    "qcom,msm8996-mss-pil"
+		    "qcom,msm8974-mss-pil",
+		    "qcom,msm8996-mss-pil",
+		    "qcom,sdm845-mss-pil"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
