Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD0BC2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 06:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6A512223F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 06:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgKSGpN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 01:45:13 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:60464 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726095AbgKSGpN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 01:45:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436663|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0134816-4.3359e-05-0.986475;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=fuyao@allwinnertech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.IygQvnF_1605768303;
Received: from localhost.localdomain(mailfrom:fuyao@allwinnertech.com fp:SMTPD_---.IygQvnF_1605768303)
          by smtp.aliyun-inc.com(10.147.40.233);
          Thu, 19 Nov 2020 14:45:07 +0800
From:   fuyao@allwinnertech.com
To:     mripard@kernel.org, wens@csie.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     fuyao <fuyao@allwinnertech.com>
Subject: [PATCH 2/2] hwspinlock: add SUNXI implementation
Date:   Thu, 19 Nov 2020 14:44:53 +0800
Message-Id: <f2b445651339e616af5348f2e7008dbc42275159.1605767679.git.fuyao@allwinnertech.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605767679.git.fuyao@allwinnertech.com>
References: <cover.1605767679.git.fuyao@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: fuyao <fuyao@allwinnertech.com>

Add hwspinlock support for the SUNXI Hardware Spinlock device.

The Hardware Spinlock device on SUNXI provides hardware assistance
for synchronization between the multiple processors in the system
(Cortex-A7, or1k, Xtensa DSP, Cortex-A53)

Signed-off-by: fuyao <fuyao@allwinnertech.com>
---
 MAINTAINERS                           |   6 +
 drivers/hwspinlock/Kconfig            |  10 ++
 drivers/hwspinlock/Makefile           |   1 +
 drivers/hwspinlock/sunxi_hwspinlock.c | 205 ++++++++++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 drivers/hwspinlock/sunxi_hwspinlock.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e451dcce054f0..68d25574432d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -737,6 +737,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/sunxi/cedrus/
 
+ALLWINNER HWSPINLOCK DRIVER
+M:	fuyao <fuyao@allwinnertech.com>
+S:	Maintained
+F:	drivers/hwspinlock/sunxi_hwspinlock.c
+F:      Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml
+
 ALPHA PORT
 M:	Richard Henderson <rth@twiddle.net>
 M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 32cd26352f381..4d0d516dcb544 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -55,6 +55,16 @@ config HWSPINLOCK_STM32
 
 	  If unsure, say N.
 
