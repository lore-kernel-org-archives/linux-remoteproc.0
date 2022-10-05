Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823E6C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Oct 2022 15:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiJEP0L (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiJEP0K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:26:10 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE381B9DB
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Oct 2022 08:26:07 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so2080060pjk.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Oct 2022 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=b2eDhIzvuJjsHv2/DwfAjBACGmEeoKasF0f+LJfWpy4=;
        b=yDIJ8ZRMEYVCQFO1ONUXGEjRWvVcL4ThiGTz4epVKemVgaY5GzauwMHGAPuPetOFZd
         1atCE/2CnumELCMAVeQRLc0q96EHO9X+08JgZNM1u4ryBBhLYR+W9J23gpfQ2PKMnxef
         0J6f1eCd0/a4j2CDQgTJn5zjH9mLBnQNb8aSYf7qPclJdqSABVWrvM1f5nA2LMtUtXFU
         svsrSdo0k7K6EK/uICxNBzkN26XLVDBzevv9Lo8h0ZkQkCnleoj3dypTWfA/aHApymbh
         ybz6EN8VmbxmVT4akpxKjIl2EQEmTr16EbO78zJW2+RXq3Z1qbqeDQjzfr+SvX7KK+rW
         jogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=b2eDhIzvuJjsHv2/DwfAjBACGmEeoKasF0f+LJfWpy4=;
        b=1KzAzf+wmmzNXk9iqw4gRkNJJpDUkoVBpgJJgNjdIuX+hNLglGCbR249hGa/gSk2/0
         Xy0cPTIrJr6uxuQVKwxyVJO43BsG0Cr9gI78GK07DlBQ5g+qn2i1WJkqe/AvQypKZQJK
         HPoKZ2E79gReBDZAj5G/9v9eBcPNYqz1RPRbwErRJ/VdNxlOKgtxfywJvKYT8txwkQUj
         XFQiwi8zcHVCR2jTc8gLiTOQTNMeSfKMr6XEXfJOZpaIYr0shN2xhAxbsucc9phxN2b9
         buGHvBSz/RGkAxC8f08AhbECckQ2KR64A9oONlVzxLNqEnHIr17qErm02s5yoLTTD58H
         z02A==
X-Gm-Message-State: ACrzQf0HmrnBqfV564VaTRwJwQUo26PvjFLWj3miNYKzTe21RdtXCFmZ
        uZdHhQgw8jmkkT9yrs4ITerZRKfaRvOc9Q==
X-Google-Smtp-Source: AMsMyM6U1Tjop20XQFBtNuI8reRTz70L8Jz87X/3OM8EuLG/sMQ/s6TIjTbd9f/dOjM1BuBlaJx7AQ==
X-Received: by 2002:a17:902:b693:b0:178:5fa6:4b3 with SMTP id c19-20020a170902b69300b001785fa604b3mr32658463pls.63.1664983567257;
        Wed, 05 Oct 2022 08:26:07 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a0f1700b001efa9e83927sm1249541pjy.51.2022.10.05.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:26:06 -0700 (PDT)
Date:   Wed, 5 Oct 2022 09:26:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] remoteproc: virtio: Fix warning on bindings by
 removing the of_match_table
Message-ID: <20221005152604.GA2666639@p14s>
References: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Oct 05, 2022 at 10:13:17AM +0200, Arnaud Pouliquen wrote:
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.
> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Updates vs previous revision:
> - replace the "of_platform.h" include by "platform_device.h",
> - replace "Fix-suggested-by" by "Suggested-by",
> - add Rob's Reviewed-by.
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index a29e3b8ff69c..0e95525c1158 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -13,8 +13,8 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> -#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
> @@ -593,17 +593,11 @@ static int rproc_virtio_remove(struct platform_device *pdev)
>  }
>  
>  /* Platform driver */
> -static const struct of_device_id rproc_virtio_match[] = {
> -	{ .compatible = "virtio,rproc" },
> -	{},
> -};
> -
>  static struct platform_driver rproc_virtio_driver = {
>  	.probe		= rproc_virtio_probe,
>  	.remove		= rproc_virtio_remove,
>  	.driver		= {
>  		.name	= "rproc-virtio",
> -		.of_match_table	= rproc_virtio_match,

Applied.

Thanks,
Mathieu

>  	},
>  };
>  builtin_platform_driver(rproc_virtio_driver);
> -- 
> 2.24.3
> 
