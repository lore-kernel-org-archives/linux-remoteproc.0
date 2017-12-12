Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 5/5] rpmsg: smd: Don't hold the tx lock during wait
Date: Tue, 12 Dec 2017 15:58:57 -0800
Message-Id: <20171212235857.10432-6-bjorn.andersson@linaro.org>
In-Reply-To: <20171212235857.10432-1-bjorn.andersson@linaro.org>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>, Jeremy McNicoll <jmcnicol@redhat.com>, Will Newton <will.newton@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Holding the tx lock while waiting for tx-drain events from the remote
side blocks try_send requests from failing quickly, so temporarily drop
the tx lock while waiting.

While this allows try_send to fail quickly it also could allow a
subsequent send to succeed putting a smaller packet in the FIFO while
we're waiting for room for our large packet. But as this lock is per
channel we expect that clients with ordering concerns implements their
own ordering mechanism.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index ed167ab52a68..10870189c0c8 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -752,12 +752,19 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 
 		SET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR, 0);
 
+		/* Wait without holding the tx_lock */
+		mutex_unlock(&channel->tx_lock);
+
 		ret = wait_event_interruptible(channel->fblockread_event,
 				       qcom_smd_get_tx_avail(channel) >= tlen ||
 				       channel->state != SMD_CHANNEL_OPENED);
 		if (ret)
 			goto out;
 
+		ret = mutex_lock_interruptible(&channel->tx_lock);
+		if (ret)
+			goto out;
+
 		SET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR, 1);
 	}
 
-- 
2.15.0
