Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 15/16] remoteproc: st: associate memory device to memory regions
Date: Thu, 30 Nov 2017 17:46:50 +0100
Message-ID: <1512060411-729-16-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Enable memory device creation for each memory region added
by rproc_add_carveout function.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/st_remoteproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index da42ec9..bf83d82 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -279,6 +279,7 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 		mem->dma = res.start;
 		mem->da = res.start;
 		mem->len = resource_size(&res);
+		strncpy(mem->name, node->name, sizeof(mem->name));
 		mem->va = devm_ioremap_wc(dev, mem->dma, mem->len);
 		if (!mem->va) {
 			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
@@ -286,7 +287,7 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 			return -EBUSY;
 		}
 
-		rproc_add_carveout(rproc, mem, false);
+		rproc_add_carveout(rproc, mem, true);
 	}
 
 	err = clk_prepare(ddata->clk);
-- 
1.9.1
