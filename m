Return-Path: <SRS0=S4pK=BO=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16638C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Aug 2020 12:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE9CA22BED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Aug 2020 12:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGPYheDX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgHDM1J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 Aug 2020 08:27:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34519 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725864AbgHDM1F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Aug 2020 08:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596544024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9vhPgMDKcGi9ZPslRrds1Rb1iUgXvAPxw94iDlV9Esw=;
        b=hGPYheDXg6fSDy7KwvRkrOLaqf4hGeG6V3reRKN9F4g0mgpxEA2jFDLg3jdLQT1x13XfYq
        FOtWpk/GuMCHpNX9Ax1ykQZAprKbjbiVsRr9RKBDI6751hvuYecZwcnueuA/PPnUTYjSgn
        ksnZHwGMTr29xLo1R6oAS5jPGOa2/os=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-FEj3krxQOhmO6kVCmEvaUg-1; Tue, 04 Aug 2020 08:27:01 -0400
X-MC-Unique: FEj3krxQOhmO6kVCmEvaUg-1
Received: by mail-qt1-f198.google.com with SMTP id k1so15283262qtp.20
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2020 05:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9vhPgMDKcGi9ZPslRrds1Rb1iUgXvAPxw94iDlV9Esw=;
        b=AJv4KpXpN9Qkz70Vzdn+CyVZTNTkoIt6bKDeNtqRTWooUH6QsHPmyYmtcOrJy/iyWb
         gl/KMxWTLGUUCxMAoEGBWrMA3prYFzfeQ1lSEiNPyv1NnibFpFYsQaVpVDter2Y5e+Un
         hcfeVav6t1vXs+K1cZIdZgkUwGep3NESpirPF25WrcxOPio10kaGXfh3ii00X4kKqYmV
         Bn8HAgMp01pYt7rm+QA/9oSaWdXP45jJqxy9TjQlTifxDpDcHRp75qLEAogZVjXx0EyA
         jbjkUIjAhZeVR7kJ9pKzSN5T+GwlD5gJdCQvs38VSztk+yFSWJV5PY0yOO058RKOoZi8
         CeZg==
X-Gm-Message-State: AOAM530cR2SMoSqZZvDJEdegYtwqINPJnacRWN3E3tu9sXSks0Yok1+9
        aMzunFtg99pPLcxi5Kp2HG6pkOWcycEr07jbQkUVj30rzxHzmevM3g4ShJ1Od/RUrGjCOtWQu+E
        DvyLY+wWYHrzpMMYTcBcrD0yLToaTpQ==
X-Received: by 2002:ac8:586:: with SMTP id a6mr21323493qth.391.1596544020891;
        Tue, 04 Aug 2020 05:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGMj+9fSab5vOUQnGujXpnk+obUr+jaJXm5QnWgBc4+EfOvLlsgeBJv/ur3ycUhBN2ervlkA==
X-Received: by 2002:ac8:586:: with SMTP id a6mr21323472qth.391.1596544020661;
        Tue, 04 Aug 2020 05:27:00 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net. [79.177.102.128])
        by smtp.gmail.com with ESMTPSA id e21sm21251091qkl.88.2020.08.04.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 05:26:59 -0700 (PDT)
Date:   Tue, 4 Aug 2020 08:26:53 -0400
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
Message-ID: <20200804082250-mutt-send-email-mst@kernel.org>
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

OK my attempts to resolve conflicts just created a mess.

I dropped these for now, could you pls rebase on top
of linux-next branch in my tree, and repost?
Thanks!


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

