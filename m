Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: qcom: fix QCOM_SMD dependencies
Date: Tue, 28 Feb 2017 22:10:05 +0100
Message-Id: <20170228211025.3619144-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

qcom_smd_register_edge() is provided by either QCOM_SMD or RPMSG_QCOM_SMD,
and if both of them are disabled, it does nothing.

The check for the PIL drivers however only checks for QCOM_SMD, so it breaks
with QCOM_SMD=n && RPMSG_QCOM_SMD=m:

drivers/remoteproc/built-in.o: In function `smd_subdev_remove':
qcom_wcnss_iris.c:(.text+0x231c): undefined reference to `qcom_smd_unregister_edge'
drivers/remoteproc/built-in.o: In function `smd_subdev_probe':
qcom_wcnss_iris.c:(.text+0x2344): undefined reference to `qcom_smd_register_edge'
drivers/remoteproc/built-in.o: In function `smd_subdev_probe':
qcom_q6v5_pil.c:(.text+0x3538): undefined reference to `qcom_smd_register_edge'
qcom_q6v5_pil.c:(.text+0x3538): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `qcom_smd_register_edge'

This clarifies the Kconfig dependency.

Fixes: 4b48921a8f74 ("remoteproc: qcom: Use common SMD edge handler")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 65f86bc24c07..1dc43fc5f65f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -76,7 +76,7 @@ config QCOM_ADSP_PIL
 	depends on OF && ARCH_QCOM
 	depends on REMOTEPROC
 	depends on QCOM_SMEM
-	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_RPROC_COMMON
@@ -93,7 +93,7 @@ config QCOM_Q6V5_PIL
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
-	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
 	select MFD_SYSCON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
@@ -104,7 +104,7 @@ config QCOM_Q6V5_PIL
 config QCOM_WCNSS_PIL
 	tristate "Qualcomm WCNSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
-	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
 	select QCOM_MDT_LOADER
-- 
2.9.0
