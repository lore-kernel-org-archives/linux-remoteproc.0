Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail26.static.mailgun.info ([104.130.122.26]:25096 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726071AbgC0X5B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 19:57:01 -0400
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH] remoteproc: core: Add a memory efficient coredump function
Date: Fri, 27 Mar 2020 16:56:52 -0700
Message-Id: <1585353412-19644-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: psodagud@codeaurora.org, tsoni@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The current coredump implementation uses vmalloc area to copy
all the segments. But this might put a lot of strain on low memory
targets as the firmware size sometimes is in ten's of MBs.
The situation becomes worse if there are multiple remote processors
undergoing recovery at the same time.
This patch directly copies the device memory to userspace buffer
and avoids extra memory usage. This requires recovery to be halted
until data is read by userspace and free function is called.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 107 +++++++++++++++++++++++++++++------
 include/linux/remoteproc.h           |   4 ++
 2 files changed, 94 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e..2d881e5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1516,6 +1516,86 @@ int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
 }
 EXPORT_SYMBOL(rproc_coredump_add_segment);
 
+
+void rproc_free_dump(void *data)
+{
+	struct rproc *rproc = data;
+
+	dev_info(&rproc->dev, "Userspace done reading rproc dump\n");
+	complete(&rproc->dump_done);
+}
+
+static unsigned long get_offset(loff_t user_offset, struct list_head *segments,
+				unsigned long *data_left)
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
+				void *data, size_t elfcorelen)
+{
+	void *device_mem = NULL;
+	unsigned long data_left = 0;
+	unsigned long bytes_left = count;
+	unsigned long addr = 0;
+	size_t copy_size = 0;
+	struct rproc *rproc = data;
+
+	if (offset < elfcorelen) {
+		copy_size = elfcorelen - offset;
+		copy_size = min(copy_size, bytes_left);
+
+		memcpy(buffer, rproc->elfcore + offset, copy_size);
+		offset += copy_size;
+		bytes_left -= copy_size;
+		buffer += copy_size;
+	}
+
+	while (bytes_left) {
+		addr = get_offset(offset - elfcorelen, &rproc->dump_segments,
+				&data_left);
+	/* EOF check */
+		if (data_left == 0) {
+			pr_info("Ramdump complete. %lld bytes read.", offset);
+			return 0;
+		}
+
+		copy_size = min_t(size_t, bytes_left, data_left);
+
+		device_mem = rproc->ops->da_to_va(rproc, addr, copy_size);
+		if (!device_mem) {
+			pr_err("Unable to ioremap: addr %lx, size %zd\n",
+				 addr, copy_size);
+			return -ENOMEM;
+		}
+		memcpy(buffer, device_mem, copy_size);
+
+		offset += copy_size;
+		buffer += copy_size;
+		bytes_left -= copy_size;
+		dev_dbg(&rproc->dev, "Copied %d bytes to userspace\n",
+			copy_size);
+	}
+
+	return count;
+}
+
 /**
  * rproc_coredump_add_custom_segment() - add custom coredump segment
  * @rproc:	handle of a remote processor
@@ -1566,27 +1646,27 @@ static void rproc_coredump(struct rproc *rproc)
 	struct rproc_dump_segment *segment;
 	struct elf32_phdr *phdr;
 	struct elf32_hdr *ehdr;
-	size_t data_size;
+	size_t header_size;
 	size_t offset;
 	void *data;
-	void *ptr;
 	int phnum = 0;
 
 	if (list_empty(&rproc->dump_segments))
 		return;
 
-	data_size = sizeof(*ehdr);
+	header_size = sizeof(*ehdr);
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		data_size += sizeof(*phdr) + segment->size;
+		header_size += sizeof(*phdr);
 
 		phnum++;
 	}
 
-	data = vmalloc(data_size);
+	data = vmalloc(header_size);
 	if (!data)
 		return;
 
 	ehdr = data;
+	rproc->elfcore = data;
 
 	memset(ehdr, 0, sizeof(*ehdr));
 	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
@@ -1618,23 +1698,14 @@ static void rproc_coredump(struct rproc *rproc)
 
 		if (segment->dump) {
 			segment->dump(rproc, segment, data + offset);
-		} else {
-			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
-			if (!ptr) {
-				dev_err(&rproc->dev,
-					"invalid coredump segment (%pad, %zu)\n",
-					&segment->da, segment->size);
-				memset(data + offset, 0xff, segment->size);
-			} else {
-				memcpy(data + offset, ptr, segment->size);
-			}
-		}
 
 		offset += phdr->p_filesz;
 		phdr++;
 	}
+	dev_coredumpm(&rproc->dev, NULL, rproc, header_size, GFP_KERNEL,
+			rproc_read_dump, rproc_free_dump);
 
-	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
+	wait_for_completion(&rproc->dump_done);
 }
 
 /**
@@ -1665,6 +1736,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 
 	/* generate coredump */
 	rproc_coredump(rproc);
+	reinit_completion(&rproc->dump_done);
 
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
@@ -2067,6 +2139,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->rvdevs);
 	INIT_LIST_HEAD(&rproc->subdevs);
 	INIT_LIST_HEAD(&rproc->dump_segments);
+	init_completion(&rproc->dump_done);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad666..461b235 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -481,6 +481,8 @@ struct rproc_dump_segment {
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
+ * @dump_done: completion variable when dump is complete
+ * @elfcore: pointer to elf header buffer
  */
 struct rproc {
 	struct list_head node;
@@ -514,6 +516,8 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	struct completion dump_done;
+	void *elfcore;
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
