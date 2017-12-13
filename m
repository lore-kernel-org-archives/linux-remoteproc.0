Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 7/8] remoteproc: Drop dangling find_rsc_table dummies
Date: Wed, 13 Dec 2017 14:41:10 -0800
Message-Id: <20171213224111.17864-8-bjorn.andersson@linaro.org>
In-Reply-To: <20171213224111.17864-1-bjorn.andersson@linaro.org>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

As the core now deals with the lack of a resource table, remove the
dangling custom dummy implementations of find_rsc_table from drivers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_adsp_pil.c |  1 -
 drivers/remoteproc/qcom_common.c   | 19 -------------------
 drivers/remoteproc/qcom_common.h   |  4 ----
 drivers/remoteproc/qcom_q6v5_pil.c | 11 -----------
 drivers/remoteproc/qcom_wcnss.c    |  1 -
 drivers/remoteproc/st_slim_rproc.c | 18 ------------------
 include/linux/remoteproc.h         |  4 ----
 7 files changed, 58 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 7b9d810b23f1..b0b0d5ca1ca0 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -181,7 +181,6 @@ static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
-	.find_rsc_table = qcom_mdt_find_rsc_table,
 	.load = adsp_load,
 };
 
diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 818ee3657043..ce2dcc4f7de7 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -32,25 +32,6 @@
 
 static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
 
-/**
- * qcom_mdt_find_rsc_table() - provide dummy resource table for remoteproc
- * @rproc:	remoteproc handle
- * @fw:		firmware header
- * @tablesz:	outgoing size of the table
- *
- * Returns a dummy table.
- */
-struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
-					       const struct firmware *fw,
-					       int *tablesz)
-{
-	static struct resource_table table = { .ver = 1, };
-
-	*tablesz = sizeof(table);
-	return &table;
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
-
 static int glink_subdev_probe(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index 541586e528b3..73efed969bfd 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -30,10 +30,6 @@ struct qcom_rproc_ssr {
 	const char *name;
 };
 
-struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
-					       const struct firmware *fw,
-					       int *tablesz);
-
 void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
 void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
 
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index fbff5d842581..6f6ea0414366 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -304,16 +304,6 @@ static void q6v5_clk_disable(struct device *dev,
 		clk_disable_unprepare(clks[i]);
 }
 
-static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
-						  const struct firmware *fw,
-						  int *tablesz)
-{
-	static struct resource_table table = { .ver = 1, };
-
-	*tablesz = sizeof(table);
-	return &table;
-}
-
 static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
 				   bool remote_owner, phys_addr_t addr,
 				   size_t size)
@@ -927,7 +917,6 @@ static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
 	.da_to_va = q6v5_da_to_va,
-	.find_rsc_table = q6v5_find_rsc_table,
 	.load = q6v5_load,
 };
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index cc44ec598522..1fa5253020dd 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -310,7 +310,6 @@ static const struct rproc_ops wcnss_ops = {
 	.start = wcnss_start,
 	.stop = wcnss_stop,
 	.da_to_va = wcnss_da_to_va,
-	.find_rsc_table = qcom_mdt_find_rsc_table,
 	.load = wcnss_load,
 };
 
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 1538ea915c49..c6a2a8b68c7a 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -200,28 +200,10 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 	return va;
 }
 
-/*
- * Firmware handler operations: sanity, boot address, load ...
- */
-
-static struct resource_table empty_rsc_tbl = {
-	.ver = 1,
-	.num = 0,
-};
-
-static struct resource_table *slim_rproc_find_rsc_table(struct rproc *rproc,
-					       const struct firmware *fw,
-					       int *tablesz)
-{
-	*tablesz = sizeof(empty_rsc_tbl);
-	return &empty_rsc_tbl;
-}
-
 static const struct rproc_ops slim_rproc_ops = {
 	.start		= slim_rproc_start,
 	.stop		= slim_rproc_stop,
 	.da_to_va       = slim_rproc_da_to_va,
-	.find_rsc_table = slim_rproc_find_rsc_table,
 };
 
 /**
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ec1ada7cc6d7..51ddde7535b9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -332,7 +332,6 @@ struct firmware;
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
- * @find_rsc_table:	find the resource table inside the firmware image
  * @find_loaded_rsc_table: find the loaded resouce table
  * @load:		load firmeware to memory, where the remote processor
  *			expects to find it
@@ -345,9 +344,6 @@ struct rproc_ops {
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
 	int (*load_rsc_table)(struct rproc *rproc, const struct firmware *fw);
-	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
-						 const struct firmware *fw,
-						 int *tablesz);
 	struct resource_table *(*find_loaded_rsc_table)(
 				struct rproc *rproc, const struct firmware *fw);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
-- 
2.15.0
