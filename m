Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 3/5] dt-bindings: remoteproc: Add Q6v5 Modem PIL binding for SDM845
Date: Wed, 25 Apr 2018 20:38:41 +0530
Message-Id: <20180425150843.26657-4-sibis@codeaurora.org>
In-Reply-To: <20180425150843.26657-1-sibis@codeaurora.org>
References: <20180425150843.26657-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add new compatible string for Qualcomm SDM845 SoCs

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 00d3d58a102f..d90182425450 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
+		    "qcom,sdm845-mss-pil"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
