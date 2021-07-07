Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8554C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 18:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4F6D61C6D
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 18:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhGGSRx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 14:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhGGSRw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 14:17:52 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2DAC061574
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jul 2021 11:15:12 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so3145566ota.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jV0bmhzzw6TZaEdwvdV5ymSR2xA2QAOqe/GC7UBQiJs=;
        b=i5sAoxK7k6tbHogLW32WUwgavmT7BxFqp7oupl1OoJ0ljlhuoxzM9VMmRE4R/lAO/K
         saGqKmrZ+A1FvSrxScV73tC6OqTVPnz0PwZSrZS4sJusjA4hL4SL6CNE6xpxNEq1g/JK
         DP1pd8cXtQ+YsnlHtiaZNpFM72diQK2gTy4DGMB/0AEnHFfMaa9TxvqXh3g9d3s96mrZ
         kW+pPS+oCV3AN5A+LZhpyOpMzjMuZZXI5Cj5dx5iaXDNBwhx42LeuLodO8+zomPi6TRw
         BHrGJcbRDZyZ9R5w1HY/2omhWts+FWBBzPUASs7KqeS3D/u400bQkN1aEO+QjmlaD7eD
         w6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jV0bmhzzw6TZaEdwvdV5ymSR2xA2QAOqe/GC7UBQiJs=;
        b=jFhw0BHT8YuuArVmKg0mEacCTRQlaGW1TH4qW8DUr7iwd5rPlOyqx6OV3iD8Ve9u+B
         dmPRxlvwtOWRWqomlIZB8VWGxbn9OUWcX1N6SIGoUlEnI0/mv1H4v+UiXuVLUHhPmHpf
         wPow2KkEmVdUG7U3f2PsXOEoDwahh1eyuRDdJbdssjsuP0A6A+hjr8YgfwaeQcwHS2uu
         wvbZuS30iqlvzg/tLI8mxhYonCFLiUY6cVGznVG3sCDySvaJlKEPSIHWBnjiYXisSurE
         Vny6SY2uguqZDd47D4Th0+NKB0edIRpmecQa3HWH6EN5I2+ZTwjoF134kAF3Y7eILEuH
         phgg==
X-Gm-Message-State: AOAM530dHGnrJfwKti3QwRqSl5+qjMr09s7UgXzdL2S6eWgGEKlYShp8
        1HCFRTByEcTM3vJdR77XgHXbqQ==
X-Google-Smtp-Source: ABdhPJx8BlpKR94cDa9e50pcam97QwHyezjB2esN+tyYBYNSCKrxj/lmchIjGhcmVWVPw4KDshFLzA==
X-Received: by 2002:a9d:6285:: with SMTP id x5mr5367779otk.137.1625681711768;
        Wed, 07 Jul 2021 11:15:11 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z2sm4153874otm.2.2021.07.07.11.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 11:15:11 -0700 (PDT)
Date:   Wed, 7 Jul 2021 13:15:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Suman Anna <s-anna@ti.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v5.14
Message-ID: <YOXvLSKuQPl/5Bh/@yoga>
References: <20210706210228.1229484-1-bjorn.andersson@linaro.org>
 <CAHk-=wiXHZ=v4_HVL5TyP9DaHDd7Xxb8hiXjTQi1eDXOA_XRMw@mail.gmail.com>
 <CAHk-=wiZradn2SLbZcY=sALkhdat-z=Dc07ZuDca+PWjK0mJZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiZradn2SLbZcY=sALkhdat-z=Dc07ZuDca+PWjK0mJZg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 07 Jul 12:57 CDT 2021, Linus Torvalds wrote:

> On Wed, Jul 7, 2021 at 10:55 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > If you end up adding commits to the end and updating the tag [..]
> 
> Actually, that's not what happened, the extra commit is in a separate
> branch that got merged early. So I'm not sure why your diffstat and
> shortlog were incorrect.
> 

Doing some backtracking on my actions found that I created an immutable
branch for the dt-binding, tagged it, shared it with Suman and merged it
into my branch.

I missed this as I was preparing the pull request and didn't realize
that my script for invoking the git request-pull would find this tag and
thereby omit the content of that tag from the diffstat.

Would you like me to resend this with a correct diffstat?

Regards,
Bjorn
