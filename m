Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7858C63697
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 633CD22240
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L3o8CJJI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgKPInK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgKPInK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:43:10 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B12EC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:43:10 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id r14so8695917vsa.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CKXWZoZd8QcdkzAVySC/eiJYHbKt+QMjTxLKQIPnmNY=;
        b=L3o8CJJIIYNqMEHzdr8KgW7ZkkgOFBCI8VX1mioeOJ3k58L9dtdLzGM0AWSuhtK8sd
         3RS2fKA9noFJ9Yti/ZlEaur2G8Uz/OOJ4cvxaC2FVxb1NiS+KNF9n1R3knsrOMQlnVA0
         RX+Y1KN6Iiu4HA5zPkISm9Utbe10GZBtszf1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKXWZoZd8QcdkzAVySC/eiJYHbKt+QMjTxLKQIPnmNY=;
        b=ewSc1s4B2oIhllphLiONvx/W0BJ0/eOEw0sOHHJrEu0xewtMvASRHVZWnp1c0Yjwb5
         XXWnauolncm1S22xo8/pA/9nLZEN8k1s2bLTA/UgEqRYJqSSSrRLrh+z1gcACh0olVEF
         uC6fSdky93nFLgyBXdC+R79Qyw/KEyWaAG1CniypCxi8kATMJ3eswnndDmw1A9Se53b2
         muH5IHOAIX9zTVS1Ics9tSN4wn4avgkQBNHsqp5oWEzrQx7IQiAE4pkq4Tzw53Vzjdmm
         PYRq10j8eNojTehIMPitND7tev358ev9EaedfFFnCUzBPjeIso+8jpOIk70KSp/GW+UC
         5wAg==
X-Gm-Message-State: AOAM532bMJpYUReaUDeMLlz/n5T0NJl7NiDskm6U+05t9Zgq2VOsPUmG
        qbJSB0xQABdAwH1kHeIEovlARf6r/lbGrGjQXZY4cg==
X-Google-Smtp-Source: ABdhPJxOnfFqjublvcEGqBfUg6OiK+LATMc5qZd9s1aNgp/F8asGgvnGu3qq8bcqkc57U29ER3+Y3MQeOGiuYAq0tVM=
X-Received: by 2002:a67:2783:: with SMTP id n125mr7520035vsn.47.1605516189515;
 Mon, 16 Nov 2020 00:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com> <20201116082537.3287009-2-tzungbi@google.com>
In-Reply-To: <20201116082537.3287009-2-tzungbi@google.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 16 Nov 2020 16:42:58 +0800
Message-ID: <CANMq1KA_4M3vLzA6aK++_0_StDD1f7O=Q9AsofeQzHWzFmVV6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc/mediatek: fix sparse errors on sram
 power on and off
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Guenter Roeck <groeck@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 4:26 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
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

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

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
> --
> 2.29.2.299.gdc1121823c-goog
>
