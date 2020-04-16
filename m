Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 08/18] remoteproc: Externalize carveout functions
Date: Thu, 16 Apr 2020 18:13:21 +0200
Message-ID: <20200416161331.7606-9-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

The carveout functions are also used for the vring memories.
Externalize related functions to prepare migration of
the vring management in rproc virtio.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 18 +++++++-----------
 drivers/remoteproc/remoteproc_internal.h |  4 ++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index cb40aae12b98..ac57cd8016be 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -51,11 +51,6 @@ static LIST_HEAD(rproc_list);
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
 				 void *, int offset, int avail);
 
-static int rproc_alloc_carveout(struct rproc *rproc,
-				struct rproc_mem_entry *mem);
-static int rproc_release_carveout(struct rproc *rproc,
-				  struct rproc_mem_entry *mem);
-
 /* Unique indices for remoteproc devices */
 static DEFINE_IDA(rproc_dev_index);
 
@@ -281,8 +276,8 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...)
  *
  * Return: 0 if carveout matches request else error
  */
-static int rproc_check_carveout_da(struct rproc *rproc,
-				   struct rproc_mem_entry *mem, u32 da, u32 len)
+int rproc_check_carveout_da(struct rproc *rproc,
+			    struct rproc_mem_entry *mem, u32 da, u32 len)
 {
 	struct device *dev = &rproc->dev;
 	int delta;
@@ -315,6 +310,7 @@ static int rproc_check_carveout_da(struct rproc *rproc,
 
 	return 0;
 }
+EXPORT_SYMBOL(rproc_check_carveout_da);
 
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 {
@@ -695,8 +691,7 @@ static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
  * This function allocate specified memory entry @mem using
  * dma_alloc_coherent() as default allocator
  */
-static int rproc_alloc_carveout(struct rproc *rproc,
-				struct rproc_mem_entry *mem)
+int rproc_alloc_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
 {
 	struct rproc_mem_entry *mapping = NULL;
 	struct device *dev = &rproc->dev;
@@ -791,6 +786,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 	dma_free_coherent(dev->parent, mem->len, va, dma);
 	return ret;
 }
+EXPORT_SYMBOL(rproc_alloc_carveout);
 
 /**
  * rproc_release_carveout() - release acquired carveout
@@ -800,8 +796,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
  * This function releases specified memory entry @mem allocated via
  * rproc_alloc_carveout() function by @rproc.
  */
-static int rproc_release_carveout(struct rproc *rproc,
-				  struct rproc_mem_entry *mem)
+int rproc_release_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
 {
 	struct device *dev = &rproc->dev;
 
@@ -809,6 +804,7 @@ static int rproc_release_carveout(struct rproc *rproc,
 	dma_free_coherent(dev->parent, mem->len, mem->va, mem->dma);
 	return 0;
 }
+EXPORT_SYMBOL(rproc_release_carveout);
 
 /**
  * rproc_handle_carveout() - handle phys contig memory allocation requests
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f5eaffac2fcd..f230296908ac 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -71,6 +71,10 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 						       const struct firmware *fw);
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
+int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,
+			    u32 da, u32 len);
+int rproc_alloc_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
+int rproc_release_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
 
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
-- 
2.17.1
