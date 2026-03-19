Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE836895E
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918010; cv=none; b=cELwliP9y9L6Mp3gXwk5RNdWbone4K8IAU9QbsNOHVGzeGRdG8HyPNd7bY5zEKimNq5Vt/F6gni2pAhWgbdFF5ZVmFIyG2bAFHERkdNizcUlZ1z2JMulZqjxIpE04DXEeqa3kwBGC7rrCrIZJNQwbKQ+8hsBFnpH9jSLNPsuq9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918010; c=relaxed/simple;
	bh=z38a3cLh4UkRj9AZR94BRZpkDcDOXITt/wbT8smF0PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aq2FTOn/I5x6hDcoLRkmVX5AE+cMM75W61CLLaVOhcl0c7nL+CURv96YFqK9ofExW2nRnAHJEpKs7FZOwiY3aV7PMJgfQl1giyeZUwLsfdwRxaEWaag5ckF5rIh3GaFXef1Ug3JwAfrAHn72COEkCZrYEru4nMxJiTHO93CJsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VDM70dsv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VDM70dsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=x2flKYzYfRk7gyeSwNtIj63y7Q+BDaqLHhMzsOZftOs=; b=VDM70d
	svdIQsic3xl0Yqt59t+QPZhBcpFBSeTQuPhOYFi6oZeaxqkRWSypkJq0XfpGECec
	DmFzchKtG/FknbZY3cyvHQvI/SD75uLHbFhENLCOCMamwjgcNGk4uFIzQ1Sb+yHb
	q8KC6qoQgSsPWSvrFsNBaySyHf+Vgd8E7mAa7pc2427T2SvvHK39et2pV8yEc1Wj
	snlGo5uqBQnYY2JzFAsCEOfFahmRZxOa5gwDVa2P1d6dr42GcXWwdRrRERTqLF2l
	B5vJpxzyNXM8F2pjf3mzRY8la2LZV/YneI1Toa4KoAxaBopmCZth1QpWIJ6iAMF1
	U+vtiStcsISkl1Zw==
Received: (qmail 1099457 invoked from network); 19 Mar 2026 11:59:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:52 +0100
X-UD-Smtp-Session: l3s3148p1@xpHId15Nyt0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 01/15] hwspinlock: u8500: delete driver
Date: Thu, 19 Mar 2026 11:59:23 +0100
Message-ID: <20260319105947.6237-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The U8500 platform was converted to DT around 2013 and is DT only
meanwhile. This driver has never been converted to a DT driver, so it
clearly hasn't been used since then. To ease upcoming refactoring in the
hwspinlock subsystem, remove this obsolete driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 MAINTAINERS                     |   1 -
 drivers/hwspinlock/Kconfig      |  10 ---
 drivers/hwspinlock/Makefile     |   1 -
 drivers/hwspinlock/u8500_hsem.c | 155 --------------------------------
 4 files changed, 167 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..59bccd940fe0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3155,7 +3155,6 @@ F:	drivers/clocksource/clksrc-dbx500-prcmu.c
 F:	drivers/dma/ste_dma40*
 F:	drivers/pmdomain/st/ste-ux500-pm-domain.c
 F:	drivers/gpio/gpio-nomadik.c
-F:	drivers/hwspinlock/u8500_hsem.c
 F:	drivers/i2c/busses/i2c-nomadik.c
 F:	drivers/iio/adc/ab8500-gpadc.c
 F:	drivers/mfd/ab8500*
diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..d84e00084ee2 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -53,14 +53,4 @@ config HWSPINLOCK_SUN6I
 
 	  If unsure, say N.
 
