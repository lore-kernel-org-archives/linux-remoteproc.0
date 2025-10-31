Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E822D78A
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Oct 2025 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761946134; cv=none; b=MpnH5n08BHSpC6G2NsCjJRclp+gCL+1yFuHUd7S51jQzgMw+WLzh9pvGYOR1JGr43ejnmMptnEENyR4BR9Tgm2qNSJnpqmNjWGlmt61vE5cyHPfHKSpgifE5bAGU50S/vZ+RKBi6Av7V9a6YidKyWFBfcoHiblerzZG4LRGjBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761946134; c=relaxed/simple;
	bh=0aRyIWCJbJ3q4HyMbj8OY7rgMcZjK/knj1vR8HC4PQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0xRuJmZWcqqCEDIAFk2K4uRk5iZ1Al5lCeBooUL2mRBmDaYdfHcBu95QvIv9q+X42BuCvK+RtG1oOjRAqEjrn51Oh0cw38eLNvX/TKYY2E3k0ZI52ns7bm34ZgzK+6C4c66aL3UsTNRkXxR5GWQs0hVS2KkRFHwkhM1brpE5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfhdMv2T; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfhdMv2T"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c4f1e7243so4176749a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Oct 2025 14:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761946131; x=1762550931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPGvsnusNzecv3tNQr5bjkvrLgO8v9frZxzpc9cslmQ=;
        b=mfhdMv2TLnjcCe1JgmvKrAzvFMY+RIJd0H+HIU8Sj1HVXpxAluuMYsJRphO3kTb/S3
         WHG0stQbqHkncUoAZ09BPogWNiZPx8PY4ORxFY5PIZzTH+UHKNEivnnj7SQi0w+ak+mP
         rDVuyIXPmX6QwhPiqp1NjCP3pgR7T1SmCDX5JK5WHVTXqin3UibtPUA0Nom2+u/kMR/1
         GIl+jFASR5hTkfYuzo4DpsdTlLyABenORKlmMQmQeudbnFRS5Kw0E7PFTLnEJ9Pk10kq
         4oaV0Nz/gTzbRsD9hTxEbOT27l4tFRA2t9myYJ9tCGzMwZsfJWAeA5TbWFKxQleYcDyw
         kLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761946131; x=1762550931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPGvsnusNzecv3tNQr5bjkvrLgO8v9frZxzpc9cslmQ=;
        b=DcTjvzktnuLtRej9kt9TcEQ9BeBCkxJWsd9nvy1bI+pZkE/iHMLscjwWA4AX5fSqh6
         Vp5a2vhePYJKkn9GRIEv/4DA4BwIr0ktsemXm0Pexk09T5/A38pILytNsX7cRidtgt1G
         ZTLiZrOGD2ifJW7+4E9Z8MtJa2/OeSvDbKG3otP2BqItyaOqPbqtwlPzogBiiGMPrZvN
         4kjTI2H6GQmDJEvWcPy+AeH07yGyZYH+9DpvNYl0gjBvgzu9sRK0HO1DMawJmgkaXp2z
         DGWiaEA2SyMeanXGpRSeBC1jxCsoAaEco03Gmx5j9qZoXNPBRlUNq+uk72nmWuoRSCqs
         6OdA==
X-Forwarded-Encrypted: i=1; AJvYcCUFZxV8G1cAHE1DhuGUBioUVnI+LB/Vy77JBUnrvxxtJgRbgIi+na8TjhIXs4hzLXRxVl5xqTWPh3ylqFOSHa19@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hKgFZVasgcoH3oAROPimEIj8Cv44UkaPdKObAqRI48z4Lfak
	pUcdoN+AniyO+S164tkjBj+CjQoE3EB6ZuqlsU5R4f35Wb1WAkVsZNfXLfdtQgAs9VMIv62QB4b
	QfR+4pY6FJEf2Q0vBaLSbLy2qXKF51qSdpGjM
X-Gm-Gg: ASbGncuIZYGPTNOJO4pdba5m3K6u5VvPKct8eEVDgnUyvfI7++EGLE0Y4HwxG2W8JtA
	GO9lMk0wZlcSASOLdU07awV8ZAAExWHD4UwpELmfREKFJALPfGJTZKDAu16kEvWS8apBBzxG47n
	jaRr3Kp/lAVcEEYkAO/IrOgaIbGZA5c4xiVsnnpAc2eyCqWpFWgV6mwFtOkfzhy7QecyHUcc/TY
	OLwTFDqjQT3z2Oj3hYFidoEskBJAgQcUBxGrh38BFjtj3kL4JYWvc60E8/zlThm6tTR20XzBjOS
	NoTJTZ4I3SAyvcvwAZ6GTQQZtkwe56mUWd1AjfkhFdOLGhgGa2MU45YqAaX9EPkHVvzy
