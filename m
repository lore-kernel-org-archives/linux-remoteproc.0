Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Provide function stubs for API
Date: Fri, 21 Oct 2016 10:25:37 -0700
Message-Id: <1477070737-5843-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Provide function stubs for the rpmsg API to allow clients to be compile
tested without having CONFIG_RPMSG enabled.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/rpmsg.h | 123 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 10 deletions(-)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 7ad6c205f110..18f9e1ae4b7e 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -37,6 +37,7 @@
 
 #include <linux/types.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/mod_devicetable.h>
 #include <linux/kref.h>
 #include <linux/mutex.h>
@@ -134,6 +135,8 @@ struct rpmsg_driver {
 	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
 };
 
+#if IS_ENABLED(CONFIG_RPMSG)
+
 int register_rpmsg_device(struct rpmsg_device *dev);
 void unregister_rpmsg_device(struct rpmsg_device *dev);
 int __register_rpmsg_driver(struct rpmsg_driver *drv, struct module *owner);
@@ -143,6 +146,116 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
 
+int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
+int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
+			  void *data, int len);
+
+int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
+			     void *data, int len);
+
+#else
+
+static inline int register_rpmsg_device(struct rpmsg_device *dev)
+{
+	return -ENXIO;
+}
+
+static inline void unregister_rpmsg_device(struct rpmsg_device *dev)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
+static inline int __register_rpmsg_driver(struct rpmsg_driver *drv,
+					  struct module *owner)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+static inline void unregister_rpmsg_driver(struct rpmsg_driver *drv)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
+static inline void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
+static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
+						      rpmsg_rx_cb_t cb,
+						      void *priv,
+						      struct rpmsg_channel_info chinfo)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return ERR_PTR(-ENXIO);
+}
+
+static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
+			       u32 dst)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+
+}
+
+static inline int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src,
+					u32 dst, void *data, int len)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+				  int len, u32 dst)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+static inline int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
+					   u32 dst, void *data, int len)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+#endif /* IS_ENABLED(CONFIG_RPMSG) */
+
 /* use a macro to avoid include chaining to get THIS_MODULE */
 #define register_rpmsg_driver(drv) \
 	__register_rpmsg_driver(drv, THIS_MODULE)
@@ -159,14 +272,4 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 	module_driver(__rpmsg_driver, register_rpmsg_driver, \
 			unregister_rpmsg_driver)
 
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
-int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			  void *data, int len);
-
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
-int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			     void *data, int len);
-
 #endif /* _LINUX_RPMSG_H */
-- 
2.5.0
