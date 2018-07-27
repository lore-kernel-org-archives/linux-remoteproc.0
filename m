Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 11/17] remoteproc: modify rproc_handle_carveout to support pre-registered region
Date: Fri, 27 Jul 2018 15:14:46 +0200
Message-ID: <1532697292-14272-12-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In current version rproc_handle_carveout() function registers carveout
for allocation.
This patch extends rproc_handle_carveout() function to support
pre-registered region. Match is done on region name, then requested
device address and length are checked.
If match found, pre-registered region is associated with resource
table request.
If no name match found, new carveout is registered for allocation.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5dd5edf..c543d04 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -840,6 +840,29 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
 		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
 
+	/*
+	 * Check carveout rsc already part of a registered carveout,
+	 * Search by name, then check the da and length
+	 */
+	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
+
+	if (carveout) {
+		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
+			dev_err(dev,
+				"Carveout already associated to resource table\n");
+			return -ENOMEM;
+		}
+
+		if (rproc_check_carveout_da(rproc, carveout, rsc->da, rsc->len))
+			return -ENOMEM;
+
+		/* Update memory carveout with resource table info */
+		carveout->rsc_offset = offset;
+		carveout->flags = rsc->flags;
+
+		return 0;
+	}
+
 	/* Register carveout in in list */
 	carveout = rproc_mem_entry_init(dev, 0, 0, rsc->len, rsc->da,
 					rproc_alloc_carveout,
@@ -1120,8 +1143,15 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 			 * In this case, the device address and the physical address
 			 * are the same.
 			 */
+
+			/* Use va if defined else dma to generate pa */
 			if (entry->va)
 				rsc->pa = (u32)rproc_va_to_pa(entry->va);
+			else
+				rsc->pa = (u32)entry->dma;
+
+			rsc->da = entry->da;
+			rsc->len = entry->len;
 		}
 	}
 
-- 
1.9.1
