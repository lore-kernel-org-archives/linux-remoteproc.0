Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E6221721
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Oct 2025 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761684872; cv=none; b=spwsL0f30gpsNOgtkjP+eUdLDUbKQrm3o7bDq82zxY1uQFZvz+xx7pnZIo6eV+Dqn32SkvrPltjOhCT5yEQzJQXzha+DRtKTszGi6jRE2YSQjHD/ZBfvkOsuIHow01naA4k1XK1Pl1ElbAqFE3yydUZhycLbQFbW1MuzZWjK+gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761684872; c=relaxed/simple;
	bh=ptr3Lrke2cD6zaJDjByj/CLfsCmKWKjY+kxVbGdNHC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qN+PfFHu2DVG/UB8XmmDVJMPKUauu12k/pdShPTJ2Sz7Yt3f7/89WcE+qDYeS9iiQuCKGIoTl3s5YANmxv3EkI9jNpmPPwUC5QE6FBkY8YvY26WZr2zYYQkFmYvTqzsguHZDu3Gpv+n3dvqGTPWZZKqu1lOleEAUqo+4ckEzKVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv9GyIUp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv9GyIUp"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so1072830166b.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Oct 2025 13:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761684868; x=1762289668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DY1FGAllOUePWCDrAJ+BXKr6PDxjhxaK3nci02FUg0A=;
        b=Nv9GyIUpCzhT+ay26tIeDFMmsVFsv4Fb3kKb2VZJEADLahqK3EBeTF5OxAItGnhRlS
         kHXIahWnnmM7HAQW3YxikTnuGkgXtw1DAAaDi0IufFKD0TgWxO2X4snbev4nNYHabmhB
         WpwBYGUK/+A8Q/3qZ056bvsTnzNtlv/pUPWM1QcFWyqGx8b/qbdbbN+mP07QQ30/rdt4
         9f3LfEiGdbTcS8FClnrkjvstTtq8Lto8dVnjAeENEJjPdYQAQAlP93cEiI+A8Ex1///w
         1JPCIhinmHPtZcWV6JWP8PEerpVwn0G4hAhRBqjr8T5NmOMPMRU7ISGLeen7Zg9VkNY5
         Oeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761684868; x=1762289668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY1FGAllOUePWCDrAJ+BXKr6PDxjhxaK3nci02FUg0A=;
        b=nkfW9R21to7m32VGsfa1FFuAl0rzOE7qG88h+SM1N9l0x+/UFf1bT9v2jGYVqPjXl0
         WOUv/VfEyZuJ38K09xB9j484NcIC1lHq6IFhrVZLOCoxGlMUW1wxBrKrVcXn2Gd6zlic
         IGk3ITqYzs7spoJMbaJiIPKqzHyb/Al7msT+POpOdY6lB7rvHzfiVKqE5oObYDe67FlC
         Jp4itMqoXhHRLoJkp8urL3QcrtFU9QmdTCxHOviD1Ebz3H2ba6hyjjqYVgKVs2MPtuO3
         a3PcfQddysSxlPsreQfiRGCx9c/tCi2sUBntraEhjmdvvz3LhEAoVU6NCWxFho8qgqml
         xeUg==
X-Gm-Message-State: AOJu0YzPUVnyabY40YHzq7PezeLg8/1YsCpTvXLyKiTnqautgkxv9qGB
	DadPlLiBq4aO7Ap2HSEr79wrwvx4Lwa/zpXR99yPAbcixX6KoaAxhpyxRauBzJ5TpeADVvj+qo/
	zblWlc8iE600Au5rQeGExugAUNqJc2TM=
X-Gm-Gg: ASbGncsOYTq4Je9QnnXyEQ6x0DIZ12dihQIfBilcqzfYmlAXoX+NdAYtw5Z2Ff2pUkF
	MGSlZYD0ErjfXHnMjolhL25ZuqzwANelBdOT04oquSxlfrqcWjL2P3Vki87ilfYeaaX0zSc6/ir
	MVDpeAvLevO2e7v780/DaMCemscIUDvLyBr0NPcakrw7Y7UIbAbiEyNh35o7YnhzS/a+UgBhUL5
	LLwDsiatcSvBNxNuLUvA2fJhVNlO8G2P3LQTiyLaIo9LULjind06ABvQfbhs9k+oYPSG8663CJP
	KbZhxxebqPbtaYuDFLI=
