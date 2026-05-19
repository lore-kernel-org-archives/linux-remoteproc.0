Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687340911D
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209829; cv=none; b=oDgQ4q0XDk3pWSniyMF7NfD6bmR0OulrpIxKRxXwkwksFbYx7sNL7Cy0gZOz3IyIwOHNCK2jE7/8Jo3YTnDPg2QjS0i48AyZQdd0q0W/BGIMytdm+QUzirc4zo1xl4Bnnrlrxfr4vUi9s64ogxzElXzGtVwgxaTLTsNNx3oyb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209829; c=relaxed/simple;
	bh=rACc8/WloSOC/Zd2rsPPzcyGTe2V6fn1OtG0ZQC9W9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFSbgH6/qmzRqRye3qWCV2VsLclba2BGzmnW0B98sVGjzMPsjecCjVRhJq+LgwVwqxaRwFnWBbZjTkpEodzqk+VWj8Hc8a9jXWS04F6240vRJHZ9mOL+iJ7SuPSuo8BSywib9QM4tyLCQLTXRlDIGka2EEvu7BpMbNRidYz4tEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvSK3FrB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvSK3FrB"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c827313dac0so2140894a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779209827; x=1779814627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yPjxDDu/80GvSgD9GobJGh4VGw6zbzyMUSWm1FoK9g=;
        b=cvSK3FrB+XKLd2QDlmHsVdU8FqYTlpWuNbXo1H6faXB3ASVE0zHncARQfNpe8ZiWvY
         iBuQfTymS341drG9BnbzH07hqhLc3Kpjnm0hpH854Z79qQZpAclpl4ZV5t9kRghty81Q
         32BO2QCro/One7WEuDJdIikZNXRaVQYJRsHrnPoK1uxOKdqpj2K9ZdFuo/yVZfgZrZ0p
         GfczmbM74XsGO7+RXVB8T4R7jOJMc7+Ark480fQO/pY2r1uLTNQHkpLCYIJh1Xpt/+Jg
         jlmhFp3OGmgP3HTRF5iHuoJeh/jC7YZ8aoNFUe4IVmmkqDarJBoDK83Rfgj+ezNiQ3fw
         3JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779209827; x=1779814627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yPjxDDu/80GvSgD9GobJGh4VGw6zbzyMUSWm1FoK9g=;
        b=aoQKZWo4a817UwKZN8zgu06qh/qTZ0CA+e2QUyWhnISjwOWYPuemEIWozeFSiFrLIZ
         xZMDLKK0k88Wh4m4LzCSVl+AOoUpHyHNHVDUvrk1sgbALUs+nIZli2lsaeTHu5IIPIgu
         VWpdM1jzG/L9S2E2dVaHcj086igwmSAXqAfAOn4Pgq0vk+YA727Vw1izvYQq2itIr91F
         8EB6KtjEbMNl3Jrvon77UZeOFaDZYGLFXvXLYsxrWROpeLcKo0hpyu9PjvQTnXNzpoXz
         iA0fY+IN78vC8ti5EhMwDF+LOTNnyTMClzymEaCHqblgkRe12vs6hI+VmbqTKqhkEp5s
         itTw==
X-Forwarded-Encrypted: i=1; AFNElJ8+pVCgGGGd3BaRUfEWL/y3as/8C1H7PNObx42OCmpW0qbfp3qykkeLrOsIqjU4x7TXBILqOcDv/YG0NiCgiAHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqqEd7HeZLAo4z+rLDh9i6ZHzTWOO11YLxOyZAGoohFi2d+nht
	yt0hNg+yBOnRmH1ngszjxWAptJNSnqfTx5legUS2NdOGz2Am48RyCTQ7j6zIqWrm0OY=
