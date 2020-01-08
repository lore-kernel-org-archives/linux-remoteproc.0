Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH RESEND 1/3] hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
Date: Wed,  8 Jan 2020 11:23:44 +0800
Message-Id: <dfa043f317c609a6172468ac11598968dd751bce.1578453662.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453662.git.baolin.wang7@gmail.com>
References: <cover.1578453662.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578453662.git.baolin.wang7@gmail.com>
References: <cover.1578453662.git.baolin.wang7@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, baohua@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, baolin.wang7@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/sirf_hwspinlock.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hwspinlock/sirf_hwspinlock.c b/drivers/hwspinlock/sirf_hwspinlock.c
index 1f625cd..8cb5fd4 100644
--- a/drivers/hwspinlock/sirf_hwspinlock.c
+++ b/drivers/hwspinlock/sirf_hwspinlock.c
@@ -69,9 +69,9 @@ static int sirf_hwspinlock_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* retrieve io base */
-	hwspin->io_base = of_iomap(pdev->dev.of_node, 0);
-	if (!hwspin->io_base)
-		return -ENOMEM;
+	hwspin->io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hwspin->io_base))
+		return PTR_ERR(hwspin->io_base);
 
 	for (idx = 0; idx < HW_SPINLOCK_NUMBER; idx++) {
 		hwlock = &hwspin->bank.lock[idx];
@@ -92,7 +92,6 @@ static int sirf_hwspinlock_probe(struct platform_device *pdev)
 
 reg_failed:
 	pm_runtime_disable(&pdev->dev);
-	iounmap(hwspin->io_base);
 
 	return ret;
 }
@@ -110,8 +109,6 @@ static int sirf_hwspinlock_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	iounmap(hwspin->io_base);
-
 	return 0;
 }
 
-- 
1.7.9.5
