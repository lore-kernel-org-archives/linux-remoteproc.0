Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: [PATCH] rpmsg: Convert to using %pOFn instead of device_node.name
Date: Mon, 27 Aug 2018 20:52:43 -0500
Message-Id: <20180828015252.28511-42-robh@kernel.org>
In-Reply-To: <20180828015252.28511-1-robh@kernel.org>
References: <20180828015252.28511-1-robh@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 drivers/rpmsg/qcom_smd.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 2b5cf2790954..ab23da3d7131 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -205,7 +205,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 	dev->parent = parent;
 	dev->of_node = node;
 	dev->release = qcom_glink_smem_release;
-	dev_set_name(dev, "%s:%s", node->parent->name, node->name);
+	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 8da83a4ebadc..0dae7c9f4a8f 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1454,7 +1454,7 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 	edge->dev.release = qcom_smd_edge_release;
 	edge->dev.of_node = node;
 	edge->dev.groups = qcom_smd_edge_groups;
-	dev_set_name(&edge->dev, "%s:%s", dev_name(parent), node->name);
+	dev_set_name(&edge->dev, "%s:%pOFn", dev_name(parent), node);
 	ret = device_register(&edge->dev);
 	if (ret) {
 		pr_err("failed to register smd edge\n");
-- 
2.17.1
