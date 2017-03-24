Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 19/19] remoteproc: virtio: idr_alloc for rvdev
Date: Fri, 24 Mar 2017 12:22:35 -0700
Message-ID: <1490383355-23176-20-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

use idr_alloc to allocate notifyid for rvdev and set it
to the resource table.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c   |  4 +---
 drivers/remoteproc/remoteproc_virtio.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 62c0356..35cebd8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -271,12 +271,10 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 
 	/*
 	 * Assign an rproc-wide unique index for this vring
-	 * TODO: assign a notifyid for rvdev updates as well
-	 * TODO: support predefined notifyids (via resource table)
 	 */
 	ret = rproc_idr_alloc(rproc, rvring, RPROC_IDR_VRING, 0, 0);
 	if (ret < 0) {
-		dev_err(dev, "idr_alloc failed: %d\n", ret);
+		dev_err(dev, "rvfing idr_alloc failed: %d\n", ret);
 		dma_free_coherent(dev->parent, size, va, dma);
 		return ret;
 	}
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index bf3be6f1..117e7e3 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -361,6 +361,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	struct device *dev = &rproc->dev;
 	struct virtio_device *vdev = &rvdev->vdev;
 	int ret;
+	int idr_start, idr_end;
+	struct fw_rsc_vdev *rsc;
 
 	vdev->id.device	= id,
 	vdev->config = &rproc_virtio_config_ops,
@@ -381,6 +383,27 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	/* Reference the vdev and vring allocations */
 	kref_get(&rvdev->refcount);
 
+	/*
+	 * Assign an rproc-wide unique index for this rvdev
+	 */
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+	idr_start = 0;
+	idr_end = 0;
+	if (rsc->notifyid != FW_RSC_ADDR_ANY) {
+		if (!idr_find(&rproc->notifyids, rsc->notifyid)) {
+			idr_start = rsc->notifyid;
+			idr_end = idr_start + 1;
+		}
+	}
+
+	ret = rproc_idr_alloc(rproc, rvdev, RPROC_IDR_VDEV,
+			idr_start, idr_end);
+	if (ret < 0) {
+		dev_err(dev, "rvdev idr_alloc failed: %d\n", ret);
+		return ret;
+	}
+	rsc->notifyid = ret;
+
 	ret = register_virtio_device(vdev);
 	if (ret) {
 		put_device(&rproc->dev);
@@ -402,5 +425,11 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
  */
 void rproc_remove_virtio_dev(struct rproc_vdev *rvdev)
 {
+	struct rproc *rproc = rvdev->rproc;
+	struct fw_rsc_vdev *rsc;
+
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+	rproc_idr_remove(rproc, rsc->notifyid);
+
 	unregister_virtio_device(&rvdev->vdev);
 }
-- 
1.9.1
