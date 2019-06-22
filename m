Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] remoteproc: qcom: q6v5-mss: Support loading non-split images
Date: Fri, 21 Jun 2019 18:21:46 -0700
Message-Id: <20190622012146.19719-3-bjorn.andersson@linaro.org>
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
 drivers/remoteproc/qcom_q6v5_mss.c | 33 ++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 981581bcdd56..8fcf9d28dd73 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -659,23 +659,29 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 {
 	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
 	dma_addr_t phys;
+	void *metadata;
 	int mdata_perm;
 	int xferop_ret;
+	size_t size;
 	void *ptr;
 	int ret;
 
-	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, dma_attrs);
+	metadata = qcom_mdt_read_metadata(fw, &size);
+	if (IS_ERR(metadata))
+		return PTR_ERR(metadata);
+
+	ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
 	if (!ptr) {
+		kfree(metadata);
 		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
 		return -ENOMEM;
 	}
 
-	memcpy(ptr, fw->data, fw->size);
+	memcpy(ptr, metadata, size);
 
 	/* Hypervisor mapping to access metadata by modem */
 	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
-	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
-				      true, phys, fw->size);
+	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
 	if (ret) {
 		dev_err(qproc->dev,
 			"assigning Q6 access to metadata failed: %d\n", ret);
@@ -693,14 +699,14 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
 
 	/* Metadata authentication done, remove modem access */
-	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
-					     false, phys, fw->size);
+	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
 	if (xferop_ret)
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
 
 free_dma_attrs:
-	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
+	dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
+	kfree(metadata);
 
 	return ret < 0 ? ret : 0;
 }
@@ -981,7 +987,18 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 
 		ptr = qproc->mpss_region + offset;
 
-		if (phdr->p_filesz) {
+		if (phdr->p_filesz && phdr->p_offset < fw->size) {
+			/* Firmware is large enough to be non-split */
+			if (phdr->p_offset + phdr->p_filesz > fw->size) {
+				dev_err(qproc->dev,
+					"failed to load segment %d from truncated file %s\n",
+					i, fw_name);
+				ret = -EINVAL;
+				goto release_firmware;
+			}
+
+			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
+		} else if (phdr->p_filesz) {
 			/* Replace "xxx.xxx" with "xxx.bxx" */
 			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
 			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
-- 
2.18.0
