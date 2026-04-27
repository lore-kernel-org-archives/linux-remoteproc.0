Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555D31F984
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320774; cv=none; b=D2WEJcVmHuCyUjwUqJ5IkWcVvvbzpa9YWoPLrhPPKd+ZXb25BH0x0yEHqeQ3JOphhDRNZHLdraXqIL6x+oqzthER7IO2b2mqgDMV0UFWKEEOXiGuQBVU8vJ+qn5FIufbbvXJCbEL7NZB8bCx7MIj5GXTeDkuXE/bFHeQLDRaEdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320774; c=relaxed/simple;
	bh=1Xwggl8TDEb28dHIA5odZJE0LEGpUMlRHtlwQf12Rfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oVw7Oy561Mt3ejdKcHx+aBYdYt6bCELeURtZfg8C/gZoaIpov/CSxUtb9DBOXZEOi57MCXmsVY17GqpUGDXgwio+0V39XtzlNOI5oPxJCPa0rcIM8Sgu+ljQKyr7H2EWkc/zN1fTEJ7plKCXAnXVuyzpzc8PuGU/hdit36NoRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J5wNvVY7; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J5wNvVY7"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-50d7c12e48eso102995031cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320770; x=1777925570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDV4LUkEkUcEhST/7UTvXNteW4b3j/yhsWXpXNrZ4E8=;
        b=pdqzAxyHLoOKpsuknC8BDQsX9Jfc4N6a737YWgG32tSIYPsc81SgpKxSUunS976Azs
         zWKHC4Mpgs7IicDI+kGDsDQZkFOHoLeCLcgCNS8zSpjSBJz1capgJ+PIQsFAPczx6Azp
         Mko4Giia+HHAc9EnVWjSqoOcZz+oDJg8tcI2DgTHDEMQcD3C2A8R+SY9oASu89DTOcGP
         A0lrjvr22CTvoyQ7bh2nc9VsHppvn/8+A6ogFTF56Skh+4DphAvLzsOUWFqpL2T0P0bG
         2iVAFE025uKVEgwp+ahgEvLfewBB2FQDh1x9FzDiZfgaVfsQ3roQT5JS74ZKQjeHktKe
         gA+g==
X-Forwarded-Encrypted: i=1; AFNElJ8tgygVyx7aLWC7V7uS9DC3K9FoyI/Ez37vnEDmfu9C2khDvc0ODicjGOXhl8MXO+uquLHLWILfapnPlL9VFt0P@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe1yTIK1dyjqkPUNzv4FkAMIuF2kbNyL5MAGr4ZUA2o76Uv3Q7
	i5DzFEjcN4h6OpAwlMCzdOTiGifEg1M/0dKzyqCThrLrh8t5Jo94xlJDQBIbX3CtN5p5pB74vi6
	MdQnvN/LUGt47LlW2K5Ch1IGQTYR0lXvZsA5Acy7C+WbV2h4iMC+j4pqJ32LTrcLrLqNeH+HiYS
	CLOMsyG6IjtNIusaPpogt8iIdbZC4Ar8JMe88Is0TIZup1PxQfk+sjCt2BHveiwE1Gd3cN1MK3p
	Q6uAyCfTt+BL1VqsFBFlw==
X-Gm-Gg: AeBDietZIIL+Y7BtDfeDuG9KgMF4281xE8CWAnTBc1l624if8QzKjLaq12pfanPfPIa
	WF/DEf0kZm2mrrP3NmwN39k7Y84MTIORrDOz+dCylmab/gl624mknfjiRe3/lp5x8c/l+o6Orr7
	nkFJQ2I2xE4jYZbJQDxDhVnqbN0pxkGVvKvtTG1SEe/Db8h+8UmLD2lukcmMj4LwTT3QVRbNYXs
	7Feaa3+QFpxf6d0tdAFRWWDRMQvghGXqDxEVHZVZ/RB0KhPJonRbot50Dv4BS7bt+1+2vDvqWFW
	OV7kAT4JViAjuq+8tWgKu3rowbgbUsxSVkFE9LK8WwBuHN7Sin9NNSeYTTrKJmeiVDD5BFJIlau
	UNL8E0FvluOkcUQk4XDrGVZ3ctoCstaDsqIcj144tO0w4uSDVQh0Fyh/8EwRnpt/ULAI0RYy8Rx
	6Ucr/bzPDZQlhe
X-Received: by 2002:a05:622a:a941:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-5100da7c6bbmr2684431cf.35.1777320769978;
        Mon, 27 Apr 2026 13:12:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8b3e29eb0efsm247676d6.19.2026.04.27.13.12.49
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so9540631eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320769; x=1777925569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDV4LUkEkUcEhST/7UTvXNteW4b3j/yhsWXpXNrZ4E8=;
        b=J5wNvVY7VLl0pjus/4Yg9B0aI87Z6h7U9ApE/2EOnSzKhS9YPUkLzz11tG89CrNzad
         8t1NhAPs6Nm1AxZ+mvoOiqXEG+XmVgRJw4Hv2SQEQ3DJuDzGtF27euP2PC53sraYYyeb
         svWeN2R9C8ZbSXBn/ELY3gdX9ilQjI5ub0g9w=
X-Forwarded-Encrypted: i=1; AFNElJ8XpQK6lsHTLdaBa7PLQ5GsJ1SLVe0nB7mgpRXpb+PMNamPFbMLmFFg+8nLoyM1VyG2vtKDDY7IuTKftZ4oktfR@vger.kernel.org
X-Received: by 2002:a05:7300:d509:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2ed0a3e3ac0mr143853eec.4.1777320768618;
        Mon, 27 Apr 2026 13:12:48 -0700 (PDT)
X-Received: by 2002:a05:7300:d509:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2ed0a3e3ac0mr143826eec.4.1777320767938;
        Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Mon, 27 Apr 2026 16:12:32 -0400
Message-Id: <20260427201233.380314-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
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
 drivers/hwspinlock/Kconfig              | 10 +++
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 96 +++++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index d84e00084ee2..3a81a6785e45 100644
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
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index 3a740805949d..379443987b94 100644
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

