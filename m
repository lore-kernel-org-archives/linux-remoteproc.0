Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 13/19] remoteproc: add config_wait_complete to rproc_vdev
Date: Fri, 24 Mar 2017 12:22:29 -0700
Message-ID: <1490383355-23176-14-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add config_wait_complete to rproc_vdev.
This attribute is used for vdev config operation to
wait for the remote to respond. When there is a
notification comes from the remote, it can wake up
the waiting client by marking this attribute.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 1 +
 include/linux/remoteproc.h             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index e45e17b..c6f7ca4 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -340,6 +340,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
+	init_completion(&rvdev->config_wait_complete);
 	/*
 	 * We're indirectly making a non-temporary copy of the rproc pointer
 	 * here, because drivers probed with this vdev will indirectly
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 303210b..4ce7579 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -534,6 +534,7 @@ struct rproc_vring {
  * @vdev: the virio device
  * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
+ * @config_wait_complete: mark asynchronous vdev config wait complete
  */
 struct rproc_vdev {
 	struct kref refcount;
@@ -546,6 +547,7 @@ struct rproc_vdev {
 	struct virtio_device vdev;
 	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;
+	struct completion config_wait_complete;
 };
 
 struct rproc *rproc_get_by_phandle(phandle phandle);
-- 
1.9.1
