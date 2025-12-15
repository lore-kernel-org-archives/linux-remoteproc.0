Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4122D7B5
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 01:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765760690; cv=none; b=NqW5Gpe8Uo2LL/uipcdOUIuIbTP25sibnuOrY91bZL+MfP4Vi9ju4Fs2O58PPAYsv9pxUxAIr7ROccJZxnEefZ3J1wSahxvuh9nS/mEO5Ld/VTzWoaN7ZYId5ygiHgRr+e9ZzfpLO22VZhF+ZqFJdaK95Eh05+6LfwjwIm1Lkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765760690; c=relaxed/simple;
	bh=XWyq5s6tv/TqDiKny8B7IeTrEaEsHnviazHxisaV9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OskqwGXP3MxU2WFF+Ht5kVPasvpMvVk0ZtI8lNuzbIb21vGvvMw1zJ5JxmTAfHWIHgPFQnfhgvw5elvm1mO6Rml0YwNccQausi2QKUDRRKwyCryY4fu6j2vNUoQP2ErEa0/W4zNJ9SqKCmVORZ9k8bhDXVAeyKwrydfwLdE5xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJ70lEC3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJ70lEC3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29efd139227so35363805ad.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 Dec 2025 17:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765760687; x=1766365487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inC+Wy9jzavRGBSwjZxV0qHxl3oyLnDwyagmXqiYjYQ=;
        b=hJ70lEC3isL6tko28fuPx3vWiBF388Pmw5MXDqqDDJu37dRkRSFgxLdIPG0ou9J1uy
         YbBOxMPg7YuZyUfS9y24r2zRRoqDC17etO04KAbVUWrj5QwsJ1OD7In4BRVxc2Aq2ddN
         BvddHxI2H58opwZKn+a9gzjGhD9Xnt3h5CB+f1C2HdfHcDFGPa+x9OhbePuyxy5Lgrzd
         vhNFzfweZSDEgbMrT3t69uYWfBv1sgtFrHKAbrxi1OupCwXMoZG6QZCpvqoaNe3D/0SN
         Mmd+E5m7/PM6I77z7epRCTkiLDq0/o7ndtSs+as+AAd29OZT+fTHeBFu/ygdKR7ZXKwU
         Y/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765760687; x=1766365487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inC+Wy9jzavRGBSwjZxV0qHxl3oyLnDwyagmXqiYjYQ=;
        b=qxUi6UMyozo1B2v3kObMo+3xpmz3oP6YSwLAj+FappuWLLsOVTba95vKrXWxqItP23
         hNcNZ6sQz6zrF3gmRLHuigL0ztdqUdg2uFhz0GhaRCz3OhVDfZx77vz1ZhsdBWTwux/C
         Ux8+QSSDbHO6hSJ8CBoUWl+D4iULV01A07FE1CEaiYDug1nQYHBULobR5Ob7HwtoaXrk
         yn5A3YUa3G5jH59uB8BNSVYfjBpazxNnzaIXOASSSwuXNH7GOQKWTM/KGES+BSkrfG9f
         bgvCEK1pAaBDiEUvg3O06tmK0iyq1kV065I5MB8kZsBMFsRCdisX1U4kqjYfxvfs6L2y
         KXFw==
X-Gm-Message-State: AOJu0YyyMTsjbmOK1L/l6p0093ZFEs4JW9VS4tcQElJ+VwAKAu2YT086
	0kdBrAaAH6N8xNPnzLbyas1zLB0B1+kXJuLBV/zmN19uNWPliFPt2IxnAwVxR6hkf2Q=
