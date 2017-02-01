Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 3/6] include: virtio_rpmsg: add virtio rpmsg configuration structure
Date: Wed, 1 Feb 2017 16:07:09 +0100
Message-ID: <1485961632-21980-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485961632-21980-1-git-send-email-loic.pallardy@st.com>
References: <1485961632-21980-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Rpmsg channel configuration should be identical on host and
coprocessor side.
This patch proposes a new structure named struct virtio_rpmsg_cfg
to gather all configuration information to characterize the
communication link and.
This structure will be exchanged with coprocessor via the resource
table, expanding struct fw_rsc_vdev. It will guarantee that host
and coprocessor will share the same information.
virtio_rpmsg will access it thanks to virtio get and set features.
Presence of struct virtio_rpmsg_cfg is optional.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
No change since V1
---
 include/linux/rpmsg/virtio_rpmsg.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 0000000..5f3f0d0
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,32 @@
+
+#ifndef _LINUX_VIRTIO_RPMSG_H
+#define _LINUX_VIRTIO_RPMSG_H
+
+/* Offset in struct fw_rsc_vdev */
+#define RPMSG_CONFIG_OFFSET	0
+
+/**
+ * struct virtio_rpmsg_cfg - optional configuration field for virtio rpmsg
+ * provided at probe time by virtio (get/set)
+ * @id: virtio cfg id (as in virtio_ids.h)
+ * @version: virtio_rpmsg_cfg structure version number
+ * @va: virtual address (used when buffer allocated by low level driver)
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @buf_size: size of rpmsg buffer size (defined by firmware else default value
+ *	      used)
+ * @reserved: reserved (must be zero)
+ */
+struct virtio_rpmsg_cfg {
+	u32 id;
+	u32 version;
+	u64 va;
+	u32 da;
+	u32 pa;
+	u32 len;
+	u32 buf_size;
+	u32 reserved;
+} __packed;
+
+#endif
-- 
1.9.1
