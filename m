Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 09/17] remoteproc: add helper function to allocate rproc_mem_entry from reserved memory
Date: Fri, 27 Jul 2018 15:14:44 +0200
Message-ID: <1532697292-14272-10-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces rproc_res_mem_entry_init() helper function to
allocate a rproc_mem_entry structure from a reserved memory region.
In that case, rproc_mem_entry structure has no alloc and release ops.
It will be used to assigned the specified reserved memory to any
rproc sub device.
Relation between rproc_mem_entry and rproc sub device will be done
by name.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 37 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 2c51549..1e0fe3e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -857,6 +857,7 @@ struct rproc_mem_entry *
 	mem->alloc = alloc;
 	mem->release = release;
 	mem->rsc_offset = FW_RSC_ADDR_ANY;
+	mem->of_resm_idx = -1;
 
 	va_start(args, name);
 	vsnprintf(mem->name, sizeof(mem->name), name, args);
@@ -867,6 +868,42 @@ struct rproc_mem_entry *
 EXPORT_SYMBOL(rproc_mem_entry_init);
 
 /**
+ * rproc_of_resm_mem_entry_init() - allocate and initialize rproc_mem_entry struct
+ * from a reserved memory phandle
+ * @dev: pointer on device struct
+ * @of_resm_idx: reserved memory phandle index in "memory-region"
+ * @len: memory carveout length
+ * @da: device address
+ * @name: carveout name
+ *
+ * This function allocates a rproc_mem_entry struct and fill it with parameters
+ * provided by client.
+ */
+struct rproc_mem_entry *
+rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
+			     u32 da, const char *name, ...)
+{
+	struct rproc_mem_entry *mem;
+	va_list args;
+
+	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
+	if (!mem)
+		return mem;
+
+	mem->da = da;
+	mem->len = len;
+	mem->rsc_offset = FW_RSC_ADDR_ANY;
+	mem->of_resm_idx = of_resm_idx;
+
+	va_start(args, name);
+	vsnprintf(mem->name, sizeof(mem->name), name, args);
+	va_end(args);
+
+	return mem;
+}
+EXPORT_SYMBOL(rproc_of_resm_mem_entry_init);
+
+/**
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
  */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ea95b04..4cdd0c6 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -319,6 +319,7 @@ struct fw_rsc_vdev {
  * @node: list node
  * @rsc_offset: offset in resource table
  * @flags: iommu protection flags
+ * @of_resm_idx: reserved memory phandle index
  * @alloc: specific memory allocator function
  */
 struct rproc_mem_entry {
@@ -331,6 +332,7 @@ struct rproc_mem_entry {
 	struct list_head node;
 	u32 rsc_offset;
 	u32 flags;
+	u32 of_resm_idx;
 	int (*alloc)(struct rproc *rproc, struct rproc_mem_entry *mem);
 	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
 };
@@ -573,6 +575,10 @@ struct rproc_mem_entry *
 		     int (*release)(struct rproc *, struct rproc_mem_entry *),
 		     const char *name, ...);
 
+struct rproc_mem_entry *
+rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
+			     u32 da, const char *name, ...);
+
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
1.9.1
