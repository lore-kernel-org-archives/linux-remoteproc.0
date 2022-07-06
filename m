Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FEAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jul 2022 04:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiGFEDv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jul 2022 00:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbiGFEDt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jul 2022 00:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36B601F2DD
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jul 2022 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657080223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bgioBYMSEhDMqtphKUl3XC15o9rR3khwbKqKnXOUfUc=;
        b=F2mQrICCBohHmQXTFIGNr3wUxzbicG28E9HzD6ybbMgfzIPHbpM2D34s9JUbelhpfa/2pp
        dlOGg3gVZXqeRA3gq1PkgDr9YzJDsBM2ZCa5/czFAwlcfysdcOi58DLMSzGB3/6iX9g3fr
        PxOBCx5jfX2AZ0rzoUMBtYt3txJNiYU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-ItOV4R-cM-2UcrDGmYOD8w-1; Wed, 06 Jul 2022 00:03:42 -0400
X-MC-Unique: ItOV4R-cM-2UcrDGmYOD8w-1
Received: by mail-lj1-f200.google.com with SMTP id b23-20020a2e8497000000b0025d4590922cso245878ljh.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jul 2022 21:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bgioBYMSEhDMqtphKUl3XC15o9rR3khwbKqKnXOUfUc=;
        b=5PkIHEt+ZnQKdF66c49TtC10fI9g7bG3lSzNVnLpsdFI9rGqLkCBmV/j5XA/vfH+qB
         ZxiwXaZ2pw3EllxAZngqGP1Z20MPnQpQsqMl5ouT3NHIpY8sNUtgHsnFyFir1wk/CNDt
         JHE4Emi3BJMnYAqT/7Qd3ph9AZGLJXZLs/DTeq9sjgkU3Q6ohNJ4X+mrD3Bg884rke4W
         EJEuAmNjYn3t06k+cZ61M8iLWCR4yJPVLdAYWA/Tn0YPg3uOH31v9VYEYiYCrtgrqSv7
         pK+CvK6zIls1ZyISoAMhqVCPJTNYHd/ekuc7kfMXmwsm9EVRWidkhO1hdevZx1MA2pWP
         NGng==
X-Gm-Message-State: AJIora8mKI5jjywrWLus8QQp2a1fTjrU2AYkpUNWZMoD8qXi27x4zxwr
        CcEzcvZM4IvUp908YNDHvwmbUYyK424OeBVLfPr//O7TTHTXoIco07QUH8CiWpdxJqTHypkLKKf
        dxHC0Vl7XGHxneCeF78yFmsIParnotCt1FdNZxKmXgjwy+Q==
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id bp13-20020a056512158d00b0047f718c28b5mr25875419lfb.397.1657080219444;
        Tue, 05 Jul 2022 21:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRaMeHFreQUWmTGw/pPBOa+oNYblifJJuS9HgmPVYvFFSkGbfLD7vWnqklmvVdCfZydaDL5r7Ks37NenNQR3c=
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id
 bp13-20020a056512158d00b0047f718c28b5mr25875395lfb.397.1657080219115; Tue, 05
 Jul 2022 21:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s> <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
 <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
 <20220630152003-mutt-send-email-mst@kernel.org> <CACGkMEtHuoHT6meHacsie8M87yjUX3jGEvP7BuU_Vrb3yqkDWw@mail.gmail.com>
 <20220701021536-mutt-send-email-mst@kernel.org> <CACGkMEtkVmq2+NtDpp-XWZFD_WO6Dzm4=pcVwg-aKmStAqJCVg@mail.gmail.com>
 <66323a79-48a7-853e-1c44-9e62fcc5b775@foss.st.com>
In-Reply-To: <66323a79-48a7-853e-1c44-9e62fcc5b775@foss.st.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Wed, 6 Jul 2022 12:03:27 +0800
Message-ID: <CACGkMEt53Qd0m9sKjmPsHgBLWX=fkujD8hq6nNu3BSthAAGWwQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
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

