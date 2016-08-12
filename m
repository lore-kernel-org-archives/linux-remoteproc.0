Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 12/13] rpmsg: use dynamic_hex_dump for hex dump traces
Date: Fri, 12 Aug 2016 18:42:27 -0500
Message-ID: <20160812234228.39731-13-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

There are couple of print_hex_dump traces used in rpmsg code which
prints the actual byte messages being transferred between host and
the remote processors. These traces are quiet verbose and affects
performance, if the appropriate trace level is enabled. These hex
dumps are needed rather rarely, but are quite useful when debugging
complex IPC corner cases. So, this patch switches these hex dump
traces to use the dynamic_hex_dump() API.

The hex dump traces are also enabled only when CONFIG_DYNAMIC_DEBUG
is enabled. This switch allows flexibility of controlling these
traces through dynamic debug, instead of removing them completely.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e55d30d217ba..95ee6a9721d5 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -749,8 +749,10 @@ int rpmsg_send_offchannel_raw(struct rpmsg_channel *rpdev, u32 src, u32 dst,
 
 	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
 		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
-	print_hex_dump(KERN_DEBUG, "rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
-		       msg, sizeof(*msg) + msg->len, true);
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
+			 msg, sizeof(*msg) + msg->len, true);
+#endif
 
 	sg_init_one(&sg, msg, sizeof(*msg) + len);
 
@@ -785,8 +787,10 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
 		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
-	print_hex_dump(KERN_DEBUG, "rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
-		       msg, sizeof(*msg) + msg->len, true);
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
+			 msg, sizeof(*msg) + msg->len, true);
+#endif
 
 	/*
 	 * We currently use fixed-sized buffers, so trivially sanitize
@@ -897,8 +901,10 @@ static void rpmsg_ns_cb(struct rpmsg_channel *rpdev, void *data, int len,
 	struct device *dev = &vrp->vdev->dev;
 	int ret;
 
-	print_hex_dump(KERN_DEBUG, "NS announcement: ",
-		       DUMP_PREFIX_NONE, 16, 1, data, len, true);
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
+			 data, len, true);
+#endif
 
 	if (len != sizeof(*msg)) {
 		dev_err(dev, "malformed ns msg (%d)\n", len);
-- 
2.9.0
