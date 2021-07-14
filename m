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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7119CC07E9C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 10:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D349613C9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 10:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238826AbhGNK35 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Jul 2021 06:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237998AbhGNK3y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Jul 2021 06:29:54 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EF6C06175F
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jul 2021 03:27:02 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so2027691otl.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jul 2021 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+tfBuHb7/kW15VVhZVOcs3ykTV6M2hEc298Cb8pdFs=;
        b=CT/5sKTekuX48StStI0OKf2LFfgOYjHAUilolN36r/Rhhvvfmw0azbYeir6bPIB046
         uZ9g99EK0jrDZBcAqneA3LDf7d7bYXvJTMmTe/Oxz8qrMFh5+et3ijGQjLnTkz9kxJ3j
         3xmUC4zWzFym/r+9E1qISOqPRyupMOtXtgzwQqCIFer9QeY88Q9rSRLUeq0O+NwAQOPA
         qB4RagMX+ykVW9mbbcdOBoF1TklOBilxbFvgaHmTC6kN+xA5jBNPaP5dYz7zaaCnTkbb
         j69c/XnV/xZ+PavH+DZka+ToafHAMHkek6MtHuAlGopDEtuL4vwYYZOMVGr4p8sHGpqF
         DUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+tfBuHb7/kW15VVhZVOcs3ykTV6M2hEc298Cb8pdFs=;
        b=fBN07svG0tCPfD0xMJoQbxJ0HkinjFl0G9cIlr9783bHpZsO3QVfs2ScX2rdM+m+f6
         2Dzv2o4M11nK4lRPLdAOIy73hyYQpXfHsQ+Ds/R6QEYDITjOutXe/YBIGqsEQz/F5+cZ
         Ndla5k3XR9g3BnKhWqr3lkAyPt5iDVK32eCI8nDMmDVvRiuKJRyb3P5dwMmrV3M/FydE
         uj/XkFI99CWYTGLyRLaDi9EAWGi6l2xoQgU3/mG5KWh9lc7iJ5VCP8GUIqqyK2OGPf2c
         josIbUir5SqvbV+6UnmX0S2L0Zc1Xbrj53G0L03fMtBEF0Xvkl7nBNaaxNcypMiM9Fsq
         QwRQ==
X-Gm-Message-State: AOAM530/YVLHkWiz87wL84ZlN6chy5eKpZHYljbbGNWznFR81wzY9CFx
        yYZ8+BkMy47TwqFceNRT35BVnbvE6WH4IfLGMIs=
X-Google-Smtp-Source: ABdhPJzUbCa3RFYROZmpAKbkzWB0B8WaYQQ2lOejtky5xwZ8qKT6M5NE6pfRm3/JiPNA6GYbY58Jqoj6Zk/npsWrnwc=
X-Received: by 2002:a05:6830:160c:: with SMTP id g12mr7508699otr.118.1626258422102;
 Wed, 14 Jul 2021 03:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
 <20210707094033.1959752-2-aisheng.dong@nxp.com> <DB6PR0402MB27600B2B114AC2FBE6E05EBF88139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB27600B2B114AC2FBE6E05EBF88139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 14 Jul 2021 18:25:02 +0800
Message-ID: <CAA+hA=SkiVtWaPD+iw32n3KGA4BXYCPW1Z5FOMERZkLZy69CYA@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] remoteproc: imx_rproc: fix TCM io memory type
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 14, 2021 at 9:12 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH V2 2/5] remoteproc: imx_rproc: fix TCM io memory type
> >
> > is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> > is_iomem to da_to_va"), but the driver seemed missed to provide the io type
>
> missed->missing
>
> > correctly.
> > This patch updates remoteproc driver to indicate the TCM on IMX are io
> > memories. Without the change, remoteroc kick will fail.
>
> remoteroc->remoteproc
>

Will fix, thanks.

> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Fixes: d59eedc0e408 ("remoteproc: imx_rproc: support i.MX8ULP")
>
> Drop this fix. 8ULP only support ROM loaded M33 images, no
> chance to let Kernel load M33 image.

Will drop, thanks

Regards
Aisheng

