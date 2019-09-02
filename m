Return-Path: <BATV+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@bombadil.srs.infradead.org>
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 4/4] dma-mapping: remove the dma_declare_coherent_memory export
Date: Mon,  2 Sep 2019 22:07:46 +0200
Message-Id: <20190902200746.16185-5-hch@lst.de>
In-Reply-To: <20190902200746.16185-1-hch@lst.de>
References: <20190902200746.16185-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

dma_declare_coherent_memory is something that the platform setup code
(which pretty much means the device tree these days) need to do so that
drivers can use the memory as declared by the platform.  Drivers
themselves have no business calling this function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/coherent.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 7cafe1affdc9..545e3869b0e3 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -122,7 +122,6 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 		dma_release_coherent_memory(mem);
 	return ret;
 }
-EXPORT_SYMBOL(dma_declare_coherent_memory);
 
 static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
 		ssize_t size, dma_addr_t *dma_handle)
-- 
2.20.1
