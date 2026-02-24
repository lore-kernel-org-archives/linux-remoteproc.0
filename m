Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E233A6F6
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970684; cv=none; b=BIN+94Mux2UzRw6s6OS2A/KN7FonUEWT56rC9+QoacoXv6FvxXuTkg5D+d44Kbw1R5txxVGVTdcmmr0S2zB9KsNgaz0PHzGIDGgFhOmj4nW8S15CwJ6p6y+FOCwrRX6LCcZcOXEH70/fwpDJBBv8D/PExdTlicEjzfALbbyfmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970684; c=relaxed/simple;
	bh=5oVJd2K0SSd/g7EHCAssVRhoQWOkXnnMU02dVY35emo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PI+ANP8CbE9I+i2IpevqhB3B0M57UN6UDDwmzvx+nNQlksSjqkwE4DH51KtHgW/10denZ3u6Zn1zskgk/iQRtNK2qdQZj0774JvO+TzDQP5Ajt7BUCiP8h7e/wh9fpf49YRu/eM6kIKcIp8IA42jEkVXgKw7CbtMr9CnHKwceY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=e/I0dOYC; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="e/I0dOYC"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-824a2888de5so108573b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970683; x=1772575483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=;
        b=tbpXY5BHmnonNub/F9IJW5UmCjX58G9Gb2khoT/9BBrECTHPpBqlKB6rQI6M2V+lqz
         tfe0tG/ltOYlhhfK54UT+QfIWROirULJMq6DqEezlqLAX7qMyT0IvuBkyq12p0iiGlg5
         P+StsVkbV+6ppmVC2Uec0hF0TH2A290+dATFmesM3GtQnvu05t3qvm7CXzX+VSC8jIoA
         hShmpy4xMwOwMoCrO8irynPhkdK7yerghTesWo6fxB4fLmzPWhalJLmHkqyitDQvCWJ9
         Mxl0O5dfr8gt4F7P3qzWUrFsyjdzaY4IrirU46tRBmIs/ZAJVqDdRbkmNecIdahUCLrh
         IWeA==
X-Forwarded-Encrypted: i=1; AJvYcCW5J7gpR34hZ5Kd4yRomTwDmOwAphNY2wsz1pUvnb22oYvNloK4g4gOGWYxMcsE0nFveqmW2g4s8DyYgwFj03Nk@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqw7WRhR3dy9SDsFHI/yI01IykIPgRfLJb6zdexeGHa5KLvuG
	vTapxeCmb57ORLWLWGtf/G3fQG2UyE3cMxBO2XVdLpfiiMd+AhAKGcNpvkVUkottTxfupJouupz
	p2z1CSra6lEYk3lqJdaLqXG9cgBSWIlDtfnmhfS0buBapH19+4H3sWLIxCW8T1LYzMF+KqUWSJD
	49IAFQmQvvBNMWMZIOjhNfbcVTGzRm1ZQv5CIMxJWx0wzUKdBY7um63jG+3D6bBJfDFojWBZb1f
	n4Dq3sxvE4xPdqAG4FXYg==
X-Gm-Gg: ATEYQzzQSmWnO3qWqAnLLPkh0bI9MaaeoXkQE6JZGWbZqQHdg8IfAu3eD2rxMHfgTCi
	Xcd/sGJ5agRo8euHKrNKXxJsfcDp3RAohxXfDsEqnm5nn250n75tLB4/wLiYQue26qgDLQ8Sh4g
	P1qkRIkrCN82TlLJ7A2N227PkRMScpFq3ouJ+xA9hViMEulBKHKq+9LNvbW4fvTSFcCSDq8PXiN
	F468y5mtSiCDcSg0/vyXuYvq/5SuQBuLrwBYIkvWj2SXUFGTGrlciXSP2G5u59cXM9YP9sVccPt
	ukgebyw+QAwsjhua9WVh1hmtKXTiRL5pkUDjeN8SD3SMVFyLpgd94QNBaVsU7J3Sg899Pl7xcXr
	8iSk+1Rfa2cUfE4OfGN6G2OBx2uUDLFWh3j6ioSpIiKWQZsM1ytj+MkfYP1Opbbk/cvMSXCyZ/t
	to5EC/o5Vgy47Wh+XZDSfYwSH4bzLUWihjwsmjl6gHAnAtvYzngh9Kiwd7
X-Received: by 2002:a05:6a20:72a3:b0:32a:745f:bee3 with SMTP id adf61e73a8af0-3959ac989b9mr1098068637.21.1771970682703;
        Tue, 24 Feb 2026 14:04:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c70b71a35ccsm1444569a12.4.2026.02.24.14.04.42
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdaa7cb638so211456eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970681; x=1772575481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=;
        b=e/I0dOYCtspgdWItPuDsbaxEODJF3Bk3149Zj0BLRIBdgZhXtlwieA6Jd9s/TLwgI4
         mUmIOov03WjsuuuBVJNGouCPu3FjDqHcvcCzIEPUgKMRIqqiLsM4ne6UWtcoIwrBukzV
         ZeRYFAHQJ9YZYRxyGgIz+gsZIeU1goO+0cJ1w=
