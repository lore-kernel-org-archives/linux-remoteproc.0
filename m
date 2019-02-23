Return-Path: <pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/2] rpmsg: core: fix comments
Date: Fri, 22 Feb 2019 22:20:17 -0600
Message-Id: <20190223042017.21985-2-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190223042017.21985-1-pierre-louis.bossart@linux.intel.com>
References: <20190223042017.21985-1-pierre-louis.bossart@linux.intel.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Minor typos, grammar and copy/paste issues. Fix for consistency. No
functional or semantic change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/rpmsg/rpmsg_core.c     | 8 ++++----
 drivers/rpmsg/rpmsg_internal.h | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index ea88fd4e2a6e..e330ec4dfc33 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -46,7 +46,7 @@
  * equals to the src address of their rpmsg channel), the driver's handler
  * is invoked to process it.
  *
- * That said, more complicated drivers might do need to allocate
+ * That said, more complicated drivers might need to allocate
  * additional rpmsg addresses, and bind them to different rx callbacks.
  * To accomplish that, those drivers need to call this function.
  *
@@ -177,7 +177,7 @@ int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 EXPORT_SYMBOL(rpmsg_send_offchannel);
 
 /**
- * rpmsg_send() - send a message across to the remote processor
+ * rpmsg_trysend() - send a message across to the remote processor
  * @ept: the rpmsg endpoint
  * @data: payload of message
  * @len: length of payload
@@ -205,7 +205,7 @@ int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 EXPORT_SYMBOL(rpmsg_trysend);
 
 /**
- * rpmsg_sendto() - send a message across to the remote processor, specify dst
+ * rpmsg_trysendto() - send a message across to the remote processor, specify dst
  * @ept: the rpmsg endpoint
  * @data: payload of message
  * @len: length of payload
@@ -253,7 +253,7 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 EXPORT_SYMBOL(rpmsg_poll);
 
 /**
- * rpmsg_send_offchannel() - send a message using explicit src/dst addresses
+ * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
  * @ept: the rpmsg endpoint
  * @src: source address
  * @dst: destination address
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 0d791c30b7ea..3fc83cd50e98 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -20,7 +20,7 @@
 
 /**
  * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
- * @create_ept:		create backend-specific endpoint, requried
+ * @create_ept:		create backend-specific endpoint, required
  * @announce_create:	announce presence of new channel, optional
  * @announce_destroy:	announce destruction of channel, optional
  *
@@ -39,13 +39,14 @@ struct rpmsg_device_ops {
 
 /**
  * struct rpmsg_endpoint_ops - indirection table for rpmsg_endpoint operations
- * @destroy_ept:	destroy the given endpoint, required
+ * @destroy_ept:	see @rpmsg_destroy_ept(), required
  * @send:		see @rpmsg_send(), required
  * @sendto:		see @rpmsg_sendto(), optional
  * @send_offchannel:	see @rpmsg_send_offchannel(), optional
  * @trysend:		see @rpmsg_trysend(), required
  * @trysendto:		see @rpmsg_trysendto(), optional
  * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
+ * @poll:		see @rpmsg_poll(), optional
  *
  * Indirection table for the operations that a rpmsg backend should implement.
  * In addition to @destroy_ept, the backend must at least implement @send and
-- 
2.17.1
