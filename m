Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: adsp-pil: fix recursive dependency
Date: Wed, 16 Nov 2016 09:47:31 +0100
Message-Id: <20161116084759.12627-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The newly added driver tries to 'select' a symbol that it has an
implicit dependency on, which confuses Kconfig:

subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:3:	symbol REMOTEPROC is selected by QCOM_ADSP_PIL

As REMOTEPROC is itself user-visible, we clearly should not select
it from a driver, removing the line fixes the problem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9c41128750ca..5a0019ce7555 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -81,10 +81,10 @@ config DA8XX_REMOTEPROC
 config QCOM_ADSP_PIL
 	tristate "Qualcomm ADSP Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
+	depends on REMOTEPROC
 	depends on QCOM_SMEM
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
-	select REMOTEPROC
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
 	  for the Qualcomm ADSP remote processors.
-- 
2.9.0
