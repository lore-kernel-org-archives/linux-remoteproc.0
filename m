Return-Path: <navid.emamdoost@gmail.com>
Return-Path: <navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] rpmsg: char: release allocated memory
Date: Mon, 16 Sep 2019 22:31:23 -0500
Message-Id: <20190917033124.1077-1-navid.emamdoost@gmail.com>
Cc: emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In rpmsg_eptdev_write_iter, if copy_from_iter_full fails the allocated
buffer needs to be released.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/rpmsg/rpmsg_char.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index eea5ebbb5119..c655074c07c2 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -227,8 +227,10 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 	if (!kbuf)
 		return -ENOMEM;
 
-	if (!copy_from_iter_full(kbuf, len, from))
-		return -EFAULT;
+	if (!copy_from_iter_full(kbuf, len, from)) {
+		ret = -EFAULT;
+		goto free_kbuf;
+	}
 
 	if (mutex_lock_interruptible(&eptdev->ept_lock)) {
 		ret = -ERESTARTSYS;
-- 
2.17.1
