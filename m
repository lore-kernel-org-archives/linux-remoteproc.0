Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 1/1] remoteproc: add support for co-processor loaded and booted before kernel
Date: Wed, 13 Nov 2019 22:29:03 +0100
Message-ID: <1573680543-39086-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Remote processor could boot independently or be loaded/started before
Linux kernel by bootloader or any firmware.
This patch introduces a new property in rproc core, named skip_fw_load,
to be able to allocate resources and sub-devices like vdev and to
synchronize with current state without loading firmware from file system.
It is platform driver responsibility to implement the right firmware
load ops according to HW specificities.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

---
Change from v2:
- rename property into skip_fw_load
- update rproc_boot and rproc_fw_boot description
- update commit message
Change from v1:
- Keep bool in struct rproc
---
 drivers/remoteproc/remoteproc_core.c | 51 +++++++++++++++++++++++++++---------
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..585cdca8b241 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1360,7 +1360,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 }
 
 /*
- * take a firmware and boot a remote processor with it.
+ * Handle resources defined in resource table and start a remote processor.
  */
 static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 {
@@ -1372,7 +1372,11 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
+	if (fw)
+		dev_info(dev, "Booting fw image %s, size %zd\n", name,
+			 fw->size);
+	else
+		dev_info(dev, "Synchronizing with preloaded co-processor\n");
 
 	/*
 	 * if enabling an IOMMU isn't relevant for this rproc, this is
@@ -1719,16 +1723,22 @@ static void rproc_crash_handler_work(struct work_struct *work)
  * rproc_boot() - boot a remote processor
  * @rproc: handle of a remote processor
  *
- * Boot a remote processor (i.e. load its firmware, power it on, ...).
+ * Boot a remote processor (i.e. load its firmware, power it on, ...) from
+ * different contexts:
+ * - power off
+ * - preloaded firmware
+ * - started before kernel execution
+ * The different operations are selected thanks to properties defined by
+ * platform driver.
  *
- * If the remote processor is already powered on, this function immediately
- * returns (successfully).
+ * If the remote processor is already powered on at rproc level, this function
+ * immediately returns (successfully).
  *
  * Returns 0 on success, and an appropriate error value otherwise.
  */
 int rproc_boot(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p = NULL;
 	struct device *dev;
 	int ret;
 
@@ -1759,11 +1769,17 @@ int rproc_boot(struct rproc *rproc)
 
 	dev_info(dev, "powering up %s\n", rproc->name);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto downref_rproc;
+	if (!rproc->skip_fw_load) {
+		/* load firmware */
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto downref_rproc;
+		}
+	} else {
+		/* set firmware name to null as unknown */
+		kfree(rproc->firmware);
+		rproc->firmware = NULL;
 	}
 
 	ret = rproc_fw_boot(rproc, firmware_p);
@@ -1917,8 +1933,17 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
-	/* if rproc is marked always-on, request it to boot */
-	if (rproc->auto_boot) {
+	if (rproc->skip_fw_load) {
+		/*
+		 * If rproc is marked already booted, no need to wait
+		 * for firmware.
+		 * Just handle associated resources and start sub devices
+		 */
+		ret = rproc_boot(rproc);
+		if (ret < 0)
+			return ret;
+	} else if (rproc->auto_boot) {
+		/* if rproc is marked always-on, request it to boot */
 		ret = rproc_trigger_auto_boot(rproc);
 		if (ret < 0)
 			return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..4fd5bedab4fa 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -479,6 +479,7 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @skip_fw_load: remote processor has been preloaded before start sequence
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  */
@@ -512,6 +513,7 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
+	bool skip_fw_load;
 	struct list_head dump_segments;
 	int nb_vdev;
 };
-- 
2.7.4
