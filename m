Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 09/11] remoteproc: Update max_notifyid as we allocate vrings
Date: Wed, 19 Oct 2016 19:40:10 -0700
Message-Id: <1476931212-1806-10-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Vrings are now allocated as we parse the resource table, before we
boot the rproc or register any virtio devices, so it's safe to bump
max_notifyid as part of this process.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c242ca016496..57f12421fdd2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -236,6 +236,10 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	}
 	notifyid = ret;
 
+	/* Potentially bump max_notifyid */
+	if (notifyid > rproc->max_notifyid)
+		rproc->max_notifyid = notifyid;
+
 	dev_dbg(dev, "vring%d: va %p dma %pad size 0x%x idr %d\n",
 		i, va, &dma, size, notifyid);
 
@@ -719,15 +723,6 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	return ret;
 }
 
-static int rproc_count_vrings(struct rproc *rproc, struct fw_rsc_vdev *rsc,
-			      int offset, int avail)
-{
-	/* Summarize the number of notification IDs */
-	rproc->max_notifyid += rsc->num_of_vrings;
-
-	return 0;
-}
-
 /*
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
@@ -736,7 +731,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
 	[RSC_CARVEOUT] = (rproc_handle_resource_t)rproc_handle_carveout,
 	[RSC_DEVMEM] = (rproc_handle_resource_t)rproc_handle_devmem,
 	[RSC_TRACE] = (rproc_handle_resource_t)rproc_handle_trace,
-	[RSC_VDEV] = (rproc_handle_resource_t)rproc_count_vrings,
+	[RSC_VDEV] = NULL,
 };
 
 static rproc_handle_resource_t rproc_vdev_handler[RSC_LAST] = {
-- 
2.5.0
