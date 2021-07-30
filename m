Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730C2C4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Jul 2021 15:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AD0760EBB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Jul 2021 15:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhG3P6R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Jul 2021 11:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhG3P6P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Jul 2021 11:58:15 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7F4C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jul 2021 08:58:10 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id b25-20020a4ac2990000b0290263aab95660so2564728ooq.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jul 2021 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xXNqWSr/rOC4EQDcPG5tueBmU/blNavYsUX/3Rklcr8=;
        b=TDxHet75+KJYPXBOyj4Qpsipf04ggYz4gNIiL7z5WeCaNCEbDWbw1ludfUUdIAwnWl
         QELftxDKswIa8A3hXuESnq0jCFZVthL2BR0JI6HaeD3lRv42W+9LVTO//VJ4T1NM853T
         ORYy1yyDaJHLj0a20bBy2HOXSkLPGzewxTAU7JEbvpQzabOxTg7cDCNVVXV6kiXVtewj
         d0m2Aax3ksfa5nt2bjLkkU6+oWaj8MC0vGZMHyB3cVsUbh8mrvU0HV8YRVBkXsOamJ6Q
         sm5hNuAcWgRt99OxxHE6bWTzukgLVRxjqOLPgz+9zzWfR3s3s9V0XZOn9GTY+p4uAM/D
         OhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xXNqWSr/rOC4EQDcPG5tueBmU/blNavYsUX/3Rklcr8=;
        b=DzbeCZN0TEALA0NPPa1vHYg+eswsaSrnua4dMxQIdfwhX20rZDTZOKM6RrVIhnPzUD
         4oUgebkRZfy7PbojHdfmrPluSsEAwJJuq3F1i26Fz+lhnx/H6QUaS+PYioFFCrLuR5wc
         C0UZNUahbi88/qRIOIv2kpr4VCZpPSv1RAdMHrogmcBGUYIxaUhH7BbhUJwfPWDal8ch
         Fu5yg+J8Mf9ftBv6r5tkLI1R6f0S0/nBlTCTnacdr0wRryW5BINnzuoFf6YukpEfdHQy
         JfHHyl/kTK8HqcHwDE8UNVjcPZbBL9GiiD/U9tkJzHKm8kzgc1vub4+rB9gUCDOzSbvq
         Z6sg==
X-Gm-Message-State: AOAM532MiD6hFLnDcZdrADPcsYegWdNH51q+3d2oRL3kXPguF+0Qtv2a
        AhQK0dFnIpesqxH4mfqHZQP8aw==
X-Google-Smtp-Source: ABdhPJxNj8jj5sY4NGuc2RO8NVr4KbyZYhV+2uDrbtcKs+ITXyvoyO/r+/cURV1f+got7YHENp8UZg==
X-Received: by 2002:a4a:6042:: with SMTP id t2mr2154509oof.31.1627660688308;
        Fri, 30 Jul 2021 08:58:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z22sm282294ooz.20.2021.07.30.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:58:07 -0700 (PDT)
Date:   Fri, 30 Jul 2021 10:58:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com, tzungbi@google.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 4/4] remoteproc: mediatek: Support mt8195 scp
Message-ID: <YQQhjuqAaT1xaIWM@builder.lan>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-5-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-5-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 27 Jul 22:58 CDT 2021, Tinghan Shen wrote:

> The SCP clock design is changed on mt8195 that doesn't need to control
> SCP clock on kernel side.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e..250cb946ea37 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -785,7 +785,7 @@ static int scp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto destroy_mutex;
>  
> -	scp->clk = devm_clk_get(dev, "main");
> +	scp->clk = devm_clk_get_optional(dev, "main");

This makes the clock optional for mt8183 and mt8192 as well.

How about using mtk_scp_of_data to denote if the clock should be
acquired?

Regards,
Bjorn

>  	if (IS_ERR(scp->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		ret = PTR_ERR(scp->clk);
> @@ -877,6 +877,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
> +	{ .compatible = "mediatek,mt8195-scp", .data = &mt8192_of_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> -- 
> 2.18.0
> 
