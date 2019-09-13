Return-Path: <gokulsri@qualcomm.com>
From: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH V2 08/12] dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
Date: Fri, 13 Sep 2019 17:26:07 +0530
Message-Id: <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
To: gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add mailbox support required in IPQ8074 SoCs.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 1232fc9..389c6ce 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -13,6 +13,7 @@ platforms.
 		    "qcom,msm8998-apcs-hmss-global"
 		    "qcom,qcs404-apcs-apps-global"
 		    "qcom,sdm845-apss-shared"
+		    "qcom,ipq8074-apcs-apps-global"
 
 - reg:
 	Usage: required
-- 
1.9.1
