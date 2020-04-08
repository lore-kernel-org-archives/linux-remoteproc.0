Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH v2 6/6] remoteproc: qcom: Add notification types to SSR
Date: Wed,  8 Apr 2020 16:36:43 -0700
Message-Id: <1586389003-26675-7-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

The SSR subdevice only adds callback for the unprepare event. Add callbacks
for unprepare, start and prepare events. The client driver for a particular
remoteproc might be interested in knowing the status of the remoteproc
while undergoing SSR, not just when the remoteproc has finished shutting
down.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_common.c | 39 +++++++++++++++++++++++++++++++++++----
 include/linux/remoteproc.h       | 15 +++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 56b0c3e..06611f2 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -183,9 +183,9 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
  *
  * Returns pointer to srcu notifier head on success, ERR_PTR on failure.
  *
- * This registers the @notify function as handler for restart notifications. As
- * remote processors are stopped this function will be called, with the rproc
- * pointer passed as a parameter.
+ * This registers the @notify function as handler for powerup/shutdown
+ * notifications. This function will be invoked inside the callbacks registered
+ * for the ssr subdevice, with the rproc pointer passed as a parameter.
  */
 void *qcom_register_ssr_notifier(struct rproc *rproc, struct notifier_block *nb)
 {
@@ -227,11 +227,39 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
+static int ssr_notify_prepare(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_BEFORE_POWERUP, (void *)ssr->name);
+	return 0;
+}
+
+static int ssr_notify_start(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_AFTER_POWERUP, (void *)ssr->name);
+	return 0;
+}
+
+static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_BEFORE_SHUTDOWN, (void *)ssr->name);
+}
+
+
 static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 
-	srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void *)ssr->name);
+	srcu_notifier_call_chain(ssr->rproc_notif_list,
+				 RPROC_AFTER_SHUTDOWN, (void *)ssr->name);
 }
 
 /**
@@ -248,6 +276,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 {
 	ssr->name = ssr_name;
 	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
+	ssr->subdev.prepare = ssr_notify_prepare;
+	ssr->subdev.start = ssr_notify_start;
+	ssr->subdev.stop = ssr_notify_stop;
 	ssr->subdev.unprepare = ssr_notify_unprepare;
 	ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
 								GFP_KERNEL);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 687e1eb..facadb07 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -452,6 +452,21 @@ struct rproc_dump_segment {
 };
 
 /**
+ * enum rproc_notif_type - Different stages of remoteproc notifications
+ * @RPROC_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
+ * @RPROC_AFTER_SHUTDOWN:	stop stage of  remoteproc
+ * @RPROC_BEFORE_POWERUP:	prepare stage of  remoteproc
+ * @RPROC_AFTER_POWERUP:	start stage of  remoteproc
+ */
+enum rproc_notif_type {
+	RPROC_BEFORE_SHUTDOWN,
+	RPROC_AFTER_SHUTDOWN,
+	RPROC_BEFORE_POWERUP,
+	RPROC_AFTER_POWERUP,
+	RPROC_MAX
+};
+
+/**
  * struct rproc - represents a physical remote processor device
  * @node: list node of this rproc object
  * @domain: iommu domain
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
