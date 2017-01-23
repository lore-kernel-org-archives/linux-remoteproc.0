Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] rpmsg: char: Fix missing unlock on error in rpmsg_eptdev_read()
Date: Mon, 23 Jan 2017 14:09:51 +0000
Message-Id: <20170123140951.2204-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Add the missing unlock before return from function rpmsg_eptdev_read()
in the error handling case.

Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/rpmsg/rpmsg_char.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index a78b6b7..93252dc 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -209,11 +209,12 @@ static ssize_t rpmsg_eptdev_read(struct file *filp, char __user *buf,
 	}
 
 	skb = skb_dequeue(&eptdev->queue);
-	if (!skb)
-		return -EFAULT;
 
 	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 
+	if (!skb)
+		return -EFAULT;
+
 	use = min_t(size_t, len, skb->len);
 	if (copy_to_user(buf, skb->data, use))
 		use = -EFAULT;
