Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH] rpmsg: virtio_rpmsg_bus: fix export of rpmsg_send_offchannel_raw()
Date: Wed, 19 Jul 2017 21:06:34 -0500
Message-ID: <20170720020634.10958-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Commit 8a228ecfe086b ("rpmsg: Indirection table for rpmsg_endpoint
operations") has made the rpmsg_send_offchannel_raw() a static
function and local to the virtio_rpmsg_bus module, but has not
dropped the corresponding EXPORT_SYMBOL. Fix this.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index eee2a9f77d37..7216278f2947 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -632,7 +632,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	mutex_unlock(&vrp->tx_lock);
 	return err;
 }
-EXPORT_SYMBOL(rpmsg_send_offchannel_raw);
 
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 {
-- 
2.13.1
