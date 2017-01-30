Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] remoteproc: qcom: Use common SMD edge handler
Date: Mon, 30 Jan 2017 09:26:23 -0800
Message-Id: <20170130172623.4894-3-bjorn.andersson@linaro.org>
In-Reply-To: <20170130172623.4894-1-bjorn.andersson@linaro.org>
References: <20170130172623.4894-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Call the common SMD edge handler to instantiate subdevices to bring
associated SMD edges up and down as the remoteproc is started and
stopped.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/Kconfig         | 2 ++
 drivers/remoteproc/qcom_adsp_pil.c | 6 ++++++
 drivers/remoteproc/qcom_q6v5_pil.c | 6 ++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 14e57b3e86dc..2c61bd3f73c5 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -76,6 +76,7 @@ config QCOM_ADSP_PIL
 	depends on OF && ARCH_QCOM
 	depends on REMOTEPROC
 	depends on QCOM_SMEM
+	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_RPROC_COMMON
@@ -95,6 +96,7 @@ config QCOM_Q6V5_PIL
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
+	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_RPROC_COMMON
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 284546fedb4d..f941a56b233f 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -61,6 +61,8 @@ struct qcom_adsp {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+
+	struct qcom_rproc_subdev smd_subdev;
 };
 
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
@@ -385,6 +387,8 @@ static int adsp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
+	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_rproc;
@@ -403,6 +407,8 @@ static int adsp_remove(struct platform_device *pdev)
 
 	qcom_smem_state_put(adsp->state);
 	rproc_del(adsp->rproc);
+
+	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
 	rproc_free(adsp->rproc);
 
 	return 0;
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index cb2073242506..0f197fa103e0 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -153,6 +153,8 @@ struct q6v5 {
 	phys_addr_t mpss_reloc;
 	void *mpss_region;
 	size_t mpss_size;
+
+	struct qcom_rproc_subdev smd_subdev;
 };
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
@@ -998,6 +1000,8 @@ static int q6v5_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
+	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_rproc;
@@ -1015,6 +1019,8 @@ static int q6v5_remove(struct platform_device *pdev)
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 
 	rproc_del(qproc->rproc);
+
+	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
 	rproc_free(qproc->rproc);
 
 	return 0;
-- 
2.11.0
