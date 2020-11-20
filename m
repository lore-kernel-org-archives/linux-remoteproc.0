Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9E8C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14E882240B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5IKkXy7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgKTXby (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 18:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbgKTXby (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 18:31:54 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B2AC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 15:31:53 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 131so9358660pfb.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 15:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xEIO6/wEzyK0kZrzGy927QBd/xK3YcJG0eoEjfm1d8c=;
        b=k5IKkXy7hLPF4UkKuPBEklGT1V91wEnWAciAbHkrStWRj5v4gWESyPuiDEiAA/L8xd
         vhgu9cQc+KiegUUiuKe/N6/5XvAPYfLbKqgSp1T8tHM4tIqJWP35ljCXC7McHVed4IiA
         u3GhuFTX41MrbW660ye83JMnrWanbvuKc4jbgHy9d1wckivK+DVK5eCdb9hrSZ4kpd/u
         pxSyt4eXQQrz1BtIk+htAIQXsHymf6aDDgxpJFBo6nTeNsU0+ENaNZHGsdz2v5+pFL8L
         keicqStW710rcOB7s2Hd4Fw0uJDDUfYVTv1BdP+NxXvniyh/jUKoUGnBvdkwLEu4rlzx
         Rfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xEIO6/wEzyK0kZrzGy927QBd/xK3YcJG0eoEjfm1d8c=;
        b=NxWPuXlRL+GuVgOkefD7J48W3ueTiXKjTLD0vlFdJ2U0gOn33mJeVcqiyk7Wj73JTG
         HXBRKYgAk/I++tzjUeuV76bbiSEPGFg/+agdMe3wrbtFkyVYLlE43bZp/R5To5k+MWRO
         fZvYET58DS0wwMJyBCYRYfXTuvqdIwP2Yrle444cGKq4m3wEKg/zET2n1Zgu5h2387tr
         bTzGvnxaBUShRmA3STWPzJrYHFKt6ra6ezHsGu50LM0F/bmKMzwkBUbli66978tBMZkN
         Nf27kPfHbvAW9ZEgvxV/86UGUnt5p3fe9pawCgjxz3zV6HJ2EQv+9PggZplkogm2THRE
         +xww==
X-Gm-Message-State: AOAM532LpJlpSHTbVRH8LlBq3ANoFNgs09YtGw0M2iPisaP/RkvzKZlp
        yVoFlSsGv8Odv+Vk/bNxiobFaQ==
X-Google-Smtp-Source: ABdhPJxSxX7IYQtKm4ZeIuwINPJZEhC+oMtEbu+YSlsWQhi0fEHQV88uZ8/XWi1dG0f7OwdyQHAWog==
X-Received: by 2002:a17:90b:ec6:: with SMTP id gz6mr10965174pjb.142.1605915112733;
        Fri, 20 Nov 2020 15:31:52 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y14sm4823503pfr.73.2020.11.20.15.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 15:31:52 -0800 (PST)
Date:   Fri, 20 Nov 2020 16:31:50 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, pihsun@chromium.org,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] remoteproc/mediatek: fix boundary check
Message-ID: <20201120233150.GG4137289@xps15>
References: <20201116084413.3312631-1-tzungbi@google.com>
 <20201116084413.3312631-2-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116084413.3312631-2-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 04:44:11PM +0800, Tzung-Bi Shih wrote:
> It is valid if offset+length == sram_size.
> 
> For example, sram_size=100, offset=99, length=1.  Accessing offset 99
> with length 1 is valid.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index a1e23b5f19b9..0abbeb62cf43 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -408,11 +408,11 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  
>  	if (da < scp->sram_size) {
>  		offset = da;
> -		if (offset >= 0 && (offset + len) < scp->sram_size)
> +		if (offset >= 0 && (offset + len) <= scp->sram_size)
>  			return (void __force *)scp->sram_base + offset;
>  	} else if (scp->dram_size) {
>  		offset = da - scp->dma_addr;
> -		if (offset >= 0 && (offset + len) < scp->dram_size)
> +		if (offset >= 0 && (offset + len) <= scp->dram_size)

Right, I had the same kind of conversation with the TI folks.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  			return scp->cpu_addr + offset;
>  	}
>  
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
