Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: fix null pointer dereference on glink only platforms
Date: Tue,  3 Apr 2018 23:45:15 +0530
Message-Id: <20180403181515.12322-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Currently calling list_del on smd subdev remove path results in
null pointer dereference on glink only platforms. Fix this by
adding safety checks in glink/smd subdev remove paths.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 00602499713f..a0cd6a50913f 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -74,6 +74,9 @@ EXPORT_SYMBOL_GPL(qcom_add_glink_subdev);
  */
 void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
 {
+	if (!glink->node)
+		return;
+
 	rproc_remove_subdev(rproc, &glink->subdev);
 	of_node_put(glink->node);
 }
@@ -121,6 +124,9 @@ EXPORT_SYMBOL_GPL(qcom_add_smd_subdev);
  */
 void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 {
+	if (!smd->node)
+		return;
+
 	rproc_remove_subdev(rproc, &smd->subdev);
 	of_node_put(smd->node);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
