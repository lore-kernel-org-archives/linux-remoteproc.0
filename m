Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ECA2FD7D3
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255272; cv=none; b=UIwSkRtbJRTzeRl1w5pee27V5ZY1HSgF10dy4pMT/lmJbqTBXdOFGaSRFkD0OMH8BZJX+J0XdLocVorL9msSgk6QTaHsnW5ooNkERIhByYrr19uOzowMavtIz/06ETrb187DALT/sAFpRMAaDmtf7QJ9VWNvst/qlibbyCfYQmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255272; c=relaxed/simple;
	bh=0kH2QnYB13nwWZuKWzaDyjvUHoynM+m225/BkE+HuR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvHT5fyoNQz9MfOFr5gZ0UaLwwr39j7kvbn8MR9qAkJcXwTS+KzxEr78Mkpz0lulZXxKZ+UEQJwoW1urLKJ9+slTM5pl8ctD3xgEAslOftaRKXfdX3CbsWITK9ZPpUcnaR5qS8Z831lo1kF8qRwr9YhmhTW0OCi15n4DFxrJuyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8sUDUs/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8sUDUs/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-835386ff122so1900854b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778255270; x=1778860070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IWNmErbFbgukVvSu2GxaC2AzU8pBs8cbT4fqBLxMV90=;
        b=p8sUDUs/AqJ9ljWdhdxImu6cRwM8Oz4oHsKcgxjgD5ztTQYc9SSk8eO2o5NO6esSrw
         2/YrSIZI/T0Arb04cwP2E/gA+Q59T2PXeLRqSQDqtnIjaxvCW8M0H3TCyMHOAVsBEBYd
         oqx+oL6ReqhigqhyOpgerfuPZO8CQxLhzSo13JDZW25N0hk0GZfx3cO+xhgiw6UGkUkx
         oUa/iP5Fxeg46gj+1wHZfgEf9N+yQh1mQ1reejjjCzyK7XEdl0y1cg+DcXz3Fx9ffMd2
         AuKwxIX8+rLQ2j0fufhG3XyaCNlDMzVktDUXTem1xmJu+/RSQnaAkueok9Hxh+FfuhI8
         BdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778255270; x=1778860070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWNmErbFbgukVvSu2GxaC2AzU8pBs8cbT4fqBLxMV90=;
        b=W24vU+hJ+9Kd9zeKMeREapf2DY2e79gcQBVdnoK73TnkpWUIgECytdRR3i62BBuQWi
         C/kWDT7MHvQMM5fBrvLZpSLa5g/0jLNxnad8SXrKWe4KDKjUnQZhKDXaOQcA+LiH3rUE
         ABdsfDkS8N2c3mJZuCBfRyNNizhLbhaKiXumpHxhNrBS3eyvFXBf0IDw2KElhTah7qCF
         BFlZkO9mJmteA8UxFH+hl4ek51cMDqENNAdvjHJwMZnTD+p1zohTHSSGk0qKXKSx77Km
         MhC1YGO8UBEYS1U9XKeanU2NKmtWrUSmS/U0c+LmSYqGbhsJrkisNnpHWZS+l4GgqNYh
         jguA==
X-Gm-Message-State: AOJu0YycqYnAVmVjPbdBPmQRJLDovtiYtPZEVeDBpx8tLLgHc6O08qqW
	zp9pwAHKV5ZeMUDS9gNRQ1rnuZ166VpaPspsUy8pzfJQEtzrVHQAnnfi+fEXktloG74=
X-Gm-Gg: Acq92OE2H7tWA/CyxmkRBtSWugA+93hBhapsRD81sGMWzKtAUAN5mNLbrxojXDFkuXv
	9LjVt8KyME4K+ce3Xo0f0DwEj3tXUU6sq35QQ8/Xsdro4HGOFiw9PNmNSlqLGkaRij3CeR/BVCu
	ZuSg2coVQcwJJEsPeefsU6ZP0gSCeQWYHkz9VrCOaCATHCR07F3CvK9M8dWUhHh5Iox6vLkS2tP
	O9Q9daZlcJ8zMgvietEXkDZPJ3PipjNdSIwRY9Y7SL9Iy99+KDfY9e6s+dEzIkDi3HKCoBB5Z/w
	UV552sJyvB6KpYNmhGp0Fiin2dFMB/82TxMRr5lAPqEcDdzDl7n1Fo73n1AzwLOQSENmMeFZmdt
	mSGa+mcRn71OpmJn3rJVB2X0XWspl1ZMm65Wn/5Z9ppJd66ibmqCubeWlYiyktukiNlWZOjETlX
	gHJoTBUTpeWed9E05wQNvkV8SQAEo=
