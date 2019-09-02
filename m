Return-Path: <BATV+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@bombadil.srs.infradead.org>
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/4] dma-mapping: remove dma_release_declared_memory
Date: Mon,  2 Sep 2019 22:07:43 +0200
Message-Id: <20190902200746.16185-2-hch@lst.de>
In-Reply-To: <20190902200746.16185-1-hch@lst.de>
References: <20190902200746.16185-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This function is entirely unused given that declared memory is
generally provided by platform setup code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/DMA-API.txt   | 11 -----------
 include/linux/dma-mapping.h |  6 ------
 kernel/dma/coherent.c       | 11 -----------
 3 files changed, 28 deletions(-)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index e47c63bd4887..c0865ca664b8 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -595,17 +595,6 @@ For reasons of efficiency, most platforms choose to track the declared
 region only at the granularity of a page.  For smaller allocations,
 you should use the dma_pool() API.
 
-::
-
-	void
-	dma_release_declared_memory(struct device *dev)
-
-Remove the memory region previously declared from the system.  This
-API performs *no* in-use checking for this region and will return
-unconditionally having removed all the required structures.  It is the
-driver's job to ensure that no parts of this memory region are
-currently in use.
-
 Part III - Debug drivers use of the DMA-API
 -------------------------------------------
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 48ebe8295987..165cd61f1c6e 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -753,7 +753,6 @@ static inline int dma_get_cache_alignment(void)
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 				dma_addr_t device_addr, size_t size);
-void dma_release_declared_memory(struct device *dev);
 #else
 static inline int
 dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
@@ -761,11 +760,6 @@ dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 {
 	return -ENOSYS;
 }
-
-static inline void
-dma_release_declared_memory(struct device *dev)
-{
-}
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
 static inline void *dmam_alloc_coherent(struct device *dev, size_t size,
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 29fd6590dc1e..7271cda86a37 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -124,17 +124,6 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 }
 EXPORT_SYMBOL(dma_declare_coherent_memory);
 
-void dma_release_declared_memory(struct device *dev)
-{
-	struct dma_coherent_mem *mem = dev->dma_mem;
-
-	if (!mem)
-		return;
-	dma_release_coherent_memory(mem);
-	dev->dma_mem = NULL;
-}
-EXPORT_SYMBOL(dma_release_declared_memory);
-
 static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
 		ssize_t size, dma_addr_t *dma_handle)
 {
-- 
2.20.1
