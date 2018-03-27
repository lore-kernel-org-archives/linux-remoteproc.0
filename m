Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] rpmsg: smd: Use announce_create to process any receive work
Date: Tue, 27 Mar 2018 14:06:43 -0700
Message-Id: <20180327210643.3436-4-bjorn.andersson@linaro.org>
In-Reply-To: <20180327210643.3436-1-bjorn.andersson@linaro.org>
References: <20180327210643.3436-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

It is possible that incoming data arrives before the client driver has
reached a point in the probe method where adequate context for handling
the incoming message has been established.

In the event that the client's callback function returns an error the
message will be left on the FIFO and by invoking the receive handler
after the device has been probed the message will be picked off the FIFO
and the callback invoked again.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 6bb9d21be6bc..4f6b216522a8 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -996,8 +996,26 @@ static struct device_node *qcom_smd_match_channel(struct device_node *edge_node,
 	return NULL;
 }
 
+static int qcom_smd_announce_create(struct rpmsg_device *rpdev)
+{
+	struct qcom_smd_endpoint *qept = to_smd_endpoint(rpdev->ept);
+	struct qcom_smd_channel *channel = qept->qsch;
+	unsigned long flags;
+	bool kick_state;
+
+	spin_lock_irqsave(&channel->recv_lock, flags);
+	kick_state = qcom_smd_channel_intr(channel);
+	spin_unlock_irqrestore(&channel->recv_lock, flags);
+
+	if (kick_state)
+		schedule_work(&channel->edge->state_work);
+
+	return 0;
+}
+
 static const struct rpmsg_device_ops qcom_smd_device_ops = {
 	.create_ept = qcom_smd_create_ept,
+	.announce_create = qcom_smd_announce_create,
 };
 
 static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
-- 
2.16.2
