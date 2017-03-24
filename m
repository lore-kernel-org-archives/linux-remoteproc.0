Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 12/19] remoteproc: use rproc_id_rsc for data got from idr_find()
Date: Fri, 24 Mar 2017 12:22:28 -0700
Message-ID: <1490383355-23176-13-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

As not just rproc_vring can have notifyid, rproc uses rproc_id_rsc
for the resource which has notifyid. And thus, the data got from
idr_find() can be something else rather than rproc_vring.
And thus, add the virtio_interrupt() to handle interrupt not
just for vrings, and change the existing vq_interrupt() to call
virtio_interrupt().

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c     |  7 +++---
 drivers/remoteproc/remoteproc_internal.h |  1 +
 drivers/remoteproc/remoteproc_virtio.c   | 42 +++++++++++++++++++++++++++-----
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d711345..ffd1de2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -274,7 +274,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	 * TODO: assign a notifyid for rvdev updates as well
 	 * TODO: support predefined notifyids (via resource table)
 	 */
-	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
+	ret = rproc_idr_alloc(rproc, rvring, RPROC_IDR_VRING, 0, 0);
 	if (ret < 0) {
 		dev_err(dev, "idr_alloc failed: %d\n", ret);
 		dma_free_coherent(dev->parent, size, va, dma);
@@ -337,8 +337,9 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	int idx = rvring->rvdev->vring - rvring;
 	struct fw_rsc_vdev *rsc;
 
-	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
-	idr_remove(&rproc->notifyids, rvring->notifyid);
+	dma_free_coherent(rproc->dev.parent, size, rvring->va,
+				  rvring->dma);
+	rproc_idr_remove(rproc, rvring->notifyid);
 
 	/* reset resource entry info */
 	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 865bd1c..0cfc942 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -72,6 +72,7 @@ struct rproc_fw_ops {
 
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
+irqreturn_t rproc_virtio_interrupt(struct rproc *rproc, int notifyid);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 int rproc_boot_nowait(struct rproc *rproc);
 void rproc_vdev_release(struct kref *ref);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0142cc3..e45e17b 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -43,7 +43,7 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
 }
 
 /**
- * rproc_vq_interrupt() - tell remoteproc that a virtqueue is interrupted
+ * rproc_virtio_interrupt() - tell remoteproc that a vdev is interrupted
  * @rproc: handle to the remote processor
  * @notifyid: index of the signalled virtqueue (unique per this @rproc)
  *
@@ -54,17 +54,47 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
  * Returns IRQ_NONE if no message was found in the @notifyid virtqueue,
  * and otherwise returns IRQ_HANDLED.
  */
-irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
+irqreturn_t rproc_virtio_interrupt(struct rproc *rproc, int notifyid)
 {
+	struct rproc_id_rsc *rsc;
 	struct rproc_vring *rvring;
 
-	dev_dbg(&rproc->dev, "vq index %d is interrupted\n", notifyid);
+	dev_dbg(&rproc->dev, "virtio index %d is interrupted\n", notifyid);
+
+	rsc = idr_find(&rproc->notifyids, notifyid);
+	if (!rsc || !rsc->rsc_ptr)
+		return IRQ_NONE;
 
-	rvring = idr_find(&rproc->notifyids, notifyid);
-	if (!rvring || !rvring->vq)
+	if (rsc->rsc_type == RPROC_IDR_VRING) {
+		rvring = rsc->rsc_ptr;
+		if (!rvring->vq)
+			return IRQ_NONE;
+		return vring_interrupt(0, rvring->vq);
+	} else if (rsc->rsc_type == RPROC_IDR_VDEV) {
+		dev_info(&rproc->dev, "vdev intr is not supported yet.\n");
 		return IRQ_NONE;
+	}
 
-	return vring_interrupt(0, rvring->vq);
+	dev_err(&rproc->dev, "Unknown rsc type: 0x%x\n", rsc->rsc_type);
+	return IRQ_NONE;
+}
+EXPORT_SYMBOL(rproc_virtio_interrupt);
+
+/**
+ * rproc_vq_interrupt() - tell remoteproc that a virtqueue is interrupted
+ * @rproc: handle to the remote processor
+ * @notifyid: index of the signalled virtqueue (unique per this @rproc)
+ *
+ * This function should be called by the platform-specific rproc driver,
+ * when the remote processor signals that a specific virtqueue has pending
+ * messages available.
+ *
+ * Returns IRQ_NONE if no message was found in the @notifyid virtqueue,
+ * and otherwise returns IRQ_HANDLED.
+ */
+irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
+{
+	return rproc_virtio_interrupt(rproc, notifyid);
 }
 EXPORT_SYMBOL(rproc_vq_interrupt);
 
-- 
1.9.1
