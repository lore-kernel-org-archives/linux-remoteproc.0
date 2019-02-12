Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: [PATCH] rpmsg: virtio_rpmsg_bus: acknowledge the received creation message
Date: Tue, 12 Feb 2019 15:13:16 +0800
Message-Id: <1549955596-19784-1-git-send-email-xiaoxiang@xiaomi.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, kumar.gala@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: QianWenfa <qianwenfa@xiaomi.com>, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: QianWenfa <qianwenfa@xiaomi.com>

the two phase handsake make the client could initiate the transfer
immediately without the server side send any dummy message first.

Signed-off-by: Wenfa Qian <qianwenfa@xiaomi.com>
Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 664f957..e323c98 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -71,6 +71,7 @@ struct virtproc_info {
 
 /* The feature bitmap for virtio rpmsg */
 #define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
+#define VIRTIO_RPMSG_F_ACK	1 /* RP supports name service acknowledge */
 
 /**
  * struct rpmsg_hdr - common header for all rpmsg messages
@@ -115,10 +116,12 @@ struct rpmsg_ns_msg {
  *
  * @RPMSG_NS_CREATE: a new remote service was just created
  * @RPMSG_NS_DESTROY: a known remote service was just destroyed
+ * @RPMSG_NS_ACK: acknowledge the previous creation message
  */
 enum rpmsg_ns_flags {
 	RPMSG_NS_CREATE		= 0,
 	RPMSG_NS_DESTROY	= 1,
+	RPMSG_NS_ACK		= 2,
 };
 
 /**
@@ -330,13 +333,14 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 	int err = 0;
 
 	/* need to tell remote processor's name service about this channel ? */
-	if (rpdev->announce && rpdev->ept &&
+	if (rpdev->ept && (rpdev->announce ||
+	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_ACK)) &&
 	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
 		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_CREATE;
+		nsm.flags = rpdev->announce ? RPMSG_NS_CREATE : RPMSG_NS_ACK;
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -820,6 +824,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_channel_info chinfo;
 	struct virtproc_info *vrp = priv;
 	struct device *dev = &vrp->vdev->dev;
+	struct device *tmp;
 	int ret;
 
 #if defined(CONFIG_DYNAMIC_DEBUG)
@@ -847,21 +852,30 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
 
 	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
+		 msg->flags == RPMSG_NS_ACK ? "ack" :
+		 msg->flags == RPMSG_NS_DESTROY ? "destroy" : "creat",
 		 msg->name, msg->addr);
 
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
 	chinfo.dst = msg->addr;
 
-	if (msg->flags & RPMSG_NS_DESTROY) {
+	if (msg->flags == RPMSG_NS_DESTROY) {
 		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-	} else {
+	} else if (msg->flags == RPMSG_NS_CREATE) {
 		newch = rpmsg_create_channel(vrp, &chinfo);
 		if (!newch)
 			dev_err(dev, "rpmsg_create_channel failed\n");
+	} else if (msg->flags == RPMSG_NS_ACK) {
+		chinfo.dst = RPMSG_ADDR_ANY;
+		tmp = rpmsg_find_device(&vrp->vdev->dev, &chinfo);
+		if (tmp) {
+			newch = to_rpmsg_device(tmp);
+			newch->dst = msg->addr;
+		} else
+			dev_err(dev, "rpmsg_find_device failed\n");
 	}
 
 	return 0;
@@ -1028,6 +1042,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_ACK,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
-- 
2.7.4
