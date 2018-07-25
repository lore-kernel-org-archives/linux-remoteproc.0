Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: Fix rpmsg_remove() release order
Date: Wed, 25 Jul 2018 23:07:06 +0200
Message-ID: <1532552826-30003-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In rpmsg_remove() procedure, children are removed then Name
Service announcement endpoint is destroyed and device released.

Issue with current implementation is if a NS announcement
creation request is ongoing (received before virtio reset),
child device could be created after children removing.
In that case rpmsg_remove() is freeing rpmsg_virtio_bus,
leading to an inconsistent state.

This patch is destroying NS announcement service endpoint before
removing children to guarantee that list of child devices is
fixed and all of them will be correctly removed before cleaning
resources.

fixes: bcabbccabffe ("rpmsg: Split off generic tail of create_channel()")

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 664f957..f5d481f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1004,13 +1004,13 @@ static void rpmsg_remove(struct virtio_device *vdev)
 
 	vdev->config->reset(vdev);
 
+	if (vrp->ns_ept)
+		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
+
 	ret = device_for_each_child(&vdev->dev, NULL, rpmsg_remove_device);
 	if (ret)
 		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
 
-	if (vrp->ns_ept)
-		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
-
 	idr_destroy(&vrp->endpoints);
 
 	vdev->config->del_vqs(vrp->vdev);
-- 
1.9.1
