Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3AD2E2DF2
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 16:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096796; cv=none; b=dUoFKLO6MEhMOo1qEu7IL/Jv7qBE0BjnYiPxpYRSS6HIyGkTWswEwrWK7W0a+P0UMT2bGXQsiFx22UkX4aIu9FwXgqM0YD1aHdXGH9Xl/ctCq/9zDKQKchlg84muOqMI4Pxo1ZQaxM+1fp/ETcDO+yi2E/ak0bwFAh6MQFrhY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096796; c=relaxed/simple;
	bh=LKxYQdMO3xIVUXEfa8wh12+/MzspUqSyzGM3N1ZJ1E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOo8xmv1lcp9KJgNbK4Lhx4qC+ZIB768lHme4JQhkNKlb3R+vaCPEMstLG6BHIGk+wKSp9nwz0togUvSl31wzU8Jq/V4TqV9hhRfkpe+HYNe1R8qkNFNneIW2GTz0ODol1WxCDVokWM8LAjWH6QOz3sVyQd5aaRqS9LT+NWQb0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LgrytPUW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LgrytPUW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ca11143dbbso5626045ad.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783096793; x=1783701593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpObt3Bc3TYpwm8R/YBWw43ULoUW+dnc9dBb5ROKkRI=;
        b=LgrytPUW1CZ5IMCJUB3nEduWPxoKJAdPUu9hiuWDYNcTY7ZM4DAxSEXq+zzNinju8l
         QBOLbhmsPLKEBTiCkTLX1bTf3QwJqGXBIjft/hd2Ek+75waKQPf3zp1VQ+Dd0rCXC7ki
         kKUFhLNXuwH7VDptFF2p9Hsg1Mj2zPL3Mc8KOt7hYDIuyW8kA+TrbPc2jmwHsrWI4ORQ
         s/kMC/46IIVDk4bL5VGZriJ/wBSTP5Giw6B4iJZyghAXRnDbpSJhrl1RW99/TBu+xpGE
         A16tb3hvaxYqb6/zL2T6HB+DZr7wH38faSKmRvm7xLijuQcah0gnc5npzOrMhcGEUoTV
         bFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783096793; x=1783701593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpObt3Bc3TYpwm8R/YBWw43ULoUW+dnc9dBb5ROKkRI=;
        b=q61FELw6gJMEiSyznC1dgZFcXL5uPPcpr2iPJFxyI/zBsdbIYlZVvzNMcKlX3ewezW
         ESNlAGmve2Ufi8vFFFV7+4JF91t9Yv2RPCd6/X5uk//dSfWIvCYr5i6QKckIFx60DaMz
         i+mZbeuMg1aQOvHXRcJJLW7xpDfkX1ejMolGAK9Sv3hEkjVW+z+BNU29KhhPiNvMp0xS
         2UDWLqUFr/VUuaA0cv+IERTBpNlEwbR5y27e2HyWyUH1gINanlI5RL4lGjduf4dyKFAY
         pU/ff2LHEEqlE3WuliJ+D81VeaEfWKn8RYobH2/LZsRf2g53DCq4AOFUaCSFrn7v/cew
         Fy/w==
X-Forwarded-Encrypted: i=1; AHgh+RrC0reLhIE2N8bGkHpTWg5vhqLj/m5pLCTJReDfdrncgOqrBG9rVYuKMlZoexG2kDJRzBQJCgFGD74rqy4bhLKl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkb6+6ttPjIAcDQKuFzbAvnfYfp7Kk6ZaZgF4AOQsW1/h8KxuV
	QFDn36BrXalPDiQfCe9XDUozbu5PTF+LQFgRRwvP8BCvYTLavC8a8qECGY8wqNHkp0k=
