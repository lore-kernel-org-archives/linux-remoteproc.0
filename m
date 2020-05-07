Return-Path: <SRS0=mWwD=6V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BC4C47257
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 May 2020 02:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57BC1207DD
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 May 2020 02:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="v7KJ5PF+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgEGCkD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 May 2020 22:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726218AbgEGCkC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 May 2020 22:40:02 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3148C061A0F
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 May 2020 19:40:00 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id x1so3242036ejd.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 May 2020 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/eZPaamE0lbeQ2MzIL/SDhviNajRasVE2XwCqHm8H6I=;
        b=v7KJ5PF+0CnuiOtNR5Afa/XvAYOq0LwhOVZFPTclvX9NF+rResHMybnZxK7G8Y/uCp
         bJmt5kJpzOcwhjoEx+Wsg1Zr/fBSYZsS0tVrJgOVIw++rV9zY/WIa1D6Xibsp5hJXrOW
         uYz+7/2xAWHVv8UmR3184sBIiVlF7vwUnKhJ4gZlt0nPcrFboVDDY+KB7xhfouWaS/sE
         KLMPQOilFoev6EOfGFgIYE008ukXNl254fYi/SPhoQBbGgGlc76N4eCylKmFFDg2FOj6
         GzeaT8/flEyhRBZkOIh7OxoAgB2MNIaLR+7zEOnGTmabUW6SnW2fzZQk9NAsuV1TqArS
         vEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/eZPaamE0lbeQ2MzIL/SDhviNajRasVE2XwCqHm8H6I=;
        b=QUyJfh4yPx6wBBtvDOsjFYi/O74PbDf9AKW6aP7TweSweJKOD1mFho5YFDuFlsuqha
         0jf02gDWZg2teaQJbRZZfQzb7LgsI0OaficmgVOKOICb1zYkFZfDYAGFPIHakrf6DBkd
         PKAs2KXqy6WIgXgEd4ihZqOty7VeWfzB8HVJFSn00lo6g73FFtxn9inTFavLSzQ7EPYp
         iiN3BJfTXMjkB6pssa2+Yn79qX9GUHNAs46A4cuFFw9ynGYrNLGujbkCZEaa1+crqD5H
         6zidKiyOhzNpCH+/Az9O66j1AqxLipg4hZrkJfvynsZN/t6QHNPVrvhNXUsokF4p7a9x
         5XGQ==
X-Gm-Message-State: AGi0Pub+DgYDTONiNIx5vXwCqBhaifatW4shecIXRcRijj2tP0mEbIkG
        /FZbN+cOSdtMkO+6lC12vbJiz/NdeUzfVZeGm2DEMLw0
X-Google-Smtp-Source: APiQypJ+my7liklkzTVPzRWAcyz6Lh1mnhuTKF6LGhVfdEXQrAqyR1AkJh3Z5XCtC56OSvnRVkY3y9VuwSoD0mbE/8s=
X-Received: by 2002:a17:906:af6f:: with SMTP id os15mr10323118ejb.78.1588819199589;
 Wed, 06 May 2020 19:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200414220943.6203-1-ezequiel@collabora.com> <CADBw62oJj_x046piRbPP48A04ALo-w2J6jZXNspyN5eOGj-TEg@mail.gmail.com>
In-Reply-To: <CADBw62oJj_x046piRbPP48A04ALo-w2J6jZXNspyN5eOGj-TEg@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 6 May 2020 23:39:48 -0300
Message-ID: <CAAEAJfDDOwhjiTX4eXkHnU=+NTRXroFXCbEqa1B43C41LaTkBg@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock: Simplify Kconfig
To:     Baolin Wang <baolin.wang7@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello,

On Wed, 15 Apr 2020 at 10:33, Baolin Wang <baolin.wang7@gmail.com> wrote:
>
> Hi Ezequiel,
>
> On Wed, Apr 15, 2020 at 6:09 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >
> > Every hwspinlock driver is expected to depend on the
> > hwspinlock core, so it's possible to simplify the
> > Kconfig, factoring out the HWSPINLOCK dependency.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Looks reasonable to me.
> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
>

Gentle ping.

Thanks!
Ezequiel

> > ---
> >  drivers/hwspinlock/Kconfig | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
> > index 826a1054100d..32cd26352f38 100644
> > --- a/drivers/hwspinlock/Kconfig
> > +++ b/drivers/hwspinlock/Kconfig
> > @@ -6,9 +6,10 @@
> >  menuconfig HWSPINLOCK
> >         bool "Hardware Spinlock drivers"
> >
> > +if HWSPINLOCK
> > +
> >  config HWSPINLOCK_OMAP
> >         tristate "OMAP Hardware Spinlock device"
> > -       depends on HWSPINLOCK
> >         depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
> >         help
> >           Say y here to support the OMAP Hardware Spinlock device (firstly
> > @@ -18,7 +19,6 @@ config HWSPINLOCK_OMAP
> >
> >  config HWSPINLOCK_QCOM
> >         tristate "Qualcomm Hardware Spinlock device"
> > -       depends on HWSPINLOCK
> >         depends on ARCH_QCOM || COMPILE_TEST
> >         select MFD_SYSCON
> >         help
> > @@ -30,7 +30,6 @@ config HWSPINLOCK_QCOM
> >
> >  config HWSPINLOCK_SIRF
> >         tristate "SIRF Hardware Spinlock device"
> > -       depends on HWSPINLOCK
> >         depends on ARCH_SIRF || COMPILE_TEST
> >         help
> >           Say y here to support the SIRF Hardware Spinlock device, which
> > @@ -43,7 +42,6 @@ config HWSPINLOCK_SIRF
> >  config HWSPINLOCK_SPRD
> >         tristate "SPRD Hardware Spinlock device"
> >         depends on ARCH_SPRD || COMPILE_TEST
> > -       depends on HWSPINLOCK
> >         help
> >           Say y here to support the SPRD Hardware Spinlock device.
> >
> > @@ -52,7 +50,6 @@ config HWSPINLOCK_SPRD
> >  config HWSPINLOCK_STM32
> >         tristate "STM32 Hardware Spinlock device"
> >         depends on MACH_STM32MP157 || COMPILE_TEST
> > -       depends on HWSPINLOCK
> >         help
> >           Say y here to support the STM32 Hardware Spinlock device.
> >
> > @@ -60,7 +57,6 @@ config HWSPINLOCK_STM32
> >
> >  config HSEM_U8500
> >         tristate "STE Hardware Semaphore functionality"
> > -       depends on HWSPINLOCK
> >         depends on ARCH_U8500 || COMPILE_TEST
> >         help
> >           Say y here to support the STE Hardware Semaphore functionality, which
> > @@ -68,3 +64,5 @@ config HSEM_U8500
> >           SoC.
> >
> >           If unsure, say N.
> > +
> > +endif # HWSPINLOCK
> > --
> > 2.26.0.rc2
> >
>
>
> --
> Baolin Wang
