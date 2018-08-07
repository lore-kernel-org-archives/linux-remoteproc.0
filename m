Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: char: Migrate to iter versions of read and write
Date: Tue,  7 Aug 2018 00:14:24 -0700
Message-Id: <20180807071424.3236-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In order to be able to use the aio interface for writing to a rpmsg_char
the write_iter function must be implemented, so migrate to iter version
for read and write functions.

Regular read and write uses the iter methods if present and is as such
unaffected.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/rpmsg_char.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index a76b963a7e50..eea5ebbb5119 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -167,9 +167,9 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static ssize_t rpmsg_eptdev_read(struct file *filp, char __user *buf,
-				 size_t len, loff_t *f_pos)
+static ssize_t rpmsg_eptdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
+	struct file *filp = iocb->ki_filp;
 	struct rpmsg_eptdev *eptdev = filp->private_data;
 	unsigned long flags;
 	struct sk_buff *skb;
@@ -205,8 +205,8 @@ static ssize_t rpmsg_eptdev_read(struct file *filp, char __user *buf,
 	if (!skb)
 		return -EFAULT;
 
-	use = min_t(size_t, len, skb->len);
-	if (copy_to_user(buf, skb->data, use))
+	use = min_t(size_t, iov_iter_count(to), skb->len);
+	if (copy_to_iter(skb->data, use, to) != use)
 		use = -EFAULT;
 
 	kfree_skb(skb);
@@ -214,16 +214,21 @@ static ssize_t rpmsg_eptdev_read(struct file *filp, char __user *buf,
 	return use;
 }
 
-static ssize_t rpmsg_eptdev_write(struct file *filp, const char __user *buf,
-				  size_t len, loff_t *f_pos)
+static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
+				       struct iov_iter *from)
 {
+	struct file *filp = iocb->ki_filp;
 	struct rpmsg_eptdev *eptdev = filp->private_data;
+	size_t len = iov_iter_count(from);
 	void *kbuf;
 	int ret;
 
-	kbuf = memdup_user(buf, len);
-	if (IS_ERR(kbuf))
-		return PTR_ERR(kbuf);
+	kbuf = kzalloc(len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	if (!copy_from_iter_full(kbuf, len, from))
+		return -EFAULT;
 
 	if (mutex_lock_interruptible(&eptdev->ept_lock)) {
 		ret = -ERESTARTSYS;
@@ -281,8 +286,8 @@ static const struct file_operations rpmsg_eptdev_fops = {
 	.owner = THIS_MODULE,
 	.open = rpmsg_eptdev_open,
 	.release = rpmsg_eptdev_release,
-	.read = rpmsg_eptdev_read,
-	.write = rpmsg_eptdev_write,
+	.read_iter = rpmsg_eptdev_read_iter,
+	.write_iter = rpmsg_eptdev_write_iter,
 	.poll = rpmsg_eptdev_poll,
 	.unlocked_ioctl = rpmsg_eptdev_ioctl,
 	.compat_ioctl = rpmsg_eptdev_ioctl,
-- 
2.18.0
