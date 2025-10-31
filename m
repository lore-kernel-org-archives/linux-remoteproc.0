Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F8299923
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Oct 2025 17:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761933417; cv=none; b=hrSCUDT9eufHlGT/l0fVrQ1R+/adwxmaeidD5yhGgwtfeJq3MmcwS2tpxAX3kh0qiIVM9NBO14jLx7+HOmwxjwQ40GEbLKBTgRFfLFyOeQR6b7mDo7Teb57XXqqLEK7wapY1ZI9PsiX+KRpyoRKq21Oq57Dd0Gk0/70/W0WYXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761933417; c=relaxed/simple;
	bh=vFvjmWjsPez6gdtBJ9FiTtIpeDN/tXD8/t0lAp2Kzkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnTHICZ1ykjXFTSKz5W+QbTz25v+9bxnOZ77Dp68fHCFTLRn+TdZ1DtUVAfYkpww28Vsecnw5xhJszSAyyKxMFLRv0A91/5/vnXfBASUoMAUc9SOA1mP1YIXhnEnD/Tyn0wTw75GQsn+rodp4em4oPCUAnWteet2n+v3SiEBLmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZ+HTrBI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZ+HTrBI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781010ff051so2047754b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Oct 2025 10:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761933414; x=1762538214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L28HROWuQ+fUTKwhXWaaPsSv9w4X27BlnNyJpb1J0jQ=;
        b=UZ+HTrBIQJhtxAGLeQxU8hwSR+ggEIrItDqr9rH0/P8IdLmw8CpHU1tizmnktcDXOB
         LfkZwS5BAdLrzEH6QtV6OfE2qyl2J4nlMAVzbkx+kDRTaq8H9nyWVedDoS+5jfOuP+IT
         O+zeuRc1od0SblCoMYHD69j295DtVJSdaBfaAIp8DogXk7cDAOuMK2Tl3YjKHN6d8VNN
         741aApiDUrAvTQ7DM2yXmjEQPkRAUIkzxy9rpu6B4ZXR9jbB2yO6X+4zdq8vtGLYVQQ3
         F7aWH/i7NekypWI1zMbuDne4xU07VeMoudYvp2dqAjdMbHnlU+Z2c+n8YxtiRfRDoZds
         DkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761933414; x=1762538214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L28HROWuQ+fUTKwhXWaaPsSv9w4X27BlnNyJpb1J0jQ=;
        b=Rb/55+Cm8M7Lnp+x9i6IAvpzYYb9q0wopo6ftLyM/ZrFgPGl3jZBjKRxZnCTxnlpKj
         lRp/GqtFk6YfUPVDslxTBKYcpQeJIertiIdLOD9QVtcrXj6qXCUnw1uZSyjahcNpZE9c
         iS1c/6tgPd+KZXtlvMLRdmjVwtYSZaPDkDb336FLAgvEAByEyM7y2pTuNLRmVkD4TymY
         eNvI51YCvKf9obFw36H6yHlSHUJ13G2oldTttdFSsCQeVVNX7YgFfcZeRSjJycxR6Yd8
         R8+mcct0RnD2WzBhRltkvI4XL2SAVCBV2ZdtXjQtHQxpr5Zly2yr0qiqgNdFoMWozeBI
         eZOA==
X-Forwarded-Encrypted: i=1; AJvYcCXYdUahYgAijWE+HfQDtkY/cUawC03aphHSFJf8t0yfb7QKK018oAU3kv9eSkuqH0rY5l/2j+1Zi5FDaT3TxJfu@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtHAck0uPcZyqxFPcTvR85v0H+JkMqGMaRqHjLzW1iWaIuwni
	w6yVZGVhV83uFJNZ+rLEHU4gIMFdkOlcICstN/4oro6dl3QNQCa1hX6cUUezTLm8yJCBRe21JDK
	Jbj8n9vU=
