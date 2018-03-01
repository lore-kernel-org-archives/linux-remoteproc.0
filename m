Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 08/13] remoteproc: add prepare and unprepare ops
Date: Thu, 1 Mar 2018 17:23:55 +0100
Message-ID: <1519921440-21356-9-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On some SoC architecture, it is needed to enable HW like
clock, bus, regulator, memory region... before loading
co-processor firmware.

This patch introduces prepare and unprepare ops to execute
platform specific function before firmware loading and after
stop execution.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 20 +++++++++++++++++++-
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7a500cb..0ebbc4f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1058,12 +1058,22 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		return ret;
 	}
 
+	/* Prepare rproc for firmware loading if needed */
+	if (rproc->ops->prepare) {
+		ret = rproc->ops->prepare(rproc);
+		if (ret) {
+			dev_err(dev, "can't prepare rproc %s: %d\n",
+				rproc->name, ret);
+			goto disable_iommu;
+		}
+	}
+
 	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
 
 	/* load resource table */
 	ret = rproc_load_rsc_table(rproc, fw);
 	if (ret)
-		goto disable_iommu;
+		goto unprepare_rproc;
 
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
@@ -1086,6 +1096,10 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+unprepare_rproc:
+	/* release HW resources if needed */
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
@@ -1331,6 +1345,10 @@ void rproc_shutdown(struct rproc *rproc)
 	/* clean up all acquired resources */
 	rproc_resource_cleanup(rproc);
 
+	/* release HW resources if needed */
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
+
 	rproc_disable_iommu(rproc);
 
 	/* Free the copy of the resource table */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 4aa30bd..dcfa601 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -333,6 +333,8 @@ struct rproc_mem_entry {
 
 /**
  * struct rproc_ops - platform-specific device handlers
+ * @prepare:	prepare device for code loading
+ * @unprepare:	unprepare device after stop
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
@@ -345,6 +347,8 @@ struct rproc_mem_entry {
  * @get_boot_addr:	get boot address to entry point specified in firmware
  */
 struct rproc_ops {
+	int (*prepare)(struct rproc *rproc);
+	int (*unprepare)(struct rproc *rproc);
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-- 
1.9.1
