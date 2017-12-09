Return-Path: <vincent.legoll@gmail.com>
Return-Path: <vincent.legoll@gmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH] remoteproc: make REMOTEPROC a menuconfig to ease disabling it all
Date: Sat,  9 Dec 2017 16:34:58 +0100
Message-Id: <20171209153458.5195-1-vincent.legoll@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Vincent Legoll <vincent.legoll@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

No need to get into the submenu to disable all related
config entries.

This makes it easier to disable all REMOTEPROC config options
without entering the submenu. It will also enable one
to see that en/dis-abled state from the outside menu.

This is only intended to change menuconfig UI, not change
the config dependencies.

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 drivers/remoteproc/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index b609e1d3654b..29341c7d836d 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -1,4 +1,7 @@
-menu "Remoteproc drivers"
+menuconfig REMOTEPROC_MENU
+	bool "Remoteproc drivers"
+
+if REMOTEPROC_MENU
 
 config REMOTEPROC
 	tristate "Support for Remote Processor subsystem"
@@ -10,8 +13,6 @@ config REMOTEPROC
 	  Support for remote processors (such as DSP coprocessors). These
 	  are mainly used on embedded systems.
 
-if REMOTEPROC
-
 config IMX_REMOTEPROC
 	tristate "IMX6/7 remoteproc support"
 	depends on SOC_IMX6SX || SOC_IMX7D
@@ -140,6 +141,5 @@ config ST_REMOTEPROC
 config ST_SLIM_REMOTEPROC
 	tristate
 
-endif # REMOTEPROC
+endif # REMOTEPROC_MENU
 
-endmenu
-- 
2.14.1
