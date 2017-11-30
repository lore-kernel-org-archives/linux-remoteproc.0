Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 13/16] remoteproc: look-up memory-device for virtio device allocation
Date: Thu, 30 Nov 2017 17:46:48 +0100
Message-ID: <1512060411-729-14-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch parse existing carveout list to find a memory area
matching on "vdev<vdev_id>buffer" name.
If found, memory device will be used as parent for vdev creation, else
rproc platform device will be used as today.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c   | 13 +++++++++++++
 drivers/remoteproc/remoteproc_virtio.c |  2 +-
 include/linux/remoteproc.h             |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6b5e2b2..9c12319 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -583,8 +583,11 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
+	struct device *memdev = dev->parent;
+	struct rproc_mem_entry *carveout;
 	int i, ret;
 	static int index;
+	char name[16];
 
 	/* make sure resource isn't truncated */
 	if (sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct fw_rsc_vdev_vring)
@@ -637,6 +640,16 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 
 	list_add_tail(&rvdev->node, &rproc->rvdevs);
 
+	/* Find associated registered carveout. */
+	/* Try dedicated vdev buffer pool. */
+	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
+	carveout = rproc_find_carveout_by_name(rproc, name);
+
+	if (carveout && carveout->memdev)
+		memdev = &carveout->memdev->dev;
+
+	rvdev->dev = memdev;
+
 	rproc_add_subdev(rproc, &rvdev->subdev,
 			 rproc_vdev_do_probe, rproc_vdev_do_remove);
 
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 2946348..1f7a444 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -303,7 +303,7 @@ static void rproc_virtio_dev_release(struct device *dev)
 int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 {
 	struct rproc *rproc = rvdev->rproc;
-	struct device *dev = &rproc->dev;
+	struct device *dev = rvdev->dev;
 	struct virtio_device *vdev = &rvdev->vdev;
 	int ret;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index fb293d3..b3d6656 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -506,6 +506,7 @@ struct rproc_vdev {
 	struct kref refcount;
 
 	struct rproc_subdev subdev;
+	struct device *dev;
 
 	unsigned int id;
 	unsigned int index;
-- 
1.9.1
