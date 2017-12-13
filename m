Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/8] remoteproc: Merge rproc_ops and rproc_fw_ops
Date: Wed, 13 Dec 2017 14:41:07 -0800
Message-Id: <20171213224111.17864-5-bjorn.andersson@linaro.org>
In-Reply-To: <20171213224111.17864-1-bjorn.andersson@linaro.org>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

There are currently a few different schemes used for overriding fw_ops
or parts of fw_ops. Merge fw_ops into rproc_ops and expose the default
ELF-loader symbols so that they can be assigned by the drivers.

To keep backwards compatibility with the "default" case, a driver not
specifying the "load" operation is assumed to want the full ELF-loader
suit of functions.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_adsp_pil.c         |  9 ++----
 drivers/remoteproc/qcom_q6v5_pil.c         |  9 ++----
 drivers/remoteproc/qcom_wcnss.c            |  9 ++----
 drivers/remoteproc/remoteproc_core.c       | 10 ++++--
 drivers/remoteproc/remoteproc_elf_loader.c | 30 +++++++-----------
 drivers/remoteproc/remoteproc_internal.h   | 51 +++++++++++-------------------
 drivers/remoteproc/st_slim_rproc.c         | 19 +++--------
 include/linux/remoteproc.h                 | 17 ++++++++--
 8 files changed, 64 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 45e7e66604d4..7b9d810b23f1 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -89,11 +89,6 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 			     adsp->mem_region, adsp->mem_phys, adsp->mem_size);
 }
 
-static const struct rproc_fw_ops adsp_fw_ops = {
-	.find_rsc_table = qcom_mdt_find_rsc_table,
-	.load = adsp_load,
-};
-
 static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
@@ -186,6 +181,8 @@ static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
+	.find_rsc_table = qcom_mdt_find_rsc_table,
+	.load = adsp_load,
 };
 
 static irqreturn_t adsp_wdog_interrupt(int irq, void *dev)
@@ -348,8 +345,6 @@ static int adsp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rproc->fw_ops = &adsp_fw_ops;
-
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
 	adsp->rproc = rproc;
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 342d5eb5d6ed..fbff5d842581 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -343,11 +343,6 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
-static const struct rproc_fw_ops q6v5_fw_ops = {
-	.find_rsc_table = q6v5_find_rsc_table,
-	.load = q6v5_load,
-};
-
 static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
 {
 	unsigned long timeout;
@@ -932,6 +927,8 @@ static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
 	.da_to_va = q6v5_da_to_va,
+	.find_rsc_table = q6v5_find_rsc_table,
+	.load = q6v5_load,
 };
 
 static irqreturn_t q6v5_wdog_interrupt(int irq, void *dev)
@@ -1151,8 +1148,6 @@ static int q6v5_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rproc->fw_ops = &q6v5_fw_ops;
-
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
 	qproc->rproc = rproc;
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index dc79239c43f9..cc44ec598522 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -158,11 +158,6 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 			     wcnss->mem_region, wcnss->mem_phys, wcnss->mem_size);
 }
 
-static const struct rproc_fw_ops wcnss_fw_ops = {
-	.find_rsc_table = qcom_mdt_find_rsc_table,
-	.load = wcnss_load,
-};
-
 static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
 {
 	u32 val;
@@ -315,6 +310,8 @@ static const struct rproc_ops wcnss_ops = {
 	.start = wcnss_start,
 	.stop = wcnss_stop,
 	.da_to_va = wcnss_da_to_va,
+	.find_rsc_table = qcom_mdt_find_rsc_table,
+	.load = wcnss_load,
 };
 
 static irqreturn_t wcnss_wdog_interrupt(int irq, void *dev)
@@ -494,8 +491,6 @@ static int wcnss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rproc->fw_ops = &wcnss_fw_ops;
-
 	wcnss = (struct qcom_wcnss *)rproc->priv;
 	wcnss->dev = &pdev->dev;
 	wcnss->rproc = rproc;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9bc9ee8f4513..f2b6aa5d204c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1437,8 +1437,14 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	atomic_set(&rproc->power, 0);
 
-	/* Set ELF as the default fw_ops handler */
-	rproc->fw_ops = &rproc_elf_fw_ops;
+	/* Default to ELF loader if no load function is specified */
+	if (!rproc->ops->load) {
+		rproc->ops->load = rproc_elf_load_segments;
+		rproc->ops->find_rsc_table = rproc_elf_find_rsc_table;
+		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
+		rproc->ops->sanity_check = rproc_elf_sanity_check;
+		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
+	}
 
 	mutex_init(&rproc->lock);
 
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index c523983a4aec..822fa1bf893f 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -39,8 +39,7 @@
  *
  * Make sure this fw image is sane.
  */
-static int
-rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
+int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
 	const char *name = rproc->firmware;
 	struct device *dev = &rproc->dev;
@@ -98,6 +97,7 @@ rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 
 	return 0;
 }
