Return-Path: <>
From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v2 3/4] rpmsg: add helper macro module_rpmsg_driver
Date: Wed, 4 May 2016 17:01:38 -0500
Message-ID: <1462399299-28159-3-git-send-email-afd@ti.com>
In-Reply-To: <1462399299-28159-1-git-send-email-afd@ti.com>
References: <1462399299-28159-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces the module_rpmsg_driver macro which is a
convenience macro for rpmsg driver modules similar to
module_platform_driver. It is intended to be used by drivers which
init/exit section does nothing but register/unregister the rpmsg driver.
By using this macro it is possible to eliminate a few lines of
boilerplate code per rpmsg driver.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 include/linux/rpmsg.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 7ff5790..ada50ff 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -182,6 +182,18 @@ rpmsg_send_offchannel_raw(struct rpmsg_channel *, u32, u32, void *, int, bool);
 	__register_rpmsg_driver(drv, THIS_MODULE)
 
 /**
+ * module_rpmsg_driver() - Helper macro for registering an rpmsg driver
+ * @__rpmsg_driver: rpmsg_driver struct
+ *
+ * Helper macro for rpmsg drivers which do not do anything special in module
+ * init/exit. This eliminates a lot of boilerplate.  Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
+ */
+#define module_rpmsg_driver(__rpmsg_driver) \
+	module_driver(__rpmsg_driver, register_rpmsg_driver, \
+			unregister_rpmsg_driver)
+
+/**
  * rpmsg_send() - send a message across to the remote processor
  * @rpdev: the rpmsg channel
  * @data: payload of message
-- 
2.8.2
