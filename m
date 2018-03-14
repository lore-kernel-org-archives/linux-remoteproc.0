Return-Path: <sibis@codeaurora.org>
From: Sibi S <sibis@codeaurora.org>
Subject: [PATCH v3 3/7] dt-bindings: mailbox: Add APCS global binding for SDM845 SoCs
Date: Wed, 14 Mar 2018 14:51:19 +0530
Message-Id: <1521019283-32212-4-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1521019283-32212-1-git-send-email-sibis@codeaurora.org>
References: <1521019283-32212-1-git-send-email-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Include SDM845 APCS binding to the list of possible bindings

Signed-off-by: Sibi S <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 16964f0..6a7e5d8 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -10,6 +10,7 @@ platforms.
 	Definition: must be one of:
 		    "qcom,msm8916-apcs-kpss-global",
 		    "qcom,msm8996-apcs-hmss-global"
+		    "qcom,sdm845-apcs-hmss-global"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
