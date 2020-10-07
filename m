Return-Path: <SRS0=blvA=DO=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E027C41604
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Oct 2020 17:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA24E2168B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Oct 2020 17:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwU8bt3f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgJGROg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbgJGROg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Oct 2020 13:14:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD364C0613D2
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Oct 2020 10:14:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id az3so1353005pjb.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Oct 2020 10:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ngTNhBdwg4ML3tx8e2m5/vrdhNYtA8qbO6q+aFl2lR4=;
        b=LwU8bt3fbJWCo6GXKkq85FSUtoenv4zNqNFSrLv38FB8VFkzwbtx6KRiX9KQzxnftY
         ANMcyGLdMuf5eqayf0fBriEvgLwwVr+eLZWcw7OqNdZuZgTmZq2eExTH7NCTXfs9nB2n
         XW83+5hD19U+/aKv7Q+PE9+uKuo+b0LsKI21VrB/Sa0Bvt+qsm37tSTHs3DZdeZnrvpD
         Ac8aoJE9sd/Q3SjHLmxIi5uyrnDe3uaq/TPQcSu6FkGAM4XNS/2S48EOviELcKUXxSrt
         kjRpTXzvuegNvZYvJZF3so8sI/VSiicXuSNatRc7WVao/ZMuSjCjGnwGQbVjyzPR4Srh
         vmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngTNhBdwg4ML3tx8e2m5/vrdhNYtA8qbO6q+aFl2lR4=;
        b=SmCnWE2bEGFSsQ+shuzZUFCzif60/mmuG+xO0cDFO5XlYfH/3ZWdHUhoxk+pvuZPzm
         hMZUpX0prkO/UVjUij2vlQ//5IehZe3Iq+gWnt2BztDPQdpEv+hVKkAP+GfpWls0Tuen
         Y3ukxYru4CbnNaXV1szABDnh5WulsgHSTYKMC8hhgTs31TPKvnY5KgmFo9sG5EJr689Q
         AtZvTL5pkGm1KL7f8gnlNw466oFjH+KBaUrrDpZhumNV6yDKbuYa9A4anWBfx/saxyX/
         r9VVpYR2JP8MzO9tp4NvTH0dE6lE+VNGfevi9mUVea90oPegA+J4anie8/n7acYH5+uP
         sqIg==
X-Gm-Message-State: AOAM531lpGHn8hSWcsAvOCWKLPMewWjztFMiOLyNyyCdnVJMrhsjv4IF
        TUdCeMoMAln3UOF5M8AKJIU7Vg==
X-Google-Smtp-Source: ABdhPJzzPakDPZnxLM3K/Z4pmYwAyHmd/7Ka6tfBRMvFRJSyKavAwEQ7++SMI0NSNElYtrSChc2dUw==
X-Received: by 2002:a17:902:a9cc:b029:d3:77f7:3ca9 with SMTP id b12-20020a170902a9ccb02900d377f73ca9mr3789799plr.75.1602090875341;
        Wed, 07 Oct 2020 10:14:35 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 63sm3739031pfw.42.2020.10.07.10.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 10:14:34 -0700 (PDT)
Date:   Wed, 7 Oct 2020 11:14:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] rpmsg: virtio: Move virtio RPMSG structures to
 private header
Message-ID: <20201007171432.GA575646@xps15>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-6-mathieu.poirier@linaro.org>
 <20200930070345.GD20683@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930070345.GD20683@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Guennadi,

Apologies for the late reply, I've been away.

