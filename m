Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EC2C433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 17:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AED4F611CE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 17:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236929AbhDMRrJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 13:47:09 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:35839 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347296AbhDMRrI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 13:47:08 -0400
Received: by mail-pl1-f174.google.com with SMTP id j7so8645838plx.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Apr 2021 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gksf2GLCnKpMla39BjXy2uPj3pSI0JcCgVY9plAt1pE=;
        b=zuHvgXo2efl2BRQdU0ijTEf+emxCj+bbgf8l28IkAAX1cWJixQaG1e48MpNWWCPhPt
         KGlydlejOQ044wn/VmmJq7ZwHDi5SE3Ijoal/TrfExsFQr2zp9D5mRobPxFfdVR8SbXa
         XYoPL+BlHL9sEyST7DDcuG75+t8ie0xN6q+5q6hUYsDkXWOH9Z/c8uKvILrTnj3+Tq6H
         xIZa3dZH24Vl/QWQStHYdE2zhwHNJD+JOJE0y4aPePbZpH1YQxj1UXPosqChUj4EkTJf
         gc44h6YS7c9EbMSnZc+Vag8YI12yDThD5D51b2XzJfxK69f6ac+xi1DpN67HE15JBeLo
         bU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gksf2GLCnKpMla39BjXy2uPj3pSI0JcCgVY9plAt1pE=;
        b=jlZHyxit9pel2Q8fyljGHz1snFor8SWv6baWl90opSF3xXX6pV2oFuznFkgXn2xnQh
         gNjqVJevYzNRF+RRhmFknKejuRx/6J2tkGwXVsKDNdY3+DKjN0SaJBji8Al/OWpVNuJJ
         0fgtFZNbKZ92ydiMDht0zA73Y0St7b4wDYRznn3KAOF18Vfvem7ahih8AdY6/EvLqz3R
         j2v3ngOygJBh4Y+7QoaJGTtp8Q9pBufQiflWU00+4G0BN1SRobag5iXFhSc5vlrATTrt
         GcVPj0r6eiqgtk52K/zzTptS5vUy1d8IzZUyydG6aDHOq6QZvgQwLXta1sTGw6TQTpEd
         o/2A==
X-Gm-Message-State: AOAM531Z41VLwVlYtQ/gPf0XVRt+lDUeNvYkYlT4kubixjFwC9L4sIam
        FhczdDtaSF2UenZiHNaCUuwLiA==
X-Google-Smtp-Source: ABdhPJzSvSAsMah5SEJY2Ov5zU42KJYL5D8va+YF5aDSoVMiZ7NWMJpdHnw7YLTnzZSuU2tnNSQtMg==
X-Received: by 2002:a17:90b:808:: with SMTP id bk8mr1258289pjb.128.1618335948386;
        Tue, 13 Apr 2021 10:45:48 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r1sm2864967pjo.26.2021.04.13.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 10:45:47 -0700 (PDT)
Date:   Tue, 13 Apr 2021 11:45:45 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 6/8] remoteproc: imx_rproc: initial support for
 mutilple start/stop method
Message-ID: <20210413174545.GD750651@xps15>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
 <1617846898-13662-7-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617846898-13662-7-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 08, 2021 at 09:54:56AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
> (start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).
> 
> The current SoCs supported are all using IMX_RPROC_MMIO, add a restrict
> in probe that only SoCs using IMX_RPROC_MMIO needs syscon regmap to
> access registers.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 50 +++++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index c576e12d3817..a7fa9d7fc2d1 100644
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
>  enum imx_rproc_mode {
> @@ -194,6 +204,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx8mq,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> @@ -203,6 +214,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx7d,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> @@ -212,6 +224,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  	.src_stop	= IMX6SX_M4_STOP,
>  	.att		= imx_rproc_att_imx6sx,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static int imx_rproc_start(struct rproc *rproc)
> @@ -578,15 +591,17 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  
>  	priv->mode = IMX_RPROC_NORMAL;
>  
> -	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
> -	if (ret) {
> -		dev_err(dev, "Failed to read src\n");
> -		return ret;
> -	}
> +	if (priv->regmap) {
> +		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
> +		if (ret) {
> +			dev_err(dev, "Failed to read src\n");
> +			return ret;
> +		}
>  
> -	if (!(val & dcfg->src_stop)) {
> -		priv->mode = IMX_RPROC_EARLY_BOOT;
> -		priv->rproc->state = RPROC_DETACHED;
> +		if (!(val & dcfg->src_stop)) {
> +			priv->rproc->state = RPROC_DETACHED;
> +			priv->mode = IMX_RPROC_EARLY_BOOT;
> +		}
>  	}
>  
>  	return 0;
> @@ -600,16 +615,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	struct rproc *rproc;
>  	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg;
> -	struct regmap *regmap;
> +	struct regmap *regmap = NULL;
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
> @@ -622,6 +630,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_rproc;
>  	}
>  
> +	if (dcfg->method == IMX_RPROC_MMIO) {
> +		regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> +		if (IS_ERR(regmap)) {
> +			dev_err(dev, "failed to find syscon\n");
> +			ret = PTR_ERR(regmap);
> +			goto err_put_rproc;
> +		}
> +		regmap_attach_dev(dev, regmap, &config);
> +	}

I would move this to imx_rproc_detect_mode() and get rid of the "if
(priv->regmap)" that is there.

> +
>  	priv = rproc->priv;
>  	priv->rproc = rproc;
>  	priv->regmap = regmap;
> -- 
> 2.30.0
> 
