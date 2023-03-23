Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430AFC74A5B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Mar 2023 22:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjCWWgs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Mar 2023 18:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjCWWgr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Mar 2023 18:36:47 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABBD234F7
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Mar 2023 15:36:46 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c18so227234ple.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Mar 2023 15:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679611006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2EVXxP53sCH2kR6bCBtvDTkeq2j54v1M0wBknWsFZk=;
        b=ZDA+QqKpKudc5b7HJjQhCTmQKFpajXXwL+MJK7LJJ+QCYEeuGxhdnT43AIVD9GIEVf
         x7PYsZCTx+EOLgN23mOLbXglwf6ovJBiKZ1VheRL27JswcOj5Tn99O/isD2UJk2mrpUW
         PGDgsNjyO/OCLJfd1Wtx1aFXzsuFoGSkxG9g9b6zSwE25q2DYK9iKF3545ir0kmxObm0
         i2d0h5UtyJ5mMVYn8ulD/GV+txzg8TWcG6B/1PRZIh/JELWARKZBkUziUfpwD0h0uPdv
         CWshmbyPLp2T/BpPhYy7gl573EPRBreyyjDvvlky+xoTXZyya6RWwgBoVKJ471QOH2I2
         JUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679611006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2EVXxP53sCH2kR6bCBtvDTkeq2j54v1M0wBknWsFZk=;
        b=pvDqs4mYkV5d4kqqVLfXfW1kM7xST2p7BhDJH87ihNxsnAbW55FaTLHubuVIGtWfN1
         waHI1MAb2zS8i9aMRjud6PlOg1kGDglqQ2AmWiVf6tUeWdY278NBMbqxYAUTfp6pPU6Q
         56G0as7YEMWfSnw60qDSbURl46m8+4y58loPh2O/JOy7a3HcbOBJS2d4ZrdRG9kTVU68
         xuBpto/q/0OubQg0iwoW2l+rurArCLd3DnCGNNX4yBKuj8fxh+9te5polIuO+jrh09FL
         Oq44kx987AiV9oDFZ7rVJAzdG1kJVz3/Lee+i104JpaUpxBySGiOLeYiDEOB2NeApCyS
         kv1A==
X-Gm-Message-State: AAQBX9eDLmC+VXocNV6wtiLX7laIZtxHbHlPwBN26DOkg23USERdgVOl
        LVGIFBXoyhnkkqSd2/innEkrjA==
X-Google-Smtp-Source: AKy350a8Hts1wCQys+KoyaeDXX6B3yC3s3JOLLf8LLeRQwdW+r3kjhnmJG52vH6H6vfw5z4UgWerLg==
X-Received: by 2002:a17:90b:3811:b0:23b:3d6e:1ed with SMTP id mq17-20020a17090b381100b0023b3d6e01edmr587920pjb.13.1679611005616;
        Thu, 23 Mar 2023 15:36:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e403:39f9:7f9f:340b])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090a7a8300b00230b8402760sm1713333pjf.38.2023.03.23.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 15:36:45 -0700 (PDT)
Date:   Thu, 23 Mar 2023 16:36:43 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ye.xingchen@zte.com.cn
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc/davinci: Use dev_err_probe()
Message-ID: <20230323223643.GA2905636@p14s>
References: <202303231600496082749@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303231600496082749@zte.com.cn>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 23, 2023 at 04:00:49PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 98e0be9476a4..b2b7d3347949 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -278,13 +278,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	}
> 
>  	dsp_reset = devm_reset_control_get_exclusive(dev, NULL);
> -	if (IS_ERR(dsp_reset)) {
> -		if (PTR_ERR(dsp_reset) != -EPROBE_DEFER)
> -			dev_err(dev, "unable to get reset control: %ld\n",
> -				PTR_ERR(dsp_reset));
> -
> -		return PTR_ERR(dsp_reset);
> -	}
> +	if (IS_ERR(dsp_reset))
> +		return dev_err_probe(dev, PTR_ERR(dsp_reset),
> +				     "unable to get reset control: %ld\n");

This patch is obviously wrong and doesn't even compile.

> 
>  	if (dev->of_node) {
>  		ret = of_reserved_mem_device_init(dev);
> -- 
> 2.25.1
