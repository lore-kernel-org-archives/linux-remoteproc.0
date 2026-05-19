Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F433B6D3
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779212279; cv=none; b=nqIoK9xzo00I9fS6fPNpcLCWC8SvezW6Uqop+NRGFTv0IRUF6Fd/svYh4Y6f5NB1ESJavGzImKZlUV3wG7G/U0f3Jgfa/M23iVMGF95MPipADCcZva7Vx2yr6oq20mHGUlu8fVr8Sc/5hWEPK7OkN1+HHgc8V9F+RjY3Dtfh5Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779212279; c=relaxed/simple;
	bh=xZo+m/xziB0TGvh5DtUeTfPYJ3BfImPYb5LSWKNhqVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6k5OhLtps1T3fd5Em9xnO5dpJdlnv0PGJYo7eWe2i2JJQZrLIVA/BBqc/ssnbewGk0t+MI/oe9qgc8zOFXoQATojvW/4dyJ/Chcff35H0sDoDSt2RCIPvNBMPZp1S0MmdJNCOiUqtPuapXtHPUmZ95nus6zYXWBTA/W/aXdfUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMTqE+/f; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMTqE+/f"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7980c060cfso1747496a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 10:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779212277; x=1779817077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKkPwX92S6WzEL1IBVHU/ukhAZDvDLC9/oO6TFUyouk=;
        b=VMTqE+/fpOWjhpacNNLzzjvvnPdDv2i8rccJwO4vAgQ+vjZllBNShcxPrKvS0r1ycO
         Yk3y5zJzDMiD1ZApxZa2DAOJeLTEenjrGMDzy4By5p2iLqpIY6r1n+QnIh4apCBDfeIG
         BKj6lvWynnjSpnTsqN7u5cM3qwALJ95/VeS8DPqK8sMfpyw+8GoTB+MJygEMuPRSkE0m
         tqKCFQoic+HThaAPpTDZpEMtF5T/wsvn7edM5WZB8TJBAS9C92d3AGuSY6dl0Ocd4OLS
         /j0aPPHpzFgl2zeMpbAxNEKCbYpbHsED1Y0d7eyQS5I1BZX+GzXRq0CDO9TE81HRJOtQ
         23Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779212277; x=1779817077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKkPwX92S6WzEL1IBVHU/ukhAZDvDLC9/oO6TFUyouk=;
        b=FRxjqZ01OZT5Pkrb/tuEPyu/5VTyhGyd9xbjqeoPjEGsQ6lgCVNGV3wBQPTWISM76M
         uYkaYr35LbMHuarIRaM5x6wlUtzAB8LjkV8pD5T5P/9Ci9GtAk3iKD0giZ+zKmNwp0dr
         ctZPQiUvhkZAaLKYlEOkoE1WnVPKtFlhr1NYOwJh/poA4mmdy2ZksyFsSO7lesyBYyro
         UHdW9djG4nCGeMmCxP/9pFJYg0oa5EBGyWCjVxg4JuOZSNWURtYZ6Jge5Qq7/7RXhWVV
         uBfUMtTQri8O/GdS8eaOkAArvIHO5Jcba9ekhqy6LO1Ghm1yBMT1+SOqIKrmqcULGnmQ
         pbmA==
X-Forwarded-Encrypted: i=1; AFNElJ8SAktf9grkuyOyVnpSkh3fMpC5k6Nst6vtJ5bs2tFcnqlAwKySLnlSBq3aibHIHPrgDb1ltsBw7ZssPVMGBwM1@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAddO1KGG8VcVPlHdEsMCAfe03UUXjCYfiZCjJ0twoJV/W4cn
	iaaWjAKpDsNjDII/A9yIuY517qta9sL411aD68PR908NA1G0vcouijfF5MVw9QUj33OB+M6mRQX
	XRvXg
X-Gm-Gg: Acq92OFiPk37QIZQH11sOq/+BMhrSzLHsJKO8ntXCAO9o1FOWhx1FrV5Lz8gdOz2wjB
	4I9Qfd9fz3OGy9bYsrDuLOdr8wG0YXUifo+PDzQk0ZkdJm3107uLbhVVUIEuvfiHVgsMj0MZXD9
	SJwA8DJzZD9gdbt9wIC1lNdj7Sk4fFERs3gKgV4Nq0bqRwqYkalbu0saCA2P03UINQ/HwEJ1tDb
	M8AHhgxsbMf6NEU6RGXwIqUtUpemMbWXo3aCCnjuNxeK3wsrQpchluHbd+TA4z77dMHHdPoyutr
	Uu0VUQFidBtw+zrLGPAi8Wl1U6Vznd08h45uMeQ71pmc/ElfWBb8n8+CcxqI1LgSvplUzht17ki
	+7k9reM5ih9RGn6BFyLBZOD7iZreWsMLs4LAJ/Fya4ykFqJtou88CQW4YMQhcRFU/WJ63fGNAQA
	Mvng9zYMpzvw918AuGYqLQNWEM5F/25I3DvA2xtw==
