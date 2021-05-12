Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E323C2BA00
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 May 2021 17:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A57F613DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 May 2021 17:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhELRyp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 May 2021 13:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245623AbhELQxD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 May 2021 12:53:03 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0ADC06175F
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 May 2021 09:42:10 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id q2so18888381pfh.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 May 2021 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c0VLlOA4O95JRL4lKkh9nBVXdg9khLB5Tb87tWSnVRw=;
        b=GLyllHtwAmx2LbR5f2ncGAhINUHQKpdLq0Va8A1jrEEH4iKxyi8yPxjQgDESkJIxI8
         sgoLTQVM7dgUoN+y2VlM6E/Bw5o4DjbV/YhVFPA0LnMq0wbCkCTecSfv6o4de75oC4YH
         Za+cMwPJonToYd5+eHdZv9MjkDrusuoKNZRgO+4txsra0GzgH0ZKK+r+2SQ4qhaKEsEy
         BZz4C1Wy5j+1iGlQWVlY368VZYQ8G82YQHoSKQMXhYNhcbuA08OH9xoUZ49vl/hWDUnc
         OlnJB/RukALauzfpxqTJekUSL0z1GfxqrbmZAZ8WATDNa0pCbh2J9jeF3PqUqvF2ZlQ/
         KcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c0VLlOA4O95JRL4lKkh9nBVXdg9khLB5Tb87tWSnVRw=;
        b=EzGULXx8SFXn1KINxZxGDrpYAN8xlzRy4IrHHUDWC9R1/l81tWl1Ha5ey1VXCh6qzb
         IVTEX4p+Rf0mBciX8OAN4WLYbbA6az9XqBYz8Z//4hClFhe5L0Eu+ZICSw77QyYRWV/Y
         ajA+Vsm5dA9a3Z+oURFNuZRj/vsEov8PyXVPIY5g6B6kOGmcD/MUZ2yGGb/89YRkdX1L
         diRh02R0dvmXavm3r106byNELLeNgK25xok/W/s3bDIEhlIrFXscsJGQjxiKsq8c6f1S
         fevf5d+pj2cGzw0xwh8iSoBWEuzIZGwE17ipsGGgnZRW6bCL8Py2FqplvLioMoF0jIN3
         8JhQ==
X-Gm-Message-State: AOAM531mfHxQ5SWFOo4jt+tnQ/VT8AoyK4gX5gko36exMGfkm+L/5oie
        5DlD7aLo6F+yP9CnjKl0rWW6ZA==
X-Google-Smtp-Source: ABdhPJzgnbgnzOYlNJGD1LlShrIF+jXPWbxIzI+AR97Zitg5NpGAK4/drZctKAFXCgiOqJMxGrmBPA==
X-Received: by 2002:a63:6387:: with SMTP id x129mr36767474pgb.58.1620837730005;
        Wed, 12 May 2021 09:42:10 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n25sm299936pfo.92.2021.05.12.09.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 09:42:08 -0700 (PDT)
Date:   Wed, 12 May 2021 10:42:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] remoteproc/mediatek: Remove redundant error printing
 in scp_probe()
Message-ID: <20210512164206.GA186911@xps15>
References: <20210511120426.5834-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511120426.5834-1-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Lei,

On Tue, May 11, 2021 at 08:04:26PM +0800, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e578..edb7f7842cb12ad 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -749,7 +749,6 @@ static int scp_probe(struct platform_device *pdev)
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR((__force void *)scp->sram_base)) {
> -		dev_err(dev, "Failed to parse and map sram memory\n");

This kind of construct can be found several times in the remoteproc subsystem
and is also ubiquitous throughout the kernel.  Moveover removing the error
notification does not simplify the code and does little to reduce the binary
size.

As such I do not think this patch is warranted and will not move forward with
it.

Thanks,
Mathieu

>  		ret = PTR_ERR((__force void *)scp->sram_base);
>  		goto free_rproc;
>  	}
> -- 
> 2.26.0.106.g9fadedd
> 
> 
