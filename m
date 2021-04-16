Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918FDC433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C7AD60FF3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243456AbhDPRou (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243463AbhDPRot (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Apr 2021 13:44:49 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BCFC061756
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:44:23 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lt13so5553476pjb.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Rd73RRK0tKhJvwe3MMRFxfXRxCCj0NFkvvS7uBQf3o=;
        b=M4vtCf8ATqvSpDkocwDrogl9jrwhR8peihB7tqoOsaheou2z4vR0NlEBxHk0Sk/C1B
         uo7n3OGsBMrY9o+ZpFKNbCgG8tGSmxe+9YtbtwuNH5EmscnETL3TopNZSCF/rdPIKYv5
         hynqtouPgzbRPsC87TtT7H2dza1WMc9vhuKKkM/AlWBf8KdLkodEnyjgkAR/hgrRtcys
         7PPSQFZ59tF6KfVDP6YAGJzU7syaRUIJLZC+CCA6GKUHHUV45Nl8nc0q3AcgMuPVJIgL
         fgp07RT1rGJyhyegqZRHHyEsm6L6pJKhvob46tAVi0LU469WKD0n2U9cIlgjHYeoWpcX
         ig2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Rd73RRK0tKhJvwe3MMRFxfXRxCCj0NFkvvS7uBQf3o=;
        b=HiRd1IWY38Lj3ZikewuyzEVRVSS5547EoYRvQ65mlSieGWaMicbkUfNcjfGJOcOLDQ
         jwsckelhIVb7b1AlOnwlpZeygQZZ/ENgQ/odxQtn5ddqzLwgUfg5kphCn7ZuaGwKhTm4
         vVUwHe+O3oy4/U5ww7zS0lKZcjMMzrP4HoEwMYy5f4af/BK6pcp1goscX3dKk2zhHgvq
         i+DS01Jl309rFYRneN6rl2QuaBucFJ8P327QSMTsSWplSE/od6Z000t6BQ5T1W018ioa
         dmWVTJB6uRog7C3OeoH52IHKgctaxiHoO71lQTiUp4Y8UfUFKgXqrTLIDjiSaqLlzes3
         xJAg==
X-Gm-Message-State: AOAM532mBqZcJsOWz4dgabK6YnsefYcuEBcAdSeDNf2MKkEyIm3a8jPC
        GpqlU9Ieg9/FOnbPDkhq4RPVUw==
X-Google-Smtp-Source: ABdhPJwsZsOGd6iYmw81ml/+fBsTPatbKzbuX87SOWgFpKeaQZmzNPaV2Tq5Ydq1TvUYf/cIkn6rvg==
X-Received: by 2002:a17:902:ed52:b029:ea:aaaf:60d6 with SMTP id y18-20020a170902ed52b02900eaaaaf60d6mr10752963plb.55.1618595063144;
        Fri, 16 Apr 2021 10:44:23 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x1sm5368301pfj.209.2021.04.16.10.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 10:44:22 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:44:20 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 5/8] remoteproc: imx_rproc: initial support for
 mutilple start/stop method
Message-ID: <20210416174420.GB1050209@xps15>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
 <1618493261-32606-6-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618493261-32606-6-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 15, 2021 at 09:27:38PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
> (start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).
> 
> The current SoCs supported are all using IMX_RPROC_MMIO, add a restrict
> in imx_rproc_detect_mode that only SoCs using IMX_RPROC_MMIO needs syscon
> regmap to access registers.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 51 +++++++++++++++++++++++++++++-------------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 06dac92..2b633fd 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -74,6 +74,15 @@ struct imx_rproc_att {
>  	int flags;
>  };
>  
> +/* Remote core start/stop method */
> +enum imx_rproc_method {
> +	IMX_RPROC_NONE,
> +	/* Through syscon regmap */
> +	IMX_RPROC_MMIO,
> +	/* Through ARM SMCCC */
> +	IMX_RPROC_SMC,
> +};
> +
>  struct imx_rproc_dcfg {
>  	u32				src_reg;
>  	u32				src_mask;
> @@ -81,6 +90,7 @@ struct imx_rproc_dcfg {
>  	u32				src_stop;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
> +	enum imx_rproc_method		method;
>  };
>  
>  struct imx_rproc {
> @@ -183,6 +193,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx8mq,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> @@ -192,6 +203,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx7d,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> @@ -201,6 +213,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  	.src_stop	= IMX6SX_M4_STOP,
>  	.att		= imx_rproc_att_imx6sx,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static int imx_rproc_start(struct rproc *rproc)
> @@ -560,19 +573,35 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
>  
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
> +	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct regmap *regmap;
>  	int ret;
>  	u32 val;
>  
> -	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
> -	if (ret) {
> -		dev_err(dev, "Failed to read src\n");
> -		return ret;
> +	if (dcfg->method != IMX_RPROC_MMIO)
> +		return 0;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to find syscon\n");
> +		return PTR_ERR(regmap);
>  	}
>  
> -	if (!(val & dcfg->src_stop))
> -		priv->rproc->state = RPROC_DETACHED;
> +	priv->regmap = regmap;
> +	regmap_attach_dev(dev, regmap, &config);
> +
> +	if (regmap) {

This if() statement is not needed.  Moreover all the modifications in this
function should go under a IMX_RPROC_MMIO case statement in patch 7.

> +		ret = regmap_read(regmap, dcfg->src_reg, &val);
> +		if (ret) {
> +			dev_err(dev, "Failed to read src\n");
> +			return ret;
> +		}
> +
> +		if (!(val & dcfg->src_stop))
> +			priv->rproc->state = RPROC_DETACHED;
> +	}
>  
>  	return 0;
>  }
> @@ -583,18 +612,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct imx_rproc *priv;
>  	struct rproc *rproc;
> -	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg;
> -	struct regmap *regmap;
>  	int ret;
>  
> -	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> -	if (IS_ERR(regmap)) {
> -		dev_err(dev, "failed to find syscon\n");
> -		return PTR_ERR(regmap);
> -	}
> -	regmap_attach_dev(dev, regmap, &config);
> -
>  	/* set some other name then imx */
>  	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
>  			    NULL, sizeof(*priv));
> @@ -609,7 +629,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	priv = rproc->priv;
>  	priv->rproc = rproc;
> -	priv->regmap = regmap;
>  	priv->dcfg = dcfg;
>  	priv->dev = dev;
>  
> -- 
> 2.7.4
> 
