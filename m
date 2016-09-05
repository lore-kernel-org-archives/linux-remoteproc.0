Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v9 19/19] dmaengine: kconfig: Remove superfluous '\n'
Date: Mon,  5 Sep 2016 14:17:01 +0100
Message-Id: <1473081421-16555-20-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-remoteproc@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

Remove the extra '\n' between kconfig entries.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/dma/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 7c5d946..5b5a341 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -462,7 +462,6 @@ config STM32_DMA
 	  If you have a board based on such a MCU and wish to use DMA say Y or M
 	  here.
 
-
 config S3C24XX_DMAC
 	bool "Samsung S3C24XX DMA support"
 	depends on ARCH_S3C24XX
-- 
1.9.1
