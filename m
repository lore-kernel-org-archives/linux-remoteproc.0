Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654BBC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Feb 2022 19:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243700AbiBQTEO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:04:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244939AbiBQTEM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Feb 2022 14:04:12 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8947C8118D
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Feb 2022 11:03:56 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso10247121pjt.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Feb 2022 11:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tuph2oj2GgXsuvbqidnNP8qpmrKej2apMqYW+XlK6Io=;
        b=C7v6YuXskwE5qqpjDquE19isFipjTh1a/uDmHHgGHzZq6nxIgVIcXz0Tvef+YJUXfD
         /fOMZKaBq3o9L0h62DdfmhCpLXnjrlGsT6tvTA3OkGLsPpUyB57xHPAF5MkFqR5a+kip
         kgGIYl0PFM7/69QzaYLLFMMNoxoA0i3tO/GXalyqztUKmLK//gfgpkHB3b8dCn4tvPG/
         wpDw9bt2jtqAjegT0L4ztLATo8agSVK6Z7jhB482JsQn7TfRch6Z/GUhMCe80VN/+xHL
         Lx+N1DvwYhm/VtGicXdCe8g9444RI+lVkVrO1v0vNXGmsoJViHV3JGVYHEogOO17yn/t
         N/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tuph2oj2GgXsuvbqidnNP8qpmrKej2apMqYW+XlK6Io=;
        b=gLqOi/GPanK7uIFxgMKO9Cz4vOXeBJ5uGpGK2EBYpAdCoVW7tm/F8q0nan/yXixs41
         hGKIGNd5AnCkgH505l678J+6UNOeeoFisZr1NNN3eUfW3roxPQaZGJJ2WvwwcaGMdEFZ
         OgWwVI0Xp3jjEM8droTmK+XOmWKoy32nfyrAVDa8BljKwPtEp5N5Wlq2QpR2i2ugnO5B
         oUR3W8zXx+HVJQhgMtqkcXa/rEIpNdodoZ7EwBqolZcqldqyOZw2m+42Jvl7XF0YYHS6
         vxZdKHGgi50rdegyA1/2y7aCaZXp8PNSAoFJyIM8ur/4EGtHxueXFS+hfwDBTCLaA3/M
         miTw==
X-Gm-Message-State: AOAM531Kjdsby0yg2N6wxRujMOA5Rj7jofJO+UF6oiYV4rmdNdM1i19e
        Xq0hW24G9V6KVXVr86BmUi3CKw==
X-Google-Smtp-Source: ABdhPJwJUoF80WtVQZUaVb6gZsyH67X15ro43d+R6cMm9UpbR3H5yWr2lfCLx+jtXRjbrHysWmFIaA==
X-Received: by 2002:a17:90a:a385:b0:1b9:cfb8:de07 with SMTP id x5-20020a17090aa38500b001b9cfb8de07mr4400794pjp.162.1645124636039;
        Thu, 17 Feb 2022 11:03:56 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id nu11sm2701119pjb.36.2022.02.17.11.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:03:52 -0800 (PST)
Date:   Thu, 17 Feb 2022 12:03:49 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        pihsun@chromium.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220217190349.GA477215@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Angelo,

On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
> During execution of the worker that's used to register rpmsg devices
> we are safely locking the channels mutex but, when creating a new
> endpoint for such devices, we are registering a IPI on the SCP, which
> then makes the SCP to trigger an interrupt, lock its own mutex and in
> turn register more subdevices.
> This creates a circular locking dependency situation, as the mtk_rpmsg
> channels_lock will then depend on the SCP IPI lock.
> 
> [   18.014514]  Possible unsafe locking scenario:
> [   18.014515]        CPU0                    CPU1
> [   18.014517]        ----                    ----
> [   18.045467]   lock(&mtk_subdev->channels_lock);
> [   18.045474]                                lock(&scp->ipi_desc[i].lock);

I spent well over an hour tracing through the meanders of the code to end up in
scp_ipi_register() which, I think, leads to the above.  But from there I don't
see how an IPI can come in and that tells me my assumption is wrong.

Can you give more details on the events that lead to the above?  I'm not saying
there is no problem, I just need to understand it.

Thanks,
Mathieu

> [   18.228399]                                lock(&mtk_subdev->channels_lock);
> [   18.228405]   lock(&scp->ipi_desc[i].lock);
> [   18.264405]
> 
> To solve this, simply unlock the channels_lock mutex before calling
> mtk_rpmsg_register_device() and relock it right after, as safety is
> still ensured by the locking mechanism that happens right after
> through SCP.
> Notably, mtk_rpmsg_register_device() does not even require locking.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 5b4404b8be4c..d1213c33da20 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
>  		if (info->registered)
>  			continue;
>  
> +		mutex_unlock(&subdev->channels_lock);
>  		ret = mtk_rpmsg_register_device(subdev, &info->info);
> +		mutex_lock(&subdev->channels_lock);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
>  			continue;
> -- 
> 2.33.1
> 
