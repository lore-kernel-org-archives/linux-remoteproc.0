Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B24DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 08:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DCC860F5B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 08:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbhJKJBN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 05:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbhJKJBM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 05:01:12 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8A9C061570;
        Mon, 11 Oct 2021 01:59:13 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id kk10so12778095pjb.1;
        Mon, 11 Oct 2021 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGneKOC24QuMCjEYWlUBU8VDrtxfsIr1RhnhAhHHF+M=;
        b=D/CqcjmkD+qbGKq75suNcj8TDyKFRdiYRHYuk0BPHs/eieJoB1wipP4/amVUpx3l2j
         vPt+79WMN7Py1lY8Z4Q8E3b/VeI3RxfYiIoqm22+HwEU1NPERMvsfwLPKRyaqrTQ6GBA
         6gy70m9iYD+s47FwXoh9567WCy4XbDZ5AwThlNwhKAg8yr9/TWuSTnhakvUpFDHrgU86
         xqNFmIX5DlZb/P6Lg6zjRge2yqq+2ib9NP5qNd5LnK8YQpCdtrWR85IvpeoOxdNEU2vq
         8SPCY+/J5NRNMuLA98wAb86QUvnDl6dKvyDupSZJWgEA3m+wytYWClhvXT753B1WsUn5
         s2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGneKOC24QuMCjEYWlUBU8VDrtxfsIr1RhnhAhHHF+M=;
        b=mYhKhpk5ORbwCUyULXOf/hr066luBUAA9DBQpHf6f7iB2LJg71mL6gs16uQfr/C+ey
         5jabRVDo6C3eEqeHHVLDRP9tmSXcfw+0C9Sjd8nU7SgNWhHRrjZYVdVV7qhKguDHuA+U
         Rigu9lwPoax8vBXittTaxZPq6fE/OZrpn1NGtiGBox64B8YWh7BUKEdHtWJ+df5vCW6q
         E9VQziH5imVNKYHp6+anWVlws+MAkakiSEWOO3srksk/bq3HfuvQcQN41IzUUDazaKZn
         +TkkWapKebLrJYswLXCyL7qRotMjAmglF4C2GUsc/Bot2wJ9H/63VFgNi0a/zel+PkJH
         fOAA==
X-Gm-Message-State: AOAM530YwYJCYFpzeg7HtqzBDapooBZwqGCc+E8/yv3d2ZWCW06yliWD
        jo/pSOPCGL53yb2AkubHrn2L70L9PbViKsunym2RkFVg
X-Google-Smtp-Source: ABdhPJwPsC9ZmdwzqBs+538/1xCR82uNDneuqKN86/VbU7FwTH6z1kJNOBpdAavDGyMDDLaZUUZt9pWlK7eNOwPFJHA=
X-Received: by 2002:a17:90a:cd:: with SMTP id v13mr29462760pjd.81.1633942752653;
 Mon, 11 Oct 2021 01:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210928132902.1594277-1-aardelean@deviqon.com>
 <YVOKQwGj5/jR8Q5H@builder.lan> <CA+U=Dsr=C4zT3gZ2HdKc5jmbJ6HAwOOBBFzb03GtrxOCZ3cynQ@mail.gmail.com>
In-Reply-To: <CA+U=Dsr=C4zT3gZ2HdKc5jmbJ6HAwOOBBFzb03GtrxOCZ3cynQ@mail.gmail.com>
From:   Alexandru Ardelean <ardeleanalex@gmail.com>
Date:   Mon, 11 Oct 2021 11:59:01 +0300
Message-ID: <CA+U=DsrEuOdzn=YhQ_AwTFyaJesqHNC9vycDa9TyQMSaEwaEWw@mail.gmail.com>
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

On Wed, Sep 29, 2021 at 12:40 PM Alexandru Ardelean
<ardeleanalex@gmail.com> wrote:
>
> On Wed, Sep 29, 2021 at 12:33 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 28 Sep 08:29 CDT 2021, Alexandru Ardelean wrote:
> >
> > > From: Alexandru Ardelean <ardeleanalex@gmail.com>
> > >
> > > Even though it may be user-space's fault for this error (some application
> > > terminated or crashed without cleaning up it's endpoint), the rpmsg
> > > communication should not overflow the syslog with too many messages.
> > >
> > > A dev_warn_ratelimited() seems like a good alternative in case this can
> > > occur.
> > >
> >
> > Is there anything a user could/should do when they see this entry in
> > their log?
>
> Not really, no.
> The userspace application would need to respawn, or some systemd (or
> similar process manager) would need to respawn the application it
> should recover the state, and communication should resume normally.
> I think this message is good mostly as informative.
>
> >
> > It doesn't look very actionable to me, should we perhaps degrade it
> > further to just a dev_dbg()?
>
> It's not actionable unfortunately.
> But I feel it is useful to have this message, until the application recovers.
> Mostly to be informative.
> A more robust mechanism would be to setup some counters, where we
> count the number of missed messages.
> And then access this counter via sysfs or something.
>
> The problem is that a high-rate of dev_warn() (during failure),
> temporarily increases system CPU usage & load-average, making the
> recovery a bit slower, because systemd-journald is processing these
> messages from the kernel.
> So, dev_dbg() would definitely help, but would also require us to bump
> the system log-level to see the messages.
> And if they occur and we don't see them, it causes more questions and
> debugging, because people won't know for sure what the issue is.
>
> Ultimately, dev_dbg() or dev_warn_rate_limited() are both fine.
> The goal is to avoid the temporary increase in CPU load.
> I just wanted to state my arguments for dev_warn_ratelimite() :)
>

Ping on this :)

> Thank you
> Alex
>
> >
> > Regards,
> > Bjorn
> >
> > > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> > > ---
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index 8e49a3bacfc7..546f0fb66f1d 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -749,7 +749,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> > >               /* farewell, ept, we don't need you anymore */
> > >               kref_put(&ept->refcount, __ept_release);
> > >       } else
> > > -             dev_warn(dev, "msg received with no recipient\n");
> > > +             dev_warn_ratelimited(dev, "msg received with no recipient\n");
> > >
> > >       /* publish the real size of the buffer */
> > >       rpmsg_sg_init(&sg, msg, vrp->buf_size);
> > > --
> > > 2.31.1
> > >
