Return-Path: <SRS0=C6No=CL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30164C433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Sep 2020 16:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A4BB20829
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Sep 2020 16:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5so/Ky1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgIBQ7j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Sep 2020 12:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbgIBQ7H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 12:59:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAFBC061244
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2020 09:59:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b124so3157009pfg.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2020 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PGH19IhlY3wzI+Xgt/jFHbPIkqhJBb7tq7WhHAYr9NE=;
        b=N5so/Ky16b2e29g8iaId2ApITYVADR1eFlQHSFvgrkpveRZ3Javht1yaDfC5rCqRkU
         DZhM0/9FEWl8zKvxNL717MNA66SfEDZRf4MAyFHa0sdtEd9tTx5reLGov0+Wvekr2FBG
         ayxZY09KBpe2z+1kdFFpSD3Wza6J5tpBY81erBr8FPF0uy29rm4ZzSPSd1J9ClEdGxzs
         DOwAkN28gkVtROzagPJqxl7maaWFD5DxZyDyCJTBU3/hg5GrIz9SoVi9aeVT5h+bkI0n
         1MhtO0rFlvVMOPg+MUti/5EPp6paNK+RWt2Hf1iokCDaN2Mm1OxmLSe9JE7YB5p+qwOb
         9RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PGH19IhlY3wzI+Xgt/jFHbPIkqhJBb7tq7WhHAYr9NE=;
        b=OgOcWYEjv6pBuIY+Yjmr0uKj20sxdV00pd0v6/Jz5T+6mpyyoVXWjhmhZghb/+vARe
         nJilSQTiS4wIwQDpad3K1f6zTDpVwOQXpq7eAkDrGIWchwVqH5sdV5b8KaI6j798QBWf
         xeG/8aD0UnLl+LO8X9mFnlKciUzEsNfdyc1zsel3jA3q0IIYuf30ZsWwjC9+Oe186REm
         SYz9alG6G2fWLGH7p/W8CGY9wz77eH9JRc2xiou78B2CL0ENjcJnNkM2+6uhGKOtxtdN
         pdPBWphib/KrVziK3njJmEBXd2zNVkOCLN1GUk2z2XY52HnA2LXXDZbMF3Fyyr1OikjX
         1z5w==
X-Gm-Message-State: AOAM531jhQxU7E5YqzgAzIgK7CCozdzh8NaFFN58njcm+C4fS73DYFiK
        /tRauI8G3Wat86MCphHCgR8kOQ==
X-Google-Smtp-Source: ABdhPJyXfv4cFcte0R82BjGRUtCJHKE80U68pHoAMSRu7S8eTKQiB2OEzLmb+kQOMtsFKVO6AtWF8w==
X-Received: by 2002:a63:31d2:: with SMTP id x201mr2678709pgx.263.1599065946942;
        Wed, 02 Sep 2020 09:59:06 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id mw8sm4848823pjb.47.2020.09.02.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:59:06 -0700 (PDT)
Date:   Wed, 2 Sep 2020 10:59:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] remoteproc: k3-dsp: Fix return value check in
 k3_dsp_rproc_of_get_memories()
Message-ID: <20200902165904.GB280378@xps15>
References: <20200902140614.28636-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902140614.28636-1-yuehaibing@huawei.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 02, 2020 at 10:06:14PM +0800, YueHaibing wrote:
> In case of error, the function devm_ioremap_wc() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 87218f96c21a ("remoteproc: k3-dsp: Add support for C71x DSPs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 9011e477290c..f373df35d7d0 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -445,10 +445,10 @@ static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
>  
>  		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
>  							 resource_size(res));
> -		if (IS_ERR(kproc->mem[i].cpu_addr)) {
> +		if (!kproc->mem[i].cpu_addr) {
>  			dev_err(dev, "failed to map %s memory\n",
>  				data->mems[i].name);
> -			return PTR_ERR(kproc->mem[i].cpu_addr);
> +			return -EBUSY;

Shouldn't this be -ENOMEM?

>  		}
>  		kproc->mem[i].bus_addr = res->start;
>  		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
> -- 
> 2.17.1
> 
> 
