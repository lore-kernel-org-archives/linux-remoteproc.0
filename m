Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220D7C388F2
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 00:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDDC02225E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 00:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUOw8Jw3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgKCAkd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 19:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgKCAkd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 19:40:33 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C59C061A47
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2020 16:40:33 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 79so6982832otc.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2020 16:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8g3XEWhNRuQu6qyJVUDQn5Yd776lhaG/sklBeFKZtPI=;
        b=FUOw8Jw3Yvhdf10UgO7XLD1nPT5jxInmXvEt6lpwn9SBtCL+trdiJgd4BNX1lfBFpt
         2YcPd54za8rxBDUMqgErDopZKVrA0e6R358kPDgLAlxkjKUmlyRT2xuU6dnwzj3QcSFy
         nAiGIxYfjSI8PkLncWaZxCvQWTpNa3OqGclGu0KYDmD29PnhC/DmZ+ONt/wTtSSeU8Ta
         Umn2hxFJR9pVZKpqco6rCrh3PDR+Zwb0C65TPNNcP1/bGcRycBNTZUevemyRky+eSQGm
         EJfkXruzXx5d0vJ/HvlhoeAGMQCQsOlc6YEXot6dRKo7bSsagClQH29iuHuetI+IV0IU
         WQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8g3XEWhNRuQu6qyJVUDQn5Yd776lhaG/sklBeFKZtPI=;
        b=H6x/m0i1uBSxoWv1rghUXBiJS28i6hdXk+F4Q8X9H10owz3M3IbcRJYZyXZSVgb5Mv
         zoh5iMiQp/zGh87Sg1Yv7aaYLmvogeVPLLCZskBGzfy9b6UXS0yTlMsnjOmk3t86wxp9
         r4LGAu9KsyTwLDIwGdvKtUwdOThJWQQqOeam4Au2f0JHU0Pc57IHfvDh8aq+2HnOPPcS
         ONr/7FFSOhyaArgMWnVTV+ioJBwRSzGGXgTOjRhQ0uVPNY/Zm2s1cNqwmpEUO14b3kHb
         4OGTYWzfbB3uN1djcybATcqpMzvR3aLtgPlB/99FNLL7ajEJnA3PkJvRfrv/ZO5kWjbU
         Xvhg==
X-Gm-Message-State: AOAM533uwkyZNg/FVv1Q6BOI/Vn18NafVLGpbC9M8BeOaAxO2lG8IJme
        EQCnCNYYrMiLa7LWymIFuuIU60veSrmxdA==
X-Google-Smtp-Source: ABdhPJwhjQ2Of8xL/Q4I1BIpRv25zTfLg2l43oGPpgOU4eIvD2mTKg68sqVGmc/cfIekinpQwIGEZQ==
X-Received: by 2002:a05:6830:1af4:: with SMTP id c20mr13862979otd.198.1604364032658;
        Mon, 02 Nov 2020 16:40:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j7sm3904287oie.44.2020.11.02.16.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:40:32 -0800 (PST)
Date:   Mon, 2 Nov 2020 18:40:30 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: Re: [PATCH v2 2/2] hwspinlock: sprd: use module_platform_driver()
 instead postcore initcall
Message-ID: <20201103004030.GC223412@builder.lan>
References: <20201030034654.15775-1-zhang.lyra@gmail.com>
 <20201030034654.15775-3-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030034654.15775-3-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 29 Oct 22:46 CDT 2020, Chunyan Zhang wrote:

> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> The hardware spinlock devices are defined in the DT, there's no need for
> init calls order, remove boilerplate code by using module_platform_driver.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Applied this patch with Baolin's r-b.

Thank you,
Bjorn

> ---
>  drivers/hwspinlock/sprd_hwspinlock.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
> index 4c63e2546064..19d1924044e5 100644
> --- a/drivers/hwspinlock/sprd_hwspinlock.c
> +++ b/drivers/hwspinlock/sprd_hwspinlock.c
> @@ -151,18 +151,7 @@ static struct platform_driver sprd_hwspinlock_driver = {
>  		.of_match_table = of_match_ptr(sprd_hwspinlock_of_match),
>  	},
>  };
> -
> -static int __init sprd_hwspinlock_init(void)
> -{
> -	return platform_driver_register(&sprd_hwspinlock_driver);
> -}
> -postcore_initcall(sprd_hwspinlock_init);
> -
> -static void __exit sprd_hwspinlock_exit(void)
> -{
> -	platform_driver_unregister(&sprd_hwspinlock_driver);
> -}
> -module_exit(sprd_hwspinlock_exit);
> +module_platform_driver(sprd_hwspinlock_driver);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Hardware spinlock driver for Spreadtrum");
> -- 
> 2.20.1
> 
