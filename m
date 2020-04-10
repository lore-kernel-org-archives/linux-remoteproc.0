Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH 2/2] remoteproc: use rproc_coredump_set_elf_info in drivers
Date: Fri, 10 Apr 2020 12:24:33 +0200
Message-Id: <20200410102433.2672-3-cleger@kalray.eu>
In-Reply-To: <20200410102433.2672-1-cleger@kalray.eu>
References: <20200410102433.2672-1-cleger@kalray.eu>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

Modify drivers which are using remoteproc coredump functionnality to use
rproc_coredump_set_elf_info in order to create correct elf coredump
format.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 1 +
 drivers/remoteproc/qcom_q6v5_mss.c  | 3 +++
 drivers/remoteproc/qcom_q6v5_pas.c  | 1 +
 drivers/remoteproc/qcom_wcnss.c     | 1 +
 drivers/remoteproc/stm32_rproc.c    | 1 +
 5 files changed, 7 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 2b01f2282062..8c3bd0954a13 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -423,6 +423,7 @@ static int adsp_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
 	}
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 03ffc6db4c68..5a7ff1092362 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1355,6 +1355,8 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 		return ret;
 	}
 
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 	qproc->dump_complete_mask = 0;
@@ -1632,6 +1634,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 
 	rproc->auto_boot = false;
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a41860d2243a..991f57e8e55b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -390,6 +390,7 @@ static int adsp_probe(struct platform_device *pdev)
 	}
 
 	rproc->auto_boot = desc->auto_boot;
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	adsp = (struct qcom_adsp *)rproc->priv;
 	adsp->dev = &pdev->dev;
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 0c7afd038f0d..5d65e1a9329a 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -480,6 +480,7 @@ static int wcnss_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
 	}
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
 	wcnss = (struct qcom_wcnss *)rproc->priv;
 	wcnss->dev = &pdev->dev;
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 6a66dbf2df40..0f9d02ca4f5a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -625,6 +625,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (!rproc)
 		return -ENOMEM;
 
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 	rproc->has_iommu = false;
 	ddata = rproc->priv;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.17.1
