Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V4 6/9] rpmsg: glink: Expose rpmsg name attr for glink
Date: Fri, 27 Jul 2018 17:47:26 +0530
Message-Id: <1532693849-7037-7-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
References: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, robh+dt@kernel.org, arnaud.pouliquen@st.com, andy.gross@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Chris Lew <clew@codeaurora.org>

Expose the name field as an attr so clients listening to uevents for
rpmsg can identify the edge the events correspond to.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 9f3d026..7b4ffa0 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1544,6 +1544,26 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static ssize_t rpmsg_name_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int ret = 0;
+	const char *name;
+
+	ret = of_property_read_string(dev->of_node, "label", &name);
+	if (ret < 0)
+		name = dev->of_node->name;
+
+	return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", name);
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
@@ -1593,6 +1613,12 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	glink->dev = dev;
+	glink->dev->groups = qcom_glink_groups;
+
+	ret = device_add_groups(dev, qcom_glink_groups);
+	if (ret)
+		dev_err(dev, "failed to add groups\n");
+
 	glink->tx_pipe = tx;
 	glink->rx_pipe = rx;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
