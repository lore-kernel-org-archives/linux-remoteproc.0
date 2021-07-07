Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCDDC07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 18:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B72B61C72
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 18:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhGGS0B (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 14:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhGGS0A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 14:26:00 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C744C06175F
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jul 2021 11:23:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p1so6310379lfr.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDHDPMpz014OPz0Z7rLhyIYq3kvqTkpxFqDf5SX+GzU=;
        b=g9cK5amb9g0zP/flqblNVhbEQQrZrQQH3aFvQuW42eK/oKktOrlk5p3V2Wm92VaW13
         uDQjy6p81X7hnAEcQMNdkk8aX4XGhzUZVJAT/JXlhqwQ4oR+jnzNyivCE5Rw6eZ4uLYr
         XrQqbRVK7/84iAx0qYinvVYFLC8OOownnRgE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDHDPMpz014OPz0Z7rLhyIYq3kvqTkpxFqDf5SX+GzU=;
        b=fyDNmClGly9+D1/kVbVEYVmCVhvcr7LZ0DkrOEBa26kloJVnL0CKCMu/Luq2cewoM1
         X4esWvtwOEW/yD9KQfzzX+L9thyI8ab+gjhLBQPk9yvERAO6l0QXtNUEBwmQiILFdFR0
         hkQtFLpXtRHbom1NvsHMjFQcV69uAOMi2is1SJITfjs6vpJ+GJ6+vmrwtl5oiLO6+G6X
         KSwdW/0o3Qts2wKI0UctfzUW2mcZBC4Gj1CIcNk6d0Hz58VJunm4ZOIVGn/Fccl4TImL
         Je5ffsT55qXSYD0svm36ORbUkvqGlmyjyLVAeXDYwT45AfsrlyaB+0M53zQOdlgs7CN2
         AUhw==
X-Gm-Message-State: AOAM532O3gS3ZiKChN2awcVz44lEe7xaVlua/27ALCU/iLVy+tQlYcaf
        k77AH8Uma2kVu/N9B/kEWHOKniuiV1n8RBbG
X-Google-Smtp-Source: ABdhPJy77892c2A3Y9G1O/sO4vXykesbvI4k5BDR8U+LC2wL9mxH9fd/kmOHjE1vDs4OGQZUrXt7Dw==
X-Received: by 2002:a2e:8758:: with SMTP id q24mr7277316ljj.65.1625682195500;
        Wed, 07 Jul 2021 11:23:15 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id f18sm1366567lfa.182.2021.07.07.11.23.13
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 11:23:14 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id v14so6393506lfb.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 11:23:13 -0700 (PDT)
X-Received: by 2002:a05:6512:3585:: with SMTP id m5mr19626826lfr.253.1625682193528;
 Wed, 07 Jul 2021 11:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210706210228.1229484-1-bjorn.andersson@linaro.org>
 <CAHk-=wiXHZ=v4_HVL5TyP9DaHDd7Xxb8hiXjTQi1eDXOA_XRMw@mail.gmail.com>
 <CAHk-=wiZradn2SLbZcY=sALkhdat-z=Dc07ZuDca+PWjK0mJZg@mail.gmail.com> <YOXvLSKuQPl/5Bh/@yoga>
In-Reply-To: <YOXvLSKuQPl/5Bh/@yoga>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 11:22:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4b=1gUbNm1WOmD+GcB3-EnR6mwRtU-n4oVpj4kLTrVQ@mail.gmail.com>
Message-ID: <CAHk-=wi4b=1gUbNm1WOmD+GcB3-EnR6mwRtU-n4oVpj4kLTrVQ@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v5.14
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 7, 2021 at 11:15 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Would you like me to resend this with a correct diffstat?

No, I merged it - the main reason I check the diffstat and shortlog
after-the-fact is just to make sure that I get what the pull requester
_intended_, and that was fairly clear. It's not like the extra commit
looked out of place in any other way.

And the only problem with the mismatch is then that I waste time
trying to figure out _why_ it didn't match. And that's already done,
so water under the bridge..

So I just hope it doesn't happen again, because I'm just lazy and
don't like that "Ok, now I need to figure out what's wrong" part.

             Linus
