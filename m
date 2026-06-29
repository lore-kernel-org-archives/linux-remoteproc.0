Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CE44BCB5
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749869; cv=none; b=YhvJfamiUYqw3pFh21xki74v8KUB+i7Pz2uZMUniSBZp8oaFepL8Jfc488P3dT34li7onnG316yfB8lJSclFxb6x210Uv7eDGs3pHwb8nuUkzdGDAMKHopYB3oVcRlf9S2KorIyPwThsZ6oSH32go/UYA0EBoj5FQeNAY9OfBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749869; c=relaxed/simple;
	bh=xtcfM/QC4ii93P5CNPdhAlwBuwpW8aL7+OKRD969NoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiXA5/vJVgIMmuMxq19Q9oDy/L21yiZPinlUJ6Uxw245y/6YO2+m8kFF/YvgsdDWq+6x0jkZmRtO+HeM0EvpeXcZLBTDoazyAYBleKpzfqcSZKAD2F1y/ohKta7D+j+IlF3lSkvWMZQ3+5JSvP9QnlaIYoagAcyT32WZznxREQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qggdkrLW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qggdkrLW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37e1607f7faso1570166a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782749865; x=1783354665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKCIanZMoCV3BmYfsChY7q/1N+h8PvEGiSX3EMn6BGg=;
        b=qggdkrLWebSFNt9h+Xq+ajXubYvUxfr4H3C5zlYXKbatpJDikvQSBV+lZLxXTCHT/z
         QXnAf4oqcEkG3XW8+EBm8TNHF+ZbuzYy5NdFRH+oGAaJU1CJTmNl1mGHl3qLNHJ0kORC
         fAYn2BQTjEaHsJz+BdcK44dp9fktQJe2sF4vMuk6ePElROuQWrUYc9SvIxoE1R9SAMen
         3/hTlMQYc1aXpAYAsweuQOz1EdN7hcwdNfaGoMRg7a8o2Ow3fHxfKDiiGJX8k+k5E6gs
         aRCIbPWLB+T8hkv7hBAvCFYAKfep8F1ys8fDTgD+ouNCXFYkV9OnuKvk+tQjVs76DBpH
         6smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749865; x=1783354665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKCIanZMoCV3BmYfsChY7q/1N+h8PvEGiSX3EMn6BGg=;
        b=p5XWUVqAQqYyyBBiICRGZRe72KtB6t7ZD9DChmfEJo1X/nuhKtP7BDOe4PfkzEdgro
         unakdG+Dr35XWzY2Yg3IgMSWzd7muDw0Yg1W5sZ/1fhdkyUL9usYnyqHZXKLzpGUMNwk
         oFM5qT+SPrJfOiRRc/v2FKMPLQPzUz0M1DXY1XwVGmAhgxxGuDFv9pmS57k0IFnuitDg
         KnnynDCA+3VL+jkFB2899tN37/o1tSXNozEGgktcmTm0+9Cca7yu6GHBP2F8d/1rcPEz
         EYzjlbGmbLB095hMYoW+iMquZAWD7cInzdM+F5MaDl/9o/FF/1XetuFbfbAVAmhYdxbQ
         Y/6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfxOz9Nkld5JAl2x1v5asYK5y2nCAtmE9ffepThX8uXYi/ZHAi2VfltAesLn7fCbVdfb7opwdzt2jN7XnBs8v7@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDaYBPzKFDw0y2GqmAltXZXdo3eeZl7m6zQWUF6W97ljc2CL3
	Ei0wpFGOeK34+dbO6ngTBByTRNXL5q8CW92DaHmTnDDAB3WLBXUZ+1psfsOJd2YXyjQ=
X-Gm-Gg: AfdE7cnSfOBGPDsm2fPJS0GNnFVHGuOu/8UlObenJqcvVCji2sGyabKyX+chA5PEz9j
	zlXWgvXCyVfb7q4TR24LE7nNQ6JQ08TcLq1p34Mjur/RTwPyB4TpxvY2NX7OCmeCq1hQSiVb97A
	81d5yw/gn6yvlGkMwf7vMBBQ0xS4Ul5rp78RWK4DL3xPcfVE9uea80oT1hstDP6fGl9MJmFjoCi
	sjbJVd/Eo26ToTotdZF8FrknoyVMsIr2f+K1TuX56RoRbt9zFSMv/BUaUZMoF0T4noCgfezKZPH
	u+49wG1G7NidVHBVWiuZoCIsNSegf1HTikjo3yJzbBF57Tk1h8maKM64+FaGkuEk4jYnRHEs4ey
	hAMb/TF46FhBb6XtAGJ4+e8CTKB7GHFehtptBGVJCOaYzWVVdqJKyZxA5RquLj0c1TLZi7xdH+7
	1fSmIfuxraft/oNs9m
