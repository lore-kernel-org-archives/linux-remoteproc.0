Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Drop unnecessary NULL check
Date: Tue, 13 Sep 2016 12:16:20 -0700
Message-Id: <1473794180-9420-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

rproc_alloc() will make sure that the "firmware" pointer is either a
driver supplied value or pointing to a generated firmware filename, it
can't be NULL. So drop the extra check in the rproc_boot() path.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0d3c191b6bc3..92a1037c1b2e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1034,13 +1034,6 @@ static int __rproc_boot(struct rproc *rproc, bool wait)
 		return ret;
 	}
 
-	/* loading a firmware is required */
-	if (!rproc->firmware) {
-		dev_err(dev, "%s: no firmware to load\n", __func__);
-		ret = -EINVAL;
-		goto unlock_mutex;
-	}
-
 	/* prevent underlying implementation from being removed */
 	if (!try_module_get(dev->parent->driver->owner)) {
 		dev_err(dev, "%s: can't get owner\n", __func__);
-- 
2.5.0
