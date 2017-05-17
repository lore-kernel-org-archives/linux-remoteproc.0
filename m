Return-Path: <Orson.Zhai@spreadtrum.com>
From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH v2] hwspinlock: sprd: Add hardware spinlock driver
Date: Wed, 17 May 2017 13:59:29 +0800
Message-ID: <5c2ac9be5fcfe0161952070ffdcb1cf7ed51128f.1495000470.git.baolin.wang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-ID: <linux-remoteproc@vger.kernel.org>

The Spreadtrum hardware spinlock device can provide hardware assistance
for synchronization between the multiple subsystems.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
Changes since v1:
 - Remove some unused macros and functions.
 - Convert readl/writel_relaxed() to readl/writel.
 - Remove some redundant error printing.
 - Get clock with devm_clk_get().
 - Other small optimization.
---
 drivers/hwspinlock/Kconfig           |    9 ++
 drivers/hwspinlock/Makefile          |    1 +
 drivers/hwspinlock/sprd_hwspinlock.c |  183 ++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/hwspinlock/sprd_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 73a4016..02018b8 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -42,6 +42,15 @@ config HWSPINLOCK_SIRF
 	  It's safe to say n here if you're not interested in SIRF hardware
 	  spinlock or just want a bare minimum kernel.
 
+config HWSPINLOCK_SPRD
+	tristate "SPRD Hardware Spinlock device"
+	depends on ARCH_SPRD
+	select HWSPINLOCK
+	help
+	  Say y here to support the SPRD Hardware Spinlock device.
+
+	  If unsure, say N.
+
 config HSEM_U8500
 	tristate "STE Hardware Semaphore functionality"
 	depends on ARCH_U8500
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index 6b59cb5a..14928aa 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
 obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SIRF)		+= sirf_hwspinlock.o
+obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
new file mode 100644
index 0000000..638e64a
--- /dev/null
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -0,0 +1,183 @@
+/*
+ * Spreadtrum hardware spinlock driver
+ * Copyright (C) 2017 Spreadtrum  - http://www.spreadtrum.com
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "hwspinlock_internal.h"
+
+/* hwspinlock registers definition */
+#define HWSPINLOCK_RECCTRL		0x4
+#define HWSPINLOCK_MASTERID(_X_)	(0x80 + 0x4 * (_X_))
+#define HWSPINLOCK_TOKEN(_X_)		(0x800 + 0x4 * (_X_))
+
+/* unlocked value */
+#define HWSPINLOCK_NOTTAKEN		0x55aa10c5
+/* bits definition of RECCTRL reg */
+#define HWSPINLOCK_USER_BITS		0x1
+
+/* hwspinlock number */
+#define SPRD_HWLOCKS_NUM		32
+
+struct sprd_hwspinlock_dev {
+	void __iomem *base;
+	struct clk *clk;
+	struct hwspinlock_device bank;
+};
+
+/* try to lock the hardware spinlock */
+static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	struct sprd_hwspinlock_dev *sprd_hwlock =
+		dev_get_drvdata(lock->bank->dev);
+	void __iomem *addr = lock->priv;
+	int user_id, lock_id;
+
+	if (!readl(addr))
+		return 1;
+
+	lock_id = hwlock_to_id(lock);
+	/* get the hardware spinlock master/user id */
+	user_id = readl(sprd_hwlock->base + HWSPINLOCK_MASTERID(lock_id));
+	dev_warn(sprd_hwlock->bank.dev,
+		 "hwspinlock [%d] lock failed and master/user id = %d!\n",
+		 lock_id, user_id);
+	return 0;
+}
+
+/* unlock the hardware spinlock */
+static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	writel(HWSPINLOCK_NOTTAKEN, lock_addr);
+}
+
+/* The specs recommended below number as the retry delay time */
+static void sprd_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(10);
+}
+
+static const struct hwspinlock_ops sprd_hwspinlock_ops = {
+	.trylock = sprd_hwspinlock_trylock,
+	.unlock = sprd_hwspinlock_unlock,
+	.relax = sprd_hwspinlock_relax,
+};
+
+static int sprd_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct sprd_hwspinlock_dev *sprd_hwlock;
+	struct hwspinlock *lock;
+	struct resource *res;
+	int i, ret;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	sprd_hwlock = devm_kzalloc(&pdev->dev,
+				   sizeof(struct sprd_hwspinlock_dev) +
+				   SPRD_HWLOCKS_NUM * sizeof(*lock),
+				   GFP_KERNEL);
+	if (!sprd_hwlock)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	sprd_hwlock->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(sprd_hwlock->base))
+		return PTR_ERR(sprd_hwlock->base);
+
+	sprd_hwlock->clk = devm_clk_get(&pdev->dev, "enable");
+	if (IS_ERR(sprd_hwlock->clk)) {
+		dev_err(&pdev->dev, "get hwspinlock clock failed!\n");
+		return PTR_ERR(sprd_hwlock->clk);
+	}
+
+	clk_prepare_enable(sprd_hwlock->clk);
+
+	/* set the hwspinlock to record user id to identify subsystems */
+	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
+
+	for (i = 0; i < SPRD_HWLOCKS_NUM; i++) {
+		lock = &sprd_hwlock->bank.lock[i];
+		lock->priv = sprd_hwlock->base + HWSPINLOCK_TOKEN(i);
+	}
+
+	platform_set_drvdata(pdev, sprd_hwlock);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = hwspin_lock_register(&sprd_hwlock->bank, &pdev->dev,
+				   &sprd_hwspinlock_ops, 0, SPRD_HWLOCKS_NUM);
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
+		clk_disable_unprepare(sprd_hwlock->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sprd_hwspinlock_remove(struct platform_device *pdev)
+{
+	struct sprd_hwspinlock_dev *sprd_hwlock = platform_get_drvdata(pdev);
+
+	hwspin_lock_unregister(&sprd_hwlock->bank);
+	pm_runtime_disable(&pdev->dev);
+	clk_disable_unprepare(sprd_hwlock->clk);
+	return 0;
+}
+
+static const struct of_device_id sprd_hwspinlock_of_match[] = {
+	{ .compatible = "sprd,hwspinlock-r3p0", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sprd_hwspinlock_of_match);
+
+static struct platform_driver sprd_hwspinlock_driver = {
+	.probe = sprd_hwspinlock_probe,
+	.remove = sprd_hwspinlock_remove,
+	.driver = {
+		.name = "sprd_hwspinlock",
+		.of_match_table = of_match_ptr(sprd_hwspinlock_of_match),
+	},
+};
+
+static int __init sprd_hwspinlock_init(void)
+{
+	return platform_driver_register(&sprd_hwspinlock_driver);
+}
+postcore_initcall(sprd_hwspinlock_init);
+
+static void __exit sprd_hwspinlock_exit(void)
+{
+	platform_driver_unregister(&sprd_hwspinlock_driver);
+}
+module_exit(sprd_hwspinlock_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Hardware spinlock driver for Spreadtrum");
+MODULE_AUTHOR("Baolin Wang <baolin.wang@spreadtrum.com>");
+MODULE_AUTHOR("Lanqing Liu <lanqing.liu@spreadtrum.com>");
+MODULE_AUTHOR("Long Cheng <aiden.cheng@spreadtrum.com>");
-- 
1.7.9.5
