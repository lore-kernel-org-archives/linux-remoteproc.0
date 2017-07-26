Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: srinivas.kandagatla@linaro.org
Subject: [PATCH] rpmsg: qcom_smd: add of_node node to edge device
Date: Wed, 26 Jul 2017 18:53:44 +0200
Message-Id: <20170726165344.1120-1-srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch assigns the device node to the edge device, so that the edge
device drivers could read required device tree properties.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index a0a39a8..b01774e 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1368,6 +1368,7 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 
 	edge->dev.parent = parent;
 	edge->dev.release = qcom_smd_edge_release;
+	edge->dev.of_node = node;
 	edge->dev.groups = qcom_smd_edge_groups;
 	dev_set_name(&edge->dev, "%s:%s", dev_name(parent), node->name);
 	ret = device_register(&edge->dev);
-- 
2.9.3
