Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D22FF155
	for <linux-remoteproc@vger.kernel.org>; Mon, 10 Nov 2025 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762810094; cv=none; b=L88fSDjeNOW3i6GCACwT8d5JXujIvBGD03ndqOCMhBd3gB9JO5LHkWA9wXcMr35B+7bI8LCbCNFziDIyrjUDQX42kLw9RDTSVriWnutn2RHW2BMNpqsDAuIsUQM8A8IoGH1891ABavJqfi4QW31RWGACD+F0wkm825B8sspxTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762810094; c=relaxed/simple;
	bh=OSaH+McOr2L8xcpGMxNpaiZKlcSSRSCrpm48fffCKXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pr5cnm6BCNYAm2WLa/JbjtI+9hS3zD07DrosCzIz4kCZ75bsrMKKkwYBrKmhN+gpwZner0gBVI/1EzhIr29oMmpEfbFiS9J6ia1APvKgIvHPyfxVPsPdqR1pKo6kk/PGHhvnT1jnPtvmHWjH/xZpFwFrEdtbrEF9pyA/36azBN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA9i6dFk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA9i6dFk"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b727f452fffso31341666b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Nov 2025 13:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762810091; x=1763414891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BRK0/ElyJxodr09TH+EI7MtSKFsQov1z9RRqS6Fo3XM=;
        b=ZA9i6dFkcAMw7/FZemOVcRaE0jgnJs9UasQAQ1rbomHot8KpRXLLNV9ostIEf+tvhD
         leOJrLQ3EtZ1uB0RP6J8e4twDzE8ARbQfNnvDUkbpG/aZcvYbsEgRvfjOdWfhdeONQ66
         SZtQuz+rKyzNLNcts/0rewXEyAmW3HbC30Gxrc20A86b8EAY3y8sP76xd55HdNq2gzLm
         fVY4U4KD5wLYMifvTB/72SFC9xv9+aNcKRYMI/KlWZRmgkIh3PrlFxGsAWWLL9d15qrG
         la70UXQag396ouBdsWOjtLaf5/gICH0ymsScpvDGOGyfyrTfrvTrRCF7cIcy5QFLZMPn
         ucng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762810091; x=1763414891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRK0/ElyJxodr09TH+EI7MtSKFsQov1z9RRqS6Fo3XM=;
        b=Z1IpHN2ECz9h9tql4z6+2zeOiP5YDLStp+KMYEgTx+e8iv7onXnxaoSZ/roJFhkKRW
         eGapqUdO7YXGAIVTNgA987+MDcrAjAfDWCPxKzQBxE9txY7Y5jGMaeUPLLx1ys6XGHCo
         AhuznDV1gTkR4wsR6nufseIsYQX7NtL+/k7vQLpR5ljPhkMGnErsDXdQV/MwFlLoem6T
         GJMqmAfp5ewupbNzeM1etDrphRmt+bjzuIyCC6FdrjDmpNhQS2zGSKh8S9E0jJIMfrJO
         IUUrFi+5cKaP9ZsP4Csfk/Halbk0pSKecU+39fXI6trzgTdRU/NEPELMNSzhGTyqypue
         2noA==
X-Forwarded-Encrypted: i=1; AJvYcCXjdMPfdua9/xfmQl5w+NWFjDn3i2j1378NtLcBcQLJHZbvaJCt6o960+vMFEs586yUwnksrL93RPVhFRJmdcqw@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+UsfEOU5Wc7BrnOTPsAu1fWTnquqbFgN3jGIm7NMbvG/K7eT
	hiScuEkvF7ZBUARYcYb8Zap878YKCXMG8O5zmmYah4Lb9afIab7yhLPWVbdEsgzgdiZYtpdPO1z
	Z10m7JIHovhD/YsQCuB0DXVjHBEpqGKc=
