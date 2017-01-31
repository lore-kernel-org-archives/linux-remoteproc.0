Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 5/6] rpmsg: virtio_rpmsg: don't allocate buffer if provided by low level driver
Date: Tue, 31 Jan 2017 13:51:36 +0100
Message-ID: <1485867097-6960-6-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485867097-6960-1-git-send-email-loic.pallardy@st.com>
References: <1485867097-6960-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Low level platform specific driver has the knowledge of the different
communication link constraints like fixed or secured memory region to
use for buffer allocation.

If virtual address is defined in virtio_rpmsg_cfg structure, a dedicated
memory pool buffer fitting platform requirements is available.
Rpmsg virtio layer should rely on it if its size is compliant with link
characteristics.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
Changes since V1:
- Alignment with open parenthesis.
- Add vrp->bufs_dma intialization in virtio_rpmsg_get_config function
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 55 +++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 080ee07..7c89210 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -57,6 +57,7 @@
  * @sendq:	wait queue of sending contexts waiting for a tx buffers
  * @sleepers:	number of senders that are waiting for a tx buffer
  * @ns_ept:	the bus's name service endpoint
+ * @ext_buffer: buffer allocated by low level driver
  *
  * This structure stores the rpmsg state of a given virtio remote processor
  * device (there might be several virtio proc devices for each physical
@@ -76,6 +77,7 @@ struct virtproc_info {
 	wait_queue_head_t sendq;
 	atomic_t sleepers;
 	struct rpmsg_endpoint *ns_ept;
+	bool ext_buffer;
 };
 
 /* The feature bitmap for virtio rpmsg */
@@ -893,6 +895,7 @@ static int virtio_rpmsg_get_config(struct virtio_device *vdev)
 			ret = -EINVAL;
 			goto out;
 		}
+		vrp->bufs_dma = virtio_cfg.pa;
 
 		/* Check rpmsg buffer length */
 		total_buf_space = vrp->num_bufs * vrp->buf_size;
@@ -903,6 +906,17 @@ static int virtio_rpmsg_get_config(struct virtio_device *vdev)
 			ret = -ENOMEM;
 			goto out;
 		}
+
+		/* Level platform specific buffer driver ? */
+		if (virtio_cfg.va != -1) {
+			vrp->ext_buffer = true;
+			/* half of the buffers is dedicated for RX */
+			vrp->rbufs = (void *)(uintptr_t)virtio_cfg.va;
+
+			/* and half is dedicated for TX */
+			vrp->sbufs = (void *)(uintptr_t)virtio_cfg.va + total_buf_space / 2;
+		}
+
 		return !ret;
 	}
 out:
@@ -958,25 +972,28 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	if (err < 0)
 		goto free_vrp;
 
-	total_buf_space = vrp->num_bufs * vrp->buf_size;
+	/* Allocate buffer if none provided by low level platform driver */
+	if (!vrp->ext_buffer) {
+		total_buf_space = vrp->num_bufs * vrp->buf_size;
 
 	/* allocate coherent memory for the buffers */
-	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
-				     total_buf_space, &vrp->bufs_dma,
-				     GFP_KERNEL);
-	if (!bufs_va) {
-		err = -ENOMEM;
-		goto vqs_del;
-	}
+		bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
+					     total_buf_space, &vrp->bufs_dma,
+					     GFP_KERNEL);
+		if (!bufs_va) {
+			err = -ENOMEM;
+			goto vqs_del;
+		}
 
-	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
-		bufs_va, &vrp->bufs_dma);
+		dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
+			bufs_va, &vrp->bufs_dma);
 
-	/* half of the buffers is dedicated for RX */
-	vrp->rbufs = bufs_va;
+		/* half of the buffers is dedicated for RX */
+		vrp->rbufs = bufs_va;
 
-	/* and half is dedicated for TX */
-	vrp->sbufs = bufs_va + total_buf_space / 2;
+		/* and half is dedicated for TX */
+		vrp->sbufs = bufs_va + total_buf_space / 2;
+	}
 
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_bufs / 2; i++) {
@@ -1027,8 +1044,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	return 0;
 
 free_coherent:
-	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
-			  bufs_va, vrp->bufs_dma);
+	if (!vrp->ext_buffer)
+		dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
+				  bufs_va, vrp->bufs_dma);
 vqs_del:
 	vdev->config->del_vqs(vrp->vdev);
 free_vrp:
@@ -1062,8 +1080,9 @@ static void rpmsg_remove(struct virtio_device *vdev)
 
 	vdev->config->del_vqs(vrp->vdev);
 
-	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
-			  vrp->rbufs, vrp->bufs_dma);
+	if (!vrp->ext_buffer)
+		dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
+				  vrp->rbufs, vrp->bufs_dma);
 
 	kfree(vrp);
 }
-- 
1.9.1
