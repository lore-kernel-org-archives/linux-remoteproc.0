Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39890C43460
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 17:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A4E5613B7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 17:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347184AbhDMRcg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 13:32:36 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:37746 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347202AbhDMRcf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 13:32:35 -0400
Received: by mail-pf1-f178.google.com with SMTP id o123so11883493pfb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Apr 2021 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YMM/4xDA/XuveKLA+4AHcwRECrJjIXlnjy/ORkscS5U=;
        b=f1UjMDAWvQupgZFDW4liQWuJILKSuu5fkmdWlYe+YSSqK919UYPh1yivPwQs3B5cVP
         PrxWAeeDLMBTIKdQJkrUcwkwL+vnp4zGAqn1N0L7n9Gn3WyM6L13PVHZ7lnkLTpXHQU5
         SlsFG/7P2VgeOVZ1biXi7Cvl96CKUCF0mxUEFzGQ9+LG/h+Qn/MqoDswB93JEjRnZA1W
         d+9z9U7WQDueuKrL9XegzZZcanv0bN4oPx8WX5R4SF3wDZtfXiXYqXB0jkZprzU/523Z
         /bLbIuYNeZo62rG8FujZF41FP8nsZ47PJZiZpO1EyDgZlEjkNB35g/Al9S1TKZLqpsDy
         C8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YMM/4xDA/XuveKLA+4AHcwRECrJjIXlnjy/ORkscS5U=;
        b=oFDAs0OL4n7DUOJk/iwPmbp7+3plmo9DXhh0fy+6hdZjiMqrjPjv3MLhXNl4Qo6jQQ
         146iiKIZwd09LoIaQ0eV3ETxejsHAQISnogry2xCRWoYRTVygYtU080sQVEDX6c67wSb
         DgVo1fHw8y9KHkscV21ynzQ5op+ZF6QdUvPaHGg+ZB9tpLwDsTHWrloD/rE8I5roMgMm
         9HpO1PGQ06BB1PimAZIE6oq8FZKn92ql4RSXy+sWNCGKxC3EmYHw64PSWwcbgWLUw6/j
         3rOu+9qTGIdACNBVTKpejJ9ZduyoKbU44FbTXn9ICaa3jKhJb59/zwqnLSwQa/JfLByV
         F8Vw==
X-Gm-Message-State: AOAM531GgYRIAba27mXpFiSbxyAPtoYX2ge2BB+//D0hS4+9yURlXWlI
        bCia0VqCdZNft8T0KBCNXwGuvQ==
X-Google-Smtp-Source: ABdhPJzFM5tjdD483851MUzDbE+ToSODkBCl/jpHesj1gTMPOMk1WSMgj55e9vYKOekET9+lOcbVfg==
X-Received: by 2002:a65:5c42:: with SMTP id v2mr33772698pgr.339.1618335075427;
        Tue, 13 Apr 2021 10:31:15 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y193sm13468809pfc.72.2021.04.13.10.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 10:31:15 -0700 (PDT)
Date:   Tue, 13 Apr 2021 11:31:13 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 5/8] remoteproc: imx_rproc: parse fsl,auto-boot
Message-ID: <20210413173113.GC750651@xps15>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
 <1617846898-13662-6-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617846898-13662-6-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 08, 2021 at 09:54:55AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Parse fsl,auto-boot to indicate whether need remoteproc framework
> auto boot or not.
> 
> When remote processor is booted before Linux Kernel up, do not parse
> fsl,auto-boot. So add an entry to store the working mode of remote
> processor. Currently only IMX_RPROC_NORMAL, IMX_RPROC_EARLY_BOOT.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index ca17f520d904..c576e12d3817 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -83,6 +83,16 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
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

As far as I can see a new mode to track the state of the remote processor is not
needed.  rproc->state can do that for you.

>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -96,6 +106,7 @@ struct imx_rproc {
>  	struct work_struct		rproc_work;
>  	struct workqueue_struct		*workqueue;
>  	void __iomem			*rsc_table;
> +	enum imx_rproc_mode		mode;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> @@ -565,14 +576,18 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	int ret;
>  	u32 val;
>  
> +	priv->mode = IMX_RPROC_NORMAL;
> +
>  	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
>  	if (ret) {
>  		dev_err(dev, "Failed to read src\n");
>  		return ret;
>  	}
>  
> -	if (!(val & dcfg->src_stop))
> +	if (!(val & dcfg->src_stop)) {
> +		priv->mode = IMX_RPROC_EARLY_BOOT;
>  		priv->rproc->state = RPROC_DETACHED;
> +	}
>  
>  	return 0;
>  }
> @@ -654,6 +669,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>  
> +	if (priv->mode == IMX_RPROC_NORMAL)
> +		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> +

        if (rproc->state == RPROC_DETACHED)

>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -- 
> 2.30.0
> 
