Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA9BC43334
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jun 2022 19:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236580AbiF3TUx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jun 2022 15:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbiF3TUw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jun 2022 15:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A152427EB
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656616850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6CjSS5d5sjNHdItcbvsvU/YpM2uPYuOWoAxR2J1g4bg=;
        b=d9IB19eZI1CvUAl/klzJaaYb3P4KzloxFXw4PlJ+TZ7suTq7QhClXOO4xiuAZCJvUAVF1W
        hBRX4CukRACnpg5/rk8M9WqVlmKVFiGwv3l3jozBArSqksjBJV3cOTLc5Nt8qHZd2KKQdy
        Fi+RBnKmreSqggwW+f42HeneaFokYHw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-STNgL2nZPgCUwx1-htEddA-1; Thu, 30 Jun 2022 15:20:49 -0400
X-MC-Unique: STNgL2nZPgCUwx1-htEddA-1
Received: by mail-wm1-f70.google.com with SMTP id m20-20020a05600c4f5400b003a03aad6bdfso8272741wmq.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 12:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6CjSS5d5sjNHdItcbvsvU/YpM2uPYuOWoAxR2J1g4bg=;
        b=w1cPYPYLfPrOp8kCzYuQLty+T+XG8bTnSRACAmm0K0BLvYkaeYs6GWFOijHsq2uFic
         lq92j77n4hph4wqpJNONSkEkvEh7bclRpfpuTL8sWidjmxAs7p4GWdjnUHh2lsML9oq1
         sEz3qo5TjZQZE/kL4iNhm+XsiLuL/UAy1eBccPETVdy+gn3us2hB3yx2ayT3NTLwpIbs
         mu3vhL1xR9VwkfwPMFVXBeIOfKUmPmnmZBBJMWhldyewmHpx8F2brCzEXA/fjFhTuYkb
         S9WrMF0KLU3NPs4nnvolc0xzQJMY9poI5hUIm3cm9eG23THJgYauW/xhrk/CvbTEgT0O
         FvCA==
X-Gm-Message-State: AJIora+kl6lmHPJESY4BouS1X69TIGM8TaW+0R52Y3UBCq4EtCqZK1ZX
        o4g2JApU61JOrgaexemSqe8i+lSoBZCn1R7tBBRQofDysQGLqYMu4l1f1YU+Nzr77FENbA+7qxq
        y6/m61MHTwckPiV58NKCZ8rda2pzYzA==
X-Received: by 2002:a5d:66cc:0:b0:21b:8f5e:875b with SMTP id k12-20020a5d66cc000000b0021b8f5e875bmr10265276wrw.51.1656616846861;
        Thu, 30 Jun 2022 12:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgE4b+BImXUdY4JEm94kH9+IYij7gDCFCM6lWg999bdtkPXFWxXh65gicKcRT7llsoDvFGDw==
X-Received: by 2002:a5d:66cc:0:b0:21b:8f5e:875b with SMTP id k12-20020a5d66cc000000b0021b8f5e875bmr10265260wrw.51.1656616846615;
        Thu, 30 Jun 2022 12:20:46 -0700 (PDT)
Received: from redhat.com ([2.55.35.209])
        by smtp.gmail.com with ESMTPSA id q3-20020a1c4303000000b003a03185231bsm7512645wma.31.2022.06.30.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:20:46 -0700 (PDT)
Date:   Thu, 30 Jun 2022 15:20:42 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Jason Wang <jasowang@redhat.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
Message-ID: <20220630152003-mutt-send-email-mst@kernel.org>
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s>
 <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
 <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jun 30, 2022 at 11:51:30AM -0600, Mathieu Poirier wrote:
> + virtualization@lists.linux-foundation.org
> + jasowang@redhat.com
> + mst@redhat.com
> 
> On Thu, 30 Jun 2022 at 10:20, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > Hi,
> >
> > On 6/29/22 19:43, Mathieu Poirier wrote:
> > > Hi Anup,
> > >
> > > On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> > >> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> > >> fails due to both virtqueues (Rx and Tx) marked as broken by the
> > >> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> > >> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> > >>
> > >> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> > >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > >> ---
> > >>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > >> index 905ac7910c98..71a64d2c7644 100644
> > >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > >> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > >>      /* and half is dedicated for TX */
> > >>      vrp->sbufs = bufs_va + total_buf_space / 2;
> > >>
> > >> +    /* From this point on, we can notify and get callbacks. */
> > >> +    virtio_device_ready(vdev);
> > >> +
> > >
> > > Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> > > potentially be called (by way of rpmsg_recv_done()), which will race with
> > > virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> > > rpmsg_recv_done() will fail, potentially breaking remote processors' state
> > > machines that don't expect their initial name service to fail when the "device"
> > > has been marked as ready.
> > >
> > > What does make me curious though is that nobody on the remoteproc mailing list
> > > has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> > > i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> > > their rig?
> >
> > I tested on STm32mp1 board using tag v5.19-rc4(03c765b0e3b4)
> > I confirm the issue!
> >
> > Concerning the solution, I share Mathieu's concern. This could break legacy.
> > I made a short test and I would suggest to use __virtio_unbreak_device instead, tounbreak the virtqueues without changing the init sequence.
> >
> > I this case the patch would be:
> >
> > +       /*
> > +        * Unbreak the virtqueues to allow to add buffers before setting the vdev status
> > +        * to ready
> > +        */
> > +       __virtio_unbreak_device(vdev);
> > +
> >
> >         /* set up the receive buffers */
> >         for (i = 0; i < vrp->num_bufs / 2; i++) {
> >                 struct scatterlist sg;
> >                 void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> 
> This will indeed fix the problem.  On the flip side the kernel
> documentation for __virtio_unbreak_device() puzzles me...
> It clearly states that it should be used for probing and restoring but
> _not_ directly by the driver.  Function rpmsg_probe() is part of
> probing but also the entry point to a driver.
> 
> Michael and virtualisation folks, is this the right way to move forward?

I don't think it is, __virtio_unbreak_device is intended for core use.

> >
> > Regards,
> > Arnaud
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > >>      /* set up the receive buffers */
> > >>      for (i = 0; i < vrp->num_bufs / 2; i++) {
> > >>              struct scatterlist sg;
> > >> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > >>       */
> > >>      notify = virtqueue_kick_prepare(vrp->rvq);
> > >>
> > >> -    /* From this point on, we can notify and get callbacks. */
> > >> -    virtio_device_ready(vdev);
> > >> -
> > >>      /* tell the remote processor it can start sending messages */
> > >>      /*
> > >>       * this might be concurrent with callbacks, but we are only
> > >> --
> > >> 2.34.1
> > >>

