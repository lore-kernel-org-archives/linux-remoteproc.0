Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF146C852
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 16:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589477; cv=none; b=W+YRROYpGgAc/W6v+PxLcrB2UNmB8QZtfmUz+3KBJU4Up+wGKRaRwnNoL1nNn3g50Leh0vcS2ru2SSArfwGsalROt28tRBqZa7MpTkcO5n6RWEorHVKQ4Xh8AElufGDlz5+ufYIBe9NLE5SrQiUelCOOIzaT9CGC3xAKnRtxh+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589477; c=relaxed/simple;
	bh=IDV4H4g1LVOutyoq+AMnDDe0+94vUXKqDsOiqU8Eis0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbsHvI19EmgIvfZxrco5YC0EAqdM7tEGjZgtLNr4OlzBW7vjs/s41MTnjRNlmRrMZoeCkWaZl4md6awVPeoNBk4kas9TfNqBJPT/l1wrOepSoVTnFrJkx79CZKORRT0WF2djq03oW/u8ybdAqTeeK+dsZc+rZ1+g9zkVhmcWe68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZ8IBSbn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZ8IBSbn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d560775ca2so30207815ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787589474; x=1788194274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQolxFmkjS0IJxg7FinR8t7npRtBVwWiv0lvTrwQF9M=;
        b=gZ8IBSbnyrx9TE7HbPkRLifrbFtaeUSeBHBKrw3W/WyScRyCBUvJw0lFUITQXeYudw
         YgdtgLqBjbIqKlp1pHG8HrBQcwtzAKr+Zk1GuFi5fLi8ZiereUDzYTQKvQekxYU7Dvb4
         FqtxkP+h2v9pt3inv7D+0FUHln+NZNBe0mclX3gNTJX68rXTxNQdqqIAZeIiQ5j7ZSNf
         r6aJ/2s4MY9hj/j9Np2RyqNT5hDDzVO6JJxq0u3l2+ytZV/0wld6TKDi6BfPHcvvuMYO
         zIliMije9auM8tnG42NS0ZbcwVFxY60jsAw9hqkKUyR/+/v/4XMMpo/xT+7loK5BsP1r
         7ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589474; x=1788194274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQolxFmkjS0IJxg7FinR8t7npRtBVwWiv0lvTrwQF9M=;
        b=W3nV7K0mPQEL/OPNb8juKz+1Wrh0Dqsl+u/irfznHoxZuyFITMBjGu2aPh31WjMZC+
         HZg3M0pXFEjFtIJU9ZeF8ojxpNIW1wor8GypbWk2VaoewTx+odgMHrtY27mNAxC59Qo0
         4yGurs4+TO/RdpCgp7mMuWYVDzuuHVQk/w0IJ5NJ7CoD9ApnBfFywUcC3nveQPMoMnU/
         lcKW33u55iiMDOAV+nJ0bfV6SIXmMUBjUWgWmwKjJoEgRH7PfOKAdlVE8pNJbqpyt0DG
         pCL+/TK7Igf61z6ZYldtK8LVf4fHFfH+99VlxzDx0JQpz9rI1PoogwGmV2iPS/fusaLY
         d77w==
X-Forwarded-Encrypted: i=1; AHgh+RoI6L1CosyxeXbeymZhDU9cTjPP6u9JKsRLWmcL2uzhpYiuEaYbLKY2zvcDe5d3ZXnYsnviXZmRncgmY1qDI7//@vger.kernel.org
X-Gm-Message-State: AFuF++mN44xDT+ejeZgfHp+AZtbnBIj0hgk918+sLdeABnD/xHnGROH3
	RZl8cek3nReZxnAn4g9UN1MieoZBngwRsgRrAoMDpRTHUj/Mj8V+CYLZ+9BTJH+vC6o=
X-Gm-Gg: AR+sD11wYpE9YLQT1M08Cj5Y1eanmiiQFKEkdIvd+/xvARorBqbqCnggToPDKAW9EXI
	1rZpmf8R8/w+1tAL1eWr7lVm8pYnD4hJLNYxJEUCXEcJUa8UCgJzEhFD4fBjOlPfD2+fmlgM3tw
	UpXqxk88S2Gj0CSemdje8X4Klp6nWU2Dkst2rZtz7hpvzq5oWUgBI/I8iUzPtkk3cnuipgb5x8q
	0uMCDN12ggEEnvEZwogHNL4mfKCja3k/yEwFHRdcRov/s8CdK0PojX/1oYalzW1/JWqu5b6oxYZ
	8pG3QaijkBosN2F8sg4wwcH/FN9GIf/EZudmDD4JQyHdc67lmgBN6d1wZChPxR0uYtOksBdcQyj
	625ABuDIHbwGz3d6DwykDfpQOfE3lFqBqwPO41jjA0s+dw9AooWZSA68pLxQqizwj+DeIW0KxpW
	TUqa/5Bj11c4TpfKk2hM8o9fekplLISrQQDIbcSkKKLxSCmFzsJSlwYV1Ip+H/+2YL
