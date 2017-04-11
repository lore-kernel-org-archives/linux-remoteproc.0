Return-Path: <vincent.legoll@gmail.com>
Return-Path: <vincent.legoll@gmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH] Make HWSPINLOCK a menuconfig to ease disabling
Date: Tue, 11 Apr 2017 16:21:02 +0200
Message-Id: <20170411142102.25838-2-vincent.legoll@gmail.com>
In-Reply-To: <20170411142102.25838-1-vincent.legoll@gmail.com>
References: <20170411142102.25838-1-vincent.legoll@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: Vincent Legoll <vincent.legoll@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

So that there's no need to get into the submenu to disable all related config
entries.

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 drivers/hwspinlock/Kconfig | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 73a4016..cc26b04 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -2,16 +2,13 @@
 # Generic HWSPINLOCK framework
 #
 
-# HWSPINLOCK always gets selected by whoever wants it.
-config HWSPINLOCK
-	tristate
-
-menu "Hardware Spinlock drivers"
+menuconfig HWSPINLOCK
+	tristate "Hardware Spinlock drivers"
 
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
+	depends on HWSPINLOCK
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX
-	select HWSPINLOCK
 	help
 	  Say y here to support the OMAP Hardware Spinlock device (firstly
 	  introduced in OMAP4).
@@ -20,8 +17,8 @@ config HWSPINLOCK_OMAP
 
 config HWSPINLOCK_QCOM
 	tristate "Qualcomm Hardware Spinlock device"
+	depends on HWSPINLOCK
 	depends on ARCH_QCOM
-	select HWSPINLOCK
 	select MFD_SYSCON
 	help
 	  Say y here to support the Qualcomm Hardware Mutex functionality, which
@@ -32,8 +29,8 @@ config HWSPINLOCK_QCOM
 
 config HWSPINLOCK_SIRF
 	tristate "SIRF Hardware Spinlock device"
+	depends on HWSPINLOCK
 	depends on ARCH_SIRF
-	select HWSPINLOCK
 	help
 	  Say y here to support the SIRF Hardware Spinlock device, which
 	  provides a synchronisation mechanism for the various processors
@@ -44,13 +41,11 @@ config HWSPINLOCK_SIRF
 
 config HSEM_U8500
 	tristate "STE Hardware Semaphore functionality"
+	depends on HWSPINLOCK
 	depends on ARCH_U8500
-	select HWSPINLOCK
 	help
 	  Say y here to support the STE Hardware Semaphore functionality, which
 	  provides a synchronisation mechanism for the various processor on the
 	  SoC.
 
 	  If unsure, say N.
-
-endmenu
-- 
2.9.3
