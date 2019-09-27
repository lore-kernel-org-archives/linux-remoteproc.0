Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/3] hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
Date: Fri, 27 Sep 2019 16:27:42 +0800
Message-Id: <c3070351e137bffd2b4b639fb14b1baa19df5641.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
To: linus.walleij@linaro.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use devm_kzalloc() to allocate memory.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index c247a87..0e8d4ff 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -106,7 +106,8 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	/* clear all interrupts */
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
-	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
+	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
+			    GFP_KERNEL);
 	if (!bank)
 		return -ENOMEM;
 
@@ -120,15 +121,12 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 
 	ret = hwspin_lock_register(bank, &pdev->dev, &u8500_hwspinlock_ops,
 						pdata->base_id, num_locks);
-	if (ret)
-		goto reg_fail;
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
 	return 0;
-
-reg_fail:
-	pm_runtime_disable(&pdev->dev);
-	kfree(bank);
-	return ret;
 }
 
 static int u8500_hsem_remove(struct platform_device *pdev)
@@ -147,7 +145,6 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-	kfree(bank);
 
 	return 0;
 }
-- 
1.7.9.5
