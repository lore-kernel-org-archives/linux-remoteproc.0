Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C81C63777
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 03:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44572206F9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 03:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N14N3tz9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgK3DsK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 29 Nov 2020 22:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgK3DsK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 29 Nov 2020 22:48:10 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71E9C0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 29 Nov 2020 19:47:24 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id i9so10393342ioo.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 29 Nov 2020 19:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sr/AV0NV1nWLn+qvblWrhldoUPj+2qT844+17kc4W80=;
        b=N14N3tz9X4ZYWYkbKFYXhkbrTim66RP7ENfXqyOeu0zmvlLRGk7t/RyGCacMJ46Ey1
         dwm9n4nCgJXa8wINfftA53fsHX48Xn+6BZ6HB529xiQ9QRf38CEhqWu5GI1v3h4K650U
         iPI1mxhfEitvRDUOQnrPB9luX2TKfj7Jyp9Usrr7l+TFDQMrdL3Od8/XPK51dSb9fkMv
         sLiIDbaf/KmGPONGj9GMI6C2Zmyy0B6URfVRVW9/kjVL9p+3D49EA7sf/uuT38+MLozP
         h8X4VCJpUlwamn4NLo4dFp7ogSl8w+FsaTmQ3wKu8xztX9xIAf3bW/9tohT77EO14j5+
         0gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sr/AV0NV1nWLn+qvblWrhldoUPj+2qT844+17kc4W80=;
        b=cf+Vtbx9KXv6/s+mext6fmJ3AktD+RHvh2uwkekAP+eJT7QbV33oHD0yNvB02A2ssp
         dBhIWWipWoIRXL9Enf0tN/Z/VX98b5eQi6csS3BO7+AWYg7416ekw7MZ/CAFtKiFTlG5
         /COqR3dHodywdXt/Jllr3xAneNgoR0S2LgiohIdp6Q+z9F6mIj/L+mkUI21dLHHFlnwO
         asJsGWW2LX197hexh9U6EBtCbpQ9dLCSqxhf6HL1Vg+G8zRLXOQfKN9GMvKuGy0XLSv4
         aKQOJDYglmBf3UidZxrdeFrDadp1KlQdPJnmhcsh4il8Eg1gDtIlwgwrUL6os9e0EE0n
         MPjQ==
X-Gm-Message-State: AOAM532f9AvENVcnUpSYxcC3MojJKEuR7q0cxhC68gRqv7mqEiYksYJN
        +ngEVDIot/oe1DClSB0BGuLXX0KrIMOTCJM+18S/7UIKk/UFATae
X-Google-Smtp-Source: ABdhPJyKlKEGyv2O7fI+OGq/1ZBn85I4dJFpSnoeOKYF/Ltg2269U2GSgcKtfQ+/+s7laOHZWO4jTsfc8+nxflC9PH4=
X-Received: by 2002:a6b:d006:: with SMTP id x6mr14378761ioa.53.1606708043604;
 Sun, 29 Nov 2020 19:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com> <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
 <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com> <CANLsYkwT6HYLgZ4MzEkfOvq6Rou8_toE=AS=wfjGeNinnuzRhA@mail.gmail.com>
In-Reply-To: <CANLsYkwT6HYLgZ4MzEkfOvq6Rou8_toE=AS=wfjGeNinnuzRhA@mail.gmail.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 30 Nov 2020 11:47:12 +0800
Message-ID: <CA+Px+wUbJHv=mhetqvTmG+Bx9mvK_yhowF=Xj+2-9X2RYWsPYg@mail.gmail.com>
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
        Pi-Hsun Shih <pihsun@chromium.org>,
        =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Nov 28, 2020 at 2:25 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Fri, 27 Nov 2020 at 10:25, Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Sat, Nov 28, 2020 at 12:11 AM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > > On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > > The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> > > > aware of it and will upgrade the devices' kernel and SCP firmware
> > > > carefully.  Other than that, AFAICT, no other devices in the wild are
> > > > using this driver.
> > > >
> > I agree the patch is aggressive which would break machines with old
> > SCP firmware.  But AFAICT, no other devices are using this driver; and
> > we'll take care of our devices to upgrade SCP firmware first and then
> > kernel drivers.  Thus, ideally, no real device breakage is expected.
> >
>
> How do you know about all the systems out there that use this SoC?
> Moreover why would the original author have implemented the driver the
> way they did if it didn't work for them?

I am trying not to repeat my statements.
- AFAIK, MT8183-based chromebooks are the only user of the driver.
We're happy to provide fixups if any other devices break due to the
aggressive patch.
- The original author Erin Lo <erin.lo@mediatek.com> adds the driver
for MT8183-based chromebooks.
- The IPI buffer address was hard-coded because we didn't foresee new
feature changes in the next generation MTK SCP.

If it still makes no sense, here is v3 which is backward compatible
with legacy firmwares.
(https://patchwork.kernel.org/project/linux-remoteproc/patch/20201130034025.3232229-1-tzungbi@google.com/)
