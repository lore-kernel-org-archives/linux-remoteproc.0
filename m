Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/3] rpmsg: glink: Fix various kerneldoc warnings.
Date: Mon, 18 Jun 2018 13:33:38 +0100
Message-Id: <20180618123339.24115-3-srinivas.kandagatla@linaro.org>
In-Reply-To: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
References: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Fix below kerneldoc warnings while building with W=1
qcom_glink_native.c:53: warning: Function parameter or member 'data' not described in 'glink_defer_cmd'
qcom_glink_native.c:75: warning: Function parameter or member 'data' not described in 'glink_core_rx_intent'
qcom_glink_native.c:75: warning: Function parameter or member 'id' not described in 'glink_core_rx_intent'
qcom_glink_native.c:75: warning: Function parameter or member 'size' not described in 'glink_core_rx_intent'
qcom_glink_native.c:75: warning: Function parameter or member 'reuse' not described in 'glink_core_rx_intent'
qcom_glink_native.c:75: warning: Function parameter or member 'in_use' not described in 'glink_core_rx_intent'
qcom_glink_native.c:75: warning: Function parameter or member 'offset' not described in 'glink_core_rx_intent'
qcom_glink_native.c:75: warning: Function parameter or member 'node' not described in 'glink_core_rx_intent'
qcom_glink_native.c:116: warning: Function parameter or member 'features' not described in 'qcom_glink'
qcom_glink_native.c:116: warning: Function parameter or member 'intentless' not described in 'qcom_glink'
qcom_glink_native.c:524: warning: Function parameter or member 'version' not described in 'qcom_glink_receive_version'
qcom_glink_native.c:524: warning: Function parameter or member 'features' not described in 'qcom_glink_receive_version'
qcom_glink_native.c:524: warning: Excess function parameter 'r_version' description in 'qcom_glink_receive_version'
qcom_glink_native.c:524: warning: Excess function parameter 'r_features' description in 'qcom_glink_receive_version'
qcom_glink_native.c:551: warning: Function parameter or member 'version' not described in 'qcom_glink_receive_version_ack'
qcom_glink_native.c:551: warning: Function parameter or member 'features' not described in 'qcom_glink_receive_version_ack'
qcom_glink_native.c:551: warning: Excess function parameter 'r_version' description in 'qcom_glink_receive_version_ack'
qcom_glink_native.c:551: warning: Excess function parameter 'r_features' description in 'qcom_glink_receive_version_ack'
qcom_glink_native.c:570: warning: bad line:                                       wire format and transmit
qcom_glink_native.c:604: warning: Function parameter or member 'intent' not described in 'qcom_glink_advertise_intent'
qcom_glink_native.c:604: warning: Excess function parameter 'size' description in 'qcom_glink_advertise_intent'
qcom_glink_native.c:710: warning: Function parameter or member 'glink' not described in 'qcom_glink_handle_intent_req'
qcom_glink_native.c:710: warning: Function parameter or member 'cid' not described in 'qcom_glink_handle_intent_req'
qcom_glink_native.c:710: warning: Function parameter or member 'size' not described in 'qcom_glink_handle_intent_req'

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index e4eb5a1f417a..df1d923c0db5 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -40,7 +40,7 @@ struct glink_msg {
  * struct glink_defer_cmd - deferred incoming control message
  * @node:	list node
  * @msg:	message header
- * data:	payload of the message
+ * @data:	payload of the message
  *
  * Copy of a received control message, to be added to @rx_queue and processed
  * by @rx_work of @qcom_glink.
@@ -56,12 +56,13 @@ struct glink_defer_cmd {
  * struct glink_core_rx_intent - RX intent
  * RX intent
  *
- * data: pointer to the data (may be NULL for zero-copy)
- * id: remote or local intent ID
- * size: size of the original intent (do not modify)
- * reuse: To mark if the intent can be reused after first use
- * in_use: To mark if intent is already in use for the channel
- * offset: next write offset (initially 0)
+ * @data: pointer to the data (may be NULL for zero-copy)
+ * @id: remote or local intent ID
+ * @size: size of the original intent (do not modify)
+ * @reuse: To mark if the intent can be reused after first use
+ * @in_use: To mark if intent is already in use for the channel
+ * @offset: next write offset (initially 0)
+ * @node:	list node
  */
 struct glink_core_rx_intent {
 	void *data;
@@ -89,6 +90,8 @@ struct glink_core_rx_intent {
  * @idr_lock:	synchronizes @lcids and @rcids modifications
  * @lcids:	idr of all channels with a known local channel id
  * @rcids:	idr of all channels with a known remote channel id
+ * @features:	remote features
+ * @intentless:	flag to indicate that there is no intent
  */
 struct qcom_glink {
 	struct device *dev;
@@ -512,8 +515,8 @@ static void qcom_glink_rx_done(struct qcom_glink *glink,
  * qcom_glink_receive_version() - receive version/features from remote system
  *
  * @glink:	pointer to transport interface
- * @r_version:	remote version
- * @r_features:	remote features
+ * @version:	remote version
+ * @features:	remote features
  *
  * This function is called in response to a remote-initiated version/feature
  * negotiation sequence.
@@ -538,8 +541,8 @@ static void qcom_glink_receive_version(struct qcom_glink *glink,
  * qcom_glink_receive_version_ack() - receive negotiation ack from remote system
  *
  * @glink:	pointer to transport interface
- * @r_version:	remote version response
- * @r_features:	remote features response
+ * @version:	remote version response
+ * @features:	remote features response
  *
  * This function is called in response to a local-initiated version/feature
  * negotiation sequence and is the counter-offer from the remote side based
@@ -567,7 +570,7 @@ static void qcom_glink_receive_version_ack(struct qcom_glink *glink,
 
 /**
  * qcom_glink_send_intent_req_ack() - convert an rx intent request ack cmd to
-				      wire format and transmit
+ * 	wire format and transmit
  * @glink:	The transport to transmit on.
  * @channel:	The glink channel
  * @granted:	The request response to encode.
@@ -594,7 +597,7 @@ static int qcom_glink_send_intent_req_ack(struct qcom_glink *glink,
  *			   transmit
  * @glink:	The transport to transmit on.
  * @channel:	The local channel
- * @size:	The intent to pass on to remote.
+ * @intent:	The intent to pass on to remote.
  *
  * Return: 0 on success or standard Linux error code.
  */
@@ -698,9 +701,9 @@ static void qcom_glink_handle_rx_done(struct qcom_glink *glink,
 /**
  * qcom_glink_handle_intent_req() - Receive a request for rx_intent
  *					    from remote side
- * if_ptr:      Pointer to the transport interface
- * rcid:	Remote channel ID
- * size:	size of the intent
+ * @glink:      Pointer to the transport interface
+ * @cid:	Remote channel ID
+ * @size:	size of the intent
  *
  * The function searches for the local channel to which the request for
  * rx_intent has arrived and allocates and notifies the remote back
-- 
2.16.2
