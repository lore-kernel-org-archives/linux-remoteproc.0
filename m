Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/8] remoteproc: Remove depricated crash completion
Date: Fri,  5 Jan 2018 15:57:58 -0800
Message-Id: <20180105235805.9948-2-bjorn.andersson@linaro.org>
In-Reply-To: <20180105235805.9948-1-bjorn.andersson@linaro.org>
References: <20180105235805.9948-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The crash handling now happens in a single execution context, so there's
no longer a need for a completion to synchronize this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/remoteproc_core.c | 10 ----------
 include/linux/remoteproc.h           |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index eab14b414bf0..758fad3131a3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1028,10 +1028,6 @@ static int rproc_stop(struct rproc *rproc)
 		return ret;
 	}
 
-	/* if in crash state, unlock crash handler */
-	if (rproc->state == RPROC_CRASHED)
-		complete_all(&rproc->crash_comp);
-
 	rproc->state = RPROC_OFFLINE;
 
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
@@ -1057,8 +1053,6 @@ int rproc_trigger_recovery(struct rproc *rproc)
 
 	dev_err(dev, "recovering %s\n", rproc->name);
 
-	init_completion(&rproc->crash_comp);
-
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret)
 		return ret;
@@ -1067,9 +1061,6 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (ret)
 		goto unlock_mutex;
 
-	/* wait until there is no more rproc users */
-	wait_for_completion(&rproc->crash_comp);
-
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
@@ -1459,7 +1450,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->subdevs);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
-	init_completion(&rproc->crash_comp);
 
 	rproc->state = RPROC_OFFLINE;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 44e630eb3d94..6f1d8e025c81 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -406,7 +406,6 @@ enum rproc_crash_type {
  * @index: index of this rproc device
  * @crash_handler: workqueue for handling a crash
  * @crash_cnt: crash counter
- * @crash_comp: completion used to sync crash handler and the rproc reload
  * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
  * @table_ptr: pointer to the resource table in effect
@@ -437,7 +436,6 @@ struct rproc {
 	int index;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
-	struct completion crash_comp;
 	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
-- 
2.15.0
