Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277AFC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 20:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D134A20B80
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 20:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRKK7EsM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732801AbgKPUcv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 15:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730960AbgKPUcu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 15:32:50 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7BEC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 12:32:49 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c20so15249346pfr.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 12:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZpdPZ+0TUHnu7fJ+T8SUFrv2OoPCXOYjcPmZe955kpo=;
        b=lRKK7EsMxuM4sBoqAFrmkkSVVrO4pbm/VeXuc2GRChWOxGic9EagiZl1qvbSjIsdAY
         5F4wWcOchmmU5vS9MfdxxMDy5Ha50/hpX5ol153m49u2M2xRVMdi61mgQsCNcxHoSB97
         1J6UpLvIjd9cyQlWKEzymXop/zzHBFo2LM9B2eUsGglwja4DPy5x8xcNnSpYgwlh/RWv
         xkZHiPrw09jarQ3y+UkYA5B4Bxy+9WsMxvo/yhreNCkiJoMhtCk7WLck6zV3zp6JULNX
         gmrflYY7k+rKpqAljuOkiuDtZBIZ7NX44dy+HxvOL4XXfRaZyZ/Ra78BhtEcNAXcMBrY
         jEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZpdPZ+0TUHnu7fJ+T8SUFrv2OoPCXOYjcPmZe955kpo=;
        b=Z6aSrQxYdJvJ7+WcmRcbfv7C42D+EOIqUWy+bs++KPG+RPUlRuYV/vkSKSWDrY5qrS
         urqduNLMxAkp2D4vnZ8mqzZWYfBh3vc17HyD/GX1Zk/ASHSWqOtKSfHq845C5sCtt34C
         IziJ2spHsw8aNX16FnN3FY2BQKcKUoa0wXoODX3NNK6PLQ4YFiQyApQhEV7uej1BNE2j
         hSi68QuL/GdXXk6TN/EzhlD8Yxaw+cmSJjAvcnrjUtYtmk4sS8Odc3IXNCmqKFAvnOL2
         S9rsS9p7ItYtDQvs6M0jGmsmE89Gx61lf/GG2x3coyNc7zgs4mZkahJEpPHH6XOZQjnQ
         Ch8g==
X-Gm-Message-State: AOAM532C5ZD11kSbgd7jlfNBH/0giu4i6LB2C1FBKZd6RU1bdClQepil
        MTB1sn2HHv9lJi9Zkx1CxpQTqA==
X-Google-Smtp-Source: ABdhPJxobQPtWPJb6lGCS3Y6qZ6XPjmDFCoOPDtYjpvZji1TwBgQY6V5DxDYWnp+FOtk89e05lfUtQ==
X-Received: by 2002:a17:90a:f0c7:: with SMTP id fa7mr718184pjb.3.1605558769059;
        Mon, 16 Nov 2020 12:32:49 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id h3sm18146122pfo.170.2020.11.16.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:32:48 -0800 (PST)
Date:   Mon, 16 Nov 2020 13:32:46 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, groeck@chromium.org,
        drinkcat@chromium.org, pihsun@chromium.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] remoteproc/mediatek: fix sparse errors on
 dma_alloc and dma_free
Message-ID: <20201116203246.GB3892875@xps15>
References: <20201116082537.3287009-1-tzungbi@google.com>
 <20201116082537.3287009-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116082537.3287009-3-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 04:25:37PM +0800, Tzung-Bi Shih wrote:
> Fixes the following sparse errors on dma_alloc_coherent() and
> dma_free_coherent().
> 
> On drivers/remoteproc/mtk_scp.c:559:23:
> warning: incorrect type in assignment (different address spaces)
>    expected void [noderef] __iomem *cpu_addr
>    got void *
> 
> On drivers/remoteproc/mtk_scp.c:572:56:
> warning: incorrect type in argument 3 (different address spaces)
>    expected void *cpu_addr
>    got void [noderef] __iomem *cpu_addr
> 
> The cpu_addr is not a __iomem address.  Removes the marker.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 2 +-
>  drivers/remoteproc/mtk_scp.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 47b4561443a9..b3397d327786 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -99,7 +99,7 @@ struct mtk_scp {
>  	bool ipi_id_ack[SCP_IPI_MAX];
>  	wait_queue_head_t ack_wq;
>  
> -	void __iomem *cpu_addr;
> +	void *cpu_addr;
>  	dma_addr_t dma_addr;
>  	size_t dram_size;
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8ed89ea1eb78..a1e23b5f19b9 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -413,7 +413,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  	} else if (scp->dram_size) {
>  		offset = da - scp->dma_addr;
>  		if (offset >= 0 && (offset + len) < scp->dram_size)
> -			return (void __force *)scp->cpu_addr + offset;
> +			return scp->cpu_addr + offset;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	}
>  
>  	return NULL;
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
