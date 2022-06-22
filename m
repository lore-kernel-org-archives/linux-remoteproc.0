Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CF1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jun 2022 16:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376640AbiFVQts (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Jun 2022 12:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376812AbiFVQsq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jun 2022 12:48:46 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698BD39170
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jun 2022 09:48:14 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso1977452pjz.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jun 2022 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EPjBWJp4+cnUmhtsaExpC0uH3Ar9b7Yqno9YlbKDpEM=;
        b=O/WI9RxqyY3j9zZPBjaivC4PBQRKM241XaCzEoMcdZCZTaGiYw5vhL0IzXVEeZ9/cu
         AfzrnymnQw3E1bgnkaS1k+2DFHWec4a+AZuK3hAage/ENOYpm2dD8Z9M7e5BmGsmhX5M
         cvZh0UuXxLxLDa1UHU6e2uVEKX93bEm5xoncoyPX6AqX9KyS7X9r4NOwTuBYMN3eSDVP
         i2tOv6T/D30iwOCZdCgvOrVLW/fJ+JYJMS3WSKTk7Dp8La6AAiKBEK3z+eYYndqeVoZ9
         5oLHSzh9t87UCBwDWN2LjbIb5ypDPhnPGz6qQsD75wgIuDAoMEVuOMdd3S/OHMKGCeIR
         bwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EPjBWJp4+cnUmhtsaExpC0uH3Ar9b7Yqno9YlbKDpEM=;
        b=mVHGlvC4Qd4icAFy31aFjaeqhz7wz+i0fS21Wwa4t1FhaLzgEg+j8Gq2GyBPVOlx+u
         bKJyqIHBzkMtC328rGs5yXjrqI6vUibVtij7TtiP3BZYnAMFa4AmapvK79xyRa9SonUr
         uRJyPa9QViTLMRJaJmjnq9lJjXRVWGOVzmA/ohf1x+85qRHwoZu8y3Rk3p8IukQ/z3nL
         7bg6XyaD6LtD+CFsfoFSX6KBXJE+/yKg92eo2nUpsDtj0pmKral8kcHZarc5BiklmkxQ
         R0gtnRlaivmnbV0eV36qnR7XpkTfvRtSoJorJU1LS/Bmppceq+qQ5NLQmuHOdGwZbCUs
         q4eg==
X-Gm-Message-State: AJIora8W1RyraWxYc4KgJiKNEoeaJIqA3QNrKCeSkeXirzpOubf1E5fu
        aw0QNsmeUrw8PXCZFmgV9bzgTN+RAB4QWg==
X-Google-Smtp-Source: AGRyM1vZBhmsccGkxKPwH1Yo3egL09IVaEXsJhBfwL5fLkZIk1hFm8xi2xqkz2GE870z9R+SkO1ZgQ==
X-Received: by 2002:a17:902:8689:b0:14e:f1a4:d894 with SMTP id g9-20020a170902868900b0014ef1a4d894mr35075563plo.65.1655916493753;
        Wed, 22 Jun 2022 09:48:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x82-20020a627c55000000b0052089e1b88esm7425385pfc.192.2022.06.22.09.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:48:12 -0700 (PDT)
Date:   Wed, 22 Jun 2022 10:48:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix refcount leak in
 imx_rproc_addr_init
Message-ID: <20220622164810.GB1606016@p14s>
References: <20220512045558.7142-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512045558.7142-1-linmq006@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 12, 2022 at 08:55:58AM +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not needed anymore.
> This function has two paths missing of_node_put().
> 
> Fixes: 6e962bfe56b9 ("remoteproc: imx_rproc: add missing of_node_put")
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7a096f1891e6..6363ed40854a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -559,16 +559,17 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  
>  		node = of_parse_phandle(np, "memory-region", a);
>  		/* Not map vdevbuffer, vdevring region */
> -		if (!strncmp(node->name, "vdev", strlen("vdev")))
> +		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
> +			of_node_put(node);
>  			continue;
> +		}
>  		err = of_address_to_resource(node, 0, &res);
> +		of_node_put(node);

Applied.

Thanks,
Mathieu

>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
>  		}
>  
> -		of_node_put(node);
> -
>  		if (b >= IMX_RPROC_MEM_MAX)
>  			break;
>  
> -- 
> 2.25.1
> 
