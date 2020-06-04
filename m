Return-Path: <SRS0=l7X0=7R=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A79DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Jun 2020 19:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79C37206E6
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Jun 2020 19:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRHBqhzv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgFDTXr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Jun 2020 15:23:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44838 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728758AbgFDTXr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Jun 2020 15:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591298625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RK7OUZgW5NorsDX1d7OO/eYBX7LBH2rL3jyqXLO1xAg=;
        b=WRHBqhzvtnBiUmV2ty+J36YUH3f9qTLrGlc6oJm9pXiSRieRre7D52aD+lZLXX1NnYACOY
        nLQpSkV+uMqb4r33gM4NOUZFinK3KLXnb74w2nur+faVmlbufb1juGBUOwozxBY6YcH0/U
        A6dc8LFLknbFjM8gxGCUKhvCi5aR0KM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-1KIv2yTNMyCJq_IZZ39FpA-1; Thu, 04 Jun 2020 15:23:42 -0400
X-MC-Unique: 1KIv2yTNMyCJq_IZZ39FpA-1
Received: by mail-wm1-f70.google.com with SMTP id k185so2073897wme.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2020 12:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RK7OUZgW5NorsDX1d7OO/eYBX7LBH2rL3jyqXLO1xAg=;
        b=cJpvazxCW8dMB4vQq+KTs9NFS1vJQChHaveojnT2FG/IjHZxLPtLvjyNS48pr3djl8
         g1TW98+/VaL+2rX8Z36e9I+5E+tRSOWH7LwZ7zLdheiLAuY6eb8RIn5fevchHKOOHq3Q
         6oVcPlRjqUcJbxqoLZKfFYEHZm9SYGz/AL5r9efyCfVkmah7y4MMaJ6xxzJnc80NiRQ5
         JZySPSnaebHacJFH1/DcmsDQ14EQmmx1RYNb+tUPkDKfb3qO1n5PBBnI/+rNWkg97A/U
         +CtMfxy5DOVY1ns+djiEicUptPiiBuWGdkYdiXMm5f4Zxotgy8NRu29UkZ5SQMj6i21G
         4yOQ==
X-Gm-Message-State: AOAM530Rz/y/Wt5HmzGNYltmGRFtT+3gnFlxla+qddy9ZAq4A5ks9ChB
        dM+w0gHHWmMGifFRx0ll8KvmG2NjVN6c79sQSp/fKcFEjc1WczUAQ1SXP4Hhuc5RLeizuW+eBhW
        fIm4Olf1vBfqpw1OeAXd4lIJQnP/i1w==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr5815818wrs.100.1591298621573;
        Thu, 04 Jun 2020 12:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp0/pnnPfhicvkES2RGb4PHh4oHYIiCtpAgZ3EQrs+Ij/+qtfXjmNZZ+e/z1giKYaInwdODw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr5815767wrs.100.1591298620862;
        Thu, 04 Jun 2020 12:23:40 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id e10sm9109099wrn.11.2020.06.04.12.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 12:23:40 -0700 (PDT)
Date:   Thu, 4 Jun 2020 15:23:37 -0400
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
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200604151917-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 27, 2020 at 08:05:36PM +0200, Guennadi Liakhovetski wrote:
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
> Linux supports RPMsg over VirtIO for "remote processor" /AMP use
> cases. It can however also be used for virtualisation scenarios,
> e.g. when using KVM to run Linux on both the host and the guests.
> This patch set adds a wrapper API to facilitate writing vhost
> drivers for such RPMsg-based solutions. The first use case is an
> audio DSP virtualisation project, currently under development, ready
> for review and submission, available at
> https://github.com/thesofproject/linux/pull/1501/commits
> A further patch for the ADSP vhost RPMsg driver will be sent
> separately for review only since it cannot be merged without audio
> patches being upstreamed first.


RPMsg over virtio has several problems. One is that it's
not specced at all. Before we add more stuff, I'd like so
see at least an attempt at describing what it's supposed to do.

Another it's out of line with 1.0 spec passing guest
endian data around. Won't work if host and guest
endian-ness do not match. Should pass eveything in LE and
convert.

It's great to see it's seeing active development finally.
Do you think you will have time to address these?



> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (5):
>   vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
>   vhost: (cosmetic) remove a superfluous variable initialisation
>   rpmsg: move common structures and defines to headers
>   rpmsg: update documentation
>   vhost: add an RPMsg API
> 
>  Documentation/rpmsg.txt          |   6 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c |  78 +-------
>  drivers/vhost/Kconfig            |   7 +
>  drivers/vhost/Makefile           |   3 +
>  drivers/vhost/rpmsg.c            | 382 +++++++++++++++++++++++++++++++++++++++
>  drivers/vhost/vhost.c            |   2 +-
>  drivers/vhost/vhost_rpmsg.h      |  74 ++++++++
>  include/linux/virtio_rpmsg.h     |  81 +++++++++
>  include/uapi/linux/rpmsg.h       |   3 +
>  include/uapi/linux/vhost.h       |   4 +-
>  10 files changed, 559 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/vhost/rpmsg.c
>  create mode 100644 drivers/vhost/vhost_rpmsg.h
>  create mode 100644 include/linux/virtio_rpmsg.h
> 
> -- 
> 1.9.3