X-Google-Smtp-Source: AGHT+IFnnFqYpoi2Olc4FLQFzcBjZMwG0v8cO2S3FXhNMlJz0b0qHgrpfQIr+zoopza//zxLvpzwqIhFHuct6571hgc=
X-Received: by 2002:a17:907:3f8d:b0:b6d:5b0a:bc3f with SMTP id
 a640c23a62f3a-b703d317c34mr39055666b.24.1761684868346; Tue, 28 Oct 2025
 13:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com> <aQD2y5fgodWM8kOl@p14s>
In-Reply-To: <aQD2y5fgodWM8kOl@p14s>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Wed, 29 Oct 2025 07:54:16 +1100
X-Gm-Features: AWmQ_bl0MBpXRmMHi7i7ntCNDHvsEY5k5GXJwGrnVH49SviSNp6enDazwkRtbwA
Message-ID: <CAEg67G=8bVSpPa2yiOp8XyUKq95eMc_BikgY_bGRrSiOoJo_cg@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 04:01, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hi Patrick,
>
> I started reviewing this patch.  Despite the short amount of code, it will take
> me a few days to understand the ramifications of your proposal.
>
> Thanks,
> Mathieu

Thanks, I appreciate you taking the time to look at it.

This really should be considered a bug fix. If userspace does
something like this:

struct epoll_event ev;
ev.events = EPOLLOUT;
epoll_ctl(epfd, EPOLL_CTL_ADD, rpmsg_fd, &ev);

epoll_ctl will return without error, but never generate any events for rpmsg_fd.

Patrick

