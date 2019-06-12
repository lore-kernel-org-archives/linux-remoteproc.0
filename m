Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
Date: Wed, 12 Jun 2019 11:55:21 +0200
Message-Id: <20190612095521.4703-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc: Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

When preparing the subdevice for the vdev, also copy dma_pfn_offset
since this is used for sub device dma allocations. Without that, there
is incoherency between the parent dma settings and the childs one,
potentially leading to dma_alloc_coherent failure (due to phys_to_dma
using dma_pfn_offset for translation).
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 263e9c9614a8..3b56ca043231 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
 	rvdev->dev.parent = rproc->dev.parent;
+	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
 	rvdev->dev.release = rproc_rvdev_release;
 	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
 	dev_set_drvdata(&rvdev->dev, rvdev);
-- 
2.15.0.276.g89ea799
