Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 6/6] rpmsg: glink: Add get_rproc_name device op
Date: Mon, 18 Dec 2017 14:02:14 -0800
Message-Id: <1513634534-22861-7-git-send-email-clew@codeaurora.org>
In-Reply-To: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for clients to query the edge name for the glink device
their channel is registered for.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index a897ccea3098..4748dea0748e 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1346,6 +1346,14 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	return NULL;
 }
 
+static const char *qcom_glink_get_rproc_name(struct rpmsg_device *rpdev)
+{
+	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+	struct qcom_glink *glink = channel->glink;
+
+	return glink->name;
+}
+
 static const struct rpmsg_device_ops glink_chrdev_ops = {
 	.create_ept = qcom_glink_create_ept,
 };
@@ -1353,6 +1361,7 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
+	.get_rproc_name = qcom_glink_get_rproc_name,
 };
 
 static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
