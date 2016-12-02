Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] rpmsg: qcom_smd: Add support for "label" property
Date: Fri,  2 Dec 2016 14:06:02 -0800
Message-Id: <1480716362-23467-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the "label" property, used to give the edge a name other
than the one of the DT node. This allows the implementor to provide
consistently named edges when using the rpmsg character device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Moved sysfs attribute to the correct (this) patch

 drivers/rpmsg/qcom_smd.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 1b1f18373d89..3b77320fb8c9 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -117,6 +117,8 @@ static const struct {
 struct qcom_smd_edge {
 	struct device dev;
 
+	const char *name;
+
 	struct device_node *of_node;
 	unsigned edge_id;
 	unsigned remote_pid;
@@ -1248,6 +1250,10 @@ static int qcom_smd_parse_edge(struct device *dev,
 		return -EINVAL;
 	}
 
+	ret = of_property_read_string(node, "label", &edge->name);
+	if (ret < 0)
+		edge->name = node->name;
+
 	irq = irq_of_parse_and_map(node, 0);
 	if (irq < 0) {
 		dev_err(dev, "required smd interrupt missing\n");
@@ -1285,6 +1291,21 @@ static void qcom_smd_edge_release(struct device *dev)
 	kfree(edge);
 }
 
+static ssize_t rpmsg_name_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct qcom_smd_edge *edge = to_smd_edge(dev);
+
+	return sprintf(buf, "%s\n", edge->name);
+}
+static DEVICE_ATTR_RO(rpmsg_name);
+
+static struct attribute *qcom_smd_edge_attrs[] = {
+	&dev_attr_rpmsg_name.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(qcom_smd_edge);
+
 /**
  * qcom_smd_register_edge() - register an edge based on an device_node
  * @parent:    parent device for the edge
@@ -1306,6 +1327,7 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 
 	edge->dev.parent = parent;
 	edge->dev.release = qcom_smd_edge_release;
+	edge->dev.groups = qcom_smd_edge_groups;
 	dev_set_name(&edge->dev, "%s:%s", dev_name(parent), node->name);
 	ret = device_register(&edge->dev);
 	if (ret) {
-- 
2.5.0
