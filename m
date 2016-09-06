Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 3/3] remoteproc: core: add rproc ops for memory allocation
Date: Tue, 6 Sep 2016 09:39:44 +0200
Message-ID: <1473147584-13183-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc core is currently using dma_alloc_coherent for
carveout and vring allocation.
It doesn't allow to support specific use cases like fixed memory
region or internal RAM support.

Two new rproc ops (alloc and free) is added to provide flexibility
to platform implementation to provide specific memory allocator
taking into account coprocessor characteristics.
rproc_handle_carveout and rproc_alloc_vring functions are modified
to invoke these ops if present, and fallback to regular processing
if platform specific allocation failed and if resquested memory is
not fixed (physical address == FW_RSC_ADDR_ANY)

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++++++++++------
 include/linux/remoteproc.h           |  4 +++
 2 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0d3c191..7493b08 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -207,19 +207,29 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	struct rproc_vring *rvring = &rvdev->vring[i];
 	struct fw_rsc_vdev *rsc;
 	dma_addr_t dma;
-	void *va;
+	void *va = NULL;
 	int ret, size, notifyid;
 
 	/* actual size of vring (in bytes) */
 	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
 
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+
 	/*
 	 * Allocate non-cacheable memory for the vring. In the future
 	 * this call will also configure the IOMMU for us
 	 */
-	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
+
+	dma = rsc->vring[i].pa;
+
+	if (rproc->ops->alloc)
+		va = rproc->ops->alloc(rproc, size, &dma);
+
+	if (!va && rsc->vring[i].pa == FW_RSC_ADDR_ANY)
+		va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
+
 	if (!va) {
-		dev_err(dev->parent, "dma_alloc_coherent failed\n");
+		dev_err(dev->parent, "Failed to get valid ving[%d] va\n", i);
 		return -EINVAL;
 	}
 
@@ -231,7 +241,10 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(dev, "idr_alloc failed: %d\n", ret);
-		dma_free_coherent(dev->parent, size, va, dma);
+		if (rproc->ops->free)
+			ret = rproc->ops->free(rproc, size, va, dma);
+		if (!ret)
+			dma_free_coherent(dev->parent, size, va, dma);
 		return ret;
 	}
 	notifyid = ret;
@@ -249,8 +262,8 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	 * set up the iommu. In this case the device address (da) will
 	 * hold the physical address and not the device address.
 	 */
-	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
 	rsc->vring[i].da = dma;
+	rsc->vring[i].pa = dma;
 	rsc->vring[i].notifyid = notifyid;
 	return 0;
 }
@@ -273,6 +286,15 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 		return -EINVAL;
 	}
 
+	/*
+	 * pa field was previously reserved and fixed to 0
+	 * used FW_RSC_ADDR_ANY as default value if 0 detected
+	 * to keep backward compatibility and have vring allocated
+	 * by dma_alloc_coherent
+	 */
+	if (vring->pa == 0)
+		vring->pa = FW_RSC_ADDR_ANY;
+
 	rvring->len = vring->num;
 	rvring->align = vring->align;
 	rvring->rvdev = rvdev;
@@ -286,8 +308,15 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	struct rproc *rproc = rvring->rvdev->rproc;
 	int idx = rvring->rvdev->vring - rvring;
 	struct fw_rsc_vdev *rsc;
+	int ret = 0;
+
+	if (rproc->ops->free)
+		ret = rproc->ops->free(rproc, size, rvring->va, rvring->dma);
+
+	if (!ret)
+		dma_free_coherent(rproc->dev.parent, size, rvring->va,
+				  rvring->dma);
 
-	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
 	/* reset resource entry info */
@@ -558,7 +587,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	struct rproc_mem_entry *carveout, *mapping;
 	struct device *dev = &rproc->dev;
 	dma_addr_t dma;
-	void *va;
+	void *va = NULL;
 	int ret;
 
 	if (sizeof(*rsc) > avail) {
@@ -579,7 +608,15 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	if (!carveout)
 		return -ENOMEM;
 
-	va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
+	dma = rsc->pa;
+	/* first try platform-specific allocator */
+	if (rproc->ops->alloc)
+		va = rproc->ops->alloc(rproc, rsc->len, &dma);
+
+	/* use standad method only if region not fixed */
+	if (!va && rsc->pa == FW_RSC_ADDR_ANY)
+		va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
+
 	if (!va) {
 		dev_err(dev->parent,
 			"failed to allocate dma memory: len 0x%x\n", rsc->len);
@@ -667,7 +704,10 @@ static int rproc_handle_carveout(struct rproc *rproc,
 free_mapping:
 	kfree(mapping);
 dma_free:
-	dma_free_coherent(dev->parent, rsc->len, va, dma);
+	if (rproc->ops->free)
+		ret = rproc->ops->free(rproc, rsc->len, va, dma);
+	if (!ret)
+		dma_free_coherent(dev->parent, rsc->len, va, dma);
 free_carv:
 	kfree(carveout);
 	return ret;
@@ -748,6 +788,7 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_vdev *rvdev, *rvtmp;
 	struct device *dev = &rproc->dev;
+	int ret = 0;
 
 	/* clean up debugfs trace entries */
 	list_for_each_entry_safe(entry, tmp, &rproc->traces, node) {
@@ -774,8 +815,12 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	/* clean up carveout allocations */
 	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
-		dma_free_coherent(dev->parent, entry->len, entry->va,
-				  entry->dma);
+		if (rproc->ops->free)
+			ret = rproc->ops->free(rproc, entry->len, entry->va,
+					       entry->dma);
+		if (!ret)
+			dma_free_coherent(dev->parent, entry->len, entry->va,
+					  entry->dma);
 		list_del(&entry->node);
 		kfree(entry);
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index c321eab..b2f8227 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -331,12 +331,16 @@ struct rproc;
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @alloc:	alloc requested memory chunck
+ * @free:	release specified memory chunck
  */
 struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
+	void * (*alloc)(struct rproc *rproc, int size, dma_addr_t *dma_handle);
+	int (*free)(struct rproc *rproc, size_t size, void *cpu_addr, dma_addr_t dma_handle);
 };
 
 /**
-- 
1.9.1
