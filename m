Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0482EC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 07:03:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F39E22240
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 07:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JQcI1Cnb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgKPG5u (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 01:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgKPG5t (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 01:57:49 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7E6C0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2020 22:57:49 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id o11so16224164ioo.11
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2020 22:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w7qH3muf0hvm402XiT2YMmzxU2U+fv3PjFMpAPv4904=;
        b=JQcI1CnbTtjDN0N02UdBLejMuwzPaAl6epYNRX2HcrAQHSneRvPa2EhdTQiZQGbLIY
         D2DTCAaL2jB0MbatysmPOhJtFd/gFzfmTgjbwyLTjyut0a12Mf//vIal8LyWoD88AAkx
         tjejDvh205jfSEOREl0cSu6Xm0xv1rl/7yUVBmzL090XZRqWlKzKwAawNXEnbKUImHYj
         I/41KzbdPlAEMTRaBkCiSUEgvjvgAhVdMCaLkskyy+wWAQaZ8QSeLCM9kAFoqIyGUhwj
         S/y3+41N3Nqamsuntq0kD3yduuNoZ71SzkDibi5IfLNGZfrhbdkU0uTsH+nAqpxxa7fz
         9ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7qH3muf0hvm402XiT2YMmzxU2U+fv3PjFMpAPv4904=;
        b=sQIJDTDNqg4FL6wcWRR1XjKeiHJ6HT1gZs6uaA83VpK5VjlcC6vgWECg0zRn5BZFCW
         tCxRLDUl7PHNEjMw85ara6wO+R/BhXFaZiLmBuSmMB59ZCRwj9E2pX9ux/lC9nSVA0m5
         sOX1AGsaSzBbWRCNlfHoAu7qRdYQbE5nRYcnmcqF+GI6QhX5nUItlUz4YzGuB9GN+hgv
         tXKcmI1Agq9x9BCrCwFL3DUZXbKc6HfO2u1f6bayOhrwtF0eGUZ+tQkOBLVILSGulEjj
         jCzmkMz1ootOQxYU84c+6Bg8OpF1Jo+P7p4PIfalsG8sG5rRaxAjHn18xYTc8aopAIGX
         pGbA==
X-Gm-Message-State: AOAM531Yz0GqtJ5O47Rect1qsPfeEDkiLgYoBQSccKDPm+SBuvPa6+Rl
        W7zZgZLevrsr1B9R5oApJr4n2zeRVLwXKj7At5Q72A==
X-Google-Smtp-Source: ABdhPJwq9Tgjk2eACx8o39dvmuSg61oenlpEGKZSTXbZQzysIe66a0C3qgQ6UxJeCx1tOQ8u2TW7AISXJpoawDlH9m4=
X-Received: by 2002:a6b:7a0b:: with SMTP id h11mr7412410iom.76.1605509868843;
 Sun, 15 Nov 2020 22:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20201116044121.2457272-1-tzungbi@google.com> <CANMq1KDXnLqBu5CBnWCeFEZbqxFRVmoSi=hu_qOtQDnZW6SPbg@mail.gmail.com>
In-Reply-To: <CANMq1KDXnLqBu5CBnWCeFEZbqxFRVmoSi=hu_qOtQDnZW6SPbg@mail.gmail.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 16 Nov 2020 14:57:37 +0800
Message-ID: <CA+Px+wXoOB=Kc+7dUS7zePDu-_7bubZhpmTmsDSxUZ6QY8+yUw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: fix sparse errors
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Boichat <drinkcat@google.com>,
        kernel test robot <lkp@intel.com>,
        Guenter Roeck <groeck@google.com>,
        Pi-Hsun Shih <pihsun@google.com>,
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

On Mon, Nov 16, 2020 at 1:38 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> On Mon, Nov 16, 2020 at 12:41 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > Fixes the following sparse errors:
> >
> > warning: incorrect type in argument 2 (different address spaces)
> >    expected void volatile [noderef] __iomem *addr
> >    got void *addr
> > warning: incorrect type in argument 1 (different address spaces)
> >    expected void *addr
> >    got void [noderef] __iomem *
> > warning: incorrect type in assignment (different address spaces)
> >    expected void [noderef] __iomem *cpu_addr
> >    got void *
> > warning: incorrect type in argument 3 (different address spaces)
> >    expected void *cpu_addr
> >    got void [noderef] __iomem *cpu_addr
>
> Can you also tell us which lines actually fail? Would be easier to
> follow (I ended up digging out the test robot email to understand)

Will separate them to make it clear.

> > @@ -556,8 +556,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
> >
> >         /* Reserved SCP code size */
> >         scp->dram_size = MAX_CODE_SIZE;
> > -       scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
> > -                                          &scp->dma_addr, GFP_KERNEL);
> > +       scp->cpu_addr = (void __iomem *)dma_alloc_coherent(
> > +                                       scp->dev, scp->dram_size,
> > +                                       &scp->dma_addr, GFP_KERNEL);
> >         if (!scp->cpu_addr)
> >                 return -ENOMEM;
> >
>
> This one looks wrong to me. dma_alloc_coherent memory is not normally
> tagged as __iomem. Why is scp->cpu_addr __iomem in the first place?

Did you mean address returns from dma_alloc_coherent() is not normally
a __iomem?

I am wondering if the cpu_addr declaration is somehow misused.
In drivers/remoteproc/mtk_common.h:
> void __iomem *cpu_addr;
