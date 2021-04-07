Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A055FC433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Apr 2021 17:03:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BD6E610F9
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Apr 2021 17:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354485AbhDGRD3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 13:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343936AbhDGRD2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 13:03:28 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D4AC061760
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Apr 2021 10:03:17 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id h20so9663191plr.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Apr 2021 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OgOPSgL3WiygH+uUV8x/1kUBrNk6ThiWBWKBYjCNOos=;
        b=fh0gWlRcIbbF6xKO5z/LxMjDIZNrHePyHjhMPqTy+wFVqtYNAkKe6+wnEuuoO6wYUK
         B04s2gUWEzDEQd1nkf2DLQlEuplS0bIVc8EMkjyQiW3PFEFg/11pdsPyaxfulmHyhrLv
         GInz6FPKUIvELLSkso7nwJZUej5pRMyEZp56ixFLdDkTuc+AcxXqX0XrSioNAWk4VYb4
         33SzjeZ/xjINLsS6UaVKGh5VIcbg9gnVaLAFLc5uk+77yrxa3mapUoT1pD7553bF5+IG
         PaPjZD07Gr94j1dEOqZSeWkC4Sgw1jO0+P8t1VxLjsJWjr3lKa4RTGuBZkkIcERN2Ivn
         UqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OgOPSgL3WiygH+uUV8x/1kUBrNk6ThiWBWKBYjCNOos=;
        b=bbkibhtzjDeEXxquhkeZPFYjzUSsIXZpKV88/nFm4hXfYXFqYeVZypgk/2IMRfMz/S
         5itVi1yaIKBr8XflWPjUKhvUPPC+tl9G2ow85gwyNiztschWTsbf/h9T9TSLrH0J8OfS
         fpm8+ekcwPAuZKVF2XsgrXBLdp4lokeZIEjmfGpn/+3pcWWCvxyKv5Kz5WA+GzWf9M1P
         7Ph0Pj60LSre3rUqcXJ+O3C03BmHSU54yd9lI6OUTStCE9q+QB+YcBiMx7AazH0rmAbu
         QTaMNTgXmaAWwPwllgsvfXh945m/QCNj5XcuFLZ1tbAIsHtPO8k8Tyki+hW3ftoi826a
         t1aA==
X-Gm-Message-State: AOAM533lmSaPi394eEcjsGreIiCFeBpScmj92xsRDD00+xlvwK0rtkbl
        ShKcQNY1QOLL5gN+IjJHYVOglA==
X-Google-Smtp-Source: ABdhPJwfHlXEqzxul/2I6UT1RUGFJn+u9iKMSmWadLvNa7wATRwgHFPMsq2N7ngHmelKqjFlW8I1iQ==
X-Received: by 2002:a17:90a:a513:: with SMTP id a19mr4440084pjq.210.1617814996878;
        Wed, 07 Apr 2021 10:03:16 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w1sm15703544pgh.26.2021.04.07.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 10:03:16 -0700 (PDT)
Date:   Wed, 7 Apr 2021 11:03:14 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 4/4] remoteproc: imx_rproc: support remote cores
 booted before Linux Kernel
Message-ID: <20210407170314.GF418374@xps15>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
 <1617082235-15923-5-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617082235-15923-5-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 30, 2021 at 01:30:35PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
>  - Add rsc_table to hold the resource table published by remote cores.
>  - Add attach hook.
>  - Add imx_rproc_get_loaded_rsc_table to get resource table published by
>    remote processors.
>  - Add imx_rproc_detect_mode to detect remote cores' working mode.
>

This is describing _what_ is being done rather than _why_ it is done.

Moreover for patches 1 an 3 the subject line is tagged with "imx" while patches
2 and 4 have "imx_rproc".  I don't mind which one is used as long as it is
consistent.
 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 45 ++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7cd09971d1a4..d6338872c6db 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -95,6 +95,7 @@ struct imx_rproc {
>  	struct mbox_chan		*rx_ch;
>  	struct work_struct		rproc_work;
>  	struct workqueue_struct		*workqueue;
> +	void __iomem			*rsc_table;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> @@ -395,8 +396,26 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  			__func__, vqid, err);
>  }
>  
> +static int imx_rproc_attach(struct rproc *rproc)
> +{
> +	return 0;
> +}
> +
> +static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	/* The resource table has already been mapped in imx_rproc_addr_init */
> +	if (!priv->rsc_table)
> +		return NULL;
> +
> +	*table_sz = SZ_1K;
> +	return (struct resource_table *)priv->rsc_table;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
> +	.attach		= imx_rproc_attach,
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.kick		= imx_rproc_kick,
> @@ -404,6 +423,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= imx_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
> @@ -470,6 +490,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> +		if (!strcmp(node->name, "rsc_table"))
> +			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
>  
> @@ -536,6 +558,25 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
>  	mbox_free_channel(priv->rx_ch);
>  }
>  
> +static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
> +	if (ret) {
> +		dev_err(dev, "Failed to read src\n");
> +		return ret;
> +	}
> +
> +	if (!(val & dcfg->src_stop))
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -590,6 +631,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_mbox;
>  	}
>  
> +	ret = imx_rproc_detect_mode(priv);
> +	if (ret)
> +		goto err_put_mbox;
> +

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	priv->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
> -- 
> 2.30.0
> 