X-Gm-Gg: AY/fxX7usiLOYy87gLDCRxVKJq99iBu21VBKEFvNPJNuQ/9N/SBgWDQ2CG71axcyVrx
	ttUDe8rManC9H1VbHxgcnLatNU/Z4XFxpSwxJWuFdd3ebLiFE632HD9kntir/YcJeM8g4l5rTg6
	kUPwAooOu7jh7/1KJBcnoGZt5JOYpXmkuJJ0cPJSrw5gP2CjBNZZdYHUtOT9tb+zAyVjQgHnJkH
	/4BvN6W1RGiMwKlXpYiNwFyDkdWJM/ymLB3rPzlmmsp1D69KaI/Ih+0nWg4jvvyv/6RLrwb+uxg
	HdwZRI1tI8SM50nAhigbSuvlTLp36nbKKcZw386m4uylYQskrAOJ7zcFFuzMs1xyYBkS/GgnNmp
	N+SMOrGYNhLXOX7ph9BPJlgftHbbxIFdZlCft8E2Ujbz0XUYigpihjuVxxIh/wlGL+ihhU7drV6
	9Iszezr7CbCbxfp4Qxm0vH34DIL7mFGZzKdAyRWn2+ow==
X-Google-Smtp-Source: AGHT+IH780U+szUHUNQS1YjqiBuVr0+NPVsL48001MXGp8vaAOzfLNXng9apn4f0AJiTSkwsjQO5dg==
X-Received: by 2002:a17:903:32cd:b0:29e:97a1:76bc with SMTP id d9443c01a7336-29f23b5ecf4mr93977595ad.21.1765760687185;
        Sun, 14 Dec 2025 17:04:47 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a09afe20e5sm46224665ad.26.2025.12.14.17.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 17:04:46 -0800 (PST)
Date: Sun, 14 Dec 2025 18:04:43 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: patrick.oppenlander@gmail.com
Cc: linux-remoteproc@vger.kernel.org, andersson@kernel.org
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
Message-ID: <aT9eq2AGdgXtppdT@p14s>
References: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022032817.320378-1-patrick.oppenlander@gmail.com>

On Wed, Oct 22, 2025 at 02:28:17PM +1100, patrick.oppenlander@gmail.com wrote:
> From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> 
> Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
> generate EPOLLIN events but no EPOLLOUT events.
> 
> Unfortunately, poll support means that we can no longer disable
> tx-complete interrupts as there is no way to know whether a poller is
> waiting in sendq, so we always need notifications.
> 
> Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
>  1 file changed, 32 insertions(+), 69 deletions(-)
>

As we previously agreed, I have added this patch to my tree under the condition
it doesn't break anything.  Let's see how things go.

Thanks,
Mathieu

 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 484890b4a6a74..79d983055b4d6 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -41,13 +41,12 @@
