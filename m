Return-Path: <Henri.Roosen@ginzinger.com>
From: Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH] rpmsg: virtio_rpmsg_bus: fix announce for devices without endpoint
Date: Fri, 2 Jun 2017 13:35:51 +0200
Message-ID: <1496403351-32280-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-remoteproc@vger.kernel.org
Cc: Henri Roosen <henri.roosen@ginzinger.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

A device might not have an endpoint assigned. This patch checks if
rpdev->ept has a value before dereferencing or using it.

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 5e66e081..3c582f2 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -314,7 +314,7 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 	int err = 0;
 
 	/* need to tell remote processor's name service about this channel ? */
-	if (rpdev->announce &&
+	if (rpdev->announce && rpdev->ept &&
 	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
 		struct rpmsg_ns_msg nsm;
 
@@ -338,7 +338,7 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 	int err = 0;
 
 	/* tell remote processor's name service we're removing this channel */
-	if (rpdev->announce &&
+	if (rpdev->announce && rpdev->ept &&
 	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
 		struct rpmsg_ns_msg nsm;
 
-- 
2.1.4
