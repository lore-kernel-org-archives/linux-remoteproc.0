Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/4] hwspinlock: sprd: Change to use devm_platform_ioremap_resource()
Date: Fri, 27 Sep 2019 15:10:44 +0800
Message-Id: <00916cd2409a5607fc4023a4cae351f1b2e84d8a.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index dc42bf5..7a8534f 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -83,7 +83,6 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
 	struct hwspinlock *lock;
-	struct resource *res;
 	int i, ret;
 
 	if (!pdev->dev.of_node)
@@ -96,8 +95,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	if (!sprd_hwlock)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sprd_hwlock->base = devm_ioremap_resource(&pdev->dev, res);
+	sprd_hwlock->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sprd_hwlock->base))
 		return PTR_ERR(sprd_hwlock->base);
 
-- 
1.7.9.5
