Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AB5C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jun 2022 17:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbiF3Rvq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jun 2022 13:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235656AbiF3Rvp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jun 2022 13:51:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3200B2018A
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 10:51:44 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id d2so28718813ejy.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6hzDZhLxqkjoUmpHgPZPyqLqi72LMmy86NXiSfNOEHI=;
        b=F8Cjja5cT4tDbmAw8yO3QwsVjn3U5AIlNrcWc6OtM6e0gLJFEnKHuuT7R5YfGTowVY
         amrK2aVIeQ96bz48a7d63KhOClgKnH8nY55IFRr9gDaX48onS8iO3ihFYArF26VagBum
         CutsvrRqQ1HM+puU3uFfMlsqmiofr3RISD4LRCDCumpmmJbe0RUnqZ2PvQzHI+IILwWQ
         ckHEaf+LfbYmL7SC5CXbzk3Rqr0EjRueDDPWfPgxFr4rhvsx5RJZrm5KfsCLVw0UrsSK
         Bvuf8zzJ4I8jYJrVG0IzFcW0F7U5j1b/Z2Q/nMdyjrMp56I7zN9GzqpWivrrMU/NrdUE
         WVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6hzDZhLxqkjoUmpHgPZPyqLqi72LMmy86NXiSfNOEHI=;
        b=OXlAlAQJOPbFFd8ZVlZf3aRyWnohDw6j5O1ihHTgG965BbfoFX6MJnpV3Ad24g+zn/
         SKLvgEVtlpk97XQNaz283Kp8/7q9cxbsj5oL3xBDNBgDmmM/o0jhJn18AFpHTCTTgIWl
         22FgPMAigN9TzBoPX5LY6UcHliriECviy3XUXGuFt5357PtYeFcSJOOvn+ty0TYez7mv
         91ruD4x+wv3qFY73n2qFXE/AHtssYtlQOw4TNSLqTFMFuJ/vEbO2y+OvPQZcIv7X4dDn
         lmcfDuBIeOeeauqWk1K9XVN0m6krdbEs16aHjU3OtpGF70OHaBXWRzM577sm5A9jgkIM
         wKaA==
X-Gm-Message-State: AJIora+MP8PeRBFQ6wFoXB1+1fARl5h9+W4aSeRMzsRhkZ1NwYcIlCkT
        HAsJvpJOvqamNRUs9O9g7DyF+miFZiK7ezY8Db/XyA==
X-Google-Smtp-Source: AGRyM1vJ8TV2OXdZAUriH7ObJl5E2n4LqtDDTWaG7gCe8bjchWjq1OGKxTpoG4HS+yG6fpYXU5t9vL+J2C0Qzc4IdFY=
X-Received: by 2002:a17:906:488d:b0:726:2cdc:dc6c with SMTP id
 v13-20020a170906488d00b007262cdcdc6cmr9893945ejq.62.1656611502760; Thu, 30
 Jun 2022 10:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s> <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
In-Reply-To: <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 30 Jun 2022 11:51:30 -0600
Message-ID: <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Anup Patel <apatel@ventanamicro.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

+ virtualization@lists.linux-foundation.org
+ jasowang@redhat.com
+ mst@redhat.com

On Thu, 30 Jun 2022 at 10:20, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hi,
>
> On 6/29/22 19:43, Mathieu Poirier wrote:
> > Hi Anup,
> >
> > On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> >> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> >> fails due to both virtqueues (Rx and Tx) marked as broken by the
> >> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> >> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> >>
> >> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >> ---
> >>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> index 905ac7910c98..71a64d2c7644 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>      /* and half is dedicated for TX */
> >>      vrp->sbufs = bufs_va + total_buf_space / 2;
> >>
> >> +    /* From this point on, we can notify and get callbacks. */
> >> +    virtio_device_ready(vdev);
> >> +
> >
> > Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> > potentially be called (by way of rpmsg_recv_done()), which will race with
> > virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> > rpmsg_recv_done() will fail, potentially breaking remote processors' state
> > machines that don't expect their initial name service to fail when the "device"
> > has been marked as ready.
> >
> > What does make me curious though is that nobody on the remoteproc mailing list
> > has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> > i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> > their rig?
>
> I tested on STm32mp1 board using tag v5.19-rc4(03c765b0e3b4)
> I confirm the issue!
>
> Concerning the solution, I share Mathieu's concern. This could break legacy.
> I made a short test and I would suggest to use __virtio_unbreak_device instead, tounbreak the virtqueues without changing the init sequence.
>
> I this case the patch would be:
>
> +       /*
> +        * Unbreak the virtqueues to allow to add buffers before setting the vdev status
> +        * to ready
> +        */
> +       __virtio_unbreak_device(vdev);
> +
>
>         /* set up the receive buffers */
>         for (i = 0; i < vrp->num_bufs / 2; i++) {
>                 struct scatterlist sg;
>                 void *cpu_addr = vrp->rbufs + i * vrp->buf_size;

This will indeed fix the problem.  On the flip side the kernel
documentation for __virtio_unbreak_device() puzzles me...
It clearly states that it should be used for probing and restoring but
_not_ directly by the driver.  Function rpmsg_probe() is part of
probing but also the entry point to a driver.

Michael and virtualisation folks, is this the right way to move forward?

>
> Regards,
> Arnaud
>
> >
> > Thanks,
> > Mathieu
> >
> >>      /* set up the receive buffers */
> >>      for (i = 0; i < vrp->num_bufs / 2; i++) {
> >>              struct scatterlist sg;
> >> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>       */
> >>      notify = virtqueue_kick_prepare(vrp->rvq);
> >>
> >> -    /* From this point on, we can notify and get callbacks. */
> >> -    virtio_device_ready(vdev);
> >> -
> >>      /* tell the remote processor it can start sending messages */
> >>      /*
> >>       * this might be concurrent with callbacks, but we are only
> >> --
> >> 2.34.1
> >>
