Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/4] remoteproc: qcom: q6v5-mss: Rename boot status timeout
Date: Fri, 17 Jan 2020 19:21:29 +0530
Message-Id: <20200117135130.3605-4-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, evgreen@chromium.org, p.zabel@pengutronix.de
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Rename the FSM timeout on SC7180 to BOOT_STATUS_TIMEOUT_US.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index e1784446d3da3..6a98e9029c70b 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -114,7 +114,7 @@
 #define QDSP6SS_BOOT_CORE_START         0x400
 #define QDSP6SS_BOOT_CMD                0x404
 #define QDSP6SS_BOOT_STATUS		0x408
-#define SLEEP_CHECK_MAX_LOOPS           200
+#define BOOT_STATUS_TIMEOUT_US		200
 #define BOOT_FSM_TIMEOUT                10000
 
 struct reg_info {
@@ -572,7 +572,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		/* Poll the QDSP6SS_BOOT_STATUS for FSM completion */
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BOOT_STATUS,
 					 val, (val & BIT(0)) != 0, 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 BOOT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "Boot FSM failed to complete.\n");
 			/* Reset the modem so that boot FSM is in reset state */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
