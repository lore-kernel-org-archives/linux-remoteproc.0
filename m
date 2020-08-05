Return-Path: <SRS0=bVwd=BP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323F9C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Aug 2020 19:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECB2C206F6
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Aug 2020 19:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c5feeV6i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgHET0H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:26:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27797 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728749AbgHERO1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Aug 2020 13:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596647665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2J9LJah/aWCk57IzVK6fx/wEiWGV1AN7ftTN0d7Z7L0=;
        b=c5feeV6isMViIGc3J1ZgfS21KWW2pTbSgL7fzaFO/Q8QFgQ/e6OGxG+qKfwjAM1zhXrKUr
        IEOzkJ5BBsoa7emHL6h+NgeRYuZ8WbUuayVnGlzrv2vnDpKZDfY6YXAMRSh+OyA2u070pl
        qTMl1ASZezCynPQdZ3l0ihcgzUfkVq8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-A_JIQqAaNC2GJ-kjgmSxRQ-1; Wed, 05 Aug 2020 07:34:12 -0400
X-MC-Unique: A_JIQqAaNC2GJ-kjgmSxRQ-1
Received: by mail-wm1-f70.google.com with SMTP id a5so2607163wmj.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2020 04:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2J9LJah/aWCk57IzVK6fx/wEiWGV1AN7ftTN0d7Z7L0=;
        b=hUZhWpFSUj8TJbBjMLCLPGwd3apcIV+Eq4pGfZjDWObIgFn99DlO7nUBOTTkI8f4NM
         oo7I2lFsVkK653tD608u9ioKkyvxeObBDcuIsdr/tKk5SUdr8odw3M7hMxeHHMFpeMDL
         QRLWWcY8Zj3oT0PPVx9lD5wOCnbHKhozkqaA3++FPzZqZfMzgVTvhgFAwNDO4+RBOJLj
         02ofAVo+0ClMiX8kKnD01JKK6L6WiZ8q7wRfTfLbMG5cvIkGLWFYOmGG0h5uMeNBUv16
         F1/cAD3DqL/oUwcn2ZzR9jGbA9AfD/EMLyXB2A0NImNbnvA5wg0YKt5JKMZGumq1IOcQ
         XdQA==
X-Gm-Message-State: AOAM530N1VvbUjP/+CfTivDOHMRN7dh1A0jNs9SJYhW6Y0nlrS9nKYkA
        Z33FHqEQqgkZfmehIA9JOaFWJieHEFzPiUIK4NUhcq8NApJigtlK8fZaX6Ol3ZyCNXTFuyLztnW
        RPBBIvUPsKFA90L7m3FTjHdoUoiaBLQ==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr2721062wml.29.1596627251689;
        Wed, 05 Aug 2020 04:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUHoMIFdt/4QubWV9RKUWmzgFURf9uw07yiy0Uaimh1czYGUqufIiAYoZ9lh96it76IKA3Qg==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr2721038wml.29.1596627251392;
        Wed, 05 Aug 2020 04:34:11 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
        by smtp.gmail.com with ESMTPSA id c10sm2340858wro.84.2020.08.05.04.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 04:34:10 -0700 (PDT)
Date:   Wed, 5 Aug 2020 07:34:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        kvm@vger.kernel.org,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v4 0/4] Add a vhost RPMsg API
Message-ID: <20200805073253-mutt-send-email-mst@kernel.org>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200730120805-mutt-send-email-mst@kernel.org>
 <20200731054752.GA28005@ubuntu>
 <CANLsYkxuCf6yeoqJ-T2x3LHvr9+DuxFdcsxJPmrh9A4H8yNr3w@mail.gmail.com>
 <20200803164605-mutt-send-email-mst@kernel.org>
 <CANLsYkx9e=-2dU26Lx5JFrtrbV07Vtwsi3gFphxKW5QRiwqoHg@mail.gmail.com>
 <20200804100640-mutt-send-email-mst@kernel.org>
 <CANLsYkzqvev1es_J-FYaBv02jkGHZwpn2cNwZKamAsZ_D=QB7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzqvev1es_J-FYaBv02jkGHZwpn2cNwZKamAsZ_D=QB7g@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Aug 04, 2020 at 01:30:32PM -0600, Mathieu Poirier wrote:
