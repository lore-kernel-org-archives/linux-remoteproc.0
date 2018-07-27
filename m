Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 1/6] remoteproc: Introduce custom dump function for each remoteproc segment
Date: Fri, 27 Jul 2018 20:49:58 +0530
Message-Id: <20180727152003.11663-2-sibis@codeaurora.org>
In-Reply-To: <20180727152003.11663-1-sibis@codeaurora.org>
References: <20180727152003.11663-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce custom dump function per remoteproc segment. It is responsible
for filling the device memory segment associated with coredump

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 15 ++++++++++-----
 include/linux/remoteproc.h           |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 283b258f5e0f..ec56cd822b26 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1183,13 +1183,18 @@ static void rproc_coredump(struct rproc *rproc)
 		phdr->p_align = 0;
 
 		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
-		if (!ptr) {
-			dev_err(&rproc->dev,
+
+		if (segment->dump) {
+			segment->dump(rproc, ptr, segment->size, data + offset);
+		} else {
+			if (!ptr) {
+				dev_err(&rproc->dev,
 				"invalid coredump segment (%pad, %zu)\n",
 				&segment->da, segment->size);
-			memset(data + offset, 0xff, segment->size);
-		} else {
-			memcpy(data + offset, ptr, segment->size);
+				memset(data + offset, 0xff, segment->size);
+			} else {
+				memcpy(data + offset, ptr, segment->size);
+			}
 		}
 
 		offset += phdr->p_filesz;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e3c5d856b6da..0fbb01a9955c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -399,6 +399,8 @@ enum rproc_crash_type {
  * @node:	list node related to the rproc segment list
  * @da:		device address of the segment
  * @size:	size of the segment
+ * @dump:	custom dump function to fill device memory segment associated
+ *		with coredump
  */
 struct rproc_dump_segment {
 	struct list_head node;
@@ -406,6 +408,7 @@ struct rproc_dump_segment {
 	dma_addr_t da;
 	size_t size;
 
+	void (*dump)(struct rproc *rproc, void *ptr, size_t len, void *priv);
 	loff_t offset;
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
