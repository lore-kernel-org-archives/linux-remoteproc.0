Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Handle invalid parameters in public API
Date: Tue, 18 Oct 2016 17:23:44 -0700
Message-Id: <1476836624-342-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

There are two cases of possible uninitialized pointer usage in the API,
either the parameters themselves are invalid or we're trying to jump to
functions not required to be implemented by all backends.

Suggested-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 7561941ba413..a79cb5a9e5f2 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -71,6 +71,9 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo)
 {
+	if (WARN_ON(!rpdev))
+		return ERR_PTR(-EINVAL);
+
 	return rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
 }
 EXPORT_SYMBOL(rpmsg_create_ept);
@@ -80,11 +83,13 @@ EXPORT_SYMBOL(rpmsg_create_ept);
  * @ept: endpoing to destroy
  *
  * Should be used by drivers to destroy an rpmsg endpoint previously
- * created with rpmsg_create_ept().
+ * created with rpmsg_create_ept(). As with other types of "free" NULL
+ * is a valid parameter.
  */
 void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 {
-	ept->ops->destroy_ept(ept);
+	if (ept)
+		ept->ops->destroy_ept(ept);
 }
 EXPORT_SYMBOL(rpmsg_destroy_ept);
 
@@ -108,6 +113,11 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  */
 int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 {
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->send)
+		return -ENXIO;
+
 	return ept->ops->send(ept, data, len);
 }
 EXPORT_SYMBOL(rpmsg_send);
@@ -132,6 +142,11 @@ EXPORT_SYMBOL(rpmsg_send);
  */
 int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
 {
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->sendto)
+		return -ENXIO;
+
 	return ept->ops->sendto(ept, data, len, dst);
 }
 EXPORT_SYMBOL(rpmsg_sendto);
@@ -159,6 +174,11 @@ EXPORT_SYMBOL(rpmsg_sendto);
 int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 			  void *data, int len)
 {
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->send_offchannel)
+		return -ENXIO;
+
 	return ept->ops->send_offchannel(ept, src, dst, data, len);
 }
 EXPORT_SYMBOL(rpmsg_send_offchannel);
@@ -182,6 +202,11 @@ EXPORT_SYMBOL(rpmsg_send_offchannel);
  */
 int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 {
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->trysend)
+		return -ENXIO;
+
 	return ept->ops->trysend(ept, data, len);
 }
 EXPORT_SYMBOL(rpmsg_trysend);
@@ -205,6 +230,11 @@ EXPORT_SYMBOL(rpmsg_trysend);
  */
 int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
 {
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->trysendto)
+		return -ENXIO;
+
 	return ept->ops->trysendto(ept, data, len, dst);
 }
 EXPORT_SYMBOL(rpmsg_trysendto);
@@ -231,6 +261,11 @@ EXPORT_SYMBOL(rpmsg_trysendto);
 int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 			     void *data, int len)
 {
+	if (WARN_ON(!ept))
+		return -EINVAL;
+	if (!ept->ops->trysend_offchannel)
+		return -ENXIO;
+
 	return ept->ops->trysend_offchannel(ept, src, dst, data, len);
 }
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
-- 
2.5.0
