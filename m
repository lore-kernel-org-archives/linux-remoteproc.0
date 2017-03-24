Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 14/19] remoteproc virtio: handle rproc vdev notification
Date: Fri, 24 Mar 2017 12:22:30 -0700
Message-ID: <1490383355-23176-15-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

If there is a vdev notification from the remote, rproc virtio
will mark the config_wait_complete to wake up any client who
is waiting for the remote to respond.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index c6f7ca4..577344e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -58,6 +58,7 @@ irqreturn_t rproc_virtio_interrupt(struct rproc *rproc, int notifyid)
 {
 	struct rproc_id_rsc *rsc;
 	struct rproc_vring *rvring;
+	struct rproc_vdev *rvdev;
 
 	dev_dbg(&rproc->dev, "virtio index %d is interrupted\n", notifyid);
 
@@ -71,8 +72,9 @@ irqreturn_t rproc_virtio_interrupt(struct rproc *rproc, int notifyid)
 			return IRQ_NONE;
 		return vring_interrupt(0, rvring->vq);
 	} else if (rsc->rsc_type == RPROC_IDR_VDEV) {
-		dev_info(&rproc->dev, "vdev intr is not supported yet.\n");
-		return IRQ_NONE;
+		rvdev = rsc->rsc_ptr;
+		complete_all(&rvdev->config_wait_complete);
+		return IRQ_HANDLED;
 	}
 
 	dev_err(&rproc->dev, "Unknown rsc type: 0x%x\n", rsc->rsc_type);
-- 
1.9.1
