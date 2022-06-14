Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB5DC43334
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jun 2022 22:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346067AbiFNW4D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jun 2022 18:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242240AbiFNW4C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jun 2022 18:56:02 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5727026103
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jun 2022 15:56:01 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c196so9856400pfb.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jun 2022 15:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3IusMXHsX8HYuqKFhVAp//8FffUIb5+m4kqYcQhh3jg=;
        b=RxGqPWG4PLu3NM7G1OGJljdNFzCExbfYbHK0F3QfUj1AlqNl14KHAaObsvlHet4+oS
         x9VmUWFGotqq93PIhB4uIrDavQHnyGEIlTtHGhytL5VGpCcPwi6nQrHMU3+APZLTwZRq
         89V3DSJMPpkL6yCJT27icAhF2DbnOLs2ezpp4telLSVl3K6+TzV6Uo8LBHL6A3EyQPOY
         5AxYEpzRYPWkw/lPYe22uziM1qC8SG9TIXICerSzuFToms2h+Cmc2A90ofILLIBKPoR1
         WbmNzt29EC3IoKHi3Dc9MPCLP63kvHZeG9uqbxpptSfbkOXScISb7NriHvfMCuEFdVXo
         KCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3IusMXHsX8HYuqKFhVAp//8FffUIb5+m4kqYcQhh3jg=;
        b=wnay9TeCysKQhuMGfsJlbP+3MnRl5IC0UWq1nAxGEse7FU0E83DdmXtUOMw8/ZqkuX
         DV8qg6GnNtMledmVl8iqfQYnMO8QLZrV2VhgucKGrad8I3g82t2KvJOPtqcaDMKim4wW
         xpZBF7nUzp8XBENyDs0WKl/av/L9flwtCixKLtKSdQDN9p8wBFqg/tpd+w3kr1m9AmGM
         Sy6QcwrbTn5vgvmwKncwDhfCZoEUsqIEwN2F3AL5HTapQw2zgoqItShpYORgLUNvZmpf
         47KObeZT8kqj4kXRwvl/wKbYIDrc8kfW6JSuiBVCGeh5VD3AzocH4rWGS9dPpz/Lw3fz
         8B2g==
X-Gm-Message-State: AOAM531YjJTcmIVzwM0al1v73qlnmRFE/xI353AbSr2vZphK1ORsTJSh
        BiTBr4ynUhBLn2r7vCEP5SKiWQ==
X-Google-Smtp-Source: ABdhPJzQWALnoEZmwEIMpTXToHtePoOxJuJdOybO+zv45861A0QgmqxZOSNHez+b33q+mm6rS+sBAA==
X-Received: by 2002:a63:4387:0:b0:3c6:9490:4e4b with SMTP id q129-20020a634387000000b003c694904e4bmr6264286pga.438.1655247360793;
        Tue, 14 Jun 2022 15:56:00 -0700 (PDT)
Received: from p14s ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id z1-20020a626501000000b0050dc7628183sm8366937pfb.93.2022.06.14.15.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 15:55:59 -0700 (PDT)
Date:   Tue, 14 Jun 2022 16:55:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: k3-r5: Fix refcount leak in
 k3_r5_cluster_of_init
Message-ID: <20220614225557.GB1236509@p14s>
References: <20220605083334.23942-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220605083334.23942-1-linmq006@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Jun 05, 2022 at 12:33:34PM +0400, Miaoqian Lin wrote:
> Every iteration of for_each_available_child_of_node() decrements
> the reference count of the previous node.
> When breaking early from a for_each_available_child_of_node() loop,
> we need to explicitly call of_node_put() on the child node.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 ++
>  1 file changed, 2 insertions(+)

I have applied this patch.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 4840ad906018..0481926c6975 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1655,6 +1655,7 @@ static int k3_r5_cluster_of_init(struct platform_device *pdev)
>  		if (!cpdev) {
>  			ret = -ENODEV;
>  			dev_err(dev, "could not get R5 core platform device\n");
> +			of_node_put(child);
>  			goto fail;
>  		}
>  
> @@ -1663,6 +1664,7 @@ static int k3_r5_cluster_of_init(struct platform_device *pdev)
>  			dev_err(dev, "k3_r5_core_of_init failed, ret = %d\n",
>  				ret);
>  			put_device(&cpdev->dev);
> +			of_node_put(child);
>  			goto fail;
>  		}
>  
> -- 
> 2.25.1
> 