X-Gm-Gg: AfdE7cnQ9Bgk9m7kMXxxq7s6jzC17w6SS3QaQnBDsDZSM0m0ZZ2YjreTu4cFk9p64rA
	3eDuIXy5vY/omFccs+VpH/FccRN/RHiFrM2+uGoX/zuPs0EY9BFDoPyLCMQ3v4MLIiM+Vvrr19f
	66tR6IYGs0YrG4AGHeZfraT/pt1btcmYf8fIfmmLZOQJot3Ebl4NbIdVkDBUnbe6mn6VnKnocFK
	aa2yTQ1dd5VdeCFuN1Bo7yDsc3EpysZxC8rf2ikbjnL4w20GH7HAijWpPbeyCwihuwC9EVh3cdM
	TS95QyQHXD9vbFH2gSX/+4kWBhHr0o6YBYT9RQ1abB3xqpTb6aJwtGjcIqsZEuUn3jaJfK0taGe
	8wsc1OzjPZZCaiFMudmH5PI0fsJ0rGk/84mI6tQPbCM748RfupD25raUR7tu+q/aV/baxCugqam
	jueyHf9FXaINAZOjYpxhMr2QBnqb0=
X-Received: by 2002:a17:903:3bcb:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cbb9ec70a6mr364975ad.35.1783096792703;
        Fri, 03 Jul 2026 09:39:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9267:5e0f:f6d7:b6d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7144e1asm12149005ad.31.2026.07.03.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:39:52 -0700 (PDT)
