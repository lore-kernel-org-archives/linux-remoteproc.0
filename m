Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 01/17] remoteproc: configure IOMMU only if device address requested
Date: Fri, 27 Jul 2018 15:14:36 +0200
Message-ID: <1532697292-14272-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

If there is no IOMMU associate to remote processor device,
remoteproc_core won't be able to satisfy device address requested
in firmware resource table.
Return an error as configuration won't be coherent.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4cd1a8e..437fabf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -657,7 +657,15 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	 * to use the iommu-based DMA API: we expect 'dma' to contain the
 	 * physical address in this case.
 	 */
-	if (rproc->domain) {
+
+	if (rsc->da != FW_RSC_ADDR_ANY && !rproc->domain) {
+		dev_err(dev->parent,
+			"Bad carveout rsc configuration\n");
+		ret = -ENOMEM;
+		goto dma_free;
+	}
+
+	if (rsc->da != FW_RSC_ADDR_ANY && rproc->domain) {
 		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
 		if (!mapping) {
 			ret = -ENOMEM;
-- 
1.9.1
