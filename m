Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1840F8C5
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521302; cv=pass; b=GuaHfHCVZHFLVkcqeZoXcoVTtoiQVwFlYN0bqrgeJAwPCY4Q81aXd2U/o2FSE7RjiyagNOAu7DM/h6oCwePQxI/5iXrAiajwpT8DmHYURaQKTVhYgRejgjEON8XKpPB4GlKgYyl/6zF6McL0aGme/k8fV+kEzYCUuGCp2giLDZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521302; c=relaxed/simple;
	bh=dNXvFDQ0lopFLzJ+Iut5KTk4e9zg8DE7QqZQb91KFas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piQy/jIWEvXx9Id8bUvN06TRjo8L5+IsHgMv+BmypL1tKVYOpDcTb/7Pg9LxTfXBclVwHT20c9G2IpZn7dE8eUXwcX+yK1//NQFRsBycxYKeTJMERgrpTQrp7sNJSAIWeXyt5kgDj/sRvQ5VRCy+jaRSGpdBn0ir+Ah5pqZNXr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RK2ZVLRQ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RK2ZVLRQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso7086134a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 10:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778521298; cv=none;
        d=google.com; s=arc-20240605;
        b=PpSQhd6oKg7jnUdXeAIMiBLAJJSZxfCGu2OLi2ZCscmr53fxpMGSIiCNihmElnpJVd
         UMYQDd/Q7DVOyi+eBZl93MzcC/Bxr3Xf62SXw1QYC9+DwJL2h7YJ14Z3qdSKQ4zjgf6l
         HUaP+4uYG6QXkrwZLdt7L4q1dYs0g2Bw/fU9/GjrtDLQQkvRwL34nsyfheDhx4XS0QJq
         fPQkSr0enXRelKtbttBvjO1DRFoK4sHftRgdYEGNhkmbNJQi7zxOIoVlIn7gZldtfTez
         2AExoOgfTogsmKCxHioLLifJCqa/gsDCpfXesnwkpwB39/+0Rrb7xkWBcdn+hm4dMo71
         hwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eVCNEzHhSGwtV7VOVKxNF9RhG1E8eWPZUzEKfdIupJk=;
        fh=BvwiXslR71BV3k8cnnIhzzE9U6VffTrjc0xXN5L/U88=;
        b=Vj23BclbCev3YNpvfyiuVkHfB+HDNEaBsdn95IUEOszeDNJxPGsK6Hg5yn1hxyLyB1
         j9DRKxy5gFFthQZpMPeouupFsBny1wsDaUx1d88Nt5Fnx/PNv6PdrwKM9CNccziBKsE0
         9Z7M1N8fFjqIy94TwbKqxVBcnowDkA/ik78DW3wssPwIoB0Ytvj5JWb5fXZhf4GlBrPq
         /YDIFjHgfMuJissF51Y7OXBBiMaYsGp3sM9vjL0PuiYK2BkeYqJsL4D+He0v1/yvgAKm
         wKJzZGLODWFL/c5uoaxPsl8wSsWOPulQ5jx8F1ywQLccYnEnLh/dX4bDtMYp1aCvUQPz
         f3vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778521298; x=1779126098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eVCNEzHhSGwtV7VOVKxNF9RhG1E8eWPZUzEKfdIupJk=;
        b=RK2ZVLRQDTKO5/IENTNU7ZSNakUnve3qYojHzaLmBqvm8zHkT+2dwa2d25DcBmcBCO
         TOQTerpKofocJyPOIlh7f6FcbOVNdNYzKS5ZmvPlSuw93XVSlBoJGik9E1DKwQVkjkjS
         h+ZPVGSUXokEH/UmHhrAjXusq3/n4Rmst239bWEaZ2c7USmsD0sxifZtsTJXEA+ZNZvn
         66ZfHmpQ7xod2oZjSGCR4olCecjC6rSfTiZHI/aBlfmL5lEBLIF94frwR/9cvYlhc0kt
         vxsks9kVUjm9voXTNcNLKb9eqYJTJL0g4w2qWJf9yGtZ8e8M+gyNL6YfI5dtuRTo4u9O
         5UvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521298; x=1779126098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVCNEzHhSGwtV7VOVKxNF9RhG1E8eWPZUzEKfdIupJk=;
        b=Iiv99e3JCPoF+kXLrQKci/dxxZSp6zjE2VyFVzpIDwZ/AgXfMEr4oDSlvSeXY2fnxn
         WwoJenvuXsdgvij0289kqDHK3jp88WavcnpeiMtX2k61zpHki7fzVnnCObZ8SUB7amJQ
         Ooxam8Wc7Abs/Zx6UIxURng+hDcVmssq16jKmcLKtWFV4jO/4UqNCUln5b8CJkIX/iSx
         X3hRasoNuMInI6Zft7115ZePEm1cx5tPrVV0GbY1dLK3C2l4JvzbTUlH77OFGcVY1vqN
         kO3IQEiDcq1ZHw35AqdJje0M+HEIBJ3BeqVPLFZV9tohk7Hr02rxoARmDMuu/C9NtfgI
         7ckA==
