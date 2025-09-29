Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B27261581
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759176434; cv=none; b=oGyiaH953jCQBOS/T2KyW9eoWVjEa3R9R0qoX3gAAysXUsTDHYldSzOP6NWIz9556RVkoGj2mODy9tNzUpEQlXUe3IXkP6ZasMmBo0e6s/kPcmhrYL8gvvABWoKNb3EEd8lXu51HbP8gkg/2aBuHPfOtVkzcPZEvl/3kdvbvLjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759176434; c=relaxed/simple;
	bh=0JiNpHHORJSEltvIbaftdDsfMyRa/xjCyZoXBWOojB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6dj3G51AqxGkT7VUEGThUcPY2fJqBQ9wQdp9Y3UC2DUvUNvOtpuwlGC56an36EtwJCUeTYPBfnJruyUcBi1msSMYnPNsa2sMP2gkuizbAJjB/ea+ZB/PiWnOvNw32wN9gvz/Z9gxu7sB5dfnVKPrJjm8cHDXUpz2HoeLqgRpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QA8Cu5ka; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QA8Cu5ka"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-796fe71deecso36213306d6.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176431; x=1759781231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA3uOR00VQG2MYj5nJtUQY0pkQ46ZSnhVcxuOfdZq+A=;
        b=eIHhKZCnv4oMT6EE0unEg4527mg8Db0ilTISPMqccRVOOBHOb7m3JwrxdOF59qUbfy
         HhnIrmDjGgajmyuvbwTIx6PZGDIUwSzWj37iiuuuCWvV3gp5hr9rCmSu5wiSk0HC0U86
         ApHK6ar2XH37h5EC7kncVK64LJsHQ+yobO2Z2bB9snxcXWpySe0SsRBIOTrZm2+gX1rN
         fAPu7ia6ib4pGb6hxYgMpRwlo4Kz3mAM/9/McIM2HqpFiP1eW6YTmSS5iTRSNimAsEP1
         uxOnMrJ6n3Wgb4MsBb/9tqKffGoxFehHe7q5HA7rL+3RHQH6DM5M/6OAvpBQkqoZGFrt
         mutQ==
X-Gm-Message-State: AOJu0YxU8fOmN2vwbEkvg61jiOfDx6D+oGMzmyr/PjDVu9C7AucQOiG6
	XeG/1ZFBIdJ/6b5j9NVqKQdk7TZIpNbf6ZFlHOyOdCDrmBYDqBIliDzEDuHccl7r8Zu9QuY/y/u
	384LYfeNR7fzZI57BivvkCziIp5N+6uKRb9kxP+AcLVsTlWBzsggilUeHkZ0KNm71KSxkh0je9p
	MFJD0im1k9GVwY2u+Q23MWJ4Cr2DQtiHuxaqTnKfErZxY1UF6quoFISpboomQ3oGXSi5C32byA5
	Wl8h90yhmFovYMxjd8iQg==
X-Gm-Gg: ASbGncvQckBsbeeG4kg88IcDvhE5lG6Nl27T1MWJrNVdyJO156hu+0aJyj4BwQcMgWT
	dT9OJ5IUbu9lhiw9X5H7Hu3yPhEba5aE4rPEShD3/+9F6wzDVy3lcfTI7Wwh9r+UYoJbVdkK4ie
	si/xLQQW0Tnvc2OzJDadC3tbTwlFDyCwZv7RksNw97JEcWk9BbztpRubRs4Kx2nyWBm4op3vWcb
	FpR4EyLlupK44Z9atQg3Bdd5g+sl+nyeqVO854Q4hWv1L69Ed8wexDi/3/TPZO7Y+xoRi1LbBHC
	+Cxy4cdLgM79R5ZtguXwo+BciVKWyS2wDRlEjh8aaEU0ljwvHjkQlcDIqiULDXKvgzNRwIv7KtV
	8f78zmASDaVH8bMLBXc6Azt5HfQVdXmXgubuOUt1KTmGxM/D2DlGensb5w3dNAOV9zgCvLeRnHk
	4=
