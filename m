Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3C6C07E95
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 08:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9729C61208
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 08:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhGTINM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Jul 2021 04:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234394AbhGTIGd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Jul 2021 04:06:33 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D410C061767
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 01:46:08 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so1555936wmc.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sfnB6pEXfoigvkI+81/RrVPdT9Ty3Lcn3N9ErXDBwX0=;
        b=RGuET55vDuE2nzwz1lXE4fGZZb8Pcy27Ybk+IR1rLdiQX5ghY1CU9nVJRsikmW3RIT
         RXc7NPXx9mx/JrJMj2PUjBVNw4X1SXi8a6ybZ7GqMZp3amfgTCFB0eo6pC1E56H+iFLp
         eyDdCrmLYJd2nzpyTuon3zLzzAByZokdin4zWZHrQBF8Hgyq4cSbLXm4gDUfvBqDfdy5
         bhmr9//nwCI8h4vMD/M35gIkTQ4VdxnvsZ89q5WA1W76UOnRLwNgXOT8jGwxyKPleKDd
         eLKbJ6TpDGNMu1pENi3/+JVaYvfTZvKl+oxUkjLbDq8idm6WERtRR4m9lLXD+dAIo3Cg
         L30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sfnB6pEXfoigvkI+81/RrVPdT9Ty3Lcn3N9ErXDBwX0=;
        b=m0ORPJqbEpg9/PGJUKdrBqkEqvItDSkUWYiyXQaqAM70HXqps6CM98V57wQFJoVkym
         OIuIpXyDivQMCztM74ngjxTeSELc5P2CEwhSlDm6w5JItBk0owA4CVpWaH7CZ20JF53H
         iq2E/z9CwCt4YnBzanxgxgk99hyalmtQiib9sCShGV0S03xTc/juXHG0mhZNvuC/eWle
         0WS8Qg3nombpgkQk4gPjoj6XbCOMXiOQ8Fu7DgU7F3kH/ZNG7qjS8gpJcnGzWUNhCAeZ
         S29mN2zVifuKVhNlq7GWIbl2yKYMxxdGgucuu2gmmUVTOzEDXQP1mxR2x+lVwq7qlS+m
         mGpg==
X-Gm-Message-State: AOAM5322MJjnMSxnKK/FA/hWmdCDMqqQF/J0iNLMzbDswMkrMfY3Mt73
        uPNL6EE3IBv3+4kMiJCpW8mqtA==
X-Google-Smtp-Source: ABdhPJwIYw5ttbPqKjD+YOlc7V1LBRa4PNSFy7pfGuMZWU+YqytnaSW5a5r3TbwdGhLLEk9Sh+JhRw==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr34897190wml.17.1626770767138;
        Tue, 20 Jul 2021 01:46:07 -0700 (PDT)
