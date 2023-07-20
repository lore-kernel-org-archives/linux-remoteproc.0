Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CE0EB64DA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 20 Jul 2023 17:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjGTRHq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 20 Jul 2023 13:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjGTRHp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Jul 2023 13:07:45 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0EF1A8
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jul 2023 10:07:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-262e89a3ee2so537851a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jul 2023 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689872864; x=1690477664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3gQbgDrG+e3Hu7SQ1w0l1g3BL557ddifDpg7rbmsdAg=;
        b=TpyW1pxzIvR3hrNLjOVY1YSuvyeRVOo1esnAq5v6N/2AnFzEHVw76iyvzS76/bSdf4
         N9ho6WaoM9qGp07f1trYjuxtLNR+dot/6Jw2EDFUnINE50QLfYl4qIcgr3zI6yRj1zId
         z/Ox1Kk66EtV7NQqd57FhZM9GTfChTBgbPW3M4emuL+P1Tcl/fbwpzp8kp1z412J/veA
         iaePlXfuow+onqc1CPIHDvGfIA+0bBM1hGMQmjt08TPNjcYkXA8NI3sSmM20IMBz77HW
         AWgy1G4cJ3BIRjZjnDV4DoU/tZQ0lMekwT9vZGuLZYzRKgfmzvnxJ07ENyjIJUKPuSSB
         qLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689872864; x=1690477664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gQbgDrG+e3Hu7SQ1w0l1g3BL557ddifDpg7rbmsdAg=;
        b=lpqTcgdpOz0szO9z1aMUkrMbfvm86Q8aEpcArOPM5/+vpX4wpRkj2cVf5PhADe3N6V
         f6KtxEmWe2r7wdWHY0xbfSlraq1cIxzUqlfTBp4lDo9zM43mwQ9YY2w8FcM51sNImX19
         UJ/wdiOnzD1WhynzjwDdS71mHhYx9xFkun6/eyVfDWZtL/pLUEr1oLpOFi2oELvdqSVp
         tQ14Xh5kq8VgQ/0JTCB21XQYFrWJjjbhT8hg/z8CdmvmxkZJVhGKX04y7SkCLuyqLmeL
         6nxNqfze+Uh6ZwszVIN7m/6wvTNcIa+fgC60R12zbSBP0G/fvyJ5frjwKqEMBjqD7LeE
         iN4g==
X-Gm-Message-State: ABy/qLYElVUfnifNT2E1E9LkAzUTbl6G7sk/bpR9WaGHRRoewU4LekMt
        4I46Z/3TCGDleuvjft3iOuAHFn5ZYXULxfZlVqE=
X-Google-Smtp-Source: APBJJlEiQVV2IHjouWpGwbgKwsjYtrLIL3UxRwgSfH/BCd16vzBsGvF7fK39e7fnzw5MzrRDk3YPww==
X-Received: by 2002:a17:90a:d598:b0:264:97a:2ba6 with SMTP id v24-20020a17090ad59800b00264097a2ba6mr121329pju.7.1689872863688;
        Thu, 20 Jul 2023 10:07:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ef2d:6ce9:20ef:3d8b])
        by smtp.gmail.com with ESMTPSA id t10-20020a17090a448a00b00263f8915aa3sm2852204pjg.31.2023.07.20.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 10:07:43 -0700 (PDT)
Date:   Thu, 20 Jul 2023 11:07:40 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: Switch iMX8MN/MP from
 SMCCC to MMIO
Message-ID: <ZLlp3Iy0xRP/UL29@p14s>
References: <20230720125549.72929-1-marex@denx.de>
 <20230720125549.72929-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720125549.72929-2-marex@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Marek,

