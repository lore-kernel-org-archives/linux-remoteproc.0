Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: qcom: The mbox clients knows_txdone
Date: Wed, 15 Nov 2017 22:08:33 -0800
Message-Id: <20171116060833.5147-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

As both the GLINK and SMD drivers are ticking the txdone of the mailbox
(to implement the doorbell) they should set knows_txdone.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 drivers/rpmsg/qcom_smd.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 80d9af307b40..8ae81431bada 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1576,6 +1576,7 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	idr_init(&glink->rcids);
 
 	glink->mbox_client.dev = dev;
+	glink->mbox_client.knows_txdone = true;
 	glink->mbox_chan = mbox_request_channel(&glink->mbox_client, 0);
 	if (IS_ERR(glink->mbox_chan)) {
 		if (PTR_ERR(glink->mbox_chan) != -EPROBE_DEFER)
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 2d7199e7cb3f..2770b3189e03 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1280,6 +1280,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 	of_property_read_u32(node, key, &edge->remote_pid);
 
 	edge->mbox_client.dev = dev;
+	edge->mbox_client.knows_txdone = true;
 	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
 	if (IS_ERR(edge->mbox_chan)) {
 		if (PTR_ERR(edge->mbox_chan) != -ENODEV)
-- 
2.15.0
