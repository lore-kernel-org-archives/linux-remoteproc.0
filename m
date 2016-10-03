Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] remoteproc: Refactor rproc module locking
Date: Sun,  2 Oct 2016 17:46:39 -0700
Message-Id: <1475455600-31689-2-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1475455600-31689-1-git-send-email-bjorn.andersson@linaro.org>
References: <1475455600-31689-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Lock the implementation as we hand out references to client drivers
rather than when they try to boot the remote processor. This allows
auto-booting remote processors to be shut down by unloading their
module, in addition to first unbinding them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ede3af14b9d0..c6bfb3496684 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1035,13 +1035,6 @@ static int __rproc_boot(struct rproc *rproc, bool wait)
 		return ret;
 	}
 
-	/* prevent underlying implementation from being removed */
-	if (!try_module_get(dev->parent->driver->owner)) {
-		dev_err(dev, "%s: can't get owner\n", __func__);
-		ret = -EINVAL;
-		goto unlock_mutex;
-	}
-
 	/* skip the boot process if rproc is already powered up */
 	if (atomic_inc_return(&rproc->power) > 1) {
 		ret = 0;
@@ -1066,10 +1059,8 @@ static int __rproc_boot(struct rproc *rproc, bool wait)
 	release_firmware(firmware_p);
 
 downref_rproc:
-	if (ret) {
-		module_put(dev->parent->driver->owner);
+	if (ret)
 		atomic_dec(&rproc->power);
-	}
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -1158,8 +1149,6 @@ void rproc_shutdown(struct rproc *rproc)
 
 out:
 	mutex_unlock(&rproc->lock);
-	if (!ret)
-		module_put(dev->parent->driver->owner);
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
@@ -1188,6 +1177,12 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 	mutex_lock(&rproc_list_mutex);
 	list_for_each_entry(r, &rproc_list, node) {
 		if (r->dev.parent && r->dev.parent->of_node == np) {
+			/* prevent underlying implementation from being removed */
+			if (!try_module_get(r->dev.parent->driver->owner)) {
+				dev_err(&r->dev, "can't get owner\n");
+				break;
+			}
+
 			rproc = r;
 			get_device(&rproc->dev);
 			break;
@@ -1411,6 +1406,7 @@ EXPORT_SYMBOL(rproc_free);
  */
 void rproc_put(struct rproc *rproc)
 {
+	module_put(rproc->dev.parent->driver->owner);
 	put_device(&rproc->dev);
 }
 EXPORT_SYMBOL(rproc_put);
-- 
2.5.0
