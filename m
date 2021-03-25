Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327F8C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 25 Mar 2021 23:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0068161A0F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 25 Mar 2021 23:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhCYXBU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 25 Mar 2021 19:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhCYXAu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 25 Mar 2021 19:00:50 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B90C06175F
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Mar 2021 16:00:49 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v186so3311304pgv.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Mar 2021 16:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NYtrjNLVWQTr/dq5ZWJC4E1PqUHmp98t32XFTCKiVw4=;
        b=EZmqD8jxmBdlgeO8EZfB3JDqfJgcDTb2IC+XJ4WgJherysg5+d+VrBiP1bRB/J6gai
         iq+bZmftHKnQiXYr9d7eBdUTXkLaRGYv0U983t6Usk8Dsuq+ou5WiS1TLizGOl6Ec+J+
         Bvk/Yz5W80G3YVgJMpNz7nSR8y1/G318t/iLk7y3oOZUYFbBdqLdndcQms9GLeKNJCyH
         DcH3qvHPg4NgUbNW5JqbzJdV1Nbq2ceomWP7PCS5PozXk/AiNyIO2sUiWs63qd8Au6Vj
         BYfsWoWk9tlUdVSjKhoeUoR+SWjYjvp7/3pYjA6MgpzoDEtQQBK3Uw+tAcCFfGdiG0pw
         Ff0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NYtrjNLVWQTr/dq5ZWJC4E1PqUHmp98t32XFTCKiVw4=;
        b=s2tRqkLow8rlEv5J8ILb0jmRF1Zm5JWNKRge99LyjX73/gP/NJneQyqe2AxX0Kf5rZ
         XItMG5YngYyy6eR2c+WbUSOjwHMALPbN77YWJ9/nFls9hDQsPfzcLMTD9IAS2Et1Yrgb
         eP9QDg7+smvyB+6TRb9tBL6MQ/1aPfNIkxTztrYmQ2ioWPyl675lRtyUZTG4oWRTZuX8
         2K0QHx5Q1SzSftod4ZFSCossaNXitppxF0Gqz/1Ylv4rLnp1w7rbdWvOUn3ppRuhuC9f
         ht08+7Q/G9CvdFCbAVPMNo008CZKKr38sDT1yhYpZrF6viAHROgidhjzBzEhL2FoAdAs
         /mDw==
X-Gm-Message-State: AOAM533aYvJYyQqRBc+mYxLoBKf0nRX/bAXBV3nEJi8KU3SpFP2Ho3JI
        nTlUJPkplQSr6lqa82SYSwKh+w==
X-Google-Smtp-Source: ABdhPJzvKiD1Kv9upD760EFR6AfmRIrLbT435H9CLx1xpc+/w2S9Ah1dIAy8zg0+rg3yq1M4Fx9J3Q==
X-Received: by 2002:aa7:86c1:0:b029:203:900:2813 with SMTP id h1-20020aa786c10000b029020309002813mr9748625pfo.35.1616713249127;
        Thu, 25 Mar 2021 16:00:49 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c6sm6810901pfj.99.2021.03.25.16.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 16:00:44 -0700 (PDT)
Date:   Thu, 25 Mar 2021 17:00:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
Message-ID: <20210325230042.GB1982573@xps15>
References: <20210319104708.7754-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319104708.7754-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Peng,

On Fri, Mar 19, 2021 at 06:47:07PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> 8 is not enough when we need more, so enlarge IMX7D_RPROC_MEM_MAX to 32,
> and also rename it to IMX_RPROC_MEM_MAX which make more sense.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6d3207ccbaef..24275429a7cc 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -48,7 +48,7 @@
>  					 | IMX6SX_SW_M4C_NON_SCLR_RST \
>  					 | IMX6SX_SW_M4C_RST)
>  
> -#define IMX7D_RPROC_MEM_MAX		8
> +#define IMX_RPROC_MEM_MAX		32

The size of structure imx_rproc_att_imx7d and imx_rproc_att_imx6sx have
not changed nor has there been an addition of new imx_rproc_att that would
justify the change.

It seems to me you are working on something internally and this patch is in
preparation for that.  If that is the case then please resubmit this patch with
the rest of the code.

Thanks,
Mathieu 

>  
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
> @@ -88,7 +88,7 @@ struct imx_rproc {
>  	struct regmap			*regmap;
>  	struct rproc			*rproc;
>  	const struct imx_rproc_dcfg	*dcfg;
> -	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
> +	struct imx_rproc_mem		mem[IMX_RPROC_MEM_MAX];
>  	struct clk			*clk;
>  	struct mbox_client		cl;
>  	struct mbox_chan		*tx_ch;
> @@ -272,7 +272,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	if (imx_rproc_da_to_sys(priv, da, len, &sys))
>  		return NULL;
>  
> -	for (i = 0; i < IMX7D_RPROC_MEM_MAX; i++) {
> +	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
>  		if (sys >= priv->mem[i].sys_addr && sys + len <
>  		    priv->mem[i].sys_addr +  priv->mem[i].size) {
>  			unsigned int offset = sys - priv->mem[i].sys_addr;
> @@ -425,7 +425,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		if (!(att->flags & ATT_OWN))
>  			continue;
>  
> -		if (b >= IMX7D_RPROC_MEM_MAX)
> +		if (b >= IMX_RPROC_MEM_MAX)
>  			break;
>  
>  		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> @@ -459,7 +459,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  			return err;
>  		}
>  
> -		if (b >= IMX7D_RPROC_MEM_MAX)
> +		if (b >= IMX_RPROC_MEM_MAX)
>  			break;
>  
>  		/* Not use resource version, because we might share region */
> -- 
> 2.30.0
> 
