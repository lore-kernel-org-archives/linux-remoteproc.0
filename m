Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] remoteproc: qcom: wcnss: Make SMD handling common
Date: Mon, 30 Jan 2017 09:26:22 -0800
Message-Id: <20170130172623.4894-2-bjorn.andersson@linaro.org>
In-Reply-To: <20170130172623.4894-1-bjorn.andersson@linaro.org>
References: <20170130172623.4894-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Move the SMD edge handling to the Qualcomm common file to make it
reusable for other Qualcomm remoteproc drivers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_common.c | 50 ++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h | 15 ++++++++++--
 drivers/remoteproc/qcom_wcnss.c  | 28 ++++------------------
 3 files changed, 67 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index bd400336e209..bb90481215c6 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -19,10 +19,13 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/remoteproc.h>
+#include <linux/rpmsg/qcom_smd.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
 
+#define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
+
 /**
  * qcom_mdt_find_rsc_table() - provide dummy resource table for remoteproc
  * @rproc:	remoteproc handle
@@ -42,5 +45,52 @@ struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
 
+static int smd_subdev_probe(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
+
+	smd->edge = qcom_smd_register_edge(smd->dev, smd->node);
+
+	return IS_ERR(smd->edge) ? PTR_ERR(smd->edge) : 0;
+}
+
+static void smd_subdev_remove(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
+
+	qcom_smd_unregister_edge(smd->edge);
+	smd->edge = NULL;
+}
+
+/**
+ * qcom_add_smd_subdev() - try to add a SMD subdevice to rproc
+ * @rproc:	rproc handle to parent the subdevice
+ * @smd:	reference to a Qualcomm subdev context
+ */
+void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
+{
+	struct device *dev = &rproc->dev;
+
+	smd->node = of_get_child_by_name(dev->parent->of_node, "smd-edge");
+	if (!smd->node)
+		return;
+
+	smd->dev = dev;
+	rproc_add_subdev(rproc, &smd->subdev, smd_subdev_probe, smd_subdev_remove);
+}
+EXPORT_SYMBOL_GPL(qcom_add_smd_subdev);
+
+/**
+ * qcom_remove_smd_subdev() - remove the smd subdevice from rproc
+ * @rproc:	rproc handle
+ * @smd:	the SMD subdevice to remove
+ */
+void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
+{
+	rproc_remove_subdev(rproc, &smd->subdev);
+	of_node_put(smd->node);
+}
+EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
+
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index caecf27c4ffa..db5c826d5cd4 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -1,11 +1,22 @@
 #ifndef __RPROC_QCOM_COMMON_H__
 #define __RPROC_QCOM_COMMON_H__
 
-struct resource_table;
-struct rproc;
+#include <linux/remoteproc.h>
+#include "remoteproc_internal.h"
+
+struct qcom_rproc_subdev {
+	struct rproc_subdev subdev;
+
+	struct device *dev;
+	struct device_node *node;
+	struct qcom_smd_edge *edge;
+};
 
 struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 					       const struct firmware *fw,
 					       int *tablesz);
 
+void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
+void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
+
 #endif
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f158f8243b04..42ef6f3ebb2e 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -97,9 +97,7 @@ struct qcom_wcnss {
 	void *mem_region;
 	size_t mem_size;
 
-	struct device_node *smd_node;
-	struct qcom_smd_edge *smd_edge;
-	struct rproc_subdev smd_subdev;
+	struct qcom_rproc_subdev smd_subdev;
 };
 
 static const struct wcnss_data riva_data = {
@@ -401,23 +399,6 @@ static irqreturn_t wcnss_stop_ack_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int wcnss_smd_probe(struct rproc_subdev *subdev)
-{
-	struct qcom_wcnss *wcnss = container_of(subdev, struct qcom_wcnss, smd_subdev);
-
-	wcnss->smd_edge = qcom_smd_register_edge(wcnss->dev, wcnss->smd_node);
-
-	return IS_ERR(wcnss->smd_edge) ? PTR_ERR(wcnss->smd_edge) : 0;
-}
-
-static void wcnss_smd_remove(struct rproc_subdev *subdev)
-{
-	struct qcom_wcnss *wcnss = container_of(subdev, struct qcom_wcnss, smd_subdev);
-
-	qcom_smd_unregister_edge(wcnss->smd_edge);
-	wcnss->smd_edge = NULL;
-}
-
 static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
 				 const struct wcnss_vreg_info *info,
 				 int num_vregs)
@@ -600,9 +581,7 @@ static int wcnss_probe(struct platform_device *pdev)
 		}
 	}
 
-	wcnss->smd_node = of_get_child_by_name(pdev->dev.of_node, "smd-edge");
-	if (wcnss->smd_node)
-		rproc_add_subdev(rproc, &wcnss->smd_subdev, wcnss_smd_probe, wcnss_smd_remove);
+	qcom_add_smd_subdev(rproc, &wcnss->smd_subdev);
 
 	ret = rproc_add(rproc);
 	if (ret)
@@ -622,9 +601,10 @@ static int wcnss_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	of_node_put(wcnss->smd_node);
 	qcom_smem_state_put(wcnss->state);
 	rproc_del(wcnss->rproc);
+
+	qcom_remove_smd_subdev(wcnss->rproc, &wcnss->smd_subdev);
 	rproc_free(wcnss->rproc);
 
 	return 0;
-- 
2.11.0
