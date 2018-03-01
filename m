Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 02/13] remoteproc: add rproc_va_to_pa function
Date: Thu, 1 Mar 2018 17:23:49 +0100
Message-ID: <1519921440-21356-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This new function translates CPU virtual address in
CPU physical one according to virtual address location.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 56b33e4..eb1b779 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -139,6 +139,22 @@ static void rproc_disable_iommu(struct rproc *rproc)
 	iommu_domain_free(domain);
 }
 
+static phys_addr_t rproc_va_to_pa(void *cpu_addr)
+{
+	/*
+	 * Return physical address according to virtual address location
+	 * - in vmalloc: if region ioremapped or defined as dma_alloc_coherent
+	 * - in kernel: if region allocated in generic dma memory pool
+	 */
+	if (is_vmalloc_addr(cpu_addr)) {
+		return page_to_phys(vmalloc_to_page(cpu_addr)) +
+				    offset_in_page(cpu_addr);
+	}
+
+	WARN_ON(!virt_addr_valid(cpu_addr));
+	return virt_to_phys(cpu_addr);
+}
+
 /**
  * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
  * @rproc: handle of a remote processor
@@ -708,7 +724,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	 * In this case, the device address and the physical address
 	 * are the same.
 	 */
-	rsc->pa = dma;
+	rsc->pa = (u32)rproc_va_to_pa(va);
 
 	carveout->va = va;
 	carveout->len = rsc->len;
-- 
1.9.1
