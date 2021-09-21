Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D24C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9A1B60F4C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhIUT1t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Sep 2021 15:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbhIUT1l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Sep 2021 15:27:41 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DC0C06175F;
        Tue, 21 Sep 2021 12:26:12 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id q11so42420079wrr.9;
        Tue, 21 Sep 2021 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yle8SnWCLDaMh59vPCNEVKcAeKvM9VLrdOx4Saa11cA=;
        b=LFv0QyArTzToTZ7n371GjxVQRnsB5GGE3ZMPhv1Iv7iFU9F+W5xvMOr94gjNvdBps0
         h7+AIr0r2/l9sk+YQ4ccAvvIncaumUX6IFrCCbzUBIHZZ7olojxiiZO+rnkbYueAC0FK
         AUYre4VqYmcxLl58MVDB4OqBpr9yROK3Y+4+u5F8sVfFqIjII6X8qxtHAWzzGj+oLqaa
         Qfxd20p9zMveX2e/QW13t5O2THoOPF9TwDuOWR2wfFa5uOADMW7d7mHAHas4yH5qN4zR
         NVxquDQ3CP4No0mPVm2GpD91gG4UNsILL8r5QuFhpMH+OelJY3RGGr+8WhNfVZtjLVF4
         0+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yle8SnWCLDaMh59vPCNEVKcAeKvM9VLrdOx4Saa11cA=;
        b=DywD6aTQllqGR0CCXDyKz3JYfXKlqlZzz1pKS26oJya0F0TiuBBN15a/Tf4wA6/7kP
         oFshplDvKplqzz7NvVPGV3kr+qFKc/pfaQHYznwJ6qAMUdjDdv+C8YAIq9541Ou9NRwW
         jtHrN7qXIqeKgK9O92Yji01wemssEplpIJaQxjTbCG8hJUuVHdFtySBiP/mlF0C/X+WQ
         H3jlZ7bswcO0zlWMJNH912Cl/ZZwL29L2sJ6Jx4KUuLwH+Y8634jnopc+7X8vpKX8dex
         eIL+/F8IFPY1AZACu05gRUSVJBGuX7EZhNUvGwLC5ViLNluYjzPNo+YZVpCe3ZQjAlfL
         fjDg==
X-Gm-Message-State: AOAM532DAbxEOoL5H8FplwS9m7lT/2SFmf9NC7Zng+mO74fxKGl1b6DW
        l14H6AhnKKMGzlA+uZ6BrF5+YgbJ9Hs=
X-Google-Smtp-Source: ABdhPJwQAQTtWvV+M/IwmXLRd6XVh/I3Z5Zf1TfYcno+CwSUPoCGwF7XxxWmG6AP+sOP//2ty7+hag==
X-Received: by 2002:adf:9d45:: with SMTP id o5mr37162141wre.226.1632252370774;
        Tue, 21 Sep 2021 12:26:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4aa-d500-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4aa:d500:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id h125sm3980771wmh.9.2021.09.21.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:26:10 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        ohad@wizery.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote procesor
Date:   Tue, 21 Sep 2021 21:25:57 +0200
Message-Id: <20210921192557.1610709-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
References: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Amlogic Meson6, Meson8, Meson8b and Meson8m2 embed an ARC core in the
Always-On (AO) power-domain. This is typically used for waking up the
ARM cores after system suspend.

The configuration is spread across three different registers:
- AO_REMAP_REG0 which must be programmed to zero, it's actual purpose
  is unknown. There is a second remap register which is not used in the
  vendor kernel (which served as reference for this driver).
- AO_CPU_CNTL is used to start and stop the ARC core.
- AO_SECURE_REG0 in the SECBUS2 register area with unknown purpose.

To boot the ARC core we also need to enable it's gate clock and trigger
a reset.

The actual code for this ARC core can come from an ELF binary, for
example by building the Zephyr RTOS for an ARC EM4 core and then taking
"zephyr.elf" as firmware. This executable does not have any "rsc table"
so we are skipping rproc_elf_load_rsc_table (rproc_ops.parse_fw) and
rproc_elf_find_loaded_rsc_table (rproc_ops.find_loaded_rsc_table).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/remoteproc/Kconfig           |  11 ++
 drivers/remoteproc/Makefile          |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c | 261 +++++++++++++++++++++++++++
 3 files changed, 273 insertions(+)
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9a6eedc3994a..3f8d5d80a0c4 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -127,6 +127,17 @@ config KEYSTONE_REMOTEPROC
 	  It's safe to say N here if you're not interested in the Keystone
 	  DSPs or just want to use a bare minimum kernel.
 
