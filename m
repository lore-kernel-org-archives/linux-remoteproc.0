Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142A1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 16:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F22E06108D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 16:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhKPQcf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 16 Nov 2021 11:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbhKPQce (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Nov 2021 11:32:34 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3F2C061746
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Nov 2021 08:29:37 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id p18so17820515plf.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Nov 2021 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dphYgpIFf0rnfxxApXcaDzX6iKxIk2pRdbaTqHCVXRQ=;
        b=PmThZsEUqMY7qdCDMfNLyXiaxisDMPo6jKmOfYyGgBQ2DTm7GoJthIXRl9FdC2ezGU
         OuYwc8SuytJsQbU44keukL3A6+PKqb6Y2/5qdTFFtYlH4+3KPsSKP73l3ecIN/dXRTgw
         b0PT53igfJJXLJQy9WvG6srIyw/uySkwOnhtwmc/gmAMo7PcI0yEzCJwF+ke4ywuloOV
         zm3bpXUWWk30KgajeRdiOE/dlCqi/ITgDtQ1598NzCAQ9XsrgfIIZGg49YJHSdamuAY8
         GIQCzqM4/iQhbUyln+9l38Y9a71xnozyqTdxGaGBLXY7JCW7G8jG5xLYZ+CJzU3e7Rzz
         bZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dphYgpIFf0rnfxxApXcaDzX6iKxIk2pRdbaTqHCVXRQ=;
        b=sdDyZI3Jj2H7TPud1vGyx2xt0+Fg2UF1BCwVrrlT21AmMKg4CDjfxDGggbSMatSUhZ
         MeLN/KKT5t2nvDkj4hDgSJwTCp0yFsr07hc6Wgs75Ax8io9OSpfpjik/Kup1mQAsE3Uk
         hbYb2nuyWbCkz7GpB30im95dOJilgM3luCbGLWAiVbfS9KE4ZJiw2Iab/YA3DPVU1o+6
         JcEtU4VxbcVM6M7+7bWGFKWkpSgqh1XmdTdnQIv442QNXiUzYjLKlkA6FpCj95YsIBzE
         goS5vnv20tA2nddd9kbWQ/3x6MrK+kSyo0iYgITbSUSY+HWNQ1SgOv+/C/sowq44R5FT
         FgQA==
X-Gm-Message-State: AOAM531Bdr0VQd4/Tfsdch/Q8cMY3dddKO/XwcWalj9jHd1hWHT6JTnY
        rrdepbqqXf5RZ4wR10xKp+T1Yw==
X-Google-Smtp-Source: ABdhPJzNhkmZsE2FtYjflTIfgzGr118ZC041cPjft4yj7PUlFeURqWKuWYM+CAB3hsODsn/7lztJsA==
X-Received: by 2002:a17:90a:8815:: with SMTP id s21mr382032pjn.82.1637080177122;
        Tue, 16 Nov 2021 08:29:37 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id h8sm21276476pfh.10.2021.11.16.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:29:36 -0800 (PST)
Date:   Tue, 16 Nov 2021 09:29:33 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        ohad@wizery.com, yj.chiang@mediatek.com
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Message-ID: <20211116162933.GA2318486@p14s>
References: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
 <20211116135703.19432-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116135703.19432-1-mark-pk.tsai@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

On Tue, Nov 16, 2021 at 09:57:03PM +0800, Mark-PK Tsai wrote:
> > > > > Use %pe format string to print return error code which
> > > > > make the error message easier to understand.
> > > > >
> > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > ---
> > > > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > > index 502b6604b757..2242da320368 100644
> > > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > > >                                            dma_get_mask(rproc->dev.parent));
> > > > >         if (ret) {
> > > > >                 dev_warn(dev,
> > > > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > > >
> > > > Macro ERR_PTR() is used to convert error codes to pointer type when
> > > > returning from a function - I fail to see how doing so in a dev_warn()
> > > > context can make the message easier to understand.  Can you provide an
> > > > example?
> > >
> > > Hi,
> > >
> > > When dma_coerce_mask_and_coherent() fail, the output log will be as following.
> > >
> > > format          log
> > > %x              Trying to continue... fffffffb
> > > %d              Trying to continue... -5
> > > %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> > > %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)
> >
> > When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
> > Casting that to a (void *) with ERR_PTR() does not change that value.
> > Since variable @ret is already declared as "int" the real fix is to
> > change "%x" to "%d".
> 
> There're some other drivers do the same thing in the recent kernel, so I think
> it's fine to casting the `ret` to a (void *) for more user friendly.
> But I suppose it would depend on the maintainer's opinion.
> 
> So how about previous patch I sent, which also fix this issue by using %d.
> 
> https://lore.kernel.org/lkml/20211102120805.27137-1-mark-pk.tsai@mediatek.com/

I had not seen Russell's reply in the link you posted above.  I am not
completely sure about his solution but his insight and guidance in kernel
programming have precedence over mine.

I will take this patch.

Thanks,
Mathieu


> 
