Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E06C07E9C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 10:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 824336101B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 10:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239000AbhGNKUV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Jul 2021 06:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238728AbhGNKUT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Jul 2021 06:20:19 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD4BC061762
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jul 2021 03:17:27 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so1917959otp.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jul 2021 03:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qXMlzwMoUDg31tv1kvhnH0gOtgvLARuFTA+GKHY0go4=;
        b=uYd2aoQ3J4KehFHyQ9s/a6R33yPmRIuu0jYGaXHPDNqT8tsF9lKCPKDlvCLg4U5mSC
         jjQqSe6mjAqb4GR8i8f9nkeYBg8sFQkhmrYN9IHLAsjHlp79JAIUJxOrkKxYzhJ+Lba8
         anZIap3YYWldmOCMVIvPVUzP1T4HGUIYjOhalnVaGscFY1SwP/F2CAf4Xg1mKawqIHiI
         Y3nFJuxlORPnSM9WbpJ4BcYpPGYKbOqH1HHhceKE1DHy0X4oG/U34yquvKU3bYJctRHD
         I/i1H7Z07gKHUTsB00cjCPNREGUBz4HPX9HM5JZHKqHPevR3dPhCugVr94qUsZeSJ9LI
         wIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXMlzwMoUDg31tv1kvhnH0gOtgvLARuFTA+GKHY0go4=;
        b=VkXubl9tXpDoe0DH/F17unSO7vs7BCizHNj01/JZsc1GJF0pR/b2x34ytMivQK2xDL
         h1Lmr8KHfbZDiLzdQEgbnbN1fkAv0XpzX6EUUKrbkHLtZF2UbgwaZUL8s9DQsRLkbnR0
         EmcoEsBEj7GRPzXmoa2x+MmWR6Vg9H2XoaNKsa+bMN+3XR93AB1iYNNkxTEHexlTa6EE
         ijtsyharSMWMHOFpA3bNfZNPlnkUCflFaiLP7iX7F2Y+Jm63oSvpHBB0X0XvfYDw4A2a
         /spjk5wc4QLAK7IdKXx8+dAzMR9/trGMKNuT0r4EAcZJyuyIaLGjjiUVoW9rzIfWXZ1c
         3AYQ==
X-Gm-Message-State: AOAM531abNsOMo04fyMA5UfaZrzf+2u9G/iI8p624W8RKdmtRtBJtH9s
        O54pnmh2t9CP8gSAjCswZZCBURAvyH/qPbpLS3c=
X-Google-Smtp-Source: ABdhPJw0nGS342RPoIWF9OAyS7wdcY9jrwxXXVmyVJ9g1/IEqQplejQwkA+QLingUTRoTsmrdL8Jhkd/OxFBDRwV/RA=
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr7434876otj.52.1626257847007;
 Wed, 14 Jul 2021 03:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
 <20210707094033.1959752-5-aisheng.dong@nxp.com> <20210713170638.GA1816225@p14s>
In-Reply-To: <20210713170638.GA1816225@p14s>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 14 Jul 2021 18:15:26 +0800
Message-ID: <CAA+hA=S1EuF9u9T-_RP5BLJq-MXGsLSWvC3wwQJ_KPTEjXD8+A@mail.gmail.com>
Subject: Re: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for dram
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Ohad Ben Cohen <ohad@wizery.com>, bjorn.andersson@linaro.org,
        Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 14, 2021 at 1:06 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Jul 07, 2021 at 05:40:33PM +0800, Dong Aisheng wrote:
> > DRAM is not io memory, so changed to ioremap_wc. This is also
> > aligned with core io accessories. e.g. memcpy/memset and cpu direct
> > access.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > v1->v2:
> >  * new patch
>
> It's a new patch and yet Peng's RB tag is already on it...
>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index ff620688fad9..4ae416ba5080 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> >                       break;
> >
> >               /* Not use resource version, because we might share region */
> > -             priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
> > +             priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
>
> How was it working before?  Will it really work for all platforms and was this
> extensively tested?

Here it is only used for accessing resource tables in DRAM which is
published by M core.

Why it works before is because:
1. the default memory access in remoteproc core (.e.g memcpy or direct
access by pointer
by CPU) seems also work well even it's device memory type mapped by
devm_ioremap.
e.g. cpu direct access
offset = rproc->table_ptr->offset[i]

2.  It will not work with meset() in rproc_elf_load_segments() which
has cache operations internally.
e.g. arch/arm64/lib/memset.S
However, it's lucky that for IMX cases, the resource table in DRAM are
currently used by early boot
(e.g. uboot/scfw loading M4 firmware), no chance to run into
rproc_elf_load_segments(),
so no issues so far.

Then the question is should we change the mapping type of resource
table mem to normal
memory (ioremap_wc) as remoteproc core are using normal memory accessories?

I guess we should do that, that's how this patch comes out.

Regards
Aisheng

>
> Peng - I will need an explicit reply from you that you are in agreement with
> this change.  I will also need you to review patch 01 and 02 of this set.
>
> Thanks,
> Mathieu
>
> >               if (!priv->mem[b].cpu_addr) {
> >                       dev_err(dev, "failed to remap %pr\n", &res);
> >                       return -ENOMEM;
> > --
> > 2.25.1
> >
