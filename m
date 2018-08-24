Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 4/6] dt-bindings: remoteproc: Add PDC reset binding for Q6V5 PIL
Date: Fri, 24 Aug 2018 18:48:58 +0530
Message-Id: <20180824131900.5353-5-sibis@codeaurora.org>
In-Reply-To: <20180824131900.5353-1-sibis@codeaurora.org>
References: <20180824131900.5353-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add additional pdc_reset binding required for Q6V5 Modem PIL on
SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index c45e4c131fa2..4c5473aeb697 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -53,6 +53,8 @@ on the Qualcomm Hexagon core.
 	Definition: reference to the reset-controller for the modem sub-system
 		    reference to the list of 3 reset-controllers for the
 		    wcss sub-system
+		    reference to the list of 2 reset-controllers for the modem
+		    sub-system on SDM845 SoCs
 
 - reset-names:
 	Usage: required
@@ -60,6 +62,8 @@ on the Qualcomm Hexagon core.
 	Definition: must be "mss_restart" for the modem sub-system
 		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
 		    for the wcss syb-system
+		    must be "mss_restart", "pdc_reset" for the modem
+		    sub-system on SDM845 SoCs
 
 - cx-supply:
 - mss-supply:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