On Mon, Jul 4, 2022 at 5:45 PM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Jason,
>
> On 7/4/22 06:35, Jason Wang wrote:
> > On Fri, Jul 1, 2022 at 2:16 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>
> >> On Fri, Jul 01, 2022 at 09:22:15AM +0800, Jason Wang wrote:
> >>> On Fri, Jul 1, 2022 at 3:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>>
> >>>> On Thu, Jun 30, 2022 at 11:51:30AM -0600, Mathieu Poirier wrote:
> >>>>> + virtualization@lists.linux-foundation.org
> >>>>> + jasowang@redhat.com
> >>>>> + mst@redhat.com
> >>>>>
> >>>>> On Thu, 30 Jun 2022 at 10:20, Arnaud POULIQUEN
> >>>>> <arnaud.pouliquen@foss.st.com> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 6/29/22 19:43, Mathieu Poirier wrote:
> >>>>>>> Hi Anup,
> >>>>>>>
> >>>>>>> On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> >>>>>>>> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> >>>>>>>> fails due to both virtqueues (Rx and Tx) marked as broken by the
> >>>>>>>> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> >>>>>>>> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> >>>>>>>>
> >>>>>>>> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> >>>>>>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> >>>>>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>>>>> index 905ac7910c98..71a64d2c7644 100644
> >>>>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>>>>> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>>>>      /* and half is dedicated for TX */
> >>>>>>>>      vrp->sbufs = bufs_va + total_buf_space / 2;
> >>>>>>>>
> >>>>>>>> +    /* From this point on, we can notify and get callbacks. */
> >>>>>>>> +    virtio_device_ready(vdev);
> >>>>>>>> +
> >>>>>>>
> >>>>>>> Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> >>>>>>> potentially be called (by way of rpmsg_recv_done()), which will race with
> >>>>>>> virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> >>>>>>> rpmsg_recv_done() will fail, potentially breaking remote processors' state
> >>>>>>> machines that don't expect their initial name service to fail when the "device"
> >>>>>>> has been marked as ready.
> >>>>>>>
> >>>>>>> What does make me curious though is that nobody on the remoteproc mailing list
> >>>>>>> has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> >>>>>>> i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> >>>>>>> their rig?
> >>>>>>
> >>>>>> I tested on STm32mp1 board using tag v5.19-rc4(03c765b0e3b4)
> >>>>>> I confirm the issue!
> >>>>>>
> >>>>>> Concerning the solution, I share Mathieu's concern. This could break legacy.
> >>>>>> I made a short test and I would suggest to use __virtio_unbreak_device instead, tounbreak the virtqueues without changing the init sequence.
> >>>>>>
> >>>>>> I this case the patch would be:
> >>>>>>
> >>>>>> +       /*
> >>>>>> +        * Unbreak the virtqueues to allow to add buffers before setting the vdev status
> >>>>>> +        * to ready
> >>>>>> +        */
> >>>>>> +       __virtio_unbreak_device(vdev);
> >>>>>> +
> >>>>>>
> >>>>>>         /* set up the receive buffers */
> >>>>>>         for (i = 0; i < vrp->num_bufs / 2; i++) {
> >>>>>>                 struct scatterlist sg;
> >>>>>>                 void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> >>>>>
> >>>>> This will indeed fix the problem.  On the flip side the kernel
> >>>>> documentation for __virtio_unbreak_device() puzzles me...
> >>>>> It clearly states that it should be used for probing and restoring but
> >>>>> _not_ directly by the driver.  Function rpmsg_probe() is part of
> >>>>> probing but also the entry point to a driver.
> >>>>>
> >>>>> Michael and virtualisation folks, is this the right way to move forward?
> >>>>
> >>>> I don't think it is, __virtio_unbreak_device is intended for core use.
> >>>
> >>> Can we fill the rx after virtio_device_ready() in this case?
> >>>
> >>> Btw, the driver set driver ok after registering, we probably get a svq
> >>> kick before DRIVER_OK?
>
> By "registering" you mean calling rpmsg_virtio_add_ctrl_dev and
> rpmsg_ns_register_device?

Yes.

>
> The rpmsg_ns_register_device has to be called before. Because it has to be
> probed to handle the first message coming from the remote side to create
> associated rpmsg local device.

I couldn't find the code to do this, maybe you can give me some hint on this.

> It doesn't send message.

I see the function register the device to the bus, I wonder if this
means the device could be probed and used by the driver before
virtio_device_ready().

>
> The risk could be for the rpmsg_ctrl device. Registering it
> after the virtio_device_ready(vdev) call could make sense...

I see.

>
> >>>
> >>> Thanks
> >>
> >> Is this an ack for the original patch?
> >
> > Nope, I meant, instead of moving virtio_device_ready() a little bit
> > earlier, can we only move the rvq filling after virtio_device_ready().
> >
> > Thanks
>
> Please find some concerns about this inversion here:
> https://lore.kernel.org/lkml/20220701053813-mutt-send-email-mst@kernel.org/
>
> Regarding __virtio_unbreak_device. The pending virtio_break_device is
> used by some virtio driver.
> Could we consider that it makes sense to also have a
> virtio_unbreak_device interface?

We don't want to allow the driver to unbreak a device since it's
easier to have bugs.

>
>
> I do not well understand the reason of the commit:
> 8b4ec69d7e09 ("virtio: harden vring IRQ", 2022-05-27)

It tries to forbid the virtqueue callbacks to be called before
virtio_device_ready(). This helps to prevent the malicious device from
attacking the driver.

But unfortunately, it breaks several driver because:

1) some driver have races in probe/remove
2) it tries to reuse vq->broken which may break the driver that call
virqueue_add() before virtio_device_ready() which is allowed by the
spec

There's a discussion to have a better behavior that doesn't break the
existing drivers. And the IRQ hardening feature is marked as broken
now, so rpmsg should be fine without any extra effort.

> So following alternative is probably pretty naive:
> Is the use of virtqueue_disable_cb could be an alternative to the
> vq->broken usage allowing to register buffer while preventing virtqueue IRQ?

Probably not, there's no guarantee that the device will not send
notification after virqtueue_disable_cb().

Thanks

>
> Thanks,
> Arnaud
>
> >
> >>
> >>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>> Arnaud
> >>>>>>
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Mathieu
> >>>>>>>
> >>>>>>>>      /* set up the receive buffers */
> >>>>>>>>      for (i = 0; i < vrp->num_bufs / 2; i++) {
> >>>>>>>>              struct scatterlist sg;
> >>>>>>>> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>>>>       */
> >>>>>>>>      notify = virtqueue_kick_prepare(vrp->rvq);
> >>>>>>>>
> >>>>>>>> -    /* From this point on, we can notify and get callbacks. */
> >>>>>>>> -    virtio_device_ready(vdev);
> >>>>>>>> -
> >>>>>>>>      /* tell the remote processor it can start sending messages */
> >>>>>>>>      /*
> >>>>>>>>       * this might be concurrent with callbacks, but we are only
> >>>>>>>> --
> >>>>>>>> 2.34.1
> >>>>>>>>
> >>>>
> >>
> >
>

