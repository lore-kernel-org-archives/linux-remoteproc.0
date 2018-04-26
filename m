Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH v2 2/6] rpmsg: glink: Store edge name for glink device
Date: Wed, 25 Apr 2018 19:07:48 -0700
Message-Id: <1524708472-18263-3-git-send-email-clew@codeaurora.org>
In-Reply-To: <1524708472-18263-1-git-send-email-clew@codeaurora.org>
References: <1524708472-18263-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Channels may need to identify the edge their channel was probed for.
Store the edge name by reading the label property from device tree or
default to the node name.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---

Changes since v1:
- None

 drivers/rpmsg/qcom_glink_native.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 768ef542a841..c3f548e2ff20 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -101,6 +101,8 @@ struct glink_core_rx_intent {
 struct qcom_glink {
 	struct device *dev;
 
+	const char *name;
+
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox_chan;
 
@@ -1580,6 +1582,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	idr_init(&glink->lcids);
 	idr_init(&glink->rcids);
 
+	ret = of_property_read_string(dev->of_node, "label", &glink->name);
+	if (ret < 0)
+		glink->name = dev->of_node->name;
+
 	glink->mbox_client.dev = dev;
 	glink->mbox_client.knows_txdone = true;
 	glink->mbox_chan = mbox_request_channel(&glink->mbox_client, 0);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
