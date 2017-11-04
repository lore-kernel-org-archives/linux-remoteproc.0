Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] hwspinlock: Change hwspinlock to a bool
Date: Sat,  4 Nov 2017 14:37:48 +0800
Message-Id: <2d10549b83f8b4990af60a61b44514b47da4c287.1509777293.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: broonie@kernel.org, arnd@arndb.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, baolin.wang@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Change hwspinlock to a bool in case some drivers will meet dependency
issue when hwspinlock is built as a module.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 6e0a553..f0f4679 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -3,7 +3,7 @@
 #
 
 menuconfig HWSPINLOCK
-	tristate "Hardware Spinlock drivers"
+	bool "Hardware Spinlock drivers"
 
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
-- 
1.9.1
