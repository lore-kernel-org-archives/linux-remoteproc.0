Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 6/6] rpmsg: virtio_rpmsg: set buffer configuration to virtio
Date: Wed, 1 Feb 2017 16:07:12 +0100
Message-ID: <1485961632-21980-7-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485961632-21980-1-git-send-email-loic.pallardy@st.com>
References: <1485961632-21980-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
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
index b347e34..d9af556 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -923,6 +923,27 @@ static int virtio_rpmsg_get_config(struct virtio_device *vdev)
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
@@ -933,6 +954,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	int err = 0, i;
 	size_t total_buf_space = 0;
 	bool notify;
+	bool has_cfg = false;
 
 	vrp = kzalloc(sizeof(*vrp), GFP_KERNEL);
 	if (!vrp)
@@ -972,6 +994,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	if (err < 0)
 		goto free_vrp;
 
+	if (err)
+		has_cfg = true;
+
 	/* Allocate buffer if none provided by low level platform driver */
 	if (!vrp->ext_buffer) {
 		total_buf_space = vrp->num_bufs * vrp->buf_size;
@@ -993,6 +1018,10 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 		/* and half is dedicated for TX */
 		vrp->sbufs = bufs_va + total_buf_space / 2;
+
+		/* Notify configuration to coprocessor */
+		if (has_cfg)
+			virtio_rpmsg_set_config(vdev);
 	}
 
 	/* set up the receive buffers */
-- 
1.9.1
