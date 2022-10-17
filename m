Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E433C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Oct 2022 17:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiJQRd4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Oct 2022 13:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiJQRdk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Oct 2022 13:33:40 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6777A45A
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Oct 2022 10:33:38 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id bh13so11066756pgb.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Oct 2022 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIkU7sOMlV3fHaINlwJ0KYw7btBtSLgw5mO+qXWoUOw=;
        b=Jmm7D6cRS6zPAgzomDFIyMJ+afNQc/L35rXtWrVxIPB0xDkGpo/668/Qb6CTzR8Mva
         Aaz6+IsQYV+dHpvRGVptFXcOCjR6wvfgHUaTCD/RLlNfbNy+lzEzvS4QI31Bwzo5R8z7
         r82nxp5MGpoWJBmk4hS6s0XWt7CQjHB0fjVD3G7Bs+RRndEmKVK/hY10sRG5dWuEPnhF
         dW+XfNlc4+OJbMcx7CbXOJmfRiyR8SoQxSEE9g2dXvmOLXI5diciaP0ed3hrULJC3feW
         vF21rTT9wpE7sPLKC4X4UITtaAyeZjNIqJ64Ulnj66EOWCEea2oCOG5hJqHeZkeB5dQt
         RtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIkU7sOMlV3fHaINlwJ0KYw7btBtSLgw5mO+qXWoUOw=;
        b=n8P5Dqjj+wQ5AgjsneSm1bUajF/nPRbKJR2rijOB/QYtxy7PwpQSCDAEdRAiKoMIne
         vCUmjr7PQlxPw/UNl57ZuwIe99zPlhbrZnzJaJUKavhiJmGVpHSVc4eh6RuDe42tPT5Y
         UJjihM6QMD5j8jktRFFeiq3W355sEmykHFAGcs9LxcXHAb8O6IPL3iPKXhtnCyvmbUUL
         HIuT/fQm7CwtrpOemkYG9mhD12nOJmpbTMsDJM9+FF3OvWk8T0PPz3JAlKnRHICncdc5
         fWehXC9+DhckVLf1d9lunzMY0kY0ovjQqnPDzymnk3WWBM3Yppmf91g3rF8psz0Op/4r
         KLIw==
X-Gm-Message-State: ACrzQf3jlWi9Y6uGw1WskAmpvcGA59AyH1sOnhiNSz1n8LxIcg/2r2ZI
        3EsDNa+l9/IxcP7zNBVSWz07uQ==
X-Google-Smtp-Source: AMsMyM5jyy2WbvbjPaz7HjAuqsssAiAvwynoMnTFyb4G8cBccuREHHhkw139+BtRk/gDYP8/CXZJWA==
X-Received: by 2002:a63:1609:0:b0:45c:7c1c:4e7d with SMTP id w9-20020a631609000000b0045c7c1c4e7dmr11482387pgl.265.1666028018299;
        Mon, 17 Oct 2022 10:33:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00177fb862a87sm6985701plg.20.2022.10.17.10.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 10:33:37 -0700 (PDT)
Date:   Mon, 17 Oct 2022 11:33:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V7 6/7] remoteproc: imx_rproc: request mbox channel later
Message-ID: <20221017173335.GA121862@p14s>
References: <20221014031037.1070424-1-peng.fan@oss.nxp.com>
 <20221014031037.1070424-7-peng.fan@oss.nxp.com>
 <20221014174903.GA4125124@p14s>
 <DU0PR04MB94179580E85C888CDAA8EAA788299@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB94179580E85C888CDAA8EAA788299@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 17, 2022 at 03:13:16AM +0000, Peng Fan wrote:
