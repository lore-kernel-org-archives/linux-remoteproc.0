Return-Path: <stefan@agner.ch>
From: Stefan Agner <stefan@agner.ch>
Subject: [RFC] remoteproc: support ELF loading without resource table
Date: Wed,  6 Apr 2016 19:32:24 -0700
Message-Id: <1459996344-2228-1-git-send-email-stefan@agner.ch>
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-ID: <linux-remoteproc@vger.kernel.org>

Start remote processor even if the ELF does not provide a resource
table.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Hi Bjorn,

Nice meeting you at ELC! I had this patch carrying in one of my tree
which basically enables to boot a bare ELF file... Altough my goal
is it to use firmwares with some kind of resource table, I think we
should not enforce having a resource table...

--
Stefan

 drivers/remoteproc/remoteproc_core.c | 44 +++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3d7d58a..5e16910 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -799,9 +799,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	struct resource_table *table, *loaded_table;
 	int ret, tablesz;
 
-	if (!rproc->table_ptr)
-		return -ENOMEM;
-
 	ret = rproc_fw_sanity_check(rproc, fw);
 	if (ret)
 		return ret;
@@ -824,21 +821,20 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	/* look for the resource table */
 	table = rproc_find_rsc_table(rproc, fw, &tablesz);
 	if (!table) {
-		dev_err(dev, "Failed to find resource table\n");
-		goto clean_up;
-	}
-
-	/* Verify that resource table in loaded fw is unchanged */
-	if (rproc->table_csum != crc32(0, table, tablesz)) {
-		dev_err(dev, "resource checksum failed, fw changed?\n");
-		goto clean_up;
-	}
+		dev_info(dev, "No resource table found, continuing...\n");
+	} else {
+		/* Verify that resource table in loaded fw is unchanged */
+		if (rproc->table_csum != crc32(0, table, tablesz)) {
+			dev_err(dev, "resource checksum failed, fw changed?\n");
+			goto clean_up;
+		}
 
-	/* handle fw resources which are required to boot rproc */
-	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
-	if (ret) {
-		dev_err(dev, "Failed to process resources: %d\n", ret);
-		goto clean_up;
+		/* handle fw resources which are required to boot rproc */
+		ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
+		if (ret) {
+			dev_err(dev, "Failed to process resources: %d\n", ret);
+			goto clean_up;
+		}
 	}
 
 	/* load the ELF segments to memory */
@@ -855,13 +851,15 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	 * In order to pass this information to the remote device we must
 	 * copy this information to device memory.
 	 */
-	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
-	if (!loaded_table) {
-		ret = -EINVAL;
-		goto clean_up;
-	}
+	if (table) {
+		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
+		if (!loaded_table) {
+			ret = -EINVAL;
+			goto clean_up;
+		}
 
-	memcpy(loaded_table, rproc->cached_table, tablesz);
+		memcpy(loaded_table, rproc->cached_table, tablesz);
+	}
 
 	/* power up the remote processor */
 	ret = rproc->ops->start(rproc);
-- 
2.7.4