+EXPORT_SYMBOL(rproc_elf_sanity_check);
 
 /**
  * rproc_elf_get_boot_addr() - Get rproc's boot address.
@@ -110,13 +110,13 @@ rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
  * Note that the boot address is not a configurable property of all remote
  * processors. Some will always boot at a specific hard-coded address.
  */
-static
 u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
 	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
 
 	return ehdr->e_entry;
 }
+EXPORT_SYMBOL(rproc_elf_get_boot_addr);
 
 /**
  * rproc_elf_load_segments() - load firmware segments to memory
@@ -142,8 +142,7 @@ u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
  * directly allocate memory for every segment/resource. This is not yet
  * supported, though.
  */
-static int
-rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
+int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
 	struct device *dev = &rproc->dev;
 	struct elf32_hdr *ehdr;
@@ -207,6 +206,7 @@ rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 
 	return ret;
 }
+EXPORT_SYMBOL(rproc_elf_load_segments);
 
 static struct elf32_shdr *
 find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
@@ -282,9 +282,9 @@ find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
  * size into @tablesz. If a valid table isn't found, NULL is returned
  * (and @tablesz isn't set).
  */
-static struct resource_table *
-rproc_elf_find_rsc_table(struct rproc *rproc, const struct firmware *fw,
-			 int *tablesz)
+struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
+						const struct firmware *fw,
+						int *tablesz)
 {
 	struct elf32_hdr *ehdr;
 	struct elf32_shdr *shdr;
@@ -303,6 +303,7 @@ rproc_elf_find_rsc_table(struct rproc *rproc, const struct firmware *fw,
 
 	return table;
 }
+EXPORT_SYMBOL(rproc_elf_find_rsc_table);
 
 /**
  * rproc_elf_find_loaded_rsc_table() - find the loaded resource table
@@ -315,8 +316,8 @@ rproc_elf_find_rsc_table(struct rproc *rproc, const struct firmware *fw,
  * Returns the pointer to the resource table if it is found or NULL otherwise.
  * If the table wasn't loaded yet the result is unspecified.
  */
-static struct resource_table *
-rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
+struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
+						       const struct firmware *fw)
 {
 	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
 	struct elf32_shdr *shdr;
@@ -327,11 +328,4 @@ rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
 
 	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
 }
-
-const struct rproc_fw_ops rproc_elf_fw_ops = {
-	.load = rproc_elf_load_segments,
-	.find_rsc_table = rproc_elf_find_rsc_table,
-	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
-	.sanity_check = rproc_elf_sanity_check,
-	.get_boot_addr = rproc_elf_get_boot_addr
-};
+EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index c1077bec5d0b..a42690c514e2 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -25,26 +25,6 @@
 
 struct rproc;
 
-/**
- * struct rproc_fw_ops - firmware format specific operations.
- * @find_rsc_table:	find the resource table inside the firmware image
- * @find_loaded_rsc_table: find the loaded resouce table
- * @load:		load firmeware to memory, where the remote processor
- *			expects to find it
- * @sanity_check:	sanity check the fw image
- * @get_boot_addr:	get boot address to entry point specified in firmware
- */
-struct rproc_fw_ops {
-	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
-						 const struct firmware *fw,
-						 int *tablesz);
-	struct resource_table *(*find_loaded_rsc_table)(
-				struct rproc *rproc, const struct firmware *fw);
-	int (*load)(struct rproc *rproc, const struct firmware *fw);
-	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
-	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
-};
-
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
@@ -74,11 +54,20 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
 int rproc_trigger_recovery(struct rproc *rproc);
 
+int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
+u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
+int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
+struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
+						const struct firmware *fw,
+						int *tablesz);
+struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
+						       const struct firmware *fw);
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->fw_ops->sanity_check)
-		return rproc->fw_ops->sanity_check(rproc, fw);
+	if (rproc->ops->sanity_check)
+		return rproc->ops->sanity_check(rproc, fw);
 
 	return 0;
 }
@@ -86,8 +75,8 @@ int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 static inline
 u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->fw_ops->get_boot_addr)
-		return rproc->fw_ops->get_boot_addr(rproc, fw);
+	if (rproc->ops->get_boot_addr)
+		return rproc->ops->get_boot_addr(rproc, fw);
 
 	return 0;
 }
