Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA86C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Sep 2021 18:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 723AC6113E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Sep 2021 18:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242587AbhIISDN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Sep 2021 14:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242249AbhIISDM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Sep 2021 14:03:12 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B9BC061575
        for <linux-remoteproc@vger.kernel.org>; Thu,  9 Sep 2021 11:02:03 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id t1so2607481pgv.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Sep 2021 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dJQXSJ02QMh+Wh7r1j+JbzURrGUV/gl8Hy7GcnqmOCI=;
        b=l/yR86TfFYKMMSesXKkjFyGszNrXtteqULk8eK5GjHYPDdsbR43JcpmjHS1f3NAmxD
         QD3Kol0cxHDikvOQDK8v2qEPw0Vn9VNa4YmNhlWEoUTOGgv33+lmPPQ16WHIzgQB1oAC
         Xo+RE0uy9dyt2wsE7qbPMXw5wC3k2KHgExJYHuC/awA9XMW4mRr6uOYeve7AVPgpuZra
         1RAa6h5XYx99F+k3uOLWAbU4AQk1NTUUTsSZ++QA5GUjwsCn//HxcjTSDfyBHE8iZ8TK
         8zW2z9RSxQnvnljsOM4mws/JI1THcrY+J5isVCIuudNuF8zzfU/ORIpWBbMlR3lGfasV
         h+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJQXSJ02QMh+Wh7r1j+JbzURrGUV/gl8Hy7GcnqmOCI=;
        b=zD4B1QN3dFAZ52ATHzO3YDhIBLcydbJWhWkI8QBV0W9t/7FNQsUPQSmPUEeQTXmq5o
         xDhmMAhL5IUl9PXRAawP78JI8xYktHuQ74ZwlgE4nV/k5S3kwEkc4zEUkiLPCRsLea4p
         mpN/iNS73PXxNIFLn2LiPdMOTScXm1ENdcS0Ei4Pa4Y15qG4e1dDR0H6n8fGwooH+24Q
         1tHB54zXhfsyCJuknFkzKQOdslKgBNB8uTh+AtXfKGRmkgh5Sm6mAOJbo8Os7wdclbfw
         4Jiu3KCOpT9fMHwfY5CZ97BN6K6b2tP0v2/r5EI/U+If/m8IVewBEmxChSW+ZZiX6yIB
         w+tA==
X-Gm-Message-State: AOAM532C+fl0WeDWNNIgas+WjRf6g8kZ6rFLfoXbHRdxjYYsNHqECi/1
        nnWjrMUrI9eziXzRjRYI0UeuPQ==
X-Google-Smtp-Source: ABdhPJypPX2nDxAW3yVEJa6gTathAPgYr+otR+hNxtAmfzad85U54J1YqFfluXKmhDFTlwErlZGh5w==
X-Received: by 2002:aa7:8617:0:b0:3f2:3cb2:33bc with SMTP id p23-20020aa78617000000b003f23cb233bcmr4338983pfn.36.1631210522767;
        Thu, 09 Sep 2021 11:02:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p12sm2788993pff.106.2021.09.09.11.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:02:01 -0700 (PDT)
Date:   Thu, 9 Sep 2021 12:01:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        james.quinlan@broadcom.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Fix a memory leak in an error handling path
 in 'rproc_handle_vdev()'
Message-ID: <20210909180159.GA1388472@p14s>
References: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Sep 04, 2021 at 01:37:32PM +0200, Christophe JAILLET wrote:
> If 'copy_dma_range_map() fails, the memory allocated for 'rvdev' will leak.
> Move the 'copy_dma_range_map()' call after the device registration so
> that 'rproc_rvdev_release()' can be called to free some resources.
> 
> Also, branch to the error handling path if 'copy_dma_range_map()' instead
> of a direct return to avoid some other leaks.
> 
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> Review with care. I don't like to move code around because of possible
> side-effect.
> ---
>  drivers/remoteproc/remoteproc_core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..775df165eb45 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -556,9 +556,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent = &rproc->dev;
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> -	if (ret)
> -		return ret;
>  	rvdev->dev.release = rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> @@ -568,6 +565,11 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  		put_device(&rvdev->dev);
>  		return ret;
>  	}
> +
> +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	if (ret)
> +		goto free_rvdev;
> +

Good catch.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	/* Make device dma capable by inheriting from parent's capabilities */
>  	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>  
> -- 
> 2.30.2
> 
