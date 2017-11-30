Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 12/16] remoteproc: look-up memory-device for vring allocation
Date: Thu, 30 Nov 2017 17:46:47 +0100
Message-ID: <1512060411-729-13-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch parse existing carveout list to find a memory area
matching on name.

Naming rule for search is the following one:
- "vdev<vdev_id>vring<vring_id>" to find a memory pool dedicated to
one vring belonging to one specific vdev (vdev_id).
- "vdev<vdev_id>vrings> to find common memory pool for allocation of
all vrings belonging to one specific vdev (vdev_id).

This allows to cover different SoC requirements like allocating vrings
at best location taking into account access performance in read and
write for master and slave processors.

If memory area found, memory device will be used as device for vring
allocation, else rproc platform device will be used as today.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++--
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8d990b1..6b5e2b2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -410,8 +410,11 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	struct rproc_vring *rvring = &rvdev->vring[i];
 	struct fw_rsc_vdev *rsc;
 	dma_addr_t dma = -1;
+	struct device *memdev = dev->parent;
+	struct rproc_mem_entry *carveout;
 	void *va;
 	int ret, size, notifyid;
+	char name[16];
 
 	/* actual size of vring (in bytes) */
 	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
@@ -428,11 +431,27 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 			return -ENOMEM;
 		}
 	} else {
+		/* Find any carveout matching vring */
+		/* Try dedicated vdev j vring i pool. */
+		snprintf(name, sizeof(name), "vdev%dvring%d", rvdev->index, i);
+		carveout = rproc_find_carveout_by_name(rproc, name);
+
+		if (!carveout) {
+			/* Try dedicated vdev j vrings pool. */
+			snprintf(name, sizeof(name), "vdev%dvring", rvdev->index);
+			carveout = rproc_find_carveout_by_name(rproc, name);
+		}
+
+		if (carveout && carveout->memdev)
+			memdev = &carveout->memdev->dev;
+
+		rvring->dev = memdev;
+
 		/*
 		 * Allocate non-cacheable memory for the vring. In the future
 		 * this call will also configure the IOMMU for us
 		 */
-		va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
+		va = dma_alloc_coherent(memdev, size, &dma, GFP_KERNEL);
 		if (!va) {
 			dev_err(dev->parent, "dma_alloc_coherent failed\n");
 			return -EINVAL;
@@ -455,7 +474,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	if (ret < 0) {
 		dev_err(dev, "idr_alloc failed: %d\n", ret);
 		if (dma != -1)
-			dma_free_coherent(dev->parent, size, va, dma);
+			dma_free_coherent(memdev, size, va, dma);
 		return ret;
 	}
 	notifyid = ret;
@@ -565,6 +584,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
 	int i, ret;
+	static int index;
 
 	/* make sure resource isn't truncated */
 	if (sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct fw_rsc_vdev_vring)
@@ -596,6 +616,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	rvdev->id = rsc->id;
 	rvdev->rproc = rproc;
+	rvdev->index = index++;
 
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d7e7485..fb293d3 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -480,6 +480,7 @@ struct rproc_subdev {
  * @vq: the virtqueue of this vring
  */
 struct rproc_vring {
+	struct device *dev;
 	void *va;
 	dma_addr_t dma;
 	int len;
@@ -507,6 +508,7 @@ struct rproc_vdev {
 	struct rproc_subdev subdev;
 
 	unsigned int id;
+	unsigned int index;
 	struct list_head node;
 	struct rproc *rproc;
 	struct virtio_device vdev;
-- 
1.9.1