@@ -95,8 +84,8 @@ u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 static inline
 int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->fw_ops->load)
-		return rproc->fw_ops->load(rproc, fw);
+	if (rproc->ops->load)
+		return rproc->ops->load(rproc, fw);
 
 	return -EINVAL;
 }
@@ -106,8 +95,8 @@ struct resource_table *rproc_find_rsc_table(struct rproc *rproc,
 					    const struct firmware *fw,
 					    int *tablesz)
 {
-	if (rproc->fw_ops->find_rsc_table)
-		return rproc->fw_ops->find_rsc_table(rproc, fw, tablesz);
+	if (rproc->ops->find_rsc_table)
+		return rproc->ops->find_rsc_table(rproc, fw, tablesz);
 
 	return NULL;
 }
@@ -116,12 +105,10 @@ static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 						   const struct firmware *fw)
 {
-	if (rproc->fw_ops->find_loaded_rsc_table)
-		return rproc->fw_ops->find_loaded_rsc_table(rproc, fw);
+	if (rproc->ops->find_loaded_rsc_table)
+		return rproc->ops->find_loaded_rsc_table(rproc, fw);
 
 	return NULL;
 }
 
-extern const struct rproc_fw_ops rproc_elf_fw_ops;
-
 #endif /* REMOTEPROC_INTERNAL_H */
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 6cfd862f945b..1538ea915c49 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -200,12 +200,6 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 	return va;
 }
 
-static const struct rproc_ops slim_rproc_ops = {
-	.start		= slim_rproc_start,
-	.stop		= slim_rproc_stop,
-	.da_to_va       = slim_rproc_da_to_va,
-};
-
 /*
  * Firmware handler operations: sanity, boot address, load ...
  */
@@ -223,7 +217,10 @@ static struct resource_table *slim_rproc_find_rsc_table(struct rproc *rproc,
 	return &empty_rsc_tbl;
 }
 
-static struct rproc_fw_ops slim_rproc_fw_ops = {
+static const struct rproc_ops slim_rproc_ops = {
+	.start		= slim_rproc_start,
+	.stop		= slim_rproc_stop,
+	.da_to_va       = slim_rproc_da_to_va,
 	.find_rsc_table = slim_rproc_find_rsc_table,
 };
 
@@ -249,7 +246,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
 	struct rproc *rproc;
 	struct resource *res;
 	int err, i;
-	const struct rproc_fw_ops *elf_ops;
 
 	if (!fw_name)
 		return ERR_PTR(-EINVAL);
@@ -267,13 +263,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
 	slim_rproc = rproc->priv;
 	slim_rproc->rproc = rproc;
 
-	elf_ops = rproc->fw_ops;
-	/* Use some generic elf ops */
-	slim_rproc_fw_ops.load = elf_ops->load;
-	slim_rproc_fw_ops.sanity_check = elf_ops->sanity_check;
-
-	rproc->fw_ops = &slim_rproc_fw_ops;
-
 	/* get imem and dmem */
 	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 6cbc0379a926..e21de55e19d1 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -324,6 +324,7 @@ struct rproc_mem_entry {
 };
 
 struct rproc;
+struct firmware;
 
 /**
  * struct rproc_ops - platform-specific device handlers
@@ -331,12 +332,26 @@ struct rproc;
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @find_rsc_table:	find the resource table inside the firmware image
+ * @find_loaded_rsc_table: find the loaded resouce table
+ * @load:		load firmeware to memory, where the remote processor
+ *			expects to find it
+ * @sanity_check:	sanity check the fw image
+ * @get_boot_addr:	get boot address to entry point specified in firmware
  */
 struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
+	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
+						 const struct firmware *fw,
+						 int *tablesz);
+	struct resource_table *(*find_loaded_rsc_table)(
+				struct rproc *rproc, const struct firmware *fw);
+	int (*load)(struct rproc *rproc, const struct firmware *fw);
+	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
+	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 };
 
 /**
@@ -390,7 +405,6 @@ enum rproc_crash_type {
  * @priv: private data which belongs to the platform-specific rproc module
  * @ops: platform-specific start/stop rproc handlers
  * @dev: virtual device for refcounting and common remoteproc behavior
- * @fw_ops: firmware-specific handlers
  * @power: refcount of users who need this rproc powered up
  * @state: state of the device
  * @lock: lock which protects concurrent manipulations of the rproc
@@ -421,7 +435,6 @@ struct rproc {
 	void *priv;
 	struct rproc_ops *ops;
 	struct device dev;
-	const struct rproc_fw_ops *fw_ops;
 	atomic_t power;
 	unsigned int state;
 	struct mutex lock;
-- 
2.15.0