> On Tue, 4 Aug 2020 at 08:07, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Aug 04, 2020 at 07:37:49AM -0600, Mathieu Poirier wrote:
> > > On Mon, 3 Aug 2020 at 14:47, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Aug 03, 2020 at 07:25:24AM -0600, Mathieu Poirier wrote:
> > > > > On Thu, 30 Jul 2020 at 23:47, Guennadi Liakhovetski
> > > > > <guennadi.liakhovetski@linux.intel.com> wrote:
> > > > > >
> > > > > > Hi Michael,
> > > > > >
> > > > > > On Thu, Jul 30, 2020 at 12:08:29PM -0400, Michael S. Tsirkin wrote:
> > > > > > > On Wed, Jul 22, 2020 at 05:09:23PM +0200, Guennadi Liakhovetski wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > Now that virtio-rpmsg endianness fixes have been merged we can
> > > > > > > > proceed with the next step.
> > > > > > >
> > > > > > > Which tree is this for?
> > > > > >
> > > > > > The essential part of this series is for drivers/vhost, so, I presume
> > > > > > that should be the target tree as well. There is however a small part
> > > > > > for the drivers/rpmsg, should I split this series in two or shall we
> > > > > > first review is as a whole to make its goals clearer?
> > > > >
> > > > > I suggest to keep it whole for now.
> > > >
> > > >
> > > > Ok can I get some acks please?
> > >
> > > Yes, as soon as I have the opportunity to review the work.  There is a
> > > lot of volume on the linux-remoteproc mailing list lately and
> > > patchsets are reviewed in the order they have been received.
> >
> > Well the merge window is open, I guess I'll merge this and
> > any issues can be addressed later then?
> 
> Please don't do that.  I prefer to miss a merge window than impacting
> upstream consumers.  This patch will be reviewed, just not in time for
> this merge window.

OK then.


> >
> > > > Also, I put this in my linux-next branch on
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
> > > >
> > > > there were some conflicts - could you pls test and report it's ok?
> > > >
> > > > > >
> > > > > > Thanks
> > > > > > Guennadi
> > > > > >
> > > > > > > > v4:
> > > > > > > > - add endianness conversions to comply with the VirtIO standard
> > > > > > > >
> > > > > > > > v3:
> > > > > > > > - address several checkpatch warnings
> > > > > > > > - address comments from Mathieu Poirier
> > > > > > > >
> > > > > > > > v2:
> > > > > > > > - update patch #5 with a correct vhost_dev_init() prototype
> > > > > > > > - drop patch #6 - it depends on a different patch, that is currently
> > > > > > > >   an RFC
> > > > > > > > - address comments from Pierre-Louis Bossart:
> > > > > > > >   * remove "default n" from Kconfig
> > > > > > > >
> > > > > > > > Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> > > > > > > > cases. It can however also be used for virtualisation scenarios,
> > > > > > > > e.g. when using KVM to run Linux on both the host and the guests.
> > > > > > > > This patch set adds a wrapper API to facilitate writing vhost
> > > > > > > > drivers for such RPMsg-based solutions. The first use case is an
> > > > > > > > audio DSP virtualisation project, currently under development, ready
> > > > > > > > for review and submission, available at
> > > > > > > > https://github.com/thesofproject/linux/pull/1501/commits
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > > Guennadi
> > > > > > > >
> > > > > > > > Guennadi Liakhovetski (4):
> > > > > > > >   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
> > > > > > > >   rpmsg: move common structures and defines to headers
> > > > > > > >   rpmsg: update documentation
> > > > > > > >   vhost: add an RPMsg API
> > > > > > > >
> > > > > > > >  Documentation/rpmsg.txt          |   6 +-
> > > > > > > >  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
> > > > > > > >  drivers/vhost/Kconfig            |   7 +
> > > > > > > >  drivers/vhost/Makefile           |   3 +
> > > > > > > >  drivers/vhost/rpmsg.c            | 375 +++++++++++++++++++++++++++++++
> > > > > > > >  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
> > > > > > > >  include/linux/virtio_rpmsg.h     |  83 +++++++
> > > > > > > >  include/uapi/linux/rpmsg.h       |   3 +
> > > > > > > >  include/uapi/linux/vhost.h       |   4 +-
> > > > > > > >  9 files changed, 553 insertions(+), 80 deletions(-)
> > > > > > > >  create mode 100644 drivers/vhost/rpmsg.c
> > > > > > > >  create mode 100644 drivers/vhost/vhost_rpmsg.h
> > > > > > > >  create mode 100644 include/linux/virtio_rpmsg.h
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.27.0
> > > > > > >
> > > >
> >

