Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57133C433ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 16:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FA9461166
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 16:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhECQ0b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 May 2021 12:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhECQ0a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 May 2021 12:26:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D66CC06174A
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 May 2021 09:25:35 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id md17so3442075pjb.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 May 2021 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=llDFHoCgHmKfJ6I5eqGZ9r7QfGnibGu0eXIbBEASfuI=;
        b=sWHGEe8kbK+TrA88GyPG3pNPHzmfDEMSJv0gPfOV2kL0iETzP2c7O+JTn9TOk/Trg6
         mtUe3MVdQWPA4bqz4jQnT0ENJ/3vc5MLb44vFyT4HFiZv7T5l1q1+rTA27veX5Kp9Gz0
         J3uRmG7OHisxXvzMY6xk5WP6UwG1fgfjxCP86/Nxxe7soiOZ0USE/MD7YIM+XPMUxVuL
         NrtotVUgK3AKx6tByive2ft67B69vp8LU6pe6aNpw1hG7uy4WI1tWXtBfdWmqNNxAhrd
         VHWNNoKEth6vOawgOF0iNZ8djLZzhVoTqtOezyI0Ljy2pjjMhmiVDkdBJ2bB23GSQY7k
         BWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=llDFHoCgHmKfJ6I5eqGZ9r7QfGnibGu0eXIbBEASfuI=;
        b=o8nZFZWi5UE7oAVPBkUnliCL7ILouZhgck8Qh87w62Ey4zAOGmqwO0KAO3H8sElJHq
         xR2/FJ1LMCqLQVwCyrCE2ZSWgJv9If4FxOTufxGoM+bMXiYEVpbqLfMxuFmsOSSgxPPV
         PN0p1Z5+WTaCHoRmBBNRduN+y1voKKfw0hFQxMy040vcoBhVd6226B7xi3BIcTPGH6+G
         IrXsyJ3o3hWhvKzQy4kWjZLMjuG7Ucrt1RrHEQBz0z6Reu4s01iQuqcJZ73FzIgM06Wg
         2Ie5HYPjMsybCq0ytkF29SGe554Ieh9ujgwTnmyb3zjLjFvj7NZ/JjdI9l1EBTQwoXgg
         8GqQ==
X-Gm-Message-State: AOAM530t0ZWUYFi9gIPtN0o0XWUj0Ef8K9HG8mh3gjoxFxAMSyI/EwjM
        TaP8Zn+wqeroNKchWR2qjA41zQ==
X-Google-Smtp-Source: ABdhPJxWhBdZ/ZNX1UGwng3JKEuM5Fms7Dfpp+MQkEjhfMX72YNEtzIfRDcmgz4uwUDayIyviez/kQ==
X-Received: by 2002:a17:90a:1a47:: with SMTP id 7mr31173132pjl.84.1620059134703;
        Mon, 03 May 2021 09:25:34 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a26sm9497684pff.149.2021.05.03.09.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:25:34 -0700 (PDT)
Date:   Mon, 3 May 2021 10:25:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V5 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Message-ID: <20210503162532.GA1699665@xps15>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <1618971622-30539-9-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618971622-30539-9-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 21, 2021 at 10:20:22AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
> SMCCC to start/stop M core, not using regmap interface.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 87 +++++++++++++++++++++++++++++++---
>  1 file changed, 80 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index d26254609a52..3cb901c87a7d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
>   */
>  
> +#include <linux/arm-smccc.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> @@ -50,6 +51,11 @@
>  
>  #define IMX_RPROC_MEM_MAX		32
>  
> +#define IMX_SIP_RPROC			0xC2000005
> +#define IMX_SIP_RPROC_START		0x00
> +#define IMX_SIP_RPROC_STARTED		0x01
> +#define IMX_SIP_RPROC_STOP		0x02
> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -108,6 +114,36 @@ struct imx_rproc {
>  	void __iomem			*rsc_table;
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* ITCM   */
> +	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> +	/* OCRAM_S */
> +	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> +	/* OCRAM */
> +	{ 0x00900000, 0x00900000, 0x00020000, 0 },
> +	/* OCRAM */
> +	{ 0x00920000, 0x00920000, 0x00020000, 0 },
> +	/* OCRAM */
> +	{ 0x00940000, 0x00940000, 0x00050000, 0 },
> +	/* QSPI Code - alias */
> +	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> +	/* DDR (Code) - alias */
> +	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> +	/* DTCM */
> +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> +	/* OCRAM_S - alias */
> +	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> +	/* OCRAM */
> +	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
> +	/* OCRAM */
> +	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
> +	/* OCRAM */
> +	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
> +	/* DDR (Data) */
> +	{ 0x40000000, 0x40000000, 0x80000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCML - alias */
> @@ -194,6 +230,12 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
> +	.att		= imx_rproc_att_imx8mn,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> +	.method		= IMX_RPROC_SMC,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -235,12 +277,24 @@ static int imx_rproc_start(struct rproc *rproc)
>  	struct imx_rproc *priv = rproc->priv;
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct arm_smccc_res res;
>  	int ret;
>  
> -	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> -				 dcfg->src_mask, dcfg->src_start);
> +	switch (dcfg->method) {
> +	case IMX_RPROC_MMIO:
> +		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> +					 dcfg->src_start);
> +		break;
> +	case IMX_RPROC_SMC:
> +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
> +		ret = res.a0;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
>  	if (ret)
> -		dev_err(dev, "Failed to enable M4!\n");
> +		dev_err(dev, "Failed to enable remote cores!\n");

s/cores/core

>  
>  	return ret;
>  }
> @@ -250,15 +304,26 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct imx_rproc *priv = rproc->priv;
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct arm_smccc_res res;
>  	int ret;
>  
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	switch (dcfg->method) {
> +	case IMX_RPROC_MMIO:
> +		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> +					 dcfg->src_stop);
> +		break;
> +	case IMX_RPROC_SMC:
> +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
> +		ret = res.a0;
> +		if (res.a1)
> +			dev_info(dev, "Not in wfi, force stopped\n");
> +		break;
> +	default:
>  		return -EOPNOTSUPP;
> +	}
>  
> -	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> -				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
> -		dev_err(dev, "Failed to stop M4!\n");
> +		dev_err(dev, "Failed to stop remote cores\n");

s/cores/core

>  
>  	return ret;
>  }
> @@ -594,6 +659,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
>  	struct regmap *regmap;
> +	struct arm_smccc_res res;
>  	int ret;
>  	u32 val;
>  
> @@ -601,6 +667,11 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> +	case IMX_RPROC_SMC:
> +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
> +		if (res.a0)
> +			priv->rproc->state = RPROC_DETACHED;
> +		return 0;
>  	default:
>  		break;
>  	}
> @@ -751,6 +822,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
>  	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
>  	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
> +	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
> +	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> -- 
> 2.30.0
> 