>
> > Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> > v1->v2:
> >  * using ioremap_wc for non TCM memory
> > ---
> >  drivers/remoteproc/imx_rproc.c | 35 ++++++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index d88f76f5305e..71dcc6dd32e4
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -71,6 +71,7 @@ struct imx_rproc_mem {
> >  /* att flags */
> >  /* M4 own area. Can be mapped at probe */
> >  #define ATT_OWN              BIT(1)
> > +#define ATT_IOMEM    BIT(2)
> >
> >  /* address translation table */
> >  struct imx_rproc_att {
> > @@ -117,7 +118,7 @@ struct imx_rproc {
> >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >       /* dev addr , sys addr  , size      , flags */
> >       /* ITCM   */
> > -     { 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> > +     { 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >       /* OCRAM_S */
> >       { 0x00180000, 0x00180000, 0x00009000, 0 },
> >       /* OCRAM */
> > @@ -131,7 +132,7 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mn[] = {
> >       /* DDR (Code) - alias */
> >       { 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> >       /* DTCM */
> > -     { 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +     { 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >       /* OCRAM_S - alias */
> >       { 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >       /* OCRAM */
> > @@ -147,7 +148,7 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mn[] = {  static const struct imx_rproc_att
> > imx_rproc_att_imx8mq[] = {
> >       /* dev addr , sys addr  , size      , flags */
> >       /* TCML - alias */
> > -     { 0x00000000, 0x007e0000, 0x00020000, 0 },
> > +     { 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
> >       /* OCRAM_S */
> >       { 0x00180000, 0x00180000, 0x00008000, 0 },
> >       /* OCRAM */
> > @@ -159,9 +160,9 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mq[] = {
> >       /* DDR (Code) - alias */
> >       { 0x10000000, 0x80000000, 0x0FFE0000, 0 },
> >       /* TCML */
> > -     { 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
> > +     { 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> >       /* TCMU */
> > -     { 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +     { 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> >       /* OCRAM_S */
> >       { 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >       /* OCRAM */
> > @@ -199,12 +200,12 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx7d[] = {
> >       /* OCRAM_PXP (Code) - alias */
> >       { 0x00940000, 0x00940000, 0x00008000, 0 },
> >       /* TCML (Code) */
> > -     { 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> > +     { 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >       /* DDR (Code) - alias, first part of DDR (Data) */
> >       { 0x10000000, 0x80000000, 0x0FFF0000, 0 },
> >
> >       /* TCMU (Data) */
> > -     { 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> > +     { 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >       /* OCRAM (Data) */
> >       { 0x20200000, 0x00900000, 0x00020000, 0 },
> >       /* OCRAM_EPDC (Data) */
> > @@ -218,18 +219,18 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx7d[] = {  static const struct imx_rproc_att
> > imx_rproc_att_imx6sx[] = {
> >       /* dev addr , sys addr  , size      , flags */
> >       /* TCML (M4 Boot Code) - alias */
> > -     { 0x00000000, 0x007F8000, 0x00008000, 0 },
> > +     { 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
> >       /* OCRAM_S (Code) */
> >       { 0x00180000, 0x008F8000, 0x00004000, 0 },
> >       /* OCRAM_S (Code) - alias */
> >       { 0x00180000, 0x008FC000, 0x00004000, 0 },
> >       /* TCML (Code) */
> > -     { 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> > +     { 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >       /* DDR (Code) - alias, first part of DDR (Data) */
> >       { 0x10000000, 0x80000000, 0x0FFF8000, 0 },
> >
> >       /* TCMU (Data) */
> > -     { 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> > +     { 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >       /* OCRAM_S (Data) - alias? */
> >       { 0x208F8000, 0x008F8000, 0x00004000, 0 },
> >       /* DDR (Data) */
> > @@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)  }
> >
> >  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
> > -                            size_t len, u64 *sys)
> > +                            size_t len, u64 *sys, bool *is_iomem)
> >  {
> >       const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >       int i;
> > @@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv,
> > u64 da,
> >                       unsigned int offset = da - att->da;
> >
> >                       *sys = att->sa + offset;
> > +                     if (is_iomem)
> > +                             *is_iomem = att->flags & ATT_IOMEM;
> >                       return 0;
> >               }
> >       }
> > @@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc,
> > u64 da, size_t len, bool *i
> >        * On device side we have many aliases, so we need to convert device
> >        * address (M4) to system bus address first.
> >        */
> > -     if (imx_rproc_da_to_sys(priv, da, len, &sys))
> > +     if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
> >               return NULL;
> >
> >       for (i = 0; i < IMX_RPROC_MEM_MAX; i++) { @@ -553,8 +556,12 @@
> > static int imx_rproc_addr_init(struct imx_rproc *priv,
> >               if (b >= IMX_RPROC_MEM_MAX)
> >                       break;
> >
> > -             priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> > -                                                  att->sa, att->size);
> > +             if (att->flags & ATT_IOMEM)
> > +                     priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> > +                                                          att->sa, att->size);
> > +             else
> > +                     priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
> > +                                                             att->sa, att->size);
> >               if (!priv->mem[b].cpu_addr) {
> >                       dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size,
> > att->sa);
> >                       return -ENOMEM;
>
>
> Besides the upper comments, looks ok to me.
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> > --
> > 2.25.1
>
