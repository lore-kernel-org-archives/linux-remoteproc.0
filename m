Return-Path: <BATV+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@bombadil.srs.infradead.org>
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/4] dma-mapping: remove the dma_mmap_from_dev_coherent export
Date: Mon,  2 Sep 2019 22:07:44 +0200
Message-Id: <20190902200746.16185-3-hch@lst.de>
In-Reply-To: <20190902200746.16185-1-hch@lst.de>
References: <20190902200746.16185-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

dma_mmap_from_dev_coherent is only used by dma_map_ops instances,
none of which is modular.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/coherent.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 7271cda86a37..7cafe1affdc9 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -277,7 +277,6 @@ int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 
 	return __dma_mmap_from_coherent(mem, vma, vaddr, size, ret);
 }
-EXPORT_SYMBOL(dma_mmap_from_dev_coherent);
 
 int dma_mmap_from_global_coherent(struct vm_area_struct *vma, void *vaddr,
 				   size_t size, int *ret)
-- 
2.20.1
