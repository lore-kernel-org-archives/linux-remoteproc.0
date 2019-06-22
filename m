Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] soc: qcom: mdt_loader: Support loading non-split images
Date: Fri, 21 Jun 2019 18:21:45 -0700
Message-Id: <20190622012146.19719-2-bjorn.andersson@linaro.org>
In-Reply-To: <20190622012146.19719-1-bjorn.andersson@linaro.org>
References: <20190622012146.19719-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In some software releases the firmware images are not split up with each
loadable segment in it's own file. Check the size of the loaded firmware
to see if it still contains each segment to be loaded, before falling
back to the split-out segments.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c       | 88 ++++++++++++++++++++++++++++-
 include/linux/soc/qcom/mdt_loader.h |  2 +
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 9ca7d9484de0..24cd193dec55 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -66,6 +66,66 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
 
+/**
+ * qcom_mdt_read_metadata() - read header and metadata from mdt or mbn
+ * @fw:		firmware of mdt header or mbn
+ * @data_len:	length of the read metadata blob
+ *
+ * The mechanism that performs the authentication of the loading firmware
+ * expects an ELF header directly followed by the segment of hashes, with no
+ * padding inbetween. This function allocates a chunk of memory for this pair
+ * and copy the two pieces into the buffer.
+ *
+ * In the case of split firmware the hash is found directly following the ELF
+ * header, rather than at p_offset described by the second program header.
+ *
+ * The caller is responsible to free (kfree()) the returned pointer.
+ *
+ * Return: pointer to data, or ERR_PTR()
+ */
+void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
+{
+	const struct elf32_phdr *phdrs;
+	const struct elf32_hdr *ehdr;
+	size_t hash_offset;
+	size_t hash_size;
+	size_t ehdr_size;
+	void *data;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	phdrs = (struct elf32_phdr *)(ehdr + 1);
+
+	if (ehdr->e_phnum < 2)
+		return ERR_PTR(-EINVAL);
+
+	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
+		return ERR_PTR(-EINVAL);
+
+	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
+		return ERR_PTR(-EINVAL);
+
+	ehdr_size = phdrs[0].p_filesz;
+	hash_size = phdrs[1].p_filesz;
+
+	data = kmalloc(ehdr_size + hash_size, GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	/* Is the header and hash already packed */
+	if (ehdr_size + hash_size == fw->size)
+		hash_offset = phdrs[0].p_filesz;
+	else
+		hash_offset = phdrs[1].p_offset;
+
+	memcpy(data, fw->data, ehdr_size);
+	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
+
+	*data_len = ehdr_size + hash_size;
+
+	return data;
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
+
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *firmware, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
@@ -78,12 +138,14 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	phys_addr_t max_addr = 0;
+	size_t metadata_len;
 	size_t fw_name_len;
 	ssize_t offset;
+	void *metadata;
 	char *fw_name;
 	bool relocate = false;
 	void *ptr;
-	int ret;
+	int ret = 0;
 	int i;
 
 	if (!fw || !mem_region || !mem_phys || !mem_size)
@@ -101,7 +163,15 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return -ENOMEM;
 
 	if (pas_init) {
-		ret = qcom_scm_pas_init_image(pas_id, fw->data, fw->size);
+		metadata = qcom_mdt_read_metadata(fw, &metadata_len);
+		if (IS_ERR(metadata)) {
+			ret = PTR_ERR(metadata);
+			goto out;
+		}
+
+		ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len);
+
+		kfree(metadata);
 		if (ret) {
 			dev_err(dev, "invalid firmware metadata\n");
 			goto out;
@@ -162,7 +232,19 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 		ptr = mem_region + offset;
 
-		if (phdr->p_filesz) {
+		if (phdr->p_filesz && phdr->p_offset < fw->size) {
+			/* Firmware is large enough to be non-split */
+			if (phdr->p_offset + phdr->p_filesz > fw->size) {
+				dev_err(dev,
+					"failed to load segment %d from truncated file %s\n",
+					i, firmware);
+				ret = -EINVAL;
+				break;
+			}
+
+			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
+		} else if (phdr->p_filesz) {
+			/* Firmware not large enough, load split-out segments */
 			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
 			ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
 							ptr, phdr->p_filesz);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 944b06aefb0f..e600baec6825 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -21,4 +21,6 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, int pas_id, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
 			  phys_addr_t *reloc_base);
+void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
+
 #endif
-- 
2.18.0
