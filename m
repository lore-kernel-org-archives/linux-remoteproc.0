Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 2/3] remoteproc: Add inline coredump functionality
Date: Thu, 16 Apr 2020 11:38:31 -0700
Message-Id: <1587062312-4939-2-git-send-email-rishabhb@codeaurora.org>
In-Reply-To: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
References: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, mathieu.poirier@linaro.org, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the inline coredump functionality. The current
coredump implementation uses vmalloc area to copy all the segments.
But this might put a lot of strain on low memory targets as the
firmware size sometimes is in ten's of MBs. The situation becomes
worse if there are multiple remote processors  undergoing recovery
at the same time. This patch directly copies the device memory to
userspace buffer and avoids extra memory usage. This requires
recovery to be halted until data is read by userspace and free
function is called.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/remoteproc_coredump.c | 130 +++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  23 +++++-
 include/linux/remoteproc.h               |   2 +
 3 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index 9de0467..888b7dec91 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -12,6 +12,84 @@
 #include <linux/remoteproc.h>
 #include "remoteproc_internal.h"
 
+static void rproc_free_dump(void *data)
+{
+	struct rproc_coredump_state *dump_state = data;
+
+	complete(&dump_state->dump_done);
+}
+
+static unsigned long resolve_addr(loff_t user_offset,
+				   struct list_head *segments,
+				   unsigned long *data_left)
+{
+	struct rproc_dump_segment *segment;
+
+	list_for_each_entry(segment, segments, node) {
+		if (user_offset >= segment->size)
+			user_offset -= segment->size;
+		else
+			break;
+	}
+
+	if (&segment->node == segments) {
+		*data_left = 0;
+		return 0;
+	}
+
+	*data_left = segment->size - user_offset;
+
+	return segment->da + user_offset;
+}
+
+static ssize_t rproc_read_dump(char *buffer, loff_t offset, size_t count,
+				void *data, size_t header_size)
+{
+	void *device_mem;
+	size_t data_left, copy_size, bytes_left = count;
+	unsigned long addr;
+	struct rproc_coredump_state *dump_state = data;
+	struct rproc *rproc = dump_state->rproc;
+	void *elfcore = dump_state->header;
+
+	/* Copy the header first */
+	if (offset < header_size) {
+		copy_size = header_size - offset;
+		copy_size = min(copy_size, bytes_left);
+
+		memcpy(buffer, elfcore + offset, copy_size);
+		offset += copy_size;
+		bytes_left -= copy_size;
+		buffer += copy_size;
+	}
+
+	while (bytes_left) {
+		addr = resolve_addr(offset - header_size,
+				    &rproc->dump_segments, &data_left);
+		/* EOF check */
+		if (data_left == 0) {
+			pr_info("Ramdump complete %lld bytes read", offset);
+			break;
+		}
+
+		copy_size = min_t(size_t, bytes_left, data_left);
+
+		device_mem = rproc->ops->da_to_va(rproc, addr, copy_size);
+		if (!device_mem) {
+			pr_err("Address:%lx with size %zd out of remoteproc carveout\n",
+				addr, copy_size);
+			return -ENOMEM;
+		}
+		memcpy(buffer, device_mem, copy_size);
+
+		offset += copy_size;
+		buffer += copy_size;
+		bytes_left -= copy_size;
+	}
+
+	return count - bytes_left;
+}
+
 static void create_elf_header(void *data, int phnum, struct rproc *rproc)
 {
 	struct elf32_phdr *phdr;
@@ -55,6 +133,58 @@ static void create_elf_header(void *data, int phnum, struct rproc *rproc)
 }
 
 /**
+ * rproc_inline_coredump() - perform synchronized coredump
+ * @rproc:	rproc handle
+ *
+ * This function will generate an ELF header for the registered segments
+ * and create a devcoredump device associated with rproc. This function
+ * directly copies the segments from device memory to userspace. The
+ * recovery is stalled until the enitire coredump is read. This approach
+ * avoids using extra vmalloc memory(which can be really large).
+ */
+void rproc_inline_coredump(struct rproc *rproc)
+{
+	struct rproc_dump_segment *segment;
+	struct elf32_phdr *phdr;
+	struct elf32_hdr *ehdr;
+	struct rproc_coredump_state *dump_state;
+	size_t header_size;
+	void *data;
+	int phnum = 0;
+
+	if (list_empty(&rproc->dump_segments))
+		return;
+
+	header_size = sizeof(*ehdr);
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		header_size += sizeof(*phdr);
+
+		phnum++;
+	}
+
+	data = vmalloc(header_size);
+	if (!data)
+		return;
+
+	ehdr = data;
+	create_elf_header(data, phnum, rproc);
+
+	dump_state = kzalloc(sizeof(*dump_state), GFP_KERNEL);
+	dump_state->rproc = rproc;
+	dump_state->header = data;
+	init_completion(&dump_state->dump_done);
+
+	dev_coredumpm(&rproc->dev, NULL, dump_state, header_size, GFP_KERNEL,
+		      rproc_read_dump, rproc_free_dump);
+
+	/* Wait until the dump is read and free is called */
+	wait_for_completion(&dump_state->dump_done);
+
+	kfree(dump_state);
+}
+EXPORT_SYMBOL(rproc_inline_coredump);
+
+/**
  * rproc_default_coredump() - perform coredump
  * @rproc:	rproc handle
  *
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 28b6af2..ea6146e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,18 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+struct rproc_coredump_state {
+	struct rproc *rproc;
+	void *header;
+	struct completion dump_done;
+};
+
+enum rproc_coredump_conf {
+	COREDUMP_DEFAULT,
+	COREDUMP_INLINE,
+	COREDUMP_DISABLED,
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
@@ -49,6 +61,7 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
 
 /* from remoteproc_coredump.c */
 void rproc_default_coredump(struct rproc *rproc);
+void rproc_inline_coredump(struct rproc *rproc);
 
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
@@ -125,8 +138,14 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 static inline
 void rproc_coredump(struct rproc *rproc)
 {
-	return rproc_default_coredump(rproc);
-
+	switch (rproc->coredump_conf) {
+	case COREDUMP_DEFAULT:
+		return rproc_default_coredump(rproc);
+	case COREDUMP_INLINE:
+		return rproc_inline_coredump(rproc);
+	default:
+		break;
+	}
 }
 
 #endif /* REMOTEPROC_INTERNAL_H */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad666..23298ce 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -459,6 +459,7 @@ struct rproc_dump_segment {
  * @dev: virtual device for refcounting and common remoteproc behavior
  * @power: refcount of users who need this rproc powered up
  * @state: state of the device
+ * @coredump_conf: Currenlty selected coredump configuration
  * @lock: lock which protects concurrent manipulations of the rproc
  * @dbg_dir: debugfs directory of this rproc device
  * @traces: list of trace buffers
@@ -492,6 +493,7 @@ struct rproc {
 	struct device dev;
 	atomic_t power;
 	unsigned int state;
+	unsigned int coredump_conf;
 	struct mutex lock;
 	struct dentry *dbg_dir;
 	struct list_head traces;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
