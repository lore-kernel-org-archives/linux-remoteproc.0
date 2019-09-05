Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH 3/3] rpmsg: smd: implement get_mtu ops
Date: Thu, 5 Sep 2019 16:27:10 +0200
Message-ID: <1567693630-27544-4-git-send-email-arnaud.pouliquen@st.com>
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
 drivers/rpmsg/qcom_smd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 4abbeea782fa..f233f8d85062 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -989,6 +989,13 @@ static __poll_t qcom_smd_poll(struct rpmsg_endpoint *ept,
 	return mask;
 }
 
+static ssize_t qcom_smd_get_mtu(struct rpmsg_endpoint *ept)
+{
+	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
+
+	return qcom_smd_get_tx_avail(qsept->qsch);
+}
+
 /*
  * Finds the device_node for the smd child interested in this channel.
  */
@@ -1040,6 +1047,7 @@ static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
 	.send = qcom_smd_send,
 	.trysend = qcom_smd_trysend,
 	.poll = qcom_smd_poll,
+	.get_mtu = qcom_smd_get_mtu,
 };
 
 static void qcom_smd_release_device(struct device *dev)
-- 
2.7.4
