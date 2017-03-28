Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 3/5] include: virtio_rpmsg: add virtio rpmsg configuration structure
Date: Tue, 28 Mar 2017 13:49:45 +0200
Message-ID: <1490701787-15205-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
References: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com
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
Changes since V3:
- remove va field from struct virtio_rpmsg_cfg

---
 include/linux/rpmsg/virtio_rpmsg.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 0000000..2d31636
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,30 @@
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
