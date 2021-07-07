Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4584DC07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 06:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AEC561CB3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 06:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhGGGKR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 02:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhGGGKR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 02:10:17 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A185C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 23:07:36 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l26so2152930oic.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jul 2021 23:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iITT3OM3QAOlRz73G76UNhloHavCTFtFKKzpNQgR/rQ=;
        b=Osg4fqFnzFDHxp1Kkyo39lpmmD7RYPwB3nTQGR88+pwFmbbIBkm1corznwBvpFopv8
         hBCUZsirjr23A4bR/+zl75g3PFC0MiOokmO1AUqo+ZbRvrhmOVrTwAY0OHecpJdIBkst
         uAFutys8qzjUIdaLF6kjy0yYLxaGqi874IbfzqK00ebUprYUSTMh9RiSkvzzYdkIsPNz
         s8AdzeC636QM/JmsyiZk5YJU28YD+UUTf+h+wib7iN4XXwz4EEs2JQDILFtKipmJfLe/
         2cNtkP3su1FEYVlh+Y2ayxXuVQ2ZxgD54A4hvUyfoswphkmoI0AeL4daPxjkca0hda0j
         MrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iITT3OM3QAOlRz73G76UNhloHavCTFtFKKzpNQgR/rQ=;
        b=JU+xclLndnfySlhO7pUmnUX8A1CvNUzBCiCDk21ISx8MYi3nbuq7UV9BJ9nwTrlAMf
         TOKNqTunAOIAwRuqCA6BZQfZ8WQXBkmhTm/SexWkiuexJA+a+eInFgDQzFcCyE55Ey6B
         FqvQblM58eJ+br/J5JLbKoZwr78QoV8qsL4fhodvPOcsInb8ASIp8JuJRX3OH5Hw7uF5
         XMmMcoYWaZnBrVd3TqBevi5ZLxtcsVkjszPSEUrwhZU69g5R/pvlMQogRSiOKkNKWh1g
         OW/mxYMQB7+Hn8BKftFDDpu4j+tAX3wabbL93tGBQBlkV0jxDHjccRjFCCn/Bt0HZPIS
         aD+Q==
X-Gm-Message-State: AOAM5309njlcq9gX69pMPC2VuRWHza/DN2WlYoIeI79u755JxU47M6tn
        mTTrdGGe5w6++3DrD6bgn96LEh5X61J6PSGKG+E=
X-Google-Smtp-Source: ABdhPJxAtyZqCe90LMPYIcEa/UR9c95iTE4KWlmi8q1svhgzPjs8BfansX2corj8TsSzI4wmQ61w+DSufcOKBQwpKEE=
X-Received: by 2002:aca:4c2:: with SMTP id 185mr3651222oie.47.1625638055835;
 Tue, 06 Jul 2021 23:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210706142335.952858-1-aisheng.dong@nxp.com> <20210706142335.952858-2-aisheng.dong@nxp.com>
 <DB6PR0402MB2760779960CBC749DAEA6975881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760779960CBC749DAEA6975881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 7 Jul 2021 14:05:39 +0800
Message-ID: <CAA+hA=RjfVwyM=LfN6vJxS_aDhN2iaKi=YCSvopB_KpwfOjVcQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: fix TCM io memory type
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

On Wed, Jul 7, 2021 at 10:20 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH 2/4] remoteproc: imx_rproc: fix TCM io memory type
> >
> > is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> > is_iomem to da_to_va"), but the driver seemed missed to provide the io type
> > correctly.
> > This patch updates remoteproc driver to indicate the TCM on IMX are io
> > memories. Without the change, remoteroc kick will fail.
>
> All ATT_OWN memory are mapped using devm_ioremap, so only mark
> TCM as io memories is not enough.
>
> You could force all as iomem or update to use other map variants.
>

Will update, thanks.

Regards
Aisheng

> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
>
> The i.MX8MN/Q is later that the patch, please update the fix.
>
> Regards,
> Peng.
>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 27 +++++++++++++++------------
> >  1 file changed, 15 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index d88f76f5305e..752f8ab258cf
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
> >       for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
> > --
> > 2.25.1
>
