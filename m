Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 5/7] remoteproc: fix rproc_alloc_carveout() for rproc with iommu domain
Date: Thu, 10 Jan 2019 14:49:09 +0100
Message-ID: <1547128151-44077-6-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
References: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Correct remoteproc core behavior when memory carveout device
address is fixed in resource table and rproc device doesn't have
associated IOMMU.
Current returned error is breaking legacy on TI platforms.
This patch restores previous behavior. It adds a warn message when
allocation doesn't fit carveout request, but doesn't stop rproc_start()
sequence anymore.

Fixes: 3bc8140b157c ("remoteproc: configure IOMMU only if device address requested")

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0ecd37993f41..e85722ee156b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -721,6 +721,18 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 	dev_dbg(dev, "carveout va %pK, dma %pad, len 0x%x\n",
 		va, &dma, mem->len);
 
+	if (mem->da != FW_RSC_ADDR_ANY && !rproc->domain) {
+		/*
+		 * Check requested da is equal to dma address
+		 * and print a warn message in case of missalignment.
+		 * Don't stop rproc_start sequence as coprocessor may
+		 * build pa to da translation on its side.
+		 */
+		if (mem->da != (u32)dma)
+			dev_warn(dev->parent,
+				 "Allocated carveout doesn't fit device address request\n");
+	}
+
 	/*
 	 * Ok, this is non-standard.
 	 *
@@ -738,15 +750,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 	 * to use the iommu-based DMA API: we expect 'dma' to contain the
 	 * physical address in this case.
 	 */
-
-	if (mem->da != FW_RSC_ADDR_ANY) {
-		if (!rproc->domain) {
-			dev_err(dev->parent,
-				"Bad carveout rsc configuration\n");
-			ret = -ENOMEM;
-			goto dma_free;
-		}
-
+	if (mem->da != FW_RSC_ADDR_ANY && rproc->domain) {
 		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
 		if (!mapping) {
 			ret = -ENOMEM;
@@ -773,7 +777,9 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 
 		dev_dbg(dev, "carveout mapped 0x%x to %pad\n",
 			mem->da, &dma);
-	} else {
+	}
+
+	if (mem->da == FW_RSC_ADDR_ANY) {
 		/* Update device address as undefined by requester */
 		if ((u64)dma & HIGH_BITS_MASK)
 			dev_warn(dev, "DMA address cast in 32bit to fit resource table format\n");
-- 
2.7.4
