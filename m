Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30C6C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 872182240B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSqmqi3Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgKTXfk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 18:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbgKTXfk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 18:35:40 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16C7C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 15:35:39 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id 5so5676068plj.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 15:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nRTceVwrQo7nc3Kc6KStQCnzuWIzRftiyAd8oL6fIFE=;
        b=lSqmqi3Q157w+EhxtXGbrkd4lSfMsE4CKVqKVirBli6bOwnZN6/opiV6vTd2uXQ1GF
         ApulU6IasNb58YkXkwLIvOkkYl4uS9NzMoYbUq14q9tMxncPbJ+OO+IA/Bn6rp0EIXx6
         y6gDU7gvwPFzcYm5edJ2P5d9u6A43kcI4OZNgNImA8wALXcMAdTWQxsUlqx4ni1IrQHP
         yqs3cXCvS9TuRiFMvk29L+f0v7RuK+m08Z54n3lvu0X4OaZ4NL+E8oTDEsxSh423T4Sw
         rglb8cb16Uw6Wib/oV+A0/9scpXEvLN078NqrIwPPm5x6t66Y/Lr4sye6aUOSIU4iqN9
         oLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nRTceVwrQo7nc3Kc6KStQCnzuWIzRftiyAd8oL6fIFE=;
        b=UqinnM0sizKkhY1OokDvhp8D9HO3B8GI3pRk5qu2/1wF5i4YkA5Z09SVhvq4lp0B9T
         +mMs17rm7mRZPMBgQ8i6tWbJkVNg9wXS9dIhPWd+9vbB8lW5c7e+SCSnJh+o/RZBlyRk
         QpHo3faHs63Biu+Duq+ASx+r2i0R8sQzjP85dZLRZ3wxxL0HwNOmpl+kugeSYGBHCStc
         9YzeZSZSIYUwLpH8a+dZ5E5Q2DjKAO76Oai8IZZ4aYLjPcg8iUjbVss2oPQG1UV0188n
         vEJ2xQE22ddooFRU2I7QISv3qQSVTfMelH3Rt41dINuX0HIXXrtVKiQNZixT6CWelJEV
         cqaA==
X-Gm-Message-State: AOAM5327Ykb3ieG1qPaX5KSdE+Cz/CF4P/vJiCz3Rl+3LoPifHNQBCHw
        QFBYn9l44K0tGOep90Ow9f3wow==
X-Google-Smtp-Source: ABdhPJz7jpiA+PzNI27E9IqxJ7o62Iz6jhCSYhdGO6EHIxHvY5p5FHzAXs1zPrxaX+LDxpqR6FO7sg==
X-Received: by 2002:a17:902:b410:b029:d6:614b:679c with SMTP id x16-20020a170902b410b02900d6614b679cmr16035685plr.79.1605915339434;
        Fri, 20 Nov 2020 15:35:39 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b3sm4721015pfd.66.2020.11.20.15.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 15:35:38 -0800 (PST)
Date:   Fri, 20 Nov 2020 16:35:37 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, pihsun@chromium.org,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] remoteproc/mediatek: skip if filesz is 0
Message-ID: <20201120233537.GH4137289@xps15>
References: <20201116084413.3312631-1-tzungbi@google.com>
 <20201116084413.3312631-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116084413.3312631-3-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 04:44:12PM +0800, Tzung-Bi Shih wrote:
> The main purpose of the loop is to load the memory to the SCP SRAM.
> If filesz is 0, can go to next program header directly.
> 
> We don't need to try to validate the FW binary for those filesz==0
> segments.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0abbeb62cf43..74ed675f61a6 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -234,12 +234,14 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		u32 offset = phdr->p_offset;
>  		void __iomem *ptr;
>  
> -		if (phdr->p_type != PT_LOAD)
> -			continue;
> -
>  		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
>  			phdr->p_type, da, memsz, filesz);
>  
> +		if (phdr->p_type != PT_LOAD)
> +			continue;
> +		if (!filesz)
> +			continue;
> +
>  		if (filesz > memsz) {
>  			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
>  				filesz, memsz);
> @@ -263,9 +265,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -		if (phdr->p_filesz)
> -			scp_memcpy_aligned(ptr, elf_data + phdr->p_offset,
> -					   filesz);
> +		scp_memcpy_aligned(ptr, elf_data + phdr->p_offset, filesz);

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	}
>  
>  	return ret;
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
