Return-Path: <>
From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v2 1/4] rpmsg: add THIS_MODULE to rpmsg_driver in rpmsg core
Date: Wed, 4 May 2016 17:01:36 -0500
Message-ID: <1462399299-28159-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add register_rpmsg_driver helper macro that adds THIS_MODULE to
rpmsg_driver for the registering driver. We rename and modify
the existing register_rpmsg_driver to enable this.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Acked-by: Suman Anna <s-anna@ti.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 8 +++++---
 include/linux/rpmsg.h            | 6 +++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1fcd27c..fe03b2a 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -436,17 +436,19 @@ static struct bus_type rpmsg_bus = {
 };
 
 /**
- * register_rpmsg_driver() - register an rpmsg driver with the rpmsg bus
+ * __register_rpmsg_driver() - register an rpmsg driver with the rpmsg bus
  * @rpdrv: pointer to a struct rpmsg_driver
+ * @owner: owning module/driver
  *
  * Returns 0 on success, and an appropriate error value on failure.
  */
-int register_rpmsg_driver(struct rpmsg_driver *rpdrv)
+int __register_rpmsg_driver(struct rpmsg_driver *rpdrv, struct module *owner)
 {
 	rpdrv->drv.bus = &rpmsg_bus;
+	rpdrv->drv.owner = owner;
 	return driver_register(&rpdrv->drv);
 }
-EXPORT_SYMBOL(register_rpmsg_driver);
+EXPORT_SYMBOL(__register_rpmsg_driver);
 
 /**
  * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 82a6739..7ff5790 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -169,7 +169,7 @@ struct rpmsg_driver {
 
 int register_rpmsg_device(struct rpmsg_channel *dev);
 void unregister_rpmsg_device(struct rpmsg_channel *dev);
-int register_rpmsg_driver(struct rpmsg_driver *drv);
+int __register_rpmsg_driver(struct rpmsg_driver *drv, struct module *owner);
 void unregister_rpmsg_driver(struct rpmsg_driver *drv);
 void rpmsg_destroy_ept(struct rpmsg_endpoint *);
 struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *,
@@ -177,6 +177,10 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *,
 int
 rpmsg_send_offchannel_raw(struct rpmsg_channel *, u32, u32, void *, int, bool);
 
+/* use a macro to avoid include chaining to get THIS_MODULE */
+#define register_rpmsg_driver(drv) \
+	__register_rpmsg_driver(drv, THIS_MODULE)
+
 /**
  * rpmsg_send() - send a message across to the remote processor
  * @rpdev: the rpmsg channel
-- 
2.8.2
