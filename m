Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FE6C4320A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Aug 2021 18:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D656101B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Aug 2021 18:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238716AbhH3SV5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Aug 2021 14:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbhH3SVy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Aug 2021 14:21:54 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7D9C0612AB
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Aug 2021 11:19:49 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so430251pjb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Aug 2021 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OZntfKTz9w4JWf2SZBFU60nUehZL+TtKeGrqLggc/48=;
        b=rtTWnvOxh3M1eXigZZOdaCQoXtG16RMWjOxodVBkc3YRRGhWyjUxGpzEAo2hKIRG4S
         bCKPxb+kFXCaxG0Lwy1cQI1eI6E+8N3G1DRHCBKL2+VlXpaYKhb73037N6JGKxi2DEWe
         YaXYo79NKuhVLVPB/zWxNK92Fq4M0/Fwny6oEUsaDesXRcEaQgr0LcF3U+BDv33Yvb4y
         pR8wjyoCOKxsn8hZeRTyh85sTxG/N6IXJb8Wwxe1UOOsIao/uzSZ9Tbe9SumHGMNhFkb
         sXd2L6IkXs1F8bs0WGhAQ69HZqRnMavx+4OGRyl4DVTsdY5uVx+OtcVIfElLFGhB8fnS
         OTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OZntfKTz9w4JWf2SZBFU60nUehZL+TtKeGrqLggc/48=;
        b=iYS6Bk/RGOxj6vt0UDK3uBscjJCJ+fqJ3aiNy45LfRR/oMnwEAliAXxpUwZb6MA9Xb
         PjOFxnIQC6SUUSw+ec2w88z5CB8NAg5804NJio+h1dv6F/464MH8I+dSdR0n8+jW+W9e
         I/gIMGpCHQuD9SvLfHP/Fasae7MEAJYPmcTK6VyMMAWhour1jQK4O9ubi6KFqYtpPdVy
         HrWJ3NTR8xsUOtVOOdzApcYF7Bn1eylT6j+w7arxFE1e0d6nQIzv8uQRzIT7iWh6gBGO
         GyZsakEkRpfg2MucIe3iRa7ULc2iwXfQmasinOCWvuoaMggIE/G9pGau9i7NKKi+7E5D
         NwGQ==
X-Gm-Message-State: AOAM53129FXUTIEoMR9GjR3qgu0X4/XqfowT/crWKfSWSim7aiCBxcx1
        gh/jN+H3K3/TQVeXYvR2jFIYGA==
X-Google-Smtp-Source: ABdhPJxiXXjDfR6tWFoYaoBtMatlhHtxLMUFSLPK1s3n1lD8kspoWH7+qSBJ+2rO8IqFZ4IAaSN/Dg==
X-Received: by 2002:a17:90a:8808:: with SMTP id s8mr438505pjn.214.1630347589047;
        Mon, 30 Aug 2021 11:19:49 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k4sm14507908pga.92.2021.08.30.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:19:47 -0700 (PDT)
Date:   Mon, 30 Aug 2021 12:19:45 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com,
        khilman@baylibre.com
Subject: Re: [PATCH v3 2/4] remoteproc: Add a remoteproc driver for the
 MT8183's APU
Message-ID: <20210830181945.GA934785@p14s>
References: <20210819151340.741565-1-abailon@baylibre.com>
 <20210819151340.741565-3-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819151340.741565-3-abailon@baylibre.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Alex,

On Thu, Aug 19, 2021 at 05:13:38PM +0200, Alexandre Bailon wrote:
> This adds a driver to control the APU present in the MT8183.
> This loads the firmware and start the DSP.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/remoteproc/Kconfig   |  10 +
>  drivers/remoteproc/Makefile  |   1 +
>  drivers/remoteproc/mtk_apu.c | 440 +++++++++++++++++++++++++++++++++++
>  3 files changed, 451 insertions(+)
>  create mode 100644 drivers/remoteproc/mtk_apu.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9a6eedc3994a5..6c106a6c3ad5d 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -53,6 +53,16 @@ config MTK_SCP
>  
>  	  It's safe to say N here.
>  
> +config MTK_APU
> +	tristate "Mediatek APU remoteproc support"
> +	depends on ARCH_MEDIATEK
> +	depends on MTK_IOMMU
> +	help
> +	  Say y to support the Mediatek's Accelerated Processing Unit (APU) via

