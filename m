Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/3] rpmsg: smd: fix kerneldoc warnings
Date: Mon, 18 Jun 2018 13:33:39 +0100
Message-Id: <20180618123339.24115-4-srinivas.kandagatla@linaro.org>
In-Reply-To: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
References: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch fixes below kerneldoc warnings

qcom_smd.c:141: warning: Function parameter or member 'dev' not described in 'qcom_smd_edge'
qcom_smd.c:141: warning: Function parameter or member 'name' not described in 'qcom_smd_edge'
qcom_smd.c:141: warning: Function parameter or member 'new_channel_event' not described in 'qcom_smd_edge'
qcom_smd.c:222: warning: Function parameter or member 'qsept' not described in 'qcom_smd_channel'
qcom_smd.c:222: warning: Function parameter or member 'registered' not described in 'qcom_smd_channel'
qcom_smd.c:222: warning: Function parameter or member 'state_change_event' not described in 'qcom_smd_channel'
qcom_smd.c:222: warning: Function parameter or member 'drvdata' not described in 'qcom_smd_channel'
qcom_smd.c:737: warning: Function parameter or member 'wait' not described in '__qcom_smd_send'

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

qcom_smd.c
---
 drivers/rpmsg/qcom_smd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 6437bbeebc91..8c6a142050f8 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -93,6 +93,8 @@ static const struct {
 
 /**
  * struct qcom_smd_edge - representing a remote processor
+ * @dev:		device associated with this edge
+ * @name:		name of this edge
  * @of_node:		of_node handle for information related to this edge
  * @edge_id:		identifier of this edge
  * @remote_pid:		identifier of remote processor
@@ -106,6 +108,7 @@ static const struct {
  * @channels_lock:	guard for modifications of @channels
  * @allocated:		array of bitmaps representing already allocated channels
  * @smem_available:	last available amount of smem triggering a channel scan
+ * @new_channel_event:	wait queue for new channel events
  * @scan_work:		work item for discovering new channels
  * @state_work:		work item for edge state changes
  */
@@ -172,10 +175,12 @@ struct qcom_smd_endpoint {
 /**
  * struct qcom_smd_channel - smd channel struct
  * @edge:		qcom_smd_edge this channel is living on
- * @qsdev:		reference to a associated smd client device
+ * @qsept:		reference to a associated smd endpoint
+ * @registered:		flag to indicate if the channel is registered
  * @name:		name of the channel
  * @state:		local state of the channel
  * @remote_state:	remote state of the channel
+ * @state_change_event:	state change event
  * @info:		byte aligned outgoing/incoming channel info
  * @info_word:		word aligned outgoing/incoming channel info
  * @tx_lock:		lock to make writes to the channel mutually exclusive
@@ -187,6 +192,7 @@ struct qcom_smd_endpoint {
  * @cb:			callback function registered for this channel
  * @recv_lock:		guard for rx info modifications and cb pointer
  * @pkt_size:		size of the currently handled packet
+ * @drvdata:		driver private data
  * @list:		lite entry for @channels in qcom_smd_edge
  */
 struct qcom_smd_channel {
@@ -726,6 +732,7 @@ static int qcom_smd_write_fifo(struct qcom_smd_channel *channel,
  * @channel:	channel handle
  * @data:	buffer of data to write
  * @len:	number of bytes to write
+ * @wait:	flag to indicate if write has ca wait
  *
  * This is a blocking write of len bytes into the channel's tx ring buffer and
  * signal the remote end. It will sleep until there is enough space available
-- 
2.16.2
