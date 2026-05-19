Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07AB2E9ED6
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779212213; cv=none; b=K5kT6V4G+2IOk8wArMJYnY6WzA+LzjNss6taoQ9rFl9yf7o5at6161Ix/2+Hte7bRwdzcGpvcVzRVCwYJ54/0bAJsCz0KqHIXPuWrN8gKYTv4eVMLl4xVJYgCkLq0588yNXJrVaTyJC/DnsuAjIMlY6ZbevoOe1AVQWCcwCmW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779212213; c=relaxed/simple;
	bh=NBCSWCa6KyPRCAbjL5VrzX61U9kU0HXcE62361BHQLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=py+7KlKlU4CbhXN6NmOhOjm4v3qvBHIFSwb9KIDhSINLALEmOzmhJZxcJ0hdY+BxIWYF8b0td8zSYiXubWkfHjbQNCQQq6VRxLLkzIeqbjeCioGKisqZwlg5MysuGva4aE1kYIdNU7od8fG0R5j7oBigBfH+e4qsfk+2rtZKXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MsWonerk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MsWonerk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso1823132a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779212211; x=1779817011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V/vhk9mKwhJ2cILJIckDtLxyNF6U6HXJECCPaxBbezw=;
        b=MsWonerkS72ZLhOEWwnEToGtKPyV4EEY26vsiYTf2QUx7yChRADXhn0nvvrGFTbSOH
         dsb3zX8JS7CCpEybcvnVGOwGXvUkO3or5VV721FSVPmb7J0MvPS3fB2GyLfQjTa8ToIv
         mCQ9uuRri1uglGO0kbwuW/Uhxt9HgbBX0Xg/HAk1MaC9W9uCfYoOtplP5VI+HCR1wTik
         r8JfZ0PgBOWG6rf5hEOby2ITWmM4cSTyISzeulcA3n7i3byofg6gYo5AalU98tAgatDS
         5Eh9vN6518EvlyKevspnY4T7sHwzFj7p3ikqg932Q8E9lOwI2Wn38MjBvwmyg52UNuM+
         IIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779212211; x=1779817011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/vhk9mKwhJ2cILJIckDtLxyNF6U6HXJECCPaxBbezw=;
        b=bEQorSh+PQilnGWDbYgiFgq0CarUkBeIirt8ep5akPEu2jkeF+HtX07MTMPp08dW1T
         fml5ixcrzUYy+NmeHcmdOe8V0UQSP1n19iFTTlARJ17L/g59rS3xDcUbJkUxEb1vQJjs
         Fv784+vSp0cvRZsktOIOsCZY7pA2l+AjowcFwX75PPeyn10rEPQpkdhOy9c0AQd5qju/
         Ti6AF1rGqCBrs4Ych6QLWdo5HMUWo8jcE2mDBhkzzwS5bIZ/iq2cYUa5mVVA5lVgAU8Y
         Q6zIw2nG5X8E0HAM3tbJrd1fVTCsBixi5514jTMTiJOY4lwLkxZd8XfXdxBZMoFx5ek5
         hInQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NRY0XojcQ/1QKJjze8pn9Mj6Y7AXNwgZGYC2iVLe35ZlN+26i6ySwfJ8nBjCEACnEP3LbXbMuMXDic7fZHwL2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37+bh2sd3HoPaFIdcyDCg4MvvTjHaFZeROJriPD6i6S9qo3xx
	tVRqXH5FV/cEXhYXBlNysEDvNlk+dTDXEAX1GLgDWwOhYSkhrgT046gFJAqLPPmMQko=
X-Gm-Gg: Acq92OHMzB6Tgk7bYCFg+NPA4tTY4QPCl2T37uLrhQ7ci9zJ+45/i5u/PY3JLheETvu
	YXsTkcxmY5KRjzRZuZCKo1Xzsm/oOjfMWx0iIUno9SXU8J26B0mVtmYSGSOZQfSGTsCrlo23wle
	ecJejaUrVQOlZiBTpDVO8Rhdzw3trRV+Re2rbCR4cGEu1Pradxc7seXA8dEMV3FLErfxNj6ywfj
	lAnF/Rmc67kMj96KuJQOHGxyTmBryJLWwNK/lSq7N1zLaW7jQvsPhUyuvng39uoq/Bev0li3qht
	z6mJTDAOa/rn4I7UM/oRJ320lHfC19zBt5sm5uEUbHQW8r+YViRZzzLwYpk5TWmbAjo5uEBM3PQ
	dcEW9FRHv/B2Nh6FAP+l9t7b7LxiZfZ+p8K4NuRS7svvOhTvwqzA36P90IYb0/Q/HTWn2/g9e1j
	K6Hfj1pX9QcF1m5T+Js20O8s12SSc=