X-Gm-Gg: ASbGncs9vD9/BKKmHb37TmKx+dU8oA8pPflBNFTNrU+NgzlmPHPDBzYcyiFF55eVcsK
	SLvfQxhL4MkzBsUnX4AHpzAHv3XAoLxoRo8yVwKoI9nOEkiSHO5bkNylxYQf2Ze4lp79vs0Jrtw
	W7EiY29NohPcOjfxnCjuHGrKO/QnCtqVddUdva7VeMAvXcWVxDq7UaYKwZzoEJQq7FKgbuLjwr4
	byM2dT7QNbwy7d9KlYuOsCpUR6XH4wBLaeMwtY0T+r/NrTdIXvJ9E5fO/8NnCzAPN834E9RA8lv
	kA7pY/jo/wTuW9kfBv4LX+fss3WpNoHQZiXR/lcIJHVVM9XEaIWWBu7QPkqVqogGoOS1r6JnyDN
	5hgHMgq2so2FLBDhqJr2SarsNLS534rdcFFJmtyRPTNH4cWgAcCVHNivb65Y0jOuPhEwmC+QCpu
	IwTHGbXzl5ZXye
X-Google-Smtp-Source: AGHT+IF/9DplfLhNgR+eK5Qxl6XuEU91rg3SkFDie61rwSJrTZXemIWjoilmoiiKWMWWU69z4IFx+w==
X-Received: by 2002:a05:6a21:99a1:b0:32d:b946:dc55 with SMTP id adf61e73a8af0-348ca565710mr5461931637.22.1761933414244;
        Fri, 31 Oct 2025 10:56:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ce6:6e0e:5e60:ed56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm2905807b3a.8.2025.10.31.10.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:56:53 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:56:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
Message-ID: <aQT4YwKakKDAxBMT@p14s>
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
 <7acb046d-5c16-46c1-a034-a128f66e6502@oss.qualcomm.com>
 <CAEg67GkKoM6L6Cz63SY_7nd_XdTMC6wTCWj5W5yR43oNf4AsOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEg67GkKoM6L6Cz63SY_7nd_XdTMC6wTCWj5W5yR43oNf4AsOg@mail.gmail.com>

