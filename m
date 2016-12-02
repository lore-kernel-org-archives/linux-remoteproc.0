Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/4] rpmsg: Introduce "poll" to endpoint ops
Date: Fri,  2 Dec 2016 14:03:34 -0800
Message-Id: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This allows rpmsg backends to implement polling of the outgoing buffer,
which provides poll support to user space when using the rpmsg character
device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/rpmsg/rpmsg_core.c     | 20 ++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  3 +++
 include/linux/rpmsg.h          | 13 +++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index a79cb5a9e5f2..5ec8a06c24fa 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -240,6 +240,26 @@ int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
 EXPORT_SYMBOL(rpmsg_trysendto);
 
 /**
+ * rpmsg_poll() - poll the endpoint's send buffers
+ * @ept:	the rpmsg endpoint
+ * @filp:	file for poll_wait()
+ * @wait:	poll_table for poll_wait()
+ *
+ * Returns mask representing the current state of the endpoint's send buffers
+ */
+unsigned int rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
+			poll_table *wait)
+{
+	if (WARN_ON(!ept))
+		return 0;
+	if (!ept->ops->poll)
+		return 0;
+
+	return ept->ops->poll(ept, filp, wait);
+}
+EXPORT_SYMBOL(rpmsg_poll);
+
+/**
  * rpmsg_send_offchannel() - send a message using explicit src/dst addresses
  * @ept: the rpmsg endpoint
  * @src: source address
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 8075a20f919b..6176f2457b6b 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -21,6 +21,7 @@
 #define __RPMSG_INTERNAL_H__
 
 #include <linux/rpmsg.h>
+#include <linux/poll.h>
 
 #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
 #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
@@ -70,6 +71,8 @@ struct rpmsg_endpoint_ops {
 	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
 	int (*trysend_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 			     void *data, int len);
+	unsigned int (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
+			     poll_table *wait);
 };
 
 int rpmsg_register_device(struct rpmsg_device *rpdev);
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 18f9e1ae4b7e..10d6ae8bbb7d 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -41,6 +41,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/kref.h>
 #include <linux/mutex.h>
+#include <linux/poll.h>
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
 
@@ -156,6 +157,9 @@ int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
 int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 			     void *data, int len);
 
+unsigned int rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
+			poll_table *wait);
+
 #else
 
 static inline int register_rpmsg_device(struct rpmsg_device *dev)
@@ -254,6 +258,15 @@ static inline int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 	return -ENXIO;
 }
 
+static inline unsigned int rpmsg_poll(struct rpmsg_endpoint *ept,
+				      struct file *filp, poll_table *wait)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG) */
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
-- 
2.5.0
