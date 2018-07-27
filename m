Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 2/6] remoteproc: Add mechanism for custom dump function assignment
Date: Fri, 27 Jul 2018 20:49:59 +0530
Message-Id: <20180727152003.11663-3-sibis@codeaurora.org>
In-Reply-To: <20180727152003.11663-1-sibis@codeaurora.org>
References: <20180727152003.11663-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds a mechanism for assigning each rproc segment with
a custom dump function. It is to be called for each rproc segment
during coredump if assigned.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 37 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  5 ++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ec56cd822b26..3d70b7dd1f18 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1120,6 +1120,43 @@ int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
 }
 EXPORT_SYMBOL(rproc_coredump_add_segment);
 
+/**
+ * rproc_coredump_add_custom_segment() - add segment of device memory to
+ *					 coredump and extend it with custom
+ *					 dump function
+ * @rproc:	handle of a remote processor
+ * @da:		device address
+ * @size:	size of segment
+ * @dumpfn:	custom dump function called for each segment during coredump
+ *
+ * Add device memory to the list of segments to be included in a coredump for
+ * the remoteproc and associate the segment with the given custom dump
+ * function.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_add_custom_segment(struct rproc *rproc,
+				      dma_addr_t da, size_t size,
+				      void (*dumpfn)(struct rproc *rproc,
+						     void *ptr, size_t len,
+						     void *priv))
+{
+	struct rproc_dump_segment *segment;
+
+	segment = kzalloc(sizeof(*segment), GFP_KERNEL);
+	if (!segment)
+		return -ENOMEM;
+
+	segment->da = da;
+	segment->size = size;
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
index 0fbb01a9955c..5a1ad008ec28 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -560,6 +560,11 @@ int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
+int rproc_coredump_add_custom_segment(struct rproc *rproc,
+				      dma_addr_t da, size_t size,
+				      void (*dumpfn)(struct rproc *rproc,
+						     void *ptr, size_t len,
+						     void *priv));
 
 static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
