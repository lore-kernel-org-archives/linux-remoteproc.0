Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH RFC 1/3] hwspinlock: sun8i: add Allwinner sun8i HardWare Spinlock
Date: Fri, 12 Aug 2016 13:46:32 +0200
Message-Id: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, LABBE Corentin <clabbe.montjoie@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add hwspinlock support for the Allwinner Hardware Spinlock device
present on the A83T, H3 and A64 SoCs.

This Hardware Spinlock device provides hardware assistance
for synchronization between the multiple processors in the system.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/hwspinlock/Kconfig            |  11 ++
 drivers/hwspinlock/Makefile           |   1 +
 drivers/hwspinlock/sun8i_hwspinlock.c | 235 ++++++++++++++++++++++++++++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/hwspinlock/sun8i_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 73a4016..dd293bb 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -42,6 +42,17 @@ config HWSPINLOCK_SIRF
 	  It's safe to say n here if you're not interested in SIRF hardware
 	  spinlock or just want a bare minimum kernel.
 
+config HWSPINLOCK_SUN8I
+	tristate "Allwinner sun8i Hardware Spinlock device"
+	depends on ARCH_SUNXI
+	select HWSPINLOCK
+	help
+	  Say y here to support the Allwinner Hardware Mutex functionality, which
+	  provides a synchronisation mechanism for the various processors on
+	  the SoC.
+
+	  If unsure, say N.
+
 config HSEM_U8500
 	tristate "STE Hardware Semaphore functionality"
 	depends on ARCH_U8500
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index 6b59cb5a..2ac59ae 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -5,5 +5,6 @@
 obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
 obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
