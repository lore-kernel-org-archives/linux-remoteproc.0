Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] rpmsg: char: Simplify 'rpmsg_eptdev_release()'
Date: Tue, 29 Oct 2019 07:09:14 +0100
Message-Id: <20191029060915.3650-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

Use 'skb_queue_purge()' instead of re-implementing it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rpmsg/rpmsg_char.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 507bfe163883..0c3a340db7d1 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -146,7 +146,6 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
 	struct device *dev = &eptdev->dev;
-	struct sk_buff *skb;
 
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
@@ -157,10 +156,7 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	mutex_unlock(&eptdev->ept_lock);
 
 	/* Discard all SKBs */
-	while (!skb_queue_empty(&eptdev->queue)) {
-		skb = skb_dequeue(&eptdev->queue);
-		kfree_skb(skb);
-	}
+	skb_queue_purge(&eptdev->queue);
 
 	put_device(dev);
 
-- 
2.20.1