In the bindings A in APU is for AI or Vision whereas above it is for
accelerated.  Please pick one and stick with it.

> +	  the remote processor framework.
> +
> +	  It's safe to say N here.
> +
>  config OMAP_REMOTEPROC
>  	tristate "OMAP remoteproc support"
>  	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index bb26c9e4ef9cf..e395af86c17b0 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>  obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> +obj-$(CONFIG_MTK_APU)			+= mtk_apu.o
>  obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>  obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>  obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
> diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
> new file mode 100644
> index 0000000000000..0e3f63987bd85
> --- /dev/null
> +++ b/drivers/remoteproc/mtk_apu.c
> @@ -0,0 +1,440 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 BayLibre SAS
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define SW_RST					(0x0000000C)
> +#define SW_RST_OCD_HALT_ON_RST			BIT(12)
> +#define SW_RST_IPU_D_RST			BIT(8)
> +#define SW_RST_IPU_B_RST			BIT(4)
> +#define CORE_CTRL				(0x00000110)
> +#define CORE_CTRL_PDEBUG_ENABLE			BIT(31)
> +#define CORE_CTRL_SRAM_64K_iMEM			(0x00 << 27)
> +#define CORE_CTRL_SRAM_96K_iMEM			(0x01 << 27)
> +#define CORE_CTRL_SRAM_128K_iMEM		(0x02 << 27)
> +#define CORE_CTRL_SRAM_192K_iMEM		(0x03 << 27)
> +#define CORE_CTRL_SRAM_256K_iMEM		(0x04 << 27)
> +#define CORE_CTRL_PBCLK_ENABLE			BIT(26)
> +#define CORE_CTRL_RUN_STALL			BIT(23)
> +#define CORE_CTRL_STATE_VECTOR_SELECT		BIT(19)
> +#define CORE_CTRL_PIF_GATED			BIT(17)
> +#define CORE_CTRL_NMI				BIT(0)
> +#define CORE_XTENSA_INT				(0x00000114)
> +#define CORE_CTL_XTENSA_INT			(0x00000118)
> +#define CORE_DEFAULT0				(0x0000013C)
> +#define CORE_DEFAULT0_QOS_SWAP_0		(0x00 << 28)
> +#define CORE_DEFAULT0_QOS_SWAP_1		(0x01 << 28)
> +#define CORE_DEFAULT0_QOS_SWAP_2		(0x02 << 28)
> +#define CORE_DEFAULT0_QOS_SWAP_3		(0x03 << 28)
> +#define CORE_DEFAULT0_ARUSER_USE_IOMMU		(0x10 << 23)
> +#define CORE_DEFAULT0_AWUSER_USE_IOMMU		(0x10 << 18)
> +#define CORE_DEFAULT1				(0x00000140)
> +#define CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
> +#define CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
> +#define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
> +
> +#define RSC_VENDOR_CARVEOUT			(RSC_VENDOR_START + 1)
> +
> +#define APU_RESET_DELAY				(27)
> +
> +struct mtk_apu_rproc {
> +	struct device *dev;
> +	void __iomem *base;
> +	int irq;
> +	struct clk_bulk_data clks[3];
> +	struct list_head mappings;
> +};
> +
> +static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct rproc_mem_entry *mapping;
> +	struct iommu_domain *domain;
> +	int ret;
> +	u64 pa;
> +
> +	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
> +	if (!mapping)
> +		return -ENOMEM;
> +
> +	if (!entry->va)
> +		pa = entry->dma;
> +	else
> +		pa = rproc_va_to_pa(entry->va);
> +
> +	if ((strcmp(entry->name, "vdev0vring0") == 0 ||
> +		strcmp(entry->name, "vdev0vring1") == 0)) {

If my guesswork is correct (see below) the above is required to deal with
multiple remote processors.  Why not just look for "vring0" and "vring1"?.  That
way we wouldn't have to keep the "vdev0" part for carveouts that really are
"vdev1". 

> +		entry->va = memremap(entry->dma, entry->len, MEMREMAP_WC);
> +		if (IS_ERR_OR_NULL(entry->va)) {
> +			dev_err(dev, "Unable to map memory region: %pa+%lx\n",
> +				&entry->dma, entry->len);
> +			ret = PTR_ERR(mapping->va);
> +			goto free_mapping;
> +		}
> +		mapping->va = entry->va;
> +	}
> +
> +	domain = iommu_get_domain_for_dev(dev);

