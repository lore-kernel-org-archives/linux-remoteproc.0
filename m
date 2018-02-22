Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] soc: qcom: qmi: add CONFIG_NET dependency
Date: Thu, 22 Feb 2018 16:57:38 +0100
Message-Id: <20180222155833.1860318-1-arnd@arndb.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Suman Anna <s-anna@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Access to the socket API and the root network namespace is only available
when networking is enabled:

ERROR: "kernel_sendmsg" [drivers/soc/qcom/qmi_helpers.ko] undefined!
ERROR: "sock_release" [drivers/soc/qcom/qmi_helpers.ko] undefined!
ERROR: "sock_create_kern" [drivers/soc/qcom/qmi_helpers.ko] undefined!
ERROR: "kernel_getsockname" [drivers/soc/qcom/qmi_helpers.ko] undefined!
ERROR: "init_net" [drivers/soc/qcom/qmi_helpers.ko] undefined!
ERROR: "kernel_recvmsg" [drivers/soc/qcom/qmi_helpers.ko] undefined!

Adding a dependency on CONFIG_NET lets us build it in all randconfig
builds.

Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 1 +
 drivers/soc/qcom/Kconfig   | 2 +-
 samples/Kconfig            | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index a3658aa01838..027274008b08 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -121,6 +121,7 @@ config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
 	depends on RPMSG
 	depends on ARCH_QCOM
+	depends on NET
 	select QCOM_QMI_HELPERS
 	help
 	  The sysmon driver implements a sysmon QMI client and a handler for
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index e050eb83341d..506763d81766 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -37,7 +37,7 @@ config QCOM_PM
 
 config QCOM_QMI_HELPERS
 	tristate
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM && NET
 	help
 	  Helper library for handling QMI encoded messages.  QMI encoded
 	  messages are used in communication between the majority of QRTR
diff --git a/samples/Kconfig b/samples/Kconfig
index 4cb8af2f810f..168291de0184 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -66,6 +66,7 @@ config SAMPLE_QMI_CLIENT
 	tristate "Build qmi client sample -- loadable modules only"
 	depends on m
 	depends on ARCH_QCOM
+	depends on NET
 	select QCOM_QMI_HELPERS
 	help
 	  Build an QMI client sample driver, which demonstrates how to
-- 
2.9.0
