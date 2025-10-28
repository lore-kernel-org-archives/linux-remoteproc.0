Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710B3093BF
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Oct 2025 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670868; cv=none; b=kgwTOEFI46NJ/3SY/8qexbrRPHfI+W3SzYBY1RXiyDy4VlzQPPkpt9nc5IvVvEfgnEg6EIN4in3GPFs6N4JCbbm+f5fSiXGSFtLgPafDkkAp6WZ9S0YMO0zUpDQ5Kwe6jzCQ3QKQT2OK0deb+bC3SLLs48TO3NdNgDDRrlGhnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670868; c=relaxed/simple;
	bh=9/XMTbvlXywS/DcenRxLoC7j/4TQ9N4aQCMUUzCSo70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dw6XUPExtalnb3bEasS/Bi5wowPlupwWC7/DqaRYyRFvMxidGFQ5ZIEfTDf3ZCO7yZoNIl5X+QOOMOIXh3dfwY74n96pgWnKe28lhlNpL6nRTaDpR4Wihf1ph4IEiCyk64ni5ius7n9c+2jOMTiUC9+x+wdaXowtBMLS45fsRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ux8mggcP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ux8mggcP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7833765433cso7848765b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Oct 2025 10:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761670864; x=1762275664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xh+KegoBGdPPiYbRlSIsN4lAtHSpa38Na2kFLLm0qs0=;
        b=ux8mggcPfU8IPuLjVvsnkbHXCtTcNRX/uf0DefNCwpJhjUzZFnnhby0pY4rirrLkgf
         qNZj0trgDhcWaKvRRNvaDmggylmHIdFi8CNx3JNLU+OxKzzyPbuvBMRHjFIBac3ekKn8
         K4nvj58KWYeteqbvt5hM1tCaGJ9yPRWl6kQQ8I1s9P5pL5y8TLTo/K1bJAWLwWWafPnW
         kq0YxjrvOtTWsLfa9LnhmG2jH/a3En0NvW2/6PTbeQuKwMxx20nbFmDKPStSznHRU9fx
         oXqS+nxASs9+tjzHeRuhLeUpWoFIglrOWGSSUBKNbMROdUazIF5T2sUz8lwJNV2bmaou
         pYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670864; x=1762275664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xh+KegoBGdPPiYbRlSIsN4lAtHSpa38Na2kFLLm0qs0=;
        b=bIIjMtPxqLbU2uFK9g1ogc8wM0pp5/ooO7Ihd3fxyeBEAycfRXc9hCgieCbCYnXwCj
         sTEjeAPRLToL7wP82vvwEQkXHjkQGx0xWczb94sh7fCVc6xaGORvDrWOP+MyUF2DKP5V
         GdpILPKR7XQQvk+HpOVsV3th1tj46F9Mzta2bM70BDLy4SThDC/+WzusKanzGb1JlzuP
         /spVe5IuZpvN6pdAprKA4wWS6vDfCmWSvwCCwWP2kpbgDQNDUVmdX4a0Ms5UFf6hNuTv
         avQCxQeCX81usgtSbt87om9u9ytaoXgGGnp1XGP1LVGC+Co9dSQyrYgINOAoOVXsb68i
         i9lA==
X-Gm-Message-State: AOJu0YxHttzgFSBFwNjD6Tk2H+C8C+Yj5MIj6ruBwArgodU8UL25Tdb1
	tdwn/fQP0xbOA0BJXt6gg28sDufsSvE87ITKGJJPhW8WgUf9FDPYesZg/yJGrDHosA0+9h7nGOh
	9dTEapA8=
X-Gm-Gg: ASbGncs/hOqd120e0fBzOTBvkuTOvd9pPGhqj3ivc1itcAeDRVTByLeyb+9NbuPfJa4
	IwE/l1gQ3vF90K/a/BDx7ss8V2sA5YrC+zXFqk469SUDi7BHE3BnC4F03gL15Zm1kIR5J1RezhM
	+uMyL0+88MxILSUxw/T3me4GkN/iwtqGHEzjdWdvIF15ULlvoaEJUy1Z9QX7SHSPl8ExMbp5Jc0
	bBLF9646OnLojgNrB1GXGtfcyVXDDMF+CR6Zv0XBGv85AnaCHGKjIsFrR5NiiUpz2DIg99P9od/
	NHTzyaUPuuAljPO3DR5ghoITmREGkUmASDeg/JDB+z9nZb93QHTcuEiprxWg+ZlNl4IaIIF2tDX
	DPww9dzvbIjSsny4W8r1+EqBeZFJ822CIa+Wxuon4Du3U83DbsZxgkYDaQnR9c8MygMraIPPdpL
	JNlg==
X-Google-Smtp-Source: AGHT+IFxPMXOAGRAzDOF0oYanNqXaB5DEBm0FGndhpCJjlPMrHfTBru7rdh6Nd1V3RyjWAFRvENfYA==
X-Received: by 2002:a05:6a00:a08:b0:7a2:7610:364d with SMTP id d2e1a72fcca58-7a441c3268fmr5565074b3a.15.1761670863234;
        Tue, 28 Oct 2025 10:01:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1c4b:7a89:a51:c6f7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087cdbsm12299203b3a.64.2025.10.28.10.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:01:02 -0700 (PDT)
Date: Tue, 28 Oct 2025 11:00:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: patrick.oppenlander@gmail.com
Cc: linux-remoteproc@vger.kernel.org, andersson@kernel.org
Subject: Re: [PATCH] rpmsg: virtio: EPOLLOUT support
Message-ID: <aQD2y5fgodWM8kOl@p14s>
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

Hi Patrick,

I started reviewing this patch.  Despite the short amount of code, it will take
me a few days to understand the ramifications of your proposal.

Thanks,
Mathieu

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