X-Google-Smtp-Source: AGHT+IHsluJAzAP24xHptKoKvH39aFHjRdCiv5T3YRo1ifNIqKHkkDED7MPv9QDYddsEMU/6PEklVviCCu+c
X-Received: by 2002:ad4:5deb:0:b0:765:44f5:6fa9 with SMTP id 6a1803df08f44-7fc3ca0be75mr238685056d6.37.1759176430606;
        Mon, 29 Sep 2025 13:07:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-80161a317b1sm8708936d6.27.2025.09.29.13.07.10
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-336b646768eso3236586a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176429; x=1759781229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA3uOR00VQG2MYj5nJtUQY0pkQ46ZSnhVcxuOfdZq+A=;
        b=QA8Cu5katZ4+YsdeF0z9cRRtT3nJdYwa4UZBK935GyI+j8NEAaIHz91+ipctD+qyZg
         CHwtouaLUlMobGdlOZw7icLyvPFjimfnKdIF/jsl7TrbImCBJpdjJ+nRnZ+DfNmUbnqe
         F9wuezyjOsj8ZzmaYq3QnOpwJKtIWQ1qTi8O0=
X-Received: by 2002:a17:90b:3143:b0:32e:1ff5:5af4 with SMTP id 98e67ed59e1d1-3342a2fe9ddmr18545838a91.35.1759176429373;
        Mon, 29 Sep 2025 13:07:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:32e:1ff5:5af4 with SMTP id 98e67ed59e1d1-3342a2fe9ddmr18545816a91.35.1759176428992;
        Mon, 29 Sep 2025 13:07:08 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:07:08 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Mon, 29 Sep 2025 16:06:26 -0400
Message-Id: <20250929200628.3699525-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Added support for brmstb_hwspinlock driver that makes use of
the hwspinlock framework. Driver uses SUN_TOP_CTRL_SEMAPHORE_[1:15]
registers to implement the hardware semaphore. With this change
other brcmstb drivers can use hwspin_trylock() and hwspin_unlock()
apis and make use of this hwspinlock framework. Other driver dt nodes
just need to use a reference to the &hwspinlock and the lock id
they want to use.
e.g. hwlocks = <&hwspinlock0 0>;

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/hwspinlock/Kconfig              |  9 +++
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 98 +++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..551afa8df2d0 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -63,4 +63,13 @@ config HSEM_U8500
 
 	  If unsure, say N.
 
+config HWSPINLOCK_BRCMSTB
+	tristate "Broadcom Setttop Hardware Semaphore functionality"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	help
+	  Broadcom settop hwspinlock driver.
+	  Say y here to support the Broadcom Hardware Semaphore functionality, which
+	  provides a synchronisation mechanism on the SoC.
+
+	  If unsure, say N.
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..4f5c05403209 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
+obj-$(CONFIG_HWSPINLOCK_BRCMSTB)	+= brcmstb_hwspinlock.o
diff --git a/drivers/hwspinlock/brcmstb_hwspinlock.c b/drivers/hwspinlock/brcmstb_hwspinlock.c
new file mode 100644
index 000000000000..56206431a94c
--- /dev/null
+++ b/drivers/hwspinlock/brcmstb_hwspinlock.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * brcmstb HWSEM driver
+ *
+ * Copyright (C) 2025 Broadcom
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/hwspinlock.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include "hwspinlock_internal.h"
+
+#define BRCMSTB_MAX_SEMAPHORES		16
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
+	int i, num_locks = BRCMSTB_MAX_SEMAPHORES;
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
+	platform_set_drvdata(pdev, bank);
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
+	{ .compatible = "brcm,brcmstb-hwspinlock", },
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
+MODULE_AUTHOR("Kamal Dasu <kdasu.dasu@broadcom.com>");
-- 
2.34.1

