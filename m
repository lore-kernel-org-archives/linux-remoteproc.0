Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-ed1-f51.google.com ([209.85.208.51]:36260 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfBGThZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Feb 2019 14:37:25 -0500
Received: by mail-ed1-f51.google.com with SMTP id d12so877826edy.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Feb 2019 11:37:24 -0800 (PST)
MIME-Version: 1.0
References: <CAB7rCTjfQoFOQkStQFP96+44jjZJSaWxQRk8JuktVGDE19Q7MQ@mail.gmail.com>
 <CAAPnCLxo5+Fr3txN0Vjp0OkrxB-YrX0drPgyGbH92r8ttHvsxQ@mail.gmail.com>
In-Reply-To: <CAAPnCLxo5+Fr3txN0Vjp0OkrxB-YrX0drPgyGbH92r8ttHvsxQ@mail.gmail.com>
From: Mike <puffy.taco@gmail.com>
Date: Thu, 7 Feb 2019 13:37:10 -0600
Message-ID: <CAB7rCThrnzHSCRZ-d+qLd507d5wZVby40u1k8ViK7cS=z5OyRA@mail.gmail.com>
Subject: Re: Rpmsg Char Driver
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Denis R <dry.embdev@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Denis,

On Wed, Feb 6, 2019 at 10:12 PM Denis R <dry.embdev@gmail.com> wrote:
>
> Hello Mike,
>
> On Thu, Feb 7, 2019 at 9:45 AM Mike <puffy.taco@gmail.com> wrote:
> >
> > Hi,
> >
> > First, I think this is the right place for questions relating to
> > rpmsg, but please redirect me if I'm wrong.
> >
> > I'm looking to get access to send messages from userspace to the rpmsg
> > bus, but am not sure the best way.  The base of my work is a 4.9
> > series kernel for NXP's i.MX7D,
>
> Have you seen the imx_rpmsg_tty driver as part of NXP's 4.9 kernel?
> This is the driver which will create the A7-M4  channel to the other
> side,
> and the ttyRPMSG device, with one default endpoint.
>

Yes, I've been using that driver to facilitate porting RPMsg-Lite to
the RTOS I'm using on the M4.

> > but I've been comparing it to mainline
> > to see if there's anything I could utilize.  In particular, I was
> > looking at the config option RPMSG_CHAR which states:
> >
> > "Say Y here to export rpmsg endpoints as device files, usually found
> > in /dev. They make it possible for user-space programs to send and
> > receive rpmsg packets."
> >
> > I compiled a kernel with that option but I don't see any device files
> > in /dev.  Looking through the code, it seems like only the qcom_smd
> > driver actually uses this driver, so I assume the Kconfig help text is
> > somewhat misleading?
> >
> > Is there a general purpose way to open a channel from userspace?  Or
> > am I best off using the name service from the remote processor to
> > announce all the channels I want and write a generic driver that
> > creates a char device to expose an interface to each?
>
> I too would be interested to know how far ahead is the mainstream on
> that. It would be great if there is a new or updated driver which
> creates ttyrpmsg devices dynamically
> for the new endpoints that application may create.
>
> I was going to expand the imx_rpmsg_tty to do this just for ones I
> need, but of course would rather use an already working driver for
> this of exists.
>

I'm in the same place.  The downside to me of the tty driver was that
everything became a stream of bytes, when ultimately everything I was
sending was more message based.  Worked just fine to get everything
tested, but if I can move more decision making to userspace, that
suits me.  I did cherry-pick a few commits as the char driver didn't
compile as it was based on the source provided by NXP.  Seems like the
right driver to use as I previously looked at what seemed like the
same prior art, but I just can't figure out if it should start working
without drastic changes to one of the drivers.

> > Thanks,
> > Mike
>
> Regards,
>
> Denis
