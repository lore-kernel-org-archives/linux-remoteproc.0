Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 10/11] remoteproc: Remove custom vdev handler list
Date: Wed, 19 Oct 2016 19:40:11 -0700
Message-Id: <1476931212-1806-11-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The vdev handler is now just another resource allocator, so handle all
resource types in a single pass.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 57f12421fdd2..f31783d27196 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -731,10 +731,6 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
 	[RSC_CARVEOUT] = (rproc_handle_resource_t)rproc_handle_carveout,
 	[RSC_DEVMEM] = (rproc_handle_resource_t)rproc_handle_devmem,
 	[RSC_TRACE] = (rproc_handle_resource_t)rproc_handle_trace,
-	[RSC_VDEV] = NULL,
-};
-
-static rproc_handle_resource_t rproc_vdev_handler[RSC_LAST] = {
 	[RSC_VDEV] = (rproc_handle_resource_t)rproc_handle_vdev,
 };
 
@@ -905,13 +901,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
 
-	/* look for virtio devices and register them */
-	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
-	if (ret) {
-		dev_err(dev, "Failed to handle vdev resources: %d\n", ret);
-		goto clean_up;
-	}
-
 	/* handle fw resources which are required to boot rproc */
 	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
 	if (ret) {
-- 
2.5.0
