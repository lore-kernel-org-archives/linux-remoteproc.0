Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A70CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jun 2022 19:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbiF3TT6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jun 2022 15:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235533AbiF3TT5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jun 2022 15:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2900F3F8BB
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 12:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656616796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=E1fZREo5G1zyL3E99cNxpPu+YKfPtwYvUWsVzF1rbzA=;
        b=T6Z/vzjbDsGbhUb8mPNieWFD26zBJ2/N7Zj/f0+zIq8pbW5v2ERlLlbLPY4m22jrHlOdLm
        MNIXmRTB9Sr7H4v68oK5W90RzRoQQseYCuWS2iCAHQuSddjgZQ7S9qNZspMXxyB5JS02tv
        7aeYBWn0Ts7S1O6C/tImnkLOwy834t0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-eZ7HhRE0MJWAZqWDzVozdg-1; Thu, 30 Jun 2022 15:19:54 -0400
X-MC-Unique: eZ7HhRE0MJWAZqWDzVozdg-1
Received: by mail-wm1-f70.google.com with SMTP id az40-20020a05600c602800b003a048edf007so5971009wmb.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 12:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E1fZREo5G1zyL3E99cNxpPu+YKfPtwYvUWsVzF1rbzA=;
        b=X2UnPGgomfRP67ZtUVFED0bYUikaIEqhqD3nuHwEv+5vVuLosK909yQY0s6jDTv197
         kpTAsa5yN4o41IsCl72bvSca5ri9UrxfoKdRxn5A8hsRV/QeheRx+b71XOVRVYkUOAUK
         8w7LQQuB9hq/2jV9xY+tKpMiSisqQJbedb/CIku1nel1BB4AiFZw02X2ZSxZVNcZ5j3f
         WRzUGBhnJcEPGFsn3z7dsheWpPJgIxpyOFXjJfLCA7uXJIs2Vr6Spp/87NzA3HjiKS25
         o/Za0tLI4Aa7T6csImNPvVwUHEJp0FzCTFuhGyq65NEcqeKF612LwlKBpoIfzXHBbdgb
         0CMg==
X-Gm-Message-State: AJIora9/y++ny2n3xEGJtIxyOrGsto7GCWWUwxqUDADy/xciiq7im2N4
        c04przkO+M/4tEx0Zg16eszO/07G1eAhVcy3r9Ke9AxScui6k1swrI5j5aOZ0T6zBfO2fmDq48L
        zr92k4sqCiJQ0Kvl8pSqNplb4BYs/Hw==
X-Received: by 2002:a5d:584e:0:b0:21c:ea0c:3746 with SMTP id i14-20020a5d584e000000b0021cea0c3746mr9888860wrf.199.1656616793163;
        Thu, 30 Jun 2022 12:19:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFgR4cJXhagHebOa3Tkr9MG8bSTYaTEMzhiZL3sAi2iRr5iiRShZDs06DbeLuQn1vJeahc0g==
X-Received: by 2002:a5d:584e:0:b0:21c:ea0c:3746 with SMTP id i14-20020a5d584e000000b0021cea0c3746mr9888843wrf.199.1656616792927;
        Thu, 30 Jun 2022 12:19:52 -0700 (PDT)
Received: from redhat.com ([2.55.35.209])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b0039c457cea21sm7279586wml.34.2022.06.30.12.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:19:52 -0700 (PDT)
Date:   Thu, 30 Jun 2022 15:19:49 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Anup Patel <apatel@ventanamicro.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
Message-ID: <20220630151716-mutt-send-email-mst@kernel.org>
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629174318.GB2018382@p14s>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 29, 2022 at 11:43:18AM -0600, Mathieu Poirier wrote:
> Hi Anup,
> 
> On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> > The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> > fails due to both virtqueues (Rx and Tx) marked as broken by the
> > __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> > (which unbreaks queues) should be called before virtqueue_add_inbuf().
> > 
> > Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 905ac7910c98..71a64d2c7644 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	/* and half is dedicated for TX */
> >  	vrp->sbufs = bufs_va + total_buf_space / 2;
> >  
> > +	/* From this point on, we can notify and get callbacks. */
> > +	virtio_device_ready(vdev);
> > +
> 
> Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> potentially be called (by way of rpmsg_recv_done()), which will race with
> virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> rpmsg_recv_done() will fail, potentially breaking remote processors' state
> machines that don't expect their initial name service to fail when the "device"
> has been marked as ready.

When you say available I am guessing you really need used.

With a non broken device you won't get a callback
until some buffers have been used.

Or, if no used buffers are present then you will get another
callback down the road.


> 
> What does make me curious though is that nobody on the remoteproc mailing list
> has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> their rig?
> 
> Thanks,
> Mathieu
> 
> >  	/* set up the receive buffers */
> >  	for (i = 0; i < vrp->num_bufs / 2; i++) {
> >  		struct scatterlist sg;
> > @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	 */
> >  	notify = virtqueue_kick_prepare(vrp->rvq);
> >  
> > -	/* From this point on, we can notify and get callbacks. */
> > -	virtio_device_ready(vdev);
> > -
> >  	/* tell the remote processor it can start sending messages */
> >  	/*
> >  	 * this might be concurrent with callbacks, but we are only
> > -- 
> > 2.34.1
> > 
> 

