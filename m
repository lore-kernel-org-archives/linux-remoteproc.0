Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Date: Fri, 25 Nov 2016 18:54:53 +0100
Message-ID: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Since virtio backend creation, it is no more possible for a firmware to
register twice a service (on different endpoints). rpmsg_register_device
function is failing when calling device_add for the second time as second
device has the same name as first one already register.
It is because name is based only on service name.

This patch adds destination endpoint to service name to create an
unique device name.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 3090b0d..dce880f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -405,7 +405,8 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
 	 */
 	rpdev->announce = rpdev->src != RPMSG_ADDR_ANY;
 
-	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
+	snprintf(rpdev->id.name, RPMSG_NAME_SIZE, "%s-%d", chinfo->name,
+		 chinfo->dst);
 
 	rpdev->dev.parent = &vrp->vdev->dev;
 	ret = rpmsg_register_device(rpdev);
-- 
1.9.1
