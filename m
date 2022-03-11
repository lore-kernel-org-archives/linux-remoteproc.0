Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260D9C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Mar 2022 18:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbiCKSVz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Mar 2022 13:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350882AbiCKSVx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Mar 2022 13:21:53 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03D7BD8BF
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 10:20:49 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id z9-20020a05683020c900b005b22bf41872so6801060otq.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 10:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0XCZSSYUxWjjomwnD2lYhbaRZ7zlD7qdfMOSwCQW09s=;
        b=kHEPz0z7I7YdLzYk85vXvqchzpmoZwlqoWPvcV2+BaluB1OfX+kOGhpYd2j/KddU4m
         qjRn/G1N3B2vja2ivGtvs4TETE3JVjjO8pLaJ7e1dW72zQatLr3VUNJ8EHDNR44a5vVV
         GYr9ywtSB/boUN+35ZDjRF8aa6Pen6Zm+DaFHceR42V4HzXO+Kughg16fU+KcbccfQXB
         xkmledf3aV+2Re5azWXmv54ti0E0n3TfaXV7vmXZAIbvi45vqyZMXy9YtmqBuUA48HXD
         ApacltuXr4jhv1yO4wx21vOPBLlUz29h6AO50OGlD9Mbf7/X6yNSQ5JbYb9vfMtWZtTT
         REQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0XCZSSYUxWjjomwnD2lYhbaRZ7zlD7qdfMOSwCQW09s=;
        b=xp7S3jAKxMhS333K3ozbefacjEMhNNvbgBRiuZ1chn8oZIZU0CJvE2S4BXa13/Z3Ud
         ApBi6mUTRZXisMWqdwuh/zrglOnRLNu+Gg0d2VADQlEVBMQHmBU0aLbEnUxs7/DWySE9
         xHSQx5xWWopT/EPIqmGUYT8PCmvb4J1tt3Et1/G4rBD3jFD/khNERzWRc3OpW1jQZ7aM
         U1UFuJi9KHbh2geTXzn5KYzS9r0R6T8ucjVAg915e6PjvQill8yip3GJj3S/qZf3vZt/
         AmvwNYNkCVnmRjvqyOQ0pxgno8ZarVC6cqyxPArJS2EymvZmBx+NC2Z4IHs9Bf+zMed+
         HZwQ==
X-Gm-Message-State: AOAM532monAFGSoFJZWmUmuu8VgmtZpe96heuA4CTE7A0UcajlKUNDLm
        q2FmSLi5HAc3SwahBQqNZXcnRA==
X-Google-Smtp-Source: ABdhPJys4u6YxWXymBZmswZzl4L8tNx1NsVBadm2bVHFPU2mgJp3qwIQkLI+5i6YhRQsTFerFhScqA==
X-Received: by 2002:a05:6830:34f:b0:5b1:f8fe:f957 with SMTP id h15-20020a056830034f00b005b1f8fef957mr5499792ote.153.1647022848767;
        Fri, 11 Mar 2022 10:20:48 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id ep36-20020a056870a9a400b000d6bd82a92fsm4167829oab.18.2022.03.11.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 10:20:48 -0800 (PST)
Date:   Fri, 11 Mar 2022 12:20:46 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: Ignore create mem entry for
 resource table
Message-ID: <YiuS/pVVdqFXy9mA@builder.lan>
References: <20220308065754.3355-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308065754.3355-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 08 Mar 00:57 CST 2022, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Resource table will not be used for memory allocation, no need to create
> rproc mem entry.

Can you please expand this to cover why the "resource table will not be
used for memory allocation"?

Regards,
Bjorn

> 
> Fixes: b29b4249f8f0c ("remoteproc: imx_rproc: add i.MX specific parse fw hook")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add Fixes tag
>  Separate the patch from https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-7-peng.fan@oss.nxp.com/
>  Address typo
> 
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7a096f1891e6..f2bfc9077c19 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -423,6 +423,9 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		if (!strcmp(it.node->name, "vdev0buffer"))
>  			continue;
>  
> +		if (!strncmp(it.node->name, "rsc-table", strlen("rsc-table")))
> +			continue;
> +
>  		rmem = of_reserved_mem_lookup(it.node);
>  		if (!rmem) {
>  			dev_err(priv->dev, "unable to acquire memory-region\n");
> -- 
> 2.30.0
> 
