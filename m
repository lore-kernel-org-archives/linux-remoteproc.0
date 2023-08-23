Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB086EE4993
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Aug 2023 16:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237588AbjHWQb3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Aug 2023 12:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235774AbjHWQb2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Aug 2023 12:31:28 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA83CE68
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 09:31:26 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68a3cae6e1eso2869256b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692808286; x=1693413086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VysVEYYRSJeYSLz+kixV83JtPHzoPi7dpX2zv9tu5I=;
        b=LqwVP+Rlu1RdZiF0Mu6GRObHEUlblBSAnzWMwSdK77l/PCpcfEPMuiGdBLrAcqrnqT
         JyGz7G9XKpguy2u4YvFzq5ObBYbR0AX/jMfbGgruPKVHyimvv/qcAfNiz1HlI8EU07/G
         MCjfGay/9pJly27x2lut9sHucOUp7x8rHxfWCiyklH/JtBOAxAC2JIHJROF/VhP3qjpl
         CFQQknxsmBTWHd6fk4vBZTkNijno5ARVxbkV/iRHUjYt5powRTL69/wnQCkab+Dlxl6I
         ScYqxbDX/u6Z0CaPC41IytjW9CVHmxYwd7fObb78MaunO0fAEWGyawFQCQjC3GLO5g5A
         nYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692808286; x=1693413086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VysVEYYRSJeYSLz+kixV83JtPHzoPi7dpX2zv9tu5I=;
        b=kDpRfJlmdqj67qq+EcroXQy5Ts2aaVogfnq69915FAaqYhJB/jZsBP9zMygz/RmIPH
         vZcUIlxHKr6lcqkKRBU82ygBARvWQYHr1I8RCjHJg2SgLllVsYV8pw1mOsu4zroDHY9d
         4Y800TvnZS5/aWTO+7PjoliSV/1cNdyA9UBKojhJA1427tvYHFB9lVyIj9If+NP9BY5V
         XmH61KK8/qqTXiqko2sswL9M41lH4zTC6yjoU4wAQk7r/lkpjz5lunZrCHV4xf/pWjj9
         OlqqwbWZWEKXOPJdGqBPlKzCzVbYVYVyH3Zxtfojm6q59FVsiTvGo7cN1Lr0wPXo+ckJ
         95dA==
X-Gm-Message-State: AOJu0YzGDZUM4nRdw6HyN+s1n9qUmHvnapSvRjElm1o1HJV4JlaTFujE
        edJavKMW6hw9yeI9MJwfkW/8qA==
X-Google-Smtp-Source: AGHT+IGQYgls24Bsf8aeqi854XlDAQ6SJ0EWXMz2Gf0ZIokynRBMKhKP1zIA3yahMEjnRKOgZ24ozQ==
X-Received: by 2002:a05:6a21:8187:b0:131:4808:d5a1 with SMTP id pd7-20020a056a21818700b001314808d5a1mr9594048pzb.28.1692808286171;
        Wed, 23 Aug 2023 09:31:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ae3:a477:fe1c:f18c])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b00687ce7c6540sm9920432pfm.99.2023.08.23.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:31:25 -0700 (PDT)
Date:   Wed, 23 Aug 2023 10:31:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Nishanth Menon <nm@ti.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Robert Nelson <robertcnelson@gmail.com>,
        Kevin Cahalan <kevinacahalan@gmail.com>
Subject: Re: [PATCH] remoteproc: core: Honor device tree /alias entries when
 assigning IDs
Message-ID: <ZOY0W+0YdYRk2v/E@p14s>
References: <20230807140247.956255-1-nm@ti.com>
 <ZOULmFR51C+9kEhZ@p14s>
 <20230822201205.4csoj4kym2yhuyrf@decrease>
 <ZOYkVec/aQSiCWxh@p14s>
 <20230823155133.v7r3uddautivowps@frail>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823155133.v7r3uddautivowps@frail>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 23, 2023 at 10:51:33AM -0500, Nishanth Menon wrote:
> On 09:23-20230823, Mathieu Poirier wrote:
> > On Tue, Aug 22, 2023 at 03:12:05PM -0500, Nishanth Menon wrote:
> > > On 13:25-20230822, Mathieu Poirier wrote:
> > > > Hi Nishanth,
> > > > 
> > > > On Mon, Aug 07, 2023 at 09:02:47AM -0500, Nishanth Menon wrote:
> > > > > On many platforms, such as Beaglebone-AI64 with many remote
> > > > > processors, firmware configurations provided by the distributions can
> > > > > vary substantially depending on the distribution build's functionality
> > > > > and the specific remote cores enabled in that variant. Ensuring
> > > > > consistent udev rules mapping remoteproc nodes to constant remote
> > > > > proc device indices across distributions (yocto, ubuntu, debian and
> > > > > it's variants, ...) on a board basis can be challenging due to the
> > > > > various functions of these distributions. Varied device node paths
> > > > > create challenges for applications that operate on remote processors,
> > > > > especially in minimal embedded systems(initrd like) that may not
> > > > > have udev-like capabilities and rely on a more straightforward bare
> > > > > filesystem. This challenge is similar to that faced by I2C, RTC or the
> > > > > GPIO subsystems.
> > > > >
> > > > 
> > > > I'm puzzled by this patch.  I can see how using an alias can help in boards with
> > > > various HW configuration.  That said, and as written above, FW files for remote
> > > > processors can vary based on the build's functionality.  As such "remoteproc3"
> > > > will reference the same HW device on all distributions but the functionality
> > > > enacted by the FW may be different.  As such I don't see how an alias can help
> > > > here.  Can you provide a concrete example that highlights the benefits?
> > > 
> > > Correct - *if* remoteproc3 is the constant node reference.
> > > 
> > > To take a trivial example: We ran into this issue with:
> > > https://github.com/kaofishy/bbai64_cortex-r5_example/blob/main/Makefile#L28
> > > 
> > > remoteproc18 apparently changed numbering in a different build.
> > > 
> > 
> > We are going around in circles.  In the above link using an alias will
> > guarantee that "remoteproc18" is available but won't guarantee the
> > functionality enacted by the FW loaded in that remote processor, which is distro
> > dependent.
> 
> Apologies, but I am trying to comprehend the relationship and probably
> am failing to see the linkage. Let me try:
> 
> If I understand you correctly, you are concerned that distros do not
> have a mechanism to provide consistent firmware to the correct remote
> proc for a specific functionality..
>

The point is that aliases will guarantee a naming convention for remote
processors but won't guarantee their functionality.  Sure, we can add aliases
but it won't solve all your problems.

> if so, distro loads / provides the requisite firmware. How
> the package distribution scheme works to distribute the firmware
> and versioning provided varies - One typical pattern has been to use
> linux-firmware repo[1] (at least in other domains - say GPU, wlink or
> the likes) and provide package distribution. The other pattern could
> be build and deploy based on tag (this would be no different from any
> other package deployment).
> 
> On the other hand, If we are looking at the fact that there can be
> different types of firmware that could be loaded to a remoteproc
> providing different functionality - that is correct, and at least in
> case of TI processors very valid

That is exactly what I am referring to.

>- something like openAMP endpoint
> solutions probably help?

I am not familiar with openAmP endpoints but certainly willing to consider it as
an option.

> 
> Let me know if I am off-track here..
> 

You are on track.

> [1] https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-ipc?h=ti-linux-firmware
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