X-Gm-Gg: Acq92OGUcNhCvoUO6stoGGEXi+FgB/b1Ed/0UcOaIwlcfg9f7Iubv5JHEfAwrJQHcEE
	jDugp+LJ1eeTDugtwZH7aT/F3ycm3tX13RukbkZ0BH5BrP9UxHVqTKkbZpYLtti0My6WFZ37Pht
	zJpXO2UPOFSeAjLEe5IDh0xI8eH6AJc2LOGtgMaURJcOhnryhdOID82lERfxHYHChQBr5LUDZfG
	KcSQTE0+kB8TBfBsBFw0lfJ9i/pW0b+tt4j2Bhp5T3mWbb6Ohe9UO5AcHH8qRyT6VILHr879o3m
	wApDBj4JpamADYL+8sUwVh7y4BgmuMU5R8MH+oGyq7iM1xSgdffDdX5oLHGQkWEoDgh10t7GnL/
	QizZUMSgxasBgE4wtgf2kSsOz0n12TokALr25ZC9MKgrPRQBmSp9yH/g3Q5IBo7cblaWTxZp4ds
	srJ1s127sednmWpSxaiJjyMa9lT6E=
X-Received: by 2002:a17:90a:d40b:b0:368:4942:50c4 with SMTP id 98e67ed59e1d1-3692363eecamr20596217a91.17.1779209826535;
        Tue, 19 May 2026 09:57:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:17db:e96e:b240:ed21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm16484464a12.21.2026.05.19.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:57:05 -0700 (PDT)
Date: Tue, 19 May 2026 10:57:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, arnaud.pouliquen@foss.st.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rpmsg: virtio_rpmsg_bus: allow different size of
 tx and rx bufs
Message-ID: <agyWX-y2GShRXQ_J@p14s>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429161052.528015-2-tanmay.shah@amd.com>

Hi Tanmay

(Apologies for the late review)

On Wed, Apr 29, 2026 at 09:10:51AM -0700, Tanmay Shah wrote:
> Current design allocates memory for tx and rx buffers equally. The
> throughput can be increased if the user is allowed to configure number
> of tx and rx buffers as required. Hence, do not split number of tx & rx
> buffers into half, but decide based on respective vring size.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Test performed:
>   - Test this patch with existing firmware as it is, rpmsg working.
> 
> Changes in v2:
>   - Change author
>   - fix commit message with better explanation
>   - %s/sbuf/tx_buf
>   - %s/rbuf/rx_buf
>   - %s/num_rbuf/num_rx_buf/
>   - %s/num_sbuf/num_tx_buf/

Please split this patch in two parts - one to do the refactoring of the
tx/rx_buf and another one for the varying size.

> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 68 ++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 5ae15111fb4f..e59d8cf9b975 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -35,13 +35,14 @@
>   * @vdev:	the virtio device
>   * @rvq:	rx virtqueue
>   * @svq:	tx virtqueue
> - * @rbufs:	kernel address of rx buffers
> - * @sbufs:	kernel address of tx buffers
> - * @num_bufs:	total number of buffers for rx and tx
> - * @buf_size:   size of one rx or tx buffer
> + * @rx_bufs:	kernel address of rx buffers
> + * @tx_bufs:	kernel address of tx buffers
> + * @num_rx_buf:	total number of buffers for rx
> + * @num_tx_buf:	total number of buffers for tx
> + * @buf_size:	size of one rx or tx buffer
>   * @last_sbuf:	index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
> - * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
> + * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
>   *		sending a message might require waking up a dozing remote
>   *		processor, which involves sleeping, hence the mutex.
>   * @endpoints:	idr of local endpoints, allows fast retrieval
> @@ -55,8 +56,9 @@
>  struct virtproc_info {
>  	struct virtio_device *vdev;
>  	struct virtqueue *rvq, *svq;
> -	void *rbufs, *sbufs;
> -	unsigned int num_bufs;
> +	void *rx_bufs, *tx_bufs;
> +	unsigned int num_rx_buf;
> +	unsigned int num_tx_buf;
>  	unsigned int buf_size;
>  	int last_sbuf;
>  	dma_addr_t bufs_dma;
> @@ -110,7 +112,7 @@ struct virtio_rpmsg_channel {
>  /*
>   * We're allocating buffers of 512 bytes each for communications. The
>   * number of buffers will be computed from the number of buffers supported
> - * by the vring, upto a maximum of 512 buffers (256 in each direction).
> + * by the vring, up to a maximum of 256 in each direction.
>   *
>   * Each buffer will have 16 bytes for the msg header and 496 bytes for
>   * the payload.
> @@ -125,7 +127,7 @@ struct virtio_rpmsg_channel {
>   * can change this without changing anything in the firmware of the remote
>   * processor.
>   */
> -#define MAX_RPMSG_NUM_BUFS	(512)
> +#define MAX_RPMSG_NUM_BUFS	(256)
>  #define MAX_RPMSG_BUF_SIZE	(512)
>  
>  /*
> @@ -440,12 +442,9 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  
>  	mutex_lock(&vrp->tx_lock);
>  
> -	/*
> -	 * either pick the next unused tx buffer
> -	 * (half of our buffers are used for sending messages)
> -	 */
> -	if (vrp->last_sbuf < vrp->num_bufs / 2)
> -		ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
> +	/* either pick the next unused tx buffer */
> +	if (vrp->last_sbuf < vrp->num_tx_buf)
> +		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>  	/* or recycle a used one */
>  	else
>  		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -631,11 +630,10 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  
>  	/*
>  	 * check for a free buffer, either:
> -	 * - we haven't used all of the available transmit buffers (half of the
> -	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
> +	 * - we haven't used all of the available transmit buffers or,
>  	 * - we ask the virtqueue if there's a buffer available
>  	 */
> -	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
> +	if (vrp->last_sbuf < vrp->num_tx_buf ||
>  	    !virtqueue_enable_cb(vrp->svq))
>  		mask |= EPOLLOUT;
>  
> @@ -846,19 +844,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
> +		vrp->num_rx_buf = virtqueue_get_vring_size(vrp->rvq);
> +	else
> +		vrp->num_rx_buf = MAX_RPMSG_NUM_BUFS;
> +
> +	if (virtqueue_get_vring_size(vrp->svq) < MAX_RPMSG_NUM_BUFS)
> +		vrp->num_tx_buf = virtqueue_get_vring_size(vrp->svq);
>  	else
> -		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
> +		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>  
>  	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>  
> -	total_buf_space = vrp->num_bufs * vrp->buf_size;
> +	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
>  
>  	/* allocate coherent memory for the buffers */
>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -872,16 +871,16 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
>  		bufs_va, &vrp->bufs_dma);
>  
> -	/* half of the buffers is dedicated for RX */
> -	vrp->rbufs = bufs_va;
> +	/* first part of the buffers is dedicated for RX */
> +	vrp->rx_bufs = bufs_va;
>  
> -	/* and half is dedicated for TX */
> -	vrp->sbufs = bufs_va + total_buf_space / 2;
> +	/* and second part is dedicated for TX */
> +	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>  
>  	/* set up the receive buffers */
> -	for (i = 0; i < vrp->num_bufs / 2; i++) {
> +	for (i = 0; i < vrp->num_rx_buf; i++) {
>  		struct scatterlist sg;
> -		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> +		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>  
>  		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>  
> @@ -966,7 +965,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>  static void rpmsg_remove(struct virtio_device *vdev)
>  {
>  	struct virtproc_info *vrp = vdev->priv;
> -	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
> +	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> +	size_t total_buf_space = num_bufs * vrp->buf_size;
>  	int ret;
>  
>  	virtio_reset_device(vdev);
> @@ -980,7 +980,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
>  	vdev->config->del_vqs(vrp->vdev);
>  
>  	dma_free_coherent(vdev->dev.parent, total_buf_space,
> -			  vrp->rbufs, vrp->bufs_dma);
> +			  vrp->rx_bufs, vrp->bufs_dma);
>  
>  	kfree(vrp);
>  }
> -- 
> 2.34.1
> 
