Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 3/4] soc: qcom: mdt-loader: Return relocation base
Date: Fri,  5 Jan 2018 16:04:19 -0800
Message-Id: <20180106000420.10070-4-bjorn.andersson@linaro.org>
In-Reply-To: <20180106000420.10070-1-bjorn.andersson@linaro.org>
References: <20180106000420.10070-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In order to implement support for grabbing core dumps in remoteproc it's
necessary to know the relocated base of the image, as the offsets from
the virtual memory base might not be based on the physical address.

Return the adjusted physical base address to the caller.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

Changes since v1:
- New patch

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c        | 4 ++--
 drivers/media/platform/qcom/venus/firmware.c | 2 +-
 drivers/remoteproc/qcom_adsp_pil.c           | 4 +++-
 drivers/remoteproc/qcom_wcnss.c              | 3 ++-
 drivers/soc/qcom/mdt_loader.c                | 7 ++++++-
 include/linux/soc/qcom/mdt_loader.h          | 3 ++-
 6 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a1f4eeeb73e2..3cab1c74df84 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -87,14 +87,14 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname)
 	 */
 	if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
 		ret = qcom_mdt_load(dev, fw, fwname, GPU_PAS_ID,
-				mem_region, mem_phys, mem_size);
+				mem_region, mem_phys, mem_size, NULL);
 	} else {
 		char newname[strlen("qcom/") + strlen(fwname) + 1];
 
 		sprintf(newname, "qcom/%s", fwname);
 
 		ret = qcom_mdt_load(dev, fw, newname, GPU_PAS_ID,
-				mem_region, mem_phys, mem_size);
+				mem_region, mem_phys, mem_size, NULL);
 	}
 	if (ret)
 		goto out;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 521d4b36c090..c4a577848dd7 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -76,7 +76,7 @@ int venus_boot(struct device *dev, const char *fwname)
 	}
 
 	ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID, mem_va, mem_phys,
-			    mem_size);
+			    mem_size, NULL);
 
 	release_firmware(mdt);
 
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 373c167892d7..833763aa3f2a 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -82,7 +82,9 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 
 	return qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
-			     adsp->mem_region, adsp->mem_phys, adsp->mem_size);
+			     adsp->mem_region, adsp->mem_phys, adsp->mem_size,
+			     &adsp->mem_reloc);
+
 }
 
 static int adsp_start(struct rproc *rproc)
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 3f0609236a76..599c1aa73b7f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -153,7 +153,8 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 
 	return qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			     wcnss->mem_region, wcnss->mem_phys, wcnss->mem_size);
+			     wcnss->mem_region, wcnss->mem_phys,
+			     wcnss->mem_size, &wcnss->mem_reloc);
 }
 
 static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 08bd8549242a..17b314d9a148 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -83,12 +83,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
  * @mem_region:	allocated memory region to load firmware into
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
+ * @reloc_base:	adjusted physical address after relocation
  *
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *firmware, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size)
+		  phys_addr_t mem_phys, size_t mem_size,
+		  phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -192,6 +194,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			memset(ptr + phdr->p_filesz, 0, phdr->p_memsz - phdr->p_filesz);
 	}
 
+	if (reloc_base)
+		*reloc_base = mem_reloc;
+
 out:
 	kfree(fw_name);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index bd8e0864b059..5b98bbdabc25 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -14,6 +14,7 @@ struct firmware;
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size);
+		  phys_addr_t mem_phys, size_t mem_size,
+		  phys_addr_t *reloc_base);
 
 #endif
-- 
2.15.0
