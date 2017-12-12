Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/5] rpmsg: smd: Wake up all waiters
Date: Tue, 12 Dec 2017 15:58:55 -0800
Message-Id: <20171212235857.10432-4-bjorn.andersson@linaro.org>
In-Reply-To: <20171212235857.10432-1-bjorn.andersson@linaro.org>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>, Jeremy McNicoll <jmcnicol@redhat.com>, Will Newton <will.newton@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

It's possible to have multiple contexts waiting for new channel events
and with an upcoming change it's possible to have multiple contexts
waiting for a full FIFO. As such we need to wake them all up.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 1beddea6f087..0993e95bf0f5 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -579,7 +579,7 @@ static bool qcom_smd_channel_intr(struct qcom_smd_channel *channel)
 
 	/* Signal waiting qcom_smd_send() about the interrupt */
 	if (!GET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR))
-		wake_up_interruptible(&channel->fblockread_event);
+		wake_up_interruptible_all(&channel->fblockread_event);
 
 	/* Don't consume any data until we've opened the channel */
 	if (channel->state != SMD_CHANNEL_OPENED)
@@ -1191,7 +1191,7 @@ static void qcom_channel_scan_worker(struct work_struct *work)
 			dev_dbg(&edge->dev, "new channel found: '%s'\n", channel->name);
 			set_bit(i, edge->allocated[tbl]);
 
-			wake_up_interruptible(&edge->new_channel_event);
+			wake_up_interruptible_all(&edge->new_channel_event);
 		}
 	}
 
-- 
2.15.0
