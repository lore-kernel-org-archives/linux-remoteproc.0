Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 3/6] rpmsg: glink: Add support for rpmsg glink chrdev
Date: Mon, 18 Dec 2017 14:02:11 -0800
Message-Id: <1513634534-22861-4-git-send-email-clew@codeaurora.org>
In-Reply-To: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

RPMSG provides a char device interface to userspace. Probe the rpmsg
chrdev channel to enable the rpmsg_ctrl device creation on glink
transports.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 179132226dc2..786f2eca01f1 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -132,6 +132,13 @@ enum {
 	GLINK_STATE_CLOSING,
 };
 
+struct qcom_glink_device {
+	struct rpmsg_device rpdev;
+	struct qcom_glink *glink;
+};
+
+#define to_glink_device(_x) container_of(_x, struct qcom_glink_device, rpdev)
+
 /**
  * struct glink_channel - internal representation of a channel
  * @rpdev:	rpdev reference, only used for primary endpoints
@@ -1339,6 +1346,10 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	return NULL;
 }
 
+static const struct rpmsg_device_ops glink_chrdev_ops = {
+	.create_ept = qcom_glink_create_ept,
+};
+
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
@@ -1547,6 +1558,30 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static void qcom_glink_device_release(struct device *dev)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	struct qcom_glink_device *gdev = to_glink_device(rpdev);
+
+	kfree(gdev);
+}
+
+static int qcom_glink_create_chrdev(struct qcom_glink *glink)
+{
+	struct qcom_glink_device *gdev;
+
+	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
+	if (!gdev)
+		return -ENOMEM;
+
+	gdev->glink = glink;
+	gdev->rpdev.ops = &glink_chrdev_ops;
+	gdev->rpdev.dev.parent = glink->dev;
+	gdev->rpdev.dev.release = qcom_glink_device_release;
+
+	return rpmsg_chrdev_register_device(&gdev->rpdev);
+}
+
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
@@ -1605,6 +1640,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = qcom_glink_create_chrdev(glink);
+	if (ret)
+		dev_err(glink->dev, "failed to register chrdev\n");
+
 	return glink;
 }
 EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
