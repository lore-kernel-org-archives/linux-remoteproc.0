Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 05/16] remoteproc: modify rproc_handle_carveout to support preallocated region
Date: Thu, 30 Nov 2017 17:46:40 +0100
Message-ID: <1512060411-729-6-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In current version rproc_handle_carveout function support only dynamic
region allocation.
This patch extends rproc_handle_carveout function to support different carveout
configurations:
- fixed DA and fixed PA: check if already part of pre-registered carveouts
(platform driver). If no, return error.
- fixed DA and any PA: check if already part of pre-allocated carveouts
(platform driver). If not found and rproc supports iommu, continue with
dynamic allocation (DA will be used for iommu programming), else return
error as no way to force DA.
- any DA and any PA: use original dynamic allocation

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 78525d1..515a17a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -184,6 +184,10 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 	struct rproc_mem_entry *carveout;
 	void *ptr = NULL;
 
+	/*
+	 * da_to_va platform driver is deprecated. Driver should register
+	 * carveout thanks to rproc_add_carveout function
+	 */
 	if (rproc->ops->da_to_va) {
 		ptr = rproc->ops->da_to_va(rproc, da, len);
 		if (ptr)
@@ -677,6 +681,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	struct rproc_mem_entry *carveout, *mapping;
 	struct device *dev = &rproc->dev;
 	dma_addr_t dma;
+	phys_addr_t pa;
 	void *va;
 	int ret;
 
@@ -698,6 +703,41 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	if (!carveout)
 		return -ENOMEM;
 
+	/* Check carveout rsc already part of a registered carveout */
+	if (rsc->da != FW_RSC_ADDR_ANY) {
+		va = rproc_find_carveout_by_da(rproc, rsc->da, rsc->len);
+
+		if (va) {
+			/* Registered region found */
+			pa = rproc_va_to_pa(va);
+			if (rsc->pa != FW_RSC_ADDR_ANY && rsc->pa != (u32)pa) {
+				/* Carveout doesn't match request */
+				dev_err(dev->parent,
+					"Failed to find carveout fitting da and pa\n");
+				return -ENOMEM;
+			}
+
+			/* Update rsc table with physical address */
+			rsc->pa = (u32)pa;
+
+			/* Update carveouts list */
+			carveout->va = va;
+			carveout->len = rsc->len;
+			carveout->da = rsc->da;
+			carveout->priv = (void *)CARVEOUT_RSC;
+
+			list_add_tail(&carveout->node, &rproc->carveouts);
+
+			return 0;
+		}
+
+		if (!rproc->domain) {
+			dev_err(dev->parent,
+				"Bad carveout rsc configuration\n");
+			return -ENOMEM;
+		}
+	}
+
 	va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
 	if (!va) {
 		dev_err(dev->parent,
-- 
1.9.1