X-Forwarded-Encrypted: i=1; AFNElJ90CcTqbzVig/UAaWt/uBZsjwXIb560dIPuBv6rwxiVzGKuWOU4AfD7ZR1fCx8LELYEZaGZnXYMa8EtZ5Eb2ioQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzooOCI+CMODDgkXj9nrkMgsAOe2aAcgZfFmLmwfzbkhoBdq6U9
	FOTTHm8qcFcZ8i099o2Gw7vz0KRTDngd6Dn34E7RJNwVtqk+/wIu195KIb9uWFL4HDo5UwRp+L7
	6njIoEfTQzqxvpMNTBbV4Zac3tQgFhOGnu7By6AIHqQ==
X-Gm-Gg: Acq92OGXISib/rqOd5YPtAKUsxULaf9Z2nO7Y6s7iZjIyaPuyk1h/5Fv4QyC0hO1q+j
	5z6eANe8vxORGvBNiA0ug8v1rPfoYi2FL8I13bNGc9eDQjpkTbl5TwazeUJfocJXH+8F9rxpHZO
	YtMT2LbUvjP/TNhY5lWBAMm/povAWwqTpdG5XTQyH4lk41Fk1R4gSOaWga1H21tiIpIVlkfSTzy
	APJYXqaMNieD5oBpifXwvorYBmz7U2SX/2dXDHSf8F+hN/1QyDvuve61WLVlvypcYoETuhpdY/s
	9+CT4rW/Eh2nfbybqtRLT/m+ThBgv1CIVOCyhvaKQw==
X-Received: by 2002:a05:6402:3718:b0:67f:7972:1c6b with SMTP id
 4fb4d7f45d1cf-67f79721e67mr4858041a12.16.1778521298111; Mon, 11 May 2026
 10:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
 <20260428142633.1854251-3-ben.levinsky@amd.com> <af4FoowZg6myMzMI@p14s> <d904a2da-9ef8-4a1a-aa4b-782bc75d21ae@amd.com>