X-Google-Smtp-Source: AGHT+IGrrcYejC8bpDavHeatBwkz8rncO4E37A3iUNrz2BqTChdqCqOkftBWRYbYkSR+FMlqT1xRKaMuDsMPUIKAxZE=
X-Received: by 2002:a05:6402:26cd:b0:63c:2a2b:2517 with SMTP id
 4fb4d7f45d1cf-64077044c16mr4107982a12.36.1761946130343; Fri, 31 Oct 2025
 14:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
 <7acb046d-5c16-46c1-a034-a128f66e6502@oss.qualcomm.com> <CAEg67GkKoM6L6Cz63SY_7nd_XdTMC6wTCWj5W5yR43oNf4AsOg@mail.gmail.com>
 <aQT4YwKakKDAxBMT@p14s>
In-Reply-To: <aQT4YwKakKDAxBMT@p14s>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Sat, 1 Nov 2025 08:28:39 +1100
X-Gm-Features: AWmQ_bnjU2t0W3hLPxEoqgP8iR0kF1dtlLfypv_gT8Xm6hjgVPLcKVwPXSQz1js
Message-ID: <CAEg67Gnczrbo4pGmcJ58kN0ts_t8rTcxbQhuZJuMPgwcc3-YJQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 04:56, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> On Thu, Oct 23, 2025 at 08:59:22AM +1100, Patrick Oppenlander wrote:
> > On Thu, 23 Oct 2025 at 00:35, Zhongqiu Han
> > <zhongqiu.han@oss.qualcomm.com> wrote:
> > >
> > > On 10/22/2025 11:28 AM, patrick.oppenlander@gmail.com wrote:
> > > > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > > >
> > > > Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> > > > generate EPOLLIN events but no EPOLLOUT events.
> > > >
> > > > Unfortunately, poll support means that we can no longer disable
> > > > tx-complete interrupts as there is no way to know whether a poller is
> > > > waiting in sendq, so we always need notifications.
> > > >
> > > > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > > > ---
> > > >   drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
> > > >   1 file changed, 32 insertions(+), 69 deletions(-)
> > > >
> > > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > index 484890b4a6a74..79d983055b4d6 100644
> > > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > @@ -41,13 +41,12 @@
> > > >    * @buf_size:   size of one rx or tx buffer
> > > >    * @last_sbuf:      index of last tx buffer used
> > > >    * @bufs_dma:       dma base addr of the buffers
> > > > - * @tx_lock: protects svq, sbufs and sleepers, to allow concurrent senders.
> > > > + * @tx_lock: protects svq and sbufs, to allow concurrent senders.
> > > >    *          sending a message might require waking up a dozing remote
> > > >    *          processor, which involves sleeping, hence the mutex.
> > > >    * @endpoints:      idr of local endpoints, allows fast retrieval
> > > >    * @endpoints_lock: lock of the endpoints set
> > > >    * @sendq:  wait queue of sending contexts waiting for a tx buffers
> > > > - * @sleepers:        number of senders that are waiting for a tx buffer
> > > >    *
> > > >    * This structure stores the rpmsg state of a given virtio remote processor
> > > >    * device (there might be several virtio proc devices for each physical
> > > > @@ -65,7 +64,6 @@ struct virtproc_info {
> > > >       struct idr endpoints;
> > > >       struct mutex endpoints_lock;
> > > >       wait_queue_head_t sendq;
> > > > -     atomic_t sleepers;
> > > >   };
> > > >
> > > >   /* The feature bitmap for virtio rpmsg */
> > > > @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> > > >   static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> > > >   static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> > > >                                 int len, u32 dst);
> > > > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > > +                               poll_table *wait);
> > > >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> > > >   static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
> > > >                                                  struct rpmsg_channel_info *chinfo);
> > > > @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
> > > >       .sendto = virtio_rpmsg_sendto,
> > > >       .trysend = virtio_rpmsg_trysend,
> > > >       .trysendto = virtio_rpmsg_trysendto,
> > > > +     .poll = virtio_rpmsg_poll,
> > > >       .get_mtu = virtio_rpmsg_get_mtu,
> > > >   };
> > > >
> > > > @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> > > >       unsigned int len;
> > > >       void *ret;
> > > >
> > > > -     /* support multiple concurrent senders */
> > > >       mutex_lock(&vrp->tx_lock);
> > > >
> > > >       /*
> > > > @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> > > >       return ret;
> > > >   }
> > > >
> > > > -/**
> > > > - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> > > > - * @vrp: virtual remote processor state
> > > > - *
> > > > - * This function is called before a sender is blocked, waiting for
> > > > - * a tx buffer to become available.
> > > > - *
> > > > - * If we already have blocking senders, this function merely increases
> > > > - * the "sleepers" reference count, and exits.
> > > > - *
> > > > - * Otherwise, if this is the first sender to block, we also enable
> > > > - * virtio's tx callbacks, so we'd be immediately notified when a tx
> > > > - * buffer is consumed (we rely on virtio's tx callback in order
> > > > - * to wake up sleeping senders as soon as a tx buffer is used by the
> > > > - * remote processor).
> > > > - */
> > > > -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> > > > -{
> > > > -     /* support multiple concurrent senders */
> > > > -     mutex_lock(&vrp->tx_lock);
> > > > -
> > > > -     /* are we the first sleeping context waiting for tx buffers ? */
> > > > -     if (atomic_inc_return(&vrp->sleepers) == 1)
> > > > -             /* enable "tx-complete" interrupts before dozing off */
> > > > -             virtqueue_enable_cb(vrp->svq);
> > > > -
> > > > -     mutex_unlock(&vrp->tx_lock);
> > > > -}
> > > > -
> > > > -/**
> > > > - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> > > > - * @vrp: virtual remote processor state
> > > > - *
> > > > - * This function is called after a sender, that waited for a tx buffer
> > > > - * to become available, is unblocked.
> > > > - *
> > > > - * If we still have blocking senders, this function merely decreases
> > > > - * the "sleepers" reference count, and exits.
> > > > - *
> > > > - * Otherwise, if there are no more blocking senders, we also disable
> > > > - * virtio's tx callbacks, to avoid the overhead incurred with handling
> > > > - * those (now redundant) interrupts.
> > > > - */
> > > > -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> > > > -{
> > > > -     /* support multiple concurrent senders */
> > > > -     mutex_lock(&vrp->tx_lock);
> > > > -
> > > > -     /* are we the last sleeping context waiting for tx buffers ? */
> > > > -     if (atomic_dec_and_test(&vrp->sleepers))
> > > > -             /* disable "tx-complete" interrupts */
> > > > -             virtqueue_disable_cb(vrp->svq);
> > > > -
> > > > -     mutex_unlock(&vrp->tx_lock);
> > > > -}
> > > > -
> > >
> > > Hi Patrick,
> > >
> > > I'd like to go over a few aspects of this patch, please feel free to
> > > correct me if there is any misunderstanding.
> >
> > Hi, thanks for the review, I'll address your comments below.
> >
> > > >   /**
> > > >    * rpmsg_send_offchannel_raw() - send a message across to the remote processor
> > > >    * @rpdev: the rpmsg channel
> > > > @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > > >
> > > >       /* no free buffer ? wait for one (but bail after 15 seconds) */
> > > >       while (!msg) {
> > > > -             /* enable "tx-complete" interrupts, if not already enabled */
> > > > -             rpmsg_upref_sleepers(vrp);
> > > > -
> > > >               /*
> > > >                * sleep until a free buffer is available or 15 secs elapse.
> > > >                * the timeout period is not configurable because there's
> > > > @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > > >                                       (msg = get_a_tx_buf(vrp)),
> > > >                                       msecs_to_jiffies(15000));
> > > >
> > > > -             /* disable "tx-complete" interrupts if we're the last sleeper */
> > > > -             rpmsg_downref_sleepers(vrp);
> > >
> > > 1.The original code dynamically disabled tx-complete interrupts during
> > > normal operation and only enabled them when waiting for buffers. This
> > > patch removes all virtqueue_disable_cb() calls, meaning interrupts are
> > > always enabled. For high-frequency messaging, could this significantly
> > > increase interrupt overhead, even irq storm? May I know do you have
> > > performance data showing the interrupt frequency increase?
> >
> > I mentioned this in the commit message.
> >
> > The problem is that the poller can be removed at any time by
> > poll_freewait, and there is no notification of this happening. The
> > simplest solution to this is what I have proposed in this patch, i.e.
> > always leave callbacks enabled.
> >
> > There is an alternate solution, but it comes with a possibly
> > significant caveat. We could add a check along the lines of:
> >
> > if wq_has_sleeper(vrp->sendq) {
> >         virtqueue_disable_cb(vrp->svq);
> > }
> >
> > But this is not guaranteed to work as expected as poll_freewait can
> > remove the poller at any time (i.e. after we've performed this check),
> > meaning that the callbacks will sometimes remain enabled regardless.
> >
> > In terms of performance, I have not measured a difference in my workload.
> >
> > > > -
> > > >               /* timeout ? */
> > > >               if (!err) {
> > > >                       dev_err(dev, "timeout waiting for a tx buffer\n");
> > > > @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> > > >       return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
> > > >   }
> > > >
> > > > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > > +                               poll_table *wait)
> > > > +{
> > > > +     struct rpmsg_device *rpdev = ept->rpdev;
> > > > +     struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > > > +     struct virtproc_info *vrp = vch->vrp;
> > > > +     __poll_t mask = 0;
> > > > +
> > > > +     poll_wait(filp, &vrp->sendq, wait);
> > > > +
> > > > +     /* support multiple concurrent senders */
> > > > +     mutex_lock(&vrp->tx_lock);
> > > > +
> > > > +     /*
> > > > +      * check for a free buffer, either:
> > > > +      * - we haven't used all of the available transmit buffers (half of the
> > > > +      *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> > > > +      * - we ask the virtqueue if there's a buffer available
> > > > +      */
> > > > +     if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> > > > +         !virtqueue_enable_cb(vrp->svq))
> > > > +             mask |= EPOLLOUT;
> > > > +
> > >
> > > 2.The virtio_rpmsg_poll() calls virtqueue_enable_cb() but seems never
> > > disables it. Once any process polls the device, interrupts remain
> > > permanently enabled even after poll completes?
> >
> > virtio_rpmsg_poll returns immediately after registering the poller and
> > checking whether there are any free buffers. poll_wait does not block,
> > so there's no way to know that poll has completed.
> >
> > With this change callbacks are always enabled (they're enabled by the
> > virtqueue initialisation if a callback is registered). Calling
> > virtqueue_enable_cb here doesn't actually enable callbacks. We call it
> > because its return value tells us whether there's any pending buffers
> > in the queue. I'm not aware of another virtqueue API which can perform
> > this check.
>
> Please add "Calling virtqueue ... in the queue." to the in-line comment you
> already have.
>
> I have pondered over this patch long and hard.  As Zhongqiu Han pointed out,
> there is potential for unwanted side effect but as you pointed out, EPOLLOUT is
> currently not supported.  We currently sit at rc3.  I will highlight your patch
> in the next OpenAMP community meeting, asking people to test it in their
> environment.  From there it could be added to my queue for 6.19-rc1, under the
> reserve that if someone complains, it will be backed out and you will need to
> find a different approach.

In terms of performance I proposed disabling callbacks if sendq has no
sleepers in an earlier reply. This will work reliably for existing use
cases (where one isn't using poll), and will have equivalent
performance to the current implementation. The only time it's possible
to leave callbacks enabled and potentially cause a performance
regression is when polling, and the poller is asynchronously removed
from the queue.

Would you be interested in a v2 which disables callbacks based on
checking sendq?

> Thanks,
> Mathieu

Patrick

> >
> > We could propose a new virtqueue_buf_pending() or something along
> > those lines if necessary, but, looking at the implementation of
> > virtqueue_enable_cb(), we'd effectively be causing a bunch of code
> > churn to avoid a couple of if tests. Given that we'd be the only
> > consumer of this new API it didn't seem worth it to me?
> >
> > Kind regards,
> >
> > Patrick
> >
> > > > +     mutex_unlock(&vrp->tx_lock);
> > > > +
> > > > +     return mask;
> > > > +}
> > > > +
> > > >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> > > >   {
> > > >       struct rpmsg_device *rpdev = ept->rpdev;
> > > > @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > > >               WARN_ON(err); /* sanity check; this can't really happen */
> > > >       }
> > > >
> > > > -     /* suppress "tx-complete" interrupts */
> > > > -     virtqueue_disable_cb(vrp->svq);
> > > > -
> > > >       vdev->priv = vrp;
> > > >
> > > >       rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> > >
> > >
> > > --
> > > Thx and BRs,
> > > Zhongqiu Han
