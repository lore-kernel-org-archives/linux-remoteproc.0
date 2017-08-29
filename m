Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] remoteproc: qcom: adsp: Allow defining GLINK edge
Date: Tue, 29 Aug 2017 16:13:35 -0700
Message-Id: <20170829231336.24454-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce the GLINK subdev, which allows the definition of a GLINK edge
as child of a remoteproc.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_adsp_pil.c |  3 +++
 drivers/remoteproc/qcom_common.c   | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h   | 11 +++++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 49fe2f807e1d..42884ace324c 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -71,6 +71,7 @@ struct qcom_adsp {
 	void *mem_region;
 	size_t mem_size;
 
+	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
 };
 
@@ -401,6 +402,7 @@ static int adsp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
+	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
 
 	ret = rproc_add(rproc);
@@ -422,6 +424,7 @@ static int adsp_remove(struct platform_device *pdev)
 	qcom_smem_state_put(adsp->state);
 	rproc_del(adsp->rproc);
 
+	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
 	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
 	rproc_free(adsp->rproc);
 
diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index bb90481215c6..6357f7ae9def 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -19,11 +19,13 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/remoteproc.h>
+#include <linux/rpmsg/qcom_glink.h>
 #include <linux/rpmsg/qcom_smd.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
 
+#define to_glink_subdev(d) container_of(d, struct qcom_rproc_glink, subdev)
 #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
 
 /**
@@ -92,5 +94,52 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
 
+static int glink_subdev_probe(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
+
+	glink->edge = qcom_glink_smem_register(glink->dev, glink->node);
+
+	return IS_ERR(glink->edge) ? PTR_ERR(glink->edge) : 0;
+}
+
+static void glink_subdev_remove(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
+
+	qcom_glink_smem_unregister(glink->edge);
+	glink->edge = NULL;
+}
+
+/**
+ * qcom_add_glink_subdev() - try to add a GLINK subdevice to rproc
+ * @rproc:	rproc handle to parent the subdevice
+ * @glink:	reference to a GLINK subdev context
+ */
+void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
+{
+	struct device *dev = &rproc->dev;
+
+	glink->node = of_get_child_by_name(dev->parent->of_node, "glink-edge");
+	if (!glink->node)
+		return;
+
+	glink->dev = dev;
+	rproc_add_subdev(rproc, &glink->subdev, glink_subdev_probe, glink_subdev_remove);
+}
+EXPORT_SYMBOL_GPL(qcom_add_glink_subdev);
+
+/**
+ * qcom_remove_glink_subdev() - remove a GLINK subdevice from rproc
+ * @rproc:	rproc handle
+ * @glink:	reference to a GLINK subdev context
+ */
+void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
+{
+	rproc_remove_subdev(rproc, &glink->subdev);
+	of_node_put(glink->node);
+}
+EXPORT_SYMBOL_GPL(qcom_remove_glink_subdev);
+
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index db5c826d5cd4..db252b46ea8f 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -12,6 +12,14 @@ struct qcom_rproc_subdev {
 	struct qcom_smd_edge *edge;
 };
 
+struct qcom_rproc_glink {
+	struct rproc_subdev subdev;
+
+	struct device *dev;
+	struct device_node *node;
+	struct qcom_glink *edge;
+};
+
 struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 					       const struct firmware *fw,
 					       int *tablesz);
@@ -19,4 +27,7 @@ struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
 void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
 
+void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
+void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
+
 #endif
-- 
2.12.0