X-Forwarded-Encrypted: i=1; AJvYcCXQ3Y10y4Oc2OMWpEGXEZPAL5aR0lDkVpn7DvxEojDV/6wvjuAf7kLZ79994E+9oUL02F7mCaIeSFBEEKBSVIk6@vger.kernel.org
X-Received: by 2002:a05:7301:7015:b0:2ba:7b2a:6a5f with SMTP id 5a478bee46e88-2bdbc347a89mr507202eec.8.1771970680915;
        Tue, 24 Feb 2026 14:04:40 -0800 (PST)
X-Received: by 2002:a05:7301:7015:b0:2ba:7b2a:6a5f with SMTP id 5a478bee46e88-2bdbc347a89mr507193eec.8.1771970680284;
        Tue, 24 Feb 2026 14:04:40 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:39 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v6 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Tue, 24 Feb 2026 17:04:06 -0500
Message-Id: <20260224220407.2351692-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Broadcom settop SoCs have common 16 hardware semaphore registers that
can be used as part of the kernel hardware spinlock framework. The
hardware semaphores are part of the 'sundry' ip block that also has
controls like pin/mux controls, SoC identification, drive strength,
reset controls, and other misc bits.

Adding support for brcmstb_hwspinlock that only maps sundry block
registers SUN_TOP_CTRL_SEMAPHORE_[0:15] to implement the hardware
spinlock operations. Change allows other Broadcom settop drivers to
call hwspin_trylock() and hwspin_unlock() interfaces to make use of
hwspinlock framework. Other driver dt nodes just need to provide a
reference to the &hwspinlock and lock id to make use of a particular
hardware lock.
e.g. hwlocks = <&hwspinlock0 0>;

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/hwspinlock/Kconfig              | 11 ++-
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 96 +++++++++++++++++++++++++
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..9b7f7bcce14b 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -8,6 +8,16 @@ menuconfig HWSPINLOCK
 
 if HWSPINLOCK
 
+config HWSPINLOCK_BRCMSTB
+	tristate "Broadcom Settop Hardware Semaphore functionality"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	help
+	  Broadcom settop hwspinlock driver.
+	  Say y here to support the Broadcom Hardware Semaphore functionality, which
+	  provides a synchronisation mechanism on the SoC.
+
+	  If unsure, say N.
+
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
@@ -62,5 +72,4 @@ config HSEM_U8500
 	  SoC.
 
 	  If unsure, say N.
-
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..35f2d94d8ba2 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
+obj-$(CONFIG_HWSPINLOCK_BRCMSTB)	+= brcmstb_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
diff --git a/drivers/hwspinlock/brcmstb_hwspinlock.c b/drivers/hwspinlock/brcmstb_hwspinlock.c
new file mode 100644
index 000000000000..7a5a35e741f3
--- /dev/null
+++ b/drivers/hwspinlock/brcmstb_hwspinlock.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * brcmstb HWSEM driver
+ *
+ * Copyright (C) 2025 Broadcom
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include "hwspinlock_internal.h"
+
+#define BRCMSTB_NUM_SEMAPHORES		16
+#define RESET_SEMAPHORE			0
+
+#define HWSPINLOCK_VAL			'L'
+
+static int brcmstb_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = (void __iomem *)lock->priv;
+
+	writel(HWSPINLOCK_VAL, lock_addr);
+
+	return (readl(lock_addr) == HWSPINLOCK_VAL);
+}
+
+static void brcmstb_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = (void __iomem *)lock->priv;
+
+	/* release the lock by writing 0 to it */
+	writel(RESET_SEMAPHORE, lock_addr);
+}
+
+static void brcmstb_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(50);
+}
+
+static const struct hwspinlock_ops brcmstb_hwspinlock_ops = {
+	.trylock	= brcmstb_hwspinlock_trylock,
+	.unlock		= brcmstb_hwspinlock_unlock,
+	.relax		= brcmstb_hwspinlock_relax,
+};
+
+static int brcmstb_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct hwspinlock_device *bank;
+	struct hwspinlock *hwlock;
+	void __iomem *io_base;
+	int i, num_locks = BRCMSTB_NUM_SEMAPHORES;
+
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base)) {
+		dev_err(&pdev->dev, "semaphore iobase mapping error\n");
+		return PTR_ERR(io_base);
+	}
+
+	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
+			    GFP_KERNEL);
+	if (!bank)
+		return -ENOMEM;
+
+	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
+		hwlock->priv = (void __iomem *)(io_base + sizeof(u32) * i);
+
+	return devm_hwspin_lock_register(&pdev->dev, bank,
+					 &brcmstb_hwspinlock_ops,
+					 0, num_locks);
+}
+
+static const struct of_device_id brcmstb_hwspinlock_ids[] = {
+	{ .compatible = "brcm,bcm7038-sun-top-ctrl-semaphore", },
+	{ /* end */ },
+};
+MODULE_DEVICE_TABLE(of, brcmstb_hwspinlock_ids);
+
+static struct platform_driver brcmstb_hwspinlock_driver = {
+	.probe		= brcmstb_hwspinlock_probe,
+	.driver		= {
+		.name	= "brcmstb_hwspinlock",
+		.of_match_table = brcmstb_hwspinlock_ids,
+	},
+};
+
+module_platform_driver(brcmstb_hwspinlock_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Hardware Spinlock driver for brcmstb");
+MODULE_AUTHOR("Kamal Dasu <kamal.dasu@broadcom.com>");
-- 
2.34.1

