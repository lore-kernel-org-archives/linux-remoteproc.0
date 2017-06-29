Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 1/3] drivers: remoteproc: Make mdt_loader firmware authentication optional
Date: Thu, 29 Jun 2017 19:47:39 +0530
Message-Id: <1498745861-20531-2-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
References: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

qcom_mdt_load function loads the mdt type firmware and
authenticates it as well. Make the authentication only
when requested by the caller, so that the function can be used
by self-authenticating remoteproc as well.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/remoteproc/qcom_adsp_pil.c  |  3 ++-
 drivers/remoteproc/qcom_wcnss.c     |  3 ++-
 drivers/soc/qcom/mdt_loader.c       | 24 ++++++++++++++----------
 include/linux/soc/qcom/mdt_loader.h |  2 +-
 4 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 49fe2f8..e168375 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -79,7 +79,8 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 
 	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
-			     adsp->mem_region, adsp->mem_phys, adsp->mem_size);
+			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
+			     true);
 }
 
 static const struct rproc_fw_ops adsp_fw_ops = {
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c768639..b41b9b5 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -153,7 +153,8 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 
 	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			     wcnss->mem_region, wcnss->mem_phys, wcnss->mem_size);
+			     wcnss->mem_region, wcnss->mem_phys,
+			     wcnss->mem_size, true);
 }
 
 static const struct rproc_fw_ops wcnss_fw_ops = {
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index bd63df0..b3947d0 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -88,7 +88,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
  */
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *firmware, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size)
+		  phys_addr_t mem_phys, size_t mem_size, bool auth)
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
+	if (auth) {
+		ret = qcom_scm_pas_init_image(pas_id, fw->data, fw->size);
+		if (ret) {
+			dev_err(dev, "invalid firmware metadata\n");
+			goto out;
+		}
 	}
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
@@ -142,12 +144,14 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	}
 
 	if (relocate) {
-		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
-		if (ret) {
-			dev_err(dev, "unable to setup relocation\n");
-			goto out;
+		if (auth) {
+			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
+						     max_addr - min_addr);
+			if (ret) {
+				dev_err(dev, "unable to setup relocation\n");
+				goto out;
+			}
 		}
-
 		/*
 		 * The image is relocatable, so offset each segment based on
 		 * the lowest segment address.
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index f423001..7ff4dd3 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -13,6 +13,6 @@
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size);
+		  phys_addr_t mem_phys, size_t mem_size, bool auth);
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
