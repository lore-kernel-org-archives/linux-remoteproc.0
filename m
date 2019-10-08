Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] rpmsg: char: fix resource leak on kbuf on copy_from_iter_full failure
Date: Tue,  8 Oct 2019 13:00:18 +0100
Message-Id: <20191008120018.12439-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

Currently when copy_from_iter_full fails the kbuf is not free'd on the
error return path. Fix this by setting the error return code and exiting
via the free_kbuf path.

Addresses-Coverity: ("Resource leak")
Fixes: ccf45b18ce89 ("rpmsg: char: Migrate to iter versions of read and write")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rpmsg/rpmsg_char.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 507bfe163883..7db28643db43 100644
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
2.20.1
