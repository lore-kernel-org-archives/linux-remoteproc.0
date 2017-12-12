Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/5] rpmsg: smd: Fail send on a closed channel
Date: Tue, 12 Dec 2017 15:58:56 -0800
Message-Id: <20171212235857.10432-5-bjorn.andersson@linaro.org>
In-Reply-To: <20171212235857.10432-1-bjorn.andersson@linaro.org>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>, Jeremy McNicoll <jmcnicol@redhat.com>, Will Newton <will.newton@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Move the check for a closed channel out from the tx-full loop to fail
any send request on a non-open channel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 0993e95bf0f5..ed167ab52a68 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -743,17 +743,13 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 	if (ret)
 		return ret;
 
-	while (qcom_smd_get_tx_avail(channel) < tlen) {
+	while (qcom_smd_get_tx_avail(channel) < tlen &&
+	       channel->state == SMD_CHANNEL_OPENED) {
 		if (!wait) {
 			ret = -EAGAIN;
 			goto out;
 		}
 
-		if (channel->state != SMD_CHANNEL_OPENED) {
-			ret = -EPIPE;
-			goto out;
-		}
-
 		SET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR, 0);
 
 		ret = wait_event_interruptible(channel->fblockread_event,
@@ -765,6 +761,12 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 		SET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR, 1);
 	}
 
+	/* Fail if the channel was closed */
+	if (channel->state != SMD_CHANNEL_OPENED) {
+		ret = -EPIPE;
+		goto out;
+	}
+
 	SET_TX_CHANNEL_FLAG(channel, fTAIL, 0);
 
 	qcom_smd_write_fifo(channel, hdr, sizeof(hdr));
-- 
2.15.0
