Return-Path: <BATV+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@bombadil.srs.infradead.org>
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/4] remoteproc: don't allow modular build
Date: Mon,  2 Sep 2019 22:07:45 +0200
Message-Id: <20190902200746.16185-4-hch@lst.de>
In-Reply-To: <20190902200746.16185-1-hch@lst.de>
References: <20190902200746.16185-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc started using dma_declare_coherent_memory recently, which is
a bad idea from drivers, and the maintainers agreed to fix that.  But
until that is fixed only allow building the driver built in so that we
can remove the dma_declare_coherent_memory export and prevent other
drivers from "accidentally" using it like remoteproc.  Note that the
driver would also leak the declared coherent memory on unload if it
actually was built as a module at the moment.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 28ed306982f7..94afdde4bc9f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -2,7 +2,7 @@
 menu "Remoteproc drivers"
 
 config REMOTEPROC
-	tristate "Support for Remote Processor subsystem"
+	bool "Support for Remote Processor subsystem"
 	depends on HAS_DMA
 	select CRC32
 	select FW_LOADER
-- 
2.20.1
