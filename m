Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 4/6] rpmsg: glink: Expose rpmsg name attr for glink
Date: Mon, 18 Dec 2017 14:02:12 -0800
Message-Id: <1513634534-22861-5-git-send-email-clew@codeaurora.org>
In-Reply-To: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Expose the name field as an attr so clients listening to uevents for
rpmsg can identify the edge the events correspond to.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 786f2eca01f1..a897ccea3098 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1558,6 +1558,22 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static ssize_t rpmsg_name_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	struct qcom_glink_device *gdev = to_glink_device(rpdev);
+
+	return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", gdev->glink->name);
+}
+static DEVICE_ATTR_RO(rpmsg_name);
+
+static struct attribute *qcom_glink_attrs[] = {
+	&dev_attr_rpmsg_name.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(qcom_glink);
+
 static void qcom_glink_device_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
@@ -1597,6 +1613,8 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	glink->dev = dev;
+	glink->dev->groups = qcom_glink_groups;
+
 	glink->tx_pipe = tx;
 	glink->rx_pipe = rx;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
