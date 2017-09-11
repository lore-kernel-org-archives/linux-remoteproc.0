Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: qcom: fix RPMSG_QCOM_GLINK_SMEM dependencies
Date: Mon, 11 Sep 2017 21:54:17 +0200
Message-Id: <20170911195431.2913102-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

When RPMSG_QCOM_GLINK_SMEM=m and one driver causes the qcom_common.c file
to be compiled as built-in, we get a link error:

drivers/remoteproc/qcom_common.o: In function `glink_subdev_remove':
qcom_common.c:(.text+0x130): undefined reference to `qcom_glink_smem_unregister'
qcom_common.c:(.text+0x130): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `qcom_glink_smem_unregister'
drivers/remoteproc/qcom_common.o: In function `glink_subdev_probe':
qcom_common.c:(.text+0x160): undefined reference to `qcom_glink_smem_register'
qcom_common.c:(.text+0x160): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `qcom_glink_smem_register'

Out of the three PIL driver instances, QCOM_ADSP_PIL already has a
Kconfig dependency to prevent this from happening, but the other two
do not. This adds the same dependency there.

Fixes: eea07023e6d9 ("remoteproc: qcom: adsp: Allow defining GLINK edge")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index df63e44526ac..bf04479456a0 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -109,6 +109,7 @@ config QCOM_Q6V5_PIL
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	select MFD_SYSCON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
@@ -120,6 +121,7 @@ config QCOM_WCNSS_PIL
 	tristate "Qualcomm WCNSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SMEM
 	select QCOM_MDT_LOADER
 	select QCOM_RPROC_COMMON
-- 
2.9.0
