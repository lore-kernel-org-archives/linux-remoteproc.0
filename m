Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v3 1/6] remoteproc: qcom: mdt_loader: Make the firmware authentication optional
Date: Thu, 31 Aug 2017 10:15:29 +0530
Message-Id: <1504154734-12175-2-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
References: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

qcom_mdt_load function loads the mdt type firmware and
initialises the secure memory as well. Make the initialisation only
when requested by the caller, so that the function can be used
by self-authenticating remoteproc as well.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/soc/qcom/mdt_loader.c       | 70 +++++++++++++++++++++++++++++++------
 include/linux/soc/qcom/mdt_loader.h |  3 ++
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index bd63df0..851f5d7 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -86,9 +86,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *firmware, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size)
+static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
+			   const char *firmware, int pas_id, void *mem_region,
+			   phys_addr_t mem_phys, size_t mem_size, bool pas_init)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -119,10 +119,12 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!fw_name)
 		return -ENOMEM;
 
-	ret = qcom_scm_pas_init_image(pas_id, fw->data, fw->size);
-	if (ret) {
-		dev_err(dev, "invalid firmware metadata\n");
-		goto out;
+	if (pas_init) {
+		ret = qcom_scm_pas_init_image(pas_id, fw->data, fw->size);
+		if (ret) {
+			dev_err(dev, "invalid firmware metadata\n");
+			goto out;
+		}
 	}
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
@@ -142,10 +144,13 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	}
 
 	if (relocate) {
-		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
-		if (ret) {
-			dev_err(dev, "unable to setup relocation\n");
-			goto out;
+		if (pas_init) {
+			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
+						     max_addr - min_addr);
+			if (ret) {
+				dev_err(dev, "unable to setup relocation\n");
+				goto out;
+			}
 		}
 
 		/*
@@ -198,7 +203,50 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	return ret;
 }
+
+/**
+ * qcom_mdt_load() - sets up the secure memory for the firmware and
+		     loads the firmware
+ * @dev:	device handle to associate resources with
+ * @fw:		firmware object for the mdt file
+ * @firmware:	name of the firmware, for construction of segment file names
+ * @pas_id:	PAS identifier
+ * @mem_region:	allocated memory region to load firmware into
+ * @mem_phys:	physical address of allocated memory region
+ * @mem_size:	size of the allocated memory region
+ *
+ * Returns 0 on success, negative errno otherwise.
+ */
+int qcom_mdt_load(struct device *dev, const struct firmware *fw,
+		  const char *firmware, int pas_id, void *mem_region,
+		  phys_addr_t mem_phys, size_t mem_size)
+{
+	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+			       mem_size, true);
+}
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
+/**
+ * qcom_mdt_load_no_init() - load the firmware which header is loaded as fw
+ * @dev:	device handle to associate resources with
+ * @fw:		firmware object for the mdt file
+ * @firmware:	name of the firmware, for construction of segment file names
+ * @pas_id:	PAS identifier
+ * @mem_region:	allocated memory region to load firmware into
+ * @mem_phys:	physical address of allocated memory region
+ * @mem_size:	size of the allocated memory region
+ *
+ * Returns 0 on success, negative errno otherwise.
+ */
+int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
+			  const char *firmware, int pas_id,
+			  void *mem_region, phys_addr_t mem_phys,
+			  size_t mem_size)
+{
+	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+			       mem_size, false);
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index f423001..228053a 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,4 +15,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size);
 
+int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
+			  const char *fw_name, int pas_id, void *mem_region,
+			  phys_addr_t mem_phys, size_t mem_size);
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
