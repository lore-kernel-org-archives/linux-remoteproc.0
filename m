Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/5] remoteproc: qcom: q6v5: Decouple driver from MDT loader
Date: Mon, 30 Jan 2017 08:55:43 -0800
Message-Id: <20170130165547.4344-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Rather than duplicating half of the MDT loader in the validation step
move the entire MDT parser into the q6v5 driver. This allows us to make
the shared MDT-loader call the SCM PAS operations directly which
simplifies the client code and allows for better reuse of the code.

Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/Kconfig         |   1 -
 drivers/remoteproc/qcom_q6v5_pil.c | 149 +++++++++++++++++++++++--------------
 2 files changed, 92 insertions(+), 58 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index a5e888043f1f..454fd9a4dd96 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -92,7 +92,6 @@ config QCOM_Q6V5_PIL
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
 	select MFD_SYSCON
-	select QCOM_MDT_LOADER
 	select QCOM_SCM
 	help
 	  Say y here to support the Qualcomm Peripherial Image Loader for the
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 79a8a371a2fb..db341028f2d1 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -37,7 +37,7 @@
 
 #include <linux/qcom_scm.h>
 
-#define MPSS_FIRMWARE_NAME		"modem.mdt"
+#define MPSS_FIRMWARE_NAME		"modem"
 
 #define MPSS_CRASH_REASON_SMEM		421
 
@@ -277,6 +277,16 @@ static void q6v5_clk_disable(struct device *dev,
 		clk_disable_unprepare(clks[i]);
 }
 
+static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
+						  const struct firmware *fw,
+						  int *tablesz)
+{
+	static struct resource_table table = { .ver = 1, };
+
+	*tablesz = sizeof(table);
+	return &table;
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -287,7 +297,7 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 }
 
 static const struct rproc_fw_ops q6v5_fw_ops = {
-	.find_rsc_table = qcom_mdt_find_rsc_table,
+	.find_rsc_table = q6v5_find_rsc_table,
 	.load = q6v5_load,
 };
 
@@ -464,46 +474,109 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 	return ret < 0 ? ret : 0;
 }
 
-static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
+static bool q6v5_phdr_valid(const struct elf32_phdr *phdr)
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
+static int q6v5_mpss_load(struct q6v5 *qproc)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
+	const struct firmware *seg_fw;
+	const struct firmware *fw;
 	struct elf32_hdr *ehdr;
-	phys_addr_t boot_addr;
-	phys_addr_t fw_addr;
-	bool relocate;
+	phys_addr_t mpss_reloc;
+	phys_addr_t min_addr = (phys_addr_t)ULLONG_MAX;
+	phys_addr_t max_addr = 0;
+	bool relocate = false;
+	char seg_name[10];
+	size_t offset;
 	size_t size;
+	void *ptr;
 	int ret;
 	int i;
 
-	ret = qcom_mdt_parse(fw, &fw_addr, NULL, &relocate);
-	if (ret) {
-		dev_err(qproc->dev, "failed to parse mdt header\n");
+	ret = request_firmware(&fw, MPSS_FIRMWARE_NAME ".mdt", qproc->dev);
+	if (ret < 0) {
+		dev_err(qproc->dev, "unable to load " MPSS_FIRMWARE_NAME ".mdt\n");
 		return ret;
 	}
 
-	if (relocate)
-		boot_addr = qproc->mpss_phys;
-	else
-		boot_addr = fw_addr;
+	/* Initialize the RMB validator */
+	writel(0, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+
+	ret = q6v5_mpss_init_image(qproc, fw);
+	if (ret)
+		goto release_firmware;
 
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
-	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (phdr->p_type != PT_LOAD)
+		if (!q6v5_phdr_valid(phdr))
 			continue;
 
-		if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
-			continue;
+		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
+			relocate = true;
 
-		if (!phdr->p_memsz)
+		if (phdr->p_paddr < min_addr)
+			min_addr = phdr->p_paddr;
+
+		if (phdr->p_paddr + phdr->p_memsz > max_addr)
+			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
+	}
+
+	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (!q6v5_phdr_valid(phdr))
 			continue;
 
+		offset = phdr->p_paddr - mpss_reloc;
+		if (offset < 0 || offset + phdr->p_memsz > qproc->mpss_size) {
+			dev_err(qproc->dev, "segment outside memory range\n");
+			ret = -EINVAL;
+			goto release_firmware;
+		}
+
+		ptr = qproc->mpss_region + offset;
+
+		if (phdr->p_filesz) {
+			snprintf(seg_name, sizeof(seg_name),
+				 MPSS_FIRMWARE_NAME ".b%02d", i);
+			ret = request_firmware(&seg_fw, seg_name, qproc->dev);
+			if (ret) {
+				dev_err(qproc->dev, "failed to load %s\n", seg_name);
+				goto release_firmware;
+			}
+
+			memcpy(ptr, seg_fw->data, seg_fw->size);
+
+			release_firmware(seg_fw);
+		}
+
+		if (phdr->p_memsz > phdr->p_filesz) {
+			memset(ptr + phdr->p_filesz, 0,
+			       phdr->p_memsz - phdr->p_filesz);
+		}
+
 		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
 		if (!size) {
-			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+			writel(mpss_reloc, qproc->rmb_base + RMB_PMI_CODE_START_REG);
 			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 		}
 
@@ -517,44 +590,6 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
 
-	return ret < 0 ? ret : 0;
-}
-
-static int q6v5_mpss_load(struct q6v5 *qproc)
-{
-	const struct firmware *fw;
-	phys_addr_t fw_addr;
-	bool relocate;
-	int ret;
-
-	ret = request_firmware(&fw, MPSS_FIRMWARE_NAME, qproc->dev);
-	if (ret < 0) {
-		dev_err(qproc->dev, "unable to load " MPSS_FIRMWARE_NAME "\n");
-		return ret;
-	}
-
-	ret = qcom_mdt_parse(fw, &fw_addr, NULL, &relocate);
-	if (ret) {
-		dev_err(qproc->dev, "failed to parse mdt header\n");
-		goto release_firmware;
-	}
-
-	if (relocate)
-		qproc->mpss_reloc = fw_addr;
-
-	/* Initialize the RMB validator */
-	writel(0, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
-
-	ret = q6v5_mpss_init_image(qproc, fw);
-	if (ret)
-		goto release_firmware;
-
-	ret = qcom_mdt_load(qproc->rproc, fw, MPSS_FIRMWARE_NAME);
-	if (ret)
-		goto release_firmware;
-
-	ret = q6v5_mpss_validate(qproc, fw);
-
 release_firmware:
 	release_firmware(fw);
 
-- 
2.11.0