X-Received: by 2002:a17:903:94c:b0:2bd:a529:4b5e with SMTP id d9443c01a7336-2bda5294cdemr150224785ad.41.1779212277186;
        Tue, 19 May 2026 10:37:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:17db:e96e:b240:ed21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm198290215ad.66.2026.05.19.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:37:56 -0700 (PDT)
Date: Tue, 19 May 2026 11:37:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, arnaud.pouliquen@foss.st.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <agyf8hLnh7K3wtcS@p14s>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com>
 <agyfr-pxwQ4oKMAF@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agyfr-pxwQ4oKMAF@p14s>

On Tue, May 19, 2026 at 11:36:47AM -0600, Mathieu Poirier wrote:
> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
> > 512 bytes isn't always suitable for all case, let firmware
> > maker decide the best value from resource table.
> > enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> > 
> > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > ---
> > 
> > Test done:
> >   - Verify this patch works with the existing firmware
> >   - Verify this patch works with the firmware that configures
> >     differt tx & rx buf size
> > 
> > Changes in v2:
> >   - %s/sbuf_size/tx_buf_size/
> >   - %s/rbuf_size/rx_buf_size/
> >   - fix typo
> >   - do not use ALIGN on buf size, rely on allocator
> >   - make err msg more explicit, %s/vdev config:/bad vdev config/
> >   - fix license and add AMD copyrights in the header virtio_rpmsg.h
> >   - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
> >   - use __virtio32 over __u32
> >   - add version field to virtio rpmsg config structure
> >   - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> > 
> >  drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
> >  include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
> >  2 files changed, 79 insertions(+), 18 deletions(-)
> >  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index e59d8cf9b975..8116d94413cc 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/rpmsg.h>
> >  #include <linux/rpmsg/byteorder.h>
> >  #include <linux/rpmsg/ns.h>
> > +#include <linux/rpmsg/virtio_rpmsg.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/sched.h>
> > @@ -39,7 +40,8 @@
> >   * @tx_bufs:	kernel address of tx buffers
> >   * @num_rx_buf:	total number of buffers for rx
> >   * @num_tx_buf:	total number of buffers for tx
> > - * @buf_size:	size of one rx or tx buffer
> > + * @rx_buf_size: size of one rx buffer
> > + * @tx_buf_size: size of one tx buffer
> >   * @last_sbuf:	index of last tx buffer used
> >   * @bufs_dma:	dma base addr of the buffers
> >   * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> > @@ -59,7 +61,8 @@ struct virtproc_info {
> >  	void *rx_bufs, *tx_bufs;
> >  	unsigned int num_rx_buf;
> >  	unsigned int num_tx_buf;
> > -	unsigned int buf_size;
> > +	unsigned int rx_buf_size;
> > +	unsigned int tx_buf_size;
> >  	int last_sbuf;
> >  	dma_addr_t bufs_dma;
> >  	struct mutex tx_lock;
> > @@ -68,9 +71,6 @@ struct virtproc_info {
> >  	wait_queue_head_t sendq;
> >  };
> >  
> > -/* The feature bitmap for virtio rpmsg */
> > -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> > -
> >  /**
> >   * struct rpmsg_hdr - common header for all rpmsg messages
> >   * @src: source address
> > @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
> >   * processor.
> >   */
> >  #define MAX_RPMSG_NUM_BUFS	(256)
> > -#define MAX_RPMSG_BUF_SIZE	(512)
> > +#define DEFAULT_RPMSG_BUF_SIZE	(512)
> >  
> >  /*
> >   * Local addresses are dynamically allocated on-demand.
> > @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >  
> >  	/* either pick the next unused tx buffer */
> >  	if (vrp->last_sbuf < vrp->num_tx_buf)
> > -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
> > +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
> >  	/* or recycle a used one */
> >  	else
> >  		ret = virtqueue_get_buf(vrp->svq, &len);
> > @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >  	 * messaging), or to improve the buffer allocator, to support
> >  	 * variable-length buffer sizes.
> >  	 */
> > -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> > +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
> >  		dev_err(dev, "message is too big (%d)\n", len);
> >  		return -EMSGSIZE;
> >  	}
> > @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> >  	struct rpmsg_device *rpdev = ept->rpdev;
> >  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> >  
> > -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> > +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
> >  }
> >  
> >  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> > @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  	 * We currently use fixed-sized buffers, so trivially sanitize
> >  	 * the reported payload length.
> >  	 */
> > -	if (len > vrp->buf_size ||
> > +	if (len > vrp->rx_buf_size ||
> >  	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
> >  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
> >  		return -EINVAL;
> > @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  		dev_warn_ratelimited(dev, "msg received with no recipient\n");
> >  
> >  	/* publish the real size of the buffer */
> > -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> > +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
> >  
> >  	/* add the buffer back to the remote processor's virtqueue */
> >  	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> > @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	int err = 0, i;
> >  	size_t total_buf_space;
> >  	bool notify;
> > +	u16 version;
> >  
> >  	vrp = kzalloc_obj(*vrp);
> >  	if (!vrp)
> > @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	else
> >  		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
> >  
> > -	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> > +	/*
> > +	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
> > +	 * size from virtio device config space from the resource table.
> > +	 * If the feature is not supported, then assign default buf size.
> > +	 */
> > +	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> > +		/* note: virtio_rpmsg_config is defined from remote view */
> > +		version = 0;
> > +		virtio_cread(vdev, struct virtio_rpmsg_config,
> > +			     version, &version);
> > +		virtio_cread(vdev, struct virtio_rpmsg_config,
> > +			     txbuf_size, &vrp->rx_buf_size);
> > +		virtio_cread(vdev, struct virtio_rpmsg_config,
> > +			     rxbuf_size, &vrp->tx_buf_size);
> > +
> 
> A check is also needed to make sure the version received from the resource table
> is '0'.
> 
> > +		/* The buffers must hold at least the rpmsg header */
> > +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> > +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> > +			dev_err(&vdev->dev,
> > +				"bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
> > +				vrp->rx_buf_size, vrp->tx_buf_size);
> > +			err = -EINVAL;
> > +			goto vqs_del;
> > +		}
> > +
> > +		dev_dbg(&vdev->dev,
> > +			"vdev config: version=%d, rx buf sz = 0x%x, tx buf sz = 0x%x\n",
> > +			version, vrp->rx_buf_size, vrp->tx_buf_size);
> > +	} else {
> > +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> > +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> > +	}
> >  
> > -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
> > +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> > +			  (vrp->num_tx_buf * vrp->tx_buf_size);
> >  
> >  	/* allocate coherent memory for the buffers */
> >  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> > @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	vrp->rx_bufs = bufs_va;
> >  
> >  	/* and second part is dedicated for TX */
> > -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> > +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
> >  
> >  	/* set up the receive buffers */
> >  	for (i = 0; i < vrp->num_rx_buf; i++) {
> >  		struct scatterlist sg;
> > -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> > +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
> >  
> > -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> > +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
> >  
> >  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >  					  GFP_KERNEL);
> > @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
> >  static void rpmsg_remove(struct virtio_device *vdev)
> >  {
> >  	struct virtproc_info *vrp = vdev->priv;
> > -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> > -	size_t total_buf_space = num_bufs * vrp->buf_size;
> > +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> > +				 (vrp->num_tx_buf * vrp->tx_buf_size);
> >  	int ret;
> >  
> >  	virtio_reset_device(vdev);
> > @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
> >  
> >  static unsigned int features[] = {
> >  	VIRTIO_RPMSG_F_NS,
> > +	VIRTIO_RPMSG_F_BUFSZ,
> >  };
> >  
> >  static struct virtio_driver virtio_ipc_driver = {
> > diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> > new file mode 100644
> > index 000000000000..285918be68b9
> > --- /dev/null
> > +++ b/include/linux/rpmsg/virtio_rpmsg.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) Pinecone Inc. 2019
> > + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> > + * Copyright (C) Advanced Micro Devices, Inc.
> > + */
> > +
> > +#ifndef _LINUX_VIRTIO_RPMSG_H
> > +#define _LINUX_VIRTIO_RPMSG_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/virtio_types.h>
> > +
> > +/* The feature bitmap for virtio rpmsg */
> > +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> > +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
> > +
> > +struct virtio_rpmsg_config {
> > +	__virtio16 version;
> > +	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> > +	__virtio32 txbuf_size;
> > +	__virtio32 rxbuf_size;
> > +	__virtio32 reserved[14]; /* Reserve for the future use */
> 
> 66 byte for the configuratio space?  I'm puzzled about the reserved[14], how did
> you come up with that number?  
> 
> The rest looks good to me.

... and I am done reviewing this set.

> 
> > +	/* Put the customize config here */
> > +} __packed;
> > +
> > +#endif /* _LINUX_VIRTIO_RPMSG_H */
> > -- 
> > 2.34.1
> > 