On Wed, Sep 30, 2020 at 09:03:45AM +0200, Guennadi Liakhovetski wrote:
> On Mon, Sep 21, 2020 at 06:09:55PM -0600, Mathieu Poirier wrote:
> > Move structure virtiproc_info and virtio_rpmsg_channel to rpmsg_internal.h
> > so that they can be used by rpmsg_ns.c
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/rpmsg/rpmsg_internal.h   | 62 ++++++++++++++++++++++++++++++++
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 57 -----------------------------
> >  2 files changed, 62 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > index 587f723757d4..3ea9cec26fc0 100644
> > --- a/drivers/rpmsg/rpmsg_internal.h
> > +++ b/drivers/rpmsg/rpmsg_internal.h
> > @@ -12,12 +12,74 @@
> >  #ifndef __RPMSG_INTERNAL_H__
> >  #define __RPMSG_INTERNAL_H__
> >  
> > +#include <linux/idr.h>
> > +#include <linux/mutex.h>
> >  #include <linux/rpmsg.h>
> > +#include <linux/types.h>
> > +#include <linux/virtio.h>
> 
> I think it would be better to not add any VirtIO dependencies here even 
> temporarily.
> 
> > +#include <linux/wait.h>
> >  #include <linux/poll.h>
> >  
> >  #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
> >  #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
> >  
> > +/**
> > + * struct virtproc_info - virtual remote processor state
> 
> This struct shouldn't be here, let's first prepare the NS callback by 
> removing any VirtIO dependencies and only then move it to the generic 
> driver.

I agree... I will proceed differently in the next revision.

> 
> Thanks
> Guennadi
> 
> > + * @vdev:	the virtio device
> > + * @rvq:	rx virtqueue
> > + * @svq:	tx virtqueue
> > + * @rbufs:	kernel address of rx buffers
> > + * @sbufs:	kernel address of tx buffers
> > + * @num_bufs:	total number of buffers for rx and tx
> > + * @buf_size:   size of one rx or tx buffer
> > + * @last_sbuf:	index of last tx buffer used
> > + * @bufs_dma:	dma base addr of the buffers
> > + * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> > + *		sending a message might require waking up a dozing remote
> > + *		processor, which involves sleeping, hence the mutex.
> > + * @endpoints:	idr of local endpoints, allows fast retrieval
> > + * @endpoints_lock: lock of the endpoints set
> > + * @sendq:	wait queue of sending contexts waiting for a tx buffers
> > + * @sleepers:	number of senders that are waiting for a tx buffer
> > + * @ns_ept:	the bus's name service endpoint
> > + *
> > + * This structure stores the rpmsg state of a given virtio remote processor
> > + * device (there might be several virtio proc devices for each physical
> > + * remote processor).
> > + */
> > +struct virtproc_info {
> > +	struct virtio_device *vdev;
> > +	struct virtqueue *rvq, *svq;
> > +	void *rbufs, *sbufs;
> > +	unsigned int num_bufs;
> > +	unsigned int buf_size;
> > +	int last_sbuf;
> > +	dma_addr_t bufs_dma;
> > +	struct mutex tx_lock;
> > +	struct idr endpoints;
> > +	struct mutex endpoints_lock;
> > +	wait_queue_head_t sendq;
> > +	atomic_t sleepers;
> > +	struct rpmsg_endpoint *ns_ept;
> > +};
> > +
> > +/**
> > + * struct virtio_rpmsg_channel - rpmsg channel descriptor
> > + * @rpdev: the rpmsg channel device
> > + * @vrp: the virtio remote processor device this channel belongs to
> > + *
> > + * This structure stores the channel that links the rpmsg device to the virtio
> > + * remote processor device.
> > + */
> > +struct virtio_rpmsg_channel {
> > +	struct rpmsg_device rpdev;
> > +
> > +	struct virtproc_info *vrp;
> > +};
> > +
> > +#define to_virtio_rpmsg_channel(_rpdev) \
> > +	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
> > +
> >  /**
> >   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> >   * @create_channel:	create backend-specific channel, optional
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index eaf3b2c012c8..0635d86d490f 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -32,63 +32,6 @@
> >  
> >  #include "rpmsg_internal.h"
> >  
> > -/**
> > - * struct virtproc_info - virtual remote processor state
> > - * @vdev:	the virtio device
> > - * @rvq:	rx virtqueue
> > - * @svq:	tx virtqueue
> > - * @rbufs:	kernel address of rx buffers
> > - * @sbufs:	kernel address of tx buffers
> > - * @num_bufs:	total number of buffers for rx and tx
> > - * @buf_size:   size of one rx or tx buffer
> > - * @last_sbuf:	index of last tx buffer used
> > - * @bufs_dma:	dma base addr of the buffers
> > - * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> > - *		sending a message might require waking up a dozing remote
> > - *		processor, which involves sleeping, hence the mutex.
> > - * @endpoints:	idr of local endpoints, allows fast retrieval
> > - * @endpoints_lock: lock of the endpoints set
> > - * @sendq:	wait queue of sending contexts waiting for a tx buffers
> > - * @sleepers:	number of senders that are waiting for a tx buffer
> > - * @ns_ept:	the bus's name service endpoint
> > - *
> > - * This structure stores the rpmsg state of a given virtio remote processor
> > - * device (there might be several virtio proc devices for each physical
> > - * remote processor).
> > - */
> > -struct virtproc_info {
> > -	struct virtio_device *vdev;
> > -	struct virtqueue *rvq, *svq;
> > -	void *rbufs, *sbufs;
> > -	unsigned int num_bufs;
> > -	unsigned int buf_size;
> > -	int last_sbuf;
> > -	dma_addr_t bufs_dma;
> > -	struct mutex tx_lock;
> > -	struct idr endpoints;
> > -	struct mutex endpoints_lock;
> > -	wait_queue_head_t sendq;
> > -	atomic_t sleepers;
> > -	struct rpmsg_endpoint *ns_ept;
> > -};
> > -
> > -/**
> > - * struct virtio_rpmsg_channel - rpmsg channel descriptor
> > - * @rpdev: the rpmsg channel device
> > - * @vrp: the virtio remote processor device this channel belongs to
> > - *
> > - * This structure stores the channel that links the rpmsg device to the virtio
> > - * remote processor device.
> > - */
> > -struct virtio_rpmsg_channel {
> > -	struct rpmsg_device rpdev;
> > -
> > -	struct virtproc_info *vrp;
> > -};
> > -
> > -#define to_virtio_rpmsg_channel(_rpdev) \
> > -	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
> > -
> >  /*
> >   * Local addresses are dynamically allocated on-demand.
> >   * We do not dynamically assign addresses from the low 1024 range,
> > -- 
> > 2.25.1
> > 