Date: Fri, 3 Jul 2026 10:39:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	tanmay.shah@amd.com, michal.simek@amd.com
Subject: Re: [PATCH v4 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
Message-ID: <akfl1Uhn9QHRwE6n@p14s>
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
 <20260629164003.3940208-3-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629164003.3940208-3-ben.levinsky@amd.com>

Hi Ben,

On Mon, Jun 29, 2026 at 09:40:03AM -0700, Ben Levinsky wrote:
> Add a remoteproc driver for AMD soft-core processor subsystems
> instantiated in programmable logic and using dual-port BRAM for
> firmware storage and execution.
> 
> The driver parses the firmware memory window from the remoteproc device
> node's reg property, interprets that address and size in the
> processor-local address space, and then uses standard devicetree
> address translation through the parent bus ranges property to obtain
> the corresponding Linux-visible system physical address.
> 
> The resulting translated region is registered as the executable
> remoteproc carveout and coredump segment.
> 
> The processor is controlled through an active-low reset GPIO and a
> subsystem clock. The clock is enabled before reset is released, and the
> processor is kept in reset until firmware loading completes.
> 
> The firmware-name property is optional, allowing firmware to be
> assigned later through the remoteproc framework. Firmware images
> without a resource table are also accepted.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/Kconfig          |  11 ++
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
>  3 files changed, 225 insertions(+)
>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c521c744e7db..58fa566b609f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -23,6 +23,17 @@ config REMOTEPROC_CDEV
>  
>  	  It's safe to say N if you don't want to use this interface.
>  
> +config AMD_BRAM_REMOTEPROC
> +	tristate "AMD BRAM-based remoteproc support"
> +	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> +	help
> +	  Say y or m here to support a BRAM-based remote processor managed
> +	  through the remoteproc framework.
> +
> +	  The processor is controlled through a reset GPIO and clock.
> +

This last sentence doesn't belong here - please remove.

Looking at the bindings and this Kconfig I wonder why the emphasis of the naming
convention, i.e "BRAM-based remoteproc" is placed on the kind of memory the
remote processor is connected to rather than the remote processor itself.

Wouldn't it be better to have something like "AMD MicroBlaze/V remote
processor"?  What happens when we get another AMD softcore that is completely
different than MicroBlaze/V that is also connected to the same type of memory?

I'm good with the implemenation, I just wonder about the name...

> +	  If unsure, say N.
> +
>  config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 1c7598b8475d..5c39664b50c3 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
>  remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> +obj-$(CONFIG_AMD_BRAM_REMOTEPROC)	+= amd_bram_rproc.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
> new file mode 100644
> index 000000000000..a595875f9ce8
> --- /dev/null
> +++ b/drivers/remoteproc/amd_bram_rproc.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD BRAM-based Remote Processor driver
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
> + * similar) instantiated in AMD programmable logic, using dual-port BRAM
> + * for firmware storage and execution.
> + *
> + * The firmware memory (BRAM) is described in the processor-local address
> + * space and translated to the Linux-visible system physical address with
> + * standard devicetree address translation.
> + *
> + * Reset is controlled via GPIO connected to Processor System Reset IP.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +
> +#include "remoteproc_internal.h"
> +
> +/**
> + * struct amd_bram_rproc - AMD BRAM-based remoteproc private data
> + * @dev: device pointer
> + * @reset: GPIO descriptor for reset control (active-low)
> + * @clk: processor clock
> + */
> +struct amd_bram_rproc {
> +	struct device *dev;
> +	struct gpio_desc *reset;
> +	struct clk *clk;
> +};
> +
> +static int amd_bram_rproc_prepare(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv = rproc->priv;
> +	struct rproc_mem_entry *mem;
> +	struct resource res;
> +	u64 da, size;
> +	int ret;
> +
> +	ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to parse executable memory reg\n");
> +		return ret;
> +	}
> +
> +	if (!size || size > U32_MAX) {
> +		dev_err(priv->dev, "invalid executable memory size\n");
> +		return -EINVAL;
> +	}
> +
> +	if (da > U32_MAX) {
> +		dev_err(priv->dev, "invalid executable memory address\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_address_to_resource(priv->dev->of_node, 0, &res);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to translate executable memory reg\n");
> +		return ret;
> +	}
> +
> +	mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> +				   resource_size(&res), da,
> +				   rproc_mem_entry_ioremap_wc,
> +				   rproc_mem_entry_iounmap,
> +				   dev_name(priv->dev));
> +	if (!mem)
> +		return -ENOMEM;
> +
> +	rproc_add_carveout(rproc, mem);
> +	rproc_coredump_add_segment(rproc, da, resource_size(&res));
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_start(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv = rproc->priv;
> +	int ret;
> +
> +	/* Enable clock before releasing reset */
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to enable clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Deassert reset and let the processor run. */
> +	ret = gpiod_set_value_cansleep(priv->reset, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_stop(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv = rproc->priv;
> +	int ret;
> +
> +	/* Assert reset before disabling the processor clock. */
> +	ret = gpiod_set_value_cansleep(priv->reset, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Disable clock after asserting reset */
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
> +				   const struct firmware *fw)
> +{
> +	rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
> +					  "no resource table found\n");
> +	return 0;
> +}
> +
> +static const struct rproc_ops amd_bram_rproc_ops = {
> +	.prepare	= amd_bram_rproc_prepare,
> +	.start		= amd_bram_rproc_start,
> +	.stop		= amd_bram_rproc_stop,
> +	.load		= rproc_elf_load_segments,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.parse_fw	= amd_bram_rproc_parse_fw,
> +};
> +
> +static int amd_bram_rproc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct amd_bram_rproc *priv;
> +	const char *fw_name = NULL;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "failed to parse firmware-name property\n");
> +
> +	rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
> +				 fw_name, sizeof(*priv));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	priv = rproc->priv;
> +	priv->dev = dev;
> +
> +	/* Get the processor clock */
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "failed to get clock\n");
> +
> +	/*
> +	 * Keep the processor in reset until remoteproc has finished loading
> +	 * firmware into the executable memory window described by reg and
> +	 * translated through the parent bus ranges property.
> +	 */
> +	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "failed to get reset gpio\n");
> +
> +	rproc->auto_boot = false;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	ret = devm_rproc_add(dev, rproc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register rproc\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id amd_bram_rproc_of_match[] = {
> +	{ .compatible = "xlnx,zynqmp-bram-rproc" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
> +
> +static struct platform_driver amd_bram_rproc_driver = {
> +	.probe = amd_bram_rproc_probe,
> +	.driver = {
> +		.name = "amd-bram-rproc",
> +		.of_match_table = amd_bram_rproc_of_match,
> +	},
> +};
> +module_platform_driver(amd_bram_rproc_driver);
> +
> +MODULE_DESCRIPTION("AMD BRAM-based Remote Processor driver");
> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 
