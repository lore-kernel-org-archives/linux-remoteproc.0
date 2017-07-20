Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH] remoteproc: Merge __rproc_boot() with rproc_boot()
Date: Wed, 19 Jul 2017 21:06:28 -0500
Message-ID: <20170720020628.10917-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The additional arguments in the internal __rproc_boot() function
were dropped in commit 2bfc311a57f5 ("remoteproc: Drop wait in
__rproc_boot()"). The exported rproc_boot() is now just a wrapper
around this internal function, so merge them together.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 564061dcc019..6224f1036c19 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1129,7 +1129,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
  *
  * Returns 0 on success, and an appropriate error value otherwise.
  */
-static int __rproc_boot(struct rproc *rproc)
+int rproc_boot(struct rproc *rproc)
 {
 	const struct firmware *firmware_p;
 	struct device *dev;
@@ -1180,15 +1180,6 @@ static int __rproc_boot(struct rproc *rproc)
 	mutex_unlock(&rproc->lock);
 	return ret;
 }
-
-/**
- * rproc_boot() - boot a remote processor
- * @rproc: handle of a remote processor
- */
-int rproc_boot(struct rproc *rproc)
-{
-	return __rproc_boot(rproc);
-}
 EXPORT_SYMBOL(rproc_boot);
 
 /**
-- 
2.13.1
