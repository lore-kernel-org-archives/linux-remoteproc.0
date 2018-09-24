Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/2] remoteproc: qcom: Rename Hexagon v5 PAS driver
Date: Mon, 24 Sep 2018 16:45:25 -0700
Message-Id: <20180924234526.22916-2-bjorn.andersson@linaro.org>
In-Reply-To: <20180924234526.22916-1-bjorn.andersson@linaro.org>
References: <20180924234526.22916-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The Hexagon v5 ADSP driver is used for more than only the ADSP and
there's an upcoming non-PAS ADSP PIL for SDM845, so rename the driver to
qcom_q6v5_pas in order to better suite this.

Cc: Rohit kumar <rohitkr@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Move the rename of qcom_q6v5_pil to the 2nd patch, where it belongs.

 drivers/remoteproc/Kconfig                    | 27 ++++++++++---------
 drivers/remoteproc/Makefile                   |  2 +-
 .../{qcom_adsp_pil.c => qcom_q6v5_pas.c}      |  4 +--
 3 files changed, 17 insertions(+), 16 deletions(-)
 rename drivers/remoteproc/{qcom_adsp_pil.c => qcom_q6v5_pas.c} (98%)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 052d4dd347f9..425e502c6471 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -84,8 +84,16 @@ config KEYSTONE_REMOTEPROC
 	  It's safe to say N here if you're not interested in the Keystone
 	  DSPs or just want to use a bare minimum kernel.
 
-config QCOM_ADSP_PIL
-	tristate "Qualcomm ADSP Peripheral Image Loader"
+config QCOM_RPROC_COMMON
+	tristate
+
+config QCOM_Q6V5_COMMON
+	tristate
+	depends on ARCH_QCOM
+	depends on QCOM_SMEM
+
+config QCOM_Q6V5_PAS
+	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
@@ -98,15 +106,7 @@ config QCOM_ADSP_PIL
 	select QCOM_SCM
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
-	  for the Qualcomm ADSP remote processors.
-
-config QCOM_RPROC_COMMON
-	tristate
-
-config QCOM_Q6V5_COMMON
-	tristate
-	depends on ARCH_QCOM
-	depends on QCOM_SMEM
+	  for the Qualcomm Hexagon v5 based remote processors.
 
 config QCOM_Q6V5_PIL
 	tristate "Qualcomm Hexagon V5 Peripherial Image Loader"
@@ -120,8 +120,9 @@ config QCOM_Q6V5_PIL
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
-	  Say y here to support the Qualcomm Peripherial Image Loader for the
-	  Hexagon V5 based remote processors.
+	  Say y here to support the TrustZone based Peripherial Image Loader
+	  for the Qualcomm Hexagon v5 based remote processors. This is commonly
+	  used to control subsystems such as ADSP, Compute and Sensor.
 
 config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 03332fa7e2ee..eb86c8ba5a87 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -14,9 +14,9 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
-obj-$(CONFIG_QCOM_ADSP_PIL)		+= qcom_adsp_pil.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
+obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
 obj-$(CONFIG_QCOM_Q6V5_PIL)		+= qcom_q6v5_pil.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_q6v5_pas.c
similarity index 98%
rename from drivers/remoteproc/qcom_adsp_pil.c
rename to drivers/remoteproc/qcom_q6v5_pas.c
index d4339a6da616..2478ef3cd519 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -364,11 +364,11 @@ static struct platform_driver adsp_driver = {
 	.probe = adsp_probe,
 	.remove = adsp_remove,
 	.driver = {
-		.name = "qcom_adsp_pil",
+		.name = "qcom_q6v5_pas",
 		.of_match_table = adsp_of_match,
 	},
 };
 
 module_platform_driver(adsp_driver);
-MODULE_DESCRIPTION("Qualcomm MSM8974/MSM8996 ADSP Peripherial Image Loader");
+MODULE_DESCRIPTION("Qualcomm Hexagon v5 Peripheral Authentication Service driver");
 MODULE_LICENSE("GPL v2");
-- 
2.18.0
