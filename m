Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE18CDB474
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Oct 2023 17:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjJPR3I (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Oct 2023 13:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjJPR3H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Oct 2023 13:29:07 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4775E83
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Oct 2023 10:29:03 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3ae214a077cso3582270b6e.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Oct 2023 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697477342; x=1698082142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmGiWDU9PXt+YAggrEnC/Bk/hTqS6qfb5Emwx53MAJs=;
        b=GqZtGPO7X+T/45fqZEzrVseEVh2+4ds9jwAdirClcLERBin8lxQfSg3VJnKRzj3A2m
         QTsvEIOVlpOfIQI0WTkJq+gCtgbolzeSrhciNk5LXDkWp5vVYMzacFUL0d1HzyD6TvLf
         rzHzsza9n2Jkb1LSn8fCLpSclLYcdkgCAl9OGyP05ipl1eztJfvZPE5w/ToNj1c9oVUb
         RWVK6Kq3+eWtodUE5PLBGo2VvkbsYGOEktmTJKRdC2FMJsJl+C8aDYpf0aHouT+kyPM9
         8pfJsJXRpEp+qr8zmtcpS1pnXhTsTwykf4YSvLjD0ggDxM4s7U/IopmYfj2o/99n/KRf
         YFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697477342; x=1698082142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmGiWDU9PXt+YAggrEnC/Bk/hTqS6qfb5Emwx53MAJs=;
        b=mSf9w64bfws0NyhMQoCnT/hPqqedoTcGlzg+gZhGgdvon+p6czLOkkOtlf6gH60TJT
         ZJZYdtSlAgCHrMGp7fHoXk9m8LPwAreeX3KzUA07fXxqrkyiNyHiFKulr1e9LR3poYdl
         Qvt8E8AGyAQOzxhkRdZESXanXq/1jG1O3/7fBFxvqwtFMKxrpQHiLf930gejxA9bX71v
         BrLm8dbtEonI6Ll1gpU+XD2FFeqsJfmttP638oTsNjy2Qzy/PdluAabPvEOnSJD5om92
         EYIGGm/YFFibfVVmj9JdD/rVDCRm/tfrQxffX7uGIGCW0IpJFQtS2oZC6cC/onEsMB6F
         mMAg==
X-Gm-Message-State: AOJu0YxiwXImKeb73i+3/nlda9J18CbrDIKAa6BpnMGGO1KQ6ox85gBq
        TnRkxsHdFFv6KUQ9JN+TWmzVag==
X-Google-Smtp-Source: AGHT+IEn6oj3+OG3g3K+JmO7h2NGo1Dur2TSSO882ulntrX3L84+CAKXG0csoUB1lRoMEXAUKwCvDw==
X-Received: by 2002:a05:6808:91a:b0:3a7:4987:d44 with SMTP id w26-20020a056808091a00b003a749870d44mr36147099oih.20.1697477342559;
        Mon, 16 Oct 2023 10:29:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9add:9fdd:7517:f866])
        by smtp.gmail.com with ESMTPSA id g11-20020a63b14b000000b005657495b03bsm8391754pgp.38.2023.10.16.10.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:29:02 -0700 (PDT)
Date:   Mon, 16 Oct 2023 11:29:00 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     patrice.chotard@foss.st.com, andersson@kernel.org, robh@kernel.org,
        ndesaulniers@google.com, trix@redhat.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Subject: Re: [PATCH] remoteproc: st: Fix sometimes uninitialized ret in
 st_rproc_probe()
Message-ID: <ZS1ytespl//DoY3Q@p14s>
References: <20231012-st_remoteproc-fix-sometimes-uninit-v1-1-f64d0f2d5b37@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012-st_remoteproc-fix-sometimes-uninit-v1-1-f64d0f2d5b37@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 12, 2023 at 10:04:01AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/remoteproc/st_remoteproc.c:357:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>     357 |         if (!ddata->config)
>         |             ^~~~~~~~~~~~~~
>   drivers/remoteproc/st_remoteproc.c:442:9: note: uninitialized use occurs here
>     442 |         return ret;
>         |                ^~~
>   drivers/remoteproc/st_remoteproc.c:357:2: note: remove the 'if' if its condition is always false
>     357 |         if (!ddata->config)
>         |         ^~~~~~~~~~~~~~~~~~~
>     358 |                 goto free_rproc;
>         |                 ~~~~~~~~~~~~~~~
>   drivers/remoteproc/st_remoteproc.c:348:9: note: initialize the variable 'ret' to silence this warning
>     348 |         int ret, i;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> Set ret to -ENODEV, which seems to be a standard return code when
> device_get_match_data() returns NULL.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1944
> Fixes: 5c77ebcd05ac ("remoteproc: st: Use device_get_match_data()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/remoteproc/st_remoteproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index b0638f984842..cb163766c56d 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -354,8 +354,10 @@ static int st_rproc_probe(struct platform_device *pdev)
>  	rproc->has_iommu = false;
>  	ddata = rproc->priv;
>  	ddata->config = (struct st_rproc_config *)device_get_match_data(dev);
> -	if (!ddata->config)
> +	if (!ddata->config) {
> +		ret = -ENODEV;

Applied and thanks for fixing this.

Mathieu

>  		goto free_rproc;
> +	}
>  
>  	platform_set_drvdata(pdev, rproc);
>  
> 
> ---
> base-commit: 5c77ebcd05acf3789949c8a387df72381d949ca2
> change-id: 20231012-st_remoteproc-fix-sometimes-uninit-7aff1bdb7349
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 
