Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Only update table_ptr if we have a loaded table
Date: Wed, 10 Aug 2016 11:57:03 -0700
Message-Id: <1470855423-32472-1-git-send-email-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In the case that we have a resource table, but not a loaded one we
should leave the table_ptr intact, as subsequent resource handling could
otherwise dereference the NULL pointer.

Cc: stable@vger.kernel.org
Fixes: e395f9ce49eb ("remoteproc: core: Make the loaded resource table optional")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fe0539ed9cb5..29f3d7e045aa 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -854,12 +854,15 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	 * The starting device has been given the rproc->cached_table as the
 	 * resource table. The address of the vring along with the other
 	 * allocated resources (carveouts etc) is stored in cached_table.
-	 * In order to pass this information to the remote device we must
-	 * copy this information to device memory.
+	 * In order to pass this information to the remote device we must copy
+	 * this information to device memory. We also update the table_ptr so
+	 * that any subsequent changes will be applied to the loaded version.
 	 */
 	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
-	if (loaded_table)
+	if (loaded_table) {
 		memcpy(loaded_table, rproc->cached_table, tablesz);
+		rproc->table_ptr = loaded_table;
+	}
 
 	/* power up the remote processor */
 	ret = rproc->ops->start(rproc);
@@ -868,13 +871,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up;
 	}
 
-	/*
-	 * Update table_ptr so that all subsequent vring allocations and
-	 * virtio fields manipulation update the actual loaded resource table
-	 * in device memory.
-	 */
-	rproc->table_ptr = loaded_table;
-
 	rproc->state = RPROC_RUNNING;
 
 	dev_info(dev, "remote processor %s is now up\n", rproc->name);
@@ -882,6 +878,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 clean_up:
+	rproc->table_ptr = rproc->cached_table;
 	rproc_resource_cleanup(rproc);
 	rproc_disable_iommu(rproc);
 	return ret;
-- 
2.5.0
