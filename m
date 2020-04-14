Return-Path: <SRS0=6AeO=56=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567E6C352BE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 16:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2801A2076B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 16:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYnGu3WX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733133AbgDNQLq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388612AbgDNQLj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 12:11:39 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24027C061A0C
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 09:11:39 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id i75so196080ild.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BdnA0ZhbxhUjeVBQRUfNMsUIIH6R72F4+7CBSvpZwL4=;
        b=yYnGu3WX+LKEauSP9by82xNqFxczcFjhoKkI5+Rx+F8K9MGOlPrmQn6zzDWbpEGyWV
         a/30OqHuQeLvyglVL3159nxoBWqnKEI+utqTHwvRqPGYVrhGMjs7EontiqY+Cn81qNvg
         UBvuWTLordWtZaG9k+6DzTJni3rveHb78rzNronwcV/SxL/8pcQC11HXQKQmY2UXleIm
         6Oxb6IjjyonrRy6kLT5lJ7/RCOPtW8mrIeddvlqirGIjJqT5avEY/6ChssiOfifYrK+m
         OmNXroiKNAkEpyiN7s5Tyus7SZC3bIBtXR2Wk4e9Xk0WQsgoI6MUqrGWEcgzqzaiZWvm
         9Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdnA0ZhbxhUjeVBQRUfNMsUIIH6R72F4+7CBSvpZwL4=;
        b=Y+G9QghKPug/wXABEjvxdckjYJpdRtpwr0oZ3uMZeswXb+W0fvdtEYhLWPHVnBQNXp
         XhHi5EUnYnqPz5A18sNytCE9nJxxJx8szSWmCD68hyzz5G8G7kyx+D1/DIsduy0DJy19
         X5bKQtZlf1blUEVFmm7E/4TuY1NsON0kJm//7NM6cnfl0D8r7qysS2nTOYeClfcfkHo7
         bdTZXgOzG4Js/Mi5Wf6H7aHOmYLDMiZe3N201+XDFFcCeA5EDaGJMWBxhoea2muuxUOh
         L14Hlh1Iv3KSP2L8okq04OdPL/FC0bLUDqVu6vHIdH4G6i6PjFbeE4P246oKKe6wBk9y
         T6Zw==
X-Gm-Message-State: AGi0PubMIb47pGBBeiybUv8NknraMdXCQI1CUMjzBVgQctl4YGX/hoJn
        1U2dwK+ctzoj6tu9lDsx1fsq6u8oilnY3/Ei+/7Dog==
X-Google-Smtp-Source: APiQypKAyN24C/RafP15mpMeGIdS4aG+uJqI46uCSZymLrPRff0+xIwSCOiZdP/INoxSk325W7kuLWlLpf1qYtb3Qpc=
X-Received: by 2002:a05:6e02:68a:: with SMTP id o10mr1045539ils.72.1586880698420;
 Tue, 14 Apr 2020 09:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-3-mathieu.poirier@linaro.org> <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
In-Reply-To: <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 14 Apr 2020 10:11:27 -0600
Message-ID:
 <CANLsYkxHiEzxEDC-r-iEtT_W9MnW2wC-ePwshiqaM2Vgc8VDiQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: Split firmware name allocation from rproc_alloc()
To:     Alex Elder <elder@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200414161127.3280U1dzBj3AUxokegDq8P2PaU04SBs1Bb1NC3PPXMU@z>

On Mon, 13 Apr 2020 at 14:56, Alex Elder <elder@linaro.org> wrote:
>
> On 4/13/20 2:33 PM, Mathieu Poirier wrote:
> > Make the firmware name allocation a function on its own in order to
> > introduce more flexibility to function rproc_alloc().
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> I didn't look at the larger context (MCU series); I'm only looking
> at this (and the others in this series) in isolation.  I like
> that you're encapsulating this stuff into functions but doing so
> doesn't really add any flexibility.

You are correct.  I wrote the changelog with the MCU synchronisation
series in mind but this specific part of the work has nothing to do
with flexibility - it is a plane cleanup exercise.  I will address
that in the next revision.

Thanks,
Mathieu


>
> Two small suggestions for you to consider but they're truly
> more about style so it's entirely up to you.  Outside of that
> this looks straightforward to me, and the result of the series
> is an improvement.
>
> I'll let you comment on my suggestions before offering my
> "reviewed-by" indication.
>
>                                         -Alex
>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
> >  1 file changed, 39 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 80056513ae71..4dee63f319ba 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
> >       .release        = rproc_type_release,
> >  };
> >
> > +static int rproc_alloc_firmware(struct rproc *rproc,
> > +                             const char *name, const char *firmware)
> > +{
> > +     char *p, *template = "rproc-%s-fw";
> > +     int name_len;
>
> Not a big deal (and maybe it's not consistent with other nearby
> style) but template and name_len could be defined inside the
> "if (!firmware)" block.
>
> > +     if (!firmware) {
> > +             /*
> > +              * If the caller didn't pass in a firmware name then
> > +              * construct a default name.
> > +              */
> > +             name_len = strlen(name) + strlen(template) - 2 + 1;
> > +             p = kmalloc(name_len, GFP_KERNEL);
>
>
> I don't know if it would be an improvement, but you could
> check for a null p value below for both cases.  I.e.:
>
>                 if (p)
>                         snprintf(p, ...);
>
> (more below)
>
> > +             if (!p)
> > +                     return -ENOMEM;
> > +             snprintf(p, name_len, template, name);
> > +     } else {
> > +             p = kstrdup(firmware, GFP_KERNEL);
> > +             if (!p)
> > +                     return -ENOMEM;
> > +     }
> > +
>
>         if (!p)
>                 return -ENOMEM;
>
> > +     rproc->firmware = p;
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >                         const char *firmware, int len)
> >  {
> >       struct rproc *rproc;
> > -     char *p, *template = "rproc-%s-fw";
> > -     int name_len;
> >
> >       if (!dev || !name || !ops)
> >               return NULL;
> >
> > -     if (!firmware) {
> > -             /*
> > -              * If the caller didn't pass in a firmware name then
> > -              * construct a default name.
> > -              */
> > -             name_len = strlen(name) + strlen(template) - 2 + 1;
> > -             p = kmalloc(name_len, GFP_KERNEL);
> > -             if (!p)
> > -                     return NULL;
> > -             snprintf(p, name_len, template, name);
> > -     } else {
> > -             p = kstrdup(firmware, GFP_KERNEL);
> > -             if (!p)
> > -                     return NULL;
> > -     }
> > -
> >       rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> > -     if (!rproc) {
> > -             kfree(p);
> > +     if (!rproc)
> >               return NULL;
> > -     }
> > +
> > +     if (rproc_alloc_firmware(rproc, name, firmware))
> > +             goto free_rproc;
> >
> >       rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > -     if (!rproc->ops) {
> > -             kfree(p);
> > -             kfree(rproc);
> > -             return NULL;
> > -     }
> > +     if (!rproc->ops)
> > +             goto free_firmware;
> >
> > -     rproc->firmware = p;
> >       rproc->name = name;
> >       rproc->priv = &rproc[1];
> >       rproc->auto_boot = true;
> > @@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >       rproc->state = RPROC_OFFLINE;
> >
> >       return rproc;
> > +
> > +free_firmware:
> > +     kfree(rproc->firmware);
> > +free_rproc:
> > +     kfree(rproc);
> > +     return NULL;
> >  }
> >  EXPORT_SYMBOL(rproc_alloc);
> >
> >
>
