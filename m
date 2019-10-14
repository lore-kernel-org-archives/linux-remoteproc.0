Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 4/4] hwspinlock: u8500_hsem: Remove redundant PM runtime implementation
Date: Mon, 14 Oct 2019 15:07:46 +0800
Message-Id: <45600b3601cbfe3685f4c9e088be9a30ae3eb8f2.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Since the hwspinlock core has changed the PM runtime to be optional, thus
remove the redundant PM runtime implementation in the u8500 HWSEM driver.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index b31141a..67845c0 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/hwspinlock.h>
@@ -89,7 +88,7 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
 	void __iomem *io_base;
-	int i, ret, num_locks = U8500_MAX_SEMAPHORE;
+	int i, num_locks = U8500_MAX_SEMAPHORE;
 	ulong val;
 
 	if (!pdata)
@@ -116,17 +115,9 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
 		hwlock->priv = io_base + HSEM_REGISTER_OFFSET + sizeof(u32) * i;
 
-	/* no pm needed for HSem but required to comply with hwspilock core */
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_hwspin_lock_register(&pdev->dev, bank, &u8500_hwspinlock_ops,
-					pdata->base_id, num_locks);
-	if (ret) {
-		pm_runtime_disable(&pdev->dev);
-		return ret;
-	}
-
-	return 0;
+	return devm_hwspin_lock_register(&pdev->dev, bank,
+					 &u8500_hwspinlock_ops,
+					 pdata->base_id, num_locks);
 }
 
 static int u8500_hsem_remove(struct platform_device *pdev)
@@ -137,8 +128,6 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 	/* clear all interrupts */
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
-- 
1.7.9.5
