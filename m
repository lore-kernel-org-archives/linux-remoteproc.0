Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9FDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Dec 2021 17:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238222AbhLFRZl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Dec 2021 12:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhLFRZl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Dec 2021 12:25:41 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441B6C061746
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Dec 2021 09:22:12 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id v19so7495321plo.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Dec 2021 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CVLUhQQAZ5d3bvflfTLWN/hDRVK+W46rwirgAK1GbZo=;
        b=uLtAA306uNbVOGBV2DQz+AMqAJ0Ox8EpZjo7xV+nB9YfN3XCLrALgEX1gtaxaKk693
         5XI834TCxgwP8gPPnzCVNMOQuLtQ8PBFLTI36KXws8viqI4tbgMwt5GOjqjORihqeedY
         kaOaJa3dugQl3JraJigtwRGdUpokpjmUyq8jxC+oK8xs21Xc3BCNjyECis+XrFN+oIdD
         1FmOfJZx/vq5m0P1vF2+C8GZRH/K4dY1j7FsB1/mCFpHyFNoQAsMbvAWTRXgDPfjplKM
         2PkBLxvwchdYpSQ9Hs2hORLMuOYvUmK3mzaHY9stp0bm5Y4jWqyYe6qV3NrNu1qBxGgY
         XiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CVLUhQQAZ5d3bvflfTLWN/hDRVK+W46rwirgAK1GbZo=;
        b=p5F3EMM6Mjs3DAO5M0VrD2xZOUR3tpMS7O+qygISRzufTjfZ0iv5cMqs1jOThAzyvT
         E0yAYHq/cqAcw4FVBecJhSfhV6w3PHbpru8N8ZgjODJ4yGjWxMSVCdV5Rd//N48fLlaS
         0MXTNDfZf0e9vSTX1nBngxB/Rt2H2gGVrH4cxb2OqvspYSYuOrDQ2eM3H39qjWcS2E0u
         P5FBlvqjR/2vh6ggE8JDfGCy/z7C4zdTBHRclDAUL2Hr+xlGN9jgJfHeeZEpFItahTqr
         iSw1o4Fnor7X6KHnhk7Z0cO+h1z9WwhiIqSDc79jsWafXUAvuUb3wUL658VCwzrEOiz2
         nD0Q==
X-Gm-Message-State: AOAM530Pfw7YlqtvSpP+UOEu92HPjVSgU8JDwoihfqoe89nAmQFIBAh1
        MpJNNL9y0bA+ykfTW5k5TNNHcw==
X-Google-Smtp-Source: ABdhPJwzo1TNTZtGysaSbo33Z/vsLz+C1MnicIVpDP5d0uOGKRf5dpL6Gy2ZZ6PCLhaewmTIEABPCQ==
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id d9-20020a170902728900b00142805f0e2cmr44563859pll.42.1638811331615;
        Mon, 06 Dec 2021 09:22:11 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 66sm10328124pgg.63.2021.12.06.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 09:22:10 -0800 (PST)
Date:   Mon, 6 Dec 2021 10:22:08 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: ingenic: Request IRQ disabled
Message-ID: <20211206172208.GB1054683@p14s>
References: <20211205111349.51213-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205111349.51213-1-lars@metafoo.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Dec 05, 2021 at 12:13:49PM +0100, Lars-Peter Clausen wrote:
> The ingenic remoteproc driver requests its IRQ and then immediately
> disables it.
> 
> The disable is necessary since irq_request() normally enables the IRQ. But
> there is a new flag IRQF_NO_AUTOEN that when specified keeps the IRQ
> disabled. Use this new flag rather than calling disable_irq().
> 
> This slightly reduce the boilerplate code and also avoids a theoretical
> race condition where the IRQ could fire between irq_request() and
> disable_irq().
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  drivers/remoteproc/ingenic_rproc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index a356738160a4..9902cce28692 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -218,14 +218,13 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  	if (vpu->irq < 0)
>  		return vpu->irq;
>  
> -	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, 0, "VPU", rproc);
> +	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, IRQF_NO_AUTOEN,
> +			       "VPU", rproc);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to request IRQ\n");
>  		return ret;
>  	}
>  
> -	disable_irq(vpu->irq);
> -

I have applied this patch.

Thanks,
Mathieu

>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
>  		dev_err(dev, "Failed to register remote processor\n");
> -- 
> 2.30.2
> 
