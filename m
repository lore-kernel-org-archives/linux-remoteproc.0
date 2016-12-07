Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Drop wait in __rproc_boot()
Date: Tue,  6 Dec 2016 17:04:45 -0800
Message-Id: <1481072685-2888-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In the event that rproc_boot() is called before the firmware loaded
completion has been flagged it will wait with the mutex held,
obstructing the request_firmware_nowait() callback from completing the
wait.

As rproc_fw_config_virtio() has been reduced to only triggering
auto-boot there is no longer a reason for waiting in rproc_boot(), so
drop this.

Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

A separate patch should be written that drops firmware_loading_complete, but
this requires handling the case where rproc_del() is called before
request_firmware_nowait() finishes.

 drivers/remoteproc/remoteproc_core.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f0f6ec1ab12b..953ee29bcab3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -972,7 +972,7 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
 
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot)
-		rproc_boot_nowait(rproc);
+		rproc_boot(rproc);
 
 	release_firmware(fw);
 	/* allow rproc_del() contexts, if any, to proceed */
@@ -1070,7 +1070,6 @@ static void rproc_crash_handler_work(struct work_struct *work)
 /**
  * __rproc_boot() - boot a remote processor
  * @rproc: handle of a remote processor
- * @wait: wait for rproc registration completion
  *
  * Boot a remote processor (i.e. load its firmware, power it on, ...).
  *
@@ -1079,7 +1078,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
  *
  * Returns 0 on success, and an appropriate error value otherwise.
  */
-static int __rproc_boot(struct rproc *rproc, bool wait)
+static int __rproc_boot(struct rproc *rproc)
 {
 	const struct firmware *firmware_p;
 	struct device *dev;
@@ -1113,10 +1112,6 @@ static int __rproc_boot(struct rproc *rproc, bool wait)
 		goto downref_rproc;
 	}
 
-	/* if rproc virtio is not yet configured, wait */
-	if (wait)
-		wait_for_completion(&rproc->firmware_loading_complete);
-
 	ret = rproc_fw_boot(rproc, firmware_p);
 
 	release_firmware(firmware_p);
@@ -1135,22 +1130,11 @@ static int __rproc_boot(struct rproc *rproc, bool wait)
  */
 int rproc_boot(struct rproc *rproc)
 {
-	return __rproc_boot(rproc, true);
+	return __rproc_boot(rproc);
 }
 EXPORT_SYMBOL(rproc_boot);
 
 /**
- * rproc_boot_nowait() - boot a remote processor
- * @rproc: handle of a remote processor
- *
- * Same as rproc_boot() but don't wait for rproc registration completion
- */
-int rproc_boot_nowait(struct rproc *rproc)
-{
-	return __rproc_boot(rproc, false);
-}
-
-/**
  * rproc_shutdown() - power off the remote processor
  * @rproc: the remote processor
  *
-- 
2.5.0