Here @domain can be NULL

> +	ret = iommu_map(domain, entry->da, pa, entry->len, entry->flags);

... and iommu_map() isn't dealing with that condition properly.  Please
check for a NULL condition before proceeding.

> +	if (ret) {
> +		dev_err(dev, "iommu_map failed: %d\n", ret);
> +		goto err_memunmap;
> +	}
> +
> +	mapping->da = entry->da;
> +	mapping->len = entry->len;
> +	list_add_tail(&mapping->node, &apu_rproc->mappings);
> +
> +	return 0;
> +
> +err_memunmap:
> +	memunmap(mapping->va);
> +free_mapping:
> +	kfree(mapping);
> +
> +	return ret;
> +}
> +
> +static void mtk_apu_iommu_unmap_all(struct rproc *rproc)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct rproc_mem_entry *entry, *tmp;
> +	struct iommu_domain *domain;
> +
> +	/* clean up iommu mapping entries */
> +	list_for_each_entry_safe(entry, tmp, &apu_rproc->mappings, node) {
> +		size_t unmapped;
> +
> +		domain = iommu_get_domain_for_dev(dev);
> +		unmapped = iommu_unmap(domain, entry->da, entry->len);

Same as above

> +		if (unmapped != entry->len) {
> +			/* nothing much to do besides complaining */
> +			dev_err(dev, "failed to unmap %zx/%zu\n", entry->len,
> +				unmapped);
> +		}
> +		memunmap(entry->va);
> +
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +}
> +
> +static int mtk_apu_rproc_prepare(struct rproc *rproc)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(apu_rproc->clks),
> +				      apu_rproc->clks);
> +	if (ret)
> +		dev_err(apu_rproc->dev, "Failed to enable clocks\n");
> +
> +	return ret;
> +}
> +
> +static int mtk_apu_rproc_unprepare(struct rproc *rproc)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(apu_rproc->clks),
> +				   apu_rproc->clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_apu_rproc_start(struct rproc *rproc)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +	u32 core_ctrl;
> +
> +	/* Set reset vector of APU firmware boot address */
> +	writel(rproc->bootaddr, apu_rproc->base + CORE_XTENSA_ALTRESETVEC);
> +
> +	/* Turn on the clocks and stall the APU */
> +	core_ctrl = readl(apu_rproc->base + CORE_CTRL);
> +	core_ctrl |= CORE_CTRL_PDEBUG_ENABLE | CORE_CTRL_PBCLK_ENABLE |
> +		     CORE_CTRL_STATE_VECTOR_SELECT | CORE_CTRL_RUN_STALL |
> +		     CORE_CTRL_PIF_GATED;
> +	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
> +
> +	/* Reset the APU: this requires 27 ns to be effective on any platform */
> +	writel(SW_RST_OCD_HALT_ON_RST | SW_RST_IPU_B_RST | SW_RST_IPU_D_RST,
> +		apu_rproc->base + SW_RST);
> +	ndelay(APU_RESET_DELAY);
> +	writel(0, apu_rproc->base + SW_RST);
> +
> +	core_ctrl &= ~CORE_CTRL_PIF_GATED;
> +	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
> +
> +	/* Configure memory accesses to go through the IOMMU */
> +	writel(CORE_DEFAULT0_AWUSER_USE_IOMMU | CORE_DEFAULT0_ARUSER_USE_IOMMU |
> +	      CORE_DEFAULT0_QOS_SWAP_1, apu_rproc->base + CORE_DEFAULT0);
> +	writel(CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU |
> +		CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU,
> +		apu_rproc->base + CORE_DEFAULT1);
> +
> +	/* Release the APU */
> +	core_ctrl &= ~CORE_CTRL_RUN_STALL;
> +	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
> +
> +	return 0;
> +}
> +
> +static int mtk_apu_rproc_stop(struct rproc *rproc)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +	u32 core_ctrl;
> +
> +	core_ctrl = readl(apu_rproc->base + CORE_CTRL);
> +	writel(core_ctrl | CORE_CTRL_RUN_STALL, apu_rproc->base + CORE_CTRL);
> +
> +	mtk_apu_iommu_unmap_all(rproc);
> +
> +	return 0;
> +}
> +
> +static void mtk_apu_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> +
> +	writel(1 << vqid, apu_rproc->base + CORE_CTL_XTENSA_INT);
> +}
> +
> +static int mtk_apu_load(struct rproc *rproc, const struct firmware *fw)
> +
> +{
> +	struct rproc_mem_entry *entry, *tmp;
> +	int ret;
> +
> +	ret = rproc_elf_load_segments(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
> +		ret = mtk_apu_iommu_map(rproc, entry);
> +		if (ret)
> +			goto err_unmap_all;
> +	}
> +
> +	return 0;
> +
> +err_unmap_all:
> +	mtk_apu_iommu_unmap_all(rproc);
> +
> +	return ret;
> +}
> +
> +static struct reserved_mem *of_reserved_mem_by_name(struct rproc *rproc,
> +						    const char *name)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *target;
> +	struct reserved_mem *rmem;
> +	int idx;
> +
> +	idx = of_property_match_string(np, "memory-region-names", name);
> +	if (idx < 0) {
> +		dev_err(dev, "failed to find %s memory\n", name);
> +		return NULL;
> +	}
> +
> +	target = of_parse_phandle(np, "memory-region", idx);
> +	if (!target)
> +		return NULL;

