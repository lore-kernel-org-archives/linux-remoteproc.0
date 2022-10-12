Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC2C43217
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 Oct 2022 22:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJLWJS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 Oct 2022 18:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiJLWIu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Oct 2022 18:08:50 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3154E8AAE
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 15:06:57 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id cl1so183662pjb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 15:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PINm7DlHkRfCIR9Bkun6rWqrRKKna4XtFs22k189M0s=;
        b=mjh54rp5bz+CCsGBHXCvnfH/jZ/ERfZBhQxCBtvaPNyQgpQXSvi4dePgi1aoRsENtO
         Yj4XAl1SgSSXy/PxUANCOwty3gvL6iY965kUdS7wU7EfeecwrDEc2qK+GKX/Grjlc60q
         re1WH8oZl0eVL6lSCxbJosN7wU4WCCs8+38BErdMJLTcIoFk2wytjIMQChy64muezU8e
         LwUF3UCw/B29XsdkHsSE/6jvl3Ey+IOuHZdQ5y1knUbUl5oewxC+dvGnqYLsYlep36Pi
         tQaBqdlA6JFg4TxTiSztzKWr3VHedAJv3MrLsdBn0nXeL9NDMlnqpC6rHswbclmRCq3o
         kasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PINm7DlHkRfCIR9Bkun6rWqrRKKna4XtFs22k189M0s=;
        b=8OaFiHN0h7wZwDFUa8OSdFYGm0HgaDGK/I9i1NJjy2Y09o7WgCoguWVD9qRcyGxcic
         cwvXTxAVOGslzK5ph3Qal8pwuJee3tym5K/KEU1DwgEoMajPphrWkkfOI7xe/LEAA1KJ
         MCamUaoduotVsuBhrOfOOx++A3icD+g01UK8TSU8LTuOcSe3AjpoH0g6nnVqNImVgamT
         DLxLBRKJD3cKEZc6v+JfEWf41xopoSq4NDdZlUKnj38OVsmwrUjQbw5UZkEvQhQ250fC
         xGn37xH5zMEEmg99u0ssKEXyxdAjfYYvPtYQb9bJyC+a4edzqKSNmctom3TzY6K65Olj
         UGbA==
X-Gm-Message-State: ACrzQf1xfslNzUqXJSyZlrmiVM+BFJ/Vv4zke8SXe9ltjvZuFgaZ8UKH
        C6wS3ACHpASGX8CUgSwWyLmKUA==
X-Google-Smtp-Source: AMsMyM5xX4d+J7aWaTWHRpdFvy0S00JxLqimXDS1GoqNST1+1HMvZ36ke+ifgi7AMGdrgc2vg9jRcg==
X-Received: by 2002:a17:90b:1d4d:b0:20a:794a:f6e7 with SMTP id ok13-20020a17090b1d4d00b0020a794af6e7mr7525463pjb.151.1665612380886;
        Wed, 12 Oct 2022 15:06:20 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x67-20020a623146000000b00562adc8b6d3sm318530pfx.193.2022.10.12.15.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 15:06:20 -0700 (PDT)
Date:   Wed, 12 Oct 2022 16:06:17 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V6 5/7] remoteproc: imx_rproc: support i.MX8QM
Message-ID: <20221012220617.GC1196937@p14s>
References: <20220929061704.1571746-1-peng.fan@oss.nxp.com>
 <20220929061704.1571746-6-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929061704.1571746-6-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 29, 2022 at 02:17:02PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Most logic are same as i.MX8QXP, but i.MX8QM has two general purpose
> M4 cores, the two cores runs independently and they has different resource

s/has/have

> id, different start address from SCFW view.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/imx_rproc.c | 47 +++++++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7d2e11aed0aa..8175c4c9aa22 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
>   */
>  
> +#include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
> @@ -75,10 +76,13 @@ struct imx_rproc_mem {
>  	size_t size;
>  };
>  
> -/* att flags */
> +/* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
>  /* M4 own area. Can be mapped at probe */
> -#define ATT_OWN		BIT(1)
> -#define ATT_IOMEM	BIT(2)
> +#define ATT_OWN         BIT(31)
> +#define ATT_IOMEM       BIT(30)
> +
> +#define ATT_CORE_MASK   0xffff
> +#define ATT_CORE(I)     BIT((I))
>  
>  static int imx_rproc_detach_pd(struct rproc *rproc);
>  
> @@ -101,6 +105,7 @@ struct imx_rproc {
>  	u32				rsrc_id;	/* resource id */
>  	u32				entry;		/* cpu start address */
>  	int                             num_pd;
> +	u32				core_index;
>  	struct device                   **pd_dev;
>  	struct device_link              **pd_dev_link;
>  };
> @@ -131,6 +136,19 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	{ 0xD0000000, 0xa0000000, 0x10000000, 0 },
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx8qm[] = {
> +	/* dev addr , sys addr  , size      , flags */
> +	{ 0x08000000, 0x08000000, 0x10000000, 0},
> +	/* TCML */
> +	{ 0x1FFE0000, 0x34FE0000, 0x00020000, ATT_OWN | ATT_IOMEM | ATT_CORE(0)},
> +	{ 0x1FFE0000, 0x38FE0000, 0x00020000, ATT_OWN | ATT_IOMEM | ATT_CORE(1)},
> +	/* TCMU */
> +	{ 0x20000000, 0x35000000, 0x00020000, ATT_OWN | ATT_IOMEM | ATT_CORE(0)},
> +	{ 0x20000000, 0x39000000, 0x00020000, ATT_OWN | ATT_IOMEM | ATT_CORE(1)},
> +	/* DDR (Data) */
> +	{ 0x80000000, 0x80000000, 0x60000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
>  	{ 0x08000000, 0x08000000, 0x10000000, 0 },
>  	/* TCML/U */
> @@ -281,6 +299,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.method		= IMX_RPROC_MMIO,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
> +	.att            = imx_rproc_att_imx8qm,
> +	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
> +	.method         = IMX_RPROC_SCU_API,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
>  	.att		= imx_rproc_att_imx8qxp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
> @@ -397,6 +421,17 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  	for (i = 0; i < dcfg->att_size; i++) {
>  		const struct imx_rproc_att *att = &dcfg->att[i];
>  
> +		/*
> +		 * Ignore entries not belong to current core:
> +		 * i.MX8QM has dual general M4_[0,1] cores, M4_0's own entries
> +		 * has "ATT_CORE(0) & BIT(0)" true, M4_1's own entries has
> +		 * "ATT_CORE(1) & BIT(1)" true.
> +		 */
> +		if (att->flags & ATT_CORE_MASK) {
> +			if (!((BIT(priv->core_index)) & (att->flags & ATT_CORE_MASK)))
> +				continue;
> +		}
> +
>  		if (da >= att->da && da + len < att->da + att->size) {
>  			unsigned int offset = da - att->da;
>  
> @@ -844,6 +879,11 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  			return ret;
>  		}
>  
> +		if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
> +			priv->core_index = 1;
> +		else
> +			priv->core_index = 0;
> +
>  		/*
>  		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
>  		 * and Linux could only do IPC with Mcore and nothing else.
> @@ -1040,6 +1080,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
>  	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
>  	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
> +	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
>  	{},
> -- 
> 2.37.1
> 
