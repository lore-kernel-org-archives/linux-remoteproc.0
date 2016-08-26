Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 2/2] remoteproc: core: Add fixed memory region support
Date: Fri, 26 Aug 2016 22:19:55 +0200
Message-ID: <1472242795-23970-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
References: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Some coprocessors request fixed memory mapping for firmware execution
and associated communication linked.
Memory resources are defined in firmware resource table.
Resource address different from 0x0 and 0xFFFFFFFF is considered as predefined
and already reserved at system level.
In that case, remoteproc core doesn't need to perform any allocation.
Memory region access can be managed using memremap/memunmap functions

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 61 ++++++++++++++++++++++++++----------
 include/linux/remoteproc.h           |  4 +++
 2 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 18f4286..0ddbb92 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -213,13 +213,25 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	/* actual size of vring (in bytes) */
 	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
 
-	/*
-	 * Allocate non-cacheable memory for the vring. In the future
-	 * this call will also configure the IOMMU for us
-	 */
-	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+
+	/* check if specific memory region requested by firmware */
+	if (rsc->vring[i].da != 0 && rsc->vring[i].da != FW_RSC_ADDR_ANY) {
+		va = memremap(rsc->vring[i].da, size, MEMREMAP_WC);
+		rvring->dma = rsc->vring[i].da;
+		rvring->memmap = true;
+	} else {
+		/*
+		 * Allocate non-cacheable memory for the vring. In the future
+		 * this call will also configure the IOMMU for us
+		 */
+		va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
+		rvring->dma = dma;
+		rsc->vring[i].da = dma;
+	}
+
 	if (!va) {
-		dev_err(dev->parent, "dma_alloc_coherent failed\n");
+		dev_err(dev->parent, "Failed to get valid ving[%d] va\n", i);
 		return -EINVAL;
 	}
 
@@ -231,7 +243,10 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(dev, "idr_alloc failed: %d\n", ret);
-		dma_free_coherent(dev->parent, size, va, dma);
+		if (rvring->memmap)
+			memunmap(rvring->va);
+		else
+			dma_free_coherent(dev->parent, size, va, dma);
 		return ret;
 	}
 	notifyid = ret;
@@ -240,7 +255,6 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 		i, va, &dma, size, notifyid);
 
 	rvring->va = va;
-	rvring->dma = dma;
 	rvring->notifyid = notifyid;
 
 	/*
@@ -249,8 +263,6 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	 * set up the iommu. In this case the device address (da) will
 	 * hold the physical address and not the device address.
 	 */
-	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
-	rsc->vring[i].da = dma;
 	rsc->vring[i].notifyid = notifyid;
 	return 0;
 }
@@ -293,7 +305,11 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	int idx = rvring->rvdev->vring - rvring;
 	struct fw_rsc_vdev *rsc;
 
-	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
+	if (rvring->memmap)
+		memunmap(rvring->va);
+	else
+		dma_free_coherent(rproc->dev.parent, size, rvring->va,
+				  rvring->dma);
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
 	/* reset resource entry info */
@@ -585,7 +601,15 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	if (!carveout)
 		return -ENOMEM;
 
-	va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
+	/* check if specific memory region requested by firmware */
+	if (rsc->pa != 0 && rsc->pa != FW_RSC_ADDR_ANY) {
+		va = memremap(rsc->pa, rsc->len, MEMREMAP_WC);
+		carveout->memmap = true;
+		dma = rsc->pa;
+	} else {
+		va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
+		rsc->pa = dma;
+	}
 	if (!va) {
 		dev_err(dev->parent,
 			"failed to allocate dma memory: len 0x%x\n", rsc->len);
@@ -659,7 +683,6 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	 * In this case, the device address and the physical address
 	 * are the same.
 	 */
-	rsc->pa = dma;
 
 	carveout->va = va;
 	carveout->len = rsc->len;
@@ -673,7 +696,10 @@ static int rproc_handle_carveout(struct rproc *rproc,
 free_mapping:
 	kfree(mapping);
 dma_free:
-	dma_free_coherent(dev->parent, rsc->len, va, dma);
+	if (carveout->memmap)
+		memunmap(va);
+	else
+		dma_free_coherent(dev->parent, rsc->len, va, dma);
 free_carv:
 	kfree(carveout);
 	return ret;
@@ -780,8 +806,11 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	/* clean up carveout allocations */
 	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
-		dma_free_coherent(dev->parent, entry->len, entry->va,
-				  entry->dma);
+		if (entry->memmap)
+			memunmap(entry->va);
+		else
+			dma_free_coherent(dev->parent, entry->len, entry->va,
+					  entry->dma);
 		list_del(&entry->node);
 		kfree(entry);
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 80e1cba..ff1fb59 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -312,6 +312,7 @@ struct fw_rsc_vdev {
  * @len: length, in bytes
  * @da: device address
  * @priv: associated data
+ * @memmap: true if memory is memremapped
  * @node: list node
  */
 struct rproc_mem_entry {
@@ -320,6 +321,7 @@ struct rproc_mem_entry {
 	int len;
 	u32 da;
 	void *priv;
+	bool memmap;
 	struct list_head node;
 };
 
@@ -458,6 +460,7 @@ struct rproc {
  * @notifyid: rproc-specific unique vring index
  * @rvdev: remote vdev
  * @vq: the virtqueue of this vring
+ * @memmap: true if memory is memremapped
  */
 struct rproc_vring {
 	void *va;
@@ -468,6 +471,7 @@ struct rproc_vring {
 	int notifyid;
 	struct rproc_vdev *rvdev;
 	struct virtqueue *vq;
+	bool memmap;
 };
 
 /**
-- 
1.9.1
