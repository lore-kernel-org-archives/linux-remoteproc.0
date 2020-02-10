Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [RESEND PATCH] hwspinlock: Allow drivers to be built with COMPILE_TEST
Date: Mon, 10 Feb 2020 17:01:07 +0800
Message-Id: <5a95c3de07ef020a4e2f2776fa5adb00637ee387.1581324976.git.baolin.wang7@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, baolin.wang7@gmail.com
List-ID: <linux-remoteproc@vger.kernel.org>

Allow drivers to be built with COMPILE_TEST.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/Kconfig |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 37740e9..826a105 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -9,7 +9,7 @@ menuconfig HWSPINLOCK
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
 	depends on HWSPINLOCK
-	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3
+	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
 	help
 	  Say y here to support the OMAP Hardware Spinlock device (firstly
 	  introduced in OMAP4).
@@ -19,7 +19,7 @@ config HWSPINLOCK_OMAP
 config HWSPINLOCK_QCOM
 	tristate "Qualcomm Hardware Spinlock device"
 	depends on HWSPINLOCK
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to support the Qualcomm Hardware Mutex functionality, which
@@ -31,7 +31,7 @@ config HWSPINLOCK_QCOM
 config HWSPINLOCK_SIRF
 	tristate "SIRF Hardware Spinlock device"
 	depends on HWSPINLOCK
-	depends on ARCH_SIRF
+	depends on ARCH_SIRF || COMPILE_TEST
 	help
 	  Say y here to support the SIRF Hardware Spinlock device, which
 	  provides a synchronisation mechanism for the various processors
@@ -42,7 +42,7 @@ config HWSPINLOCK_SIRF
 
 config HWSPINLOCK_SPRD
 	tristate "SPRD Hardware Spinlock device"
-	depends on ARCH_SPRD
+	depends on ARCH_SPRD || COMPILE_TEST
 	depends on HWSPINLOCK
 	help
 	  Say y here to support the SPRD Hardware Spinlock device.
@@ -51,7 +51,7 @@ config HWSPINLOCK_SPRD
 
 config HWSPINLOCK_STM32
 	tristate "STM32 Hardware Spinlock device"
-	depends on MACH_STM32MP157
+	depends on MACH_STM32MP157 || COMPILE_TEST
 	depends on HWSPINLOCK
 	help
 	  Say y here to support the STM32 Hardware Spinlock device.
@@ -61,7 +61,7 @@ config HWSPINLOCK_STM32
 config HSEM_U8500
 	tristate "STE Hardware Semaphore functionality"
 	depends on HWSPINLOCK
-	depends on ARCH_U8500
+	depends on ARCH_U8500 || COMPILE_TEST
 	help
 	  Say y here to support the STE Hardware Semaphore functionality, which
 	  provides a synchronisation mechanism for the various processor on the
-- 
1.7.9.5
