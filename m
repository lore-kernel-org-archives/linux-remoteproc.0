Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 06/11] remoteproc: virtio: Anchor vring life cycle in vdev
Date: Wed, 19 Oct 2016 19:40:07 -0700
Message-Id: <1476931212-1806-7-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Instead of having the vrings being allocated and freed as they are
requested by the virtio device tie their life cycle to the vdev
resource. This allows us to decouple the vdev resource management from
the virtio device management.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c   | 20 ++++++++++++++++++++
 drivers/remoteproc/remoteproc_virtio.c |  7 +------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c978907498d0..e4509c8dd8e8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -370,6 +370,13 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	/* remember the resource offset*/
 	rvdev->rsc_offset = offset;
 
+	/* allocate the vring resources */
+	for (i = 0; i < rsc->num_of_vrings; i++) {
+		ret = rproc_alloc_vring(rvdev, i);
+		if (ret)
+			goto unwind_vring_allocations;
+	}
+
 	list_add_tail(&rvdev->node, &rproc->rvdevs);
 
 	/* it is now safe to add the virtio device */
@@ -379,6 +386,9 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	return 0;
 
+unwind_vring_allocations:
+	for (i--; i >= 0; i--)
+		rproc_free_vring(&rvdev->vring[i]);
 remove_rvdev:
 	list_del(&rvdev->node);
 free_rvdev:
@@ -389,6 +399,16 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 void rproc_vdev_release(struct kref *ref)
 {
 	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
+	struct rproc_vring *rvring;
+	int id;
+
+	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+		rvring = &rvdev->vring[id];
+		if (!rvring->va)
+			continue;
+
+		rproc_free_vring(rvring);
+	}
 
 	list_del(&rvdev->node);
 	kfree(rvdev);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0d1ad3ed149d..364411fb7734 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -79,7 +79,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	struct rproc_vring *rvring;
 	struct virtqueue *vq;
 	void *addr;
-	int len, size, ret;
+	int len, size;
 
 	/* we're temporarily limited to two virtqueues per rvdev */
 	if (id >= ARRAY_SIZE(rvdev->vring))
@@ -88,10 +88,6 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	if (!name)
 		return NULL;
 
-	ret = rproc_alloc_vring(rvdev, id);
-	if (ret)
-		return ERR_PTR(ret);
-
 	rvring = &rvdev->vring[id];
 	addr = rvring->va;
 	len = rvring->len;
@@ -130,7 +126,6 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
 		rvring = vq->priv;
 		rvring->vq = NULL;
 		vring_del_virtqueue(vq);
-		rproc_free_vring(rvring);
 	}
 }
 
-- 
2.5.0
