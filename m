Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3CFC48BC2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 22:01:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDE9A61946
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 22:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhFYWDz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 18:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhFYWDx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 18:03:53 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFD4C061766
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 15:01:31 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso6334788pjp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 15:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SMD41VYFXQVqp0cPLtj6+yt8JTpkYNMg+rAFqmHCirw=;
        b=VP/Vzb6qs7JTdj4hwNxwy0c1Khz5Xixvj0w2gKxikp8MlWvpEBFrNb+Wvd6Zd7GXSq
         5ItkFoUcGwTO6nJ79jj1ZzRqnAkM4TK6e5YWwgMbx1ZwYva+O8wcpVqFRkNfrZ7nWB6g
         DzPC4/6Bhw4+olLR5/pm/3T9PvccSH8pGjcqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SMD41VYFXQVqp0cPLtj6+yt8JTpkYNMg+rAFqmHCirw=;
        b=jdwnalCHloYvXS9kaZD3f5HgvatGLmq6tWlBa8jIyaBQP/t8AfRrIu5sMcWd+U7xp9
         F6M+5xDqYc+c/GdFr0zdb+7889zzru271nrKPuuN10v6vpNFAL/UI8wTWURxtVwvozDl
         rZ2uTESX3JwBpOoEDq9l9pLgZKY9ZjljU2z+HjnDqVKMw/1QIgi0wgKIAAdf+70WI3To
         LnkLPalCSfcFRW33NI9SWhq+wd/xaSKL3BHw/X2vZS9NHb/fx6oSB9YUiuYtRVQiHWcD
         bhyl/gAh6YXDY0DlyA4ZyJTewx97VC+L5kQ0/K/ex3JBVW9QyuJSMbFGi1K4qUBOStZ7
         CvFw==
X-Gm-Message-State: AOAM532mkQkN/1bwPgte4k0gK/iArCHwjfOygaks63M95SRh8CKGTT4f
        vnRo2kdH/YNURkZphWbWerThbw==
X-Google-Smtp-Source: ABdhPJzParOOHJNvX2jGfbfqx7imK+dVIIvvB890LsT4DrwRRGE0klwbfmo7d7J5Jpcf4y/1b+CJPw==
X-Received: by 2002:a17:90a:194a:: with SMTP id 10mr22962696pjh.188.1624658490746;
        Fri, 25 Jun 2021 15:01:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id c5sm6823468pfn.144.2021.06.25.15.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 15:01:30 -0700 (PDT)
Date:   Fri, 25 Jun 2021 15:01:27 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 11/13] soc: qcom: aoss: Drop power domain support
Message-ID: <YNZSN2wXomiZHsz4@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-12-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-12-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 12:22:05AM +0530, Sibi Sankar wrote:
> The load state resources are expected to follow the life cycle of the
> remote processor it tracks. However, modeling load state resources as
> power-domains result in them getting turned off during system suspend
> and thereby falling out of sync with the remote processors that are still
> on. Fix this by replacing load state resource control through the generic
> qmp message send interface instead.

nit: the above sounds as if this patch does all of that, when it only
removes power domain support. Instead you could start with saying what
the patch actually does (remove power domain support), followed by why
PD support isn't needed anymore (now done by sending QMP messages directly).

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 109 ++-----------------------------------------
>  1 file changed, 3 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 998ee7605eb2..f0c3726e8c46 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
>
> ...
>
> @@ -650,13 +550,11 @@ static int qmp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_close_qmp;
>  
> -	ret = qmp_pd_add(qmp);
> -	if (ret)
> -		goto err_remove_qdss_clk;
> -
>  	ret = qmp_cooling_devices_register(qmp);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev, "failed to register aoss cooling devices\n");
> +		goto err_remove_qdss_clk;

This isn't really related with the PD removal, right? I wonder if it was
intentional to have _probe() succeed even when the cooling device
registration failed, since the cooling devices aren't essential.

If it is still desirable to fail the change should be done in a separate
patch, unless it is actually related with removing PD support.
