Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670F7C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 12:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2265C20798
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 12:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237605AbhA0Mw0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 07:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S313964AbhAZWu7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 26 Jan 2021 17:50:59 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51563C0613D6
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Jan 2021 14:50:19 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u4so110048pjn.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Jan 2021 14:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HfLPRs4eN96PH3aPni92mJ/cIVZuitFdz+paWUIHXdc=;
        b=p1q8YfNIA7u32gyMHl7TJSv3C8pAUdbdZcVVyJeHHxhqdhLHk+P8OTRfVFZCZFa1ml
         HZV+DugrPhmS9M9nl9g2cvisAnWA3oB8IvVKgGYF4Iwi1z3ufUCrbwWMnro7yhvl+2hA
         SZvJOIjJi/ECQTP0a/3mbjfiID9kT8scx4h2hoh6QVD+JoIuxuPd0a+MAlkuy1Nu7+dh
         QiffobnwoY8PmHP4pHZ3DbGtIgr++So35J3xhZ3DEiwJYvmu9aVA5QWpGGEh5bXqZCVV
         4Xb36ZW7NeRF2mlrv3IpdYSXGnKKfk39GM52BzF9/CKCaGBtVpXvLClh5bx2sOlzguOC
         Fcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HfLPRs4eN96PH3aPni92mJ/cIVZuitFdz+paWUIHXdc=;
        b=dQop9mgWKKmSJzI/oEGyIqafy21gHXtIud3st3PNrVjcKzpcvefly8MxOFQACL9loy
         /ZSFzp0/0vyPHBoz57am7ZeqNiLlXDZoJ10EC3Z69VmbT/e6CaSFGpA05D/vPizzPrcy
         WODTuNTMG0mMeUC7BIl8bhkgpacz3KSbIJQ3YVwkiJaoXE7waFwbPoo41T685ZpStIaW
         1WkfJPhlOx1PppuFUYP4iYTKVE4x5UMljItKrQCHsNrzf1qlnZKyfiqr4UGOULiY/MOA
         TOINTZFCv6qpMSa3CvUu7uDBnKRPMelrMFiejGU6Ksv1Tu/FXbbrcJOKr5L5atAECbZL
         /TDA==
X-Gm-Message-State: AOAM533hos2CJ8Mvv+Ld7RiHDZ0oKIvJoCeIboTa1r6TViHBvQhYI+yt
        PdfTCqZa2mKV5fztXaVvRHnJHUKV77GLhw==
X-Google-Smtp-Source: ABdhPJwLAu6BefrWU0ja9aPhcbKLTuBvUaG0okxiFmvMeANCUpP0Y7GViBEz7N6HAnGeexcOqrKA4w==
X-Received: by 2002:a17:90b:813:: with SMTP id bk19mr2101295pjb.193.1611701418801;
        Tue, 26 Jan 2021 14:50:18 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id gd9sm16044pjb.10.2021.01.26.14.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 14:50:17 -0800 (PST)
Date:   Tue, 26 Jan 2021 15:50:15 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: ingenic: Add module parameter 'auto_boot'
Message-ID: <20210126225015.GA1100385@xps15>
References: <20210123142956.17865-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123142956.17865-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Jan 23, 2021 at 02:29:56PM +0000, Paul Cercueil wrote:
> Add a 'auto_boot' module parameter that instructs the remoteproc driver
> whether or not it should auto-boot the remote processor, which will
> default to "false", since the VPU in Ingenic SoCs does not really have
> any predetermined function.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/remoteproc/ingenic_rproc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 26e19e6143b7..e2618c36eaab 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -27,6 +27,11 @@
>  #define AUX_CTRL_NMI		BIT(1)
>  #define AUX_CTRL_SW_RESET	BIT(0)
>  
> +static bool auto_boot;
> +module_param(auto_boot, bool, 0400);
> +MODULE_PARM_DESC(auto_boot,
> +		 "Auto-boot the remote processor [default=false]");
> +
>  struct vpu_mem_map {
>  	const char *name;
>  	unsigned int da;
> @@ -172,6 +177,8 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  	if (!rproc)
>  		return -ENOMEM;
>  
> +	rproc->auto_boot = auto_boot;
> +

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	vpu = rproc->priv;
>  	vpu->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, vpu);
> -- 
> 2.29.2
> 