On Thu, Oct 23, 2025 at 08:59:22AM +1100, Patrick Oppenlander wrote:
> On Thu, 23 Oct 2025 at 00:35, Zhongqiu Han
> <zhongqiu.han@oss.qualcomm.com> wrote:
> >
> > On 10/22/2025 11:28 AM, patrick.oppenlander@gmail.com wrote:
> > > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > >
> > > Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> > > generate EPOLLIN events but no EPOLLOUT events.
> > >
> > > Unfortunately, poll support means that we can no longer disable
> > > tx-complete interrupts as there is no way to know whether a poller is
> > > waiting in sendq, so we always need notifications.
> > >
> > > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > > ---
> > >   drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
> > >   1 file changed, 32 insertions(+), 69 deletions(-)
> > >
> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index 484890b4a6a74..79d983055b4d6 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -41,13 +41,12 @@
> > >    * @buf_size:   size of one rx or tx buffer
> > >    * @last_sbuf:      index of last tx buffer used
> > >    * @bufs_dma:       dma base addr of the buffers
> > > - * @tx_lock: protects svq, sbufs and sleepers, to allow concurrent senders.
> > > + * @tx_lock: protects svq and sbufs, to allow concurrent senders.
> > >    *          sending a message might require waking up a dozing remote
> > >    *          processor, which involves sleeping, hence the mutex.
> > >    * @endpoints:      idr of local endpoints, allows fast retrieval
> > >    * @endpoints_lock: lock of the endpoints set
> > >    * @sendq:  wait queue of sending contexts waiting for a tx buffers
> > > - * @sleepers:        number of senders that are waiting for a tx buffer
> > >    *
> > >    * This structure stores the rpmsg state of a given virtio remote processor
> > >    * device (there might be several virtio proc devices for each physical
> > > @@ -65,7 +64,6 @@ struct virtproc_info {
> > >       struct idr endpoints;
> > >       struct mutex endpoints_lock;
> > >       wait_queue_head_t sendq;
> > > -     atomic_t sleepers;
> > >   };
> > >
> > >   /* The feature bitmap for virtio rpmsg */
> > > @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> > >   static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
> > >   static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> > >                                 int len, u32 dst);
> > > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > +                               poll_table *wait);
> > >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> > >   static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
> > >                                                  struct rpmsg_channel_info *chinfo);
> > > @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
> > >       .sendto = virtio_rpmsg_sendto,
> > >       .trysend = virtio_rpmsg_trysend,
> > >       .trysendto = virtio_rpmsg_trysendto,
> > > +     .poll = virtio_rpmsg_poll,
> > >       .get_mtu = virtio_rpmsg_get_mtu,
> > >   };
> > >
> > > @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> > >       unsigned int len;
> > >       void *ret;
> > >
> > > -     /* support multiple concurrent senders */
> > >       mutex_lock(&vrp->tx_lock);
> > >
> > >       /*
> > > @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> > >       return ret;
> > >   }
> > >
> > > -/**
> > > - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> > > - * @vrp: virtual remote processor state
> > > - *
> > > - * This function is called before a sender is blocked, waiting for
> > > - * a tx buffer to become available.
> > > - *
> > > - * If we already have blocking senders, this function merely increases
> > > - * the "sleepers" reference count, and exits.
> > > - *
> > > - * Otherwise, if this is the first sender to block, we also enable
> > > - * virtio's tx callbacks, so we'd be immediately notified when a tx
> > > - * buffer is consumed (we rely on virtio's tx callback in order
> > > - * to wake up sleeping senders as soon as a tx buffer is used by the
> > > - * remote processor).
> > > - */
> > > -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> > > -{
> > > -     /* support multiple concurrent senders */
> > > -     mutex_lock(&vrp->tx_lock);
> > > -
> > > -     /* are we the first sleeping context waiting for tx buffers ? */
> > > -     if (atomic_inc_return(&vrp->sleepers) == 1)
> > > -             /* enable "tx-complete" interrupts before dozing off */
> > > -             virtqueue_enable_cb(vrp->svq);
> > > -
> > > -     mutex_unlock(&vrp->tx_lock);
> > > -}
> > > -
> > > -/**
> > > - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> > > - * @vrp: virtual remote processor state
> > > - *
> > > - * This function is called after a sender, that waited for a tx buffer
> > > - * to become available, is unblocked.
> > > - *
> > > - * If we still have blocking senders, this function merely decreases
> > > - * the "sleepers" reference count, and exits.
> > > - *
> > > - * Otherwise, if there are no more blocking senders, we also disable
> > > - * virtio's tx callbacks, to avoid the overhead incurred with handling
> > > - * those (now redundant) interrupts.
> > > - */
> > > -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> > > -{
> > > -     /* support multiple concurrent senders */
> > > -     mutex_lock(&vrp->tx_lock);
> > > -
> > > -     /* are we the last sleeping context waiting for tx buffers ? */
> > > -     if (atomic_dec_and_test(&vrp->sleepers))
> > > -             /* disable "tx-complete" interrupts */
> > > -             virtqueue_disable_cb(vrp->svq);
> > > -
> > > -     mutex_unlock(&vrp->tx_lock);
> > > -}
> > > -
> >
> > Hi Patrick,
> >
> > I'd like to go over a few aspects of this patch, please feel free to
> > correct me if there is any misunderstanding.
> 
> Hi, thanks for the review, I'll address your comments below.
> 
> > >   /**
> > >    * rpmsg_send_offchannel_raw() - send a message across to the remote processor
> > >    * @rpdev: the rpmsg channel
> > > @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > >
> > >       /* no free buffer ? wait for one (but bail after 15 seconds) */
> > >       while (!msg) {
> > > -             /* enable "tx-complete" interrupts, if not already enabled */
> > > -             rpmsg_upref_sleepers(vrp);
> > > -
> > >               /*
> > >                * sleep until a free buffer is available or 15 secs elapse.
> > >                * the timeout period is not configurable because there's
> > > @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > >                                       (msg = get_a_tx_buf(vrp)),
> > >                                       msecs_to_jiffies(15000));
> > >
> > > -             /* disable "tx-complete" interrupts if we're the last sleeper */
> > > -             rpmsg_downref_sleepers(vrp);
> >
> > 1.The original code dynamically disabled tx-complete interrupts during
> > normal operation and only enabled them when waiting for buffers. This
> > patch removes all virtqueue_disable_cb() calls, meaning interrupts are
> > always enabled. For high-frequency messaging, could this significantly
> > increase interrupt overhead, even irq storm? May I know do you have
> > performance data showing the interrupt frequency increase?
> 
> I mentioned this in the commit message.
> 
> The problem is that the poller can be removed at any time by
> poll_freewait, and there is no notification of this happening. The
> simplest solution to this is what I have proposed in this patch, i.e.
> always leave callbacks enabled.
> 
> There is an alternate solution, but it comes with a possibly
> significant caveat. We could add a check along the lines of:
> 
> if wq_has_sleeper(vrp->sendq) {
>         virtqueue_disable_cb(vrp->svq);
> }
> 
> But this is not guaranteed to work as expected as poll_freewait can
> remove the poller at any time (i.e. after we've performed this check),
> meaning that the callbacks will sometimes remain enabled regardless.
> 
> In terms of performance, I have not measured a difference in my workload.
> 
> > > -
> > >               /* timeout ? */
> > >               if (!err) {
> > >                       dev_err(dev, "timeout waiting for a tx buffer\n");
> > > @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
> > >       return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
> > >   }
> > >
> > > +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> > > +                               poll_table *wait)
> > > +{
> > > +     struct rpmsg_device *rpdev = ept->rpdev;
> > > +     struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > > +     struct virtproc_info *vrp = vch->vrp;
> > > +     __poll_t mask = 0;
> > > +
> > > +     poll_wait(filp, &vrp->sendq, wait);
> > > +
> > > +     /* support multiple concurrent senders */
> > > +     mutex_lock(&vrp->tx_lock);
> > > +
> > > +     /*
> > > +      * check for a free buffer, either:
> > > +      * - we haven't used all of the available transmit buffers (half of the
> > > +      *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> > > +      * - we ask the virtqueue if there's a buffer available
> > > +      */
> > > +     if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> > > +         !virtqueue_enable_cb(vrp->svq))
> > > +             mask |= EPOLLOUT;
> > > +
> >
> > 2.The virtio_rpmsg_poll() calls virtqueue_enable_cb() but seems never
> > disables it. Once any process polls the device, interrupts remain
> > permanently enabled even after poll completes?
> 
> virtio_rpmsg_poll returns immediately after registering the poller and
> checking whether there are any free buffers. poll_wait does not block,
> so there's no way to know that poll has completed.
> 
> With this change callbacks are always enabled (they're enabled by the
> virtqueue initialisation if a callback is registered). Calling
> virtqueue_enable_cb here doesn't actually enable callbacks. We call it
> because its return value tells us whether there's any pending buffers
> in the queue. I'm not aware of another virtqueue API which can perform
> this check.

Please add "Calling virtqueue ... in the queue." to the in-line comment you
already have.

I have pondered over this patch long and hard.  As Zhongqiu Han pointed out,
there is potential for unwanted side effect but as you pointed out, EPOLLOUT is
currently not supported.  We currently sit at rc3.  I will highlight your patch
in the next OpenAMP community meeting, asking people to test it in their
environment.  From there it could be added to my queue for 6.19-rc1, under the
reserve that if someone complains, it will be backed out and you will need to
find a different approach.

Thanks,
Mathieu   

> 
> We could propose a new virtqueue_buf_pending() or something along
> those lines if necessary, but, looking at the implementation of
> virtqueue_enable_cb(), we'd effectively be causing a bunch of code
> churn to avoid a couple of if tests. Given that we'd be the only
> consumer of this new API it didn't seem worth it to me?
> 
> Kind regards,
> 
> Patrick
> 
> > > +     mutex_unlock(&vrp->tx_lock);
> > > +
> > > +     return mask;
> > > +}
> > > +
> > >   static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> > >   {
> > >       struct rpmsg_device *rpdev = ept->rpdev;
> > > @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > >               WARN_ON(err); /* sanity check; this can't really happen */
> > >       }
> > >
> > > -     /* suppress "tx-complete" interrupts */
> > > -     virtqueue_disable_cb(vrp->svq);
> > > -
> > >       vdev->priv = vrp;
> > >
> > >       rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> >
> >
> > --
> > Thx and BRs,
> > Zhongqiu Han