There is no comment to explain the above gymnastic and as such I have to guess
the firmware resources always have "vdev0" prepended to buffer, vring0 and
vring1.  If I am correct please add a comment to describe the situation, ditto
if I am not correct.

> +
> +	rmem = of_reserved_mem_lookup(target);
> +	if (!rmem)
> +		dev_err(dev, "unable to acquire memory-region\n");
> +	of_node_put(target);
> +
> +	return rmem;
> +}
> +
> +static int mtk_apu_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> +			      int offset, int avail)
> +{
> +	struct device *dev = rproc->dev.parent;
> +
> +	if (rsc_type == RSC_VENDOR_CARVEOUT) {
> +		struct fw_rsc_carveout *rsc_carveout = rsc;
> +		struct rproc_mem_entry *mem;
> +		struct reserved_mem *rmem;
> +
> +		rmem = of_reserved_mem_by_name(rproc, rsc_carveout->name);

s/of_reserved_mem_by_name/mtk_of_reserved_mem_by_name

> +		if (!rmem)
> +			return -ENOMEM;
> +
> +		if (rmem->size < rsc_carveout->len) {

I think '!=' would be more appropriate than '<'.  

> +			dev_err(dev, "The reserved memory is too small\n");
> +			return -ENOMEM;
> +		}
> +
> +		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)rmem->base,
> +					   rsc_carveout->len, rsc_carveout->da,
> +					   NULL, NULL, rsc_carveout->name);

Why not naming the carveout the way it is in the DT rather than keeping with
what's in the firmware image?

