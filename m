Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 5/6] rpmsg: Introduce rpmsg_get_rproc_name
Date: Mon, 18 Dec 2017 14:02:13 -0800
Message-Id: <1513634534-22861-6-git-send-email-clew@codeaurora.org>
In-Reply-To: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for client's to query the edge name their channel is
registered for. This is useful for clients who share the same channel
identifier across different remote procs.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/rpmsg/rpmsg_core.c     | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h |  3 +++
 include/linux/rpmsg.h          | 10 ++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index dffa3aab7178..d6ebd678b089 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -78,6 +78,27 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
 }
 EXPORT_SYMBOL(rpmsg_create_ept);
 
+
+/**
+ * rpmsg_get_rproc_name() - Return the name of the rproc for this device
+ * @rpdev: rpmsg channel device
+ *
+ * Expose the rproc name for clients who open the same channel across different
+ * rprocs and need to differentiate during their probe.
+ *
+ * Returns char string on success and NULL on failure.
+ */
+const char *rpmsg_get_rproc_name(struct rpmsg_device *rpdev)
+{
+	if (WARN_ON(!rpdev))
+		return NULL;
+
+	if (!rpdev->ops->get_rproc_name)
+		return NULL;
+
+	return rpdev->ops->get_rproc_name(rpdev);
+}
+
 /**
  * rpmsg_destroy_ept() - destroy an existing rpmsg endpoint
  * @ept: endpoing to destroy
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 0cf9c7e2ee83..83a028b6883f 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -31,6 +31,7 @@
  * @create_ept:		create backend-specific endpoint, requried
  * @announce_create:	announce presence of new channel, optional
  * @announce_destroy:	announce destruction of channel, optional
+ * @get_rproc_name:	return name of the rproc for this device, optional
  *
  * Indirection table for the operations that a rpmsg backend should implement.
  * @announce_create and @announce_destroy are optional as the backend might
@@ -43,6 +44,8 @@ struct rpmsg_device_ops {
 
 	int (*announce_create)(struct rpmsg_device *ept);
 	int (*announce_destroy)(struct rpmsg_device *ept);
+
+	const char *(*get_rproc_name)(struct rpmsg_device *rpdev);
 };
 
 /**
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 10d6ae8bbb7d..167982dc5b4f 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -160,6 +160,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 unsigned int rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
 
+const char *rpmsg_get_rproc_name(struct rpmsg_device *dev);
+
 #else
 
 static inline int register_rpmsg_device(struct rpmsg_device *dev)
@@ -267,6 +269,14 @@ static inline unsigned int rpmsg_poll(struct rpmsg_endpoint *ept,
 	return 0;
 }
 
+static inline const char *rpmsg_get_rproc_name(struct rpmsg_device *rpdev)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG) */
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
