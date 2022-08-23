Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB8EC32772
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Aug 2022 20:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbiHWUGY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbiHWUGG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Aug 2022 16:06:06 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0832729
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Aug 2022 12:22:50 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o14-20020a17090a0a0e00b001fabfd3369cso15675558pjo.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Aug 2022 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=vluVKO5NRnQyzyhQUGPfMvMjb6neCROySKrkY1xAivk=;
        b=RFpneXhBxHQqMg0kLtL1zDCS6S1gC3zkpuQU512oHuvBG+thV13/Uz2ISEDeYuBiqM
         aGvSBuo+ONVzOIxbkx/SWFVmfK1YtaVx7n5yiomDC7o3JODhVP3wWul6vOytOuyuQk3X
         ov6AqvXv6EJ5D8a04bCGgg4Vn9eBwVzMSXHMwZ0/FCs2R56Zj9JjErTF0QtxdLiJGRHt
         aSg9MprO91J2uk8MCX64z1mLGpDRIkWe6dEfBTJ9s+qO3qURaRXvsOxeEuq6uYCR+jxC
         daPdllVVFosoOaM7ewD0uO85ckP+/3r2ZE8f+4Jf1wogjxpfwQPIQu6huaOeaTK2YnG7
         1gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=vluVKO5NRnQyzyhQUGPfMvMjb6neCROySKrkY1xAivk=;
        b=3iMIly/yNUImtufADXJeMRRq1LIoBfk+2w22KNyyyIvVecxmt/8F7u4HL5vtDLhMSp
         mg7/EokH7R/dmOsfefNXcqtibtKuW1iTcsCWqDSfTw9toPms4wVuggNlafLYdS+fZuAi
         PmD6AHgWlRHlpVusVbrtf+Wd/8YZmvR6sXoa6pN7hNkE7mbjaeT8059BcJS25xETuvp7
         pyzmcurZqXvvjJ3X0x050/lu5/t9uB+tPjHN3VTtLBykowYW77JDDdS0L+Bfu5VtK8fr
         slw+l91TChzB0uZ0uDtu6Zyitny8MZjK7yS7Bficpg/5kWAgLq/ahN4ewE2w6OyToMtt
         dueA==
X-Gm-Message-State: ACgBeo215s7imQxWJFvJPPLIC9dWrqeZhB4ZZA4rbM08uxgQR+YdaQAh
        WuUDQZaRe/QBT1VtZtxmpIVPrieDqm+2wQ==
X-Google-Smtp-Source: AA6agR6N2D2LqxwUPxnm1OVswfxuCieBbCam/Vy4PEiUjzbJ649yVF+yAFBnMC+7aRyrmSfb6NDHsw==
X-Received: by 2002:a17:902:e809:b0:172:eded:e879 with SMTP id u9-20020a170902e80900b00172edede879mr9633105plg.54.1661282570371;
        Tue, 23 Aug 2022 12:22:50 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p63-20020a634242000000b004291cb9c047sm9556130pga.87.2022.08.23.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 12:22:49 -0700 (PDT)
Date:   Tue, 23 Aug 2022 13:22:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Mathieu Poirier <mathieu.poirer@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Simplify some error message
Message-ID: <20220823192247.GA1781852@p14s>
References: <6b9343c2688117a340661d8ee491c2962c54a09a.1659736936.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9343c2688117a340661d8ee491c2962c54a09a.1659736936.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Aug 06, 2022 at 12:02:32AM +0200, Christophe JAILLET wrote:
> dev_err_probe() already prints the error code in a human readable way, so
> there is no need to duplicate it as a numerical value at the end of the
> message.
> 
> While at it, remove 'ret' that is mostly useless.
> 
> Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/remoteproc/imx_rproc.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 38383e7de3c1..7cc4fd207e2d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -646,7 +646,6 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device *dev = priv->dev;
>  	struct mbox_client *cl;
> -	int ret;
>  
>  	if (!of_get_property(dev->of_node, "mbox-names", NULL))
>  		return 0;
> @@ -659,18 +658,15 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
>  	cl->rx_callback = imx_rproc_rx_callback;
>  
>  	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> -	if (IS_ERR(priv->tx_ch)) {
> -		ret = PTR_ERR(priv->tx_ch);
> -		return dev_err_probe(cl->dev, ret,
> -				     "failed to request tx mailbox channel: %d\n", ret);
> -	}
> +	if (IS_ERR(priv->tx_ch))
> +		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
> +				     "failed to request tx mailbox channel\n");
>  
>  	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
>  	if (IS_ERR(priv->rx_ch)) {
>  		mbox_free_channel(priv->tx_ch);
> -		ret = PTR_ERR(priv->rx_ch);
> -		return dev_err_probe(cl->dev, ret,
> -				     "failed to request rx mailbox channel: %d\n", ret);
> +		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
> +				     "failed to request rx mailbox channel\n");
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
