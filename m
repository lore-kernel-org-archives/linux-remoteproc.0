Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/4] hwspinlock: Remove BUG_ON() from the hwspinlock core
Date: Mon, 14 Oct 2019 15:07:43 +0800
Message-Id: <cf225e8ead98e04393b1c663d40b6dd868acc54c.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1571036463.git.baolin.wang@linaro.org>
References: <cover.1571036463.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The original code use BUG_ON() to validate the parameters when locking
or unlocking one hardware lock, but we should not crash the whole kernel
though the hwlock parameters are incorrect, instead we can return
the error number for users and give some warning.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/hwspinlock_core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 8862445..a22e252c 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -92,8 +92,8 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 {
 	int ret;
 
-	BUG_ON(!hwlock);
-	BUG_ON(!flags && mode == HWLOCK_IRQSTATE);
+	if (WARN_ON(!hwlock || (!flags && mode == HWLOCK_IRQSTATE)))
+		return -EINVAL;
 
 	/*
 	 * This spin_lock{_irq, _irqsave} serves three purposes:
@@ -264,8 +264,8 @@ int __hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int to,
  */
 void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 {
-	BUG_ON(!hwlock);
-	BUG_ON(!flags && mode == HWLOCK_IRQSTATE);
+	if (WARN_ON(!hwlock || (!flags && mode == HWLOCK_IRQSTATE)))
+		return;
 
 	/*
 	 * We must make sure that memory operations (both reads and writes),
-- 
1.7.9.5