> Hi Mathieu,
> 
> > Subject: Re: [PATCH V7 6/7] remoteproc: imx_rproc: request mbox channel
> > later
> > 
> > On Fri, Oct 14, 2022 at 11:10:36AM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > It is possible that when remote processor crash, the communication
> > > channel will be broken with garbage value in mailbox, such as when
> > > Linux is issuing a message through mailbox, remote processor crashes,
> > > we need free & rebuild the mailbox channels to make sure no garbage
> > > value in mailbox channels.
> > >
> > > So move the request/free to start/stop for managing remote procesosr
> > > in Linux, move to attach/detach for remote processor is out of control
> > > of Linux.
> > >
> > > Previous, we just request mbox when attach for CM4 boot early before
> > > Linux, but if mbox defer probe, remoteproc core will do resource
> > > cleanup and corrupt resource table for later probe.
> > >
> > > So move request mbox ealier and still keep mbox request when attach
> > > for self recovery case, but keep a check when request/free mbox.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 39
> > > ++++++++++++++++++++++++++++++++--
> > >  1 file changed, 37 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 917e6db39572..1183de84a4c0
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -84,6 +84,8 @@ struct imx_rproc_mem {
> > >  #define ATT_CORE_MASK   0xffff
> > >  #define ATT_CORE(I)     BIT((I))
> > >
> > > +static int imx_rproc_xtr_mbox_init(struct rproc *rproc); static void
> > > +imx_rproc_free_mbox(struct rproc *rproc);
> > >  static int imx_rproc_detach_pd(struct rproc *rproc);
> > >
> > >  struct imx_rproc {
> > > @@ -357,6 +359,10 @@ static int imx_rproc_start(struct rproc *rproc)
> > >  	struct arm_smccc_res res;
> > >  	int ret;
> > >
> > > +	ret = imx_rproc_xtr_mbox_init(rproc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	switch (dcfg->method) {
> > >  	case IMX_RPROC_MMIO:
> > >  		ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > > dcfg->src_mask, @@ -407,6 +413,8 @@ static int imx_rproc_stop(struct
> > > rproc *rproc)
> > >
> > >  	if (ret)
> > >  		dev_err(dev, "Failed to stop remote core\n");
> > > +	else
> > > +		imx_rproc_free_mbox(rproc);
> > >
> > >  	return ret;
> > >  }
> > > @@ -592,6 +600,22 @@ static void imx_rproc_kick(struct rproc *rproc,
> > > int vqid)
> > >
> > >  static int imx_rproc_attach(struct rproc *rproc)  {
> > > +	return imx_rproc_xtr_mbox_init(rproc); }
> > > +
> > > +static int imx_rproc_detach(struct rproc *rproc) {
> > > +	struct imx_rproc *priv = rproc->priv;
> > > +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> > > +
> > > +	if (dcfg->method != IMX_RPROC_SCU_API)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id))
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	imx_rproc_free_mbox(rproc);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -610,6 +634,7 @@ static struct resource_table
> > > *imx_rproc_get_loaded_rsc_table(struct rproc *rproc  static const struct
> > rproc_ops imx_rproc_ops = {
> > >  	.prepare	= imx_rproc_prepare,
> > >  	.attach		= imx_rproc_attach,
> > > +	.detach		= imx_rproc_detach,
> > >  	.start		= imx_rproc_start,
> > >  	.stop		= imx_rproc_stop,
> > >  	.kick		= imx_rproc_kick,
> > > @@ -720,6 +745,9 @@ static int imx_rproc_xtr_mbox_init(struct rproc
> > *rproc)
> > >  	struct device *dev = priv->dev;
> > >  	struct mbox_client *cl;
> > >
> > > +	if (priv->tx_ch && priv->rx_ch)
> > > +		return 0;
> > > +
> > 
> > You did exactly the same things as in V6.  I asked you why this is needed and
> > all you did is point me to the code in _probe(), which I can read on my own.
> > 
> 
> Sorry for not wrote down clear.
> 
> > Again - why is this needed when we know it will be done in start() and
> > attach()?
> 
> start() and attach() not able to handle mbox defer probe. So I add

We are finally at the heart of the problem.  I had to go look at the
implementation of imx_rproc_xtr_mbox_init() to understand that it can return
-EPROBE_DEFER.  Had there been a comment in the code to highlight _why_ the if()
condition is needed, I would have understood right away and all this waste of
time avoided.

> the mbox requesting in probe to handle mbox defer probe, and add
> a check when requesting mbox channel in start/attach. During first
> time attach/start remote core, the imx_rproc_xtr_mbox_init just
> return, because channel requested in probe flow. 
> 
> Since mbox requested in probe, why still add it in start() and attach()?
> It is to support runtime stop and start(M4 is under control of Linux),
> to support runtime detach(only for i.MX8QM/QXP attach recovery,
> m4 out of control from linux) and attach.
> 
> Thanks,
> Peng.
> > 
> > 
> > >  	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> > >  		return 0;
> > >
> > > @@ -749,8 +777,15 @@ static void imx_rproc_free_mbox(struct rproc
> > > *rproc)  {
> > >  	struct imx_rproc *priv = rproc->priv;
> > >
> > > -	mbox_free_channel(priv->tx_ch);
> > > -	mbox_free_channel(priv->rx_ch);
> > > +	if (priv->tx_ch) {
> > > +		mbox_free_channel(priv->tx_ch);
> > > +		priv->tx_ch = NULL;
> > > +	}
> > > +
> > > +	if (priv->rx_ch) {
> > > +		mbox_free_channel(priv->rx_ch);
> > > +		priv->rx_ch = NULL;
> > > +	}
> > >  }
> > >
> > >  static void imx_rproc_put_scu(struct rproc *rproc)
> > > --
> > > 2.37.1
> > >