> On Wed, Oct 22, 2025 at 02:28:17PM +1100, patrick.oppenlander@gmail.com wrote:
> > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> >
> > Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> > generate EPOLLIN events but no EPOLLOUT events.
> >
> > Unfortunately, poll support means that we can no longer disable
> > tx-complete interrupts as there is no way to know whether a poller is
> > waiting in sendq, so we always need notifications.
> >
> > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
> >  1 file changed, 32 insertions(+), 69 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 484890b4a6a74..79d983055b4d6 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -41,13 +41,12 @@
> >   * @buf_size:   size of one rx or tx buffer
> >   * @last_sbuf:       index of last tx buffer used
> >   * @bufs_dma:        dma base addr of the buffers
> > - * @tx_lock: protects svq, sbufs and sleepers, to allow concurrent senders.
> > + * @tx_lock: protects svq and sbufs, to allow concurrent senders.
> >   *           sending a message might require waking up a dozing remote
> >   *           processor, which involves sleeping, hence the mutex.
> >   * @endpoints:       idr of local endpoints, allows fast retrieval
> >   * @endpoints_lock: lock of the endpoints set
> >   * @sendq:   wait queue of sending contexts waiting for a tx buffers
> > - * @sleepers:        number of senders that are waiting for a tx buffer
> >   *
> >   * This structure stores the rpmsg state of a given virtio remote processor
> >   * device (there might be several virtio proc devices for each physical
> > @@ -65,7 +64,6 @@ struct virtproc_info {
> >       struct idr endpoints;
> >       struct mutex endpoints_lock;
> >       wait_queue_head_t sendq;
> > -     atomic_t sleepers;
> >  };
> >
> >  /* The feature bitmap for virtio rpmsg */
> > @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> >  static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> >  static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> >                                 int len, u32 dst);
> > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > +                               poll_table *wait);
> >  static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> >  static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
> >                                                  struct rpmsg_channel_info *chinfo);
> > @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
> >       .sendto = virtio_rpmsg_sendto,
> >       .trysend = virtio_rpmsg_trysend,
> >       .trysendto = virtio_rpmsg_trysendto,
> > +     .poll = virtio_rpmsg_poll,
> >       .get_mtu = virtio_rpmsg_get_mtu,
> >  };
> >
> > @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >       unsigned int len;
> >       void *ret;
> >
> > -     /* support multiple concurrent senders */
> >       mutex_lock(&vrp->tx_lock);
> >
> >       /*
> > @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >       return ret;
> >  }
> >
> > -/**
> > - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> > - * @vrp: virtual remote processor state
> > - *
> > - * This function is called before a sender is blocked, waiting for
> > - * a tx buffer to become available.
> > - *
> > - * If we already have blocking senders, this function merely increases
> > - * the "sleepers" reference count, and exits.
> > - *
> > - * Otherwise, if this is the first sender to block, we also enable
> > - * virtio's tx callbacks, so we'd be immediately notified when a tx
> > - * buffer is consumed (we rely on virtio's tx callback in order
> > - * to wake up sleeping senders as soon as a tx buffer is used by the
> > - * remote processor).
> > - */
> > -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> > -{
> > -     /* support multiple concurrent senders */
> > -     mutex_lock(&vrp->tx_lock);
> > -
> > -     /* are we the first sleeping context waiting for tx buffers ? */
> > -     if (atomic_inc_return(&vrp->sleepers) == 1)
> > -             /* enable "tx-complete" interrupts before dozing off */
> > -             virtqueue_enable_cb(vrp->svq);
> > -
> > -     mutex_unlock(&vrp->tx_lock);
> > -}
> > -
> > -/**
> > - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> > - * @vrp: virtual remote processor state
> > - *
> > - * This function is called after a sender, that waited for a tx buffer
> > - * to become available, is unblocked.
> > - *
> > - * If we still have blocking senders, this function merely decreases
> > - * the "sleepers" reference count, and exits.
> > - *
> > - * Otherwise, if there are no more blocking senders, we also disable
> > - * virtio's tx callbacks, to avoid the overhead incurred with handling
> > - * those (now redundant) interrupts.
> > - */
> > -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> > -{
> > -     /* support multiple concurrent senders */
> > -     mutex_lock(&vrp->tx_lock);
> > -
> > -     /* are we the last sleeping context waiting for tx buffers ? */
> > -     if (atomic_dec_and_test(&vrp->sleepers))
> > -             /* disable "tx-complete" interrupts */
> > -             virtqueue_disable_cb(vrp->svq);
> > -
> > -     mutex_unlock(&vrp->tx_lock);
> > -}
> > -
> >  /**
> >   * rpmsg_send_offchannel_raw() - send a message across to the remote processor
> >   * @rpdev: the rpmsg channel
> > @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >
> >       /* no free buffer ? wait for one (but bail after 15 seconds) */
> >       while (!msg) {
> > -             /* enable "tx-complete" interrupts, if not already enabled */
> > -             rpmsg_upref_sleepers(vrp);
> > -
> >               /*
> >                * sleep until a free buffer is available or 15 secs elapse.
> >                * the timeout period is not configurable because there's
> > @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >                                       (msg = get_a_tx_buf(vrp)),
> >                                       msecs_to_jiffies(15000));
> >
> > -             /* disable "tx-complete" interrupts if we're the last sleeper */
> > -             rpmsg_downref_sleepers(vrp);
> > -
> >               /* timeout ? */
> >               if (!err) {
> >                       dev_err(dev, "timeout waiting for a tx buffer\n");
> > @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> >       return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
> >  }
> >
> > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > +                               poll_table *wait)
> > +{
> > +     struct rpmsg_device *rpdev = ept->rpdev;
> > +     struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > +     struct virtproc_info *vrp = vch->vrp;
> > +     __poll_t mask = 0;
> > +
> > +     poll_wait(filp, &vrp->sendq, wait);
> > +
> > +     /* support multiple concurrent senders */
> > +     mutex_lock(&vrp->tx_lock);
> > +
> > +     /*
> > +      * check for a free buffer, either:
> > +      * - we haven't used all of the available transmit buffers (half of the
> > +      *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> > +      * - we ask the virtqueue if there's a buffer available
> > +      */
> > +     if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> > +         !virtqueue_enable_cb(vrp->svq))
> > +             mask |= EPOLLOUT;
> > +
> > +     mutex_unlock(&vrp->tx_lock);
> > +
> > +     return mask;
> > +}
> > +
> >  static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> >  {
> >       struct rpmsg_device *rpdev = ept->rpdev;
> > @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >               WARN_ON(err); /* sanity check; this can't really happen */
> >       }
> >
> > -     /* suppress "tx-complete" interrupts */
> > -     virtqueue_disable_cb(vrp->svq);
> > -
> >       vdev->priv = vrp;
> >
> >       rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> > --
> > 2.51.1.dirty
> >
