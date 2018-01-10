Return-Path: <anup@brainfault.org>
Return-Path: <anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Subject: [PATCH RESEND] rpmsg: virtio_rpmsg_bus: fix rpmsg_probe() for virtio-mmio transport
Date: Wed, 10 Jan 2018 18:46:57 +0530
Message-Id: <1515590217-24256-1-git-send-email-anup@brainfault.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

When virtio-rpmsg device is provided via virtio-mmio transport, the
dma_alloc_coherent() (called by rpmsg_probe()) fails on ARM/ARM64
systems because "vdev->dev.parent->parent" device is used as parameter
to dma_alloc_coherent().

The "vdev->dev.parent->parent" device represents underlying remoteproc
platform device when virtio-rpmsg device is provided via virtio-remoteproc
transport. When virtio-rpmsg device is provided via virtio-mmio transport,
the "vdev->dev.parent->parent" device represents the parent device of
virtio-mmio platform device and dma_alloc_coherent() fails for this device
because generally there is no corresponding platform device and dma_ops
are not setup for "vdev->dev.parent->parent".

This patch fixes dma_alloc_coherent() usage in rpmsg_probe() by trying
dma_alloc_coherent() with "vdev->dev.parent" device when it fails with
"vdev->dev.parent->parent" device.

Fixes: b5ab5e24e960 ("remoteproc: maintain a generic child device for
each rproc")

Signed-off-by: Anup Patel <anup@brainfault.org>
Cc: stable@vger.kernel.org
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 82b8300..7f8710a 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -64,6 +64,7 @@
 struct virtproc_info {
 	struct virtio_device *vdev;
 	struct virtqueue *rvq, *svq;
+	struct device *bufs_dev;
 	void *rbufs, *sbufs;
 	unsigned int num_bufs;
 	unsigned int buf_size;
@@ -924,9 +925,16 @@ static int rpmsg_probe(struct virtio_device *vdev)
 				     total_buf_space, &vrp->bufs_dma,
 				     GFP_KERNEL);
 	if (!bufs_va) {
-		err = -ENOMEM;
-		goto vqs_del;
-	}
+		bufs_va = dma_alloc_coherent(vdev->dev.parent,
+					     total_buf_space, &vrp->bufs_dma,
+					     GFP_KERNEL);
+		if (!bufs_va) {
+			err = -ENOMEM;
+			goto vqs_del;
+		} else
+			vrp->bufs_dev = vdev->dev.parent;
+	} else
+		vrp->bufs_dev = vdev->dev.parent->parent;
 
 	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
 		bufs_va, &vrp->bufs_dma);
@@ -988,7 +996,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	return 0;
 
 free_coherent:
-	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
+	dma_free_coherent(vrp->bufs_dev, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
 	vdev->config->del_vqs(vrp->vdev);
@@ -1023,7 +1031,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
 
 	vdev->config->del_vqs(vrp->vdev);
 
-	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
+	dma_free_coherent(vrp->bufs_dev, total_buf_space,
 			  vrp->rbufs, vrp->bufs_dma);
 
 	kfree(vrp);
-- 
2.7.4