+config MESON_MX_AO_ARC_REMOTEPROC
+	tristate "Amlogic Meson6/8/8b/8m2 AO ARC remote processor support"
+	depends on HAS_IOMEM
+	depends on (ARM && ARCH_MESON) || COMPILE_TEST
+	select GENERIC_ALLOCATOR
+	help
+	  Say m or y here to have support for the AO ARC remote processor
+	  on Amlogic Meson6/Meson8/Meson8b/Meson8m2 SoCs. This is
+	  typically used for system suspend.
+	  If unsure say N.
+
 config PRU_REMOTEPROC
 	tristate "TI PRU remoteproc support"
 	depends on TI_PRUSS
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index bb26c9e4ef9c..ce1abeb30907 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
+obj-$(CONFIG_MESON_MX_AO_ARC_REMOTEPROC)+= meson_mx_ao_arc.o
 obj-$(CONFIG_PRU_REMOTEPROC)		+= pru_rproc.o
 obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
new file mode 100644
index 000000000000..ea9db46a7e03
--- /dev/null
+++ b/drivers/remoteproc/meson_mx_ao_arc.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/property.h>
+#include <linux/genalloc.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/remoteproc.h>
+#include <linux/reset.h>
+#include <linux/sizes.h>
+
+#include "remoteproc_internal.h"
+
+#define AO_REMAP_REG0						0x0
+#define AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU	GENMASK(3, 0)
+
+#define AO_REMAP_REG1						0x4
+#define AO_REMAP_REG1_MOVE_AHB_SRAM_TO_0X0_INSTEAD_OF_DDR	BIT(4)
+#define AO_REMAP_REG1_REMAP_AHB_SRAM_BITS_17_14_FOR_MEDIA_CPU	GENMASK(3, 0)
+
+#define AO_CPU_CNTL						0x0
+#define AO_CPU_CNTL_AHB_SRAM_BITS_31_20				GENMASK(28, 16)
+#define AO_CPU_CNTL_HALT					BIT(9)
+#define AO_CPU_CNTL_UNKNONWN					BIT(8)
+#define AO_CPU_CNTL_RUN						BIT(0)
+
+#define AO_CPU_STAT						0x4
+
+#define AO_SECURE_REG0						0x0
+#define AO_SECURE_REG0_AHB_SRAM_BITS_19_12			GENMASK(15, 8)
+
+/* Only bits [31:20] and [17:14] are usable, all other bits must be zero */
+#define MESON_AO_RPROC_SRAM_USABLE_BITS				0xfff3c000
+
+#define MESON_AO_RPROC_MEMORY_OFFSET				0x10000000
+
+struct meson_mx_ao_arc_rproc_priv {
+	void __iomem		*remap_base;
+	void __iomem		*cpu_base;
+	unsigned long		sram_va;
+	phys_addr_t		sram_pa;
+	size_t			sram_size;
+	struct gen_pool		*sram_pool;
+	struct reset_control	*arc_reset;
+	struct clk		*arc_pclk;
+	struct regmap		*secbus2_regmap;
+};
+
+static int meson_mx_ao_arc_rproc_start(struct rproc *rproc)
+{
+	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
+	phys_addr_t translated_sram_addr;
+	u32 tmp;
+	int ret;
+
+	ret = clk_prepare_enable(priv->arc_pclk);
+	if (ret)
+		return ret;
+
+	tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
+			 priv->sram_pa >> 14);
+	writel(tmp, priv->remap_base + AO_REMAP_REG0);
+
+	/*
+	 * The SRAM content as seen by the ARC core always starts at 0x0
+	 * regardless of the value given here (this was discovered by trial and
+	 * error). For SoCs older than Meson6 we probably have to set
+	 * AO_REMAP_REG1_MOVE_AHB_SRAM_TO_0X0_INSTEAD_OF_DDR to achieve the
+	 * same. (At least) For Meson8 and newer that bit must not be set.
+	 */
+	writel(0x0, priv->remap_base + AO_REMAP_REG1);
+
+	regmap_update_bits(priv->secbus2_regmap, AO_SECURE_REG0,
+			   AO_SECURE_REG0_AHB_SRAM_BITS_19_12,
+			   FIELD_PREP(AO_SECURE_REG0_AHB_SRAM_BITS_19_12,
+				      priv->sram_pa >> 12));
+
+	ret = reset_control_reset(priv->arc_reset);
+	if (ret) {
+		clk_disable_unprepare(priv->arc_pclk);
+		return ret;
+	}
+
+	usleep_range(10, 100);
+
+	/*
+	 * Convert from 0xd9000000 to 0xc9000000 as the vendor driver does.
+	 * This only seems to be relevant for the AO_CPU_CNTL register. It is
+	 * unknown why this is needed.
+	 */
+	translated_sram_addr = priv->sram_pa - MESON_AO_RPROC_MEMORY_OFFSET;
+
+	tmp = FIELD_PREP(AO_CPU_CNTL_AHB_SRAM_BITS_31_20,
+			 translated_sram_addr >> 20);
+	tmp |= AO_CPU_CNTL_UNKNONWN | AO_CPU_CNTL_RUN;
+	writel(tmp, priv->cpu_base + AO_CPU_CNTL);
+
+	usleep_range(20, 200);
+
+	return 0;
+}
+
+static int meson_mx_ao_arc_rproc_stop(struct rproc *rproc)
+{
+	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
+
+	writel(AO_CPU_CNTL_HALT, priv->cpu_base + AO_CPU_CNTL);
+
+	clk_disable_unprepare(priv->arc_pclk);
+
+	return 0;
+}
+
+static void *meson_mx_ao_arc_rproc_da_to_va(struct rproc *rproc, u64 da,
+					    size_t len, bool *is_iomem)
+{
+	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
+
+	/* The memory from the ARC core's perspective always starts at 0x0. */
+	if ((da + len) > priv->sram_size)
+		return NULL;
+
+	return (void *)priv->sram_va + da;
+}
+
+static struct rproc_ops meson_mx_ao_arc_rproc_ops = {
+	.start		= meson_mx_ao_arc_rproc_start,
+	.stop		= meson_mx_ao_arc_rproc_stop,
+	.da_to_va	= meson_mx_ao_arc_rproc_da_to_va,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.load		= rproc_elf_load_segments,
+	.sanity_check	= rproc_elf_sanity_check,
+};
+
+static int meson_mx_ao_arc_rproc_probe(struct platform_device *pdev)
+{
+	struct meson_mx_ao_arc_rproc_priv *priv;
+	struct device *dev = &pdev->dev;
+	const char *fw_name = NULL;
+	struct rproc *rproc;
+	int ret;
+
+	device_property_read_string(dev, "firmware-name", &fw_name);
+
+	rproc = devm_rproc_alloc(dev, "meson-mx-ao-arc",
+				 &meson_mx_ao_arc_rproc_ops, fw_name,
+				 sizeof(*priv));
+	if (!rproc)
+		return -ENOMEM;
+
+	rproc->has_iommu = false;
+	priv = rproc->priv;
+
+	priv->sram_pool = of_gen_pool_get(dev->of_node, "sram", 0);
+	if (!priv->sram_pool) {
+		dev_err(dev, "Could not get SRAM pool\n");
+		return -ENODEV;
+	}
+
+	priv->sram_size = gen_pool_avail(priv->sram_pool);
+
+	priv->sram_va = gen_pool_alloc(priv->sram_pool, priv->sram_size);
+	if (!priv->sram_va) {
+		dev_err(dev, "Could not alloc memory in SRAM pool\n");
+		return -ENOMEM;
+	}
+
+	priv->sram_pa = gen_pool_virt_to_phys(priv->sram_pool, priv->sram_va);
+	if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
+		dev_err(dev, "SRAM address contains unusable bits\n");
+		ret = -EINVAL;
+		goto err_free_genpool;
+	}
+
+	priv->secbus2_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+							       "amlogic,secbus2");
+	if (IS_ERR(priv->secbus2_regmap)) {
+		dev_err(dev, "Failed to find SECBUS2 regmap\n");
+		ret = PTR_ERR(priv->secbus2_regmap);
+		goto err_free_genpool;
+	}
+
+	priv->remap_base = devm_platform_ioremap_resource_byname(pdev, "remap");
+	if (IS_ERR(priv->remap_base)) {
+		ret = PTR_ERR(priv->remap_base);
+		goto err_free_genpool;
+	}
+
+	priv->cpu_base = devm_platform_ioremap_resource_byname(pdev, "cpu");
+	if (IS_ERR(priv->cpu_base)) {
+		ret = PTR_ERR(priv->cpu_base);
+		goto err_free_genpool;
+	}
+
+	priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->arc_reset)) {
+		dev_err(dev, "Failed to get ARC reset\n");
+		ret = PTR_ERR(priv->arc_reset);
+		goto err_free_genpool;
+	}
+
+	priv->arc_pclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->arc_pclk)) {
+		dev_err(dev, "Failed to get the ARC PCLK\n");
+		ret = PTR_ERR(priv->arc_pclk);
+		goto err_free_genpool;
+	}
+
+	platform_set_drvdata(pdev, rproc);
+
+	ret = rproc_add(rproc);
+	if (ret)
+		goto err_free_genpool;
+
+	return 0;
+
+err_free_genpool:
+	gen_pool_free(priv->sram_pool, priv->sram_va, priv->sram_size);
+	return ret;
+}
+
+static int meson_mx_ao_arc_rproc_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
+
+	rproc_del(rproc);
+	gen_pool_free(priv->sram_pool, priv->sram_va, priv->sram_size);
+
+	return 0;
+}
+
+static const struct of_device_id meson_mx_ao_arc_rproc_match[] = {
+	{ .compatible = "amlogic,meson8-ao-arc" },
+	{ .compatible = "amlogic,meson8b-ao-arc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, meson_mx_ao_arc_rproc_match);
+
+static struct platform_driver meson_mx_ao_arc_rproc_driver = {
+	.probe = meson_mx_ao_arc_rproc_probe,
+	.remove = meson_mx_ao_arc_rproc_remove,
+	.driver = {
+		.name = "meson-mx-ao-arc-rproc",
+		.of_match_table = meson_mx_ao_arc_rproc_match,
+	},
+};
+module_platform_driver(meson_mx_ao_arc_rproc_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson6/8/8b/8m2 AO ARC remote processor driver");
+MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

