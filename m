Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E51C43334
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Jul 2022 01:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiGABWd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jun 2022 21:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiGABWb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jun 2022 21:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B29BD5A2F2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 18:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656638549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2KH53Wl1gr5UMbynLfVT+FjBM4ZDGlsSeHT6iWm6OnU=;
        b=aQAxS48R1Lnx1vlEDG9WdVZ/k6U/4yWAr4kdTOqZ3NYMcRFzgWOtTPeEiVT0MqDlgV3Vx+
        I78i5ndM77LFzFqpQGfjuKtfOiyWjn8hJohtbKGm8yIPf1BcElr12H6MXx06dMa+9DCKIE
        9l02JafxDLFaTEWftOxjarUwa8NTp8o=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-QxK5xqANNbOwB9em-yTZVg-1; Thu, 30 Jun 2022 21:22:28 -0400
X-MC-Unique: QxK5xqANNbOwB9em-yTZVg-1
Received: by mail-lf1-f70.google.com with SMTP id v5-20020a05651203a500b0047faf076d1dso380630lfp.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 18:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KH53Wl1gr5UMbynLfVT+FjBM4ZDGlsSeHT6iWm6OnU=;
        b=JQpk/QHJ2HWpmET4yMzVKr/UtaDDcbWxl7hf3+84Rp1J928aGqj7Yef9iafUqSVmzR
         0InMEawAthylMTlldel7MmmvPgRmNNXiFyi0/S8bBE0o6rlIRDpqvOU2pHIfrDXMA70k
         7V0xGu0QbuenweO+HTxK3LVlvAxBQqwbCuqY9ogTe0cHP7UilHNRZHnctxiGnpt5dEuv
         jHIvWf/bfvQjeQKz+Nxo5Hu5WgfYWxvZCvYXbqVrBO5S1LuyNbMsuqY0tUQNzrEKJLTP
         e8bBPPQ73JX083iB7FIlfCC6f3W21+1s+oBQPSm3ryaqtioqKaSshAdxLOHbLzEPqVhs
         G8Gg==
X-Gm-Message-State: AJIora8bDHXZVSOIBZOumURsUr6Ydr4GXYWfgt5GoHL/+yE0DRUIw1Lk
        pm/PZCqQzsKtGG3M5Hs4I+Qsto0iliwL9Sq3vsq1LtqsTqL7VEWBTabWu9DKFPFVdc9KLvzRp5K
        JLg/O2NBvQMJV4dmqO9ub2hjIKc6rkleFGJUxoGHxGeD4uA==
X-Received: by 2002:a05:6512:22c3:b0:47f:704b:3820 with SMTP id g3-20020a05651222c300b0047f704b3820mr7390612lfu.411.1656638546129;
        Thu, 30 Jun 2022 18:22:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vr8HxTtR3VyCNAME9Etu0HGTUwoK8NFuuJdU03zhtIJfCQW8P7Cfwl91EkAy5W/C6W4aZiLeDVgXy6h3cd8Cw=
X-Received: by 2002:a05:6512:22c3:b0:47f:704b:3820 with SMTP id
 g3-20020a05651222c300b0047f704b3820mr7390605lfu.411.1656638545914; Thu, 30
 Jun 2022 18:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s> <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
 <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com> <20220630152003-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220630152003-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Date:   Fri, 1 Jul 2022 09:22:15 +0800
Message-ID: <CACGkMEtHuoHT6meHacsie8M87yjUX3jGEvP7BuU_Vrb3yqkDWw@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 1, 2022 at 3:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jun 30, 2022 at 11:51:30AM -0600, Mathieu Poirier wrote:
> > + virtualization@lists.linux-foundation.org
> > + jasowang@redhat.com
> > + mst@redhat.com
> >
> > On Thu, 30 Jun 2022 at 10:20, Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> > >
> > > Hi,
> > >
> > > On 6/29/22 19:43, Mathieu Poirier wrote:
> > > > Hi Anup,
> > > >
> > > > On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> > > >> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> > > >> fails due to both virtqueues (Rx and Tx) marked as broken by the
> > > >> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> > > >> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> > > >>
> > > >> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> > > >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > >> ---
> > > >>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> > > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >>
> > > >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > >> index 905ac7910c98..71a64d2c7644 100644
> > > >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > >> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > > >>      /* and half is dedicated for TX */
> > > >>      vrp->sbufs = bufs_va + total_buf_space / 2;
> > > >>
> > > >> +    /* From this point on, we can notify and get callbacks. */
> > > >> +    virtio_device_ready(vdev);
> > > >> +
> > > >
> > > > Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> > > > potentially be called (by way of rpmsg_recv_done()), which will race with
> > > > virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> > > > rpmsg_recv_done() will fail, potentially breaking remote processors' state
> > > > machines that don't expect their initial name service to fail when the "device"
> > > > has been marked as ready.
> > > >
> > > > What does make me curious though is that nobody on the remoteproc mailing list
> > > > has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> > > > i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> > > > their rig?
> > >
> > > I tested on STm32mp1 board using tag v5.19-rc4(03c765b0e3b4)
> > > I confirm the issue!
> > >
> > > Concerning the solution, I share Mathieu's concern. This could break legacy.
> > > I made a short test and I would suggest to use __virtio_unbreak_device instead, tounbreak the virtqueues without changing the init sequence.
> > >
> > > I this case the patch would be:
> > >
> > > +       /*
> > > +        * Unbreak the virtqueues to allow to add buffers before setting the vdev status
> > > +        * to ready
> > > +        */
> > > +       __virtio_unbreak_device(vdev);
> > > +
> > >
> > >         /* set up the receive buffers */
> > >         for (i = 0; i < vrp->num_bufs / 2; i++) {
> > >                 struct scatterlist sg;
> > >                 void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> >
> > This will indeed fix the problem.  On the flip side the kernel
> > documentation for __virtio_unbreak_device() puzzles me...
> > It clearly states that it should be used for probing and restoring but
> > _not_ directly by the driver.  Function rpmsg_probe() is part of
> > probing but also the entry point to a driver.
> >
> > Michael and virtualisation folks, is this the right way to move forward?
>
> I don't think it is, __virtio_unbreak_device is intended for core use.

Can we fill the rx after virtio_device_ready() in this case?

Btw, the driver set driver ok after registering, we probably get a svq
kick before DRIVER_OK?

Thanks

>
> > >
> > > Regards,
> > > Arnaud
> > >
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > >>      /* set up the receive buffers */
> > > >>      for (i = 0; i < vrp->num_bufs / 2; i++) {
> > > >>              struct scatterlist sg;
> > > >> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > > >>       */
> > > >>      notify = virtqueue_kick_prepare(vrp->rvq);
> > > >>
> > > >> -    /* From this point on, we can notify and get callbacks. */
> > > >> -    virtio_device_ready(vdev);
> > > >> -
> > > >>      /* tell the remote processor it can start sending messages */
> > > >>      /*
> > > >>       * this might be concurrent with callbacks, but we are only
> > > >> --
> > > >> 2.34.1
> > > >>
>