X-Received: by 2002:a17:903:fa6:b0:2d6:5beb:8692 with SMTP id d9443c01a7336-2d670bb5042mr396916485ad.6.1787589474321;
        Mon, 24 Aug 2026 09:37:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82f2:24c5:571b:87b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67678c417sm19676815ad.20.2026.08.24.09.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:37:53 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:37:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <aoxzX1U_a_g7VEim@p14s>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
 <20260814044238.518296-4-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814044238.518296-4-tanmay.shah@amd.com>

On Thu, Aug 13, 2026 at 09:42:36PM -0700, Tanmay Shah wrote:
> 512 bytes isn't always suitable for all case, let firmware
> maker decide the best value from resource table.
> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> changes in v6:
>   - remove buffer alignment from config space
> 
> Changes in v5:
> 
>   - fix documentation about alignment of the buffer size
>   - change version field from u16 to u8
>   - remove buffer alignment check
>   - Separate buffer alignment vs MTU of a single buffer
>   - Use buffer alignment only to get next buffer address at alignment
>     boundary
> 
> Changes in v4:
> 
>   - Introduce new patch to modify rpmsg.rst documentation
>   - check version is always 1.
>   - check size field is same as size of struct virtio_rpmsg_config
>   - introduce alignment field
>   - check alignment field is power of 2
>   - check tx and rx buf size is aligned with alignment passed in the
>     structure
> 
> Changes in v3:
> 
>   - change version field from u16 to u8
>   - introduce size field in the rpmsg_virtio_config structure
>   - check version field is set to any non-zero value.
>   - check size field is not 0.
>   - Remove field for private config, as not needed for now.
>   - add documentation of rpmsg_virtio_config structure
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 90 +++++++++++++++++++++++-------
>  include/linux/rpmsg/virtio_rpmsg.h | 41 ++++++++++++++
>  2 files changed, 112 insertions(+), 19 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index c84b6cec9caf..4235e09dc3b7 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -20,6 +20,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/rpmsg/byteorder.h>
>  #include <linux/rpmsg/ns.h>
> +#include <linux/rpmsg/virtio_rpmsg.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> @@ -39,7 +40,8 @@
>   * @tx_bufs:	kernel address of tx buffers
>   * @num_rx_buf: total number of rx buffers
>   * @num_tx_buf: total number of tx buffers
> - * @buf_size:   size of one rx or tx buffer
> + * @rx_buf_size: size of one rx buffer
> + * @tx_buf_size: size of one tx buffer
>   * @last_tx_buf: index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
>   * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> @@ -59,7 +61,8 @@ struct virtproc_info {
>  	void *rx_bufs, *tx_bufs;
>  	unsigned int num_rx_buf;
>  	unsigned int num_tx_buf;
> -	unsigned int buf_size;
> +	unsigned int rx_buf_size;
> +	unsigned int tx_buf_size;
>  	int last_tx_buf;
>  	dma_addr_t bufs_dma;
>  	struct mutex tx_lock;
> @@ -68,9 +71,6 @@ struct virtproc_info {
>  	wait_queue_head_t sendq;
>  };
>  
> -/* The feature bitmap for virtio rpmsg */
> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> -
>  /**
>   * struct rpmsg_hdr - common header for all rpmsg messages
>   * @src: source address
> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>   * processor.
>   */
>  #define MAX_RPMSG_NUM_BUFS	(256)
> -#define MAX_RPMSG_BUF_SIZE	(512)
> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
>  
>  /*
>   * Local addresses are dynamically allocated on-demand.
> @@ -443,7 +443,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  
>  	/* either pick the next unused tx buffer */
>  	if (vrp->last_tx_buf < vrp->num_tx_buf)
> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
> +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>  	/* or recycle a used one */
>  	else
>  		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -513,7 +513,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  	 * messaging), or to improve the buffer allocator, to support
>  	 * variable-length buffer sizes.
>  	 */
> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>  		dev_err(dev, "message is too big (%d)\n", len);
>  		return -EMSGSIZE;
>  	}
> @@ -646,7 +646,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  	struct rpmsg_device *rpdev = ept->rpdev;
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  
> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>  }
>  
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> @@ -672,7 +672,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * We currently use fixed-sized buffers, so trivially sanitize
>  	 * the reported payload length.
>  	 */
> -	if (len > vrp->buf_size ||
> +	if (len > vrp->rx_buf_size ||
>  	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
> @@ -705,7 +705,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>  
>  	/* publish the real size of the buffer */
> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>  
>  	/* add the buffer back to the remote processor's virtqueue */
>  	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> @@ -823,6 +823,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	int err = 0, i;
>  	size_t total_buf_space;
>  	bool notify;
> +	u8 version;
> +	u16 size;
>  
>  	vrp = kzalloc_obj(*vrp);
>  	if (!vrp)
> @@ -854,9 +856,59 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	else
>  		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>  
> -	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> +	/*
> +	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
> +	 * size from virtio device config space from the resource table.
> +	 * If the feature is not supported, then assign default buf size.
> +	 */
> +	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     version, &version);
> +
> +		/* for now we support only v1 */
> +		if (version != RPMSG_VDEV_CONFIG_V1) {
> +			dev_err(&vdev->dev,
> +				"unsupported vdev config version %u\n", version);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* size of the config space must match */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     size, &size);
> +		if (size != sizeof(struct virtio_rpmsg_config)) {
> +			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
> +				size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* note: tx and rx are defined from remote view */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     txbuf_size, &vrp->rx_buf_size);
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rxbuf_size, &vrp->tx_buf_size);
> +
> +		/* The buffers must hold at least the rpmsg header */
> +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
> +				vrp->rx_buf_size, vrp->tx_buf_size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		dev_dbg(&vdev->dev,
> +			"vdev config: ver=%u, rx sz = 0x%x, tx sz = 0x%x\n",
> +			version, vrp->rx_buf_size, vrp->tx_buf_size);
> +	} else {
> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +	}
>  
> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +			  (vrp->num_tx_buf * vrp->tx_buf_size);
>  
>  	/* allocate coherent memory for the buffers */
>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -873,15 +925,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	/* first part of the buffers is dedicated for RX */
>  	vrp->rx_bufs = bufs_va;
>  
> -	/* and second part is dedicated for TX */
> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>  
>  	/* set up the receive buffers */
>  	for (i = 0; i < vrp->num_rx_buf; i++) {
>  		struct scatterlist sg;
> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>  
> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>  
>  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>  					  GFP_KERNEL);
> @@ -964,8 +1015,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>  static void rpmsg_remove(struct virtio_device *vdev)
>  {
>  	struct virtproc_info *vrp = vdev->priv;
> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> -	size_t total_buf_space = num_bufs * vrp->buf_size;
> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +				 (vrp->num_tx_buf * vrp->tx_buf_size);
>  	int ret;
>  
>  	virtio_reset_device(vdev);
> @@ -991,6 +1042,7 @@ static struct virtio_device_id id_table[] = {
>  
>  static unsigned int features[] = {
>  	VIRTIO_RPMSG_F_NS,
> +	VIRTIO_RPMSG_F_BUFSZ,
>  };
>  
>  static struct virtio_driver virtio_ipc_driver = {
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 000000000000..e28144253a12
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Pinecone Inc. 2019
> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> + * Copyright (C) Advanced Micro Devices, Inc. 2026
> + */
> +
> +#ifndef _LINUX_VIRTIO_RPMSG_H
> +#define _LINUX_VIRTIO_RPMSG_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_types.h>
> +
> +/* The feature bitmap for virtio rpmsg */
> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */

"RP advertises RX/TX buffer sizes from config space"

> +
> +/* Version of struct virtio_rpmsg_config understood by this driver */
> +#define RPMSG_VDEV_CONFIG_V1	1
> +
> +/**
> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> + *
> + * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> + * @size:	size of this structure in bytes.
> + * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
> + * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
> + *
> + * This is the configuration structure shared by the device and the driver,
> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> + * the structure is naturally 32-bit aligned.
> + */
> +struct virtio_rpmsg_config {
> +	u8 version;
> +	__virtio16 size;
> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +} __packed;
> +
> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> -- 
> 2.43.0
> 
