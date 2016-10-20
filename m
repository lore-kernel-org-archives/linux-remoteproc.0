Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 05/11] remoteproc: Assign kref to rproc_vdev
Date: Wed, 19 Oct 2016 19:40:06 -0700
Message-Id: <1476931212-1806-6-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

No functional change

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     | 10 ++++++++++
 drivers/remoteproc/remoteproc_internal.h |  1 +
 drivers/remoteproc/remoteproc_virtio.c   | 10 ++++++----
 include/linux/remoteproc.h               |  3 +++
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4309996f4335..c978907498d0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -356,6 +356,8 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	if (!rvdev)
 		return -ENOMEM;
 
+	kref_init(&rvdev->refcount);
+
 	rvdev->rproc = rproc;
 
 	/* parse the vrings */
@@ -384,6 +386,14 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	return ret;
 }
 
+void rproc_vdev_release(struct kref *ref)
+{
+	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
+
+	list_del(&rvdev->node);
+	kfree(rvdev);
+}
+
 /**
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 4cf93ca2816e..fe5a570b6c2b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -49,6 +49,7 @@ struct rproc_fw_ops {
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 int rproc_boot_nowait(struct rproc *rproc);
+void rproc_vdev_release(struct kref *ref);
 
 /* from remoteproc_virtio.c */
 int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 01870a16d6d2..0d1ad3ed149d 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -282,14 +282,13 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
  * Never call this function directly; it will be called by the driver
  * core when needed.
  */
-static void rproc_vdev_release(struct device *dev)
+static void rproc_virtio_dev_release(struct device *dev)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 	struct rproc *rproc = vdev_to_rproc(vdev);
 
-	list_del(&rvdev->node);
-	kfree(rvdev);
+	kref_put(&rvdev->refcount, rproc_vdev_release);
 
 	put_device(&rproc->dev);
 }
@@ -313,7 +312,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	vdev->id.device	= id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
-	vdev->dev.release = rproc_vdev_release;
+	vdev->dev.release = rproc_virtio_dev_release;
 
 	/*
 	 * We're indirectly making a non-temporary copy of the rproc pointer
@@ -325,6 +324,9 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	 */
 	get_device(&rproc->dev);
 
+	/* Reference the vdev and vring allocations */
+	kref_get(&rvdev->refcount);
+
 	ret = register_virtio_device(vdev);
 	if (ret) {
 		put_device(&rproc->dev);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a05f4569a2a0..dbcd967dd2e7 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -487,6 +487,7 @@ struct rproc_vring {
 
 /**
  * struct rproc_vdev - remoteproc state for a supported virtio device
+ * @refcount: reference counter for the vdev and vring allocations
  * @node: list node
  * @rproc: the rproc handle
  * @vdev: the virio device
@@ -494,6 +495,8 @@ struct rproc_vring {
  * @rsc_offset: offset of the vdev's resource entry
  */
 struct rproc_vdev {
+	struct kref refcount;
+
 	struct list_head node;
 	struct rproc *rproc;
 	struct virtio_device vdev;
-- 
2.5.0
