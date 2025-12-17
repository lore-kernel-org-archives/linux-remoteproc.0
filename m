Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3330CDB0
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766005107; cv=none; b=Xc+rW/sHrRU3XZpTcRSonQtM3XgSkn5pQBIUQR9XHM9ofhTTyV+fhI3upCnf/wxxkc1IfCFb2jEId1GaxE+HhPn7kiE8fqjtZfbeyvHfhuI/ay+meSEtphzJzJ9EErPuZ896TTqG9FelfIv9iHeIvPVtxGesCZBuRXl7MBXH3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766005107; c=relaxed/simple;
	bh=hZNjoNQVlYTqUf2JurJDMNVvZvU8KiFitH8a3f2oqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K67dggcSwd5fxcUVVM7m53yds7MmP3ifT4r0jxYsR8306AEramZ/VwlGGqOuCJEfLjkrUPrmSmWalG5pB4khVCS3MIBkjjvEtnVqCQlvlr6hUxLiQHHP9UwWOW+ZOCjI83lUsylIuvsyscHDTzkIVvn8LhzZ41nEDhqOEpkH2U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1+Z4rqB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1+Z4rqB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34b75f7a134so3649881a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 12:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766005103; x=1766609903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8l6Ur6Yr4Kr5eraloIZXw+ktF7rID9FaI2hPFW+l6Y=;
        b=N1+Z4rqBgb57nSPSgEiUut/dzHp3RuEbZRBg/xUj0sHysFa/AL3X7PoG772/+PTHr7
         GAvK+kAS6marNDZEz49gzbPaeQqGH6ydlnbrC2BFi+5sel32Yf6CRT4afgMIFHpf3wwM
         MEWkt5Wdz7hfYJFRiJdlIKS7vXqXjHbdQfxGhbytIl02IKklMAp0GZsSIhamRMsO5TPw
         pCPOQKnBZXDA/UgjwPRsNw+KOuLLe1jL9lE90uKWo7vtyjk2daYOjhA65s2JiavdgXdy
         CmAz1krX12zAIOBWEPTHvTkkNTrTYBo/w7CIe+Clfp2JN24gZfVUNbmZ3g3b5x+/c6nz
         fa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766005103; x=1766609903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8l6Ur6Yr4Kr5eraloIZXw+ktF7rID9FaI2hPFW+l6Y=;
        b=BQ0iRF88cUKda7IAXq8AoA/gM5qf1f+P5IfETsQla5/qglwTiXEREbSk1pFcVVQKaG
         uiVEZUsqVnSH0RxN0AxWkZJSQSLBMsXjjvcV4urXHaxGZK9rNMrPC6ZzmuK5rtugEOCH
         1meIqrB6QO5ycHsEwpp4g0OrwAJLEJsRhc3ZBup/94X/JVvmlCx5vmJM3w7Bv7yMyGeX
         sLViUe61+Y2ITzFh5YWBDuVFdGPvNVEUutOTSuYSV9m3nTNuIMUW074VYk+VdrsZxEYG
         TLH5lCJ39b8L8m5xh075zy5pfjXQwpD4L9yEiA7qX12RM6CbwMBhVQfxbEoAEv6IYwqC
         Ihew==
X-Forwarded-Encrypted: i=1; AJvYcCWgVr2SYcYBJQFgH8HzXGFXYAJNrhUeR9W2W3mx/JWnh7tNQ+k2V7OLPun5FvPw7Hi4irp6BIP7Q1t42anPEQUy@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTfuFQsb9pckqxNrRa1UaOT2PM6yP7Ov+9AuL2QgIoOXGsLoz
	TmnruJO+JFL1GTdrESaKMNZ4Ug0DlgR0wQxijwzXMr3jzpeJ5tYFPCBD9rOTxOGQg/I=
X-Gm-Gg: AY/fxX5/4GKif/ipLYkzbb2p/kwVgh0mcqVjm9uDjBRiBH9+EcAMG7qJgXlYpaN8byV
	G7OYBmcHgQ9Im4HXAvtfcpXQDSChnvuZgqlanr76w4DPhpWqvP7pVfvGioWdEyaQYqzTEZ8tobC
	hHIC1i7didVID1qExwBGuL4fikEgkFNK8cdTW/+YUNhwaI/mLD7Pt/0K389UwKA+1uiNIxAzkls
	ozHNYQD3XA8bMANOUxrxWRATXGVRV3lbQuAlkkrFBajde/T6QmyUD+DbvrOW5pte1IZHBp3xy5Q
	dqDaLqGvx4LtLQb2QtHgpSzoxosnKYKffkGrJGtazwZdKx5Lm4HS0CI1/cqyuYSBcgj/zOFrdX0
	zvx8bXJoQPloJYkoH9qO9LHXXmRebtyIhTeVhvsvtpBnthmEfym7fi0pq7b2NHSwWNizISiHq6X
	w/dA0VEya7XEPnuslHnGsvriY=
X-Google-Smtp-Source: AGHT+IEv6aRfuWteg9CkMupYi3aESqJksIkIawgSnCLh8bd8HFbrpV909yajnxOdzZbpUhAy/NMThA==
X-Received: by 2002:a17:90b:5348:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-34abd809190mr17284905a91.16.1766005103068;
        Wed, 17 Dec 2025 12:58:23 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7710a5f8sm11766a91.6.2025.12.17.12.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:58:22 -0800 (PST)