Received: from [10.1.4.104] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g18sm18851572wmk.37.2021.07.20.01.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 01:46:06 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] remoteproc: Add a remoteproc driver for the
 MT8183's APU
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-3-abailon@baylibre.com> <20200929175214.GB124290@xps15>
From:   Alexandre Bailon <abailon@baylibre.com>
Message-ID: <59553610-3d88-7982-2a10-dec27d9c3fce@baylibre.com>
Date:   Tue, 20 Jul 2021 10:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20200929175214.GB124290@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,
> Hi Alexandre,
>
> On Thu, Sep 10, 2020 at 03:01:46PM +0200, Alexandre Bailon wrote:
>> This adds a driver to control the APU present in the MT8183.
>> This loads the firmware and start the DSP.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> ---
>>   drivers/remoteproc/Kconfig   |  10 ++
>>   drivers/remoteproc/Makefile  |   1 +
>>   drivers/remoteproc/mtk_apu.c | 288 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 299 insertions(+)
>>   create mode 100644 drivers/remoteproc/mtk_apu.c
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index c6659dfea7c7..4ebea57bf4c8 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -51,6 +51,16 @@ config MTK_SCP
>>   
>>   	  It's safe to say N here.
>>   
>> +config MTK_APU
>> +	tristate "Mediatek APU remoteproc support"
>> +	depends on ARCH_MEDIATEK
>> +	depends on MTK_IOMMU
>> +	help
>> +	  Say y to support the Mediatek's Accelerated Processing Unit (APU) via
>> +	  the remote processor framework.
>> +
>> +	  It's safe to say N here.
>> +
>>   config OMAP_REMOTEPROC
>>   	tristate "OMAP remoteproc support"
>>   	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 3dfa28e6c701..174644f38fda 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>>   obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>>   obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>>   obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
>> +obj-$(CONFIG_MTK_APU)			+= mtk_apu.o
>>   obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>>   obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>>   obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
>> diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
>> new file mode 100644
>> index 000000000000..6d2f577cfde5
>> --- /dev/null
>> +++ b/drivers/remoteproc/mtk_apu.c
>> @@ -0,0 +1,288 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2020 BayLibre SAS
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/highmem.h>
> Not sure what this is for
>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iommu.h>
>> +#include <linux/irq.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/remoteproc.h>
>> +
>> +#include "remoteproc_internal.h"
>> +
>> +/* From MT8183 4.5 Vision Processor Unit (VPU).pdf datasheet */
>> +#define SW_RST					(0x0000000C)
>> +#define SW_RST_OCD_HALT_ON_RST			BIT(12)
>> +#define SW_RST_IPU_D_RST			BIT(8)
>> +#define SW_RST_IPU_B_RST			BIT(4)
>> +#define CORE_CTRL				(0x00000110)
>> +#define CORE_CTRL_PDEBUG_ENABLE			BIT(31)
>> +#define CORE_CTRL_SRAM_64K_iMEM			(0x00 << 27)
>> +#define CORE_CTRL_SRAM_96K_iMEM			(0x01 << 27)
>> +#define CORE_CTRL_SRAM_128K_iMEM		(0x02 << 27)
>> +#define CORE_CTRL_SRAM_192K_iMEM		(0x03 << 27)
>> +#define CORE_CTRL_SRAM_256K_iMEM		(0x04 << 27)
>> +#define CORE_CTRL_PBCLK_ENABLE			BIT(26)
>> +#define CORE_CTRL_RUN_STALL			BIT(23)
>> +#define CORE_CTRL_STATE_VECTOR_SELECT		BIT(19)
>> +#define CORE_CTRL_PIF_GATED			BIT(17)
>> +#define CORE_CTRL_NMI				BIT(0)
>> +#define CORE_XTENSA_INT				(0x00000114)
>> +#define CORE_CTL_XTENSA_INT			(0x00000118)
>> +#define CORE_DEFAULT0				(0x0000013C)
>> +#define CORE_DEFAULT0_QOS_SWAP_0		(0x00 << 28)
>> +#define CORE_DEFAULT0_QOS_SWAP_1		(0x01 << 28)
>> +#define CORE_DEFAULT0_QOS_SWAP_2		(0x02 << 28)
>> +#define CORE_DEFAULT0_QOS_SWAP_3		(0x03 << 28)
>> +#define CORE_DEFAULT0_ARUSER_USE_IOMMU		(0x10 << 23)
>> +#define CORE_DEFAULT0_AWUSER_USE_IOMMU		(0x10 << 18)
>> +#define CORE_DEFAULT1				(0x00000140)
>> +#define CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
>> +#define CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
>> +#define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
>> +
>> +struct mtk_apu_rproc {
>> +	struct device *dev;
>> +	struct rproc *rproc;
> As far as I can tell @rproc is only used in apu_jtag_probe(), but it could just
> as easily be given as a parameter to the function instead of bloating the
> structure.
>
>> +
> Extra line
>
>> +	void __iomem *base;
>> +	int irq;
>> +	struct clk_bulk_data clks[3];
>> +};
>> +
>> +static int mtk_apu_rproc_prepare(struct rproc *rproc)
>> +{
>> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(apu_rproc->clks),
>> +				      apu_rproc->clks);
>> +	if (ret)
>> +		dev_err(apu_rproc->dev, "Failed to enable clocks\n");
>> +
>> +	return ret;
>> +}
>> +
>> +static int mtk_apu_rproc_unprepare(struct rproc *rproc)
>> +{
>> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
>> +
>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(apu_rproc->clks),
>> +				   apu_rproc->clks);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mtk_apu_rproc_start(struct rproc *rproc)
>> +{
>> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
>> +	u32 core_ctrl;
>> +
>> +	/* Set reset vector of APU firmware boot address */
>> +	writel(rproc->bootaddr, apu_rproc->base + CORE_XTENSA_ALTRESETVEC);
>> +
>> +	/* Turn on the clocks and stall the APU */
>> +	core_ctrl = readl(apu_rproc->base + CORE_CTRL);
>> +	core_ctrl |= CORE_CTRL_PDEBUG_ENABLE | CORE_CTRL_PBCLK_ENABLE |
>> +		     CORE_CTRL_STATE_VECTOR_SELECT | CORE_CTRL_RUN_STALL |
>> +		     CORE_CTRL_PIF_GATED;
>> +	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
>> +
>> +	/* Reset the APU */
>> +	writel(SW_RST_OCD_HALT_ON_RST | SW_RST_IPU_B_RST | SW_RST_IPU_D_RST,
>> +		apu_rproc->base + SW_RST);
>> +	ndelay(27);
> What is this for and why 27 nanosecond precicely?  Is this a board specific
> setting?  Are we sure it is the same value on all platform with a MT8183?
>
> Matthias, what is your take on this?
I have got the response recently from the HW team and this 27 nanosecond 
delay
is the minimum delay required to reset the APU, and that should work at 
any frequency.
This delay is supposed to work for the mt8183 but also for the other 
platform
including an APU.

The HW also confirmed that there are no way to know if the reset has 
been completed
or not so we must way that delay.

Maybe I should create a define instead of using directly 27 here, and 
also add some documentation
to explain why we need this delay.

What do you think about it ?
>
>> +	writel(0, apu_rproc->base + SW_RST);
>> +
>> +	core_ctrl &= ~CORE_CTRL_PIF_GATED;
>> +	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
>> +
>> +	/* Configure memory accesses to go through the IOMMU */
>> +	writel(CORE_DEFAULT0_AWUSER_USE_IOMMU | CORE_DEFAULT0_ARUSER_USE_IOMMU |
>> +	      CORE_DEFAULT0_QOS_SWAP_1, apu_rproc->base + CORE_DEFAULT0);
>> +	writel(CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU |
>> +		CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU,
>> +		apu_rproc->base + CORE_DEFAULT1);
>> +
>> +	/* Release the APU */
>> +	core_ctrl &= ~CORE_CTRL_RUN_STALL;
>> +	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mtk_apu_rproc_stop(struct rproc *rproc)
>> +{
>> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
>> +	u32 core_ctrl;
>> +
>> +	core_ctrl = readl(apu_rproc->base + CORE_CTRL);
>> +	writel(core_ctrl | CORE_CTRL_RUN_STALL, apu_rproc->base + CORE_CTRL);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mtk_apu_rproc_kick(struct rproc *rproc, int vqid)
>> +{
>> +	struct mtk_apu_rproc *apu_rproc = rproc->priv;
>> +
>> +	writel(1 << vqid, apu_rproc->base + CORE_CTL_XTENSA_INT);
>> +}
>> +
>> +static const struct rproc_ops mtk_apu_rproc_ops = {
>> +	.prepare	= mtk_apu_rproc_prepare,
>> +	.unprepare	= mtk_apu_rproc_unprepare,
>> +	.start		= mtk_apu_rproc_start,
>> +	.stop		= mtk_apu_rproc_stop,
>> +	.kick		= mtk_apu_rproc_kick,
>> +};
>> +
>> +static irqreturn_t mtk_apu_rproc_callback(int irq, void *data)
>> +{
>> +	struct rproc *rproc = data;
>> +	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
>> +
>> +	writel(1, apu_rproc->base + CORE_XTENSA_INT);
>> +
>> +	return IRQ_WAKE_THREAD;
>> +}
>> +
>> +static irqreturn_t handle_event(int irq, void *data)
>> +{
>> +	struct rproc *rproc = data;
>> +
>> +	rproc_vq_interrupt(rproc, 0);
>> +	rproc_vq_interrupt(rproc, 1);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int mtk_apu_rproc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct mtk_apu_rproc *apu_rproc;
>> +	struct rproc *rproc;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	rproc = rproc_alloc(dev, dev_name(dev), &mtk_apu_rproc_ops, NULL,
>> +			    sizeof(*apu_rproc));
>> +	if (!rproc)
>> +		return -ENOMEM;
>> +
>> +	rproc->recovery_disabled = true;
>> +	rproc->has_iommu = false;
>> +
>> +	apu_rproc = rproc->priv;
>> +	apu_rproc->rproc = rproc;
>> +	apu_rproc->dev = dev;
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	rproc->domain = iommu_get_domain_for_dev(dev);
> Any reason why iommu_get_domain_for_dev() is explicitly called rather than
> setting ->has_iommu to true and let the remoteproc core get the domain for
> you?

If I set ->has_iommu to true, the remoteproc framework will try to get a 
unmanaged domain
which is actually not supported by the iommu driver.
I don't like that solution but when I sent this patch, it was the only 
solution I had to make it work.

Now, I have to options:
- I update the iommu driver to support unmanaged domain
   (I made a PoC and this works but I am not sure that I made it correctly)
- I don't let the remoteproc framework manage the iommu 
(has_iommu=false, and domain=NULL)
   and I manage the iommu in this driver.
I have chosen the second options the v3 because this also make easier to 
manage some hardware
constraint.

Best Regards,
Alexandre

>
>> +	if (!rproc->domain) {
>> +		dev_err(dev, "Failed to get the IOMMU domain\n");
>> +		ret = -EINVAL;
>> +		goto free_rproc;
>> +	}
>> +
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	apu_rproc->base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(apu_rproc->base)) {
>> +		dev_err(dev, "Failed to map mmio\n");
>> +		ret = PTR_ERR(apu_rproc->base);
>> +		goto free_rproc;
>> +	}
>> +
>> +	apu_rproc->irq = platform_get_irq(pdev, 0);
>> +	if (apu_rproc->irq < 0) {
>> +		ret = apu_rproc->irq;
>> +		goto free_rproc;
>> +	}
>> +
>> +	ret = devm_request_threaded_irq(dev, apu_rproc->irq,
>> +					mtk_apu_rproc_callback, handle_event,
>> +					IRQF_SHARED | IRQF_ONESHOT,
>> +					NULL, rproc);
>> +	if (ret) {
>> +		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
>> +		goto free_rproc;
>> +	}
>> +
>> +	apu_rproc->clks[0].id = "ipu";
>> +	apu_rproc->clks[1].id = "axi";
>> +	apu_rproc->clks[1].id = "jtag";
>> +
>> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(apu_rproc->clks),
>> +				apu_rproc->clks);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to get clocks\n");
>> +		goto free_rproc;
>> +	}
>> +
>> +	ret = of_reserved_mem_device_init(dev);
>> +	if (ret) {
>> +		dev_err(dev, "device does not have specific CMA pool\n");
>> +		goto free_rproc;
>> +	}
>> +
>> +	ret = rproc_add(rproc);
>> +	if (ret) {
>> +		dev_err(dev, "rproc_add failed: %d\n", ret);
>> +		goto free_mem;
>> +	}
>> +
>> +	return 0;
>> +
>> +free_mem:
>> +	of_reserved_mem_device_release(dev);
>> +free_rproc:
>> +	rproc_free(rproc);
>> +
>> +	return ret;
>> +}
>> +
>> +static int mtk_apu_rproc_remove(struct platform_device *pdev)
>> +{
>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>> +	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
>> +	struct device *dev = &pdev->dev;
>> +
>> +	disable_irq(apu_rproc->irq);
>> +
>> +	rproc_del(rproc);
>> +	of_reserved_mem_device_release(dev);
>> +	rproc_free(rproc);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id mtk_apu_rproc_of_match[] = {
>> +	{ .compatible = "mediatek,mt8183-apu", },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, mtk_apu_rproc_of_match);
>> +
>> +static struct platform_driver mtk_apu_rproc_driver = {
>> +	.probe = mtk_apu_rproc_probe,
>> +	.remove = mtk_apu_rproc_remove,
>> +	.driver = {
>> +		.name = "mtk_apu-rproc",
>> +		.of_match_table = of_match_ptr(mtk_apu_rproc_of_match),
>> +	},
>> +};
>> +module_platform_driver(mtk_apu_rproc_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Alexandre Bailon");
>> +MODULE_DESCRIPTION("MTK APU Remote Processor control driver");
>> -- 
>> 2.26.2
>>
