Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971B2C3E8C5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 17:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D301522245
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 17:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="POH9nEfS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgK0RZm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 Nov 2020 12:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgK0RZm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Nov 2020 12:25:42 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA20C0613D1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2020 09:25:42 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id f5so5223297ilj.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2020 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Acm2ZExJpzGiHdCwJFkfrVzAksbUtRfcZnQHr+JzIw=;
        b=POH9nEfSxBH4InsUIU3kkfAh2Ipc6D7apcAffonRmNnp2egOFSfPrK3jTbNWT5xFw8
         nYY/CN/TqXPOOh1kN3J5Mxiw+cWR3+8FRpUYS1LB0O3oVNw6zvpv4JSgUlWrUStao78Z
         ISKu/a7qlQIvek47PxqXZdirJ6XYE6H7kO88sZ0ctqlHU2MzPGW/tpE7RKcdKgCGIQsN
         NxTJIYvV+BaI7ua9vdfbcn5PgMsqyr5JrocDW6uGMH3+iwH01rfG8Fjgd9ccUXKwhc30
         pWl5OSGIRSjEgGP5Af7e6Rl6V469ORng7Uq9rklojxEiLj+6oqng2hU+YyIc4WG7pous
         nG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Acm2ZExJpzGiHdCwJFkfrVzAksbUtRfcZnQHr+JzIw=;
        b=NUnJopTtuMKxlRYI8ANElgv2Nfc7wV7BXLuODiR2bY7CUDA/4mdwT+69Vuaog33RS4
         oIHNgVCvt/nBbZ9CNl1WbbUUO3MxvEWFfCuwHq4wIii3G0wXZwbYuoxEOhzMnjLyq6LW
         wJH1kHeTPJZ+mafTviV5BdLxyp+KJ7be0L4WO5QJbwEMbLJa0wsA3Pr4fJypj621fo2f
         SmGnZ++25M5h4otW8u2mhnA/jEuIq4rNzTtEq+cX6Zq70Ks/VNcGX0CvSkdWvk0YgFBZ
         p0RshBoJp/NCWKJ6Duv1ebs6d6YQsdTiJXujPuB/hal9Hh+wj8ue/K3PMtAPMhC2Brbe
         LpMA==
X-Gm-Message-State: AOAM532CScMdsOZ1mU+OdMqHmrWHMSU711cZubngOqFtXGwT2iXm5fSV
        eO/yanLwqXv9nWcTMThvdNIAIsTxxiXV8X9PgP3gqw==
X-Google-Smtp-Source: ABdhPJztn0uQRmqsLbsG/Rw9F4ym28+uH+606Px3XbpOCZ/buANVuTbqi4T1ThN4Wt9LOF2x0QO0yIMQ9lqD9bdzFvs=
X-Received: by 2002:a92:c88c:: with SMTP id w12mr8073208ilo.204.1606497941430;
 Fri, 27 Nov 2020 09:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com> <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
In-Reply-To: <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Sat, 28 Nov 2020 01:25:30 +0800
Message-ID: <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset
 from FW
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Nov 28, 2020 at 12:11 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
> > The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> > aware of it and will upgrade the devices' kernel and SCP firmware
> > carefully.  Other than that, AFAICT, no other devices in the wild are
> > using this driver.
> >
>
> This is the exact same patch that you sent here [1], that I commented
> on, and that you agreed with my assessment.
>
> What do you want me to do here?  What am I missing?

Yes, this is a resend patch because only the first 2 patches in the
previous series have merged.

I agree the patch is aggressive which would break machines with old
SCP firmware.  But AFAICT, no other devices are using this driver; and
we'll take care of our devices to upgrade SCP firmware first and then
kernel drivers.  Thus, ideally, no real device breakage is expected.

Would the patch be acceptable?  Or would you suggest we consider
backward-compatible anyway (even if with the context mentioned above)?
