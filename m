Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCD5C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 20:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB4BE22A83
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 20:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390432AbhAKUrn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732560AbhAKUrm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:47:42 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0044C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 12:47:02 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id t22so7813pfl.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 12:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0850ujLUfr+Sd4YSpOl+ae9e9f2P4z33sSNVJYhmzJ4=;
        b=VPDJpyC63ZR2U+NpeH3KcOwIOYJ2F1z9dCldBbuMpQqwMqrwLpmInTFrlmFR/qfKIX
         bLx6JtkmwibrAJbjDHssAuKqjihgT3I/GsuoRhQ4L5RcP5lw7LyXi+svMTHJYjaJIPLh
         AAx+c2X5JjcUAc0T2U5H7N9qcb6v6foWerrgnQytDaBpWLo7guAPm/l0dk0YJxGHjrek
         YzCs01T6eDZ7Hrs+yyvin+j14rLd7vTU24o0IjueKeigmfSL9jrLD0jRuTn/G7QbRf78
         niRYqXmDAHyxes61Y0QY26rz2b9TDuknHXYzvORNzfkpGXYnTGqLueu5Pq8Xai7ODrTF
         e+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0850ujLUfr+Sd4YSpOl+ae9e9f2P4z33sSNVJYhmzJ4=;
        b=cWs9oWVLYDZUWhbgCDNmwB5vPlluU0OP7yny657ij2CMYSQF9epf0yGFMuF+hhtJN/
         Vvj7QeU+D4y/kumlKhQDuvcgV0mr4r1VMd+dqtwisI/om83y3oQplWK1XH9nQ4k8LqDJ
         J107WC354lfppVga7S9qMHckOmoawFNuOyigXv1AqpoyOP9ECnH4ok77AmTPLOP0BUQC
         OkX/v5vUv4oBUncWypmS2nLLT/1K7YSI1+TjuE9P15lDBHELtc3XC4k2VHrtLEdxnMST
         BuYeohS60pkuK0kbMae5rq9/BtOoIqrV0Aszi8Se9FeGBN5QWs4seroQFMAZX9nsvB3h
         WrrA==
X-Gm-Message-State: AOAM531R2nmIOB3B+DUyloT8Acw2doVcx9bRwhe0sUIC4gzq04iFEFvF
        96qd6XERMGEuJIwGTEdvEf4k4w==
X-Google-Smtp-Source: ABdhPJzuh+bFsDFldPJKqcfzJx+5Ttv5Iz7raUusESoXKN0qXz4dFPkLC91Sn+XQ7UTdODzVkn0p9Q==
X-Received: by 2002:a65:4983:: with SMTP id r3mr1326949pgs.288.1610398022258;
        Mon, 11 Jan 2021 12:47:02 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id mw15sm259868pjb.34.2021.01.11.12.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 12:47:01 -0800 (PST)
Date:   Mon, 11 Jan 2021 13:46:59 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V5 4/8] remoteproc: imx_rproc: use devm_ioremap
Message-ID: <20210111204659.GH144935@xps15>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-5-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229033019.25899-5-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 29, 2020 at 11:30:15AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> We might need to map an region multiple times, becaue the region might
> be shared between remote processors, such i.MX8QM with dual M4 cores.
> So use devm_ioremap, not devm_ioremap_resource.
> 
> Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 2a093cea4997..47fc1d06be6a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -296,7 +296,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		if (b >= IMX7D_RPROC_MEM_MAX)
>  			break;
>  
> -		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
> +		/* Not use resource version, because we might share region */
> +		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
>  		if (IS_ERR(priv->mem[b].cpu_addr)) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
>  			err = PTR_ERR(priv->mem[b].cpu_addr);
> -- 
> 2.28.0
> 