X-Gm-Gg: ASbGnctqGdY6TS02p4hPFDXorj2QEJHwnxLZJ0EROBtlvSkzB7js5GPZoY4AhhSVk+o
	PvRLJdT+6ts1OikQl70klKisejBup5iV3DpWCuzX1MiKd++z5s34HVJ+qjWGpq4Jex5hc8bfBe1
	PA9s3bYYZHqrEjcv1gwV6H6maVPpJCEw/KB9MhlGccEAg8NFz4bYixC1oMqZj7TIfgnDEogM5LE
	B+Kdf3FoGagoNUESF5Z+eH28QXhOQp7lBtY5owE+BToEjS824Xd+8rD9k1xNo/ni9cf/aQxIzxc
	Pr2m+nvdKdYkRl2AWc7IDE8Vg4O/4rUPnkr+ncv0G7cohw==
X-Google-Smtp-Source: AGHT+IGrsGvd3mGdJH902Pjq59RuEdUSIqO1LriIyPINn9OT+i0hcZFj+QRDKdsBslEV7XfXMw6qJEmT6gMcMY7lUUE=
X-Received: by 2002:a17:906:4fce:b0:b72:dac0:2f32 with SMTP id
 a640c23a62f3a-b731d46bfe2mr87270466b.28.1762810090659; Mon, 10 Nov 2025
 13:28:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
 <7acb046d-5c16-46c1-a034-a128f66e6502@oss.qualcomm.com> <CAEg67GkKoM6L6Cz63SY_7nd_XdTMC6wTCWj5W5yR43oNf4AsOg@mail.gmail.com>
 <aQT4YwKakKDAxBMT@p14s> <CAEg67Gnczrbo4pGmcJ58kN0ts_t8rTcxbQhuZJuMPgwcc3-YJQ@mail.gmail.com>
 <CANLsYkyfGFiAY3vSK4sSs+TxQRAYLE9VvgxxwiF2iv3QBTF5sA@mail.gmail.com>
