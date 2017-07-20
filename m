Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2] remoteproc: Merge __rproc_boot() with rproc_boot()
Date: Thu, 20 Jul 2017 15:19:22 -0500
Message-ID: <20170720201922.19575-1-s-anna@ti.com>
In-Reply-To: <20170720020628.10917-1-s-anna@ti.com>
References: <20170720020628.10917-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The additional arguments in the internal __rproc_boot() function
were dropped in commit 2bfc311a57f5 ("remoteproc: Drop wait in
__rproc_boot()"). The exported rproc_boot() is now just a wrapper
around this internal function, so merge them together.

While at this, also remove the declaration for the previously
cleaned up rproc_boot_nowait() function.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2:
 - Fixed the missed out function name change in comments
 - Drop rproc_boot_nowait() from internal header as well

 drivers/remoteproc/remoteproc_core.c     | 13 ++-----------
 drivers/remoteproc/remoteproc_internal.h |  1 -
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 564061dcc019..364ef28bac84 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1119,7 +1119,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
 }
 
 /**
- * __rproc_boot() - boot a remote processor
+ * rproc_boot() - boot a remote processor
  * @rproc: handle of a remote processor
  *
  * Boot a remote processor (i.e. load its firmware, power it on, ...).
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
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 1e9e5b3f021c..c1077bec5d0b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -48,7 +48,6 @@ struct rproc_fw_ops {
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
-int rproc_boot_nowait(struct rproc *rproc);
 void rproc_vdev_release(struct kref *ref);
 
 /* from remoteproc_virtio.c */
-- 
2.13.1
