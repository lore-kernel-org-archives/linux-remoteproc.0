Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/3] hwspinlock: u8500_hsem: Change to use devm_platform_ioremap_resource()
Date: Fri, 27 Sep 2019 16:27:41 +0800
Message-Id: <e991666ead56cac30a7ef9cec85e802b57d47458.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569572448.git.baolin.wang@linaro.org>
References: <cover.1569572448.git.baolin.wang@linaro.org>
To: linus.walleij@linaro.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/u8500_hsem.c |   20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 572ca79..c247a87 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -88,7 +88,6 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	struct hwspinlock_pdata *pdata = pdev->dev.platform_data;
 	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
-	struct resource *res;
 	void __iomem *io_base;
 	int i, ret, num_locks = U8500_MAX_SEMAPHORE;
 	ulong val;
@@ -96,13 +95,9 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	io_base = ioremap(res->start, resource_size(res));
-	if (!io_base)
-		return -ENOMEM;
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
 
 	/* make sure protocol 1 is selected */
 	val = readl(io_base + HSEM_CTRL_REG);
@@ -112,10 +107,8 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 	writel(0xFFFF, io_base + HSEM_ICRALL);
 
 	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
-	if (!bank) {
-		ret = -ENOMEM;
-		goto iounmap_base;
-	}
+	if (!bank)
+		return -ENOMEM;
 
 	platform_set_drvdata(pdev, bank);
 
@@ -135,8 +128,6 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 reg_fail:
 	pm_runtime_disable(&pdev->dev);
 	kfree(bank);
-iounmap_base:
-	iounmap(io_base);
 	return ret;
 }
 
@@ -156,7 +147,6 @@ static int u8500_hsem_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-	iounmap(io_base);
 	kfree(bank);
 
 	return 0;
-- 
1.7.9.5
