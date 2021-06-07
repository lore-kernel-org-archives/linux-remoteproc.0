Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537DAC47095
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 13:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EF58611BD
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 13:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhFGNVK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Jun 2021 09:21:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230323AbhFGNVI (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Jun 2021 09:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E6CD611BD;
        Mon,  7 Jun 2021 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623071956;
        bh=J61pmu1j6ryUYserdHWBlYXXfYgPMBBoZsm7N71ZXTo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=luDGpmoMaPqOz6JQKS2C869/LKwIckgqB98U7tTCwqBtuuE29lcxn0qFaGPJvG5hb
         Lc/r7hiFU/49WgjIepztF13Mtg1P6vHbsLx3fAWYEu6Jl7U+T91r5HGpubKgTyH8DZ
         +Pf6AiJhIqcSfZhUGrUY3uI7Nm5VrzMaY9CxhqZyY9TPTPsviEuiHHP8+su2eo2doq
         Kr7ldUKVElE/SQVFfuQ9fCyyCdPBFn77FuyGDsmzz/V3/0Ho3RftrJ70F3gt6AzCbx
         B0aav7Ojadb5A+PFUGzng6SKqMaO5LAK/0iuYPSnUTWAuiuiXWaEgDWLq4i4BZIULa
         0CI/SIIgWMCqA==
Received: by mail-ed1-f44.google.com with SMTP id t3so20323813edc.7;
        Mon, 07 Jun 2021 06:19:16 -0700 (PDT)
X-Gm-Message-State: AOAM53075j79UzFu9Yq2yjJcrdOz23YW7XtCZY7OSnsMEfnPbHOOpXTE
        nB4xZ1LUV81NTRtMmO5oImbAovQQcTFSn+stPw==
X-Google-Smtp-Source: ABdhPJxzNlBS2VOpGlScoot1ij4UCYezPM7U/GRvFvlIEwgG7TrZboNzbJF0wUeqhr9QzxmTbA30S0QW1GcfIlRBKQY=
X-Received: by 2002:a05:6402:1d0f:: with SMTP id dg15mr17392452edb.137.1623071954956;
 Mon, 07 Jun 2021 06:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210603144216.10327-1-s-anna@ti.com>
In-Reply-To: <20210603144216.10327-1-s-anna@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 7 Jun 2021 08:19:03 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mhJgFZniXYTVf5ZEM84APhm2w_ozLJg_pFtgz+W_wYw@mail.gmail.com>
Message-ID: <CAL_Jsq+mhJgFZniXYTVf5ZEM84APhm2w_ozLJg_pFtgz+W_wYw@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in binding
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, linux-sunxi@lists.linux.dev,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jun 3, 2021 at 9:42 AM Suman Anna <s-anna@ti.com> wrote:
>
> The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
> $id and fails to compile the example due to undefined args specifier
> values for clocks and resets. Fix both of these issues.
>
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Wilken,
>
> This fixes the warnings for now on linux-next, but I think the example
> should be including sun6i-a31-ccu.h files instead to be accurate, and
> those files are missing the definitions for CLK_BUS_SPINLOCK and
> RST_BUS_SPINLOCK. Feel free to send a newer version or do an incremental
> patch on top.
>
> regards
> Suman
>
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
