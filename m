Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/4] remoteproc: Move vdev handling to boot/shutdown
Date: Thu, 11 Aug 2016 14:52:52 -0700
Message-Id: <1470952373-4823-3-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
References: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
To: linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Lee Jones <lee.jones@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The newly introduced "always-on" flag allows us to stop giving the vdevs
special treatment. The ordering of resource allocation and life cycle of
the remote processor is kept intact.

This allows us to mark a remote processor with vdevs to not boot unless
explicitly requested to do so by a client driver.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/remoteproc_core.c | 37 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f484e04810f3..e86200f978e2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -753,6 +753,7 @@ static int rproc_handle_resources(struct rproc *rproc, int len,
 static void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
+	struct rproc_vdev *rvdev, *rvtmp;
 	struct device *dev = &rproc->dev;
 
 	/* clean up debugfs trace entries */
@@ -785,6 +786,10 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 		list_del(&entry->node);
 		kfree(entry);
 	}
+
+	/* clean up remote vdev entries */
+	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
+		rproc_remove_virtio_dev(rvdev);
 }
 
 /*
@@ -835,6 +840,13 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
 
+	/* look for virtio devices and register them */
+	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
+	if (ret) {
+		dev_err(dev, "Failed to handle vdev resources: %d\n", ret);
+		goto clean_up;
+	}
+
 	/* handle fw resources which are required to boot rproc */
 	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
 	if (ret) {
@@ -898,7 +910,7 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
 {
 	struct rproc *rproc = context;
 	struct resource_table *table;
-	int ret, tablesz;
+	int tablesz;
 
 	if (rproc_fw_sanity_check(rproc, fw) < 0)
 		goto out;
@@ -922,9 +934,6 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
 
 	rproc->table_ptr = rproc->cached_table;
 
-	/* look for virtio devices and register them */
-	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
-
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot)
 		rproc_boot_nowait(rproc);
@@ -973,9 +982,6 @@ static int rproc_add_virtio_devices(struct rproc *rproc)
  */
 int rproc_trigger_recovery(struct rproc *rproc)
 {
-	struct rproc_vdev *rvdev, *rvtmp;
-	int ret;
-
 	dev_err(&rproc->dev, "recovering %s\n", rproc->name);
 
 	init_completion(&rproc->crash_comp);
@@ -984,26 +990,13 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* TODO: make sure this works with rproc->power > 1 */
 	rproc_shutdown(rproc);
 
-	/* clean up remote vdev entries */
-	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
-		rproc_remove_virtio_dev(rvdev);
-
 	/* wait until there is no more rproc users */
 	wait_for_completion(&rproc->crash_comp);
 
-	/* Free the copy of the resource table */
-	kfree(rproc->cached_table);
-
-	ret = rproc_add_virtio_devices(rproc);
-	if (ret)
-		return ret;
-
 	/*
-	 * boot the remote processor up again, if the async firmware loader
-	 * didn't do so already, waiting for the async fw load to finish
+	 * boot the remote processor up again
 	 */
-	if (!rproc->auto_boot)
-		rproc_boot(rproc);
+	rproc_boot(rproc);
 
 	return 0;
 }
-- 
2.5.0
