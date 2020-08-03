Return-Path: <SRS0=U8jl=BN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA9C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Aug 2020 13:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F28820738
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Aug 2020 13:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PHLwvD/8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHCNZk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 Aug 2020 09:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgHCNZj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Aug 2020 09:25:39 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57CFC061756
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2020 06:25:39 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id c16so19242741ils.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2020 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2vK/1zu2OP/s7TIUiQTFoYDV/b0nUZhW8aW8ydvfvQ=;
        b=PHLwvD/8MG7vXtdgxgOkv+dblHiq1c0cJDd430K0FLAATpdMqtknJeD4BIuPQSbMbk
         PUh5ndi5I6pJ1XtpdUjfPSOvneWg8hfsnO4NS0a2zyyFI2kntrN6AvFtuEcrreEU+Gxq
         L9S4Z64P6Q7tv0ZvKDznX82M7XQVFGsYdIxdF1YnOlY1HwkGoqAvklkUhjGrzzgTXBN3
         XXVWO11KvPD8isrwVqHZzhhH4VGdr3DZ1RQiM9bhox0eK+2YKRGPu4SiKq9+S4E94b1B
         7JFLkytkhJ5pADDj5DSOD9GEeqBunCL4FCgN7bAeJusZnPmudqpMmgjTfyteU91PKK42
         31nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2vK/1zu2OP/s7TIUiQTFoYDV/b0nUZhW8aW8ydvfvQ=;
        b=FUGmRlgKThEi8z5mp3ehklA/1KZxsUKZWx1NoxEOQibvwfG2yDbzilN9Qvd2bT7a6N
         ckhnMULMv+p/Vs/x3UEDCwybW/FM5lYwNokGEoXzapNR2ACkZyBf5bac0uUHe3uCZgKP
         4T8P85nsgaMCWrgnRyC8Oo6Fjgz+/oFo5f+aQ1d91hj4VmaduxxtRbLh8eFLPnpr5WF3
         VUsMzxdSRW3Mcyz1c0jtZlEIF2WRdi5UiL08m8fnbjNMEcQT3RnsGCqS6keh/GOfzvq2
         OJftt8pBlfP8wt5cQuKCuLncB/f9re3+6rPCBEMvg44b1bwbloolqaAW40AXLipF+9Ll
         DxTQ==
X-Gm-Message-State: AOAM530blc/65t94xJJ20FcG13V+4G9gTwMQszQG1Vfh+kqnu1sDrgrT
        tvHG0w350Egr4S8zv4vCM/oOFmpgd0GO+79qLxAd9w==
X-Google-Smtp-Source: ABdhPJz3dmegEtXXbFm/awaeYdh78FtTf6HjPxXdxh7UD1kqoG0Woo68Y2QRCQ/xlUxwFhylaOjFprYSoC/sXrn5ktc=
X-Received: by 2002:a92:84d2:: with SMTP id y79mr9863524ilk.50.1596461138925;
 Mon, 03 Aug 2020 06:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200730120805-mutt-send-email-mst@kernel.org> <20200731054752.GA28005@ubuntu>
In-Reply-To: <20200731054752.GA28005@ubuntu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 3 Aug 2020 07:25:24 -0600
Message-ID: <CANLsYkxuCf6yeoqJ-T2x3LHvr9+DuxFdcsxJPmrh9A4H8yNr3w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add a vhost RPMsg API
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
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

On Thu, 30 Jul 2020 at 23:47, Guennadi Liakhovetski
<guennadi.liakhovetski@linux.intel.com> wrote:
>
> Hi Michael,
>
> On Thu, Jul 30, 2020 at 12:08:29PM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jul 22, 2020 at 05:09:23PM +0200, Guennadi Liakhovetski wrote:
> > > Hi,
> > >
> > > Now that virtio-rpmsg endianness fixes have been merged we can
> > > proceed with the next step.
> >
> > Which tree is this for?
>
> The essential part of this series is for drivers/vhost, so, I presume
> that should be the target tree as well. There is however a small part
> for the drivers/rpmsg, should I split this series in two or shall we
> first review is as a whole to make its goals clearer?

I suggest to keep it whole for now.

>
> Thanks
> Guennadi
>
> > > v4:
> > > - add endianness conversions to comply with the VirtIO standard
> > >
> > > v3:
> > > - address several checkpatch warnings
> > > - address comments from Mathieu Poirier
> > >
> > > v2:
> > > - update patch #5 with a correct vhost_dev_init() prototype
> > > - drop patch #6 - it depends on a different patch, that is currently
> > >   an RFC
> > > - address comments from Pierre-Louis Bossart:
> > >   * remove "default n" from Kconfig
> > >
> > > Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> > > cases. It can however also be used for virtualisation scenarios,
> > > e.g. when using KVM to run Linux on both the host and the guests.
> > > This patch set adds a wrapper API to facilitate writing vhost
> > > drivers for such RPMsg-based solutions. The first use case is an
> > > audio DSP virtualisation project, currently under development, ready
> > > for review and submission, available at
> > > https://github.com/thesofproject/linux/pull/1501/commits
> > >
> > > Thanks
> > > Guennadi
> > >
> > > Guennadi Liakhovetski (4):
> > >   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
> > >   rpmsg: move common structures and defines to headers
> > >   rpmsg: update documentation
> > >   vhost: add an RPMsg API
> > >
> > >  Documentation/rpmsg.txt          |   6 +-
> > >  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
> > >  drivers/vhost/Kconfig            |   7 +
> > >  drivers/vhost/Makefile           |   3 +
> > >  drivers/vhost/rpmsg.c            | 375 +++++++++++++++++++++++++++++++
> > >  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
> > >  include/linux/virtio_rpmsg.h     |  83 +++++++
> > >  include/uapi/linux/rpmsg.h       |   3 +
> > >  include/uapi/linux/vhost.h       |   4 +-
> > >  9 files changed, 553 insertions(+), 80 deletions(-)
> > >  create mode 100644 drivers/vhost/rpmsg.c
> > >  create mode 100644 drivers/vhost/vhost_rpmsg.h
> > >  create mode 100644 include/linux/virtio_rpmsg.h
> > >
> > > --
> > > 2.27.0
> >
