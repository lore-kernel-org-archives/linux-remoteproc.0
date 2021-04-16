Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1276C433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAA4F60FF3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243550AbhDPRqy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243541AbhDPRqw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Apr 2021 13:46:52 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7386C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:46:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id s14so9563276pjl.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7wXuYb2sAQupo2LG+aIJB2xPslEGiIuMvjBT329yg3U=;
        b=J5PjHQGscCeSuO/gbZXuoewf8jGW9qKmFdTqS24XZn2uTUgChpjgJRSE0zIyVx56Wh
         K6ruEk05Qdf/5KJuHfJh2gsM6DgcJMLk5XKJdzJRHkL5lactllzN9rrVHBS3m4GBuPHW
         eErmAOFfOjDA/Gt40EEImNaXyzYe9+WbtA+ropKWwpYzYE1tOk8HmAhaJuhfg8l14tS1
         CfAvjkhATJRg+pCAjnA8NuY+7lDvuXhPFECRnCp9ZI6N07vSV0SN/rLQq6OvPXv2/Jtt
         nNvYqgvphMkTuvocMNUxcBqqrnKDOd6jNIrLIhFiOp9Oxgy7/iZfIezi6KBvTcO48Upy
         qVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7wXuYb2sAQupo2LG+aIJB2xPslEGiIuMvjBT329yg3U=;
        b=jXLYqenzj0uJahLoiCuzLtv/a+P6LyV1TZxbyIQGlVq1peYOgsAWsTtGSV6ckWPajD
         K5y8ktaLuK5gytISPzYcqXUIYXZZUJfZpk2pyK/BI6XUeuTlbH1MpZTatJ1Y5XCbna9q
         lsdVp/xQdcIQaXFXcHTgIGKOJ1TgkTtY/Pk8HERx2w3NAKhbe6g9Oax17ra1uKIIRXDS
         KoT+NsskbIOjTC//e6Av5lI3ufUAqt36U6Ok8YArCVCDHv30UKCJyTjYIjFT2mPJr9zQ
         epiHsoOn+tauCdZA8BUKkneTaRNPcT1rt4yy9LdQD/NXne5G7nrOrG7gyGQDUj2p5pY4
         255Q==
X-Gm-Message-State: AOAM530VzrOZROO2m4GssUTNMcmZbR78qId8TvcgT+jNMlMEH1+/kTF5
        VkL3QAeVfGw7CQfCMkIHtDTdGw==
X-Google-Smtp-Source: ABdhPJzfFYb59axooQ1Dcvl2ibVjHLLezR7oN3SWOQimhjaIEN5XT1qNMQndTGWqeZYEeUsA9MoKxA==
X-Received: by 2002:a17:902:f1d3:b029:ec:7b6e:5826 with SMTP id e19-20020a170902f1d3b02900ec7b6e5826mr4473776plc.22.1618595184388;
        Fri, 16 Apr 2021 10:46:24 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w123sm1891141pfb.109.2021.04.16.10.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 10:46:24 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:46:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 6/8] remoteproc: imx_rproc: make clk optional
Message-ID: <20210416174622.GC1050209@xps15>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
 <1618493261-32606-7-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618493261-32606-7-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 15, 2021 at 09:27:39PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> To i.MX7ULP, M4 is the master to control everything, no need to provide
> clk from Linux side. So make clk optional when method is IMX_RPROC_NONE.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 46 ++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 2b633fd..56dfcc1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -606,6 +606,35 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	return 0;
>  }
>  
> +static int imx_rproc_clk_enable(struct imx_rproc *priv)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/* Remote core is not under control of Linux */
> +	if (dcfg->method == IMX_RPROC_NONE)
> +		return 0;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "Failed to get clock\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	/*
> +	 * clk for M4 block including memory. Should be
> +	 * enabled before .start for FW transfer.
> +	 */
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -654,22 +683,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put_mbox;
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(priv->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		ret = PTR_ERR(priv->clk);
> -		goto err_put_mbox;
> -	}
> -
> -	/*
> -	 * clk for M4 block including memory. Should be
> -	 * enabled before .start for FW transfer.
> -	 */
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret) {
> -		dev_err(&rproc->dev, "Failed to enable clock\n");
> +	ret = imx_rproc_clk_enable(priv);
> +	if (ret)

Much better

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  		goto err_put_mbox;
> -	}
>  
>  	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>  
> -- 
> 2.7.4
> 
