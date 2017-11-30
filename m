Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 14/16] remoteproc: look-up pre-registered carveout by name for carveout allocation
Date: Thu, 30 Nov 2017 17:46:49 +0100
Message-ID: <1512060411-729-15-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Look-up for a pre-registred carveout having the same
name as requested one.
If match found, pre-registed carevout is used and resource
table updated.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9c12319..8436185 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -873,7 +873,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 				 struct fw_rsc_carveout *rsc,
 				 int offset, int avail)
 {
-	struct rproc_mem_entry *carveout, *mapping;
+	struct rproc_mem_entry *carveout, *mapping, *mem;
 	struct device *dev = &rproc->dev;
 	dma_addr_t dma;
 	phys_addr_t pa;
@@ -899,6 +899,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		return -ENOMEM;
 
 	/* Check carveout rsc already part of a registered carveout */
+	/* By device address if any */
 	if (rsc->da != FW_RSC_ADDR_ANY) {
 		va = rproc_find_carveout_by_da(rproc, rsc->da, rsc->len);
 
@@ -933,6 +934,20 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		}
 	}
 
+	/* By name */
+	mem = rproc_find_carveout_by_name(rproc, rsc->name);
+	if (mem) {
+		/*
+		 * Update resource table with registered carevout information
+		 */
+		rsc->len = mem->len;
+		rsc->da = mem->da;
+		rsc->pa = rproc_va_to_pa(mem->va);
+		/* no need to register as already match one for one */
+		return 0;
+	}
+
+	/* No registered carveout found, allocate a new one */
 	va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
 	if (!va) {
 		dev_err(dev->parent,
-- 
1.9.1
