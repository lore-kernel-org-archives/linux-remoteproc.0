Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 05/19] remoteproc: check if remote is running the fw before reload fw
Date: Fri, 24 Mar 2017 12:22:21 -0700
Message-ID: <1490383355-23176-6-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add a function rproc_is_running_fw() to check if it needs to start the
remote betfore it loads firmware and tries to start the remote.

In some cases, when the master restarts, the remote is already running the
expected firmware.
In this case, we don't need to start the remote when the remoteproc driver
starts.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c | 99 ++++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 28 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dfa2aad..f13f56d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -898,6 +898,17 @@ static bool rproc_is_running(struct rproc *rproc)
 }
 
 /*
+ * check if the remote needs start.
+ */
+static bool rproc_is_running_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	(void)rproc;
+	(void) fw;
+
+	return false;
+}
+
+/*
  * take a firmware and boot a remote processor with it.
  */
 static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
@@ -906,6 +917,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	const char *name = rproc->firmware;
 	struct resource_table *table, *loaded_table;
 	int ret, tablesz;
+	bool is_running = false;
 
 	ret = rproc_fw_sanity_check(rproc, fw);
 	if (ret)
@@ -948,6 +960,19 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
 
+	/* check if the rproc is already running the firmware */
+	/* As it may be required to know if the remote is already running
+	 * when handling the resource table, check if the remote is already
+	 * running the expected firmware before handling the resource table.
+	 */
+	is_running = rproc_is_running_fw(rproc, fw);
+	if (is_running) {
+		rproc->state = RPROC_RUNNING_INDEPENDENT;
+		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
+		if (loaded_table)
+			rproc->table_ptr = loaded_table;
+	}
+
 	/* handle fw resources which are required to boot rproc */
 	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
 	if (ret) {
@@ -955,32 +980,54 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up_resources;
 	}
 
-	/* load the ELF segments to memory */
-	ret = rproc_load_segments(rproc, fw);
-	if (ret) {
-		dev_err(dev, "Failed to load program segments: %d\n", ret);
-		goto clean_up_resources;
-	}
+	if (!is_running) {
+		/* If rproc is running, stop it first */
+		if (rproc_is_running(rproc)) {
+			dev_info(dev, "Restarting the remote.\n");
+			ret = rproc->ops->stop(rproc);
+			if (ret) {
+				atomic_inc(&rproc->power);
+				dev_err(dev, "can't stop rproc: %d\n", ret);
+				goto clean_up_resources;
+			}
+		}
 
-	/*
-	 * The starting device has been given the rproc->cached_table as the
-	 * resource table. The address of the vring along with the other
-	 * allocated resources (carveouts etc) is stored in cached_table.
-	 * In order to pass this information to the remote device we must copy
-	 * this information to device memory. We also update the table_ptr so
-	 * that any subsequent changes will be applied to the loaded version.
-	 */
-	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
-	if (loaded_table) {
-		memcpy(loaded_table, rproc->cached_table, tablesz);
-		rproc->table_ptr = loaded_table;
-	}
+		/* load the ELF segments to memory */
+		ret = rproc_load_segments(rproc, fw);
+		if (ret) {
+			dev_err(dev, "Failed to load program segments: %d\n",
+				ret);
+			goto clean_up_resources;
+		}
 
-	/* power up the remote processor */
-	ret = rproc->ops->start(rproc);
-	if (ret) {
-		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
-		goto clean_up_resources;
+		/*
+		 * The starting device has been given the rproc->cached_table
+		 * as the resource table. The address of the vring along with
+		 * the other allocated resources (carveouts etc) is stored in
+		 * cached_table. In order to pass this information to the
+		 * remote device we must copy this information to device
+		 * memory. We also update the table_ptr so that any subsequent
+		 * changes will be applied to the loaded version.
+		 */
+		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
+		if (loaded_table) {
+			memcpy(loaded_table, rproc->cached_table, tablesz);
+			rproc->table_ptr = loaded_table;
+		}
+
+		/* power up the remote processor */
+		ret = rproc->ops->start(rproc);
+		if (ret) {
+			dev_err(dev, "can't start rproc %s: %d\n",
+				rproc->name, ret);
+			goto clean_up_resources;
+		}
+
+		rproc->state = RPROC_RUNNING;
+
+		dev_info(dev, "remote processor %s is now up\n", rproc->name);
+	} else {
+		dev_info(dev, "remote is already running. Do not restart\n");
 	}
 
 	/* probe any subdevices for the remote processor */
@@ -991,10 +1038,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto stop_rproc;
 	}
 
-	rproc->state = RPROC_RUNNING;
-
-	dev_info(dev, "remote processor %s is now up\n", rproc->name);
-
 	return 0;
 
 stop_rproc:
-- 
1.9.1
