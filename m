Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAA8C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 06:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA5786321B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 06:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhKQGmi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Nov 2021 01:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhKQGmh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Nov 2021 01:42:37 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65D6C061764
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Nov 2021 22:39:39 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id r26so4227851oiw.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Nov 2021 22:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uaBnlFHJNu65iA6uEhxPYlb/03NsUwHMSkh0xmYjPh4=;
        b=asm29ox26MwSTUQG2YFYhV+q2GmCwLFcMHPBgvAwwXk8B1Hw2DiIPNjwdVj8frXPUS
         tw8aWGkod53MhdMhE85xkgkkYR3/JUhP5JoNPpCgyyXhZqIIhbD9iWSz/DcOxFm367Ja
         8ndWn2h2VZ41tqUwP1spyvhOU9i6s9ulWiDiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uaBnlFHJNu65iA6uEhxPYlb/03NsUwHMSkh0xmYjPh4=;
        b=K5VRZ4De6OaSaAMDHRlrEJ0uwxeKKvb1kGz/bR6i8Ddf278gDWwhTrqijsGEQSAwRJ
         jiNe+85Nu8pb4oZahr7F601xSSV0mFySGX0kKxDnLPs/i8jV7sa/BzF6TkM8lhyV3YOz
         zy2EfY1yDO+A4iCsuaL+TgNZtFwa5Otkfci/AjdE4KzIi+gz5sP0QLTcNnF6YAX9L2Mh
         Jd8t7sKxgTujkro0TM5Vav1ZJ7f6jF8zhTsgCfjnd4wLWd9Kg+gncdz4D6d+91KkHHQE
         kFfhy5ZONawXXyY4DsiB6jvnxbEdjqepkxtDmSvT/8NKsDI+j1FQf6Hk/q/OOlVuq/rc
         xr6w==
X-Gm-Message-State: AOAM532ToLt/IyjOdRGo4emPLHlyMvJVcJ0Og0zD6Sm3IvPHZ8NrB5+n
        Eln1aL3dLbKVF2sPHyDisdJulD9QpoL2zMZ7fOOKGQ==
X-Google-Smtp-Source: ABdhPJyBHQWaotdsn7Iy2GutsTjMnAVJWzUw5o7uB8itcXEeqVjdmLxnB/uP+e7Kaz12lP4ZnNA9eyDHEqWpLU9BZW8=
X-Received: by 2002:aca:2319:: with SMTP id e25mr58625412oie.164.1637131178953;
 Tue, 16 Nov 2021 22:39:38 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:39:38 -0800
MIME-Version: 1.0
In-Reply-To: <000101d7db7c$d2ef1330$78cd3990$@codeaurora.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org>
 <1635860673-12146-4-git-send-email-pillair@codeaurora.org>
 <CAE-0n53PSDzj9owjeaB1bGQ5=255=Q_djEvcQGtZzRxMRMhe1g@mail.gmail.com> <000101d7db7c$d2ef1330$78cd3990$@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:39:38 -0800
Message-ID: <CAE-0n502Wi+oLnzbjZ4TVe1y98=rL2ML9E5FSKaBfcEmWP+W9A@mail.gmail.com>
Subject: RE: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support for
 sc7280 WPSS
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Rakesh Pillai (2021-11-16 22:31:51)
>
>
> > -----Original Message-----
> > From: Stephen Boyd <swboyd@chromium.org>
> > Sent: Wednesday, November 17, 2021 4:25 AM
> > To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> > bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; ohad@wizery.com;
> > p.zabel@pengutronix.de; robh+dt@kernel.org
> > Cc: linux-arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org
> > Subject: Re: [PATCH v8 3/3] remoteproc: qcom: q6v5_wpss: Add support for
> > sc7280 WPSS
> >
> > Quoting Rakesh Pillai (2021-11-02 06:44:33)
> > > @@ -457,7 +608,13 @@ static int adsp_probe(struct platform_device
> > *pdev)
> > >         if (ret)
> > >                 goto free_rproc;
> > >
> > > -       pm_runtime_enable(adsp->dev);
> > > +       ret = qcom_rproc_pds_attach(adsp->dev, adsp->proxy_pds,
> > > +                                   desc->proxy_pd_names);
> > > +       if (ret < 0) {
> > > +               dev_err(&pdev->dev, "Failed to attach proxy power domains\n");
> > > +               goto free_rproc;
> > > +       }
> > > +       adsp->proxy_pd_count = ret;
> >
> > Can we check this against the define so that we don't have more than the
> > fixed number of power domains and try to access elements beyond the
> > length of the array?
>
> The number of entries populated in the "proxy_pds" array depends on the "desc->proxy_pd_names", which is statically
> initialized for each remoteproc. Hence there will not be any out of bound access for this array.
>

Sure nothing is wrong today but it's a potential problem in the future
if someone adds more elements to proxy_pd_names than proxy_pds can hold.
Please prevent that from happening by writing stricter code.
