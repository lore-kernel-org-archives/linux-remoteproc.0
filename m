Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9F3C433E6
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Jan 2021 21:02:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B67C23106
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Jan 2021 21:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbhAPVCN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 16 Jan 2021 16:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbhAPVCM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 16 Jan 2021 16:02:12 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13F5C061573;
        Sat, 16 Jan 2021 13:01:31 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id l9so12582714ejx.3;
        Sat, 16 Jan 2021 13:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6fot4S0o8FzBACw00nl0yHU0eEOQr6GTvAJmo+zENQ=;
        b=kEh8eR+7T5R8d2o7uD/lJHuY8dv8i1NNXBpsp2Kz30djqxD7PIinIv/GSxaERAsJpg
         Qr0hFfmaigLfAsv5JuvxCUBLYzpgQYycqh9F5C0XcuRdgYrvYzeG9jyILTswpMT/YdiH
         /dHlEryL8aAmxfVSM7wxBoXNF1RJpruY1SYHCUz/REnMjrP2fn84U5XQp2BWwKazYlUC
         jEOjzxN3MikFrF5Km1Pd99tN7xpYFveHz7rurvd1xnSkWsS0UNssSj9zd0w0x7W3Tz94
         I4hOFNF12VhfALTvQKJ6uJQfw7aQPFbYs2mTGN/nssOQXUFN9rOj18I2w8BO3gcdbD6q
         qqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6fot4S0o8FzBACw00nl0yHU0eEOQr6GTvAJmo+zENQ=;
        b=ufkMVxnqegcm3wyPYxKUGiHBYvhm8T8TyEQSSYLbX8aY14juGFTar/9kub8JHtEvfT
         kBB73R/HD37HQTe7vb918gh988169QJ5PNZt1paLg1s+poejwuaBCvL8OyyrHZmvlHn9
         mWoI442KxiZHCinSi4/orAV/5BqHT86345jIfNDxdld9/6IkV5Q9xHN9va0EzklLL+46
         Ikl6nAT7z6FpXvb6OP5X4RJTdGKlfaseSfKCbpl24l/asVD6jSIw+Bfc1NRBFC10+5Li
         LnaYWPGTumiGgAZ6EPXsAmvSFOoOAuJZqaCgqyabqXM6xJlH5GIpeabF4Fv28ChBuvWp
         J/+Q==
X-Gm-Message-State: AOAM532prfrxSEGiDGy2aeWFFKZviCV4hTUEnR1ebJR08PnAYOwNKNCa
        AYIIuDJi+WjwII99jk40n8wjVPHQI/SdnwlMmyw=
X-Google-Smtp-Source: ABdhPJwi6ie1Yk7L9E3ktUS9hNm/69jCzQMPLiaiVv9fUfCeBpf1UPMrxU+hF3OIde5B0EuEm426RXWdLPC1C9q7KzM=
X-Received: by 2002:a17:907:3e27:: with SMTP id hp39mr8452064ejc.187.1610830890430;
 Sat, 16 Jan 2021 13:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-5-martin.blumenstingl@googlemail.com> <20210112234330.GA192175@xps15>
In-Reply-To: <20210112234330.GA192175@xps15>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 16 Jan 2021 22:01:19 +0100
Message-ID: <CAFBinCCfiC9a6u2qAs8-pEUB299C=vHut5=1ZPVPoCs0w-+r-Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org, ohad@wizery.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

thank you for taking the time to go through my patch!

On Wed, Jan 13, 2021 at 12:43 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
[...]
> > +       If unusre say N.
>
> s/unusre/unsure
godo catch, noted.

[...]
> > +#include <linux/property.h>
>
> Is it possible for this to go after platform_device.h?
I think so, not sure why this is not in alphabetical order

[...]
> > +#define AO_CPU_CNTL                                  0x0
> > +     #define AO_CPU_CNTL_MEM_ADDR_UPPER              GENMASK(28, 16)
> > +     #define AO_CPU_CNTL_HALT                        BIT(9)
> > +     #define AO_CPU_CNTL_UNKNONWN                    BIT(8)
> > +     #define AO_CPU_CNTL_RUN                         BIT(0)
>
> Any reason for the extra tabulation at the beginning of the lines?
not really, I think I did the same thing as in
drivers/iio/adc/meson_saradc.c where the register itself starts at the
beginning of the line and each bit(mask) starts indented
I'll change this for the next version

[...]
> > +#define MESON_AO_RPROC_SRAM_USABLE_BITS                      GENMASK(31, 20)
>
> As per your comments in the cover letter I assume we don't know more about this?
unfortunately not, but I'll still try to get some more information
from someone at Amlogic.
That said, this is "legacy" hardware for them so I can't make any promises.

> > +#define MESON_AO_RPROC_MEMORY_OFFSET                 0x10000000
> > +
> > +struct meson_mx_ao_arc_rproc_priv {
> > +     void __iomem            *remap_base;
> > +     void __iomem            *cpu_base;
> > +     unsigned long           sram_va;
> > +     phys_addr_t             sram_pa;
> > +     size_t                  sram_size;
> > +     struct gen_pool         *sram_pool;
> > +     struct reset_control    *arc_reset;
> > +     struct clk              *arc_pclk;
> > +     struct regmap           *secbus2_regmap;
> > +};
> > +
> > +static int meson_mx_ao_arc_rproc_start(struct rproc *rproc)
> > +{
> > +     struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
> > +     phys_addr_t phys_addr;
> > +     int ret;
> > +
> > +     ret = clk_prepare_enable(priv->arc_pclk);
> > +     if (ret)
> > +             return ret;
> > +
> > +     writel(0, priv->remap_base + AO_REMAP_REG0);
> > +     usleep_range(10, 100);
>
> That's wonderful - here too I assume there is no indication as to why this is
> needed?
looking at this again: the vendor driver only has a delay after
pulsing the reset line
I will double check and hopefully remove this usleep_range and only
keep the one below (after pulsing the reset line)

[...]
> > +static void *meson_mx_ao_arc_rproc_da_to_va(struct rproc *rproc, u64 da,
> > +                                         size_t len)
> > +{
> > +     struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
> > +
> > +     if ((da + len) >= priv->sram_size)
> > +             return NULL;
>
> This isn't an index so it should be '>' rather than '>='.  You should be able to
> ask for the whole range and get it, which the above prevents you from doing.
>
> Moreover are you sure 'da' always starts at 0? This seems to be at odds with
> your comment in meson_mx_ao_arc_rproc_start() about converting from 0xd9000000
> to 0xc9000000.
thanks for both of these comments, I'll address this in the next version

[...]
> > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(priv->arc_reset)) {
>
> Looking at __devm_reset_control_get(), this should probably be IS_ERR_OR_NULL().
as far as I know only devm_reset_control_get_optional_exclusive (the
important bit is "optional" - I am using the "mandatory/not optional"
variant) can return NULL, all other variants return PTR_ERR or a valid
reset_control.


Best regards,
Martin
