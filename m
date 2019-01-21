Return-Path: <pihsun@chromium.org>
Return-Path: <pihsun@chromium.org>
From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [PATCH 1/2] remoteproc: Add __iomem to return of rproc_da_to_va.
Date: Mon, 21 Jan 2019 15:34:07 +0800
Message-Id: <20190121073408.56557-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The return value of rproc_da_to_va would probably be device memory. Add
__iomem annotation to it.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
I feel that there might be more things that need to be changed
(especially for the carveouts things). I didn't change them since I
don't know how to test that part. Comments needed.
---
 drivers/remoteproc/remoteproc_core.c     | 4 ++--
 drivers/remoteproc/remoteproc_internal.h | 2 +-
 include/linux/remoteproc.h               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 54ec38fc5dca62..7cb8393e1b39f6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -190,10 +190,10 @@ static phys_addr_t rproc_va_to_pa(void *cpu_addr)
  * here the output of the DMA API for the carveouts, which should be more
  * correct.
  */
-void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+void __iomem *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 {
 	struct rproc_mem_entry *carveout;
-	void *ptr = NULL;
+	void __iomem *ptr = NULL;
 
 	if (rproc->ops->da_to_va) {
 		ptr = rproc->ops->da_to_va(rproc, da, len);
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f6cad243d7cac9..df7abe049cdef2 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -51,7 +51,7 @@ void rproc_exit_sysfs(void);
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
-void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
+void __iomem *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
 int rproc_trigger_recovery(struct rproc *rproc);
 
 int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 68e72f33c705e1..065a68a5e6e577 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -356,7 +356,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
+	void __iomem *(*da_to_va)(struct rproc *rproc, u64 da, int len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	struct resource_table *(*find_loaded_rsc_table)(
 				struct rproc *rproc, const struct firmware *fw);
-- 
2.20.1.321.g9e740568ce-goog
