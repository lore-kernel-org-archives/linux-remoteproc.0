Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03EFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 18:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B4B61390
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 18:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhKKSVW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Nov 2021 13:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhKKSVV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Nov 2021 13:21:21 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFDEC061767
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Nov 2021 10:18:32 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g14so27586273edz.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Nov 2021 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnmxwn/tZeM/AHymk+3atT3H8KaElmrCo0Jws8wvOvA=;
        b=ExqD7I0dtPteyE+rPa5NxBrJ7mWXCX+6K1XnVBIyiRxmjTpjy34M1yZ+ZD7k7I4cX+
         3Kv4LeG1cljOnPaqMNOchb3VsUdPhPadvZlrLJGHAVa8957yvCXygvk5luW7ripmeG0w
         saAdMc0h1DFLV2cBJ8i/Fl5fk4kpkkHxCTZR1OKOw8g4WCD5qMzTPch2VzJpAGzFr59R
         qrK/I5pmFTyRZj7a6hJOqUUE9f6lKnLzx2Bd4fltBrKni+AHa1GQ2KJUJIEc0mVhPxP/
         hXcyFM7WSLBj+CNM73dVat6eZZy+SKKKNGCPfHMIn6EzLvj6PziP2kjslddOiS4hVcvD
         n5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnmxwn/tZeM/AHymk+3atT3H8KaElmrCo0Jws8wvOvA=;
        b=2Pk1rd1owIKUARuw2hHSpdfazJAlZHa6c5cCiSYOtg7LcmCdKiqNz5A6flPjYNgVaE
         9OmVVG5F/g7G49CWOdiCsRFyOSdNlpChEYDXJ4nUCUMeFJ4Dl10P2pQScLu23fYH0hiz
         ozrfkBfNZuztQ5lu/8G10fTFHwqVAzBbxQCOoahvqcbmQqI5CghABvywbcjFxPE8c+kN
         SzV3H57W1FMp4PVNBxT5BkZWZlYrfkfkSmrrbvvwVtl346JBssn+fTiGAKC+cSS3+YRp
         otUiVQlJexWLF0BsajFY+h0BRz18Xc6fisbV0WzqOY2cER81IWLHkjwONT/sKo6lmQez
         ZBQg==
X-Gm-Message-State: AOAM533P61ESeHGfztSJ4vwRhty7Gs/SkTajzNt6dIHzharH34GbJPDR
        Y4znCPHV95VZeEBCdEwBgpThHguaF4TG9mGp62zicA==
X-Google-Smtp-Source: ABdhPJzba7bVic9RyDyOSTksjvjV62o5u0z5w36iz4HU98btIq1dlbOxkB93U98vp5KpeLHVHkfLQgWCDJugvMeQGGU=
X-Received: by 2002:a17:906:4d4a:: with SMTP id b10mr12055937ejv.89.1636654710614;
 Thu, 11 Nov 2021 10:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 11 Nov 2021 11:18:18 -0700
Message-ID: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mark,

On Tue, 2 Nov 2021 at 08:15, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Use %pe format string to print return error code which
> make the error message easier to understand.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..2242da320368 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>                                            dma_get_mask(rproc->dev.parent));
>         if (ret) {
>                 dev_warn(dev,
> -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -                        dma_get_mask(rproc->dev.parent), ret);
> +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));

Macro ERR_PTR() is used to convert error codes to pointer type when
returning from a function - I fail to see how doing so in a dev_warn()
context can make the message easier to understand.  Can you provide an
example?

Thanks,
Mathieu

>         }
>
>         /* parse the vrings */
> --
> 2.18.0
>
