Return-Path: <SRS0=xwos=BJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E81C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 16:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF01D20842
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 16:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P9Is4vT3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbgG3QIl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jul 2020 12:08:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41753 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727072AbgG3QIk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jul 2020 12:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596125319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qUqXLll+NefydSj//AgmT8C1K6WHp8sxKqjeN68cy/c=;
        b=P9Is4vT31V72vfeftlCYxg4ElT/PZqdeIhRNrDLXfh12ZGmDjwWXEGz2bFayvoz6IyLLrw
        UX5bpUYZD2XZ8xKTJnTJlLOf1x1lM5W24jXHBPk8Hr9huB6HdV2ObLTS+7GmJSUK95HFS/
        AZ+sJEgX6i0uFXlFDP7kaRbEAGjOtMo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-Q_zaOVRjOMKAtviL2GWKFg-1; Thu, 30 Jul 2020 12:08:35 -0400
X-MC-Unique: Q_zaOVRjOMKAtviL2GWKFg-1
Received: by mail-wm1-f69.google.com with SMTP id l5so2368991wml.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2020 09:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qUqXLll+NefydSj//AgmT8C1K6WHp8sxKqjeN68cy/c=;
        b=S8AHgzofYTFZQTsD+uGB9nSJ+GLSMTbzIWI9oMBbvXJ0WnBEEjLYTOpqCTKhbJc8y8
         jWRYvFBQFfMlAeHdsrAudBx80RRvYmpxK9YNgHoP4nGw+2MLb5sFnyDRnUCgQTDUEB0t
         4hhmuTP/54Cds93RI2ttdRlP1gH0gN4grkwr6mLOq0tOjfSXVhR85VjA4t/iUhNh3QNj
         Mfte1B0gy6+f9gkJ2rR8ua41GWK0OenagD4icosa1Cxy64ir4X5bEPmmWGxVTT8x7n6w
         +lhXPScS4869u/RtoxEmXFOv38k8xI/zv8oZ41tInum/PFL8iuZkltsgLvVD3qpXuwQP
         ifDw==
X-Gm-Message-State: AOAM533p42CIlE4VcIZdCHGIhHx6NZ+WBHdLUGRGstjiByA/rMq0ivY1
        zIbybchxKwmET9BnXz9u+G31Ba4zLi8kRWmU49+6EkglWnf55S2PZBeW/9MSWWKhrVPL0wUADm4
        2EqBvod5E8g44iLGTkAQdugRaTY6DcQ==
X-Received: by 2002:a1c:2095:: with SMTP id g143mr36506wmg.78.1596125314310;
        Thu, 30 Jul 2020 09:08:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8EEO1xnALZftyrn6Van6xavkoUdqm7ncbftjelxThfdJiLZtzyAchyb3bUf7eXUGwTaOiKg==
X-Received: by 2002:a1c:2095:: with SMTP id g143mr36424wmg.78.1596125313141;
        Thu, 30 Jul 2020 09:08:33 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
        by smtp.gmail.com with ESMTPSA id g7sm10167067wrv.82.2020.07.30.09.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 09:08:32 -0700 (PDT)
Date:   Thu, 30 Jul 2020 12:08:29 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v4 0/4] Add a vhost RPMsg API
Message-ID: <20200730120805-mutt-send-email-mst@kernel.org>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 22, 2020 at 05:09:23PM +0200, Guennadi Liakhovetski wrote:
> Hi,
> 
> Now that virtio-rpmsg endianness fixes have been merged we can 
> proceed with the next step.

Which tree is this for?


> v4:
> - add endianness conversions to comply with the VirtIO standard
> 
> v3:
> - address several checkpatch warnings
> - address comments from Mathieu Poirier
> 
> v2:
> - update patch #5 with a correct vhost_dev_init() prototype
> - drop patch #6 - it depends on a different patch, that is currently
>   an RFC
> - address comments from Pierre-Louis Bossart:
>   * remove "default n" from Kconfig
> 
> Linux supports RPMsg over VirtIO for "remote processor" / AMP use
> cases. It can however also be used for virtualisation scenarios,
> e.g. when using KVM to run Linux on both the host and the guests.
> This patch set adds a wrapper API to facilitate writing vhost
> drivers for such RPMsg-based solutions. The first use case is an
> audio DSP virtualisation project, currently under development, ready
> for review and submission, available at
> https://github.com/thesofproject/linux/pull/1501/commits
> 
> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (4):
>   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
>   rpmsg: move common structures and defines to headers
>   rpmsg: update documentation
>   vhost: add an RPMsg API
> 
>  Documentation/rpmsg.txt          |   6 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +------
>  drivers/vhost/Kconfig            |   7 +
>  drivers/vhost/Makefile           |   3 +
>  drivers/vhost/rpmsg.c            | 375 +++++++++++++++++++++++++++++++
>  drivers/vhost/vhost_rpmsg.h      |  74 ++++++
>  include/linux/virtio_rpmsg.h     |  83 +++++++
>  include/uapi/linux/rpmsg.h       |   3 +
>  include/uapi/linux/vhost.h       |   4 +-
>  9 files changed, 553 insertions(+), 80 deletions(-)
>  create mode 100644 drivers/vhost/rpmsg.c
>  create mode 100644 drivers/vhost/vhost_rpmsg.h
>  create mode 100644 include/linux/virtio_rpmsg.h
> 
> -- 
> 2.27.0

