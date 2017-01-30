Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 5/5] soc/qcom: Move qcom_mdt_loader from remoteproc
Date: Mon, 30 Jan 2017 08:55:47 -0800
Message-Id: <20170130165547.4344-5-bjorn.andersson@linaro.org>
In-Reply-To: <20170130165547.4344-1-bjorn.andersson@linaro.org>
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>, Georgi Djakov <georgi.djakov@linaro.org>, Jordan Crouse <jcrouse@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

With the remoteproc parts cleaned out of the MDT loader we can move it
to drivers/soc/qcom.

Cc: Andy Gross <andy.gross@linaro.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

For testing purposes a temporary branch containing these patches can be found
here:

https://github.com/andersson/kernel/commits/linux-next/rproc-q6v5

 drivers/remoteproc/Kconfig                                            | 3 ---
 drivers/remoteproc/Makefile                                           | 1 -
 drivers/remoteproc/qcom_adsp_pil.c                                    | 2 +-
 drivers/remoteproc/qcom_q6v5_pil.c                                    | 2 +-
 drivers/remoteproc/qcom_wcnss.c                                       | 2 +-
 drivers/soc/qcom/Kconfig                                              | 4 ++++
 drivers/soc/qcom/Makefile                                             | 1 +
 drivers/{remoteproc/qcom_mdt_loader.c => soc/qcom/mdt_loader.c}       | 4 +---
 .../qcom_mdt_loader.h => include/linux/soc/qcom/mdt_loader.h          | 4 ++++
 9 files changed, 13 insertions(+), 10 deletions(-)
 rename drivers/{remoteproc/qcom_mdt_loader.c => soc/qcom/mdt_loader.c} (98%)
 rename drivers/remoteproc/qcom_mdt_loader.h => include/linux/soc/qcom/mdt_loader.h (87%)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 71ea703190c6..555dba04b5ae 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -87,9 +87,6 @@ config QCOM_ADSP_PIL
 config QCOM_RPROC_COMMON
 	tristate
 
-config QCOM_MDT_LOADER
-	tristate
-
 config QCOM_Q6V5_PIL
 	tristate "Qualcomm Hexagon V5 Peripherial Image Loader"
 	depends on OF && ARCH_QCOM
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index d4f9525a226d..ffc5e430df27 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_QCOM_ADSP_PIL)		+= qcom_adsp_pil.o
-obj-$(CONFIG_QCOM_MDT_LOADER)		+= qcom_mdt_loader.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_PIL)		+= qcom_q6v5_pil.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index e2151b017616..ce98818d3526 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -26,11 +26,11 @@
 #include <linux/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
+#include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
 #include "qcom_common.h"
-#include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
 
 #define ADSP_CRASH_REASON_SMEM		423
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index d37f7d206b10..a19e7ae5009c 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -29,12 +29,12 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
-#include "qcom_mdt_loader.h"
 
 #include <linux/qcom_scm.h>
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index fbb25ea4ae8a..781211c144c6 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -28,12 +28,12 @@
 #include <linux/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
+#include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/rpmsg/qcom_smd.h>
 
 #include "qcom_common.h"
-#include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
 #include "qcom_wcnss.h"
 
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 461b387d03cc..78b1bb7bcf20 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -10,6 +10,10 @@ config QCOM_GSBI
           functions for connecting the underlying serial UART, SPI, and I2C
           devices to the output pins.
 
+config QCOM_MDT_LOADER
+	tristate
+	select QCOM_SCM
+
 config QCOM_PM
 	bool "Qualcomm Power Management"
 	depends on ARCH_QCOM && !ARM64
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index fdd664edf0bd..1f30260b06b8 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
+obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
 obj-$(CONFIG_QCOM_SMD) +=	smd.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
similarity index 98%
rename from drivers/remoteproc/qcom_mdt_loader.c
rename to drivers/soc/qcom/mdt_loader.c
index b36a47bef056..15cb6e089c42 100644
--- a/drivers/remoteproc/qcom_mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -23,9 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
-
-#include "remoteproc_internal.h"
-#include "qcom_mdt_loader.h"
+#include <linux/soc/qcom/mdt_loader.h>
 
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
diff --git a/drivers/remoteproc/qcom_mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
similarity index 87%
rename from drivers/remoteproc/qcom_mdt_loader.h
rename to include/linux/soc/qcom/mdt_loader.h
index ca9a91709810..f423001db3a9 100644
--- a/drivers/remoteproc/qcom_mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -1,10 +1,14 @@
 #ifndef __QCOM_MDT_LOADER_H__
 #define __QCOM_MDT_LOADER_H__
 
+#include <linux/types.h>
+
 #define QCOM_MDT_TYPE_MASK	(7 << 24)
 #define QCOM_MDT_TYPE_HASH	(2 << 24)
 #define QCOM_MDT_RELOCATABLE	BIT(27)
 
+struct device;
+struct firmware;
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-- 
2.11.0