+config HWSPINLOCK_SUNXI
+	tristate "SUNXI Hardware Spinlock device"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	help
+	  Say y here to support the SUNXI Hardware Semaphore functionality, which
+	  provides a synchronisation mechanism for the various processor on the
+	  SoC.
+
+	  If unsure, say N.
+
 config HSEM_U8500
 	tristate "STE Hardware Semaphore functionality"
 	depends on ARCH_U8500 || COMPILE_TEST
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index ed053e3f02be4..839a053205f73 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_HWSPINLOCK_SIRF)		+= sirf_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
+obj-$(CONFIG_HWSPINLOCK_SUNXI)		+= sunxi_hwspinlock.o
diff --git a/drivers/hwspinlock/sunxi_hwspinlock.c b/drivers/hwspinlock/sunxi_hwspinlock.c
new file mode 100644
index 0000000000000..2c3dc148c9b72
--- /dev/null
+++ b/drivers/hwspinlock/sunxi_hwspinlock.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SUNXI hardware spinlock driver
+ *
+ * Copyright (C) 2020 Allwinnertech - http://www.allwinnertech.com
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
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/bitops.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/hwspinlock.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/err.h>
+#include <linux/reset.h>
+
+#include "hwspinlock_internal.h"
+
+/* hardware spinlock register list */
+#define	LOCK_SYS_STATUS_REG             (0x0000)
+#define	LOCK_STATUS_REG                 (0x0010)
+#define LOCK_BASE_OFFSET                (0x0100)
+#define LOCK_BASE_ID                    (0)
+
+/* Possible values of SPINLOCK_LOCK_REG */
+#define SPINLOCK_NOTTAKEN               (0)     /* free */
+#define SPINLOCK_TAKEN                  (1)     /* locked */
+
+struct sunxi_spinlock_config {
+	int nspin;
+};
+
+static int sunxi_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	/* attempt to acquire the lock by reading its value */
+	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);
+}
+
+static void sunxi_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = lock->priv;
+
+	/* release the lock by writing 0 to it */
+	writel(SPINLOCK_NOTTAKEN, lock_addr);
+}
+
+/*
+ * relax the SUNXI interconnect while spinning on it.
+ *
+ * The specs recommended that the retry delay time will be
+ * just over half of the time that a requester would be
+ * expected to hold the lock.
+ *
+ * in sunxi spinlock time less then 200 cycles
+ *
+ * The number below is taken from an hardware specs example,
+ * obviously it is somewhat arbitrary.
+ */
+static void sunxi_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(50);
+}
+
+static const struct hwspinlock_ops sunxi_hwspinlock_ops = {
+	.trylock = sunxi_hwspinlock_trylock,
+	.unlock = sunxi_hwspinlock_unlock,
+	.relax = sunxi_hwspinlock_relax,
+};
+
+struct sunxi_hwspinlock_device {
+	struct hwspinlock_device *bank;
+	struct clk *bus_clk;
+	struct reset_control *reset;
+};
+
+static void sunxi_hwspinlock_clk_init(struct platform_device *pdev,
+				      struct sunxi_hwspinlock_device *private)
+{
+	private->bus_clk = devm_clk_get(&pdev->dev, NULL);
+	private->reset = devm_reset_control_get(&pdev->dev, NULL);
+
+	if (private->reset)
+		reset_control_deassert(private->reset);
+	if (private->bus_clk)
+		clk_prepare_enable(private->bus_clk);
+}
+
+static void sunxi_hwspinlock_clk_dinit(struct sunxi_hwspinlock_device *private)
+{
+	if (private->reset)
+		reset_control_assert(private->reset);
+	if (private->bus_clk)
+		clk_disable(private->bus_clk);
+}
+
+static const struct sunxi_spinlock_config spin_ver_1 = {
+	.nspin = 32,
+};
+
+static const struct of_device_id sunxi_hwspinlock_of_match[] = {
+	{
+		.compatible = "allwinner,h3-hwspinlock",
+		.data = &spin_ver_1,
+	},
+	{
+		.compatible = "allwinner,h6-hwspinlock",
+		.data = &spin_ver_1,
+	},
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, sunxi_hwspinlock_of_match);
+
+static int sunxi_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct sunxi_hwspinlock_device *private;
+	struct hwspinlock_device *bank;
+	struct hwspinlock *hwlock;
+	const struct sunxi_spinlock_config *config;
+	const struct of_device_id *match;
+	void __iomem *iobase;
+	int num_locks, i, ret;
+
+	iobase = devm_platform_ioremap_resource(pdev, 0);
+	if (PTR_ERR(iobase))
+		return PTR_ERR(iobase);
+
+	match = of_match_device(of_match_ptr(sunxi_hwspinlock_of_match),
+				&pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	config = match->data;
+	num_locks = config->nspin;
+
+	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
+
+	bank = devm_kzalloc(&pdev->dev,
+			    sizeof(*bank) + num_locks * sizeof(*hwlock),
+			    GFP_KERNEL);
+	if (!bank)
+		return -ENOMEM;
+
+	private->bank = bank;
+	sunxi_hwspinlock_clk_init(pdev, private);
+
+	platform_set_drvdata(pdev, private);
+
+	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
+		hwlock->priv = iobase + LOCK_BASE_OFFSET + sizeof(u32) * i;
+
+	ret = devm_hwspin_lock_register(&pdev->dev, bank, &sunxi_hwspinlock_ops,
+					LOCK_BASE_ID, num_locks);
+	if (ret)
+		return ret;
+
+
+	return 0;
+}
+
+static int sunxi_hwspinlock_remove(struct platform_device *pdev)
+{
+	struct sunxi_hwspinlock_device *private = platform_get_drvdata(pdev);
+
+	sunxi_hwspinlock_clk_dinit(private);
+
+	return 0;
+}
+
+static struct platform_driver sunxi_hwspinlock_driver = {
+	.probe		= sunxi_hwspinlock_probe,
+	.remove		= sunxi_hwspinlock_remove,
+	.driver		= {
+		.name	= "sunxi-hwspinlock",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(sunxi_hwspinlock_of_match),
+	},
+};
+
+module_platform_driver(sunxi_hwspinlock_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Hardware spinlock driver for SUNXI");
+MODULE_AUTHOR("fuyao <fuyao@allwinnertech.com>");
-- 
2.29.2

