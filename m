Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH 4/5] rpmsg: wakeup poll to notify signal update
Date: Wed,  3 Oct 2018 17:04:22 +0530
Message-Id: <1538566463-24627-5-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support to wait on poll to get signal notifications.
Send POLLPRI mask to indicate the signal change.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/rpmsg_char.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index c983d6c..aee5561 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -64,6 +64,7 @@ struct rpmsg_ctrldev {
  * @queue_lock:	synchronization of @queue operations
  * @queue:	incoming message queue
  * @readq:	wait object for incoming queue
+ * @sig_pending:state of signal notification
  */
 struct rpmsg_eptdev {
 	struct device dev;
@@ -78,6 +79,8 @@ struct rpmsg_eptdev {
 	spinlock_t queue_lock;
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
+
+	atomic_t sig_pending;
 };
 
 static int rpmsg_eptdev_destroy(struct device *dev, void *data)
@@ -125,6 +128,12 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 static int rpmsg_sigs_cb(struct rpmsg_device *rpdev, void *priv,
 			 u32 old, u32 new)
 {
+	struct rpmsg_eptdev *eptdev = priv;
+
+	atomic_set(&eptdev->sig_pending, 1);
+
+	/* wake up any blocking processes, waiting for signal notification */
+	wake_up_interruptible(&eptdev->readq);
 	return 0;
 }
 
@@ -164,6 +173,7 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
+	atomic_set(&eptdev->sig_pending, 0);
 
 	/* Discard all SKBs */
 	while (!skb_queue_empty(&eptdev->queue)) {
@@ -270,6 +280,9 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
 	if (!skb_queue_empty(&eptdev->queue))
 		mask |= EPOLLIN | EPOLLRDNORM;
 
+	if (atomic_read(&eptdev->sig_pending))
+		mask |= POLLPRI;
+
 	mask |= rpmsg_poll(eptdev->ept, filp, wait);
 
 	return mask;
@@ -318,6 +331,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 		ret = rpmsg_get_sigs(eptdev->ept, &lsigs, &rsigs);
 		if (!ret)
 			ret = put_user(rsigs, (u32 *)arg);
+		atomic_set(&eptdev->sig_pending, 0);
 		break;
 	case TIOCMSET:
 	case TIOCMBIS:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
