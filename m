Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: qcom: fix Q6V5_WCSS dependencies
Date: Wed, 18 Jul 2018 13:16:26 +0200
Message-Id: <20180718111730.3531477-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sricharan R <sricharan@codeaurora.org>, Rohit kumar <rohitkr@codeaurora.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

A new driver got added that depends on QCOM_SMD and fails to link
as built-in with CONFIG_QCOM_SMD=m:

drivers/remoteproc/qcom_common.o: In function `smd_subdev_stop':
qcom_common.c:(.text+0x674): undefined reference to `qcom_smd_unregister_edge'
drivers/remoteproc/qcom_common.o: In function `smd_subdev_start':
qcom_common.c:(.text+0x700): undefined reference to `qcom_smd_register_edge'

We've fixed the same thing several times before, so use the same
dependency here.

Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 0dde3753c3a5..052d4dd347f9 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -127,6 +127,7 @@ config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
+	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	select MFD_SYSCON
-- 
2.9.0
