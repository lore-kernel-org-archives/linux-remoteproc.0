Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/2] remoteproc: qcom: Rename Hexagon v5 modem driver
Date: Mon, 24 Sep 2018 16:45:26 -0700
Message-Id: <20180924234526.22916-3-bjorn.andersson@linaro.org>
In-Reply-To: <20180924234526.22916-1-bjorn.andersson@linaro.org>
References: <20180924234526.22916-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The qcom_q6v5_pil implements support for the self-authenticating modem
subsystem. With the introduction of other q6v5 based non-TZ based
remoteproc driver the current name is cause for confusion, so rename it
to be more specific.

No functional change.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Chances since v2:
- Updated module description, driver name and header comment

 drivers/remoteproc/Kconfig                         | 14 +++++++-------
 drivers/remoteproc/Makefile                        |  2 +-
 .../{qcom_q6v5_pil.c => qcom_q6v5_mss.c}           |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/remoteproc/{qcom_q6v5_pil.c => qcom_q6v5_mss.c} (99%)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 425e502c6471..8894935583e2 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -92,30 +92,30 @@ config QCOM_Q6V5_COMMON
 	depends on ARCH_QCOM
 	depends on QCOM_SMEM
 
-config QCOM_Q6V5_PAS
-	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
+config QCOM_Q6V5_MSS
+	tristate "Qualcomm Hexagon V5 self-authenticating modem subsystem support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
-	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
-	  Say y here to support the TrustZone based Peripherial Image Loader
-	  for the Qualcomm Hexagon v5 based remote processors.
+	  Say y here to support the Qualcomm self-authenticating modem
+	  subsystem based on Hexagon V5.
 
-config QCOM_Q6V5_PIL
-	tristate "Qualcomm Hexagon V5 Peripherial Image Loader"
+config QCOM_Q6V5_PAS
+	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
+	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index eb86c8ba5a87..050f41ac93b0 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -16,8 +16,8 @@ obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
+obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
 obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
-obj-$(CONFIG_QCOM_Q6V5_PIL)		+= qcom_q6v5_pil.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_mss.c
similarity index 99%
rename from drivers/remoteproc/qcom_q6v5_pil.c
rename to drivers/remoteproc/qcom_q6v5_mss.c
index d7a4b9eca5d2..9ebbb9339295 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1,5 +1,5 @@
 /*
- * Qualcomm Peripheral Image Loader
+ * Qualcomm self-authenticating modem subsystem remoteproc driver
  *
  * Copyright (C) 2016 Linaro Ltd.
  * Copyright (C) 2014 Sony Mobile Communications AB
@@ -1368,11 +1368,11 @@ static struct platform_driver q6v5_driver = {
 	.probe = q6v5_probe,
 	.remove = q6v5_remove,
 	.driver = {
-		.name = "qcom-q6v5-pil",
+		.name = "qcom-q6v5-mss",
 		.of_match_table = q6v5_of_match,
 	},
 };
 module_platform_driver(q6v5_driver);
 
-MODULE_DESCRIPTION("Peripheral Image Loader for Hexagon");
+MODULE_DESCRIPTION("Qualcomm Self-authenticating modem remoteproc driver");
 MODULE_LICENSE("GPL v2");
-- 
2.18.0