>   * @buf_size:   size of one rx or tx buffer
>   * @last_sbuf:	index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
> - * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> + * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
>   *		sending a message might require waking up a dozing remote
>   *		processor, which involves sleeping, hence the mutex.
>   * @endpoints:	idr of local endpoints, allows fast retrieval
>   * @endpoints_lock: lock of the endpoints set
>   * @sendq:	wait queue of sending contexts waiting for a tx buffers
> - * @sleepers:	number of senders that are waiting for a tx buffer
>   *
>   * This structure stores the rpmsg state of a given virtio remote processor
>   * device (there might be several virtio proc devices for each physical
> @@ -65,7 +64,6 @@ struct virtproc_info {
>  	struct idr endpoints;
>  	struct mutex endpoints_lock;
>  	wait_queue_head_t sendq;
> -	atomic_t sleepers;
>  };
>  
>  /* The feature bitmap for virtio rpmsg */
> @@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
>  static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
>  static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>  				  int len, u32 dst);
> +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> +				  poll_table *wait);
>  static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>  static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
>  						   struct rpmsg_channel_info *chinfo);
> @@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>  	.sendto = virtio_rpmsg_sendto,
>  	.trysend = virtio_rpmsg_trysend,
>  	.trysendto = virtio_rpmsg_trysendto,
> +	.poll = virtio_rpmsg_poll,
>  	.get_mtu = virtio_rpmsg_get_mtu,
>  };
>  
> @@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  	unsigned int len;
>  	void *ret;
>  
> -	/* support multiple concurrent senders */
>  	mutex_lock(&vrp->tx_lock);
>  
>  	/*
> @@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  	return ret;
>  }
>  
> -/**
> - * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
> - * @vrp: virtual remote processor state
> - *
> - * This function is called before a sender is blocked, waiting for
> - * a tx buffer to become available.
> - *
> - * If we already have blocking senders, this function merely increases
> - * the "sleepers" reference count, and exits.
> - *
> - * Otherwise, if this is the first sender to block, we also enable
> - * virtio's tx callbacks, so we'd be immediately notified when a tx
> - * buffer is consumed (we rely on virtio's tx callback in order
> - * to wake up sleeping senders as soon as a tx buffer is used by the
> - * remote processor).
> - */
> -static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
> -{
> -	/* support multiple concurrent senders */
> -	mutex_lock(&vrp->tx_lock);
> -
> -	/* are we the first sleeping context waiting for tx buffers ? */
> -	if (atomic_inc_return(&vrp->sleepers) == 1)
> -		/* enable "tx-complete" interrupts before dozing off */
> -		virtqueue_enable_cb(vrp->svq);
> -
> -	mutex_unlock(&vrp->tx_lock);
> -}
> -
> -/**
> - * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
> - * @vrp: virtual remote processor state
> - *
> - * This function is called after a sender, that waited for a tx buffer
> - * to become available, is unblocked.
> - *
> - * If we still have blocking senders, this function merely decreases
> - * the "sleepers" reference count, and exits.
> - *
> - * Otherwise, if there are no more blocking senders, we also disable
> - * virtio's tx callbacks, to avoid the overhead incurred with handling
> - * those (now redundant) interrupts.
> - */
> -static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
> -{
> -	/* support multiple concurrent senders */
> -	mutex_lock(&vrp->tx_lock);
> -
> -	/* are we the last sleeping context waiting for tx buffers ? */
> -	if (atomic_dec_and_test(&vrp->sleepers))
> -		/* disable "tx-complete" interrupts */
> -		virtqueue_disable_cb(vrp->svq);
> -
> -	mutex_unlock(&vrp->tx_lock);
> -}
> -
>  /**
>   * rpmsg_send_offchannel_raw() - send a message across to the remote processor
>   * @rpdev: the rpmsg channel
> @@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  
>  	/* no free buffer ? wait for one (but bail after 15 seconds) */
>  	while (!msg) {
> -		/* enable "tx-complete" interrupts, if not already enabled */
> -		rpmsg_upref_sleepers(vrp);
> -
>  		/*
>  		 * sleep until a free buffer is available or 15 secs elapse.
>  		 * the timeout period is not configurable because there's
> @@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  					(msg = get_a_tx_buf(vrp)),
>  					msecs_to_jiffies(15000));
>  
> -		/* disable "tx-complete" interrupts if we're the last sleeper */
> -		rpmsg_downref_sleepers(vrp);
> -
>  		/* timeout ? */
>  		if (!err) {
>  			dev_err(dev, "timeout waiting for a tx buffer\n");
> @@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>  }
>  
> +static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> +				  poll_table *wait)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +	struct virtproc_info *vrp = vch->vrp;
> +	__poll_t mask = 0;
> +
> +	poll_wait(filp, &vrp->sendq, wait);
> +
> +	/* support multiple concurrent senders */
> +	mutex_lock(&vrp->tx_lock);
> +
> +	/*
> +	 * check for a free buffer, either:
> +	 * - we haven't used all of the available transmit buffers (half of the
> +	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> +	 * - we ask the virtqueue if there's a buffer available
> +	 */
> +	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> +	    !virtqueue_enable_cb(vrp->svq))
> +		mask |= EPOLLOUT;
> +
> +	mutex_unlock(&vrp->tx_lock);
> +
> +	return mask;
> +}
> +
>  static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  {
>  	struct rpmsg_device *rpdev = ept->rpdev;
> @@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  		WARN_ON(err); /* sanity check; this can't really happen */
>  	}
>  
> -	/* suppress "tx-complete" interrupts */
> -	virtqueue_disable_cb(vrp->svq);
> -
>  	vdev->priv = vrp;
>  
>  	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> -- 
> 2.51.1.dirty
> 