X-Received: by 2002:a05:6a00:39a7:b0:82f:288:e572 with SMTP id d2e1a72fcca58-83a5c0bc34fmr12890838b3a.11.1778255269957;
        Fri, 08 May 2026 08:47:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d966:1475:9339:1066])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm12953187b3a.60.2026.05.08.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:47:49 -0700 (PDT)
Date: Fri, 8 May 2026 09:47:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, tanmay.shah@amd.com
Subject: Re: [PATCH v3 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
Message-ID: <af4FoowZg6myMzMI@p14s>
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
 <20260428142633.1854251-3-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428142633.1854251-3-ben.levinsky@amd.com>

Good morning,

On Tue, Apr 28, 2026 at 07:26:33AM -0700, Ben Levinsky wrote:
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
>  MAINTAINERS                         |   7 +
>  drivers/remoteproc/Kconfig          |  14 ++
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/amd_bram_rproc.c | 243 ++++++++++++++++++++++++++++
>  4 files changed, 265 insertions(+)
>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179c..172539971950 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1037,6 +1037,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>  F:	drivers/w1/masters/amd_axi_w1.c
>  
> +AMD BRAM REMOTEPROC DRIVER
> +M:	Ben Levinsky <ben.levinsky@amd.com>
> +L:	linux-remoteproc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> +F:	drivers/remoteproc/amd_bram_rproc.c
> +

There is no real advantage in adding this entry, checkpatch.pl should be
sufficient.

>  AMD CDX BUS DRIVER
>  M:	Nipun Gupta <nipun.gupta@amd.com>
>  M:	Nikhil Agarwal <nikhil.agarwal@amd.com>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..9a2a887ede8a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -23,6 +23,20 @@ config REMOTEPROC_CDEV
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
> +	  This driver matches designs where executable firmware memory is
> +	  described in the BRAM-local address space and translated to
> +	  the system physical address space with standard devicetree address
> +	  translation.

Not sure how this paragraph helps decide whether the driver should be enabled or
not.  Please remove.

> +
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
> index 000000000000..9383964b6046
> --- /dev/null
> +++ b/drivers/remoteproc/amd_bram_rproc.c
> @@ -0,0 +1,243 @@
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
> +#include <linux/io.h>
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
> +static int amd_bram_rproc_mem_map(struct rproc *rproc,
> +				  struct rproc_mem_entry *mem)
> +{
> +	void __iomem *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va)
> +		return -ENOMEM;
> +
> +	mem->va = (__force void *)va;
> +	mem->is_iomem = true;
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_mem_unmap(struct rproc *rproc,
> +				    struct rproc_mem_entry *mem)
> +{
> +	iounmap((void __iomem *)mem->va);
> +
> +	return 0;
> +}

The above 2 are identical to what is found in xlnx_r5_remoteproc.c.  Please
coordinate with Tanmay to split that into common code that can be reused by both
drivers.

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
> +				   (size_t)size, da,
> +				   amd_bram_rproc_mem_map,
> +				   amd_bram_rproc_mem_unmap,
> +				   dev_name(priv->dev));
> +	if (!mem)
> +		return -ENOMEM;
> +
> +	rproc_add_carveout(rproc, mem);
> +	rproc_coredump_add_segment(rproc, da, (size_t)size);

I'm pretty sure you want @res.start instead of @da, and resource_size(&res)
instead of @size.

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
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret == -EINVAL) {
> +		dev_dbg(&rproc->dev, "no resource table found\n");
> +		return 0;
> +	}
> +
> +	return ret;
> +}

This too should go in common code or simply replaced by
rproc_elf_load_rsc_table() in @amd_bram_rproc_ops - the choice is yours.

Thanks,
Mathieu

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
