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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E3DC07E9A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 10:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3133B61362
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 10:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbhGNKZ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Jul 2021 06:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238728AbhGNKZ4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Jul 2021 06:25:56 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBFDC06175F
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jul 2021 03:23:05 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id m18so1697584oie.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jul 2021 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5nhr8B0n0RJGETsMiDfrGu6uX0+jGDPR9/ExJgu53y4=;
        b=Sf8uihogrC75HgQHqsvXQsonGBlCv/tXwN7fVcXbpxL/ZsetpS4CMr29/U7GDlUbN1
         wwz8EHI8nDQ+iDXbm9YF1Ig1GF4riNbxemavcNZlfOxHSRwT/gHV3MXB5iEc8F4GduLQ
         sbw0Pqrg6khIWmmVhOcpEdgEznZ1PsE5vF51uoROyWTqq3LqU65Dgzh8S910Hj2Sqm4J
         51ynKkIgMohES2YLAlrZT69TX06QpGba67o/3sEzKHbSdpbqw8xLsBDXauD6bJmdzHib
         x2Qa3cJvldfBE+ysY4x7rvHZUvK4ydmgvECqjx8KIkaaCHu7TmhjHwdmlWEpBdv3F/D9
         h/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5nhr8B0n0RJGETsMiDfrGu6uX0+jGDPR9/ExJgu53y4=;
        b=gIWbK2fs2lC039I2G0ijf+elK8lrRZI599iprs44a6qTPSzQc+r5LgujawGjiLgeY0
         L0awM/3P3+TUN8qSbEwh1wm357tzRdGFioATygT3Sp5ulFHTekOmg5ecpm8EfkL9OJqX
         gnPXJono1azMm77MTuOtszuusdecRyekxi2pfDUMEot2BtlfDB2L0Jm7mpUh/Lnko36A
         I/x5a8T/TvpQZqjNE424IsahCzgWXZVe9GD7FmujoJuPghbueFoNn3hdVEM6ovGU/B20
         N04EK8O3QljpsezCcvufY40ugmaxS8rdixriyyWwjT96D9rPRDI9v57zr20exeNjc0GI
         culw==
X-Gm-Message-State: AOAM5323SGgiqaMz5bE3UL7SPQiH64liXJGXVPWbgYyGOOlsm4CgQEac
        LldDHVs4yPgaErEsrEK+hsQU94OuTvFhpbWe4KY=
X-Google-Smtp-Source: ABdhPJzraJn5LUt25CrK6LSqeATY94HhjXYPgMVCP/fOOsvRlLeIMv3k9hA0lpEfK/TPME0lCJKNguomF5hAbrVya0E=
X-Received: by 2002:aca:d64d:: with SMTP id n74mr2337174oig.47.1626258184545;
 Wed, 14 Jul 2021 03:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
 <20210707094033.1959752-5-aisheng.dong@nxp.com> <20210713170638.GA1816225@p14s>
 <DB6PR0402MB27606494C59B5DEC222639B088139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB27606494C59B5DEC222639B088139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 14 Jul 2021 18:21:04 +0800
Message-ID: <CAA+hA=SZtJf-9Ajhg1a287WVkvGOGY3N8j5huxNV=pXBiMGvPg@mail.gmail.com>
Subject: Re: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for dram
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 14, 2021 at 8:59 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Mathieu,
>
> > Subject: Re: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc
> > for dram
> >
> > On Wed, Jul 07, 2021 at 05:40:33PM +0800, Dong Aisheng wrote:
> > > DRAM is not io memory, so changed to ioremap_wc. This is also aligned
> > > with core io accessories. e.g. memcpy/memset and cpu direct access.
> > >
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores
> > > booted before Linux Kernel")
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > v1->v2:
> > >  * new patch
> >
> > It's a new patch and yet Peng's RB tag is already on it...
>
> Aisheng's reply in the other email.
> "
> Above two lines were added by mistake. (copied from patch 4)
> I'm going to wait for review comments first and resend with changes if any.
>
> Regards
> Aisheng
> "
>
> >
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index ff620688fad9..4ae416ba5080
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc
> > *priv,
> > >                     break;
> > >
> > >             /* Not use resource version, because we might share region */
> > > -           priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start,
> > resource_size(&res));
> > > +           priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
> > res.start,
> > > +resource_size(&res));
> >
> > How was it working before?
>
> we took all memory used by M-core as io memory, including TCM/SRAM/DRAM.
>
> Will it really work for all platforms and was this
> > extensively tested?
>
> Aisheng may confirm, I not test this patchset.
>
> >
> > Peng - I will need an explicit reply from you that you are in agreement with
> > this change.
>
> I not test, but it should work per my understanding.
> i.MX TCM area has limitation that not use ioremap_wc, DRAM has no such
> limitation. Just think this not deserve a fix tag.
>

I tested with MX8MQ, i could find more to test although it should work
theoretically.
Why adding fixes tag is because using normal memory accessories (e.g. memset)
for io memory (device type) may have issues.
Does it make sense?

Regards
Aisheng


> > I will also need you to review patch 01 and 02 of this set.
>
> Sure, I'll review.
>
> Thanks,
> Peng.
>
> >
> > Thanks,
> > Mathieu
> >
> > >             if (!priv->mem[b].cpu_addr) {
> > >                     dev_err(dev, "failed to remap %pr\n", &res);
> > >                     return -ENOMEM;
> > > --
> > > 2.25.1
> > >
