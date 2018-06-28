Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] hwspinlock: Fix incorrect return pointers
Date: Thu, 28 Jun 2018 10:32:21 +0800
Message-Id: <782fc498b4f4c6e8130d64face93023eb3dc9866.1530152980.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: broonie@kernel.org, dan.carpenter@oracle.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, baolin.wang@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

The commit 4f1acd758b08 ("hwspinlock: Add devm_xxx() APIs to request/free
hwlock") introduces one bug, that will return one error pointer if failed
to request one hwlock, but we expect NULL pointer on error for consumers.
This patch will fix this issue.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/hwspinlock_core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index e16d648..2bad40d 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -877,10 +877,10 @@ struct hwspinlock *devm_hwspin_lock_request(struct device *dev)
 
 	ptr = devres_alloc(devm_hwspin_lock_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	hwlock = hwspin_lock_request();
-	if (!IS_ERR(hwlock)) {
+	if (hwlock) {
 		*ptr = hwlock;
 		devres_add(dev, ptr);
 	} else {
@@ -913,10 +913,10 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 
 	ptr = devres_alloc(devm_hwspin_lock_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	hwlock = hwspin_lock_request_specific(id);
-	if (!IS_ERR(hwlock)) {
+	if (hwlock) {
 		*ptr = hwlock;
 		devres_add(dev, ptr);
 	} else {
-- 
1.7.9.5
