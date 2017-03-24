Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 17/19] remoteproc: virtio: kick in reset virtio
Date: Fri, 24 Mar 2017 12:22:33 -0700
Message-ID: <1490383355-23176-18-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Kick the remote in virtio reset.
In order to be backward compatible, only set the vdev
status to NEEDS_RESET and kick the remote if the remote is
RUNNING_INDEPENDENT, that is only if the remote is already
running.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d43e15b..bf3be6f1 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -231,8 +231,19 @@ static void rproc_virtio_reset(struct virtio_device *vdev)
 
 	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
 
-	rsc->status = 0;
 	dev_dbg(&vdev->dev, "reset !\n");
+	if (rvdev->rproc->state == RPROC_RUNNING_INDEPENDENT) {
+		rsc->status = VIRTIO_CONFIG_S_NEEDS_RESET;
+		virtio_mb(false);
+		rproc_virtio_notify(rvdev);
+		while (rsc->status) {
+			if (!wait_for_completion_timeout(
+				&rvdev->config_wait_complete, HZ))
+				break;
+		}
+	} else {
+		rsc->status = 0;
+	}
 }
 
 /* provide the vdev features as retrieved from the firmware */
-- 
1.9.1
