Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 1/5] mailbox: Make startup and shutdown ops optional
Date: Thu,  4 May 2017 13:05:35 -0700
Message-Id: <20170504200539.27027-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Some mailbox hardware doesn't have to perform any additional operations
on startup of shutdown, so make these optional.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- New patch

 drivers/mailbox/mailbox.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 4671f8a12872..c88de953394a 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -137,6 +137,20 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	return HRTIMER_NORESTART;
 }
 
+static int mbox_startup(struct mbox_chan *chan)
+{
+	if (chan->mbox->ops->startup)
+		return chan->mbox->ops->startup(chan);
+
+	return 0;
+}
+
+static void mbox_shutdown(struct mbox_chan *chan)
+{
+	if (chan->mbox->ops->shutdown)
+		chan->mbox->ops->shutdown(chan);
+}
+
 /**
  * mbox_chan_received_data - A way for controller driver to push data
  *				received from remote to the upper layer.
@@ -352,7 +366,7 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	ret = chan->mbox->ops->startup(chan);
+	ret = mbox_startup(chan);
 	if (ret) {
 		dev_err(dev, "Unable to startup the chan (%d)\n", ret);
 		mbox_free_channel(chan);
@@ -405,7 +419,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (!chan || !chan->cl)
 		return;
 
-	chan->mbox->ops->shutdown(chan);
+	mbox_shutdown(chan);
 
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
-- 
2.12.0
