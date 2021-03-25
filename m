Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B36C433C1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 25 Mar 2021 23:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8A55619CB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 25 Mar 2021 23:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhCYX6d (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 25 Mar 2021 19:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhCYX6S (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 25 Mar 2021 19:58:18 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD8DC06175F
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Mar 2021 16:58:17 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j25so3687454pfe.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Mar 2021 16:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yPBOGRgpcP3sx4Y9zJvXOBoC4vHpVuUg8a0qvfdxxkE=;
        b=D8ilUHEpcfjX47hC/PluzKURZzUSrmiRopELBYvrVDdSVRsluGgenMjXvUH7SLiUDY
         ffBBFf4NXLIVSDtHAkgqiy4NaWoNuFxtHdveGnlSGFEDfbwz1y9J7iUmS9gT2fAi4XBs
         YPvWUDL07GrGD/UfT26NbLS1nwijdgRVLQFovreZsgfZfR/TybX/7NqtMUKd7PeLUgNn
         xZ9Hcbc6auQ+LYbOJMRbys3F6Ai1Tvez4573ZoONMERgBxnU8smpxr4g0V2y9yPOzfT3
         /OK/2E2wk/1DauobuIK8VIE/vWWgcySpfy21MAHSpqb/IYnQMjmOOBS6wsH4C5uUxV3x
         2tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yPBOGRgpcP3sx4Y9zJvXOBoC4vHpVuUg8a0qvfdxxkE=;
        b=FkeNlg2HPNvNsgprIzMq7WOacqktdqm1qgqrJjRKyqpkh7WIC70fhiy1iEWKiUy+pL
         qKEFHsxgDidgNt+MSNZey7oOmwmWJpn5aCzOCxWvN+PRWapH0G/e8djfp0BzbQ7/p5HR
         J/xvwhidqpS00Xh9iEkOIv24FgqpF7b9oA7jmzrnAT/DSp1OxSFoUiX5HIt+6jVmh7N9
         dh0+VKeguRU3JVngXCmx4M++RFL3kNirjUJWO3SlkqaZ8jnhsRVe5J0O6Oh+jXssDzMe
         7UskzK0EneuWtycOaJcqiXh2A7jmF56O127VYCQ5+PBOhxd/t1bFXrFg36wGGz2FUxoe
         dDVA==
X-Gm-Message-State: AOAM530iQFD3TuYqYgZmjBq6GWSt0+TAORjzuYbQwqfhH1aeiP/NXr6/
        L3FEJd0izLwNeZZsF1JMFrQUhA==
X-Google-Smtp-Source: ABdhPJwPEQVEfCE4Gnw3omC7ZwkrlcNuiylQqg3jJvpfO4We8iEJ7YQ7p6p/dP0DzlXtfxhNPmcW+A==
X-Received: by 2002:a62:1e46:0:b029:1f3:ad4f:9c6b with SMTP id e67-20020a621e460000b02901f3ad4f9c6bmr10309480pfe.64.1616716697246;
        Thu, 25 Mar 2021 16:58:17 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p25sm7103714pfe.100.2021.03.25.16.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 16:58:16 -0700 (PDT)
Date:   Thu, 25 Mar 2021 17:58:14 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_rproc: support remote cores booted
 before Linux Kernel
Message-ID: <20210325235814.GD1982573@xps15>
References: <20210319104708.7754-1-peng.fan@oss.nxp.com>
 <20210319104708.7754-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319104708.7754-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 19, 2021 at 06:47:08PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Support remote cores booted before Linux Kernel booting.
> 
> Add rsc_table to hold the resource table published by remote cores
> Add attach hook

Missing a period "." and a new line between the paragraphs.

> Add imx_rproc_detect_mode to detect remote cores' working mode, and if
> remote cores are booted before booting Linux Kernel, parse the memory
> regions and initialize the table_ptr, table_sz, cached_table.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 64 ++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 24275429a7cc..fdaaf7599cc8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -74,6 +74,16 @@ struct imx_rproc_att {
>  	int flags;
>  };
>  
> +enum imx_rproc_mode {
> +	/* Linux load/kick remote core */
> +	IMX_RPROC_NORMAL,
> +	/*
> +	 * remote core booted before kicking Linux, and remote core
> +	 * could be stopped & restarted by Linux
> +	 */
> +	IMX_RPROC_EARLY_BOOT,
> +};
> +
>  struct imx_rproc_dcfg {
>  	u32				src_reg;
>  	u32				src_mask;
> @@ -95,6 +105,8 @@ struct imx_rproc {
>  	struct mbox_chan		*rx_ch;
>  	struct work_struct		rproc_work;
>  	struct workqueue_struct		*workqueue;
> +	enum imx_rproc_mode		mode;
> +	void __iomem			*rsc_table;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> @@ -229,6 +241,9 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	if (ret)
>  		dev_err(dev, "Failed to stop M4!\n");
>  
> +	if (priv->mode == IMX_RPROC_EARLY_BOOT)
> +		priv->mode = IMX_RPROC_NORMAL;
> +

Why is this needed?  What scenario are you trying to address?

>  	return ret;
>  }
>  
> @@ -398,9 +413,15 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  			__func__, vqid, err);
>  }
>  
> +static int imx_rproc_attach(struct rproc *rproc)
> +{
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
> +	.attach		= imx_rproc_attach,
>  	.kick		= imx_rproc_kick,
>  	.da_to_va       = imx_rproc_da_to_va,
>  	.load		= rproc_elf_load_segments,
> @@ -470,6 +491,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> +		if (!strcmp(node->name, "rsc_table"))
> +			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
>  
> @@ -536,6 +559,43 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
>  	mbox_free_channel(priv->rx_ch);
>  }
>  
> +static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct rproc *rproc = priv->rproc;
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
> +		priv->mode = IMX_RPROC_EARLY_BOOT;
> +	else
> +		priv->mode = IMX_RPROC_NORMAL;
> +
> +	if (priv->mode == IMX_RPROC_EARLY_BOOT) {
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +		ret = imx_rproc_parse_memory_regions(priv->rproc);

If you do this here it won't be possible to reattach to the remote processor
once it has been detached.  This kind of memory parsing should go in
rproc_ops::prepare().  I suggest you look at what has been done for STM32, the
example there is quite good and simple.

> +		if (ret)
> +			return ret;
> +
> +		if (!priv->rsc_table)
> +			return 0;
> +
> +		rproc->table_ptr = (struct resource_table *)priv->rsc_table;

The core is taking care of that, see rproc_set_rsc_table() for details.  

> +		rproc->table_sz = SZ_1K;
> +		rproc->cached_table = NULL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -590,6 +650,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_mbox;
>  	}
>  
> +	ret = imx_rproc_detect_mode(priv);
> +	if (ret)
> +		goto err_put_mbox;
> +

While reviewing this patch I noticed that of_node_put() is never called after
of_parse_phandle().  Please add a fix for that, in a patch on its own, in your
next revision.

Thanks,
Mathieu

>  	priv->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
> -- 
> 2.30.0
> 
