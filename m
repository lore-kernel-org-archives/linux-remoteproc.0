Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA45C433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 03:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E10D206E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 03:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A//YnMek"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIODnm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Sep 2020 23:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgIODnl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Sep 2020 23:43:41 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC66EC06174A
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2020 20:43:40 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id o6so1931962ota.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2020 20:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANNjGwWRg+iDVVYtcoowotn4Zio+3Ac8neGudtjHOg4=;
        b=A//YnMekhyBWtv8P9+lJZaMqD1Ik1yGamHDdjb9HB/vyT8E/EPQzgR9SuGMl6EHg8y
         oJRiAuxYCgBEIpwnzQOLObRUWntjMRl4CdqjT0DFujBS61JggYW9Y2h5S7mKrpPEdnGA
         SwwOwWDzdHs/ashyHp4tYsl9M3q0hT/SdSS0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANNjGwWRg+iDVVYtcoowotn4Zio+3Ac8neGudtjHOg4=;
        b=AW+Ud643X/Q1H/XJCgIMOm6c7Y6ODzm8mmPB4StCbk3frqIJlrqXaS1ABXF8EvNr1J
         JM77mPQ7RkblapkIuYBI0mYJ+SIRZfrxuDBRgL2Go1nV9bXHA5/NYDAVe8KJjIHsacxw
         L2nT/aKLsDwCIiKPDoXDdbZzDvw6laIaw/e2misv6cNQZDapaoVL7yaAxCYg1UOA36rc
         ya1ciLWAIEbkAlahHOKstAzJV6EvWFuGPzlKEeqttxFa9QnPueX2gUl2J21wvvfILN88
         Hbl/aW3koc/4rCpOPOWIuqYdxW2HZjTvwtF403O+ztL2Ku6NpgwlORIz3/jl+bBnvaOp
         uKqA==
X-Gm-Message-State: AOAM533K+ASal7mhGXM+3B7tJV7SNoX6+vPKtjQBkppqSONs/4/i4i3h
        JtMiPQtxyO/W8I2DYRMX/Yu896DwUVH0PvH/
X-Google-Smtp-Source: ABdhPJxt8N0TXaELhE8ziuDwNDJVinOoi1RIi3dhzGCovJheP9Z/GyaoNgxv5+n8vC1t/Ocdp1pD9Q==
X-Received: by 2002:a9d:764c:: with SMTP id o12mr7777385otl.159.1600141419900;
        Mon, 14 Sep 2020 20:43:39 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id z16sm4585273oth.43.2020.09.14.20.43.38
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 20:43:39 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id m12so1950071otr.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2020 20:43:38 -0700 (PDT)
X-Received: by 2002:a9d:24c6:: with SMTP id z64mr10659220ota.97.1600141418092;
 Mon, 14 Sep 2020 20:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200915012911.489820-1-acourbot@chromium.org> <20200915032529.GA7762@uller>
In-Reply-To: <20200915032529.GA7762@uller>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 15 Sep 2020 12:43:26 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXGGn-QGZvCycfMNO-PW_pBhi+B0QWoa=iESBp1P-eZrw@mail.gmail.com>
Message-ID: <CAPBb6MXGGn-QGZvCycfMNO-PW_pBhi+B0QWoa=iESBp1P-eZrw@mail.gmail.com>
Subject: Re: [PATCH RESEND RESEND] remoteproc: scp: add COMPILE_TEST dependency
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 15, 2020 at 12:25 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 15 Sep 01:29 UTC 2020, Alexandre Courbot wrote:
>
> > This will improve this driver's build coverage.
> >
> > Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> > Hi remoteproc maintainers,
> >
> > Second resend as I got no reaction for almost 1 month on this one-liner.
>
> Sorry about that. I fell behind on my inbox and have missed your
> previous attempts.
>
> This has now been applied.

No worries, thanks for the quick response.

Mauro, the patch is applied on
https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?id=5185e3a9dc2d68bb52e3e12400428aa060b87733,
will it work for you to merge this into the media tree and apply the
pull request on top?

>
> Regards,
> Bjorn
>
> > Pretty please?
> >
> > As explained in
> > https://www.spinics.net/lists/linux-media/msg175991.html, we need this
> > patch in order to merge a driver series in the media tree. If that
> > looks ok to you, can we pull it in the media tree along with the series
> > that depends on it?
> >
> >  drivers/remoteproc/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index c6659dfea7c7..d1fcada71017 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -43,7 +43,7 @@ config INGENIC_VPU_RPROC
> >
> >  config MTK_SCP
> >       tristate "Mediatek SCP support"
> > -     depends on ARCH_MEDIATEK
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> >       select RPMSG_MTK_SCP
> >       help
> >         Say y here to support Mediatek's System Companion Processor (SCP) via
> > --
> > 2.28.0.526.ge36021eeef-goog
> >
