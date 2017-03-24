Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 15/19] remoteproc: virtio: rename rproc_virtio_notify to rproc_vq_notify
Date: Fri, 24 Mar 2017 12:22:31 -0700
Message-ID: <1490383355-23176-16-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

rproc_virtio_notify() is to notify about the virtqueue changes but
not the virtio dev and thus rename to rproc_vq_notify().
It will need another API for virtio dev notification.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 577344e..cc421f3 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -30,7 +30,7 @@
 #include "remoteproc_internal.h"
 
 /* kick the remote processor, and let it know which virtqueue to poke at */
-static bool rproc_virtio_notify(struct virtqueue *vq)
+static bool rproc_vq_notify(struct virtqueue *vq)
 {
 	struct rproc_vring *rvring = vq->priv;
 	struct rproc *rproc = rvring->rvdev->rproc;
@@ -136,7 +136,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	 * the 'weak' smp barriers, since we're talking with a real device.
 	 */
 	vq = vring_new_virtqueue(id, len, rvring->align, vdev, false, addr,
-				 rproc_virtio_notify, callback, name);
+				 rproc_vq_notify, callback, name);
 	if (!vq) {
 		dev_err(dev, "vring_new_virtqueue %s failed\n", name);
 		rproc_free_vring(rvring);
-- 
1.9.1
