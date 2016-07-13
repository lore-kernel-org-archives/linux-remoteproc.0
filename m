Return-Path: <k.kozlowski@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v6 44/46] remoteproc: qcom: Use unsigned long for dma_attrs
Date: Wed, 13 Jul 2016 10:41:35 +0200
Message-id: <1468399300-5399-44-git-send-email-k.kozlowski@samsung.com>
In-reply-to: <1468399300-5399-43-git-send-email-k.kozlowski@samsung.com>
References: <1468399167-28083-1-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-1-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-2-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-3-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-4-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-5-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-6-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-7-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-8-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-9-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-10-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-11-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-12-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-13-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-14-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-15-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-16-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-17-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-18-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-19-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-20-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-21-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-22-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-23-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-24-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-25-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-26-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-27-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-28-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-29-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-30-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-31-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-32-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-33-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-34-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-35-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-36-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-37-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-38-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-39-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-40-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-41-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-42-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-43-git-send-email-k.kozlowski@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes since v5:
New patch.
---
 drivers/remoteproc/qcom_q6v5_pil.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index fb4c56cc6dfc..4913ec6f9d00 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -349,13 +349,12 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 
 static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 {
-	DEFINE_DMA_ATTRS(attrs);
+	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
 	dma_addr_t phys;
 	void *ptr;
 	int ret;
 
-	dma_set_attr(DMA_ATTR_FORCE_CONTIGUOUS, &attrs);
-	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, &attrs);
+	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, dma_attrs);
 	if (!ptr) {
 		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
 		return -ENOMEM;
@@ -372,7 +371,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
 
-	dma_free_attrs(qproc->dev, fw->size, ptr, phys, &attrs);
+	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
 
 	return ret < 0 ? ret : 0;
 }
-- 
1.9.1
