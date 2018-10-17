Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 1/5] remoteproc: Introduce custom dump function for each remoteproc segment
Date: Wed, 17 Oct 2018 19:25:23 +0530
Message-Id: <20181017135527.30592-2-sibis@codeaurora.org>
In-Reply-To: <20181017135527.30592-1-sibis@codeaurora.org>
References: <20181017135527.30592-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, kyan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce custom dump function and private data per remoteproc dump
segment. The dump function is responsible for filling the device memory
segment associated with coredump

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 ++++++++++------
 include/linux/remoteproc.h           |  6 ++++++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aa6206706fe3..afa4274b6ccd 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1183,14 +1183,18 @@ static void rproc_coredump(struct rproc *rproc)
 		phdr->p_flags = PF_R | PF_W | PF_X;
 		phdr->p_align = 0;
 
-		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
-		if (!ptr) {
-			dev_err(&rproc->dev,
+		if (segment->dump) {
+			segment->dump(rproc, segment, data + offset);
+		} else {
+			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
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
index e3c5d856b6da..2a93e102d2ad 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -399,6 +399,9 @@ enum rproc_crash_type {
  * @node:	list node related to the rproc segment list
  * @da:		device address of the segment
  * @size:	size of the segment
+ * @priv:	private data associated with the dump_segment
+ * @dump:	custom dump function to fill device memory segment associated
+ *		with coredump
  */
 struct rproc_dump_segment {
 	struct list_head node;
@@ -406,6 +409,9 @@ struct rproc_dump_segment {
 	dma_addr_t da;
 	size_t size;
 
+	void *priv;
+	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
+		     void *dest);
 	loff_t offset;
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
