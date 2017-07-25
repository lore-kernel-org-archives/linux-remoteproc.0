Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] remoteproc: qcom: Add support for SSR notifications
Date: Mon, 24 Jul 2017 22:56:43 -0700
Message-Id: <20170725055644.20947-2-bjorn.andersson@linaro.org>
In-Reply-To: <20170725055644.20947-1-bjorn.andersson@linaro.org>
References: <20170725055644.20947-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This adds the remoteproc part of subsystem restart, which is responsible
for emitting notifications to other processors in the system about a
dying remoteproc instance.

These notifications are propagated to the various communication systems
in the various remote processors to shut down communication links that
was left in a dangling state as the remoteproc was stopped (or crashed).

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_adsp_pil.c    |  6 +++
 drivers/remoteproc/qcom_common.c      | 71 +++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h      | 10 +++++
 drivers/remoteproc/qcom_q6v5_pil.c    |  3 ++
 include/linux/remoteproc/qcom_rproc.h | 22 +++++++++++
 5 files changed, 112 insertions(+)
 create mode 100644 include/linux/remoteproc/qcom_rproc.h

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 49fe2f807e1d..a41d399766fd 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -38,6 +38,7 @@ struct adsp_data {
 	const char *firmware_name;
 	int pas_id;
 	bool has_aggre2_clk;
+	const char *ssr_name;
 };
 
 struct qcom_adsp {
@@ -72,6 +73,7 @@ struct qcom_adsp {
 	size_t mem_size;
 
 	struct qcom_rproc_subdev smd_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
 };
 
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
@@ -402,6 +404,7 @@ static int adsp_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
+	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
 
 	ret = rproc_add(rproc);
 	if (ret)
@@ -423,6 +426,7 @@ static int adsp_remove(struct platform_device *pdev)
 	rproc_del(adsp->rproc);
 
 	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
+	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
 	rproc_free(adsp->rproc);
 
 	return 0;
@@ -433,6 +437,7 @@ static const struct adsp_data adsp_resource_init = {
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
 		.has_aggre2_clk = false,
+		.ssr_name = "lpass",
 };
 
 static const struct adsp_data slpi_resource_init = {
@@ -440,6 +445,7 @@ static const struct adsp_data slpi_resource_init = {
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
 		.has_aggre2_clk = true,
+		.ssr_name = "dsps",
 };
 
 static const struct of_device_id adsp_of_match[] = {
diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index bb90481215c6..5556e767d65b 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -18,6 +18,7 @@
 #include <linux/firmware.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/remoteproc.h>
 #include <linux/rpmsg/qcom_smd.h>
 
@@ -25,6 +26,9 @@
 #include "qcom_common.h"
 
 #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
+#define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
+
+BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
 
 /**
  * qcom_mdt_find_rsc_table() - provide dummy resource table for remoteproc
@@ -92,5 +96,72 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
 
+/**
+ * qcom_register_ssr_notifier() - register SSR notification handler
+ * @nb:		notifier_block to notify for restart notifications
+ *
+ * Returns 0 on success, negative errno on failure.
+ *
+ * This register the @notify function as handler for restart notifications. As
+ * remote processors are stopped this function will be called, with the SSR
+ * name passed as a parameter.
+ */
+int qcom_register_ssr_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&ssr_notifiers, nb);
+}
+EXPORT_SYMBOL_GPL(qcom_register_ssr_notifier);
+
+/**
+ * qcom_unregister_ssr_notifier() - unregister SSR notification handler
+ * @nb:		notifier_block to unregister
+ */
+void qcom_unregister_ssr_notifier(struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&ssr_notifiers, nb);
+}
+EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
+
+static int ssr_notify_start(struct rproc_subdev *subdev)
+{
+	return  0;
+}
+
+static void ssr_notify_stop(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+
+	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr->name);
+}
+
+/**
+ * qcom_add_ssr_subdev() - register subdevice as restart notification source
+ * @rproc:	rproc handle
+ * @ssr:	SSR subdevice handle
+ * @ssr_name:	identifier to use for notifications originating from @rproc
+ *
+ * As the @ssr is registered with the @rproc SSR events will be sent to all
+ * registered listeners in the system as the remoteproc is shut down.
+ */
+void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
+			 const char *ssr_name)
+{
+	ssr->name = ssr_name;
+
+	rproc_add_subdev(rproc, &ssr->subdev, ssr_notify_start, ssr_notify_stop);
+}
+EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
+
+/**
+ * qcom_remove_ssr_subdev() - remove subdevice as restart notification source
+ * @rproc:	rproc handle
+ * @ssr:	SSR subdevice handle
+ */
+void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
+{
+	rproc_remove_subdev(rproc, &ssr->subdev);
+}
+EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
+
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index db5c826d5cd4..fab28b64b8ea 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -12,6 +12,12 @@ struct qcom_rproc_subdev {
 	struct qcom_smd_edge *edge;
 };
 
+struct qcom_rproc_ssr {
+	struct rproc_subdev subdev;
+
+	const char *name;
+};
+
 struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 					       const struct firmware *fw,
 					       int *tablesz);
@@ -19,4 +25,8 @@ struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
 void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
 
+void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
+			 const char *ssr_name);
+void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr);
+
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 8fd697a3cf8f..fc3ef1e81433 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -153,6 +153,7 @@ struct q6v5 {
 	size_t mpss_size;
 
 	struct qcom_rproc_subdev smd_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
 };
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
@@ -1038,6 +1039,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
+	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
 
 	ret = rproc_add(rproc);
 	if (ret)
@@ -1058,6 +1060,7 @@ static int q6v5_remove(struct platform_device *pdev)
 	rproc_del(qproc->rproc);
 
 	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
+	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
 	rproc_free(qproc->rproc);
 
 	return 0;
diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
new file mode 100644
index 000000000000..fa8e38681b4b
--- /dev/null
+++ b/include/linux/remoteproc/qcom_rproc.h
@@ -0,0 +1,22 @@
+#ifndef __QCOM_RPROC_H__
+#define __QCOM_RPROC_H__
+
+struct notifier_block;
+
+#if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
+
+int qcom_register_ssr_notifier(struct notifier_block *nb);
+void qcom_unregister_ssr_notifier(struct notifier_block *nb);
+
+#else
+
+static inline int qcom_register_ssr_notifier(struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline void qcom_unregister_ssr_notifier(struct notifier_block *nb) {}
+
+#endif
+
+#endif
-- 
2.12.0
