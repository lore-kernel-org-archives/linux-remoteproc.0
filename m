Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH 2/3] rpmsg: glink: implement get_mtu ops
Date: Thu, 5 Sep 2019 16:27:09 +0200
Message-ID: <1567693630-27544-3-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: arnaud.pouliquen@st.com, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Implement the get_mtu ops to return the maximum size of
the message that can be sent.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/qcom_glink_native.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 621f1afd4d6b..8a477416a38a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1312,6 +1312,29 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_glink_send(channel, data, len, false);
 }
 
+static ssize_t qcom_glink_get_mtu(struct rpmsg_endpoint *ept)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+	size_t mtu_size = 0;
+	struct qcom_glink *glink = channel->glink;
+	struct glink_core_rx_intent *tmp;
+	unsigned long flags;
+	int iid = 0;
+
+	if (!glink->intentless) {
+		spin_lock_irqsave(&channel->intent_lock, flags);
+		idr_for_each_entry(&channel->riids, tmp, iid) {
+			if (tmp->size > mtu_size && !tmp->in_use)
+				mtu_size = tmp->size;
+		}
+		spin_unlock_irqrestore(&channel->intent_lock, flags);
+
+		return mtu_size;
+	} else {
+		return qcom_glink_tx_avail(glink);
+	}
+}
+
 /*
  * Finds the device_node for the glink child interested in this channel.
  */
@@ -1345,6 +1368,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
 	.trysend = qcom_glink_trysend,
+	.get_mtu = qcom_glink_get_mtu,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
-- 
2.7.4
