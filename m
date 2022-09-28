Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BB1C04A95
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Sep 2022 17:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiI1RUv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbiI1RUs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Sep 2022 13:20:48 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53A754C80
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 10:20:46 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id a29so13111000pfk.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=9bN9My5ZbeHYHa+eCYmZ+EExYTqNfYOXwgsyfJBXZEE=;
        b=lIcfhWxf/X2WYZb63vELVJjIY3gExm8RBaLCUYE4GSCgPjwFSlU/Ml6fHaC0ZJj3Bn
         xkkQwKw108Nn8tp+fl66fVLDrUFymGhiarsw+vVbXLOqa0lhAxFg0MASxbUFSjtQ6jxV
         +NNEMB1kpHyBVAqfcvaiCRbO7aqKvEfmZ3kBO1UIaRoBXTmXS4Zms9Px4cmQv6eFgIqj
         99aB1eKsLA0iseQYp4uYeZCnLszRbs8jcC+5N1GpsN2QTY/4V6LwR5ImG3CoD51lxqzZ
         HH/tILkrIhQOQj7r7cf7hyOUjeAOUYPGVEDlmjMhpL20aWYsXFrNVC0yp2+K2iNn/aZ6
         ObmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=9bN9My5ZbeHYHa+eCYmZ+EExYTqNfYOXwgsyfJBXZEE=;
        b=lh0UwWRvM5RDlJF6+Bi8e9Ky5WpObWK7/X1xsDr96a7PCsdIQ+nI8l00O02T+VV/LD
         JTl+PRsP4pZDIbfBKCATG+DXZkWj4zXcxzW3uXhgPQ+zLKpP2xfCi5mQS1XIl4hXsOqi
         7j3UGE6ewbwm7ewOMLvutf3B4yQOAbOb/fTHp69m5C4fy+yQMU0u7zG2DwZk63zzYW8V
         ChAh8jtctbNLSCV7VNnbdOiiFM1ZI345FbK9knfk9aKUwljsGLaybubPxueJ4y/Skm/F
         1N+A5bMCGhIhUa4xFSLt/pzXOghG7v3ZseuicMQVA8Psmg3MFdSjeBsN5S1WATR3l2Mh
         YWbw==
X-Gm-Message-State: ACrzQf3lxH8Vrv/YoCgzp81/mhWKCq1QvDXHy97Fb5YFEpP7k3bPD2UV
        J2IQRQZZ40RXZDB5AeA61qGYBw==
X-Google-Smtp-Source: AMsMyM5rDZE9lmdRZgTb8Kd897hQYYOoyyhWPiPshBDFwdCMNfgjTZZjvapXUc1p9NZiGqKPW4C8lg==
X-Received: by 2002:a63:90c4:0:b0:43c:bc86:8ae7 with SMTP id a187-20020a6390c4000000b0043cbc868ae7mr13622186pge.398.1664385646157;
        Wed, 28 Sep 2022 10:20:46 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903120a00b001780a528540sm4118002plh.93.2022.09.28.10.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:20:45 -0700 (PDT)
Date:   Wed, 28 Sep 2022 11:20:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     andersson@kernel.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Add mutex protection for
 workqueue
Message-ID: <20220928172042.GB2990524@p14s>
References: <1664192893-14487-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664192893-14487-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 26, 2022 at 07:48:13PM +0800, Shengjiu Wang wrote:
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> access these resources will cause kennel dump.
> 
> Call trace:
>  virtqueue_add_split+0x1ac/0x560
>  virtqueue_add_inbuf+0x4c/0x60
>  rpmsg_recv_done+0x15c/0x294
>  vring_interrupt+0x6c/0xa4
>  rproc_vq_interrupt+0x30/0x50
>  imx_dsp_rproc_vq_work+0x24/0x40 [imx_dsp_rproc]
>  process_one_work+0x1d0/0x354
>  worker_thread+0x13c/0x470
>  kthread+0x154/0x160
>  ret_from_fork+0x10/0x20
> 
> Add mutex protection in imx_dsp_rproc_vq_work(), if the state is
> not running, then just skip calling rproc_vq_interrupt().
> 
> Also the flush workqueue operation can't be added in rproc stop
> for same reason.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 899aa8dd12f0..95da1cbefacf 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -347,9 +347,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret = 0;
>  
> -	/* Make sure work is finished */
> -	flush_work(&priv->rproc_work);
> -

The kernel documentation for this function [1] indicate that once it returns
there will no more jobs to process in that queue, _unless_ another job has been
queued _after_ the flush has started.  What I suspect is happening here is that
a new job is queued between the time flush_work() returns and the remote processor
is switched off, something that should not be happening since all the
subdevices have been stopped in rproc_stop_subdevices().  

[1]. https://elixir.bootlin.com/linux/v6.0-rc7/source/kernel/workqueue.c#L3092


>  	if (rproc->state == RPROC_CRASHED) {
>  		priv->flags &= ~REMOTE_IS_READY;
>  		return 0;
> @@ -432,9 +429,18 @@ static void imx_dsp_rproc_vq_work(struct work_struct *work)
>  {
>  	struct imx_dsp_rproc *priv = container_of(work, struct imx_dsp_rproc,
>  						  rproc_work);
> +	struct rproc *rproc = priv->rproc;
> +
> +	mutex_lock(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING)
> +		goto unlock_mutex;
>  
>  	rproc_vq_interrupt(priv->rproc, 0);
>  	rproc_vq_interrupt(priv->rproc, 1);

These are not guaranteed to be atomic and sleeping with the mutex held is
guaranteed to deadlock the system.

Thanks,
Mathieu

> +
> +unlock_mutex:
> +	mutex_unlock(&rproc->lock);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
