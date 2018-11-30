Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH 1/2] dt-binding: remoteproc: Remove lpass_aon clock from adsp pil clock list
Date: Fri, 30 Nov 2018 12:59:09 +0530
Message-Id: <1543562950-23997-2-git-send-email-rohitkr@codeaurora.org>
In-Reply-To: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
References: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

LPASS_Audio_Wrapper_AON clock is on by default. Remove
it from lpass clock list to avoid voting for it.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
index a842a78..66af2c3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
@@ -35,7 +35,7 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
 	Value type: <stringlist>
 	Definition: List of clock input name strings sorted in the same
 		    order as the clocks property. Definition must have
-		    "xo", "sway_cbcr", "lpass_aon", "lpass_ahbs_aon_cbcr",
+		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
 		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
 		    and "qdsp6ss_core".
 
@@ -100,13 +100,12 @@ ADSP, as it is found on SDM845 boards.
 
 		clocks = <&rpmhcc RPMH_CXO_CLK>,
 			<&gcc GCC_LPASS_SWAY_CLK>,
-			<&lpasscc LPASS_AUDIO_WRAPPER_AON_CLK>,
 			<&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
 			<&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
 			<&lpasscc LPASS_QDSP6SS_XO_CLK>,
 			<&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
 			<&lpasscc LPASS_QDSP6SS_CORE_CLK>;
-		clock-names = "xo", "sway_cbcr", "lpass_aon",
+		clock-names = "xo", "sway_cbcr",
 			"lpass_ahbs_aon_cbcr",
 			"lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
 			"qdsp6ss_sleep", "qdsp6ss_core";
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
