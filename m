Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 4/7] remoteproc: add warning on resource table cast
Date: Thu, 29 Nov 2018 22:29:25 +0100
Message-ID: <1543526968-56091-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1543526968-56091-1-git-send-email-loic.pallardy@st.com>
References: <1543526968-56091-1-git-send-email-loic.pallardy@st.com>
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
 drivers/remoteproc/remoteproc_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 18a1bbf820c9..61c954bd695e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -772,6 +772,10 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 		dev_dbg(dev, "carveout mapped 0x%x to %pad\n",
 			mem->da, &dma);
 	} else {
+		/* Update device address as undefined by requester */
+		if (sizeof(dma_addr_t) > sizeof(u32))
+			dev_warn(dev, "DMA address cast in 32bit to fit resource table format\n");
+
 		mem->da = (u32)dma;
 	}
 
@@ -1150,6 +1154,10 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
 			 */
 
 			/* Use va if defined else dma to generate pa */
+			if (sizeof(dma_addr_t) > sizeof(u32) ||
+			    sizeof(phys_addr_t) > sizeof(u32))
+				dev_warn(dev, "Physical address cast in 32bit to fit resource table format\n");
+
 			if (entry->va)
 				rsc->pa = (u32)rproc_va_to_pa(entry->va);
 			else
-- 
2.7.4
