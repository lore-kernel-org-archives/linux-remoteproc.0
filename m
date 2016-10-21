Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] dmaengine: st_fdma: Update st_fdma to 'depends on REMOTEPROC'.
Date: Fri, 21 Oct 2016 09:44:25 +0100
Message-Id: <1477039465-31121-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, dan.j.williams@intel.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com
List-ID: <linux-remoteproc@vger.kernel.org>

During randconfig builds you can get the following warning
"warning: (ST_FDMA) selects ST_SLIM_REMOTEPROC which has unmet direct
 dependencies (REMOTEPROC)"

randconfig builds should always build without any warnings so
update fdma to depend on REMOTEPROC so this can not happen.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 661f217..6b96710 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -438,6 +438,7 @@ config STE_DMA40
 config ST_FDMA
 	tristate "ST FDMA dmaengine support"
 	depends on ARCH_STI
+	depends on REMOTEPROC
 	select ST_SLIM_REMOTEPROC
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
-- 
1.9.1
