Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3DEC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Oct 2021 02:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF12B60E53
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Oct 2021 02:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhJMCXV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Oct 2021 22:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhJMCXT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Oct 2021 22:23:19 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE25DC061570;
        Tue, 12 Oct 2021 19:21:16 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id z24so1236355qtv.9;
        Tue, 12 Oct 2021 19:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8zd2M5Mo8dgVyQJrPteXTghqDfop7iR99NgzdTUTYYg=;
        b=MK8cN1OuRqHY0cWjM6jkuuTCO31bXWxJs/x7GeFmCNEhj2oig1G6xgJ5f7YVZ+FuHI
         GKwlkBCnT9z4mBSYexipiFj9ss98R3XfiGPbQO1O9zwNsg2OYoJ2a6q7QlGm9x7l/Qny
         L9xA/aijQDziTVAGvf6h71mWEq/Ug3Xd6hgAPnsDJcvvZiF31QSKK677NCkT+sXmOHwB
         zMo5FEJ8aWwgEEFCvSAjw7JYFHnIio/YhIXFT4P88GjaetqGU+j3XXaOzINa7CUFQ0O2
         qY5dSsZoxo18Gs92nwZriqH+dKM2Kjlkb8VBnbENyQhCkfOMpMFNTNom8gaCB9mbn+wG
         OQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8zd2M5Mo8dgVyQJrPteXTghqDfop7iR99NgzdTUTYYg=;
        b=YhiddDCeEx/ZCKyYwP64AYAT46vYdy7bMK3OFQUQn+3OSC9Fu5s5dBR0QYro7qUMlQ
         cHvxIsGJOQEKUbAWllD57Re2ZzMAHP8LMPHwMmjZ5zxp4BFqmFV+FqI3syGNdBcqcpII
         uRGqd/+Qu2DbNmJRN8+Py3zB2JzOQAKyaoleC72j4tuWGjSUrxnWggh+vB5O+7tEe5IG
         BO9dmXibDuEdx3ELdyb258zzgVLNJZ6wewW/rcFU7abnKQDvo7U+C9du2rkjjYVEjHDZ
         4UXTwcwSztJVPItEuNP8YDLGDp1P2/0CetZTkUXWR8r2SB0Ir+RJKskygCj3YAUmWYG8
         Yz3g==
X-Gm-Message-State: AOAM532tM+1HsuZXckk8aW1oW979DUPqU1iCyJ5Y9r5eMENPUbZQqYqk
        QXWqA6JK8nYnNg3Ixlpa+d6LkuS5JirIoEklPADqkhk+08A=
X-Google-Smtp-Source: ABdhPJwHx5htD99ZV0Vlnxw09358J8aiSKSK5sydDlZS2SAGRJgOrgKQVpZfkWlJdsu27L2KuhNChuxfdlrfvAIHVLk=
X-Received: by 2002:ac8:1e06:: with SMTP id n6mr25870970qtl.365.1634091675865;
 Tue, 12 Oct 2021 19:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <1633944015-789-1-git-send-email-shengjiu.wang@nxp.com>
 <1633944015-789-4-git-send-email-shengjiu.wang@nxp.com> <20211012170601.GB4010675@p14s>
In-Reply-To: <20211012170601.GB4010675@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Wed, 13 Oct 2021 10:21:04 +0800
Message-ID: <CAA+D8AO7+_7xOhoeDCy_WOwrKMvqqL2w+gv=D7PCSD7Aji9jLQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Oct 13, 2021 at 1:06 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Mon, Oct 11, 2021 at 05:20:14PM +0800, Shengjiu Wang wrote:
> > Provide a basic driver to control DSP processor found on NXP i.MX8QM,
> > i.MX8QXP, i.MX8MP and i.MX8ULP.
> >
> > Currently it is able to resolve addresses between DSP and main CPU,
> > start and stop the processor, suspend and resume.
> >
> > The communication between DSP and main CPU is based on mailbox, there
> > are three mailbox channels (tx, rx, rxdb).
> >
> > This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/Kconfig         |   11 +
> >  drivers/remoteproc/Makefile        |    1 +
> >  drivers/remoteproc/imx_dsp_rproc.c | 1206 ++++++++++++++++++++++++++++
> >  3 files changed, 1218 insertions(+)
> >  create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index dcb87a366ec7..f2e961f998ca 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -34,6 +34,17 @@ config IMX_REMOTEPROC
> >
> >         It's safe to say N here.
> >
> > +config IMX_DSP_REMOTEPROC
> > +     tristate "i.MX DSP remoteproc support"
> > +     depends on ARCH_MXC
> > +     depends on HAVE_ARM_SMCCC
> > +     select MAILBOX
> > +     help
> > +       Say y here to support iMX's DSP remote processors via the remote
> > +       processor framework.
> > +
> > +       It's safe to say N here.
> > +
> >  config INGENIC_VPU_RPROC
> >       tristate "Ingenic JZ47xx VPU remoteproc support"
> >       depends on MIPS || COMPILE_TEST
> > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > index ce1abeb30907..0ac256b6c977 100644
> > --- a/drivers/remoteproc/Makefile
> > +++ b/drivers/remoteproc/Makefile
> > @@ -12,6 +12,7 @@ remoteproc-y                                += remoteproc_virtio.o
> >  remoteproc-y                         += remoteproc_elf_loader.o
> >  obj-$(CONFIG_REMOTEPROC_CDEV)                += remoteproc_cdev.o
> >  obj-$(CONFIG_IMX_REMOTEPROC)         += imx_rproc.o
> > +obj-$(CONFIG_IMX_DSP_REMOTEPROC)     += imx_dsp_rproc.o
> >  obj-$(CONFIG_INGENIC_VPU_RPROC)              += ingenic_rproc.o
> >  obj-$(CONFIG_MTK_SCP)                        += mtk_scp.o mtk_scp_ipi.o
> >  obj-$(CONFIG_OMAP_REMOTEPROC)                += omap_remoteproc.o
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > new file mode 100644
> > index 000000000000..63749cfcf22f
> > --- /dev/null
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -0,0 +1,1206 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright 2021 NXP
>
> I just noticed the '//' on the copyright line.  Please send a patch to change
> that to C style comments.
>
> Thanks,
> Mathieu

Ok, will send a patch for it.

best regards
Wang Shengjiu
