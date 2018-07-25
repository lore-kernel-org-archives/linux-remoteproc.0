Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: Fix rpmsg_create_channel memory leak
Date: Wed, 25 Jul 2018 23:08:36 +0200
Message-ID: <1532552916-30111-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In case of rpmsg_register_device() failure, vch previously
allocated must be free.

fixes: 6eed598a0491 ("rpmsg: Split off generic tail of create_channel()")

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 664f957..10f927e 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -431,8 +431,10 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
 	rpdev->dev.parent = &vrp->vdev->dev;
 	rpdev->dev.release = virtio_rpmsg_release_device;
 	ret = rpmsg_register_device(rpdev);
-	if (ret)
+	if (ret) {
+		kfree(vch);
 		return NULL;
+	}
 
 	return rpdev;
 }
-- 
1.9.1
