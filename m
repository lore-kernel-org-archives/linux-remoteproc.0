Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [RESEND 2/2] remoteproc: add support for co-processor booted before kernel
Date: Wed, 7 Aug 2019 11:41:19 +0200
Message-ID: <1565170879-3185-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1565170879-3185-1-git-send-email-loic.pallardy@st.com>
References: <1565170879-3185-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Remote processor could boot independently or be started before Linux
kernel by bootloader or any firmware.
This patch introduces a new property in rproc core, named preloaded,
to be able to allocate resources and sub-devices like vdev and to
synchronize with current state without loading firmware from file system.
It is platform driver responsibility to implement the right firmware
load ops according to HW specificities.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 37 +++++++++++++++++++++++++++---------
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..7eaf0f949afa 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
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
@@ -1728,7 +1732,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
  */
 int rproc_boot(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p = NULL;
 	struct device *dev;
 	int ret;
 
@@ -1759,11 +1763,17 @@ int rproc_boot(struct rproc *rproc)
 
 	dev_info(dev, "powering up %s\n", rproc->name);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto downref_rproc;
+	if (!rproc->preloaded) {
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
@@ -1917,8 +1927,17 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
-	/* if rproc is marked always-on, request it to boot */
-	if (rproc->auto_boot) {
+	if (rproc->preloaded) {
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
index 8cd22fecea61..27f0dfdd3837 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -481,6 +481,7 @@ struct rproc_dump_segment {
  * @recovery_disabled: flag that state if recovery was disabled
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @preloaded: remote processor has been preloaded before start sequence
  */
 struct rproc {
 	struct list_head node;
@@ -514,6 +515,7 @@ struct rproc {
 	u8 recovery_disabled;
 	u8 has_iommu;
 	u8 auto_boot;
+	u8 preloaded;
 };
 
 /**
-- 
2.7.4
