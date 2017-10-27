Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 6/7] remoteproc: modify vring allocation to support preallocated region
Date: Fri, 27 Oct 2017 14:44:13 +0200
Message-ID: <1509108254-22296-7-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1509108254-22296-1-git-send-email-loic.pallardy@st.com>
References: <1509108254-22296-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Current version of rproc_alloc_vring function supports only dynamic vring
allocation.
This patch extends rproc_alloc_vring to verify if requested vring DA is
already part or not of a registered carveout. If true, nothing to do, else
just allocate vring as before.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 50 +++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 515a17a..e1dbe65 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -263,21 +263,41 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	struct device *dev = &rproc->dev;
 	struct rproc_vring *rvring = &rvdev->vring[i];
 	struct fw_rsc_vdev *rsc;
-	dma_addr_t dma;
+	dma_addr_t dma = 0;
 	void *va;
 	int ret, size, notifyid;
 
 	/* actual size of vring (in bytes) */
 	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
 
-	/*
-	 * Allocate non-cacheable memory for the vring. In the future
-	 * this call will also configure the IOMMU for us
-	 */
-	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
-	if (!va) {
-		dev_err(dev->parent, "dma_alloc_coherent failed\n");
-		return -EINVAL;
+	/* get vring resource table pointer */
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+
+	if (rsc->vring[i].da != FW_RSC_ADDR_ANY) {
+		va = rproc_find_carveout_by_da(rproc, rsc->vring[i].da, size);
+
+		if (!va) {
+			/* No region not found */
+			dev_err(dev->parent, "Pre-allocated vring not found\n");
+			return -ENOMEM;
+		}
+	} else {
+		/*
+		 * Allocate non-cacheable memory for the vring. In the future
+		 * this call will also configure the IOMMU for us
+		 */
+		va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
+		if (!va) {
+			dev_err(dev->parent, "dma_alloc_coherent failed\n");
+			return -EINVAL;
+		}
+		/*
+		 * Let the rproc know the da of this vring.
+		 * Not all platforms use dma_alloc_coherent to automatically
+		 * set up the iommu. In this case the device address (da) will
+		 * hold the physical address and not the device address.
+		 */
+		rsc->vring[i].da = dma;
 	}
 
 	/*
@@ -304,14 +324,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	rvring->dma = dma;
 	rvring->notifyid = notifyid;
 
-	/*
-	 * Let the rproc know the notifyid and da of this vring.
-	 * Not all platforms use dma_alloc_coherent to automatically
-	 * set up the iommu. In this case the device address (da) will
-	 * hold the physical address and not the device address.
-	 */
-	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
-	rsc->vring[i].da = dma;
+	/* Let the rproc know the notifyid of this vring. */
 	rsc->vring[i].notifyid = notifyid;
 	return 0;
 }
@@ -348,7 +361,8 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	int idx = rvring->rvdev->vring - rvring;
 	struct fw_rsc_vdev *rsc;
 
-	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
+	if (rvring->dma)
+		dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
 	/* reset resource entry info */
-- 
1.9.1
