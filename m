Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/5] remoteproc: qcom: mdt_loader: Refactor MDT loader
Date: Mon, 30 Jan 2017 08:55:45 -0800
Message-Id: <20170130165547.4344-3-bjorn.andersson@linaro.org>
In-Reply-To: <20170130165547.4344-1-bjorn.andersson@linaro.org>
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Pushing the SCM calls into the MDT loader reduces duplication in the
callers and allows for non-remoteproc clients to use the helper for
parsing and loading MDT files.

Cc: Andy Gross <andy.gross@linaro.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_adsp_pil.c   |  29 +-------
 drivers/remoteproc/qcom_mdt_loader.c | 134 +++++++++++++++++++++++------------
 drivers/remoteproc/qcom_mdt_loader.h |   6 +-
 drivers/remoteproc/qcom_q6v5_pil.c   |   4 +-
 drivers/remoteproc/qcom_wcnss.c      |  29 +-------
 5 files changed, 100 insertions(+), 102 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 43a4ed2f346c..e300b8c7e5aa 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -65,34 +65,9 @@ struct qcom_adsp {
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
-	phys_addr_t fw_addr;
-	size_t fw_size;
-	bool relocate;
-	int ret;
-
-	ret = qcom_scm_pas_init_image(ADSP_PAS_ID, fw->data, fw->size);
-	if (ret) {
-		dev_err(&rproc->dev, "invalid firmware metadata\n");
-		return ret;
-	}
-
-	ret = qcom_mdt_parse(fw, &fw_addr, &fw_size, &relocate);
-	if (ret) {
-		dev_err(&rproc->dev, "failed to parse mdt header\n");
-		return ret;
-	}
-
-	if (relocate) {
-		adsp->mem_reloc = fw_addr;
-
-		ret = qcom_scm_pas_mem_setup(ADSP_PAS_ID, adsp->mem_phys, fw_size);
-		if (ret) {
-			dev_err(&rproc->dev, "unable to setup memory for image\n");
-			return ret;
-		}
-	}
 
-	return qcom_mdt_load(rproc, fw, rproc->firmware);
+	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, ADSP_PAS_ID,
+			     adsp->mem_region, adsp->mem_phys, adsp->mem_size);
 }
 
 static const struct rproc_fw_ops adsp_fw_ops = {
diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/remoteproc/qcom_mdt_loader.c
index 2393398f63ea..f239f6fddbb7 100644
--- a/drivers/remoteproc/qcom_mdt_loader.c
+++ b/drivers/remoteproc/qcom_mdt_loader.c
@@ -19,6 +19,7 @@
 #include <linux/firmware.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/qcom_scm.h>
 #include <linux/remoteproc.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -45,24 +46,33 @@ struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
 
+static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
+{
+	if (phdr->p_type != PT_LOAD)
+		return false;
+
+	if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
+		return false;
+
+	if (!phdr->p_memsz)
+		return false;
+
+	return true;
+}
+
 /**
- * qcom_mdt_parse() - extract useful parameters from the mdt header
- * @fw:		firmware handle
- * @fw_addr:	optional reference for base of the firmware's memory region
- * @fw_size:	optional reference for size of the firmware's memory region
- * @fw_relocate: optional reference for flagging if the firmware is relocatable
+ * qcom_mdt_get_size() - acquire size of the memory region needed to load mdt
+ * @fw:		firmware object for the mdt file
  *
- * Returns 0 on success, negative errno otherwise.
+ * Returns size of the loaded firmware blob, or -EINVAL on failure.
  */
-int qcom_mdt_parse(const struct firmware *fw, phys_addr_t *fw_addr,
-		   size_t *fw_size, bool *fw_relocate)
+ssize_t qcom_mdt_get_size(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
 	phys_addr_t min_addr = (phys_addr_t)ULLONG_MAX;
 	phys_addr_t max_addr = 0;
-	bool relocate = false;
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
@@ -71,18 +81,9 @@ int qcom_mdt_parse(const struct firmware *fw, phys_addr_t *fw_addr,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (phdr->p_type != PT_LOAD)
+		if (!mdt_phdr_valid(phdr))
 			continue;
 
-		if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
-			continue;
-
-		if (!phdr->p_memsz)
-			continue;
-
-		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
-			relocate = true;
-
 		if (phdr->p_paddr < min_addr)
 			min_addr = phdr->p_paddr;
 
@@ -90,39 +91,44 @@ int qcom_mdt_parse(const struct firmware *fw, phys_addr_t *fw_addr,
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
-	if (fw_addr)
-		*fw_addr = min_addr;
-	if (fw_size)
-		*fw_size = max_addr - min_addr;
-	if (fw_relocate)
-		*fw_relocate = relocate;
-
-	return 0;
+	return min_addr < max_addr ? max_addr - min_addr : -EINVAL;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_parse);
+EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
 
 /**
- * qcom_mdt_load() - load the firmware which header is defined in fw
- * @rproc:	rproc handle
- * @fw:		frimware object for the header
- * @firmware:	filename of the firmware, for building .bXX names
+ * qcom_mdt_load() - load the firmware which header is loaded as fw
+ * @dev:	device handle to associate resources with
+ * @fw:		firmware object for the mdt file
+ * @firmware:	name of the firmware, for construction of segment file names
+ * @pas_id:	PAS identifier
+ * @mem_region:	allocated memory region to load firmware into
+ * @mem_phys:	physical address of allocated memory region
+ * @mem_size:	size of the allocated memory region
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_load(struct rproc *rproc,
-		  const struct firmware *fw,
-		  const char *firmware)
+int qcom_mdt_load(struct device *dev, const struct firmware *fw,
+		  const char *firmware, int pas_id, void *mem_region,
+		  phys_addr_t mem_phys, size_t mem_size)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
 	const struct firmware *seg_fw;
+	phys_addr_t mem_reloc;
+	phys_addr_t min_addr = (phys_addr_t)ULLONG_MAX;
+	phys_addr_t max_addr = 0;
 	size_t fw_name_len;
+	size_t offset;
 	char *fw_name;
+	bool relocate = false;
 	void *ptr;
 	int ret;
 	int i;
 
+	if (!fw || !mem_region || !mem_phys || !mem_size)
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -134,31 +140,68 @@ int qcom_mdt_load(struct rproc *rproc,
 	if (!fw_name)
 		return -ENOMEM;
 
+	ret = qcom_scm_pas_init_image(pas_id, fw->data, fw->size);
+	if (ret) {
+		dev_err(dev, "invalid firmware metadata\n");
+		goto out;
+	}
+
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (phdr->p_type != PT_LOAD)
+		if (!mdt_phdr_valid(phdr))
 			continue;
 
-		if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
-			continue;
+		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
+			relocate = true;
+
+		if (phdr->p_paddr < min_addr)
+			min_addr = phdr->p_paddr;
+
+		if (phdr->p_paddr + phdr->p_memsz > max_addr)
+			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
+	}
+
+	if (relocate) {
+		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
+		if (ret) {
+			dev_err(dev, "unable to setup relocation\n");
+			goto out;
+		}
+
+		/*
+		 * The image is relocatable, so offset each segment based on
+		 * the lowest segment address.
+		 */
+		mem_reloc = min_addr;
+	} else {
+		/*
+		 * Image is not relocatable, so offset each segment based on
+		 * the allocated physical chunk of memory.
+		 */
+		mem_reloc = mem_phys;
+	}
 
-		if (!phdr->p_memsz)
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (!mdt_phdr_valid(phdr))
 			continue;
 
-		ptr = rproc_da_to_va(rproc, phdr->p_paddr, phdr->p_memsz);
-		if (!ptr) {
-			dev_err(&rproc->dev, "segment outside memory range\n");
+		offset = phdr->p_paddr - mem_reloc;
+		if (offset < 0 || offset + phdr->p_memsz > mem_size) {
+			dev_err(dev, "segment outside memory range\n");
 			ret = -EINVAL;
 			break;
 		}
 
+		ptr = mem_region + offset;
+
 		if (phdr->p_filesz) {
 			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
-			ret = request_firmware(&seg_fw, fw_name, &rproc->dev);
+			ret = request_firmware(&seg_fw, fw_name, dev);
 			if (ret) {
-				dev_err(&rproc->dev, "failed to load %s\n",
-					fw_name);
+				dev_err(dev, "failed to load %s\n", fw_name);
 				break;
 			}
 
@@ -171,6 +214,7 @@ int qcom_mdt_load(struct rproc *rproc,
 			memset(ptr + phdr->p_filesz, 0, phdr->p_memsz - phdr->p_filesz);
 	}
 
+out:
 	kfree(fw_name);
 
 	return ret;
diff --git a/drivers/remoteproc/qcom_mdt_loader.h b/drivers/remoteproc/qcom_mdt_loader.h
index c5d7122755b6..261088c8da18 100644
--- a/drivers/remoteproc/qcom_mdt_loader.h
+++ b/drivers/remoteproc/qcom_mdt_loader.h
@@ -6,8 +6,10 @@
 #define QCOM_MDT_RELOCATABLE	BIT(27)
 
 struct resource_table * qcom_mdt_find_rsc_table(struct rproc *rproc, const struct firmware *fw, int *tablesz);
-int qcom_mdt_load(struct rproc *rproc, const struct firmware *fw, const char *fw_name);
 
-int qcom_mdt_parse(const struct firmware *fw, phys_addr_t *fw_addr, size_t *fw_size, bool *fw_relocate);
+ssize_t qcom_mdt_get_size(const struct firmware *fw);
+int qcom_mdt_load(struct device *dev, const struct firmware *fw,
+		  const char *fw_name, int pas_id, void *mem_region,
+		  phys_addr_t mem_phys, size_t mem_size);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index db341028f2d1..1afadab4edfd 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -496,6 +496,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	const struct firmware *fw;
 	struct elf32_hdr *ehdr;
 	phys_addr_t mpss_reloc;
+	phys_addr_t boot_addr;
 	phys_addr_t min_addr = (phys_addr_t)ULLONG_MAX;
 	phys_addr_t max_addr = 0;
 	bool relocate = false;
@@ -576,7 +577,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 
 		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
 		if (!size) {
-			writel(mpss_reloc, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+			boot_addr = relocate ? qproc->mpss_phys : min_addr;
+			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
 			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 		}
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index ebd61f5d18bb..aa97a61e6a69 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -152,34 +152,9 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
 static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
-	phys_addr_t fw_addr;
-	size_t fw_size;
-	bool relocate;
-	int ret;
-
-	ret = qcom_scm_pas_init_image(WCNSS_PAS_ID, fw->data, fw->size);
-	if (ret) {
-		dev_err(&rproc->dev, "invalid firmware metadata\n");
-		return ret;
-	}
-
-	ret = qcom_mdt_parse(fw, &fw_addr, &fw_size, &relocate);
-	if (ret) {
-		dev_err(&rproc->dev, "failed to parse mdt header\n");
-		return ret;
-	}
-
-	if (relocate) {
-		wcnss->mem_reloc = fw_addr;
-
-		ret = qcom_scm_pas_mem_setup(WCNSS_PAS_ID, wcnss->mem_phys, fw_size);
-		if (ret) {
-			dev_err(&rproc->dev, "unable to setup memory for image\n");
-			return ret;
-		}
-	}
 
-	return qcom_mdt_load(rproc, fw, rproc->firmware);
+	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
+			     wcnss->mem_region, wcnss->mem_phys, wcnss->mem_size);
 }
 
 static const struct rproc_fw_ops wcnss_fw_ops = {
-- 
2.11.0
