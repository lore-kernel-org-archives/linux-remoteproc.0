Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: wcnss-pil: add QCOM_SMD dependency
Date: Fri, 18 Nov 2016 17:15:06 +0100
Message-Id: <20161118161528.775709-1-arnd@arndb.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ohad Ben-Cohen <ohad@wizery.com>, Vinod Koul <vinod.koul@intel.com>, Peter Griffin <peter.griffin@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

When qcom_smd is a loadable module and adsp-pil is built-in,
we get a link error:

drivers/remoteproc/qcom_wcnss_pil.o: In function `wcnss_smd_remove':
qcom_wcnss_iris.c:(.text.wcnss_smd_remove+0x10): undefined reference to `qcom_smd_unregister_edge'
drivers/remoteproc/qcom_wcnss_pil.o: In function `wcnss_smd_probe':
qcom_wcnss_iris.c:(.text.wcnss_smd_probe+0x12): undefined reference to `qcom_smd_register_edge'

This adds a Kconfig dependency to avoid this. We can still allow
build-testing with SMD disabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 5a0019ce7555..677b3fede83d 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -106,6 +106,7 @@ config QCOM_Q6V5_PIL
 config QCOM_WCNSS_PIL
 	tristate "Qualcomm WCNSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
+	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD = n)
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
 	select QCOM_MDT_LOADER
-- 
2.9.0
