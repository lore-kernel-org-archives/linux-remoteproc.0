Return-Path: <SRS0=S4pK=BO=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E31EC433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Aug 2020 13:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 302AD21744
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Aug 2020 13:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cajUMW2E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgHDNiT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 Aug 2020 09:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgHDNiB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Aug 2020 09:38:01 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10122C06174A
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2020 06:38:01 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id l17so42184282iok.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2020 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TQqvSOaTS+0vq0FcJG3YYGmNhVX2Wzyl+oJVhl1vEo=;
        b=cajUMW2EsmphVUl7tBq74ozfCLO9LuJOMnMxkAow2Q3C+oJA3QqFfFzOJL0V0CyuD2
         5Q60aaKn7lCJWyK7yXIfFzYY1WEndw1H46/gMGF4OmK3mNUxvb79DXQjcl6ufYyG+PBB
         2519caukgL8i1eK9OV1uJmcdLchteQZ+CwVxhjxz9uT8MU0y3vEVvleKEQez92xWaAOr
         GbXSXpC2Gl1I/o7uwLMspfxiMK6eCCgHnEu6ecSpei7vcfO5L7lRpnRbtLw7jNNqC9YE
         TrF1b4ZMaJ4AcxD5gGPMnc0W8Dfddh8dOub4Y5Pc/OhfehPTm5A2NeuJvrdBsvvfOOXV
         Webw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TQqvSOaTS+0vq0FcJG3YYGmNhVX2Wzyl+oJVhl1vEo=;
        b=R8+5P1vMujdTF3/g67g5VMcvpmEinfB5u7Jv0C9PPPomlewzMNJS6NawnFPo+xBwDZ
         DdcYqEvV8eUjQpL9QKYBAxi4aIY3oxKDoIhlSRn1Lpk5ELpQICsmC9IpzeytDy9rhnPC
         e4DWhjxBS/kHX/9qI5vDkMYdlZfLmzMQlTnHEnvVxgS+la48A88B+0FxL1PihX8aIZYV
         EYQkLyM3wnnmtrnV3JHmmyCJ9YQCFjk7kmukkp9kEsuje6x6t+Iq//Uq61yxXsAqZbr0
         Z/WMVmJOTlJ4aZCYKQm3vkH36kam8SaB4EgRik6M8A1khpv5/RQJgSNOBXQ7ieVkEu+w
         vnbg==
X-Gm-Message-State: AOAM531WQuLdeiE9Iw74oxwiS+jMqB4bbHlvkzOLYboLN+BbT3t3YXlG
        diYPLq2cJ9F1rsMzwDRHjEfIBpqbLz+9PTHv/BrB2w==
X-Google-Smtp-Source: ABdhPJyYJuAsPneR8NkGVpYThr7lt6UB+gAEYTcQUi82+DHwz0ACAAmEDzKodQF0dQ83Ow9jFNpHytgHugvozejgwQc=
X-Received: by 2002:a5d:848d:: with SMTP id t13mr5273506iom.73.1596548280306;
 Tue, 04 Aug 2020 06:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200730120805-mutt-send-email-mst@kernel.org> <20200731054752.GA28005@ubuntu>
 <CANLsYkxuCf6yeoqJ-T2x3LHvr9+DuxFdcsxJPmrh9A4H8yNr3w@mail.gmail.com> <20200803164605-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200803164605-mutt-send-email-mst@kernel.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 4 Aug 2020 07:37:49 -0600
Message-ID: <CANLsYkx9e=-2dU26Lx5JFrtrbV07Vtwsi3gFphxKW5QRiwqoHg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add a vhost RPMsg API
To:     "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 3 Aug 2020 at 14:47, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Aug 03, 2020 at 07:25:24AM -0600, Mathieu Poirier wrote:
> > On Thu, 30 Jul 2020 at 23:47, Guennadi Liakhovetski
> > <guennadi.liakhovetski@linux.intel.com> wrote:
> > >
> > > Hi Michael,
> > >
> > > On Thu, Jul 30, 2020 at 12:08:29PM -0400, Michael S. Tsirkin wrote:
> > > > On Wed, Jul 22, 2020 at 05:09:23PM +0200, Guennadi Liakhovetski wrote:
> > > > > Hi,
> > > > >
> > > > > Now that virtio-rpmsg endianness fixes have been merged we can
> > > > > proceed with the next step.
> > > >
> > > > Which tree is this for?
> > >
> > > The essential part of this series is for drivers/vhost, so, I presume
> > > that should be the target tree as well. There is however a small part
> > > for the drivers/rpmsg, should I split this series in two or shall we
> > > first review is as a whole to make its goals clearer?
> >
> > I suggest to keep it whole for now.
>
>
> Ok can I get some acks please?

Yes, as soon as I have the opportunity to review the work.  There is a
lot of volume on the linux-remoteproc mailing list lately and
patchsets are reviewed in the order they have been received.

> Also, I put this in my linux-next branch on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
>
> there were some conflicts - could you pls test and report it's ok?
>
> > >
> > > Thanks
> > > Guennadi
> > >
> > > > > v4:
> > > > > - add endianness conversions to comply with the VirtIO standard
> > > > >
> > > > > v3:
> > > > > - address several checkpatch warnings
> > > > > - address comments from Mathieu Poirier
> > > > >
> > > > > v2:
> > > > > - update patch #5 with a correct vhost_dev_init() prototype
> > > > > - drop patch #6 - it depends on a different patch, that is currently
> > > > >   an RFC
> > > > > - address comments from Pierre-Louis Bossart:
> > > > >   * remove "default n" from Kconfig
> > > > >
> > > > > Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> > > > > cases. It can however also be used for virtualisation scenarios,
> > > > > e.g. when using KVM to run Linux on both the host and the guests.
> > > > > This patch set adds a wrapper API to facilitate writing vhost
> > > > > drivers for such RPMsg-based solutions. The first use case is an
> > > > > audio DSP virtualisation project, currently under development, ready
> > > > > for review and submission, available at
> > > > > https://github.com/thesofproject/linux/pull/1501/commits
> > > > >
> > > > > Thanks
> > > > > Guennadi
> > > > >
> > > > > Guennadi Liakhovetski (4):
> > > > >   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
> > > > >   rpmsg: move common structures and defines to headers
> > > > >   rpmsg: update documentation
> > > > >   vhost: add an RPMsg API
> > > > >
> > > > >  Documentation/rpmsg.txt          |   6 +-
> > > > >  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
> > > > >  drivers/vhost/Kconfig            |   7 +
> > > > >  drivers/vhost/Makefile           |   3 +
> > > > >  drivers/vhost/rpmsg.c            | 375 +++++++++++++++++++++++++++++++
> > > > >  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
> > > > >  include/linux/virtio_rpmsg.h     |  83 +++++++
> > > > >  include/uapi/linux/rpmsg.h       |   3 +
> > > > >  include/uapi/linux/vhost.h       |   4 +-
> > > > >  9 files changed, 553 insertions(+), 80 deletions(-)
> > > > >  create mode 100644 drivers/vhost/rpmsg.c
> > > > >  create mode 100644 drivers/vhost/vhost_rpmsg.h
> > > > >  create mode 100644 include/linux/virtio_rpmsg.h
> > > > >
> > > > > --
> > > > > 2.27.0
> > > >
>
