Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Correct resource handling upon boot failure
Date: Sun,  2 Oct 2016 17:41:29 -0700
Message-Id: <1475455289-28375-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The freeing of resources will attempt to clear values previously set in
the cached resource table, so make sure to free the table after we have
cleaned up the resources.

Fixes: 988d204cdaf6 ("remoteproc: Move handling of cached table to boot/shutdown")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 92a1037c1b2e..3da566b0d437 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -847,14 +847,14 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
 	if (ret) {
 		dev_err(dev, "Failed to process resources: %d\n", ret);
-		goto clean_up;
+		goto clean_up_resources;
 	}
 
 	/* load the ELF segments to memory */
 	ret = rproc_load_segments(rproc, fw);
 	if (ret) {
 		dev_err(dev, "Failed to load program segments: %d\n", ret);
-		goto clean_up;
+		goto clean_up_resources;
 	}
 
 	/*
@@ -875,7 +875,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	ret = rproc->ops->start(rproc);
 	if (ret) {
 		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
-		goto clean_up;
+		goto clean_up_resources;
 	}
 
 	rproc->state = RPROC_RUNNING;
@@ -884,12 +884,13 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 
 	return 0;
 
+clean_up_resources:
+	rproc_resource_cleanup(rproc);
 clean_up:
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
 
-	rproc_resource_cleanup(rproc);
 	rproc_disable_iommu(rproc);
 	return ret;
 }
-- 
2.5.0