-config HSEM_U8500
-	tristate "STE Hardware Semaphore functionality"
-	depends on ARCH_U8500 || COMPILE_TEST
-	help
-	  Say y here to support the STE Hardware Semaphore functionality, which
-	  provides a synchronisation mechanism for the various processor on the
-	  SoC.
-
-	  If unsure, say N.
-
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..3a740805949d 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -9,4 +9,3 @@ obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
-obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
deleted file mode 100644
index 5a2d8c3e0d80..000000000000
--- a/drivers/hwspinlock/u8500_hsem.c
+++ /dev/null
@@ -1,155 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * u8500 HWSEM driver
- *
- * Copyright (C) 2010-2011 ST-Ericsson
- *
- * Implements u8500 semaphore handling for protocol 1, no interrupts.
- *
- * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
- * Heavily borrowed from the work of :
- *   Simon Que <sque@ti.com>
- *   Hari Kanigeri <h-kanigeri2@ti.com>
- *   Ohad Ben-Cohen <ohad@wizery.com>
- */
-
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
-#include <linux/platform_device.h>
-
-#include "hwspinlock_internal.h"
-
-/*
- * Implementation of STE's HSem protocol 1 without interrutps.
- * The only masterID we allow is '0x01' to force people to use
- * HSems for synchronisation between processors rather than processes
- * on the ARM core.
- */
-
-#define U8500_MAX_SEMAPHORE		32	/* a total of 32 semaphore */
-#define RESET_SEMAPHORE			(0)	/* free */
-
-/*
- * CPU ID for master running u8500 kernel.
- * Hswpinlocks should only be used to synchonise operations
- * between the Cortex A9 core and the other CPUs.  Hence
- * forcing the masterID to a preset value.
- */
-#define HSEM_MASTER_ID			0x01
-
-#define HSEM_REGISTER_OFFSET		0x08
-
-#define HSEM_CTRL_REG			0x00
-#define HSEM_ICRALL			0x90
-#define HSEM_PROTOCOL_1			0x01
-
-static int u8500_hsem_trylock(struct hwspinlock *lock)
-{
-	void __iomem *lock_addr = lock->priv;
-
-	writel(HSEM_MASTER_ID, lock_addr);
-
-	/* get only first 4 bit and compare to masterID.
-	 * if equal, we have the semaphore, otherwise
-	 * someone else has it.
-	 */
-	return (HSEM_MASTER_ID == (0x0F & readl(lock_addr)));
-}
-
-static void u8500_hsem_unlock(struct hwspinlock *lock)
-{
-	void __iomem *lock_addr = lock->priv;
-
-	/* release the lock by writing 0 to it */
-	writel(RESET_SEMAPHORE, lock_addr);
-}
-
-/*
- * u8500: what value is recommended here ?
- */
-static void u8500_hsem_relax(struct hwspinlock *lock)
-{
-	ndelay(50);
-}
-
-static const struct hwspinlock_ops u8500_hwspinlock_ops = {
-	.trylock	= u8500_hsem_trylock,
-	.unlock		= u8500_hsem_unlock,
-	.relax		= u8500_hsem_relax,
-};
-
-static int u8500_hsem_probe(struct platform_device *pdev)
-{
-	struct hwspinlock_pdata *pdata = pdev->dev.platform_data;
-	struct hwspinlock_device *bank;
-	struct hwspinlock *hwlock;
-	void __iomem *io_base;
-	int i, num_locks = U8500_MAX_SEMAPHORE;
-	ulong val;
-
-	if (!pdata)
-		return -ENODEV;
-
-	io_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(io_base))
-		return PTR_ERR(io_base);
-
-	/* make sure protocol 1 is selected */
-	val = readl(io_base + HSEM_CTRL_REG);
-	writel((val & ~HSEM_PROTOCOL_1), io_base + HSEM_CTRL_REG);
-
-	/* clear all interrupts */
-	writel(0xFFFF, io_base + HSEM_ICRALL);
-
-	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
-			    GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, bank);
-
-	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
-		hwlock->priv = io_base + HSEM_REGISTER_OFFSET + sizeof(u32) * i;
-
-	return devm_hwspin_lock_register(&pdev->dev, bank,
-					 &u8500_hwspinlock_ops,
-					 pdata->base_id, num_locks);
-}
-
-static void u8500_hsem_remove(struct platform_device *pdev)
-{
-	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	void __iomem *io_base = bank->lock[0].priv - HSEM_REGISTER_OFFSET;
-
-	/* clear all interrupts */
-	writel(0xFFFF, io_base + HSEM_ICRALL);
-}
-
-static struct platform_driver u8500_hsem_driver = {
-	.probe		= u8500_hsem_probe,
-	.remove		= u8500_hsem_remove,
-	.driver		= {
-		.name	= "u8500_hsem",
-	},
-};
-
-static int __init u8500_hsem_init(void)
-{
-	return platform_driver_register(&u8500_hsem_driver);
-}
-/* board init code might need to reserve hwspinlocks for predefined purposes */
-postcore_initcall(u8500_hsem_init);
-
-static void __exit u8500_hsem_exit(void)
-{
-	platform_driver_unregister(&u8500_hsem_driver);
-}
-module_exit(u8500_hsem_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Hardware Spinlock driver for u8500");
-MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
-- 
2.51.0

