Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 08/11] remoteproc: Decouple vdev resources and devices
Date: Wed, 19 Oct 2016 19:40:09 -0700
Message-Id: <1476931212-1806-9-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Represent the virtio device part of the vdev resources as remoteproc
subdevices to finalize the decoupling of the virtio resource and device
handling.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 35 ++++++++++++++++++++---------------
 include/linux/remoteproc.h           |  5 +++++
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1d2f4b2dd05d..c242ca016496 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -296,6 +296,20 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	rsc->vring[idx].notifyid = -1;
 }
 
+static int rproc_vdev_do_probe(struct rproc_subdev *subdev)
+{
+	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
+
+	return rproc_add_virtio_dev(rvdev, rvdev->id);
+}
+
+static void rproc_vdev_do_remove(struct rproc_subdev *subdev)
+{
+	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
+
+	rproc_remove_virtio_dev(rvdev);
+}
+
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -358,6 +372,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	kref_init(&rvdev->refcount);
 
+	rvdev->id = rsc->id;
 	rvdev->rproc = rproc;
 
 	/* parse the vrings */
@@ -382,18 +397,14 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	list_add_tail(&rvdev->node, &rproc->rvdevs);
 
-	/* it is now safe to add the virtio device */
-	ret = rproc_add_virtio_dev(rvdev, rsc->id);
-	if (ret)
-		goto remove_rvdev;
+	rproc_add_subdev(rproc, &rvdev->subdev,
+			 rproc_vdev_do_probe, rproc_vdev_do_remove);
 
 	return 0;
 
 unwind_vring_allocations:
 	for (i--; i >= 0; i--)
 		rproc_free_vring(&rvdev->vring[i]);
-remove_rvdev:
-	list_del(&rvdev->node);
 free_rvdev:
 	kfree(rvdev);
 	return ret;
@@ -403,6 +414,7 @@ void rproc_vdev_release(struct kref *ref)
 {
 	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
 	struct rproc_vring *rvring;
+	struct rproc *rproc = rvdev->rproc;
 	int id;
 
 	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
@@ -413,6 +425,7 @@ void rproc_vdev_release(struct kref *ref)
 		rproc_free_vring(rvring);
 	}
 
+	rproc_remove_subdev(rproc, &rvdev->subdev);
 	list_del(&rvdev->node);
 	kfree(rvdev);
 }
@@ -842,10 +855,8 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 	}
 
 	/* clean up remote vdev entries */
-	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node) {
-		rproc_remove_virtio_dev(rvdev);
+	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
 		kref_put(&rvdev->refcount, rproc_vdev_release);
-	}
 }
 
 /*
@@ -1505,8 +1516,6 @@ EXPORT_SYMBOL(rproc_put);
  */
 int rproc_del(struct rproc *rproc)
 {
-	struct rproc_vdev *rvdev, *tmp;
-
 	if (!rproc)
 		return -EINVAL;
 
@@ -1518,10 +1527,6 @@ int rproc_del(struct rproc *rproc)
 	if (rproc->auto_boot)
 		rproc_shutdown(rproc);
 
-	/* clean up remote vdev entries */
-	list_for_each_entry_safe(rvdev, tmp, &rproc->rvdevs, node)
-		rproc_remove_virtio_dev(rvdev);
-
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
 	list_del(&rproc->node);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index dbcd967dd2e7..ff05b88730ad 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -488,6 +488,8 @@ struct rproc_vring {
 /**
  * struct rproc_vdev - remoteproc state for a supported virtio device
  * @refcount: reference counter for the vdev and vring allocations
+ * @subdev: handle for registering the vdev as a rproc subdevice
+ * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
  * @rproc: the rproc handle
  * @vdev: the virio device
@@ -497,6 +499,9 @@ struct rproc_vring {
 struct rproc_vdev {
 	struct kref refcount;
 
+	struct rproc_subdev subdev;
+
+	unsigned int id;
 	struct list_head node;
 	struct rproc *rproc;
 	struct virtio_device vdev;
-- 
2.5.0
