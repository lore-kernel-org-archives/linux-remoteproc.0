Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8580EC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6560F610FF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhHEQek (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 12:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhHEQej (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 12:34:39 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08DEC061765
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 09:34:24 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso10816265pjf.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aHCFFFYn+n7U/BryuSKWap8A6aGkPSEbjdNxhyBSfHA=;
        b=JjBOx9U3RSMiX2u02rqk/GNzK4Qvm4TqzXOcaIAGsO389gB6MaSf1LAtg9Y+x8fzLh
         rVvPcBL93ylV+ptm6yYLrxSVVA8YPEo4IdSxc2axFG1yNh/DQb8gmnGIndme7EXxtgTM
         DLx4/NjDABvb1Zy8MrhCMz9SmcKNtSTdyO55r7bTuBvctUrUH3+3d8mkRNpeC4/iDwwE
         EVaIdcoGpyO4vVVzbDhfIC8aADTzQka6LjOLnMWEhq3ZhGaX3WelsCIRqcS1ZqTSoc/e
         5L0W5Zdo/iXaYORXuaZ/o1yPTTs+fctTAJoIBDZsjK6FaFiifRxCY6BMhPvgvgAZp2bk
         CH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aHCFFFYn+n7U/BryuSKWap8A6aGkPSEbjdNxhyBSfHA=;
        b=Ak9kyw+fqeE5JnbleXWHgV4oz39n8YMPPPl5XXGxQhUfMZOzx3JRGmRcKOwlgnc+5F
         G5r7qc/cPRA7LLVwURIYxcZyGVWsPdcmXPXPqH5Bt7CfdSPY/8N54Vqo9TXT9I/fAd4p
         mj1y5G8gV8RRc12KCWswqzDw2bYp0D7VZIaMEv00+Yg2iZRWF5mhDilUxSj6Ifl8q//Z
         S9A/MtHYR3350n0yOJwQFgpzsPl2QbdaaWoONSl16KAwFN+IEg6oHZJbsMCBx9fDsi5X
         CsDiw4BC9cTdfRLhj0WRM/DzuBPOksZmKvMbuTxsyheUvIhdhUzIXDRHnKlWuHfNpsiE
         d8ZA==
X-Gm-Message-State: AOAM532BblHRUtEKfYLXign2gy4f+ZPjYUIVAmlPW3nl6+3OefQgouQc
        XV5zlP2vJEpnbcZIIMwbj7PFig==
X-Google-Smtp-Source: ABdhPJxx1teZZI3KLxBlghLbz0h9MA0taDv5U0o0sNRSSSGsrq1Yk6fYLn+UMJShs2pzlQbm1n4xEw==
X-Received: by 2002:a17:90b:4ad1:: with SMTP id mh17mr5543144pjb.164.1628181264106;
        Thu, 05 Aug 2021 09:34:24 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n17sm8259165pgj.93.2021.08.05.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:34:23 -0700 (PDT)
Date:   Thu, 5 Aug 2021 10:34:21 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: fix TCM io memory type
Message-ID: <20210805163421.GB3205691@p14s>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-2-aisheng.dong@nxp.com>
 <AM5PR0402MB2756DE75C3231A0A15F7742788F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR0402MB2756DE75C3231A0A15F7742788F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Aug 05, 2021 at 09:59:00AM +0000, Peng Fan wrote:
> > Subject: [PATCH v3 2/5] remoteproc: imx_rproc: fix TCM io memory type
> > 
> > is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> > is_iomem to da_to_va"), but the driver seemed missed to provide the io type
> > correctly.
> > This patch updates remoteproc driver to indicate the TCM on IMX are io
> > memories. Without the change, remoteproc kick will fail.
> > 
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Peng added his RB tag during V2 but it wasn't carried here.

> 
> Tested-by: Peng Fan <peng.fan@nxp.com>
> 
> > ---
> > ChangeLog:
> > v2->v3:
> >  * fix commit message typo and drop imx8ulp fixes tag
> >    Patch content unchanged.
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
> >  #define ATT_OWN		BIT(1)
> > +#define ATT_IOMEM	BIT(2)
> > 
> >  /* address translation table */
> >  struct imx_rproc_att {
> > @@ -117,7 +118,7 @@ struct imx_rproc {
> >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* ITCM   */
> > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> > +	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S */
> >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> >  	/* OCRAM */
> > @@ -131,7 +132,7 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mn[] = {
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> >  	/* DTCM */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S - alias */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> > @@ -147,7 +148,7 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mn[] = {  static const struct imx_rproc_att
> > imx_rproc_att_imx8mq[] = {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* TCML - alias */
> > -	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
> > +	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
> >  	/* OCRAM_S */
> >  	{ 0x00180000, 0x00180000, 0x00008000, 0 },
> >  	/* OCRAM */
> > @@ -159,9 +160,9 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mq[] = {
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
> >  	/* TCML */
> > -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
> > +	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> >  	/* TCMU */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> >  	/* OCRAM_S */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> > @@ -199,12 +200,12 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx7d[] = {
> >  	/* OCRAM_PXP (Code) - alias */
> >  	{ 0x00940000, 0x00940000, 0x00008000, 0 },
> >  	/* TCML (Code) */
> > -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> > +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* DDR (Code) - alias, first part of DDR (Data) */
> >  	{ 0x10000000, 0x80000000, 0x0FFF0000, 0 },
> > 
> >  	/* TCMU (Data) */
> > -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM (Data) */
> >  	{ 0x20200000, 0x00900000, 0x00020000, 0 },
> >  	/* OCRAM_EPDC (Data) */
> > @@ -218,18 +219,18 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx7d[] = {  static const struct imx_rproc_att
> > imx_rproc_att_imx6sx[] = {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* TCML (M4 Boot Code) - alias */
> > -	{ 0x00000000, 0x007F8000, 0x00008000, 0 },
> > +	{ 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
> >  	/* OCRAM_S (Code) */
> >  	{ 0x00180000, 0x008F8000, 0x00004000, 0 },
> >  	/* OCRAM_S (Code) - alias */
> >  	{ 0x00180000, 0x008FC000, 0x00004000, 0 },
> >  	/* TCML (Code) */
> > -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> > +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* DDR (Code) - alias, first part of DDR (Data) */
> >  	{ 0x10000000, 0x80000000, 0x0FFF8000, 0 },
> > 
> >  	/* TCMU (Data) */
> > -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S (Data) - alias? */
> >  	{ 0x208F8000, 0x008F8000, 0x00004000, 0 },
> >  	/* DDR (Data) */
> > @@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)  }
> > 
> >  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
> > -			       size_t len, u64 *sys)
> > +			       size_t len, u64 *sys, bool *is_iomem)
> >  {
> >  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >  	int i;
> > @@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv,
> > u64 da,
> >  			unsigned int offset = da - att->da;
> > 
> >  			*sys = att->sa + offset;
> > +			if (is_iomem)
> > +				*is_iomem = att->flags & ATT_IOMEM;
> >  			return 0;
> >  		}
> >  	}
> > @@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc,
> > u64 da, size_t len, bool *i
> >  	 * On device side we have many aliases, so we need to convert device
> >  	 * address (M4) to system bus address first.
> >  	 */
> > -	if (imx_rproc_da_to_sys(priv, da, len, &sys))
> > +	if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
> >  		return NULL;
> > 
> >  	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) { @@ -553,8 +556,12 @@
> > static int imx_rproc_addr_init(struct imx_rproc *priv,
> >  		if (b >= IMX_RPROC_MEM_MAX)
> >  			break;
> > 
> > -		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> > -						     att->sa, att->size);
> > +		if (att->flags & ATT_IOMEM)
> > +			priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> > +							     att->sa, att->size);
> > +		else
> > +			priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
> > +								att->sa, att->size);
> >  		if (!priv->mem[b].cpu_addr) {
> >  			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size,
> > att->sa);
> >  			return -ENOMEM;
> > --
> > 2.25.1
> 
