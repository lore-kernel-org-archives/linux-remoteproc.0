Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/4] rpmsg: qcom_smd: Implement endpoint "poll"
Date: Fri,  2 Dec 2016 14:03:35 -0800
Message-Id: <1480716217-23303-2-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
References: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for polling the status of the write buffer so that user
space can use rpmsg character devices in non-blocking mode.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/rpmsg/qcom_smd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 3b77320fb8c9..52c4ec570464 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -919,6 +919,21 @@ static int qcom_smd_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_smd_send(qsept->qsch, data, len, false);
 }
 
+static unsigned int qcom_smd_poll(struct rpmsg_endpoint *ept,
+				  struct file *filp, poll_table *wait)
+{
+	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
+	struct qcom_smd_channel *channel = qsept->qsch;
+	unsigned int mask = 0;
+
+	poll_wait(filp, &channel->fblockread_event, wait);
+
+	if (qcom_smd_get_tx_avail(channel) > 20)
+		mask |= POLLOUT | POLLWRNORM;
+
+	return mask;
+}
+
 /*
  * Finds the device_node for the smd child interested in this channel.
  */
@@ -951,6 +966,7 @@ static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
 	.destroy_ept = qcom_smd_destroy_ept,
 	.send = qcom_smd_send,
 	.trysend = qcom_smd_trysend,
+	.poll = qcom_smd_poll,
 };
 
 /*
-- 
2.5.0