Date: Wed, 17 Dec 2025 13:58:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mst@redhat.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	virtualization@lists.linux.dev, xiaoxiang@xiaomi.com,
	Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: Re: [RFC PATCH 1/2] rpmsg: virtio_rpmsg_bus: allow the different
 vring size for send/recv
Message-ID: <aUMZayrdEIB6P90p@p14s>
References: <20251114184640.3020427-1-tanmay.shah@amd.com>
 <20251114184640.3020427-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114184640.3020427-2-tanmay.shah@amd.com>

Hi Tanmay,

On Fri, Nov 14, 2025 at 10:46:39AM -0800, Tanmay Shah wrote:
> From: Xiang Xiao <xiaoxiang781216@gmail.com>
>

This feature has been abandoned a long time ago - you own it now.
 
> it's useful if the communication throughput is different from each side
> 

Please provide a better changelog.

> Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 47 ++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 484890b4a6a7..cc26dfcc3e29 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -37,8 +37,9 @@
>   * @svq:	tx virtqueue
>   * @rbufs:	kernel address of rx buffers
>   * @sbufs:	kernel address of tx buffers
> - * @num_bufs:	total number of buffers for rx and tx
> - * @buf_size:   size of one rx or tx buffer
> + * @num_rbufs:	total number of buffers for rx
> + * @num_sbufs:	total number of buffers for tx
> + * @buf_size:	size of one rx or tx buffer
>   * @last_sbuf:	index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
>   * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> @@ -57,7 +58,8 @@ struct virtproc_info {
>  	struct virtio_device *vdev;
>  	struct virtqueue *rvq, *svq;
>  	void *rbufs, *sbufs;
> -	unsigned int num_bufs;
> +	unsigned int num_rbufs;
> +	unsigned int num_sbufs;
>  	unsigned int buf_size;
>  	int last_sbuf;
>  	dma_addr_t bufs_dma;
> @@ -112,7 +114,7 @@ struct virtio_rpmsg_channel {
>  /*
>   * We're allocating buffers of 512 bytes each for communications. The
>   * number of buffers will be computed from the number of buffers supported
> - * by the vring, upto a maximum of 512 buffers (256 in each direction).
> + * by the vring, up to a maximum of 256 in each direction.
>   *
>   * Each buffer will have 16 bytes for the msg header and 496 bytes for
>   * the payload.
> @@ -127,7 +129,7 @@ struct virtio_rpmsg_channel {
>   * can change this without changing anything in the firmware of the remote
>   * processor.
>   */
> -#define MAX_RPMSG_NUM_BUFS	(512)
> +#define MAX_RPMSG_NUM_BUFS	(256)
>  #define MAX_RPMSG_BUF_SIZE	(512)
>  
>  /*
> @@ -439,11 +441,8 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  	/* support multiple concurrent senders */
>  	mutex_lock(&vrp->tx_lock);
>  
> -	/*
> -	 * either pick the next unused tx buffer
> -	 * (half of our buffers are used for sending messages)
> -	 */
> -	if (vrp->last_sbuf < vrp->num_bufs / 2)
> +	/* either pick the next unused tx buffer */
> +	if (vrp->last_sbuf < vrp->num_sbufs)
>  		ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
>  	/* or recycle a used one */
>  	else
> @@ -878,19 +877,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	vrp->rvq = vqs[0];
>  	vrp->svq = vqs[1];
>  
> -	/* we expect symmetric tx/rx vrings */
> -	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
> -		virtqueue_get_vring_size(vrp->svq));
> -
>  	/* we need less buffers if vrings are small */
> -	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS / 2)
> -		vrp->num_bufs = virtqueue_get_vring_size(vrp->rvq) * 2;
> +	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS)
> +		vrp->num_rbufs = virtqueue_get_vring_size(vrp->rvq);
> +	else
> +		vrp->num_rbufs = MAX_RPMSG_NUM_BUFS;
> +
> +	if (virtqueue_get_vring_size(vrp->svq) < MAX_RPMSG_NUM_BUFS)
> +		vrp->num_sbufs = virtqueue_get_vring_size(vrp->svq);
>  	else
> -		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
> +		vrp->num_sbufs = MAX_RPMSG_NUM_BUFS;
>  
>  	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>  
> -	total_buf_space = vrp->num_bufs * vrp->buf_size;
> +	total_buf_space = (vrp->num_rbufs + vrp->num_sbufs) * vrp->buf_size;
>  
>  	/* allocate coherent memory for the buffers */
>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -904,14 +904,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
>  		bufs_va, &vrp->bufs_dma);
>  
> -	/* half of the buffers is dedicated for RX */
> +	/* first part of the buffers is dedicated for RX */
>  	vrp->rbufs = bufs_va;
>  
> -	/* and half is dedicated for TX */
> -	vrp->sbufs = bufs_va + total_buf_space / 2;
> +	/* and second part is dedicated for TX */
> +	vrp->sbufs = bufs_va + vrp->num_rbufs * vrp->buf_size;
>  
>  	/* set up the receive buffers */
> -	for (i = 0; i < vrp->num_bufs / 2; i++) {
> +	for (i = 0; i < vrp->num_rbufs; i++) {
>  		struct scatterlist sg;
>  		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
>  
> @@ -1001,7 +1001,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>  static void rpmsg_remove(struct virtio_device *vdev)
>  {
>  	struct virtproc_info *vrp = vdev->priv;
> -	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
> +	unsigned int num_bufs = vrp->num_rbufs + vrp->num_sbufs;
> +	size_t total_buf_space = num_bufs * vrp->buf_size;
>  	int ret;
>  
>  	virtio_reset_device(vdev);
> -- 
> 2.34.1
> 
