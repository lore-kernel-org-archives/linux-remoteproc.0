Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825D4C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6518361090
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243643AbhDPRrn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235877AbhDPRrn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Apr 2021 13:47:43 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED4DC06175F
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:47:17 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id w6so4290839pfc.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7KzCp5SZQ4n6aE/PkZv5EsNr8oR/kNNNZI4+o5RebUo=;
        b=b9owdBkmwCbVQFzLYGtUvkObEEJZZ+1P/Lnl3/qCmxzd1N22iJduMKm7s2bjUAMwQx
         8rk7lEQ8pQDdrfJJc5uQkRUH5kbyReRXy++EiR6DLDQXQlnWdtFeBjf3qO7OXdf9r7fN
         xHifN4IMshFJiTY/MHe+9g+vVEsxSRYep4geOXnT2Jt+lLOVnp5jV3Z8xOTMLYpck/WG
         SR6+9+HOcumHLEb4JNNvmHhsTjEPgTVn+MbCIIc/2fnUB4Uk8xHC31I+v9XfTrFm9GZU
         eibwUUkwv4m1bVRUrqIGVvaDF/7GVbUQ/ydoo89MAkZkndsGKukdVt8Hs6YHMFLzFcx0
         WRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7KzCp5SZQ4n6aE/PkZv5EsNr8oR/kNNNZI4+o5RebUo=;
        b=FN0Ax1iKP7QL1ILxd9NaPDtItZhbexKC2KpZL7O+V2Eo/8+rHxp6KpKe2r3JCUSnKL
         YmOWSlv+H+p9rVCqNRKnsW7m7JDJlWIBJHqaXQ8cSwNn7Qqt2ktKkUHxalK/ZdoAjd5b
         MbFB66300C0Xcs7ww90YIAg8x/tsL31MeywZQpYHq7pQpFl8SF0Eqz1SNYsA36Pfjc+P
         FI6FlbD4C68YIPlrPmotoWR0xYglzkiHU+pJXEpb2bWbTnSxK8ydChew+8NAGBPGgu5r
         qR8KDjrFtp0ecQWzvwEEIUVQnKA+hxLa3eYZY0BJ7cd8nWpvjNdSV6M2xgmAwR9HZgmG
         rAjA==
X-Gm-Message-State: AOAM533JPQ2tu6CpN7iwOyqYSxF+BiYBz11FMIGsumi8asvThACUVZZL
        itb4oa3G4EYyvv95gDh6n0L+lw==
X-Google-Smtp-Source: ABdhPJwi7oTNxU9nTxZiQwipdj2kfGpyZICOgioceA0PnOFydpJH5SRcxCqdYrnQGTogNU+AMQmBfg==
X-Received: by 2002:a63:1b5e:: with SMTP id b30mr236720pgm.254.1618595236773;
        Fri, 16 Apr 2021 10:47:16 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 123sm5339437pfx.180.2021.04.16.10.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 10:47:11 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:47:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 7/8] remoteproc: imx_rproc: support i.MX7ULP
Message-ID: <20210416174709.GD1050209@xps15>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
 <1618493261-32606-8-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618493261-32606-8-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 15, 2021 at 09:27:40PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
> and powers most serivces used by A7 core, so A7 core has no power to

s/serivces/services

> start and stop M4 core. And the M4 core's state is default RPROC_DETACHED
> and remoteproc framework not able to stop the M4 core.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 56dfcc1..0592865 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -136,6 +136,14 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	{ 0x40000000, 0x40000000, 0x80000000, 0 },
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
> +	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
> +	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
> +	{0x2F000000, 0x2F000000, 0x20000, ATT_OWN},
> +	{0x2F020000, 0x2F020000, 0x20000, ATT_OWN},
> +	{0x60000000, 0x60000000, 0x40000000, 0}
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* OCRAM_S (M4 Boot code) - alias */
> @@ -196,6 +204,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.method		= IMX_RPROC_MMIO,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
> +	.att		= imx_rproc_att_imx7ulp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> +	.method		= IMX_RPROC_NONE,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -238,6 +252,9 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> +	if (dcfg->method == IMX_RPROC_NONE)
> +		return -EOPNOTSUPP;
> +
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
> @@ -580,8 +597,13 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	int ret;
>  	u32 val;
>  
> -	if (dcfg->method != IMX_RPROC_MMIO)
> +	switch (dcfg->method) {
> +	case IMX_RPROC_NONE:
> +		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> +	default:
> +		break;
> +	}
>  
>  	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
>  	if (IS_ERR(regmap)) {
> @@ -726,6 +748,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id imx_rproc_of_match[] = {
> +	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
>  	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
>  	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
> -- 
> 2.7.4
> 
