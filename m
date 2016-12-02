Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Add support for "label" property
Date: Thu,  1 Dec 2016 17:06:14 -0800
Message-Id: <1480640774-20278-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the "label" property, used to give the edge a name other
than the one of the DT node. This allows the implementor to provide
consistently named edges when using the rpmsg character device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 5549cd7fc2ef..7552ef0e82ba 100644
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
@@ -1278,6 +1280,10 @@ static int qcom_smd_parse_edge(struct device *dev,
 		return -EINVAL;
 	}
 
+	ret = of_property_read_string(node, "label", &edge->name);
+	if (ret < 0)
+		edge->name = node->name;
+
 	irq = irq_of_parse_and_map(node, 0);
 	if (irq < 0) {
 		dev_err(dev, "required smd interrupt missing\n");
@@ -1320,7 +1326,7 @@ static ssize_t rpmsg_name_show(struct device *dev,
 {
 	struct qcom_smd_edge *edge = to_smd_edge(dev);
 
-	return sprintf(buf, "%s\n", edge->of_node->name);
+	return sprintf(buf, "%s\n", edge->name);
 }
 static DEVICE_ATTR_RO(rpmsg_name);
 
-- 
2.5.0