In-Reply-To: <d904a2da-9ef8-4a1a-aa4b-782bc75d21ae@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 11 May 2026 11:41:27 -0600
X-Gm-Features: AVHnY4Lc7yMFYqvRBx_DAzygCobWmgkxA5BCsVQh1BDi6TK2qflltqWWSgqin-s
Message-ID: <CANLsYkwxErFjaOJ0q1wT_59C1WGp_24d0nOksFpk-LaGq6eDGg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: add AMD BRAM-based remote processor driver
To: Ben Levinsky <blevinsk@amd.com>
Cc: Ben Levinsky <ben.levinsky@amd.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	michal.simek@amd.com, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2026 at 10:59, Ben Levinsky <blevinsk@amd.com> wrote:
>
> Hi Mathieu,
>
>
> On 5/8/26 8:47 AM, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Tue, Apr 28, 2026 at 07:26:33AM -0700, Ben Levinsky wrote:
> >> Add a remoteproc driver for AMD soft-core processor subsystems
> >> instantiated in programmable logic and using dual-port BRAM for
> >> firmware storage and execution.
> >>
> >> The driver parses the firmware memory window from the remoteproc device
> >> node's reg property, interprets that address and size in the
> >> processor-local address space, and then uses standard devicetree
> >> address translation through the parent bus ranges property to obtain
> >> the corresponding Linux-visible system physical address.
> >>
> >> The resulting translated region is registered as the executable
> >> remoteproc carveout and coredump segment.
> >>
> >> The processor is controlled through an active-low reset GPIO and a
> >> subsystem clock. The clock is enabled before reset is released, and the
> >> processor is kept in reset until firmware loading completes.
> >>
> >> The firmware-name property is optional, allowing firmware to be
> >> assigned later through the remoteproc framework. Firmware images
> >> without a resource table are also accepted.
> >>
> >> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> >> ---
> >>  MAINTAINERS                         |   7 +
> >>  drivers/remoteproc/Kconfig          |  14 ++
> >>  drivers/remoteproc/Makefile         |   1 +
> >>  drivers/remoteproc/amd_bram_rproc.c | 243 ++++++++++++++++++++++++++++
> >>  4 files changed, 265 insertions(+)
> >>  create mode 100644 drivers/remoteproc/amd_bram_rproc.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index c871acf2179c..172539971950 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1037,6 +1037,13 @@ S:    Maintained
> >>  F:  Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
> >>  F:  drivers/w1/masters/amd_axi_w1.c
> >>
> >> +AMD BRAM REMOTEPROC DRIVER
> >> +M:  Ben Levinsky <ben.levinsky@amd.com>
> >> +L:  linux-remoteproc@vger.kernel.org
> >> +S:  Maintained
> >> +F:  Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> >> +F:  drivers/remoteproc/amd_bram_rproc.c
> >> +
> >
> > There is no real advantage in adding this entry, checkpatch.pl should be
> > sufficient.
> >
> >>  AMD CDX BUS DRIVER
> >>  M:  Nipun Gupta <nipun.gupta@amd.com>
> >>  M:  Nikhil Agarwal <nikhil.agarwal@amd.com>
> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >> index ee54436fea5a..9a2a887ede8a 100644
> >> --- a/drivers/remoteproc/Kconfig
> >> +++ b/drivers/remoteproc/Kconfig
> >> @@ -23,6 +23,20 @@ config REMOTEPROC_CDEV
> >>
> >>        It's safe to say N if you don't want to use this interface.
> >>
> >> +config AMD_BRAM_REMOTEPROC
> >> +    tristate "AMD BRAM-based remoteproc support"
> >> +    depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> >> +    help
> >> +      Say y or m here to support a BRAM-based remote processor managed
> >> +      through the remoteproc framework.
> >> +
> >> +      This driver matches designs where executable firmware memory is
> >> +      described in the BRAM-local address space and translated to
> >> +      the system physical address space with standard devicetree address
> >> +      translation.
> >
> > Not sure how this paragraph helps decide whether the driver should be enabled or
> > not.  Please remove.
> >
> >> +
> >> +      If unsure, say N.
> >> +
> >>  config IMX_REMOTEPROC
> >>      tristate "i.MX remoteproc support"
> >>      depends on ARCH_MXC
> >> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> >> index 1c7598b8475d..5c39664b50c3 100644
> >> --- a/drivers/remoteproc/Makefile
> >> +++ b/drivers/remoteproc/Makefile
> >> @@ -11,6 +11,7 @@ remoteproc-y                               += remoteproc_sysfs.o
> >>  remoteproc-y                                += remoteproc_virtio.o
> >>  remoteproc-y                                += remoteproc_elf_loader.o
> >>  obj-$(CONFIG_REMOTEPROC_CDEV)               += remoteproc_cdev.o
> >> +obj-$(CONFIG_AMD_BRAM_REMOTEPROC)   += amd_bram_rproc.o
> >>  obj-$(CONFIG_IMX_REMOTEPROC)                += imx_rproc.o
> >>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)    += imx_dsp_rproc.o
> >>  obj-$(CONFIG_INGENIC_VPU_RPROC)             += ingenic_rproc.o
> >> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
> >> new file mode 100644
> >> index 000000000000..9383964b6046
> >> --- /dev/null
> >> +++ b/drivers/remoteproc/amd_bram_rproc.c
> >> @@ -0,0 +1,243 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * AMD BRAM-based Remote Processor driver
> >> + *
> >> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> >> + *
> >> + * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
> >> + * similar) instantiated in AMD programmable logic, using dual-port BRAM
> >> + * for firmware storage and execution.
> >> + *
> >> + * The firmware memory (BRAM) is described in the processor-local address
> >> + * space and translated to the Linux-visible system physical address with
> >> + * standard devicetree address translation.
> >> + *
> >> + * Reset is controlled via GPIO connected to Processor System Reset IP.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/dma-mapping.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/io.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/remoteproc.h>
> >> +
> >> +#include "remoteproc_internal.h"
> >> +
> >> +/**
> >> + * struct amd_bram_rproc - AMD BRAM-based remoteproc private data
> >> + * @dev: device pointer
> >> + * @reset: GPIO descriptor for reset control (active-low)
> >> + * @clk: processor clock
> >> + */
> >> +struct amd_bram_rproc {
> >> +    struct device *dev;
> >> +    struct gpio_desc *reset;
> >> +    struct clk *clk;
> >> +};
> >> +
> >> +static int amd_bram_rproc_mem_map(struct rproc *rproc,
> >> +                              struct rproc_mem_entry *mem)
> >> +{
> >> +    void __iomem *va;
> >> +
> >> +    va = ioremap_wc(mem->dma, mem->len);
> >> +    if (!va)
> >> +            return -ENOMEM;
> >> +
> >> +    mem->va = (__force void *)va;
> >> +    mem->is_iomem = true;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int amd_bram_rproc_mem_unmap(struct rproc *rproc,
> >> +                                struct rproc_mem_entry *mem)
> >> +{
> >> +    iounmap((void __iomem *)mem->va);
> >> +
> >> +    return 0;
> >> +}
> >
> > The above 2 are identical to what is found in xlnx_r5_remoteproc.c.  Please
> > coordinate with Tanmay to split that into common code that can be reused by both
> > drivers.
> >
> >> +
> >> +static int amd_bram_rproc_prepare(struct rproc *rproc)
> >> +{
> >> +    struct amd_bram_rproc *priv = rproc->priv;
> >> +    struct rproc_mem_entry *mem;
> >> +    struct resource res;
> >> +    u64 da, size;
> >> +    int ret;
> >> +
> >> +    ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
> >> +    if (ret) {
> >> +            dev_err(priv->dev, "failed to parse executable memory reg\n");
> >> +            return ret;
> >> +    }
> >> +
> >> +    if (!size || size > U32_MAX) {
> >> +            dev_err(priv->dev, "invalid executable memory size\n");
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    if (da > U32_MAX) {
> >> +            dev_err(priv->dev, "invalid executable memory address\n");
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    ret = of_address_to_resource(priv->dev->of_node, 0, &res);
> >> +    if (ret) {
> >> +            dev_err(priv->dev, "failed to translate executable memory reg\n");
> >> +            return ret;
> >> +    }
> >> +
> >> +    mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> >> +                               (size_t)size, da,
> >> +                               amd_bram_rproc_mem_map,
> >> +                               amd_bram_rproc_mem_unmap,
> >> +                               dev_name(priv->dev));
> >> +    if (!mem)
> >> +            return -ENOMEM;
> >> +
> >> +    rproc_add_carveout(rproc, mem);
> >> +    rproc_coredump_add_segment(rproc, da, (size_t)size);
> >
> > I'm pretty sure you want @res.start instead of @da, and resource_size(&res)
> > instead of @size.
> >
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int amd_bram_rproc_start(struct rproc *rproc)
> >> +{
> >> +    struct amd_bram_rproc *priv = rproc->priv;
> >> +    int ret;
> >> +
> >> +    /* Enable clock before releasing reset */
> >> +    ret = clk_prepare_enable(priv->clk);
> >> +    if (ret) {
> >> +            dev_err(priv->dev, "failed to enable clock: %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    /* Deassert reset and let the processor run. */
> >> +    ret = gpiod_set_value_cansleep(priv->reset, 0);
> >> +    if (ret) {
> >> +            dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
> >> +            clk_disable_unprepare(priv->clk);
> >> +            return ret;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int amd_bram_rproc_stop(struct rproc *rproc)
> >> +{
> >> +    struct amd_bram_rproc *priv = rproc->priv;
> >> +    int ret;
> >> +
> >> +    /* Assert reset before disabling the processor clock. */
> >> +    ret = gpiod_set_value_cansleep(priv->reset, 1);
> >> +    if (ret) {
> >> +            dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    /* Disable clock after asserting reset */
> >> +    clk_disable_unprepare(priv->clk);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
> >> +                               const struct firmware *fw)
> >> +{
> >> +    int ret;
> >> +
> >> +    ret = rproc_elf_load_rsc_table(rproc, fw);
> >> +    if (ret == -EINVAL) {
> >> +            dev_dbg(&rproc->dev, "no resource table found\n");
> >> +            return 0;
> >> +    }
> >> +
> >> +    return ret;
> >> +}
> >
> > This too should go in common code or simply replaced by
> > rproc_elf_load_rsc_table() in @amd_bram_rproc_ops - the choice is yours.
> >
> > Thanks,
> > Mathieu
>
>   Thanks for the review.
>
>   I went through the remoteproc drivers to scope the cleanup points you
>   called out.
>
>   For the plain carveout map/unmap callbacks, the same ioremap_wc()/iounmap()
>   pattern exists not only in amd_bram_rproc and xlnx_r5_remoteproc, but also
>   in rcar_rproc, st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc.
>
>   The xlnx_r5 TCM path is close as well, but that one still needs a wrapper
>   since it clears the memory after ioremap_wc().
>
>   For the optional resource-table parsing, amd_bram_rproc and xlnx_r5_remoteproc
>   share the same pattern of treating only -EINVAL from rproc_elf_load_rsc_table()
>   as non-fatal. PRU is similar, but has additional firmware parsing after that.
>   Other drivers such as rcar/imx/imx_dsp/stm32 also tolerate missing resource
>   tables, but their current behavior is not identical since they flatten all
>   errors to success and only log.
>
>   For the next revision, would you prefer the following approach?
>
>   1. Add a small common helper for the plain carveout ioremap_wc()/iounmap()
>      case and use it in amd_bram_rproc and xlnx_r5_remoteproc.
>
>   2. For the optional resource-table handling, either:
>      - add a small common helper for the "missing table is OK" case
>        (i.e. return 0 on -EINVAL and propagate other errors), and use that
>        in amd_bram_rproc and xlnx_r5_remoteproc, or

I would prefer to go with the common helper that returns 0 on -EINVAL
and propagates other errors, and apply it to other architectures such
as stm32, rcar, imx and imx_dsp.

>      - drop the custom AMD parse_fw() path and use rproc_elf_load_rsc_table()
>        directly, which would make the resource table mandatory there.
>
>   Also, for the plain map/unmap helper, should I keep the cleanup scoped to
>   the drivers directly involved here, or would you prefer that I fold the
>   other exact-match users (rcar, st, stm32, imx, imx_dsp) into the same
>   cleanup patch as well?
>

Proceed with the other exact-match as well.

>   I want to make sure I take the direction you prefer before respinning.

I think the best approach is to send out a cleanup patchset with the
above changes, followed by another respin of this set once the cleanup
is merged.

Thanks for being proactive.

>
>   Thanks,
>   Ben
> >
> >> +
> >> +static const struct rproc_ops amd_bram_rproc_ops = {
> >> +    .prepare        = amd_bram_rproc_prepare,
> >> +    .start          = amd_bram_rproc_start,
> >> +    .stop           = amd_bram_rproc_stop,
> >> +    .load           = rproc_elf_load_segments,
> >> +    .sanity_check   = rproc_elf_sanity_check,
> >> +    .get_boot_addr  = rproc_elf_get_boot_addr,
> >> +    .parse_fw       = amd_bram_rproc_parse_fw,
> >> +};
> >> +
> >> +static int amd_bram_rproc_probe(struct platform_device *pdev)
> >> +{
> >> +    struct device *dev = &pdev->dev;
> >> +    struct amd_bram_rproc *priv;
> >> +    const char *fw_name = NULL;
> >> +    struct rproc *rproc;
> >> +    int ret;
> >> +
> >> +    ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> >> +    if (ret < 0 && ret != -EINVAL)
> >> +            return dev_err_probe(dev, ret,
> >> +                                 "failed to parse firmware-name property\n");
> >> +
> >> +    rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
> >> +                             fw_name, sizeof(*priv));
> >> +    if (!rproc)
> >> +            return -ENOMEM;
> >> +
> >> +    priv = rproc->priv;
> >> +    priv->dev = dev;
> >> +
> >> +    /* Get the processor clock */
> >> +    priv->clk = devm_clk_get(dev, NULL);
> >> +    if (IS_ERR(priv->clk))
> >> +            return dev_err_probe(dev, PTR_ERR(priv->clk),
> >> +                                 "failed to get clock\n");
> >> +
> >> +    /*
> >> +     * Keep the processor in reset until remoteproc has finished loading
> >> +     * firmware into the executable memory window described by reg and
> >> +     * translated through the parent bus ranges property.
> >> +     */
> >> +    priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> >> +    if (IS_ERR(priv->reset))
> >> +            return dev_err_probe(dev, PTR_ERR(priv->reset),
> >> +                                 "failed to get reset gpio\n");
> >> +
> >> +    rproc->auto_boot = false;
> >> +
> >> +    ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> >> +    if (ret)
> >> +            return dev_err_probe(dev, ret, "failed to set DMA mask\n");
> >> +
> >> +    platform_set_drvdata(pdev, rproc);
> >> +
> >> +    ret = devm_rproc_add(dev, rproc);
> >> +    if (ret)
> >> +            return dev_err_probe(dev, ret, "failed to register rproc\n");
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static const struct of_device_id amd_bram_rproc_of_match[] = {
> >> +    { .compatible = "xlnx,zynqmp-bram-rproc" },
> >> +    { /* sentinel */ },
> >> +};
> >> +MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
> >> +
> >> +static struct platform_driver amd_bram_rproc_driver = {
> >> +    .probe = amd_bram_rproc_probe,
> >> +    .driver = {
> >> +            .name = "amd-bram-rproc",
> >> +            .of_match_table = amd_bram_rproc_of_match,
> >> +    },
> >> +};
> >> +module_platform_driver(amd_bram_rproc_driver);
> >> +
> >> +MODULE_DESCRIPTION("AMD BRAM-based Remote Processor driver");
> >> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.34.1
> >>
> >
>
