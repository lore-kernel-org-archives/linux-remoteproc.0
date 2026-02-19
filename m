Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5832ABF9
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 21:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771538240; cv=none; b=FarxuzpL3h9hcoLauuhhXiuefq28oJ65cTZ7/54ZDuqX2mL2H27t3FrYjHSgaxNzMr79Apsiy8l4j7kXr/mSw5V710XwspXmqXdtbZzztYvAs4wjKzAdsrCwwLH3233m7wm6a965nfk6tde8dXrJL0wD4ygUKKqsizrCj3bU+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771538240; c=relaxed/simple;
	bh=jD5yGVia+PZnL8Wq60+PPU60FeQK0qWyKw0Q5LrmgWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lVkLkXlGZetzBixNAWif/RD4xPHzjULaxTNiEfwqmAZHyMmmtLXTFu9SavitywAc9cdUBrp7Y4P3fffZVgtgxAxL5ZjsapqE1/+cWK1zr97par9WdhtiGtmL1Zj/dVh2Zuw7Xv5EQdrnkEHi/E8iTY/GmK2jtB0rjHVSm9TcH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SyjGnMec; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SyjGnMec"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2a962230847so12137705ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538238; x=1772143038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ4iRn4Yr0HtvQBIFvgGnqHMHINRSvRxdUg7UzIwt38=;
        b=qYBSeRNXIgvr/DAWNWaUm9l9tVj6qR6mpJJwwxEZljHgIRkzMXrspYpAMHh7z2glDa
         Od8zUiv43NgqvzcKmixDMQcb654cMwXLzSyw6dkKIaM1XWupuRBLOMU6RaZflBGQUc9D
         9cmfhkGAGwB9NDfaxtVRFX5RKsjruhyaRojWg8dq8rWXu4dJcn8uz3ltJS2HwYn2mEJR
         kWovE6PsnPmA5UdaCvcZLeAPWqQzj3PNXbj9CtY4J5O/trCAeA6zJRzJiEz+FrEPk3Aa
         wLyOw27hGB3ccf1sumMPD+dDPu9HAvy3kvLRaFm9+M5tLcGUqieBulQv/tNSm7J3k2RJ
         XhSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGUwXsNaWwjvL5Of6LTG/gSevXGk2uUepCO1Tibb3Due4tGIW4VktKqaYDlmxykWq7iOlEtVt84R1iK1XcVJII@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJLvZZCYYFML0remmt+W+e6/wJTOKSwyPoRcDATZ1X6y+E+jV
	kvpO/LAFvcUKvKKkv2kTQnGnGIeZcxotVA3Wd689NvPEzpzptLHgYdDzWjZQmwuP2OXL7UtOKsr
	wL7RwGe4wYTgDmwztqEbKQijrJNJpTwRG3ZlEHsxB+jhDaWjaTah59I5sBqO784TflId7Ddfhw9
	WnuxlcbTwm3rWCsRDqrSXCc3oXZirq2bJo8qQDELV4/JF9aRZl/l/5AiovoQKajULp0uoc5xaHE
	g5xo0+fzx/hSvMCZM//TA==
X-Gm-Gg: AZuq6aKyxmEEJI9HujOf00mHbvISOuv0FZkQ8GnwzvuwUvUExM+9xmbUWYJsNS9mVii
	s5eEyHbP5qJA12/290sBuFfbK4ev2MAEmNRFU7dGcSEyRtgqR6oK1lNYPkSIETrEZhenTdCLit9
	Qj2qrR6qf3alfCieziDE+8sLev5AHrIogoq64G5qpIsW3gNTyQiPtLb8oSKHw4HSOH9DR37NWUw
	wG8vUfAq5+IJV6GcS0K9Hdt3ief6KPpMpps/kz5swuQ8ETpF3Lq1HI+ONeLlX9Ei6gjOa4HIssb
	hkiDzVhJCbKYX3nk/nDGDEBhsp079TOu65kLAVqusv3cU/MnhqguWd8yM7DFilotzdFZ2WPD1Za
	ohHYCvilDbuJY/i8rfCYPnPBN8NxXwLHI+7O2cDM8TqCPqb9UlgMSC5XqVUMPpjF9KX9gethhJc
	1gjy4uokGtNQSGwI5q4VahD4W/yP4KYa+82tY1XFaNWhwvYYewclqO8Q==
X-Received: by 2002:a17:903:1663:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2ad50ea592amr66659335ad.21.1771538238167;
        Thu, 19 Feb 2026 13:57:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad1a8b28besm23403665ad.53.2026.02.19.13.57.17
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so56250125ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538236; x=1772143036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ4iRn4Yr0HtvQBIFvgGnqHMHINRSvRxdUg7UzIwt38=;
        b=SyjGnMecLBLAXhQOIR8XjvsTosk3VoglaRM+cSvOY3BdscNGasNSfUnVqOu8B/DF0u
         JTMZO36PuapnGZccjYYT76Sa5RFjHGG1fcdSbq7ud6GbBIHwEt0mhCsxh7vVXlTpJGd+
         xU6c/ZCWyAWF5G/muvGX9U2/H5QhaV6d47IBs=
X-Forwarded-Encrypted: i=1; AJvYcCUyxZ4s7r9vgGzxy6qIZ4Y8mN9qiZFoUQwuIkRYCkpv2L2e1BEALAlq9+dMU8ylVStD/wks89fz/tX77naOf6bA@vger.kernel.org
X-Received: by 2002:a17:902:dac7:b0:2a9:5b87:5bd4 with SMTP id d9443c01a7336-2ad50e58478mr62473625ad.1.1771538236583;
        Thu, 19 Feb 2026 13:57:16 -0800 (PST)
X-Received: by 2002:a17:902:dac7:b0:2a9:5b87:5bd4 with SMTP id d9443c01a7336-2ad50e58478mr62473445ad.1.1771538236118;
        Thu, 19 Feb 2026 13:57:16 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:15 -0800 (PST)
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
Subject: [PATCH v4 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Thu, 19 Feb 2026 16:57:01 -0500
Message-Id: <20260219215702.63321-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219215702.63321-1-kamal.dasu@broadcom.com>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
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
index 000000000000..4488032a3f7f
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
+	{ .compatible = "brcm,brcmstb-sun-top-ctrl-semaphore", },
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

