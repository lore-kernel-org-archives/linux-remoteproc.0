Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 4/6] rpmsg: virtio_rpmsg: get buffer configuration from virtio
Date: Wed, 1 Feb 2017 16:07:10 +0100
Message-ID: <1485961632-21980-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485961632-21980-1-git-send-email-loic.pallardy@st.com>
References: <1485961632-21980-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Some coprocessors have memory mapping constraints which require
predefined buffer location or specific buffer size different from
default definition.
Coprocessor resources are defined in associated firmware resource table.
Remoteproc offers access to firmware resource table via virtio get
interface.

This patch modifies rpmsg_probe sequence to:
- retrieve rpmsg buffer configuration (if any)
- verify and apply configuration
- allocate buffer according to requested configuration

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
Changes since V1:
- Move Rpmsg buffer physical address initialization in patch 5 "rpmsg: virtio_rpmsg:
don't allocate buffer if provided by low level driver"
- Remove extra lines

No change since v2.

---
 drivers/rpmsg/virtio_rpmsg_bus.c | 48 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index c8d0d6d..080ee07 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -32,6 +32,7 @@
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg/virtio_rpmsg.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 
@@ -870,6 +871,44 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	return 0;
 }
 
+static int virtio_rpmsg_get_config(struct virtio_device *vdev)
+{
+	struct virtio_rpmsg_cfg virtio_cfg;
+	struct virtproc_info *vrp = vdev->priv;
+	size_t total_buf_space;
+	int ret = 0;
+
+	memset(&virtio_cfg, 0, sizeof(virtio_cfg));
+	vdev->config->get(vdev, RPMSG_CONFIG_OFFSET, &virtio_cfg,
+			  sizeof(virtio_cfg));
+
+	if (virtio_cfg.id == VIRTIO_ID_RPMSG && virtio_cfg.version == 1 &&
+	    virtio_cfg.reserved == 0) {
+		if (virtio_cfg.buf_size <= MAX_RPMSG_BUF_SIZE) {
+			vrp->buf_size = virtio_cfg.buf_size;
+		} else {
+			WARN_ON(1);
+			dev_warn(&vdev->dev, "Requested RPMsg buffer size too big: %d\n",
+				 vrp->buf_size);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* Check rpmsg buffer length */
+		total_buf_space = vrp->num_bufs * vrp->buf_size;
+		if ((virtio_cfg.len != -1) &&
+		    (total_buf_space > virtio_cfg.len)) {
+			dev_warn(&vdev->dev, "Not enough memory for buffers: %d\n",
+				 total_buf_space);
+			ret = -ENOMEM;
+			goto out;
+		}
+		return !ret;
+	}
+out:
+	return ret;
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
@@ -900,6 +939,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	vrp->rvq = vqs[0];
 	vrp->svq = vqs[1];
 
+	vdev->priv = vrp;
+
 	/* we expect symmetric tx/rx vrings */
 	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
 		virtqueue_get_vring_size(vrp->svq));
@@ -912,6 +953,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
 
+	/* Try to get rpmsg configuration if any */
+	err = virtio_rpmsg_get_config(vdev);
+	if (err < 0)
+		goto free_vrp;
+
 	total_buf_space = vrp->num_bufs * vrp->buf_size;
 
 	/* allocate coherent memory for the buffers */
@@ -947,8 +993,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* suppress "tx-complete" interrupts */
 	virtqueue_disable_cb(vrp->svq);
 
-	vdev->priv = vrp;
-
 	/* if supported by the remote processor, enable the name service */
 	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
 		/* a dedicated endpoint handles the name service msgs */
-- 
1.9.1
