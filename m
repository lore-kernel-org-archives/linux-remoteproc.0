Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] remoteproc: qcom: Fix error handling paths in order to avoid memory leaks
Date: Wed, 15 Nov 2017 07:58:35 +0100
Message-Id: <20171115065835.14525-1-christophe.jaillet@wanadoo.fr>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

In case of error returned by 'q6v5_xfer_mem_ownership', we must free
some resources before returning.

In 'q6v5_mpss_init_image()', add a new label to undo a previous
'dma_alloc_attrs()'.
In 'q6v5_mpss_load()', re-use the already existing error handling code to
undo a previous 'request_firmware()', as already done in the other error
handling paths of the function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
We could certainly also propagate the error code returned by
'q6v5_xfer_mem_ownership()' instead of returning an unconditional -EAGAIN.
Not sure of the potential impacts, so I've left it as-is.
---
 drivers/remoteproc/qcom_q6v5_pil.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index a019796c363a..8a3fa2bcc9f6 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -580,7 +580,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 	if (ret) {
 		dev_err(qproc->dev,
 			"assigning Q6 access to metadata failed: %d\n", ret);
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto free_dma_attrs;
 	}
 
 	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
@@ -599,6 +600,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
 
+free_dma_attrs:
 	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
 
 	return ret < 0 ? ret : 0;
@@ -712,7 +714,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	if (ret) {
 		dev_err(qproc->dev,
 			"assigning Q6 access to mpss memory failed: %d\n", ret);
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto release_firmware;
 	}
 
 	boot_addr = relocate ? qproc->mpss_phys : min_addr;
-- 
2.14.1
