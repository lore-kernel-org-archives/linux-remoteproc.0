Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v1 6/6] rpmsg: virtio_rpmsg: set buffer configuration to virtio
Date: Wed, 7 Dec 2016 21:35:41 +0100
Message-ID: <1481142941-15616-7-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
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
 drivers/rpmsg/virtio_rpmsg_bus.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index b12fe2a..5527b65 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -924,6 +924,23 @@ static int virtio_rpmsg_get_config(struct virtio_device *vdev)
 
 }
 
+static void virtio_rpmsg_set_config(struct virtio_device *vdev)
+{
+	struct virtio_rpmsg_cfg virtio_cfg;
+	struct virtproc_info *vrp = vdev->priv;
+
+	/* fill virtio_cfg struct */
+	memset(&virtio_cfg, 0, sizeof(virtio_cfg));
+	virtio_cfg.id = VIRTIO_ID_RPMSG;
+	virtio_cfg.da = vrp->bufs_dma;
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
@@ -934,6 +951,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	bool has_cfg = false;
 
 	vrp = kzalloc(sizeof(*vrp), GFP_KERNEL);
 	if (!vrp)
@@ -973,6 +991,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	if (err < 0)
 		goto free_vrp;
 
+	if (err)
+		has_cfg = true;
+
 	/* Allocate buffer if none provided by low level platform driver */
 	if (!vrp->ext_buffer) {
 		total_buf_space = vrp->num_bufs * vrp->buf_size;
@@ -993,6 +1014,10 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
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
