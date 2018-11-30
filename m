Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: q6v5_adsp: Remove voting for lpass_aon clock
Date: Fri, 30 Nov 2018 12:59:10 +0530
Message-Id: <1543562950-23997-3-git-send-email-rohitkr@codeaurora.org>
In-Reply-To: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
References: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Lpass_aon clock is on by default. Remove it from lpass
clock list to avoid voting for it.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 79374d1..4829173 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -48,7 +48,7 @@
 
 /* list of clocks required by ADSP PIL */
 static const char * const adsp_clk_id[] = {
-	"sway_cbcr", "lpass_aon", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
+	"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
 	"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core",
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
