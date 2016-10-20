Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 11/11] remoteproc: Merge table_ptr and cached_table pointers
Date: Wed, 19 Oct 2016 19:40:12 -0700
Message-Id: <1476931212-1806-12-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

As all vdev resources are allocated before we boot the remote processor
we no longer need to support modifying the resource table while the
remote is running.

This saves us from the table_ptr dance, but more importantly allow the
remote processor to enable security lock down of the loaded table memory
region.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 26 ++++++++++----------------
 include/linux/remoteproc.h           |  4 +---
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f31783d27196..46078c959a9c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -889,15 +889,13 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	/*
 	 * Create a copy of the resource table. When a virtio device starts
 	 * and calls vring_new_virtqueue() the address of the allocated vring
-	 * will be stored in the cached_table. Before the device is started,
-	 * cached_table will be copied into device memory.
+	 * will be stored in the table_ptr. Before the device is started,
+	 * table_ptr will be copied into device memory.
 	 */
-	rproc->cached_table = kmemdup(table, tablesz, GFP_KERNEL);
-	if (!rproc->cached_table)
+	rproc->table_ptr = kmemdup(table, tablesz, GFP_KERNEL);
+	if (!rproc->table_ptr)
 		goto clean_up;
 
-	rproc->table_ptr = rproc->cached_table;
-
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
 
@@ -916,18 +914,16 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	}
 
 	/*
-	 * The starting device has been given the rproc->cached_table as the
+	 * The starting device has been given the rproc->table_ptr as the
 	 * resource table. The address of the vring along with the other
-	 * allocated resources (carveouts etc) is stored in cached_table.
+	 * allocated resources (carveouts etc) is stored in table_ptr.
 	 * In order to pass this information to the remote device we must copy
 	 * this information to device memory. We also update the table_ptr so
 	 * that any subsequent changes will be applied to the loaded version.
 	 */
 	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
-	if (loaded_table) {
-		memcpy(loaded_table, rproc->cached_table, tablesz);
-		rproc->table_ptr = loaded_table;
-	}
+	if (loaded_table)
+		memcpy(loaded_table, rproc->table_ptr, tablesz);
 
 	/* power up the remote processor */
 	ret = rproc->ops->start(rproc);
@@ -955,8 +951,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
 clean_up:
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
+	kfree(rproc->table_ptr);
 	rproc->table_ptr = NULL;
 
 	rproc_disable_iommu(rproc);
@@ -1206,8 +1201,7 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc_disable_iommu(rproc);
 
 	/* Free the copy of the resource table */
-	kfree(rproc->cached_table);
-	rproc->cached_table = NULL;
+	kfree(rproc->table_ptr);
 	rproc->table_ptr = NULL;
 
 	/* if in crash state, unlock crash handler */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ff05b88730ad..51662ee7d032 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -408,8 +408,7 @@ enum rproc_crash_type {
  * @crash_comp: completion used to sync crash handler and the rproc reload
  * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
- * @table_ptr: pointer to the resource table in effect
- * @cached_table: copy of the resource table
+ * @table_ptr: our copy of the resource table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  */
 struct rproc {
@@ -441,7 +440,6 @@ struct rproc {
 	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
-	struct resource_table *cached_table;
 	bool has_iommu;
 	bool auto_boot;
 };
-- 
2.5.0
