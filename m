Return-Path: <michele.rodolfi@t3lab.it>
Return-Path: <michele.rodolfi@t3lab.it>
Date: Fri, 26 Aug 2016 13:28:52 +0200
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Subject: [PATCH 1/2] rpmsg: support for retreiving processor ID from a
 rpmsg_channel
Message-ID: <90aa5129dcd1d7ede188dfc5914b89185421ce7c.1472209108.git.michele.rodolfi@t3lab.it>
References: <cover.1472209108.git.michele.rodolfi@t3lab.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1472209108.git.michele.rodolfi@t3lab.it>
To: matteo.sartori@t3lab.it, alessio.paccoia@t3lab.it, claudio.salati@t3lab.it, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

added function rproc_vdev_to_rproc_safe to remoteproc_virtio.c.
added function rproc_get_alias_id to remoteproc_core.c.
added function rpmsg_get_virtio_dev to virtio_rpmsg_bus.c.
Remote processor IDs are defined in the Device Tree using aliases.

This patch is created from the code in the TI repository
http://git.ti.com/rpmsg/remoteproc branch rpmsg-ti-linux-4.4.y

Signed-off-by: Michele Rodolfi <michele.rodolfi@t3lab.it>
---
 drivers/remoteproc/remoteproc_core.c   | 21 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c       | 20 ++++++++++++++++++++
 include/linux/remoteproc.h             |  2 ++
 include/linux/rpmsg.h                  |  1 +
 5 files changed, 65 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fe0539e..8c24e4a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1028,6 +1028,27 @@ static void rproc_crash_handler_work(struct work_struct *work)
 }
 
 /**
+ * rproc_get_alias_id() - return the alias id for the rproc device
+ * @rproc: handle of a remote processor
+ *
+ * Each rproc device is associated with a platform device, but since the
+ * devices are created from device tree, they do not have a valid platform
+ * device id. This function returns an alternate DT-based alias id, and is
+ * useful for clients needing to know an id for a processor. It is assumed
+ * that the devices were given proper alias ids.
+ *
+ * Return: alias id associated with the rproc
+ */
+int rproc_get_alias_id(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	
+	return of_alias_get_id(np, "rproc");
+}
+EXPORT_SYMBOL(rproc_get_alias_id);
+
+/**
  * __rproc_boot() - boot a remote processor
  * @rproc: handle of a remote processor
  * @wait: wait for rproc registration completion
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cc91556..d3b0e28 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -361,3 +361,24 @@ void rproc_remove_virtio_dev(struct rproc_vdev *rvdev)
 {
 	unregister_virtio_device(&rvdev->vdev);
 }
+
+/**
+ * rproc_vdev_to_rproc_safe() - Deduces a remoteproc from a virtio device
+ * @vdev: The virtio_device
+ *
+ * This function deduces the remoteproc from a given virtio device safely. If
+ * the virtio device is not one used by remoteproc, return NULL (as opposed to
+ * vdev_to_rproc which would return an invalid pointer)
+ */
+struct rproc *rproc_vdev_to_rproc_safe(struct virtio_device *vdev)
+{
+	struct rproc_vdev *rvdev;
+
+	if (!vdev->dev.parent /*|| vdev->dev.parent->type != &rproc_type*/)
+		return NULL;
+
+	rvdev = vdev_to_rvdev(vdev);
+
+	return rvdev->rproc;
+}
+EXPORT_SYMBOL(rproc_vdev_to_rproc_safe);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 4a4374c..5b9b8ae4 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -468,6 +468,26 @@ static void rpmsg_release_device(struct device *dev)
 	kfree(rpdev);
 }
 
+
+/**
+ * rpmsg_get_virtio_dev - Get underlying virtio device
+ * @rpdev: the rpmsg channel
+ *
+ * Returns the underlying remoteproc virtio device, if one exists.
+ * Returns NULL otherwise.
+ * NOTE: This function needs to be defined here since the definition of
+ * struct virtproc_info is in this file.
+ */
+struct virtio_device *rpmsg_get_virtio_dev(struct rpmsg_channel *rpdev)
+{
+	if (!rpdev || !rpdev->vrp)
+		return NULL;
+
+	return rpdev->vrp->vdev;
+}
+EXPORT_SYMBOL(rpmsg_get_virtio_dev);
+
+
 /*
  * match an rpmsg channel with a channel info struct.
  * this is used to make sure we're not creating rpmsg devices for channels
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 1c457a8..1dba274 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -498,6 +498,8 @@ int rproc_del(struct rproc *rproc);
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
+struct rproc *rproc_vdev_to_rproc_safe(struct virtio_device *vdev);
+int rproc_get_alias_id(struct rproc *rproc);
 
 static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 2b97c71..2b0c659 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -174,6 +174,7 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *,
 					rpmsg_rx_cb_t cb, void *priv, u32 addr);
 int
 rpmsg_send_offchannel_raw(struct rpmsg_channel *, u32, u32, void *, int, bool);
+struct virtio_device *rpmsg_get_virtio_dev(struct rpmsg_channel *rpdev);
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
 #define register_rpmsg_driver(drv) \
-- 
2.7.4