+obj-$(CONFIG_HWSPINLOCK_SUN8I)		+= sun8i_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SIRF)		+= sirf_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/sun8i_hwspinlock.c b/drivers/hwspinlock/sun8i_hwspinlock.c
new file mode 100644
index 0000000..e2d2a0c
--- /dev/null
+++ b/drivers/hwspinlock/sun8i_hwspinlock.c
@@ -0,0 +1,235 @@
+/*
+ * Allwinner sun8i hardware spinlock driver
+ *
+ * Copyright (C) 2016 Corentin LABBE <clabbe.montjoie@gmail.com>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/reset.h>
+
+#include "hwspinlock_internal.h"
+
+/* Spinlock register offsets */
+#define SYSSTATUS_OFFSET		0x0000
+#define LOCK_BASE_OFFSET		0x0100
+
+/* Possible values of SPINLOCK_LOCK_REG */
+#define SPINLOCK_NOTTAKEN		0	/* free */
+#define SPINLOCK_TAKEN			1	/* locked */
+
+struct sun8i_hwspinlock_device {
+	void __iomem *base;
+	int num_locks;
+	struct hwspinlock_device *bank;
+	struct reset_control *rst;
+	struct clk *ahb_clk;
+};
+
+struct sun8i_hwspinlock {
+	void __iomem *base;
+};
+
+static int sun8i_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	struct sun8i_hwspinlock *priv = lock->priv;
+	void __iomem *lock_addr = priv->base;
+
+	/* attempt to acquire the lock by reading its value */
+	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);
+}
+
+static void sun8i_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	struct sun8i_hwspinlock *priv = lock->priv;
+	void __iomem *lock_addr = priv->base;
+
+	/* release the lock by writing 0 to it */
+	writel(SPINLOCK_NOTTAKEN, lock_addr);
+}
+
+static const struct hwspinlock_ops sun8i_hwspinlock_ops = {
+	.trylock = sun8i_hwspinlock_trylock,
+	.unlock = sun8i_hwspinlock_unlock,
+};
+
+static int sun8i_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct hwspinlock *hwlock;
+	struct resource *res;
+	int i, err;
+	struct sun8i_hwspinlock_device *priv;
+	struct sun8i_hwspinlock *hpriv;
+	size_t array_size;
+
+	if (!node)
+		return -ENODEV;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->base)) {
+		err = PTR_ERR(priv->base);
+		dev_err(&pdev->dev, "Cannot request MMIO %d\n", err);
+		return err;
+	}
+
+	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	if (IS_ERR(priv->ahb_clk)) {
+		err = PTR_ERR(priv->ahb_clk);
+		dev_err(&pdev->dev, "Cannot get AHB clock err=%d\n", err);
+		return err;
+	}
+
+	priv->rst = devm_reset_control_get_optional(&pdev->dev, "ahb");
+	if (IS_ERR(priv->rst)) {
+		err = PTR_ERR(priv->rst);
+		if (err == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "No optional reset control found %d\n",
+			 err);
+		priv->rst = NULL;
+	}
+
+	if (priv->rst) {
+		err = reset_control_deassert(priv->rst);
+		if (err) {
+			dev_err(&pdev->dev, "Cannot deassert reset control\n");
+			return err;
+		}
+	}
+
+	err = clk_prepare_enable(priv->ahb_clk);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot prepare AHB clock %d\n", err);
+		goto rst_fail;
+	}
+
+	/* Determine number of locks */
+	i = readl(priv->base + SYSSTATUS_OFFSET);
+	i >>= 28;
+
+	switch (i) {
+	case 0x1:
+		priv->num_locks = 32;
+		break;
+	case 0x2:
+		priv->num_locks = 64;
+		break;
+	case 0x3:
+		priv->num_locks = 128;
+		break;
+	case 0x4:
+		priv->num_locks = 256;
+		break;
+	default:
+		dev_err(&pdev->dev, "Invalid number of spinlocks %d\n", i);
+		err = -EINVAL;
+		goto clk_fail;
+	}
+
+	array_size = sizeof(*priv->bank) + priv->num_locks * sizeof(*hwlock);
+	priv->bank = devm_kzalloc(&pdev->dev, array_size, GFP_KERNEL);
+	if (!priv->bank) {
+		err = -ENOMEM;
+		goto clk_fail;
+	}
+
+	for (i = 0, hwlock = &priv->bank->lock[0]; i < priv->num_locks;
+		i++, hwlock++) {
+		hwlock->priv = devm_kzalloc(&pdev->dev,
+					    sizeof(struct sun8i_hwspinlock),
+					    GFP_KERNEL);
+		if (!hwlock->priv) {
+			err = -ENOMEM;
+			goto clk_fail;
+		}
+		hpriv = hwlock->priv;
+		hpriv->base = priv->base + LOCK_BASE_OFFSET + sizeof(u32) * i;
+	}
+
+	err = hwspin_lock_register(priv->bank, &pdev->dev,
+				   &sun8i_hwspinlock_ops, 0, priv->num_locks);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot register hwspinlock");
+		goto clk_fail;
+	}
+
+	dev_info(&pdev->dev, "Sun8i hwspinlock driver loaded with %d locks\n",
+		 priv->num_locks);
+	return 0;
+
+clk_fail:
+	clk_disable_unprepare(priv->ahb_clk);
+rst_fail:
+	if (priv->rst)
+		reset_control_assert(priv->rst);
+	return err;
+}
+
+static int sun8i_hwspinlock_remove(struct platform_device *pdev)
+{
+	struct sun8i_hwspinlock_device *priv = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = hwspin_lock_unregister(priv->bank);
+	if (ret) {
+		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
+		return ret;
+	}
+	if (priv->rst)
+		reset_control_assert(priv->rst);
+
+	clk_disable_unprepare(priv->ahb_clk);
+
+	return 0;
+}
+
+static const struct of_device_id sun8i_hwspinlock_of_match[] = {
+	{ .compatible = "allwinner,sun8i-hwspinlock", },
+	{ /* end */ },
+};
+MODULE_DEVICE_TABLE(of, sun8i_hwspinlock_of_match);
+
+static struct platform_driver sun8i_hwspinlock_driver = {
+	.probe		= sun8i_hwspinlock_probe,
+	.remove		= sun8i_hwspinlock_remove,
+	.driver		= {
+		.name	= "sun8i_hwspinlock",
+		.of_match_table = of_match_ptr(sun8i_hwspinlock_of_match),
+	},
+};
+
+static int __init sun8i_hwspinlock_init(void)
+{
+	return platform_driver_register(&sun8i_hwspinlock_driver);
+}
+/* board init code might need to reserve hwspinlocks for predefined purposes */
+postcore_initcall(sun8i_hwspinlock_init);
+
+static void __exit sun8i_hwspinlock_exit(void)
+{
+	platform_driver_unregister(&sun8i_hwspinlock_driver);
+}
+module_exit(sun8i_hwspinlock_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Hardware spinlock driver for Allwinner sun8i");
+MODULE_AUTHOR("Corentin LABBE <clabbe.montjoie@gmail.com>");
-- 
2.7.3
