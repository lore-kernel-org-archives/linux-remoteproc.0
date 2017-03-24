Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 16/19] remoteproc: virtio: use rproc_virtio_notify() to notify vdev changes
Date: Fri, 24 Mar 2017 12:22:32 -0700
Message-ID: <1490383355-23176-17-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Use rproc_virtio_notify() to notify vdev config changes.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cc421f3..d43e15b 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -29,6 +29,20 @@
 
 #include "remoteproc_internal.h"
 
+/* kick the remote processor, and let it know the virtio dev has update */
+static bool rproc_virtio_notify(struct rproc_vdev *rvdev)
+{
+	struct rproc *rproc;
+	struct fw_rsc_vdev *rsc;
+
+	if (!rvdev)
+		return false;
+	rproc = rvdev->rproc;
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+	rproc->ops->kick(rproc, rsc->notifyid);
+	return true;
+}
+
 /* kick the remote processor, and let it know which virtqueue to poke at */
 static bool rproc_vq_notify(struct virtqueue *vq)
 {
-- 
1.9.1
