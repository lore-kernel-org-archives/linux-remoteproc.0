Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH] hwspinlock: stm32: implement the relax() ops
Date: Thu, 7 Mar 2019 16:42:16 +0100
Message-ID: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Implement this optional ops, called by hwspinlock core while spinning on
a lock, between two successive invocations of trylock().

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 4418392..c8eacf4 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/hwspinlock.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -42,9 +43,15 @@ static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
 	writel(STM32_MUTEX_COREID, lock_addr);
 }
 
+static void stm32_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(50);
+}
+
 static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.trylock	= stm32_hwspinlock_trylock,
 	.unlock		= stm32_hwspinlock_unlock,
+	.relax		= stm32_hwspinlock_relax,
 };
 
 static int stm32_hwspinlock_probe(struct platform_device *pdev)
-- 
2.7.4
