Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F1AC5519F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 18:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64C642224B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 18:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZK9SghC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgK0SZN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 Nov 2020 13:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgK0SZM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Nov 2020 13:25:12 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E317C0613D1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2020 10:25:12 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id b8so5346182ila.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2020 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kYoVKqPC3vhqU3nrR8MKfApG6zVMbrBxSj843bnZ/E=;
        b=qZK9SghCUm4wMaFfBrzS7CyvIixET6Sh0iFuK0MFi/MgD408Jk0gmPHcV/FuomkdNx
         45q7TGYLZr9S3LsGC5WxePnOwe+COlLD97VN2Qq81ylU19XYH7Ose4dqwgNGInAnMEfI
         wJriQc7TkjW1I+U2TfD41BPMZu7eCBmFAk7h/KbjaV2UK6boPRQaeOMwDfP2hCiAyHg3
         Lo7hxa57U1d6Z76jg4kcvWCERdMX+8GR3HRobVdHVKq4NaG2T1pcdjmOz5UC7dAGL7rR
         MbzGct9f+beWbbX4K1JZi9cdBu0NcnVlO9XSMkZaL+93IT55HfZvUIwHnzvZVW9H1e57
         yyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kYoVKqPC3vhqU3nrR8MKfApG6zVMbrBxSj843bnZ/E=;
        b=XUHxvurmlM0NDNKn9O51JEV8JQRjgaxorwGeCqi9tzWMuEW11mWtqg8hWxRBANoEDP
         mG9tKXDMa6dTlGooKXRrcBtO9xB7D2vC3EE+D93SpRsomXhJIETJ7HyStvzYNOPmvKhq
         BrAlVos47IlIkthTJvNZepCQ0aOLIAPh6WxQT/sczfDOpYrdSmnSmijZN0bZJWo0MzhS
         2GSd7eAkpdAokLk/q3U38UZjhl6wvLhGI+dZeMOEkYjSTcc6ff3+iDFZI6WfzeieYqbV
         Hop+ITprRSIuRn66VwIZ4XYlQnvTPRiDwHdfMpj5daO2A9LNTR/kSb+wTVZLlKsOcDn6
         i2zw==
X-Gm-Message-State: AOAM5310maj30jQxMgPIDbSKCo+q47xL1mbzfRp+o0r0I3jZ/Xt1DfLl
        /fnXdP4l/2NR/FYJStxlvnXCPR1EnPhMNbfiPRTsuQ==
X-Google-Smtp-Source: ABdhPJyHGxibPr/pcc2cJ+NWBNFIpeSdMBuz+P0601qjR/KBDxKpkUl6Ou7uphTF6dCMxe0/w7IIrk2GG0GmMAyZJpY=
X-Received: by 2002:a92:3403:: with SMTP id b3mr8146206ila.140.1606501511895;
 Fri, 27 Nov 2020 10:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com> <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
 <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
In-Reply-To: <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 27 Nov 2020 11:25:01 -0700
Message-ID: <CANLsYkwT6HYLgZ4MzEkfOvq6Rou8_toE=AS=wfjGeNinnuzRhA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset
 from FW
To:     Tzung-Bi Shih <tzungbi@google.com>
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

On Fri, 27 Nov 2020 at 10:25, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Sat, Nov 28, 2020 at 12:11 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> > On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> > > aware of it and will upgrade the devices' kernel and SCP firmware
> > > carefully.  Other than that, AFAICT, no other devices in the wild are
> > > using this driver.
> > >
> >
> > This is the exact same patch that you sent here [1], that I commented
> > on, and that you agreed with my assessment.
> >
> > What do you want me to do here?  What am I missing?
>
> Yes, this is a resend patch because only the first 2 patches in the
> previous series have merged.
>

The first two patches were merged because they made sense.

> I agree the patch is aggressive which would break machines with old
> SCP firmware.  But AFAICT, no other devices are using this driver; and
> we'll take care of our devices to upgrade SCP firmware first and then
> kernel drivers.  Thus, ideally, no real device breakage is expected.
>

How do you know about all the systems out there that use this SoC?
Moreover why would the original author have implemented the driver the
way they did if it didn't work for them?

> Would the patch be acceptable?

Definitely not.

> Or would you suggest we consider
> backward-compatible anyway (even if with the context mentioned above)?

That is the only way this patch will get merged.
