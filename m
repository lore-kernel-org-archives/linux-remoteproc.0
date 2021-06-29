Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA2C11F67
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 16:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9293A61D88
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 16:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbhF2QGf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Jun 2021 12:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhF2QGS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Jun 2021 12:06:18 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47F1C061280
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Jun 2021 09:03:48 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id b2so24430646oiy.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Jun 2021 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=22YCX1gTuHxij8jBkd6zakC86sS35hKmpf8kUxvjUtA=;
        b=uNeO5HQ/ALYrv8nofxfYkzdeDAGS1Xx9YbfqiTXo82HWDllL+J+AvuQpCzIVUM8K+a
         SKl340JpBbSYnEzjVYXgxousi3t27+S5sloXkIBnbywCuwwUDmadKGIVmFozaPq1S2zo
         /CQnqX/w48kCBJ4oUo15C37Nx1sSYhDwWr1YcAf0lKMLGuOwwsleJ0t15S65WSS570QZ
         AtgV6/DxttbW5g7DSxr/F8Mbu7uylHJ9wV0w5LtaeAHRU32gQRnHzz3uB52Ux6cXBsnq
         RJrfqVVqO5cRx1P2B0dT28h6QzLckbINiLl1dsuoPFfYrYS+Fm8vGnvJ3exh8T6U2qc5
         ZUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=22YCX1gTuHxij8jBkd6zakC86sS35hKmpf8kUxvjUtA=;
        b=m9RaAcQmZaVgS0fld8Eu55UaxnvA4h/3zd8lo4Fs46jJgaloUkVLY5/Q2HKZ9ki/3q
         RV5R1SO6DsudcRX9+oCcrrfI3s8rzS2K3VyxOJ2FAU3YTjJdHQy05ajEIsg9XhghEa3x
         APDwZmb0VpGOef+OXdLcCwBOUEGKXhan9RtKD1Zzw5fs5V8lhna+bW3gRWFDSw7rgXex
         S57AXb9bQ8jnLw1ZDf2ShJwMCsl8L9qugliDazErbDG1DjJ3IFgCLP80eFaWNiZDb7qu
         AuvAAC7Y2YjHxgCKlFkvXHa+gWjIqbvOk0D0XK1oGspVn3Yt5hB0ofIvvt6PF7hYf6Er
         pIhg==
X-Gm-Message-State: AOAM532fJYBzRhOCqZ5xMpl+q5oazynmcBf/WIEOpkqNPxIii3Hc90qk
        OXQ35/1GmPpolOofuHLjTXA/RA==
X-Google-Smtp-Source: ABdhPJx4ReJpcx5aMpggn8YB+452U+YvCzJu2XF3zGPSA+kp4p1LMkT+7egjWO81/LUgvGGbBcRaNQ==
X-Received: by 2002:aca:3285:: with SMTP id y127mr22031113oiy.115.1624982628172;
        Tue, 29 Jun 2021 09:03:48 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y18sm3941779oiv.46.2021.06.29.09.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 09:03:47 -0700 (PDT)
Date:   Tue, 29 Jun 2021 11:03:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Phil Chang <phil.chang@mediatek.com>
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com,
        mark-pk.tsai@mediatek.com, weiting.tsai@mediatek.com
Subject: Re: [PATCH] remoteproc: export rproc re/unregister to virtio device
 APIs
Message-ID: <YNtEYUuW/OKSQlfp@yoga>
References: <20210629150002.8050-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629150002.8050-1-phil.chang@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 29 Jun 10:00 CDT 2021, Phil Chang wrote:

> In some case, the remote processor already boot up on previous state,
> but still need register to virtio device, so that exported those APIs.
> 
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> Signed-off-by: YJ chiang <yj.chiang@mediatek.com>
> ---
> Hi
> 
> In our case, the remote processor is already boot up in u-boot,
> we don't want to boot again or load fw in driver but register to virtio
> device for rpmsg. so that needs those API exported.
> Furthermore, the rproc_vq_interrupt is exported, so those functions
> should be exported also.
> 

Would the recently introduces support in remoteproc for "attaching" to
an already running remote processor be useful to you?


If you don't need a remoteproc driver, but rather just want e.g. a
platform_driver that spawns the appropriate virtio devices, wouldn't
virtio_mmio work?

Regards,
Bjorn

> thanks
> 
>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 0cc617f76068..e23658a76f5e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -425,6 +425,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  out:
>  	return ret;
>  }
> +EXPORT_SYMBOL(rproc_add_virtio_dev);
>  
>  /**
>   * rproc_remove_virtio_dev() - remove an rproc-induced virtio device
> @@ -440,3 +441,4 @@ int rproc_remove_virtio_dev(struct device *dev, void *data)
>  	unregister_virtio_device(vdev);
>  	return 0;
>  }
> +EXPORT_SYMBOL(rproc_remove_virtio_dev);
> -- 
> 2.18.0
> 
