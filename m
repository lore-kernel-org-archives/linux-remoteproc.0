Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 3/4] hwspinlock: sprd: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()
Date: Fri, 27 Sep 2019 15:10:46 +0800
Message-Id: <03de1c267461a6ac17cf7732404795b2fe735927.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use devm_add_action_or_reset() for calls to clk_disable_unprepare(),
which can simplify the error handling.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index d210424..e76c702 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -79,6 +79,13 @@ static void sprd_hwspinlock_relax(struct hwspinlock *lock)
 	.relax = sprd_hwspinlock_relax,
 };
 
+static void sprd_hwspinlock_disable(void *data)
+{
+	struct sprd_hwspinlock_dev *sprd_hwlock = data;
+
+	clk_disable_unprepare(sprd_hwlock->clk);
+}
+
 static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
@@ -109,6 +116,14 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, sprd_hwspinlock_disable,
+				       sprd_hwlock);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to add hwspinlock disable action\n");
+		return ret;
+	}
+
 	/* set the hwspinlock to record user id to identify subsystems */
 	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
 
@@ -124,7 +139,6 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 				   &sprd_hwspinlock_ops, 0, SPRD_HWLOCKS_NUM);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
-		clk_disable_unprepare(sprd_hwlock->clk);
 		return ret;
 	}
 
@@ -137,7 +151,6 @@ static int sprd_hwspinlock_remove(struct platform_device *pdev)
 
 	hwspin_lock_unregister(&sprd_hwlock->bank);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(sprd_hwlock->clk);
 	return 0;
 }
 
-- 
1.7.9.5
