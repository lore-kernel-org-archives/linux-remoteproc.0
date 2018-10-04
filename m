Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V2 2/4] rpmsg: glink: Add support to handle signals command
Date: Thu,  4 Oct 2018 19:10:18 +0530
Message-Id: <1538660420-27797-3-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1538660420-27797-1-git-send-email-aneela@codeaurora.org>
References: <1538660420-27797-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Remote peripherals send signal notifications over glink with commandID 15.

Add support to send and receive the signal command and convert the signals
from NATIVE to TIOCM while receiving and vice versa while sending.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 130 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index e2ce4e6..35e2009 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018, The Linux Foundation.
  * Copyright (c) 2016-2017, Linaro Ltd
  */
 
@@ -17,6 +18,7 @@
 #include <linux/rpmsg.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/workqueue.h>
 #include <linux/mailbox_client.h>
 
@@ -150,6 +152,8 @@ enum {
  * @intent_req_lock: Synchronises multiple intent requests
  * @intent_req_result: Result of intent request
  * @intent_req_comp: Completion for intent_req signalling
+ * @lsigs:	local side signals
+ * @rsigs:	remote side signals
  */
 struct glink_channel {
 	struct rpmsg_endpoint ept;
@@ -181,6 +185,10 @@ struct glink_channel {
 	struct mutex intent_req_lock;
 	bool intent_req_result;
 	struct completion intent_req_comp;
+
+	unsigned int lsigs;
+	unsigned int rsigs;
+
 };
 
 #define to_glink_channel(_ept) container_of(_ept, struct glink_channel, ept)
@@ -201,9 +209,15 @@ struct glink_channel {
 #define RPM_CMD_TX_DATA_CONT		12
 #define RPM_CMD_READ_NOTIF		13
 #define RPM_CMD_RX_DONE_W_REUSE		14
+#define RPM_CMD_SIGNALS			15
 
 #define GLINK_FEATURE_INTENTLESS	BIT(1)
 
+#define NATIVE_DTR_SIG	BIT(31)
+#define NATIVE_CTS_SIG	BIT(30)
+#define NATIVE_CD_SIG	BIT(29)
+#define NATIVE_RI_SIG	BIT(28)
+
 static void qcom_glink_rx_done_work(struct work_struct *work);
 
 static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
@@ -957,6 +971,76 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 	return 0;
 }
 
+/**
+ * qcom_glink_send_signals() - convert a signal  cmd to wire format and transmit
+ * @glink:	The transport to transmit on.
+ * @channel:	The glink channel
+ * @sigs:	The signals to encode.
+ *
+ * Return: 0 on success or standard Linux error code.
+ */
+static int qcom_glink_send_signals(struct qcom_glink *glink,
+				   struct glink_channel *channel,
+				   u32 sigs)
+{
+	struct glink_msg msg;
+
+	/* convert signals from TIOCM to NATIVE */
+	sigs &= 0x0fff;
+	if (sigs & TIOCM_DTR)
+		sigs |= NATIVE_DTR_SIG;
+	if (sigs & TIOCM_RTS)
+		sigs |= NATIVE_CTS_SIG;
+	if (sigs & TIOCM_CD)
+		sigs |= NATIVE_CD_SIG;
+	if (sigs & TIOCM_RI)
+		sigs |= NATIVE_RI_SIG;
+
+	msg.cmd = cpu_to_le16(RPM_CMD_SIGNALS);
+	msg.param1 = cpu_to_le16(channel->lcid);
+	msg.param2 = cpu_to_le32(sigs);
+
+	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
+}
+
+static int qcom_glink_handle_signals(struct qcom_glink *glink,
+				     unsigned int rcid, unsigned int signals)
+{
+	struct glink_channel *channel;
+	unsigned long flags;
+	u32 old;
+
+	spin_lock_irqsave(&glink->idr_lock, flags);
+	channel = idr_find(&glink->rcids, rcid);
+	spin_unlock_irqrestore(&glink->idr_lock, flags);
+	if (!channel) {
+		dev_err(glink->dev, "signal for non-existing channel\n");
+		return -EINVAL;
+	}
+
+	old = channel->rsigs;
+
+	/* convert signals from NATIVE to TIOCM */
+	if (signals & NATIVE_DTR_SIG)
+		signals |= TIOCM_DSR;
+	if (signals & NATIVE_CTS_SIG)
+		signals |= TIOCM_CTS;
+	if (signals & NATIVE_CD_SIG)
+		signals |= TIOCM_CD;
+	if (signals & NATIVE_RI_SIG)
+		signals |= TIOCM_RI;
+	signals &= 0x0fff;
+
+	channel->rsigs = signals;
+
+	if (channel->ept.sig_cb) {
+		channel->ept.sig_cb(channel->ept.rpdev, channel->ept.priv,
+				    old, channel->rsigs);
+	}
+
+	return 0;
+}
+
 static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 {
 	struct qcom_glink *glink = data;
@@ -1018,6 +1102,10 @@ static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 			qcom_glink_handle_intent_req_ack(glink, param1, param2);
 			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
+		case RPM_CMD_SIGNALS:
+			qcom_glink_handle_signals(glink, param1, param2);
+			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
+			break;
 		default:
 			dev_err(glink->dev, "unhandled rx cmd: %d\n", cmd);
 			ret = -EINVAL;
@@ -1315,6 +1403,46 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_glink_send(channel, data, len, false);
 }
 
+static int qcom_glink_get_sigs(struct rpmsg_endpoint *ept,
+			       u32 *lsigs, u32 *rsigs)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	*lsigs = channel->lsigs;
+	*rsigs = channel->rsigs;
+
+	return 0;
+}
+
+static int qcom_glink_set_sigs(struct rpmsg_endpoint *ept, u32 set, u32 clear)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+	struct qcom_glink *glink = channel->glink;
+	u32 sigs = channel->lsigs;
+
+	if (set & TIOCM_DTR)
+		sigs |= TIOCM_DTR;
+	if (set & TIOCM_RTS)
+		sigs |= TIOCM_RTS;
+	if (set & TIOCM_CD)
+		sigs |= TIOCM_CD;
+	if (set & TIOCM_RI)
+		sigs |= TIOCM_RI;
+
+	if (clear & TIOCM_DTR)
+		sigs &= ~TIOCM_DTR;
+	if (clear & TIOCM_RTS)
+		sigs &= ~TIOCM_RTS;
+	if (clear & TIOCM_CD)
+		sigs &= ~TIOCM_CD;
+	if (clear & TIOCM_RI)
+		sigs &= ~TIOCM_RI;
+
+	channel->lsigs = sigs;
+
+	return qcom_glink_send_signals(glink, channel, sigs);
+}
+
 /*
  * Finds the device_node for the glink child interested in this channel.
  */
@@ -1348,6 +1476,8 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
 	.trysend = qcom_glink_trysend,
+	.get_signals = qcom_glink_get_sigs,
+	.set_signals = qcom_glink_set_sigs,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
