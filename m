Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/4] hwspinlock: Let the PM runtime can be optional
Date: Mon, 14 Oct 2019 15:07:44 +0800
Message-Id: <6c03ca84b19f0e3a4bd60b4d5ea70fd801ed7555.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Now some hwspinlock controllers did not have the requirement to implement
the PM runtime, but drivers must enable the PM runtime to comply with the
hwspinlock core.

Thus we can change the PM runtime support to be optional by validating
the -EACCES error number which means the PM runtime is not enabled, and
removing the return value validating of pm_runtime_put(). So that we
can remove some redundant PM runtime code in drivers.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/hwspinlock_core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a22e252c..fd5f5c5 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -657,13 +657,15 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 
 	/* notify PM core that power is now needed */
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
+	if (ret < 0 && ret != -EACCES) {
 		dev_err(dev, "%s: can't power on device\n", __func__);
 		pm_runtime_put_noidle(dev);
 		module_put(dev->driver->owner);
 		return ret;
 	}
 
+	ret = 0;
+
 	/* mark hwspinlock as used, should not fail */
 	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
 							HWSPINLOCK_UNUSED);
@@ -820,9 +822,7 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	}
 
 	/* notify the underlying device that power is not needed */
-	ret = pm_runtime_put(dev);
-	if (ret < 0)
-		goto out;
+	pm_runtime_put(dev);
 
 	/* mark this hwspinlock as available */
 	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-- 
1.7.9.5
