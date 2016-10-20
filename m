Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 03/11] remoteproc: wcnss: Bond SMD edge to remoteproc
Date: Wed, 19 Oct 2016 19:40:04 -0700
Message-Id: <1476931212-1806-4-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Allow the wcnss smd edge to be described as a child of the wcnss
remoteproc node and make the edge life cycle follow the running state of
the remoteproc.

This bond is necessary to clean up the smd state when the remote
processor is suddenly removed, and in some cases even when it shut down
in a controlled fasion.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_wcnss.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f5cedeaafba1..0c47fa286794 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -30,6 +30,7 @@
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/rpmsg/qcom_smd.h>
 
 #include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
@@ -94,6 +95,10 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+
+	struct device_node *smd_node;
+	struct qcom_smd_edge *smd_edge;
+	struct rproc_subdev smd_subdev;
 };
 
 static const struct wcnss_data riva_data = {
@@ -396,6 +401,23 @@ static irqreturn_t wcnss_stop_ack_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int wcnss_smd_probe(struct rproc_subdev *subdev)
+{
+	struct qcom_wcnss *wcnss = container_of(subdev, struct qcom_wcnss, smd_subdev);
+
+	wcnss->smd_edge = qcom_smd_register_edge(wcnss->dev, wcnss->smd_node);
+
+	return IS_ERR(wcnss->smd_edge) ? PTR_ERR(wcnss->smd_edge) : 0;
+}
+
+static void wcnss_smd_remove(struct rproc_subdev *subdev)
+{
+	struct qcom_wcnss *wcnss = container_of(subdev, struct qcom_wcnss, smd_subdev);
+
+	qcom_smd_unregister_edge(wcnss->smd_edge);
+	wcnss->smd_edge = NULL;
+}
+
 static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
 				 const struct wcnss_vreg_info *info,
 				 int num_vregs)
@@ -578,6 +600,10 @@ static int wcnss_probe(struct platform_device *pdev)
 		}
 	}
 
+	wcnss->smd_node = of_get_child_by_name(pdev->dev.of_node, "smd-edge");
+	if (wcnss->smd_node)
+		rproc_add_subdev(rproc, &wcnss->smd_subdev, wcnss_smd_probe, wcnss_smd_remove);
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_rproc;
@@ -596,6 +622,7 @@ static int wcnss_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
+	of_node_put(wcnss->smd_node);
 	qcom_smem_state_put(wcnss->state);
 	rproc_del(wcnss->rproc);
 	rproc_free(wcnss->rproc);
-- 
2.5.0
