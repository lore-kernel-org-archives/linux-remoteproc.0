Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173BEC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 20:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3CA4221EB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 20:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vfv9l63v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732484AbgKPUZj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 15:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732478AbgKPUZj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 15:25:39 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5301FC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 12:25:39 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id q28so3712041pgk.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 12:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ERfliqYr2okDo/CXLM9ccwNtHFoL5ZwQlob+5xlpBAw=;
        b=vfv9l63vPqLbgqfRkXqTkQT4X1BgZc+9AaWxyCGLMGbo3Fb8559zZGpnm1gBs+X2zI
         XBsALxhsb+gttWFr+gZ20NGTXHAb9Qm62jHi9Gj7KIIRujCBZ04U3kXGhkNGJ4B/Za/Z
         Z4RWZMiUG77fEkRq57gp7dym8tAta+sXT3F8ACHKN4n+ikRn6+Wkxm17l7CP4uNALafe
         weuw7eimW40MoloINAK8LYAS1oHraPnVh/UI+wb9EQnZvE0dqh+MhbgsIyfV5YG1hhzi
         HZr1P0V4usdhYD1BnF39nuZ+9ZIxz/rU/8ZHIDQQrNdWJK4OZlhPa90V7nYWe/mD9NDq
         /uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ERfliqYr2okDo/CXLM9ccwNtHFoL5ZwQlob+5xlpBAw=;
        b=H+Skhmv63oT3EFIh+hFBHpUQHQk+Gh9SsqB8oAsJOfLPTSqnO6twqIFIBEUtZLiz8h
         1gcQNKzVpKOa9oI0QimOM7M8BsbcwPBQjlFnXwJbtFbYZwJ/7zxr3whyXsz4VFBFLYwQ
         dubZRql2Oi1JzFDHfx5Tp6ueurcMtzXRbygvvpBK3AAJWDi4qawk2OJJaysFvQnqgO+p
         FVH2cZDTY9QpBro7E0umz0ta1tNB+xKDvfzuuZ9uY2/C2M5c7bmtUnHKXUnu9y1tLFiz
         9OsBK9Gwo6+ZgQOlVe3RPvdems5M4ZKCFQRgo52XinMPc1SyhDUVbxTbyEJtznm/UwyB
         Mdjg==
X-Gm-Message-State: AOAM530qekgbnAE78mfhUje1cM9VO89tC6sVECAzneLqzIbSNEp+W/Lw
        uVNXiMnmrCRK0YngupZAf91LSw==
X-Google-Smtp-Source: ABdhPJxBsWwLAEXr9sgdaH/oomiPMDNWSFUwbLKunoLii+UFwnXH5TPi+ukCCrppOZwAZ1z64gBgGQ==
X-Received: by 2002:a62:2c8a:0:b029:160:d7a:d045 with SMTP id s132-20020a622c8a0000b02901600d7ad045mr15787364pfs.65.1605558338816;
        Mon, 16 Nov 2020 12:25:38 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c2sm18350144pfi.21.2020.11.16.12.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:25:38 -0800 (PST)
Date:   Mon, 16 Nov 2020 13:25:36 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, groeck@chromium.org,
        drinkcat@chromium.org, pihsun@chromium.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] remoteproc/mediatek: fix sparse errors on sram
 power on and off
Message-ID: <20201116202536.GA3892875@xps15>
References: <20201116082537.3287009-1-tzungbi@google.com>
 <20201116082537.3287009-2-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116082537.3287009-2-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 04:25:36PM +0800, Tzung-Bi Shih wrote:
> Fixes the following sparse errors on sram power on and off:
> 
> On drivers/remoteproc/mtk_scp.c:306:17:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> On drivers/remoteproc/mtk_scp.c:307:9:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> On drivers/remoteproc/mtk_scp.c:314:9:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> On drivers/remoteproc/mtk_scp.c:316:17:
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..8ed89ea1eb78 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>  	return 0;
>  }
>  
> -static void mt8192_power_on_sram(void *addr)
> +static void mt8192_power_on_sram(void __iomem *addr)
>  {
>  	int i;
>  
> @@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
>  	writel(0, addr);
>  }
>  
> -static void mt8192_power_off_sram(void *addr)
> +static void mt8192_power_off_sram(void __iomem *addr)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  {
>  	int i;
>  
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
