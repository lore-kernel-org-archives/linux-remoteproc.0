Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74645C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Sep 2021 09:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B04E6138E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Sep 2021 09:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245116AbhI2Jmx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Sep 2021 05:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245103AbhI2Jmx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Sep 2021 05:42:53 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864F1C06161C;
        Wed, 29 Sep 2021 02:41:12 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id s55so410545pfw.4;
        Wed, 29 Sep 2021 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVxGaFjbux+FJULv7eg8f8YYNx7W05wA7ywVNP/pTwE=;
        b=OqAYzH+r/5UkFiIWpYESP4E1UCc+QIgxUjmcz7eIVpahtk2znGK57pUa28VLmtGXuz
         kdP8dr3bRFguyvWK4kNuJGRaS1pGjR+HirGZkaMJMucKvwoHd1H7+udkNoUxG7hi+ilN
         C2qfuBQbN3fS2kbj6dOvP2SOQsSzQzJIoHxMa96bJSS4wf7hmSDJ7WvJwXgpQumOQ8fV
         dSDRL2zkE2nraz9nuKLGLOLZ+GKOgDgsqc7DeB+Rwn4tXt/eVjzI5asyRG3HZw11EihP
         R2AHWgMqtxTMluogh5T05YbRy//y7MKDc0Cfj37s7iOUWaIc0zQJqY57EWfpyO6jR6xl
         9+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVxGaFjbux+FJULv7eg8f8YYNx7W05wA7ywVNP/pTwE=;
        b=eh8QBVCux2uMVR+ZwY5E4+Xes0sc8VM33vCv4fl5V9QFzBz690w/fC4feruizuEX7K
         N7TN+69YY4k3tBP8oYMR5sGJiJ9r22AVidOIrg+ASa9Z1GZKDNrjQd5x56O4os5fKZWQ
         Iwc66fr53XfUEhJY8ULf0Z4QGsVs+JOHMj7P+vF5Nc1oSvENspwNL6NUKsxUM3wSI+4v
         wM5Bhrui0o7/6NaUsphwPPOWz4lLa6JOhMfgh6yH7UyxUktMRxI31brV3N6l9wR7kgpC
         A3aEVd245GwYv6ajyZNXobYPxNUDK30e+eSqpUBtW9tvIkdtgYBgFwlv42Vx3OB5dVee
         UfoQ==
X-Gm-Message-State: AOAM530Vxry1lGdsUUeUSxZiHICo/MXj2/OEdnP7J+Xf71HuHXjyG/zj
        0EvGPRuMoLrtF3tXDDO/My8bQRr0E2lv4GqHoCuKIUyb
X-Google-Smtp-Source: ABdhPJw2wkXH2l67O2YTPAun4bIXPqCvSGkiTo25+pme8IcUuQ7vpmKwYexxnWbdkZurQ2KUBW6fbCScVwLCYGtEd3U=
X-Received: by 2002:a63:251:: with SMTP id 78mr8888760pgc.54.1632908472040;
 Wed, 29 Sep 2021 02:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210928132902.1594277-1-aardelean@deviqon.com> <YVOKQwGj5/jR8Q5H@builder.lan>
In-Reply-To: <YVOKQwGj5/jR8Q5H@builder.lan>
From:   Alexandru Ardelean <ardeleanalex@gmail.com>
Date:   Wed, 29 Sep 2021 12:40:59 +0300
Message-ID: <CA+U=Dsr=C4zT3gZ2HdKc5jmbJ6HAwOOBBFzb03GtrxOCZ3cynQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: use dev_warn_ratelimited for msg
 with no recipient
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 29, 2021 at 12:33 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 28 Sep 08:29 CDT 2021, Alexandru Ardelean wrote:
>
> > From: Alexandru Ardelean <ardeleanalex@gmail.com>
> >
> > Even though it may be user-space's fault for this error (some application
> > terminated or crashed without cleaning up it's endpoint), the rpmsg
> > communication should not overflow the syslog with too many messages.
> >
> > A dev_warn_ratelimited() seems like a good alternative in case this can
> > occur.
> >
>
> Is there anything a user could/should do when they see this entry in
> their log?

Not really, no.
The userspace application would need to respawn, or some systemd (or
similar process manager) would need to respawn the application it
should recover the state, and communication should resume normally.
I think this message is good mostly as informative.

>
> It doesn't look very actionable to me, should we perhaps degrade it
> further to just a dev_dbg()?

It's not actionable unfortunately.
But I feel it is useful to have this message, until the application recovers.
Mostly to be informative.
A more robust mechanism would be to setup some counters, where we
count the number of missed messages.
And then access this counter via sysfs or something.

The problem is that a high-rate of dev_warn() (during failure),
temporarily increases system CPU usage & load-average, making the
recovery a bit slower, because systemd-journald is processing these
messages from the kernel.
So, dev_dbg() would definitely help, but would also require us to bump
the system log-level to see the messages.
And if they occur and we don't see them, it causes more questions and
debugging, because people won't know for sure what the issue is.

Ultimately, dev_dbg() or dev_warn_rate_limited() are both fine.
The goal is to avoid the temporary increase in CPU load.
I just wanted to state my arguments for dev_warn_ratelimite() :)

Thank you
Alex

>
> Regards,
> Bjorn
>
> > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 8e49a3bacfc7..546f0fb66f1d 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -749,7 +749,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >               /* farewell, ept, we don't need you anymore */
> >               kref_put(&ept->refcount, __ept_release);
> >       } else
> > -             dev_warn(dev, "msg received with no recipient\n");
> > +             dev_warn_ratelimited(dev, "msg received with no recipient\n");
> >
> >       /* publish the real size of the buffer */
> >       rpmsg_sg_init(&sg, msg, vrp->buf_size);
> > --
> > 2.31.1
> >
