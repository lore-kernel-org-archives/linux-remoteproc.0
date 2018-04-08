Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/2] hwspinlock: Convert to use 'switch' statement
Date: Sun,  8 Apr 2018 11:06:56 +0800
Message-Id: <d7fe0ed3d2dccf51e04a5c9032a73d1fd62dd1c1.1523156656.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: arnd@arndb.de, broonie@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, baolin.wang@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

We have different hwspinlock modes to select, thus it will be more
readable to handle different modes with using 'switch' statement
instead of 'if' statement.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/hwspinlock_core.c |   33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 4074441..f4a59f5 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -106,12 +106,17 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 	 *    problems with hwspinlock usage (e.g. scheduler checks like
 	 *    'scheduling while atomic' etc.)
 	 */
-	if (mode == HWLOCK_IRQSTATE)
+	switch (mode) {
+	case HWLOCK_IRQSTATE:
 		ret = spin_trylock_irqsave(&hwlock->lock, *flags);
-	else if (mode == HWLOCK_IRQ)
+		break;
+	case HWLOCK_IRQ:
 		ret = spin_trylock_irq(&hwlock->lock);
-	else
+		break;
+	default:
 		ret = spin_trylock(&hwlock->lock);
+		break;
+	}
 
 	/* is lock already taken by another context on the local cpu ? */
 	if (!ret)
@@ -122,12 +127,17 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 
 	/* if hwlock is already taken, undo spin_trylock_* and exit */
 	if (!ret) {
-		if (mode == HWLOCK_IRQSTATE)
+		switch (mode) {
+		case HWLOCK_IRQSTATE:
 			spin_unlock_irqrestore(&hwlock->lock, *flags);
-		else if (mode == HWLOCK_IRQ)
+			break;
+		case HWLOCK_IRQ:
 			spin_unlock_irq(&hwlock->lock);
-		else
+			break;
+		default:
 			spin_unlock(&hwlock->lock);
+			break;
+		}
 
 		return -EBUSY;
 	}
@@ -249,12 +259,17 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 	hwlock->bank->ops->unlock(hwlock);
 
 	/* Undo the spin_trylock{_irq, _irqsave} called while locking */
-	if (mode == HWLOCK_IRQSTATE)
+	switch (mode) {
+	case HWLOCK_IRQSTATE:
 		spin_unlock_irqrestore(&hwlock->lock, *flags);
-	else if (mode == HWLOCK_IRQ)
+		break;
+	case HWLOCK_IRQ:
 		spin_unlock_irq(&hwlock->lock);
-	else
+		break;
+	default:
 		spin_unlock(&hwlock->lock);
+		break;
+	}
 }
 EXPORT_SYMBOL_GPL(__hwspin_unlock);
 
-- 
1.7.9.5
