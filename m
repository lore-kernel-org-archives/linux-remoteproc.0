Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F797C71156
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 12:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448E520853
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 12:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="beiNO0zm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbgKPMZo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 07:25:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22409 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727107AbgKPMZo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 07:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605529542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=twYAjgtjeEtP7dme/B3MtQN8LFC4b+SiLV0pksaCw+Q=;
        b=beiNO0zmf1qEofoM6i6EUb8FXyRKDHCv7whNvQKSQhkrAYGpW54JifkHafQdEAICko/pXf
        4WvB6vWtD8nIvhuymQ2Y5gRLq+QjQNWgJmYgZ+hIEFg46/Rnau/imd2Ao66txutxC1NsBe
        hPIizj0dXXZl6onCyHNQWjMCxL1wa88=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-85jjHhAJMb2Y1iXLwcCAtg-1; Mon, 16 Nov 2020 07:25:40 -0500
X-MC-Unique: 85jjHhAJMb2Y1iXLwcCAtg-1
Received: by mail-wm1-f71.google.com with SMTP id y1so10143458wma.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 04:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=twYAjgtjeEtP7dme/B3MtQN8LFC4b+SiLV0pksaCw+Q=;
        b=VRj4dvHvlX2kyd9OiH901XVssv1ABINVkfpkXxdSVeslCFILkf8IrSb4eQnR6uAGFf
         2lNtiO8Yd/W7j4oFiz5oy8ggs95BYdsb0R/4L1f9jlvJ3ir3DM2uOubFmv600LdyC5TM
         HedAuT6QFphFDkyodioTqGwCc6WUJPIsq3D7s5KXPXj9xmCXDvBQoFuYCoG73IzRXZUO
         fu5KNnygRbPcr57OOcGkPxWInMsLx4nKVIAy7gCg6/y1fl0lwKxTlHfFo+nRMlo9m4xR
         27Q1EfbHCLxm02D5nabIJLl22zEliUNQOZrPIpCmPET+w5F/3NuxSE9NpnDT0XGEMpMF
         kO1Q==
X-Gm-Message-State: AOAM531dM6md34KNn63kd36f6aUOpt4PQhj2XiQ13Vt+Ygqw84IM5is8
        jgNvytSd8H/Kn4hRyZr99TYvWYAYpUHMzEpJoWwFHrO7xxtO0XQ5FWxefb/5fp8Zn12TO2UkbbO
        Gs6ct75pWMGskMLZHxxM1QCrQEafL7A==
X-Received: by 2002:adf:a551:: with SMTP id j17mr20868548wrb.217.1605529539628;
        Mon, 16 Nov 2020 04:25:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTpJY9zGC+xn6xq+CTHXLTZWqhazVhhm46QQKKwl8uV2NZSejldsTJ5sdUDy6obYAtroP4Vw==
X-Received: by 2002:adf:a551:: with SMTP id j17mr20868522wrb.217.1605529539401;
        Mon, 16 Nov 2020 04:25:39 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
        by smtp.gmail.com with ESMTPSA id i10sm22686923wrs.22.2020.11.16.04.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 04:25:38 -0800 (PST)
Date:   Mon, 16 Nov 2020 07:25:31 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Alexander Lobakin <alobakin@pm.me>, Amit Shah <amit@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201116071910-mutt-send-email-mst@kernel.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116091950.GA30524@infradead.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 09:19:50AM +0000, Christoph Hellwig wrote:
> I just noticed this showing up in Linus' tree and I'm not happy.

Are you sure? I think it's in next.

> This whole model of the DMA subdevices in remoteproc is simply broken.
> 
> We really need to change the virtio code pass an expicit DMA device (
> similar to what e.g. the USB and RDMA code does), instead of faking up
> devices with broken adhoc inheritance of DMA properties and magic poking
> into device parent relationships.

OK but we do have a regression since 5.7 and this looks like
a fix appropriate for e.g. stable, right?

> Bjorn, I thought you were going to look into this a while ago?
> 
> 
> On Wed, Nov 04, 2020 at 03:31:36PM +0000, Alexander Lobakin wrote:
> > Since commit 086d08725d34 ("remoteproc: create vdev subdevice with
> > specific dma memory pool"), every remoteproc has a DMA subdevice
> > ("remoteprocX#vdevYbuffer") for each virtio device, which inherits
> > DMA capabilities from the corresponding platform device. This allowed
> > to associate different DMA pools with each vdev, and required from
> > virtio drivers to perform DMA operations with the parent device
> > (vdev->dev.parent) instead of grandparent (vdev->dev.parent->parent).
> > 
> > virtio_rpmsg_bus was already changed in the same merge cycle with
> > commit d999b622fcfb ("rpmsg: virtio: allocate buffer from parent"),
> > but virtio_console did not. In fact, operations using the grandparent
> > worked fine while the grandparent was the platform device, but since
> > commit c774ad010873 ("remoteproc: Fix and restore the parenting
> > hierarchy for vdev") this was changed, and now the grandparent device
> > is the remoteproc device without any DMA capabilities.
> > So, starting v5.8-rc1 the following warning is observed:
> > 
> > [    2.483925] ------------[ cut here ]------------
> > [    2.489148] WARNING: CPU: 3 PID: 101 at kernel/dma/mapping.c:427 0x80e7eee8
> > [    2.489152] Modules linked in: virtio_console(+)
> > [    2.503737]  virtio_rpmsg_bus rpmsg_core
> > [    2.508903]
> > [    2.528898] <Other modules, stack and call trace here>
> > [    2.913043]
> > [    2.914907] ---[ end trace 93ac8746beab612c ]---
> > [    2.920102] virtio-ports vport1p0: Error allocating inbufs
> > 
> > kernel/dma/mapping.c:427 is:
> > 
> > WARN_ON_ONCE(!dev->coherent_dma_mask);
> > 
> > obviously because the grandparent now is remoteproc dev without any
> > DMA caps:
> > 
> > [    3.104943] Parent: remoteproc0#vdev1buffer, grandparent: remoteproc0
> > 
> > Fix this the same way as it was for virtio_rpmsg_bus, using just the
> > parent device (vdev->dev.parent, "remoteprocX#vdevYbuffer") for DMA
> > operations.
> > This also allows now to reserve DMA pools/buffers for rproc serial
> > via Device Tree.
> > 
> > Fixes: c774ad010873 ("remoteproc: Fix and restore the parenting hierarchy for vdev")
> > Cc: stable@vger.kernel.org # 5.1+
> > Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> > ---
> >  drivers/char/virtio_console.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> > index a2da8f768b94..1836cc56e357 100644
> > --- a/drivers/char/virtio_console.c
> > +++ b/drivers/char/virtio_console.c
> > @@ -435,12 +435,12 @@ static struct port_buffer *alloc_buf(struct virtio_device *vdev, size_t buf_size
> >  		/*
> >  		 * Allocate DMA memory from ancestor. When a virtio
> >  		 * device is created by remoteproc, the DMA memory is
> > -		 * associated with the grandparent device:
> > -		 * vdev => rproc => platform-dev.
> > +		 * associated with the parent device:
> > +		 * virtioY => remoteprocX#vdevYbuffer.
> >  		 */
> > -		if (!vdev->dev.parent || !vdev->dev.parent->parent)
> > +		buf->dev = vdev->dev.parent;
> > +		if (!buf->dev)
> >  			goto free_buf;
> > -		buf->dev = vdev->dev.parent->parent;
> >  
> >  		/* Increase device refcnt to avoid freeing it */
> >  		get_device(buf->dev);
> > -- 
> > 2.29.2
> > 
> > 
> ---end quoted text---

