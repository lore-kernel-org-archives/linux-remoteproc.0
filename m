Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16619C2D0E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 19:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6189235FD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 19:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kO+RCErR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgIVTMx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726625AbgIVTMx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 15:12:53 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6A5C0613CF
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2020 12:12:53 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id v8so14128204iom.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2020 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IK/WwG3AGahlrI8huDh/Mfh9jtUCebEoFj9j81IUuC4=;
        b=kO+RCErR7nBT8L31iBPYZSwMJUK5FHZrA7PwnVY1QwcxJ7CU/QLulnpvmblB/uUfra
         7FRa6zO0Pq3t/Soz/mVcUvQaIgYBYIhHa702+ayIdwyIgaVOvt1ubqrHtUh9hkLAgWvR
         23qtmb9RCifAYQc0jC/Y7h2CnYNKxeBIf0JuKrFfNIQmtAQ0BYgVdRNKytNMcr/9r8wI
         1IVCu4Sksbptu5w54Sf8MuU/mjV1ipbIUqAREDStCl6uZVD7667zPoI4cw6nYHPZguq8
         SP896O22rKylXcFSwrtAXMtXPUyV/nSf+VjmJc8B4vk2W5GcTmgLaZH0qiyEncIoi2hm
         sFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IK/WwG3AGahlrI8huDh/Mfh9jtUCebEoFj9j81IUuC4=;
        b=m2i90Lx/xrK0kt9gDjrf/WKqi2D67yxOAPs3luqDuz9OhRCX246MDtZsTJANFVprYw
         miOK4CkQ0bX0EHu82iyj1ORtN9YEUjyI2iXwsT27MgAjg/C98Z92iZe357is3LsNFKzX
         7tlGsWY+UycOt+79kH/SlAjvGEvUH92f3Hb1a3tu5ug0vextUQ7WVR/ifqg2caCbdhcR
         QxwBhaRm+MIUPgVSKSYMGltRO6GBmw6zox5l7horftxdR4vywRME2FchspxvkCPJNOPj
         P7O+JsOfpt9nq4TmkYA+blz++P0bfDjlm3GTXIQ2HYePFTIc5PgnI05cdC5O5HgWKKMd
         TwiA==
X-Gm-Message-State: AOAM531XtBRrfjC4q05jl1SDyo8ApwXxzCpGhlGgRezxkCx54A9ErCIn
        iG1gdENSLBZ5XaM94fQFraNEj/4RX+K0XI/e+E4gpw==
X-Google-Smtp-Source: ABdhPJw9JGzZ6f9NF0ngRg8kr47VeaaltgVfk6nGNrw5MkgjXsUhxuElVdDZ9jViGPVJiMY98vAeD7Po2Pisbnid0E4=
X-Received: by 2002:a05:6638:d02:: with SMTP id q2mr5225604jaj.98.1600801972410;
 Tue, 22 Sep 2020 12:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200922001000.899956-1-mathieu.poirier@linaro.org> <20200922080944.GB4648@ubuntu>
In-Reply-To: <20200922080944.GB4648@ubuntu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 22 Sep 2020 13:12:41 -0600
Message-ID: <CANLsYkyh16_G0y3ZP1_Fv1R1jE83xmSh1kXPpQVBBaz-kdOL4Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] rpmsg: Make RPMSG name service modular
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day Guennadi,

On Tue, 22 Sep 2020 at 02:09, Guennadi Liakhovetski
<guennadi.liakhovetski@linux.intel.com> wrote:
>
> Hi Mathieu,
>
> Thanks for the patches. I'm trying to understand the concept of
> this approach and I'm probably failing at that. It seems to me
> that this patch set is making the NS announcement service to a
> separate RPMsg device and I don't understand the reasoning for
> doing this. As far as I understand namespace announcements
> belong to RPMsg devices / channels, they create a dedicated
> endpoint on them with a fixed pre-defined address. But they
> don't form a separate RPMsg device. I think the current
> virtio_rpmsg_bus.c has that correctly: for each rpmsg device /
> channel multiple endpoints can be created, where the NS
> service is one of them. It's just an endpoing of an rpmsg
> device, not a complete separate device. Have I misunderstood
> anything?

This patchset does not introduce any new features - the end result in
terms of functionality is exactly the same.  It is also a carbon copy
of the work introduced by Arnaud (hence reusing his patches), with the
exception that the code is presented in a slightly different order to
allow for a complete dissociation of RPMSG name service from the
virtIO transport mechanic.

To make that happen rpmsg device specific byte conversion operations
had to be introduced in struct rpmsg_device_ops and the explicit
creation of an rpmsg_device associated with the name service (that
wasn't needed when name service was welded to virtIO).  But
associating a rpmsg_device to the name service doesn't change anything
- RPMSG devices are created the same way when name service messages
are received from the host or the remote processor.

To prove my theory I ran the rpmsg_client_sample.c and it just worked,
no changes to client code needed.

Let's keep talking, it's the only way we'll get through this.

Mathieu

>
> Thanks
> Guennadi
>
> On Mon, Sep 21, 2020 at 06:09:50PM -0600, Mathieu Poirier wrote:
> > Hi all,
> >
> > After looking at Guennadi[1] and Arnaud's patchsets[2] it became
> > clear that we need to go back to a generic rpmsg_ns_msg structure
> > if we wanted to make progress.  To do that some of the work from
> > Arnaud had to be modified in a way that common name service
> > functionality was transport agnostic.
> >
> > This patchset is based on Arnaud's work but also include a patch
> > from Guennadi and some input from me.  It should serve as a
> > foundation for the next revision of [1].
> >
> > Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
> > did not test the modularisation.
> >
> > Comments and feedback would be greatly appreciated.
> >
> > Thanks,
> > Mathieu
> >
> > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
> > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> >
> > Arnaud Pouliquen (5):
> >   rpmsg: virtio: rename rpmsg_create_channel
> >   rpmsg: core: Add channel creation internal API
> >   rpmsg: virtio: Add rpmsg channel device ops
> >   rpmsg: Turn name service into a stand alone driver
> >   rpmsg: virtio: use rpmsg ns device for the ns announcement
> >
> > Guennadi Liakhovetski (1):
> >   rpmsg: Move common structures and defines to headers
> >
> > Mathieu Poirier (4):
> >   rpmsg: virtio: Move virtio RPMSG structures to private header
> >   rpmsg: core: Add RPMSG byte conversion operations
> >   rpmsg: virtio: Make endianness conversion virtIO specific
> >   rpmsg: ns: Make Name service module transport agnostic
> >
> >  drivers/rpmsg/Kconfig            |   9 +
> >  drivers/rpmsg/Makefile           |   1 +
> >  drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
> >  drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
> >  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
> >  include/linux/rpmsg_ns.h         |  83 +++++++++
> >  include/uapi/linux/rpmsg.h       |   3 +
> >  8 files changed, 487 insertions(+), 199 deletions(-)
> >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> >  create mode 100644 include/linux/rpmsg_ns.h
> >
> > --
> > 2.25.1
> >