In-Reply-To: <CANLsYkyfGFiAY3vSK4sSs+TxQRAYLE9VvgxxwiF2iv3QBTF5sA@mail.gmail.com>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 11 Nov 2025 08:27:58 +1100
X-Gm-Features: AWmQ_blP6fCAnc-HAhqz3qIHn0cpaW4HHEiBfEIfav_LFvm0i4Bw4Oeth1zREPA
Message-ID: <CAEg67GmtTWDT_H_erSSEwm8KpkitzWxB-ZGc2ChaWTMs=9NnZg@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Nov 2025 at 02:28, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Apologies for the late reply - I have been travelling.
>
> On Fri, 31 Oct 2025 at 15:28, Patrick Oppenlander
> <patrick.oppenlander@gmail.com> wrote:
> >
> > On Sat, 1 Nov 2025 at 04:56, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Thu, Oct 23, 2025 at 08:59:22AM +1100, Patrick Oppenlander wrote:
> > > > On Thu, 23 Oct 2025 at 00:35, Zhongqiu Han
> > > > <zhongqiu.han@oss.qualcomm.com> wrote:
> > > > >
> > > > > On 10/22/2025 11:28 AM, patrick.oppenlander@gmail.com wrote:
> > > > > > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > > > > >
> > > > > > Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> > > > > > generate EPOLLIN events but no EPOLLOUT events.
> > > > > >
> > > > > > Unfortunately, poll support means that we can no longer disable
> > > > > > tx-complete interrupts as there is no way to know whether a poller is
> > > > > > waiting in sendq, so we always need notifications.
> > > > > >
> > > > > > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > > > > > ---
> > > > > >   drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
> > > > > >   1 file changed, 32 insertions(+), 69 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > > index 484890b4a6a74..79d983055b4d6 100644
> > > > > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > > @@ -41,13 +41,12 @@
> > > > > >    * @buf_size:   size of one rx or tx buffer
> > > > > >    * @last_sbuf:      index of last tx buffer used
> > > > > >    * @bufs_dma:       dma base addr of the buffers
> > > > > > - * @tx_lock: protects svq, sbufs and sleepers, to allow concurrent senders.
> > > > > > + * @tx_lock: protects svq and sbufs, to allow concurrent senders.
> > > > > >    *          sending a message might require waking up a dozing remote
> > > > > >    *          processor, which involves sleeping, hence the mutex.
> > > > > >    * @endpoints:      idr of local endpoints, allows fast retrieval
> > > > > >    * @endpoints_lock: lock of the endpoints set
> > > > > >    * @sendq:  wait queue of sending contexts waiting for a tx buffers
> > > > > > - * @sleepers:        number of senders that are waiting for a tx buffer
> > > > > >    *
> > > > > >    * This structure stores the rpmsg state of a given virtio remote processor
> > > > > >    * device (there might be several virtio proc devices for each physical
> > > > > > @@ -65,7 +64,6 @@ struct virtproc_info {
> > > > > >       struct idr endpoints;
> > > > > >       struct mutex endpoints_lock;
> > > > > >       wait_queue_head_t sendq;
> > > > > > -     atomic_t sleepers;
> > > > > >   };
> > > > > >
> > > > > >   /* The feature bitmap for virtio rpmsg */
> > > > > > @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> > > > > >   static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> > > > > >   static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> > > > > >                                 int len, u32 dst);
> > > > > > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > > > > +                               poll_table *wait);
> > > > > >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> > > > > >   static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
> > > > > >                                                  struct rpmsg_channel_info *chinfo);
> > > > > > @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
> > > > > >       .sendto = virtio_rpmsg_sendto,
> > > > > >       .trysend = virtio_rpmsg_trysend,
> > > > > >       .trysendto = virtio_rpmsg_trysendto,
> > > > > > +     .poll = virtio_rpmsg_poll,
> > > > > >       .get_mtu = virtio_rpmsg_get_mtu,
> > > > > >   };
> > > > > >
> > > > > > @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> > > > > >       unsigned int len;
> > > > > >       void *ret;
> > > > > >
> > > > > > -     /* support multiple concurrent senders */
> > > > > >       mutex_lock(&vrp->tx_lock);
> > > > > >
> > > > > >       /*
> > > > > > @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> > > > > >       return ret;
> > > > > >   }
> > > > > >
> > > > > > -/**
> > > > > > - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> > > > > > - * @vrp: virtual remote processor state
> > > > > > - *
> > > > > > - * This function is called before a sender is blocked, waiting for
> > > > > > - * a tx buffer to become available.
> > > > > > - *
> > > > > > - * If we already have blocking senders, this function merely increases
> > > > > > - * the "sleepers" reference count, and exits.
> > > > > > - *
> > > > > > - * Otherwise, if this is the first sender to block, we also enable
> > > > > > - * virtio's tx callbacks, so we'd be immediately notified when a tx
> > > > > > - * buffer is consumed (we rely on virtio's tx callback in order
> > > > > > - * to wake up sleeping senders as soon as a tx buffer is used by the
> > > > > > - * remote processor).
> > > > > > - */
> > > > > > -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> > > > > > -{
> > > > > > -     /* support multiple concurrent senders */
> > > > > > -     mutex_lock(&vrp->tx_lock);
> > > > > > -
> > > > > > -     /* are we the first sleeping context waiting for tx buffers ? */
> > > > > > -     if (atomic_inc_return(&vrp->sleepers) == 1)
> > > > > > -             /* enable "tx-complete" interrupts before dozing off */
> > > > > > -             virtqueue_enable_cb(vrp->svq);
> > > > > > -
> > > > > > -     mutex_unlock(&vrp->tx_lock);
> > > > > > -}
> > > > > > -
> > > > > > -/**
> > > > > > - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> > > > > > - * @vrp: virtual remote processor state
> > > > > > - *
> > > > > > - * This function is called after a sender, that waited for a tx buffer
> > > > > > - * to become available, is unblocked.
> > > > > > - *
> > > > > > - * If we still have blocking senders, this function merely decreases
> > > > > > - * the "sleepers" reference count, and exits.
> > > > > > - *
> > > > > > - * Otherwise, if there are no more blocking senders, we also disable
> > > > > > - * virtio's tx callbacks, to avoid the overhead incurred with handling
> > > > > > - * those (now redundant) interrupts.
> > > > > > - */
> > > > > > -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> > > > > > -{
> > > > > > -     /* support multiple concurrent senders */
> > > > > > -     mutex_lock(&vrp->tx_lock);
> > > > > > -
> > > > > > -     /* are we the last sleeping context waiting for tx buffers ? */
> > > > > > -     if (atomic_dec_and_test(&vrp->sleepers))
> > > > > > -             /* disable "tx-complete" interrupts */
> > > > > > -             virtqueue_disable_cb(vrp->svq);
> > > > > > -
> > > > > > -     mutex_unlock(&vrp->tx_lock);
> > > > > > -}
> > > > > > -
> > > > >
> > > > > Hi Patrick,
> > > > >
> > > > > I'd like to go over a few aspects of this patch, please feel free to
> > > > > correct me if there is any misunderstanding.
> > > >
> > > > Hi, thanks for the review, I'll address your comments below.
> > > >
> > > > > >   /**
> > > > > >    * rpmsg_send_offchannel_raw() - send a message across to the remote processor
> > > > > >    * @rpdev: the rpmsg channel
> > > > > > @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > > > > >
> > > > > >       /* no free buffer ? wait for one (but bail after 15 seconds) */
> > > > > >       while (!msg) {
> > > > > > -             /* enable "tx-complete" interrupts, if not already enabled */
> > > > > > -             rpmsg_upref_sleepers(vrp);
> > > > > > -
> > > > > >               /*
> > > > > >                * sleep until a free buffer is available or 15 secs elapse.
> > > > > >                * the timeout period is not configurable because there's
> > > > > > @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > > > > >                                       (msg = get_a_tx_buf(vrp)),
> > > > > >                                       msecs_to_jiffies(15000));
> > > > > >
> > > > > > -             /* disable "tx-complete" interrupts if we're the last sleeper */
> > > > > > -             rpmsg_downref_sleepers(vrp);
> > > > >
> > > > > 1.The original code dynamically disabled tx-complete interrupts during
> > > > > normal operation and only enabled them when waiting for buffers. This
> > > > > patch removes all virtqueue_disable_cb() calls, meaning interrupts are
> > > > > always enabled. For high-frequency messaging, could this significantly
> > > > > increase interrupt overhead, even irq storm? May I know do you have
> > > > > performance data showing the interrupt frequency increase?
> > > >
> > > > I mentioned this in the commit message.
> > > >
> > > > The problem is that the poller can be removed at any time by
> > > > poll_freewait, and there is no notification of this happening. The
> > > > simplest solution to this is what I have proposed in this patch, i.e.
> > > > always leave callbacks enabled.
> > > >
> > > > There is an alternate solution, but it comes with a possibly
> > > > significant caveat. We could add a check along the lines of:
> > > >
> > > > if wq_has_sleeper(vrp->sendq) {
> > > >         virtqueue_disable_cb(vrp->svq);
> > > > }
> > > >
> > > > But this is not guaranteed to work as expected as poll_freewait can
> > > > remove the poller at any time (i.e. after we've performed this check),
> > > > meaning that the callbacks will sometimes remain enabled regardless.
> > > >
> > > > In terms of performance, I have not measured a difference in my workload.
> > > >
> > > > > > -
> > > > > >               /* timeout ? */
> > > > > >               if (!err) {
> > > > > >                       dev_err(dev, "timeout waiting for a tx buffer\n");
> > > > > > @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> > > > > >       return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
> > > > > >   }
> > > > > >
> > > > > > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > > > > +                               poll_table *wait)
> > > > > > +{
> > > > > > +     struct rpmsg_device *rpdev = ept->rpdev;
> > > > > > +     struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > > > > > +     struct virtproc_info *vrp = vch->vrp;
> > > > > > +     __poll_t mask = 0;
> > > > > > +
> > > > > > +     poll_wait(filp, &vrp->sendq, wait);
> > > > > > +
> > > > > > +     /* support multiple concurrent senders */
> > > > > > +     mutex_lock(&vrp->tx_lock);
> > > > > > +
> > > > > > +     /*
> > > > > > +      * check for a free buffer, either:
> > > > > > +      * - we haven't used all of the available transmit buffers (half of the
> > > > > > +      *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> > > > > > +      * - we ask the virtqueue if there's a buffer available
> > > > > > +      */
> > > > > > +     if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> > > > > > +         !virtqueue_enable_cb(vrp->svq))
> > > > > > +             mask |= EPOLLOUT;
> > > > > > +
> > > > >
> > > > > 2.The virtio_rpmsg_poll() calls virtqueue_enable_cb() but seems never
> > > > > disables it. Once any process polls the device, interrupts remain
> > > > > permanently enabled even after poll completes?
> > > >
> > > > virtio_rpmsg_poll returns immediately after registering the poller and
> > > > checking whether there are any free buffers. poll_wait does not block,
> > > > so there's no way to know that poll has completed.
> > > >
> > > > With this change callbacks are always enabled (they're enabled by the
> > > > virtqueue initialisation if a callback is registered). Calling
> > > > virtqueue_enable_cb here doesn't actually enable callbacks. We call it
> > > > because its return value tells us whether there's any pending buffers
> > > > in the queue. I'm not aware of another virtqueue API which can perform
> > > > this check.
> > >
> > > Please add "Calling virtqueue ... in the queue." to the in-line comment you
> > > already have.
> > >
> > > I have pondered over this patch long and hard.  As Zhongqiu Han pointed out,
> > > there is potential for unwanted side effect but as you pointed out, EPOLLOUT is
> > > currently not supported.  We currently sit at rc3.  I will highlight your patch
> > > in the next OpenAMP community meeting, asking people to test it in their
> > > environment.  From there it could be added to my queue for 6.19-rc1, under the
> > > reserve that if someone complains, it will be backed out and you will need to
> > > find a different approach.
> >
> > In terms of performance I proposed disabling callbacks if sendq has no
> > sleepers in an earlier reply. This will work reliably for existing use
> > cases (where one isn't using poll), and will have equivalent
> > performance to the current implementation. The only time it's possible
> > to leave callbacks enabled and potentially cause a performance
> > regression is when polling, and the poller is asynchronously removed
> > from the queue.
> >
> > Would you be interested in a v2 which disables callbacks based on
> > checking sendq?
> >
>
> I would like to avoid this kind of 2-mode way of working - it adds
> complexity and isn't applicable all the time.  I suggest we stick with
> the current implementation and see what kind of feedback we get.

Agreed -- the current implementation is definitely the simplest way to
solve the problem.

I did experiment with some patches which use the presence of a sleeper
in sendq to dynamically disable callbacks. It's definitely harder to
reason about and much harder to test. I'll keep them around in case
the performance regression is unacceptable.

I look forward to the feedback.

Thanks,
Patrick

> > > Thanks,
> > > Mathieu
> >
> > Patrick
> >
> > > >
> > > > We could propose a new virtqueue_buf_pending() or something along
> > > > those lines if necessary, but, looking at the implementation of
> > > > virtqueue_enable_cb(), we'd effectively be causing a bunch of code
> > > > churn to avoid a couple of if tests. Given that we'd be the only
> > > > consumer of this new API it didn't seem worth it to me?
> > > >
> > > > Kind regards,
> > > >
> > > > Patrick
> > > >
> > > > > > +     mutex_unlock(&vrp->tx_lock);
> > > > > > +
> > > > > > +     return mask;
> > > > > > +}
> > > > > > +
> > > > > >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> > > > > >   {
> > > > > >       struct rpmsg_device *rpdev = ept->rpdev;
> > > > > > @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > > > > >               WARN_ON(err); /* sanity check; this can't really happen */
> > > > > >       }
> > > > > >
> > > > > > -     /* suppress "tx-complete" interrupts */
> > > > > > -     virtqueue_disable_cb(vrp->svq);
> > > > > > -
> > > > > >       vdev->priv = vrp;
> > > > > >
> > > > > >       rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> > > > >
> > > > >
> > > > > --
> > > > > Thx and BRs,
> > > > > Zhongqiu Han
