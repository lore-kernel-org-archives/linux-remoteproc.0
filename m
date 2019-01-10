Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 4/7] remoteproc: add warning on resource table cast
Date: Thu, 10 Jan 2019 14:49:08 +0100
Message-ID: <1547128151-44077-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
References: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Today resource table supports only 32bit address fields.
This is not compliant with 64bit platform for which addresses
are cast in 32bit.
This patch adds warn messages when address cast is done.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

---
Changes from v1:
- modify implementation to display warning message only when
  data are modified by cast operation
---
 drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 18a1bbf820c9..0ecd37993f41 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -45,6 +45,8 @@
 
 #include "remoteproc_internal.h"
 
+#define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
+
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
 
@@ -772,6 +774,10 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 		dev_dbg(dev, "carveout mapped 0x%x to %pad\n",
 			mem->da, &dma);
 	} else {
+		/* Update device address as undefined by requester */
+		if ((u64)dma & HIGH_BITS_MASK)
+			dev_warn(dev, "DMA address cast in 32bit to fit resource table format\n");
+
 		mem->da = (u32)dma;
 	}
 
@@ -1115,6 +1121,7 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 	struct rproc_mem_entry *entry, *tmp;
 	struct fw_rsc_carveout *rsc;
 	struct device *dev = &rproc->dev;
+	u64 pa;
 	int ret;
 
 	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
@@ -1151,10 +1158,15 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 
 			/* Use va if defined else dma to generate pa */
 			if (entry->va)
-				rsc->pa = (u32)rproc_va_to_pa(entry->va);
+				pa = (u64)rproc_va_to_pa(entry->va);
 			else
-				rsc->pa = (u32)entry->dma;
+				pa = (u64)entry->dma;
+
+			if (((u64)pa) & HIGH_BITS_MASK)
+				dev_warn(dev,
+					 "Physical address cast in 32bit to fit resource table format\n");
 
+			rsc->pa = (u32)pa;
 			rsc->da = entry->da;
 			rsc->len = entry->len;
 		}
-- 
2.7.4
