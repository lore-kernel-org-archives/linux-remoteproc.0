Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 3/4] hwspinlock: sprd: Remove redundant PM runtime implementation
Date: Mon, 14 Oct 2019 15:07:45 +0800
Message-Id: <8fb54e417ee5833e09103fd1c286c4cf2f41ce69.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Since the hwspinlock core has changed the PM runtime to be optional, thus
remove the redundant PM runtime implementation in the Spreadtrum hwlock
driver.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |   21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 44d69db..36dc803 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "hwspinlock_internal.h"
@@ -133,23 +132,10 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, sprd_hwlock);
-	pm_runtime_enable(&pdev->dev);
 
-	ret = devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
-					&sprd_hwspinlock_ops, 0,
-					SPRD_HWLOCKS_NUM);
-	if (ret) {
-		pm_runtime_disable(&pdev->dev);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int sprd_hwspinlock_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	return 0;
+	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
+					 &sprd_hwspinlock_ops, 0,
+					 SPRD_HWLOCKS_NUM);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
@@ -160,7 +146,6 @@ static int sprd_hwspinlock_remove(struct platform_device *pdev)
 
 static struct platform_driver sprd_hwspinlock_driver = {
 	.probe = sprd_hwspinlock_probe,
-	.remove = sprd_hwspinlock_remove,
 	.driver = {
 		.name = "sprd_hwspinlock",
 		.of_match_table = of_match_ptr(sprd_hwspinlock_of_match),
-- 
1.7.9.5
