Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH RESEND 1/2] hwspinlock: qcom: Remove redundant PM runtime functions
Date: Wed,  8 Jan 2020 11:09:10 +0800
Message-Id: <e0bb751feb7af709f92e52a07d0e8ebcf1ee44ff.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
To: agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Since the hwspinlock core has changed the PM runtime to be optional, and
the Qualcomm hardware spinlock has no pm runtime requirement, thus remove
these redundant PM runtime functions.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 6da7447..5a736b0 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include "hwspinlock_internal.h"
@@ -122,14 +121,8 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 							     regmap, field);
 	}
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops,
-				   0, QCOM_MUTEX_NUM_LOCKS);
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
-
-	return ret;
+	return hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops,
+				    0, QCOM_MUTEX_NUM_LOCKS);
 }
 
 static int qcom_hwspinlock_remove(struct platform_device *pdev)
@@ -143,8 +136,6 @@ static int qcom_hwspinlock_remove(struct platform_device *pdev)
 		return ret;
 	}
 
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
-- 
1.7.9.5
