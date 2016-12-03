Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Remove "experimental" warning
Date: Fri,  2 Dec 2016 20:43:50 -0800
Message-Id: <1480740230-25065-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Warning users that remoteproc and it's binary format are under
development doesn't serve much of a purpose. Different drivers support
different image formats and the resource table has a version field that
would need to be bumped when incompatible changes are introduced.

So lets drop this warning to clean up the kernel log.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f0f6ec1ab12b..fc2ebff7d332 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1298,9 +1298,6 @@ int rproc_add(struct rproc *rproc)
 
 	dev_info(dev, "%s is available\n", rproc->name);
 
-	dev_info(dev, "Note: remoteproc is still under development and considered experimental.\n");
-	dev_info(dev, "THE BINARY FORMAT IS NOT YET FINALIZED, and backward compatibility isn't yet guaranteed.\n");
-
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 	ret = rproc_add_virtio_devices(rproc);
-- 
2.5.0