X-Received: by 2002:a17:90b:49:b0:37d:f0dd:e715 with SMTP id 98e67ed59e1d1-380526ec129mr86495a91.10.1782749865335;
        Mon, 29 Jun 2026 09:17:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380332d1e65sm580212a91.2.2026.06.29.09.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:17:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:17:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <blevinsk@amd.com>
Cc: Ben Levinsky <ben.levinsky@amd.com>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andersson@kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com
Subject: Re: [PATCH v3 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
Message-ID: <akKapIQ4b8_Nv8Lh@p14s>
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
 <20260428142633.1854251-3-ben.levinsky@amd.com>
 <af4FoowZg6myMzMI@p14s>
 <d904a2da-9ef8-4a1a-aa4b-782bc75d21ae@amd.com>
 <CANLsYkwxErFjaOJ0q1wT_59C1WGp_24d0nOksFpk-LaGq6eDGg@mail.gmail.com>
 <03a7819c-2060-46f6-a72b-caf52b47ba32@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03a7819c-2060-46f6-a72b-caf52b47ba32@amd.com>

On Wed, Jun 24, 2026 at 03:01:58PM -0700, Ben Levinsky wrote:
> Hi Mathieu
> 
> Picking this back up now. Please see my replies inline below.
> 
> On 5/11/26 10:41 AM, Mathieu Poirier wrote:
> > On Fri, 8 May 2026 at 10:59, Ben Levinsky <blevinsk@amd.com> wrote:
> >>
> >> Hi Mathieu,
> >>
> >>
> >> On 5/8/26 8:47 AM, Mathieu Poirier wrote:
> >>> Good morning,
> >>>
> >>> On Tue, Apr 28, 2026 at 07:26:33AM -0700, Ben Levinsky wrote:
> >>>> Add a remoteproc driver for AMD soft-core processor subsystems
> >>>> instantiated in programmable logic and using dual-port BRAM for
> >>>> firmware storage and execution.
> >>>>
> >>>> The driver parses the firmware memory window from the remoteproc device
> >>>> node's reg property, interprets that address and size in the
> >>>> processor-local address space, and then uses standard devicetree
> >>>> address translation through the parent bus ranges property to obtain
> >>>> the corresponding Linux-visible system physical address.
> >>>>
> >>>> The resulting translated region is registered as the executable
> >>>> remoteproc carveout and coredump segment.
> >>>>
> >>>> The processor is controlled through an active-low reset GPIO and a
> >>>> subsystem clock. The clock is enabled before reset is released, and the
> >>>> processor is kept in reset until firmware loading completes.
> >>>>
> >>>> The firmware-name property is optional, allowing firmware to be
> >>>> assigned later through the remoteproc framework. Firmware images
> >>>> without a resource table are also accepted.
> >>>>
> >>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> >>>> ---
> >>>>  MAINTAINERS                         |   7 +
> >>>>  drivers/remoteproc/Kconfig          |  14 ++
> >>>>  drivers/remoteproc/Makefile         |   1 +
> >>>>  drivers/remoteproc/amd_bram_rproc.c | 243 ++++++++++++++++++++++++++++
> >>>>  4 files changed, 265 insertions(+)
> >>>>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
> >>>>
> >>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>> index c871acf2179c..172539971950 100644
> >>>> --- a/MAINTAINERS
> >>>> +++ b/MAINTAINERS
> >>>> @@ -1037,6 +1037,13 @@ S:    Maintained
> >>>>  F:  Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
> >>>>  F:  drivers/w1/masters/amd_axi_w1.c
> >>>>
> >>>> +AMD BRAM REMOTEPROC DRIVER
> >>>> +M:  Ben Levinsky <ben.levinsky@amd.com>
> >>>> +L:  linux-remoteproc@vger.kernel.org
> >>>> +S:  Maintained
> >>>> +F:  Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> >>>> +F:  drivers/remoteproc/amd_bram_rproc.c
> >>>> +
> >>>
> >>> There is no real advantage in adding this entry, checkpatch.pl should be
> >>> sufficient.
> >>>
> >>>>  AMD CDX BUS DRIVER
> >>>>  M:  Nipun Gupta <nipun.gupta@amd.com>
> >>>>  M:  Nikhil Agarwal <nikhil.agarwal@amd.com>
> >>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >>>> index ee54436fea5a..9a2a887ede8a 100644
> >>>> --- a/drivers/remoteproc/Kconfig
> >>>> +++ b/drivers/remoteproc/Kconfig
> >>>> @@ -23,6 +23,20 @@ config REMOTEPROC_CDEV
> >>>>
> >>>>        It's safe to say N if you don't want to use this interface.
> >>>>
> >>>> +config AMD_BRAM_REMOTEPROC
> >>>> +    tristate "AMD BRAM-based remoteproc support"
> >>>> +    depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> >>>> +    help
> >>>> +      Say y or m here to support a BRAM-based remote processor managed
> >>>> +      through the remoteproc framework.
> >>>> +
> >>>> +      This driver matches designs where executable firmware memory is
> >>>> +      described in the BRAM-local address space and translated to
> >>>> +      the system physical address space with standard devicetree address
> >>>> +      translation.
> >>>
> >>> Not sure how this paragraph helps decide whether the driver should be enabled or
> >>> not.  Please remove.
> >>>
> >>>> +
> >>>> +      If unsure, say N.
> >>>> +
> >>>>  config IMX_REMOTEPROC
> >>>>      tristate "i.MX remoteproc support"
> >>>>      depends on ARCH_MXC
> >>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> >>>> index 1c7598b8475d..5c39664b50c3 100644
> >>>> --- a/drivers/remoteproc/Makefile
> >>>> +++ b/drivers/remoteproc/Makefile
> >>>> @@ -11,6 +11,7 @@ remoteproc-y                               += remoteproc_sysfs.o
> >>>>  remoteproc-y                                += remoteproc_virtio.o
> >>>>  remoteproc-y                                += remoteproc_elf_loader.o
> >>>>  obj-$(CONFIG_REMOTEPROC_CDEV)               += remoteproc_cdev.o
> >>>> +obj-$(CONFIG_AMD_BRAM_REMOTEPROC)   += amd_bram_rproc.o
> >>>>  obj-$(CONFIG_IMX_REMOTEPROC)                += imx_rproc.o
> >>>>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)    += imx_dsp_rproc.o
> >>>>  obj-$(CONFIG_INGENIC_VPU_RPROC)             += ingenic_rproc.o
> >>>> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
> >>>> new file mode 100644
> >>>> index 000000000000..9383964b6046
> >>>> --- /dev/null
> >>>> +++ b/drivers/remoteproc/amd_bram_rproc.c
> >>>> @@ -0,0 +1,243 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0
> >>>> +/*
> >>>> + * AMD BRAM-based Remote Processor driver
> >>>> + *
> >>>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> >>>> + *
> >>>> + * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
> >>>> + * similar) instantiated in AMD programmable logic, using dual-port BRAM
> >>>> + * for firmware storage and execution.
> >>>> + *
> >>>> + * The firmware memory (BRAM) is described in the processor-local address
> >>>> + * space and translated to the Linux-visible system physical address with
> >>>> + * standard devicetree address translation.
> >>>> + *
> >>>> + * Reset is controlled via GPIO connected to Processor System Reset IP.
> >>>> + */
> >>>> +
> >>>> +#include <linux/clk.h>
> >>>> +#include <linux/dma-mapping.h>
> >>>> +#include <linux/gpio/consumer.h>
> >>>> +#include <linux/io.h>
> >>>> +#include <linux/module.h>
> >>>> +#include <linux/of.h>
> >>>> +#include <linux/of_address.h>
> >>>> +#include <linux/platform_device.h>
> >>>> +#include <linux/remoteproc.h>
> >>>> +
> >>>> +#include "remoteproc_internal.h"
> >>>> +
> >>>> +/**
> >>>> + * struct amd_bram_rproc - AMD BRAM-based remoteproc private data
> >>>> + * @dev: device pointer
> >>>> + * @reset: GPIO descriptor for reset control (active-low)
> >>>> + * @clk: processor clock
> >>>> + */
> >>>> +struct amd_bram_rproc {
> >>>> +    struct device *dev;
> >>>> +    struct gpio_desc *reset;
> >>>> +    struct clk *clk;
> >>>> +};
> >>>> +
> >>>> +static int amd_bram_rproc_mem_map(struct rproc *rproc,
> >>>> +                              struct rproc_mem_entry *mem)
> >>>> +{
> >>>> +    void __iomem *va;
> >>>> +
> >>>> +    va = ioremap_wc(mem->dma, mem->len);
> >>>> +    if (!va)
> >>>> +            return -ENOMEM;
> >>>> +
> >>>> +    mem->va = (__force void *)va;
> >>>> +    mem->is_iomem = true;
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static int amd_bram_rproc_mem_unmap(struct rproc *rproc,
> >>>> +                                struct rproc_mem_entry *mem)
> >>>> +{
> >>>> +    iounmap((void __iomem *)mem->va);
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>
> >>> The above 2 are identical to what is found in xlnx_r5_remoteproc.c.  Please
> >>> coordinate with Tanmay to split that into common code that can be reused by both
> >>> drivers.
> >>>
> >>>> +
> >>>> +static int amd_bram_rproc_prepare(struct rproc *rproc)
> >>>> +{
> >>>> +    struct amd_bram_rproc *priv = rproc->priv;
> >>>> +    struct rproc_mem_entry *mem;
> >>>> +    struct resource res;
> >>>> +    u64 da, size;
> >>>> +    int ret;
> >>>> +
> >>>> +    ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
> >>>> +    if (ret) {
> >>>> +            dev_err(priv->dev, "failed to parse executable memory reg\n");
> >>>> +            return ret;
> >>>> +    }
> >>>> +
> >>>> +    if (!size || size > U32_MAX) {
> >>>> +            dev_err(priv->dev, "invalid executable memory size\n");
> >>>> +            return -EINVAL;
> >>>> +    }
> >>>> +
> >>>> +    if (da > U32_MAX) {
> >>>> +            dev_err(priv->dev, "invalid executable memory address\n");
> >>>> +            return -EINVAL;
> >>>> +    }
> >>>> +
> >>>> +    ret = of_address_to_resource(priv->dev->of_node, 0, &res);
> >>>> +    if (ret) {
> >>>> +            dev_err(priv->dev, "failed to translate executable memory reg\n");
> >>>> +            return ret;
> >>>> +    }
> >>>> +
> >>>> +    mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> >>>> +                               (size_t)size, da,
> >>>> +                               amd_bram_rproc_mem_map,
> >>>> +                               amd_bram_rproc_mem_unmap,
> >>>> +                               dev_name(priv->dev));
> >>>> +    if (!mem)
> >>>> +            return -ENOMEM;
> >>>> +
> >>>> +    rproc_add_carveout(rproc, mem);
> >>>> +    rproc_coredump_add_segment(rproc, da, (size_t)size);
> >>>
> >>> I'm pretty sure you want @res.start instead of @da, and resource_size(&res)
> >>> instead of @size.
> >>>

Looking at the code again, I'm not sure why I asked to used @da.

> 
>   For the coredump segment, I agree with using resource_size(&res) for
>   the size, but I think the address should remain @da rather than
>   @res.start.
> 
>   The binding describes the reg property in the processor-local address
>   space and uses the parent bus ranges property only to translate that
>   window to the Linux-visible system physical address. That means @da and
>   @res.start are not necessarily in the same address space. For example,
>   the BRAM can appear at 0x0 to the soft-core processor while Linux sees
>   the same memory at a translated system physical address such as
>   0xa0000000.
> 
>   rproc_coredump_add_segment() stores the address as a device address, and
>   the coredump path later resolves it through rproc_da_to_va() against the
>   registered carveout's device address. Since this driver registers the
>   carveout with @da as the device address and @res.start as the host-side
>   physical address used for ioremap_wc(), passing @res.start to
>   rproc_coredump_add_segment() could fail to match the carveout when those
>   addresses differ.
> 
>   So in the respin I plan to use:
> 
>           rproc_coredump_add_segment(rproc, da, resource_size(&res));
> 
>   Does that match your expectation for this address model?

Yes, I agree with you proposal.

> 
> Thank you
> Ben
> 
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static int amd_bram_rproc_start(struct rproc *rproc)
> >>>> +{
> >>>> +    struct amd_bram_rproc *priv = rproc->priv;
> >>>> +    int ret;
> >>>> +
> >>>> +    /* Enable clock before releasing reset */
> >>>> +    ret = clk_prepare_enable(priv->clk);
> >>>> +    if (ret) {
> >>>> +            dev_err(priv->dev, "failed to enable clock: %d\n", ret);
> >>>> +            return ret;
> >>>> +    }
> >>>> +
> >>>> +    /* Deassert reset and let the processor run. */
> >>>> +    ret = gpiod_set_value_cansleep(priv->reset, 0);
> >>>> +    if (ret) {
> >>>> +            dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
> >>>> +            clk_disable_unprepare(priv->clk);
> >>>> +            return ret;
> >>>> +    }
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static int amd_bram_rproc_stop(struct rproc *rproc)
> >>>> +{
> >>>> +    struct amd_bram_rproc *priv = rproc->priv;
> >>>> +    int ret;
> >>>> +
> >>>> +    /* Assert reset before disabling the processor clock. */
> >>>> +    ret = gpiod_set_value_cansleep(priv->reset, 1);
> >>>> +    if (ret) {
> >>>> +            dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> >>>> +            return ret;
> >>>> +    }
> >>>> +
> >>>> +    /* Disable clock after asserting reset */
> >>>> +    clk_disable_unprepare(priv->clk);
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
> >>>> +                               const struct firmware *fw)
> >>>> +{
> >>>> +    int ret;
> >>>> +
> >>>> +    ret = rproc_elf_load_rsc_table(rproc, fw);
> >>>> +    if (ret == -EINVAL) {
> >>>> +            dev_dbg(&rproc->dev, "no resource table found\n");
> >>>> +            return 0;
> >>>> +    }
> >>>> +
> >>>> +    return ret;
> >>>> +}
> >>>
> >>> This too should go in common code or simply replaced by
> >>> rproc_elf_load_rsc_table() in @amd_bram_rproc_ops - the choice is yours.
> >>>
> >>> Thanks,
> >>> Mathieu
> >>
> >>   Thanks for the review.
> >>
> >>   I went through the remoteproc drivers to scope the cleanup points you
> >>   called out.
> >>
> >>   For the plain carveout map/unmap callbacks, the same ioremap_wc()/iounmap()
> >>   pattern exists not only in amd_bram_rproc and xlnx_r5_remoteproc, but also
> >>   in rcar_rproc, st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc.
> >>
> >>   The xlnx_r5 TCM path is close as well, but that one still needs a wrapper
> >>   since it clears the memory after ioremap_wc().
> >>
> >>   For the optional resource-table parsing, amd_bram_rproc and xlnx_r5_remoteproc
> >>   share the same pattern of treating only -EINVAL from rproc_elf_load_rsc_table()
> >>   as non-fatal. PRU is similar, but has additional firmware parsing after that.
> >>   Other drivers such as rcar/imx/imx_dsp/stm32 also tolerate missing resource
> >>   tables, but their current behavior is not identical since they flatten all
> >>   errors to success and only log.
> >>
> >>   For the next revision, would you prefer the following approach?
> >>
> >>   1. Add a small common helper for the plain carveout ioremap_wc()/iounmap()
> >>      case and use it in amd_bram_rproc and xlnx_r5_remoteproc.
> >>
> >>   2. For the optional resource-table handling, either:
> >>      - add a small common helper for the "missing table is OK" case
> >>        (i.e. return 0 on -EINVAL and propagate other errors), and use that
> >>        in amd_bram_rproc and xlnx_r5_remoteproc, or
> > 
> > I would prefer to go with the common helper that returns 0 on -EINVAL
> > and propagates other errors, and apply it to other architectures such
> > as stm32, rcar, imx and imx_dsp.
> > 
> >>      - drop the custom AMD parse_fw() path and use rproc_elf_load_rsc_table()
> >>        directly, which would make the resource table mandatory there.
> >>
> >>   Also, for the plain map/unmap helper, should I keep the cleanup scoped to
> >>   the drivers directly involved here, or would you prefer that I fold the
> >>   other exact-match users (rcar, st, stm32, imx, imx_dsp) into the same
> >>   cleanup patch as well?
> >>
> > 
> > Proceed with the other exact-match as well.
> > 
> >>   I want to make sure I take the direction you prefer before respinning.
> > 
> > I think the best approach is to send out a cleanup patchset with the
> > above changes, followed by another respin of this set once the cleanup
> > is merged.
> > 
> > Thanks for being proactive.
> > 
> >>
> >>   Thanks,
> >>   Ben
> >>>
> >>>> +
> >>>> +static const struct rproc_ops amd_bram_rproc_ops = {
> >>>> +    .prepare        = amd_bram_rproc_prepare,
> >>>> +    .start          = amd_bram_rproc_start,
> >>>> +    .stop           = amd_bram_rproc_stop,
> >>>> +    .load           = rproc_elf_load_segments,
> >>>> +    .sanity_check   = rproc_elf_sanity_check,
> >>>> +    .get_boot_addr  = rproc_elf_get_boot_addr,
> >>>> +    .parse_fw       = amd_bram_rproc_parse_fw,
> >>>> +};
> >>>> +
> >>>> +static int amd_bram_rproc_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +    struct device *dev = &pdev->dev;
> >>>> +    struct amd_bram_rproc *priv;
> >>>> +    const char *fw_name = NULL;
> >>>> +    struct rproc *rproc;
> >>>> +    int ret;
> >>>> +
> >>>> +    ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> >>>> +    if (ret < 0 && ret != -EINVAL)
> >>>> +            return dev_err_probe(dev, ret,
> >>>> +                                 "failed to parse firmware-name property\n");
> >>>> +
> >>>> +    rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
> >>>> +                             fw_name, sizeof(*priv));
> >>>> +    if (!rproc)
> >>>> +            return -ENOMEM;
> >>>> +
> >>>> +    priv = rproc->priv;
> >>>> +    priv->dev = dev;
> >>>> +
> >>>> +    /* Get the processor clock */
> >>>> +    priv->clk = devm_clk_get(dev, NULL);
> >>>> +    if (IS_ERR(priv->clk))
> >>>> +            return dev_err_probe(dev, PTR_ERR(priv->clk),
> >>>> +                                 "failed to get clock\n");
> >>>> +
> >>>> +    /*
> >>>> +     * Keep the processor in reset until remoteproc has finished loading
> >>>> +     * firmware into the executable memory window described by reg and
> >>>> +     * translated through the parent bus ranges property.
> >>>> +     */
> >>>> +    priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> >>>> +    if (IS_ERR(priv->reset))
> >>>> +            return dev_err_probe(dev, PTR_ERR(priv->reset),
> >>>> +                                 "failed to get reset gpio\n");
> >>>> +
> >>>> +    rproc->auto_boot = false;
> >>>> +
> >>>> +    ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> >>>> +    if (ret)
> >>>> +            return dev_err_probe(dev, ret, "failed to set DMA mask\n");
> >>>> +
> >>>> +    platform_set_drvdata(pdev, rproc);
> >>>> +
> >>>> +    ret = devm_rproc_add(dev, rproc);
> >>>> +    if (ret)
> >>>> +            return dev_err_probe(dev, ret, "failed to register rproc\n");
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static const struct of_device_id amd_bram_rproc_of_match[] = {
> >>>> +    { .compatible = "xlnx,zynqmp-bram-rproc" },
> >>>> +    { /* sentinel */ },
> >>>> +};
> >>>> +MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
> >>>> +
> >>>> +static struct platform_driver amd_bram_rproc_driver = {
> >>>> +    .probe = amd_bram_rproc_probe,
> >>>> +    .driver = {
> >>>> +            .name = "amd-bram-rproc",
> >>>> +            .of_match_table = amd_bram_rproc_of_match,
> >>>> +    },
> >>>> +};
> >>>> +module_platform_driver(amd_bram_rproc_driver);
> >>>> +
> >>>> +MODULE_DESCRIPTION("AMD BRAM-based Remote Processor driver");
> >>>> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
> >>>> +MODULE_LICENSE("GPL");
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>
> 