X-Received: by 2002:a17:90b:5626:b0:367:b8ad:f0e9 with SMTP id 98e67ed59e1d1-36951a6d218mr19222776a91.16.1779212210983;
        Tue, 19 May 2026 10:36:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:17db:e96e:b240:ed21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369f59656a9sm2206141a91.2.2026.05.19.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:36:50 -0700 (PDT)
Date: Tue, 19 May 2026 11:36:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, arnaud.pouliquen@foss.st.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <agyfr-pxwQ4oKMAF@p14s>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429161052.528015-3-tanmay.shah@amd.com>

On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
> 512 bytes isn't always suitable for all case, let firmware
> maker decide the best value from resource table.
> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Test done:
>   - Verify this patch works with the existing firmware
>   - Verify this patch works with the firmware that configures
>     differt tx & rx buf size
> 
> Changes in v2:
>   - %s/sbuf_size/tx_buf_size/
>   - %s/rbuf_size/rx_buf_size/
>   - fix typo
>   - do not use ALIGN on buf size, rely on allocator
>   - make err msg more explicit, %s/vdev config:/bad vdev config/
>   - fix license and add AMD copyrights in the header virtio_rpmsg.h
>   - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>   - use __virtio32 over __u32
>   - add version field to virtio rpmsg config structure
>   - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
>  include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>  2 files changed, 79 insertions(+), 18 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index e59d8cf9b975..8116d94413cc 100644
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
>   * @num_rx_buf:	total number of buffers for rx
>   * @num_tx_buf:	total number of buffers for tx
> - * @buf_size:	size of one rx or tx buffer
> + * @rx_buf_size: size of one rx buffer
> + * @tx_buf_size: size of one tx buffer
>   * @last_sbuf:	index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
>   * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> @@ -59,7 +61,8 @@ struct virtproc_info {
>  	void *rx_bufs, *tx_bufs;
>  	unsigned int num_rx_buf;
>  	unsigned int num_tx_buf;
> -	unsigned int buf_size;
> +	unsigned int rx_buf_size;
> +	unsigned int tx_buf_size;
>  	int last_sbuf;
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
> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  
>  	/* either pick the next unused tx buffer */
>  	if (vrp->last_sbuf < vrp->num_tx_buf)
> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
> +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>  	/* or recycle a used one */
>  	else
>  		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  	 * messaging), or to improve the buffer allocator, to support
>  	 * variable-length buffer sizes.
>  	 */
> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>  		dev_err(dev, "message is too big (%d)\n", len);
>  		return -EMSGSIZE;
>  	}
> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  	struct rpmsg_device *rpdev = ept->rpdev;
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  
> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>  }
>  
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * We currently use fixed-sized buffers, so trivially sanitize
>  	 * the reported payload length.
>  	 */
> -	if (len > vrp->buf_size ||
> +	if (len > vrp->rx_buf_size ||
>  	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>  
>  	/* publish the real size of the buffer */
> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>  
>  	/* add the buffer back to the remote processor's virtqueue */
>  	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	int err = 0, i;
>  	size_t total_buf_space;
>  	bool notify;
> +	u16 version;
>  
>  	vrp = kzalloc_obj(*vrp);
>  	if (!vrp)
> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
> +		/* note: virtio_rpmsg_config is defined from remote view */
> +		version = 0;
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     version, &version);
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     txbuf_size, &vrp->rx_buf_size);
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rxbuf_size, &vrp->tx_buf_size);
> +

A check is also needed to make sure the version received from the resource table
is '0'.

> +		/* The buffers must hold at least the rpmsg header */
> +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
> +				vrp->rx_buf_size, vrp->tx_buf_size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		dev_dbg(&vdev->dev,
> +			"vdev config: version=%d, rx buf sz = 0x%x, tx buf sz = 0x%x\n",
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
> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	vrp->rx_bufs = bufs_va;
>  
>  	/* and second part is dedicated for TX */
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
> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
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
> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>  
>  static unsigned int features[] = {
>  	VIRTIO_RPMSG_F_NS,
> +	VIRTIO_RPMSG_F_BUFSZ,
>  };
>  
>  static struct virtio_driver virtio_ipc_driver = {
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 000000000000..285918be68b9
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Pinecone Inc. 2019
> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> + * Copyright (C) Advanced Micro Devices, Inc.
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
> +
> +struct virtio_rpmsg_config {
> +	__virtio16 version;
> +	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +	__virtio32 reserved[14]; /* Reserve for the future use */

66 byte for the configuratio space?  I'm puzzled about the reserved[14], how did
you come up with that number?  

The rest looks good to me.

> +	/* Put the customize config here */
> +} __packed;
> +
> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> -- 
> 2.34.1
> 
