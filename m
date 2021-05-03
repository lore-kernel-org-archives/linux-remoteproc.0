Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F578C433ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 16:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56DB261166
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 16:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhECQad (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 May 2021 12:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhECQac (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 May 2021 12:30:32 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52700C06174A
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 May 2021 09:29:38 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 10so4574511pfl.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 May 2021 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IMPuX2GLAUntzsthEcxUQ2FwjzaX9JjI2MyBDDngoGU=;
        b=JorQnrKo8j2/VqI6YR8OhY7Wb7CbydQ52xnJPb3cnX6PA2k8nnkeXX1YrGinVWZ7c7
         FpaBa7gUbrQV1JajbCantUw/qNb6h4F8WKU56vIqxmln1OsCxA6vbQuIY7/66vL2qZIv
         oWZc4GRtMGLyw3Mey8biOE/lKJ5SgI0UdC2CqomaQEwmrfNaQZYhM5Xhk3OxdxHDLoYM
         O+uSUyRB6uyXAufl+8TKoTp0eYR2HJLtecloxkI39cxf29pLVxbwndLOjNRvj0V3/ksS
         iz1Hfzm295cxJCg7OsFahNA1b9W2iRNhd6PwwMVoZusvbU6wrpaN4CkKJLJX4ouzhfcT
         qyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IMPuX2GLAUntzsthEcxUQ2FwjzaX9JjI2MyBDDngoGU=;
        b=oLrMa3X7EX4RQDTqKfMBXu7T9Sld2OOhUaB/sKNeqEhkfO3yV3QJt3vj+InhfWEZFF
         IUqBFljTA2AvBByRwBS2foneU1FMOyKoaLS9jv0DN7RuWGKYUZke/rUpGT6DCZL+0YJ1
         U7+p3ZdW7DyE0GRGZZ31drJle+Wa+rApg2bgVUs02M7u2DD3ujmhv50Ix7GyWvRnbYrj
         POVQz7lJbsUDg1zJwC0/MItfmQaiCBF/m8Ik9pbh2Qst8dwwps1CTe6RjyP1S8CBomAa
         I6aah6TTTsCjGR8F7jSjhcUAOH2vAxb3alFnrLo71IYrOmm3b7aPLHffjjpKQ0JyWrJP
         pFEg==
X-Gm-Message-State: AOAM531ypNO2xMoWyyPvp1ZKvoOrYyIrruxXfCbzBECdkFFGWXyBon6L
        Ojn0q2qz5a1uzxfwTLrbVL3I1g==
X-Google-Smtp-Source: ABdhPJzxRU8ZmyDvjokB5vrWbVBoK1ogFVXxUFGJ84g+JNsdCf7XZvBmktUx7kU3aDLt7PsPcAi+iA==
X-Received: by 2002:a63:cf55:: with SMTP id b21mr19789896pgj.126.1620059377918;
        Mon, 03 May 2021 09:29:37 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t19sm9606010pfg.100.2021.05.03.09.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:29:37 -0700 (PDT)
Date:   Mon, 3 May 2021 10:29:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: support i.MX7ULP
Message-ID: <20210503162935.GB1699665@xps15>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <1618971622-30539-8-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618971622-30539-8-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 21, 2021 at 10:20:21AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
> and powers most serivces used by A7 core, so A7 core has no power to

s/serivces/services

I pointed that out on V4 - why do I have to do so again?

With that:

Reviwed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> start and stop M4 core. And the M4 core's state is default RPROC_DETACHED
> and remoteproc framework not able to stop the M4 core.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 49 ++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e9d9860e4fce..d26254609a52 100644
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
> @@ -573,12 +590,31 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
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
> +	switch (dcfg->method) {
> +	case IMX_RPROC_NONE:
> +		priv->rproc->state = RPROC_DETACHED;
> +		return 0;
> +	default:
> +		break;
> +	}
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to find syscon\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	priv->regmap = regmap;
> +	regmap_attach_dev(dev, regmap, &config);
> +
> +	ret = regmap_read(regmap, dcfg->src_reg, &val);
>  	if (ret) {
>  		dev_err(dev, "Failed to read src\n");
>  		return ret;
> @@ -625,18 +661,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
> @@ -651,7 +678,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	priv = rproc->priv;
>  	priv->rproc = rproc;
> -	priv->regmap = regmap;
>  	priv->dcfg = dcfg;
>  	priv->dev = dev;
>  
> @@ -720,6 +746,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id imx_rproc_of_match[] = {
> +	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
>  	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
>  	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
> -- 
> 2.30.0
> 
