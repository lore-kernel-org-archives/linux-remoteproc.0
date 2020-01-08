Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH RESEND 2/2] hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock controller
Date: Wed,  8 Jan 2020 11:09:11 +0800
Message-Id: <d69ad8611a68b0cac3c927d19901f3c113c5435c.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
To: agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c |   19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 5a736b0..f0da544 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -121,27 +121,12 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 							     regmap, field);
 	}
 
-	return hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops,
-				    0, QCOM_MUTEX_NUM_LOCKS);
-}
-
-static int qcom_hwspinlock_remove(struct platform_device *pdev)
-{
-	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = hwspin_lock_unregister(bank);
-	if (ret) {
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
+					 0, QCOM_MUTEX_NUM_LOCKS);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
 	.probe		= qcom_hwspinlock_probe,
-	.remove		= qcom_hwspinlock_remove,
 	.driver		= {
 		.name	= "qcom_hwspinlock",
 		.of_match_table = qcom_hwspinlock_of_match,
-- 
1.7.9.5