> +		if (!mem)
> +			return -ENOMEM;
> +
> +		mem->flags = rsc_carveout->flags;
> +		rsc_carveout->pa = rmem->base;
> +		rproc_add_carveout(rproc, mem);
> +	}
> +
> +	return RSC_HANDLED;
> +}
> +
> +static const struct rproc_ops mtk_apu_rproc_ops = {
> +	.prepare		= mtk_apu_rproc_prepare,
> +	.unprepare		= mtk_apu_rproc_unprepare,
> +	.start			= mtk_apu_rproc_start,
> +	.stop			= mtk_apu_rproc_stop,
> +	.kick			= mtk_apu_rproc_kick,
> +	.load			= mtk_apu_load,
> +	.parse_fw		= rproc_elf_load_rsc_table,
> +	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
> +	.sanity_check		= rproc_elf_sanity_check,
> +	.get_boot_addr		= rproc_elf_get_boot_addr,
> +	.handle_rsc		= mtk_apu_handle_rsc,
> +};
> +
> +static irqreturn_t mtk_apu_rproc_callback(int irq, void *data)
> +{
> +	struct rproc *rproc = data;
> +	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
> +
> +	writel(1, apu_rproc->base + CORE_XTENSA_INT);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t handle_event(int irq, void *data)
> +{
> +	struct rproc *rproc = data;
> +
> +	rproc_vq_interrupt(rproc, 0);
> +	rproc_vq_interrupt(rproc, 1);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_apu_rproc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_apu_rproc *apu_rproc;
> +	struct rproc *rproc;
> +	struct resource *res;
> +	int ret;
> +
> +	rproc = rproc_alloc(dev, dev_name(dev), &mtk_apu_rproc_ops, NULL,
> +			    sizeof(*apu_rproc));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	rproc->recovery_disabled = true;
> +	rproc->has_iommu = false;
> +	rproc->auto_boot = false;
> +
> +	apu_rproc = rproc->priv;
> +	apu_rproc->dev = dev;
> +	INIT_LIST_HEAD(&apu_rproc->mappings);
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	apu_rproc->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(apu_rproc->base)) {
> +		dev_err(dev, "Failed to map mmio\n");
> +		ret = PTR_ERR(apu_rproc->base);
> +		goto free_rproc;
> +	}
> +
> +	apu_rproc->irq = platform_get_irq(pdev, 0);
> +	if (apu_rproc->irq < 0) {
> +		ret = apu_rproc->irq;
> +		goto free_rproc;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, apu_rproc->irq,
> +					mtk_apu_rproc_callback, handle_event,
> +					IRQF_SHARED | IRQF_ONESHOT,
> +					NULL, rproc);

I'm pretty sure I commented on that during my last review - is there a need to
do a threaded irq here?  As far as I can tell there is no advantage in doing so
in this context.  Please add a comment to justify using a threaded irq.

Thanks,
Mathieu

> +	if (ret) {
> +		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
> +		goto free_rproc;
> +	}
> +
> +	apu_rproc->clks[0].id = "ipu";
> +	apu_rproc->clks[1].id = "axi";
> +	apu_rproc->clks[2].id = "jtag";
> +
> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(apu_rproc->clks),
> +				apu_rproc->clks);
> +	if (ret) {
> +		dev_err(dev, "Failed to get clocks\n");
> +		goto free_rproc;
> +	}
> +
> +	ret = rproc_add(rproc);
> +	if (ret) {
> +		dev_err(dev, "rproc_add failed: %d\n", ret);
> +		goto free_rproc;
> +	}
> +
> +	return 0;
> +
> +free_rproc:
> +	rproc_free(rproc);
> +
> +	return ret;
> +}
> +
> +static int mtk_apu_rproc_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
> +	struct device *dev = &pdev->dev;
> +
> +	disable_irq(apu_rproc->irq);
> +
> +	rproc_del(rproc);
> +	of_reserved_mem_device_release(dev);
> +	rproc_free(rproc);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_apu_rproc_of_match[] = {
> +	{ .compatible = "mediatek,mt8183-apu", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_apu_rproc_of_match);
> +
> +static struct platform_driver mtk_apu_rproc_driver = {
> +	.probe = mtk_apu_rproc_probe,
> +	.remove = mtk_apu_rproc_remove,
> +	.driver = {
> +		.name = "mtk_apu-rproc",
> +		.of_match_table = of_match_ptr(mtk_apu_rproc_of_match),
> +	},
> +};
> +module_platform_driver(mtk_apu_rproc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Alexandre Bailon");
> +MODULE_DESCRIPTION("MTK APU Remote Processor control driver");
> -- 
> 2.31.1
> 
