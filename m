Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B92FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Dec 2021 16:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239181AbhLTQ5g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Dec 2021 11:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhLTQ5g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Dec 2021 11:57:36 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D847C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Dec 2021 08:57:36 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id u20so4354597pfi.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Dec 2021 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yOsgS9YhfvcT1xx0dm/7Y4cMzNzCetRVRzj1B63i2mE=;
        b=a5bpQAgv4qquR0hWlOG5WfSkfvtNzPWWbxqoG9iKC5+hPf6XeONiRYD5W+pmE4c4dF
         6G749PHQKcmn/P+5+kC+ZBrQyfU2jrdWKnOfNmYuRw1IS74Nmfdkfyk7TcRFh5iCqtP+
         JzSRnIX13gn4ckiVetLr/HFeDTq8Xmky1+MsyCWqX8Y5sWsfNduqyWG/aFdDBBzCecXk
         q44mQFk7CkqC/IUbSiY4VX/GJWe10rqTDFQw6fWEgDnMzPeTLqI45bbVQlW0prtAhPDS
         xrMWftJR7RStbM+Ypgc740YOgcIr4/h435lP2BtSwAfVByc1jPxdeV6muT7h+ZhshwNd
         xaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yOsgS9YhfvcT1xx0dm/7Y4cMzNzCetRVRzj1B63i2mE=;
        b=Kg/aDjXGZch/Ttv6hZLci6nVQbzGmQOv/1DurFv3h+9RbX5gCWoBrjIJWKrcibe+G+
         qy3g8oaruvNL0DqJ6wDpd5wOLgytFmBwuiwb6eYCtosCZbdmLnjxEQXfsxLJW7LY0MLz
         BFVNLWRjr0Rs5XeYbt405pm14CmrVGuI5VYE985h26RrhFneJdNSvPmReVFZU/wlwCcQ
         1UNH8BU6aMbyymmriuKnL3p15Dg58GIESZoufMZseWmPO6QNqk04UWeKGDLax5VZ7D/S
         mX+Fa6V0CqlSbyNHM1Y9pv/bkjgtnjx3683AcPwl7MgB042j36KmpSlZwb7D6d7zgPR6
         Bdew==
X-Gm-Message-State: AOAM530qFw2T/b/QxdO7DmIRvw38sISj86Kr6qhpCdxLzrswbmyFfw9T
        z6ZgMQNcZa4DGUNrWNgjVCSLVg==
X-Google-Smtp-Source: ABdhPJxE/bYhops5kddHnyVdeQa+UTx6/w2moxJYNRdC7GXIaZL+7d8OhxDuyxzzSKL/xy61WDT2AQ==
X-Received: by 2002:a62:6497:0:b0:4ba:737c:8021 with SMTP id y145-20020a626497000000b004ba737c8021mr17114937pfb.18.1640019455498;
        Mon, 20 Dec 2021 08:57:35 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g14sm16992349pgo.88.2021.12.20.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 08:57:34 -0800 (PST)
Date:   Mon, 20 Dec 2021 09:57:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Julien Massot <julien.massot@iot.bzh>,
        =?iso-8859-1?Q?Bj=F6rn?= Andersson <bjorn.andersson@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH 1/2] remoteproc: rcar_rproc: fix pm_runtime_get_sync
 error check
Message-ID: <20211220165732.GA241456@p14s>
References: <20211216160653.203768-1-julien.massot@iot.bzh>
 <CAMuHMdWAPuPCgnRcqUiqY_FXYmOmHb8_=PuhNfAdUNprbsZOJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWAPuPCgnRcqUiqY_FXYmOmHb8_=PuhNfAdUNprbsZOJw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Dec 20, 2021 at 02:44:26PM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 16, 2021 at 5:07 PM Julien Massot <julien.massot@iot.bzh> wrote:
> > pm_runtime_get_sync can also return 1 on success, change
> > to use pm_runtime_resume_and_get which return 0 only on
> > success.
> >
> > This bug has been discovered by Dan Carpenter by using Smatch
> > static checker.
> >
> > Fixes: 285892a74f13 ("remoteproc: Add Renesas rcar driver")
> >
> 
> Please no blank lines between tags.

I have fixed the blank lines and applied this series.

Thanks,
Mathieu

> 
> > Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
