Return-Path: <SRS0=U8jl=BN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC6BC433E1
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Aug 2020 20:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ADF1207DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Aug 2020 20:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DmaDtoie"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgHCUrF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 Aug 2020 16:47:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27564 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728133AbgHCUrF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Aug 2020 16:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596487623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YWSXpH5LufLhcUK5++dpDgIe+PU/a2RiJP9vO4xSyb8=;
        b=DmaDtoie8RVvQODNkp7S1+GOsfd5cYwOT1QICg57o922y84jDuPYaSN1uCraFsthBnTEkW
        t3w12CoMJgZqleiUrY8kPSRT550h2PPBy8TwZ7YkHKvgREqpyXEHvRKwsrODgu24+k7UDq
        y30USoGPVn3lF9R7b9dS7CeeSVrT2FY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-DKkeP3YcNWSIqtwU8S3TLQ-1; Mon, 03 Aug 2020 16:47:00 -0400
X-MC-Unique: DKkeP3YcNWSIqtwU8S3TLQ-1
Received: by mail-qt1-f197.google.com with SMTP id m13so8879538qth.16
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2020 13:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YWSXpH5LufLhcUK5++dpDgIe+PU/a2RiJP9vO4xSyb8=;
        b=LmlHv1+D3e52jwwHCM4DP97AU7E1lX+GQ3awHU5XeYMwVzCkLk1hoR7Dex3zIAjoSa
         6XnhWSswwzPt7Y7UXox5/lPGATqPeTyxFZiE26Cn4Xng4vk9tF83M186yIyVQ/JkQ9IZ
         Q2Zc8JAO6Sv+rNyOauUmdJPdPwG1MJ9ozZ/tRIQYgrPzRqGx286pIbnFtCB0Py5cPTlG
         X5U4qyhqWfippOl+kiGMJF7eq0lgHf19GcF3LJeOv7+9bbDbpcTS16Mvp53AwUgCwC88
         h3G9aesCx11xciAQHzCMWbwouUiuExJPdTszdYVLR9yXbeWlp27dWwzz9pQardU2DvQk
         ETDA==
X-Gm-Message-State: AOAM530GKjHD+CmGYgkpKjXCcjoGc3yIzSVBnbQP32x2T3gucVUuJcIr
        DKor/IpJy0aw0x+XyOGzdIMI9e41+kqq3PVUvGMi01IfJamq5e9Q2P0DOhDkO/u7HpqqB3XePHJ
        sPMcFxwL9HoY1EOY05yu4cfdz/cu0gA==
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr18296170qtr.135.1596487618310;
        Mon, 03 Aug 2020 13:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5fxnaL6Ri46pS/AV+1q2qnTh3NBSJWvAJ/JhDs1vxf+Hn61PqhkFs+LWvi9B3V915cqgzgQ==
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr18296141qtr.135.1596487617954;
        Mon, 03 Aug 2020 13:46:57 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net. [79.177.102.128])
        by smtp.gmail.com with ESMTPSA id w44sm23855273qtj.86.2020.08.03.13.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 13:46:56 -0700 (PDT)
Date:   Mon, 3 Aug 2020 16:46:51 -0400
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
Message-ID: <20200803164605-mutt-send-email-mst@kernel.org>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200730120805-mutt-send-email-mst@kernel.org>
 <20200731054752.GA28005@ubuntu>
 <CANLsYkxuCf6yeoqJ-T2x3LHvr9+DuxFdcsxJPmrh9A4H8yNr3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxuCf6yeoqJ-T2x3LHvr9+DuxFdcsxJPmrh9A4H8yNr3w@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Aug 03, 2020 at 07:25:24AM -0600, Mathieu Poirier wrote:
> On Thu, 30 Jul 2020 at 23:47, Guennadi Liakhovetski
> <guennadi.liakhovetski@linux.intel.com> wrote:
> >
> > Hi Michael,
> >
> > On Thu, Jul 30, 2020 at 12:08:29PM -0400, Michael S. Tsirkin wrote:
> > > On Wed, Jul 22, 2020 at 05:09:23PM +0200, Guennadi Liakhovetski wrote:
> > > > Hi,
> > > >
> > > > Now that virtio-rpmsg endianness fixes have been merged we can
> > > > proceed with the next step.
> > >
> > > Which tree is this for?
> >
> > The essential part of this series is for drivers/vhost, so, I presume
> > that should be the target tree as well. There is however a small part
> > for the drivers/rpmsg, should I split this series in two or shall we
> > first review is as a whole to make its goals clearer?
> 
> I suggest to keep it whole for now.


Ok can I get some acks please?
Also, I put this in my linux-next branch on 

https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git

there were some conflicts - could you pls test and report it's ok?

> >
> > Thanks
> > Guennadi
> >
> > > > v4:
> > > > - add endianness conversions to comply with the VirtIO standard
> > > >
> > > > v3:
> > > > - address several checkpatch warnings
> > > > - address comments from Mathieu Poirier
> > > >
> > > > v2:
> > > > - update patch #5 with a correct vhost_dev_init() prototype
> > > > - drop patch #6 - it depends on a different patch, that is currently
> > > >   an RFC
> > > > - address comments from Pierre-Louis Bossart:
> > > >   * remove "default n" from Kconfig
> > > >
> > > > Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> > > > cases. It can however also be used for virtualisation scenarios,
> > > > e.g. when using KVM to run Linux on both the host and the guests.
> > > > This patch set adds a wrapper API to facilitate writing vhost
> > > > drivers for such RPMsg-based solutions. The first use case is an
> > > > audio DSP virtualisation project, currently under development, ready
> > > > for review and submission, available at
> > > > https://github.com/thesofproject/linux/pull/1501/commits
> > > >
> > > > Thanks
> > > > Guennadi
> > > >
> > > > Guennadi Liakhovetski (4):
> > > >   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
> > > >   rpmsg: move common structures and defines to headers
> > > >   rpmsg: update documentation
> > > >   vhost: add an RPMsg API
> > > >
> > > >  Documentation/rpmsg.txt          |   6 +-
> > > >  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
> > > >  drivers/vhost/Kconfig            |   7 +
> > > >  drivers/vhost/Makefile           |   3 +
> > > >  drivers/vhost/rpmsg.c            | 375 +++++++++++++++++++++++++++++++
> > > >  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
> > > >  include/linux/virtio_rpmsg.h     |  83 +++++++
> > > >  include/uapi/linux/rpmsg.h       |   3 +
> > > >  include/uapi/linux/vhost.h       |   4 +-
> > > >  9 files changed, 553 insertions(+), 80 deletions(-)
> > > >  create mode 100644 drivers/vhost/rpmsg.c
> > > >  create mode 100644 drivers/vhost/vhost_rpmsg.h
> > > >  create mode 100644 include/linux/virtio_rpmsg.h
> > > >
> > > > --
> > > > 2.27.0
> > >

