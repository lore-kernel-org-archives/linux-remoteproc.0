Return-Path: <dan.carpenter@oracle.com>
Date: Sat, 21 Jan 2017 07:53:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] rpmsg: unlock on error in rpmsg_eptdev_read()
Message-ID: <20170121045339.GD15269@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

We should unlock before returning if skb_dequeue() returns a NULL.

Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index a78b6b7..0ca2ccc 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -209,11 +209,10 @@ static ssize_t rpmsg_eptdev_read(struct file *filp, char __user *buf,
 	}
 
 	skb = skb_dequeue(&eptdev->queue);
+	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 	if (!skb)
 		return -EFAULT;
 
-	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
-
 	use = min_t(size_t, len, skb->len);
 	if (copy_to_user(buf, skb->data, use))
 		use = -EFAULT;
