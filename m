Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB523C4361A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 16:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87F6C206EC
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 16:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgLCQfE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Dec 2020 11:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgLCQfD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Dec 2020 11:35:03 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA3AC061A4E
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Dec 2020 08:34:17 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q10so1649486pfn.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Dec 2020 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5GGsUtx8kHaJos54ZjmeEjtitiEQD73mc4B0/G5JBTs=;
        b=Xk2JDXafI8RssLwd0OIM6fQ/apU2/sUaKYG+5ilkeqfhocCwh7w6hUUy0s+/u5/p9q
         3d07hVS5akYFA4wMO8kasD2sjLSnrGCXpfuBHse7Qtmq5E4N+xnLz1uMhzG0tar4t+eq
         xgmQDQefe4btupIMMs97Zq3vvnDL2gMVVi7jN6AoyD5GvUAJg+R2eEyIxfmN8iCxL2Px
         OrkNiy0AMmbflovC5Q6mFysrpCUyGyWSPTacbWY6LUWopmeW8PFiLzTthgRV3KQimHJt
         PSWBzDxQcmajcirSzzutFYEn0ndXdapvPucoH0WwOvuGi7gpR/NBqan0/8n+0FFWkxdx
         mweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5GGsUtx8kHaJos54ZjmeEjtitiEQD73mc4B0/G5JBTs=;
        b=s4ooBPp7ExaVC1QTUURKJhUXovjSov/xyI7wnipiUUiwdUV8VH4t1F3eJlt7uYCctb
         SiNNC87bf8JuxhOvKd9j/loCHlNGB0zeJ+2VpZqzRvtzIOf4jwjy19PetaBo76+Bj+f/
         17KChicn9iUrzxJ4v7bkUbF7w8/GSi6h3CNdGxXFfoM7BriFf2DmjoXf+nF2eAaQYjNO
         2/mLHOewgzVhLNHdmJqTKPb9ZhMeyDybMyWMWmGUh+leWR2gBAsD61gFCri3Kgu9OhxY
         Wzpj2DfiDiXvWzNUpX67Gv/rSm0/fpEHly8BhlTzzY8UTAvMWfclNgRzgdmS3sa3gtZF
         jisg==
X-Gm-Message-State: AOAM530lKZunZZao9AokZfBhQ0QBYatNJFWIHmh89DnWV9ku/AVxC3Dz
        ywe/OlryFeKBJMA+04V/GI4qeA==
X-Google-Smtp-Source: ABdhPJw09oMrlxwfaCkfjUuibwFibHjd/OnkQyeG4nTh9nQBNuMxGiiaZLZW2eehd9qVBSkwFu4dyA==
X-Received: by 2002:a62:88c3:0:b029:18c:3203:efb7 with SMTP id l186-20020a6288c30000b029018c3203efb7mr3972241pfd.33.1607013257460;
        Thu, 03 Dec 2020 08:34:17 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g16sm2222234pfb.201.2020.12.03.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 08:34:16 -0800 (PST)
Date:   Thu, 3 Dec 2020 09:34:15 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org
Subject: Re: [PATCH v3] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
Message-ID: <20201203163415.GA1389853@xps15>
References: <20201203155914.3844426-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203155914.3844426-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Dec 03, 2020 at 11:59:14PM +0800, Tzung-Bi Shih wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> Changes from v2[2]:
> - fix the "Fixes" tag format
> 
> Changes from v1[1]:
> - add "Fixes" tag
> - remove an unneeded change
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/
> [2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201203030436.3583198-1-tzungbi@google.com/
> 
>  drivers/remoteproc/mtk_scp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..5e5705fe35a8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> +leave:
>  	clk_disable_unprepare(scp->clk);
>  
>  	return ret;
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
