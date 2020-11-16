Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D72C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 05:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51A89222B9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 05:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XVbu23OB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgKPFiF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 00:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgKPFiE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 00:38:04 -0500
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AACC0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2020 21:38:04 -0800 (PST)
Received: by mail-vk1-xa42.google.com with SMTP id i3so3467236vkk.11
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2020 21:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZGxpsS9SWcX2KVxrN7YD413ZCNuX4yPXBbFR5ByFWw=;
        b=XVbu23OBn5PNkV1teq06K1Z44OxiHb82e0Wg6E7S1Vj2Bmkuc/doDnSQNi1KFToli1
         0S5l69GmsCebr/v5fEobsPaL8b9ooim7t2AmB4/MvF3PR98Si8xTXUG3KIamfwSgVWCo
         duxLnz8nwqwLiRu0X0bBXKlaJZBbXg/rvfNt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZGxpsS9SWcX2KVxrN7YD413ZCNuX4yPXBbFR5ByFWw=;
        b=EN3SyWM20KmmoasyHuXLgTYjf+qjQmrBfqhuLVQQm9y3rr7qol7hZjC6phY1IW+eLr
         KPO5MxE/ElFqYdTi+cLcdyq0Wh4B0am85XXGwC2vr6BY9Ee9bsodxG6L8FfyBvI4ycyH
         ZKWahLwYfTI7t/5DoCf4+g0dvvOBMTd+tHE65c9ri0Z9q81rYYtZbQX2ln3+QwiV1IDa
         x1JevcoMve4950/XtyBAO/q19bISy3/89GVffeeZKhpsy9LQd26nOyXkRlgPLzGMZylb
         hPY4hGjjjtq11sTzwbtC1xWLDFp3/8FilQNNMq1OkKvZtBU1+vlk279LZ1XuwHMWmySX
         uHsA==
X-Gm-Message-State: AOAM532jnigcuc7kK1nhX/5w/iYnCW+0g74MfMtKwAYCpPI3elBfO5WX
        ou0PKakJxBQ72BMqrE2VEqqjkj5mE4Sa3d6qI1tUEg==
X-Google-Smtp-Source: ABdhPJy7BF/5YwDz0qkfa3oXRNGg+wQM9E1TreiLVWmV5WWnfedcMHX6XloaIeeGKkT6X3h0jCnY6BzPsLqAU6kvXGo=
X-Received: by 2002:a1f:1c6:: with SMTP id 189mr6606866vkb.13.1605505083697;
 Sun, 15 Nov 2020 21:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20201116044121.2457272-1-tzungbi@google.com>
In-Reply-To: <20201116044121.2457272-1-tzungbi@google.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 16 Nov 2020 13:37:52 +0800
Message-ID: <CANMq1KDXnLqBu5CBnWCeFEZbqxFRVmoSi=hu_qOtQDnZW6SPbg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: fix sparse errors
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Boichat <drinkcat@google.com>,
        kernel test robot <lkp@intel.com>, groeck@google.com,
        pihsun@google.com,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Mon, Nov 16, 2020 at 12:41 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fixes the following sparse errors:
>
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> warning: incorrect type in argument 1 (different address spaces)
>    expected void *addr
>    got void [noderef] __iomem *
> warning: incorrect type in assignment (different address spaces)
>    expected void [noderef] __iomem *cpu_addr
>    got void *
> warning: incorrect type in argument 3 (different address spaces)
>    expected void *cpu_addr
>    got void [noderef] __iomem *cpu_addr

Can you also tell us which lines actually fail? Would be easier to
follow (I ended up digging out the test robot email to understand)

>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..99d5a4de3e2f 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>         return 0;
>  }
>
> -static void mt8192_power_on_sram(void *addr)
> +static void mt8192_power_on_sram(void __iomem *addr)
>  {
>         int i;
>
> @@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
>         writel(0, addr);
>  }
>
> -static void mt8192_power_off_sram(void *addr)
> +static void mt8192_power_off_sram(void __iomem *addr)
>  {
>         int i;
>

These 2 make sense.

> @@ -556,8 +556,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
>
>         /* Reserved SCP code size */
>         scp->dram_size = MAX_CODE_SIZE;
> -       scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
> -                                          &scp->dma_addr, GFP_KERNEL);
> +       scp->cpu_addr = (void __iomem *)dma_alloc_coherent(
> +                                       scp->dev, scp->dram_size,
> +                                       &scp->dma_addr, GFP_KERNEL);
>         if (!scp->cpu_addr)
>                 return -ENOMEM;
>

This one looks wrong to me. dma_alloc_coherent memory is not normally
tagged as __iomem. Why is scp->cpu_addr __iomem in the first place?

> @@ -569,8 +570,8 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
>         if (scp->dram_size == 0)
>                 return;
>
> -       dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
> -                         scp->dma_addr);
> +       dma_free_coherent(scp->dev, scp->dram_size,
> +                         (void __force *)scp->cpu_addr, scp->dma_addr);
>         of_reserved_mem_device_release(scp->dev);
>  }
>
> --
> 2.29.2.299.gdc1121823c-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