On Thu, Jul 20, 2023 at 02:55:49PM +0200, Marek Vasut wrote:
> The MX8M CM7 boot via SMC call is problematic, since not all versions
> of ATF support this interface. Extend the MMIO support so it can boot
> the CM7 on MX8MN/MP instead and discern the two alternatives using DT
> compatible strings.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> ---
> V2: Rename 'gpr' to 'fsl,iomuxc-gpr'
> ---
>  drivers/remoteproc/imx_rproc.c | 58 ++++++++++++++++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h |  2 ++
>  2 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 4ee2646ce62ad..8bb293b9f327c 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -40,6 +40,12 @@
>  #define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
>  					 IMX7D_SW_M4C_NON_SCLR_RST)
>  
> +#define IMX8M_M7_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST)
> +#define IMX8M_M7_POLL			IMX7D_ENABLE_M4
> +
> +#define IMX8M_GPR22			0x58
> +#define IMX8M_GPR22_CM7_CPUWAIT		BIT(0)
> +
>  /* Address: 0x020D8000 */
>  #define IMX6SX_SRC_SCR			0x00
>  #define IMX6SX_ENABLE_M4		BIT(22)
> @@ -91,6 +97,7 @@ static int imx_rproc_detach_pd(struct rproc *rproc);
>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> +	struct regmap			*gpr;
>  	struct rproc			*rproc;
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX_RPROC_MEM_MAX];
> @@ -285,6 +292,18 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
> +	.src_reg	= IMX7D_SRC_SCR,
> +	.src_mask	= IMX7D_M4_RST_MASK,
> +	.src_start	= IMX7D_M4_START,
> +	.src_stop	= IMX8M_M7_STOP,
> +	.gpr_reg	= IMX8M_GPR22,
> +	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
> +	.att		= imx_rproc_att_imx8mn,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> +	.method		= IMX_RPROC_MMIO,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
>  	.att		= imx_rproc_att_imx8mn,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> @@ -365,8 +384,14 @@ static int imx_rproc_start(struct rproc *rproc)
>  
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
> -		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> -					 dcfg->src_start);
> +		if (priv->gpr) {
> +			ret = regmap_clear_bits(priv->gpr, dcfg->gpr_reg,
> +						dcfg->gpr_wait);
> +		} else {
> +			ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> +						 dcfg->src_mask,
> +						 dcfg->src_start);
> +		}
>  		break;
>  	case IMX_RPROC_SMC:
>  		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
> @@ -395,6 +420,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>  
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
> +		if (priv->gpr) {
> +			ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg,
> +					      dcfg->gpr_wait);
> +			if (ret) {
> +				dev_err(priv->dev,
> +					"Failed to quiescence M4 platform!\n");
> +				return ret;
> +			}
> +		}
> +
>  		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
>  					 dcfg->src_stop);
>  		break;
> @@ -992,6 +1027,10 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  		break;
>  	}
>  
> +	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
> +	if (IS_ERR(priv->gpr))
> +		priv->gpr = NULL;
> +
>  	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
>  	if (IS_ERR(regmap)) {
>  		dev_err(dev, "failed to find syscon\n");
> @@ -1001,6 +1040,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	priv->regmap = regmap;
>  	regmap_attach_dev(dev, regmap, &config);
>  
> +	if (priv->gpr) {
> +		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> +		if (val & dcfg->gpr_wait) {
> +			/*
> +			 * After cold boot, the CM indicates its in wait
> +			 * state, but not fully powered off. Power it off
> +			 * fully so firmware can be loaded into it.
> +			 */
> +			imx_rproc_stop(priv->rproc);
> +			return 0;
> +		}
> +	}

Thanks for the clarification.  I will apply this patch when the DT people have
had the time to review the first patch of this series.

Thanks,
Mathieu


> +
>  	ret = regmap_read(regmap, dcfg->src_reg, &val);
>  	if (ret) {
>  		dev_err(dev, "Failed to read src\n");
> @@ -1142,6 +1194,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
>  	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
>  	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
> +	{ .compatible = "fsl,imx8mn-cm7-mmio", .data = &imx_rproc_cfg_imx8mn_mmio },
> +	{ .compatible = "fsl,imx8mp-cm7-mmio", .data = &imx_rproc_cfg_imx8mn_mmio },
>  	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 1c7e2127c7584..79a1b8956d142 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -31,6 +31,8 @@ struct imx_rproc_dcfg {
>  	u32				src_mask;
>  	u32				src_start;
>  	u32				src_stop;
> +	u32				gpr_reg;
> +	u32				gpr_wait;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
>  	enum imx_rproc_method		method;
> -- 
> 2.40.1
> 
