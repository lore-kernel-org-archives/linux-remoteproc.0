Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 5/5] rpmsg: virtio_rpmsg: set buffer configuration to virtio
Date: Tue, 28 Mar 2017 13:49:47 +0200
Message-ID: <1490701787-15205-6-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
References: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Rpmsg is allocating buffer one dedicated communication link
with some specificity like number of buffers, size of one buffer...
These characteristics should be shared with remote coprocessor to
guarantee communication link coherency.

Proposal is to update rpmsg configuration fields in coprocessor firmware
resource table if it exists.

This is possible thanks to virtio set interface which allows to update
cfg fields of struct fw_rsc_vdev.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
Changes since V1:
- Set virtio_cfg.da to -1 (any address) by default
- Add comment about IOMMU support

No change since v2.

---
 drivers/rpmsg/virtio_rpmsg_bus.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 69285c1..3e41322 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -909,6 +909,27 @@ static int virtio_rpmsg_get_config(struct virtio_device *vdev)
 	return ret;
 }
 
+static void virtio_rpmsg_set_config(struct virtio_device *vdev)
+{
+	struct virtio_rpmsg_cfg virtio_cfg;
+	struct virtproc_info *vrp = vdev->priv;
+
+	/* fill virtio_cfg struct */
+	memset(&virtio_cfg, 0, sizeof(virtio_cfg));
+	virtio_cfg.id = VIRTIO_ID_RPMSG;
+	/*
+	 * IOMMU not managed at the time being, set device address to (-1)
+	 * meaning any address value.
+	 */
+	virtio_cfg.da = -1;
+	virtio_cfg.pa =	vrp->bufs_dma;
+	virtio_cfg.len = vrp->num_bufs * vrp->buf_size;
+	virtio_cfg.buf_size = vrp->buf_size;
+
+	vdev->config->set(vdev, RPMSG_CONFIG_OFFSET, &virtio_cfg,
+			  sizeof(virtio_cfg));
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
@@ -919,6 +940,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	bool has_cfg = false;
 
 	vrp = kzalloc(sizeof(*vrp), GFP_KERNEL);
 	if (!vrp)
@@ -958,6 +980,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	if (err < 0)
 		goto free_vrp;
 
+	if (err)
+		has_cfg = true;
+
 	total_buf_space = vrp->num_bufs * vrp->buf_size;
 
 	/* allocate coherent memory for the buffers */
@@ -978,6 +1003,10 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* and half is dedicated for TX */
 	vrp->sbufs = bufs_va + total_buf_space / 2;
 
+	/* Notify configuration to coprocessor */
+	if (has_cfg)
+		virtio_rpmsg_set_config(vdev);
+
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_bufs / 2; i++) {
 		struct scatterlist sg;
-- 
1.9.1
