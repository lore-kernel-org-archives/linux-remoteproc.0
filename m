Return-Path: <Henri.Roosen@ginzinger.com>
From: Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH] rpmsg: virtio_rpmsg_bus: cleanup multiple assignment to ops
Date: Fri, 2 Jun 2017 13:36:22 +0200
Message-ID: <1496403382-32374-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-remoteproc@vger.kernel.org
Cc: Henri Roosen <henri.roosen@ginzinger.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Trivial cleanup: the .ops pointer is assigned twice. This patch removes the
first assignment.

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 3c582f2..35b8379 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -390,9 +390,6 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
 	/* Link the channel to our vrp */
 	vch->vrp = vrp;
 
-	/* Assign callbacks for rpmsg_channel */
-	vch->rpdev.ops = &virtio_rpmsg_ops;
-
 	/* Assign public information to the rpmsg_device */
 	rpdev = &vch->rpdev;
 	rpdev->src = chinfo->src;
-- 
2.1.4
