Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 2/3] remoteproc: core: transform struct fw_rsc_vdev_vring reserved field in pa
Date: Tue, 6 Sep 2016 09:39:43 +0200
Message-ID: <1473147584-13183-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

In current implementation, struct fw_rsc_vdev_vring which describes
vring resource in firmware resource table owns only device address,
because it assumes that host is responsible of vring allocation and
only device address is needed by coprocessor.
But if vrings need to be fixe in system memory map for any reasons
(security, SoC charactieristics...), physical address is needed exatly
identified the memory chunck by host.

For that let's transform reserved field of struct fw_rsc_vdev_vring
to pa (physical address).

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 ------
 include/linux/remoteproc.h           | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 18f4286..0d3c191 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -266,12 +266,6 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
 		i, vring->da, vring->num, vring->align);
 
-	/* make sure reserved bytes are zeroes */
-	if (vring->reserved) {
-		dev_err(dev, "vring rsc has non zero reserved bytes\n");
-		return -EINVAL;
-	}
-
 	/* verify queue size and vring alignment are sane */
 	if (!vring->num || !vring->align) {
 		dev_err(dev, "invalid qsz (%d) or alignment (%d)\n",
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 80e1cba..c321eab 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -241,7 +241,7 @@ struct fw_rsc_trace {
  * @notifyid is a unique rproc-wide notify index for this vring. This notify
  * index is used when kicking a remote processor, to let it know that this
  * vring is triggered.
- * @reserved: reserved (must be zero)
+ * @pa: physical address
  *
  * This descriptor is not a resource entry by itself; it is part of the
  * vdev resource type (see below).
@@ -255,7 +255,7 @@ struct fw_rsc_vdev_vring {
 	u32 align;
 	u32 num;
 	u32 notifyid;
-	u32 reserved;
+	u32 pa;
 } __packed;
 
 /**
-- 
1.9.1
