Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 3/3] hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register hwlock controller
Date: Fri, 27 Sep 2019 16:27:43 +0800
Message-Id: <a6b18f17b995bceaf2fc0129866301dd8f46bee4.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
To: linus.walleij@linaro.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 0e8d4ff..b31141a 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -119,8 +119,8 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	/* no pm needed for HSem but required to comply with hwspilock core */
 	pm_runtime_enable(&pdev->dev);
 
-	ret = hwspin_lock_register(bank, &pdev->dev, &u8500_hwspinlock_ops,
-						pdata->base_id, num_locks);
+	ret = devm_hwspin_lock_register(&pdev->dev, bank, &u8500_hwspinlock_ops,
+					pdata->base_id, num_locks);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
 		return ret;
@@ -133,17 +133,10 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
 	void __iomem *io_base = bank->lock[0].priv - HSEM_REGISTER_OFFSET;
-	int ret;
 
 	/* clear all interrupts */
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
-	ret = hwspin_lock_unregister(bank);
-	if (ret) {
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
-
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
1.7.9.5
