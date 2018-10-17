Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 2/5] remoteproc: Add mechanism for custom dump function assignment
Date: Wed, 17 Oct 2018 19:25:24 +0530
Message-Id: <20181017135527.30592-3-sibis@codeaurora.org>
In-Reply-To: <20181017135527.30592-1-sibis@codeaurora.org>
References: <20181017135527.30592-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, kyan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds a mechanism for assigning each rproc dump segment with
a custom dump function and private data. The dump function is to be
called for each rproc segment during coredump if assigned.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 39 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  5 ++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index afa4274b6ccd..076579f44c3a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1121,6 +1121,45 @@ int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
 }
 EXPORT_SYMBOL(rproc_coredump_add_segment);
 
+/**
+ * rproc_coredump_add_custom_segment() - add segment of device memory to
+ *					 coredump and extend it with custom
+ *					 dump function
+ * @rproc:	handle of a remote processor
+ * @da:		device address
+ * @size:	size of segment
+ * @priv:	private data
+ * @dumpfn:	custom dump function called for each segment during coredump
+ *
+ * Add device memory to the list of segments to be included in the coredump
+ * and associate the segment with the given custom dump function and private
+ * data.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_add_custom_segment(struct rproc *rproc,
+				      dma_addr_t da, size_t size, void *priv,
+				      void (*dumpfn)(struct rproc *rproc,
+					struct rproc_dump_segment *segment,
+					void *dest))
+{
+	struct rproc_dump_segment *segment;
+
+	segment = kzalloc(sizeof(*segment), GFP_KERNEL);
+	if (!segment)
+		return -ENOMEM;
+
+	segment->da = da;
+	segment->size = size;
+	segment->priv = priv;
+	segment->dump = dumpfn;
+
+	list_add_tail(&segment->node, &rproc->dump_segments);
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
+
 /**
  * rproc_coredump() - perform coredump
  * @rproc:	rproc handle
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2a93e102d2ad..0003b23ab117 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -563,6 +563,11 @@ int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
+int rproc_coredump_add_custom_segment(struct rproc *rproc,
+				      dma_addr_t da, size_t size, void *priv,
+				      void (*dumpfn)(struct rproc *rproc,
+					struct rproc_dump_segment *segment,
+					void *dest));
 
 static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
