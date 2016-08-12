Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 04/13] remoteproc: fix bare unsigned type usage
Date: Fri, 12 Aug 2016 18:42:19 -0500
Message-ID: <20160812234228.39731-5-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

While there is nothing wrong with defining an unsigned integer
variable or argument using the bare unsigned type, it is better
to use the checkpatch preferred 'unsigned int' type.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++------
 include/linux/remoteproc.h             |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cc91556313e1..62cffe92e40d 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -69,7 +69,7 @@ irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
 EXPORT_SYMBOL(rproc_vq_interrupt);
 
 static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
-				    unsigned id,
+				    unsigned int id,
 				    void (*callback)(struct virtqueue *vq),
 				    const char *name)
 {
@@ -144,7 +144,7 @@ static void rproc_virtio_del_vqs(struct virtio_device *vdev)
 	__rproc_virtio_del_vqs(vdev);
 }
 
-static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
+static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 		       struct virtqueue *vqs[],
 		       vq_callback_t *callbacks[],
 		       const char * const names[])
@@ -239,8 +239,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	return 0;
 }
 
-static void rproc_virtio_get(struct virtio_device *vdev, unsigned offset,
-							void *buf, unsigned len)
+static void rproc_virtio_get(struct virtio_device *vdev, unsigned int offset,
+			     void *buf, unsigned int len)
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 	struct fw_rsc_vdev *rsc;
@@ -257,8 +257,8 @@ static void rproc_virtio_get(struct virtio_device *vdev, unsigned offset,
 	memcpy(buf, cfg + offset, len);
 }
 
-static void rproc_virtio_set(struct virtio_device *vdev, unsigned offset,
-		      const void *buf, unsigned len)
+static void rproc_virtio_set(struct virtio_device *vdev, unsigned int offset,
+			     const void *buf, unsigned int len)
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 	struct fw_rsc_vdev *rsc;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 1c457a8dd5a6..f575f1ba42a1 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -435,7 +435,7 @@ struct rproc {
 	struct idr notifyids;
 	int index;
 	struct work_struct crash_handler;
-	unsigned crash_cnt;
+	unsigned int crash_cnt;
 	struct completion crash_comp;
 	bool recovery_disabled;
 	int max_notifyid;
-- 
2.9.0
