Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 3/7] remoteproc: fix rproc_alloc_carveout() bad variable cast
Date: Thu, 29 Nov 2018 22:29:24 +0100
Message-ID: <1543526968-56091-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1543526968-56091-1-git-send-email-loic.pallardy@st.com>
References: <1543526968-56091-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

As dma member of struct rproc_mem_entry is dma_addr_t, no
need to cast in u32.

Fixes: d7c51706d095 ("remoteproc: add alloc ops in rproc_mem_entry struct")

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 28df71cb3fef..18a1bbf820c9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -775,7 +775,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 		mem->da = (u32)dma;
 	}
 
-	mem->dma = (u32)dma;
+	mem->dma = dma;
 	mem->va = va;
 
 	return 0;
-- 
2.7.4
