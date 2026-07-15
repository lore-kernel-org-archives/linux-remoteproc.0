Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE43AE6E6
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132654; cv=none; b=eI7qYotIUTlx8ZUZfo1QN7vZwPobAOUkOCznFx0Lq3bO8itRiiGEeLLmN0zECFBhl/3zEiIgprRuvz3hqmMYfdG4M8FnTJIlvNwKx3rhmQZsCz4/Hd+T/flKP6MlRIaZBElCVmCTdq3tl/1OO8rfLqX6zMbG6wBo4SpS0vTnZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132654; c=relaxed/simple;
	bh=rQEsat0ZyoRePy6ExhTA4Hcs9DIGDJb8nGwfd0ardqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZQF995TcD5aky5gwRJ/PUm/cYVDU9HJ3U0ocBtvLGJ249JtYeYTpZlsNpvR0mZsm5xCWBAwtxnnuPbQWceW4KTmBtshXMOWNYpkOh/Qzmv+SSq2fx+yYRDgD2jkYduDQdeW091Q8HUnAvd4FhHzZAk4TmoZFGmckqQ7D48q6mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XwR1ypOb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XwR1ypOb"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84867f07d63so6441857b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784132651; x=1784737451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MA2j7b6lNgekV6OtvU07MxZTxb5cuXxS2zxtWG+Q/kc=;
        b=XwR1ypObR8I6704ki0V8SlEEOC8CdPQr9Td1l1soVGj5IR0x+WrQIYs5wW1D5EEU2v
         6NRF7Qppm15bP4HdVa7ssPgSFnv1GDQzmNFFxsyC2IMTxMbybvOV2/VN/vf9z9hjWRJi
         7ApUzM741IaRp0nQyc2sVcCG848FNhLUUhlnMCpooA0FkBIRolo0tdvUAeEpLTz1okIF
         lbWyVBHvFV/UnNyb6yu54Ez1jbfZx6mObImAtnRCtHUyk+bE+2ya1uHNAhoxXn2ePrH2
         Z3GviVvScw01/FMPuhXsjE/raaAwunAsyZjgIUXSH957TFvpNT8cDcPNuu53M7RhnSwE
         Lilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784132651; x=1784737451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA2j7b6lNgekV6OtvU07MxZTxb5cuXxS2zxtWG+Q/kc=;
        b=Bqmrqw75S/q0HpLTHwK9N8Hhle0U4bEeu0gLXpH7Fj1wDJkWUi8Jo8Z/9Mmm2Z7I3e
         GOmAy/VRMRL9eBLufVn6GN9wFHYjnE4HeOo66fuOZd4XyrD1we8wH8UzO5+hs7ozj2Wq
         wSqZiiuyWUXM5FsJiOrOLYlGK2/omX63nQQsRpONjvLMgAQT3LRmMG1mguEVGKbV6rFJ
         Eab9aPm86IagYru6nCVci7wyCLOkGBQyzMUF2+4FVdGneyQjP6Ocd8/RmKU2KhcStDJv
         da0AOg3osdJFBnR7/xBW2B6pr3Qd28ANjLE+JERLhzNssukpS3HisfhgnJa1SydlPBgy
         s7qg==
X-Forwarded-Encrypted: i=1; AHgh+RpZsWrJ/P0e4gWWWjvWPwzJAejPY3oWkqO1JmEKINUP5Dj1UiXdpwnUowcBaVzOndQFF6U9kh0gw7opWqo/BWAb@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgGKJgbejes1I7kPosMC1LeYGJvIGp98ukmxCQmopsP8poA7m
	WBbVy5Lj8EScKpptlf2JrIUqbdB0LTjbGbLh6DcUQQMbQuZjr3s+GEn7tgMyueahCbI=
X-Gm-Gg: AfdE7ckBi/QMnZJQ7M0S0HJ05ajM0Wv0EGTLtA0FRMSoz48aKwZ97mPt8+Bg01Z9aRB
	5aScnWvgIJxYI3o8uA5/4spAt35u7FOTQK11hVqlj/84ZEXAShJ/jvRgbKsb+c5evEwM2YE6CtZ
	ISQKbzQ71L4iRNy3F55KPPx6AJ9D6rpW498XtFIp/4AxQgM6l94SdHwpenWgdKpR4z7MvTDtZ2l
	GtTtMIxmHqDOvYHslhHXANfr1I5ROIq/jlrtxmWd+x7ctzv37YkM1bo+AW5KWZPj6CwMWDBQxL/
	j/hEiINf05zNLCZoahHi2tB6Qg1CRti8MitGAsWuzY+4EpK5tJLepNQbKbjCfzCeXOq++qaCESv
	H605UbZ4GuQtVimJlekj0ojLCOFx+o3ckUOOsE/b1I8hRl7n8KkF8mChTMBunjSWjO05bmIxn+l
	TwRkpJcOJptC4s6NHU
X-Received: by 2002:a05:6a00:3d49:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-84a672ea37emr3024809b3a.57.1784132651262;
        Wed, 15 Jul 2026 09:24:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26d82bsm3552572b3a.14.2026.07.15.09.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:24:10 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:24:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <ale0KIu6hXNvN0q9@p14s>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710192831.3440427-4-tanmay.shah@amd.com>

On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> 512 bytes isn't always suitable for all case, let firmware
> maker decide the best value from resource table.
> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
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
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 130 ++++++++++++++++++++++++-----
>  include/linux/rpmsg/virtio_rpmsg.h |  48 +++++++++++
>  2 files changed, 159 insertions(+), 19 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index c84b6cec9caf..5e5473f4adeb 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -15,11 +15,13 @@
>  #include <linux/idr.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
> +#include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
>  #include <linux/rpmsg/byteorder.h>
>  #include <linux/rpmsg/ns.h>
> +#include <linux/rpmsg/virtio_rpmsg.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> @@ -39,7 +41,10 @@
>   * @tx_bufs:	kernel address of tx buffers
>   * @num_rx_buf: total number of rx buffers
>   * @num_tx_buf: total number of tx buffers
> - * @buf_size:   size of one rx or tx buffer
> + * @rx_buf_size: size of one rx buffer
> + * @tx_buf_size: size of one tx buffer
> + * @rx_buf_size_aligned: aligned size of one rx buffer
> + * @tx_buf_size_aligned: aligned size of one tx buffer
>   * @last_tx_buf: index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
>   * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> @@ -59,7 +64,10 @@ struct virtproc_info {
>  	void *rx_bufs, *tx_bufs;
>  	unsigned int num_rx_buf;
>  	unsigned int num_tx_buf;
> -	unsigned int buf_size;
> +	unsigned int rx_buf_size;
> +	unsigned int tx_buf_size;
> +	unsigned int rx_buf_size_aligned;
> +	unsigned int tx_buf_size_aligned;
>  	int last_tx_buf;
>  	dma_addr_t bufs_dma;
>  	struct mutex tx_lock;
> @@ -68,9 +76,6 @@ struct virtproc_info {
>  	wait_queue_head_t sendq;
>  };
>  
> -/* The feature bitmap for virtio rpmsg */
> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> -
>  /**
>   * struct rpmsg_hdr - common header for all rpmsg messages
>   * @src: source address
> @@ -128,7 +133,7 @@ struct virtio_rpmsg_channel {
>   * processor.
>   */
>  #define MAX_RPMSG_NUM_BUFS	(256)
> -#define MAX_RPMSG_BUF_SIZE	(512)
> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
>  
>  /*
>   * Local addresses are dynamically allocated on-demand.
> @@ -443,7 +448,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  
>  	/* either pick the next unused tx buffer */
>  	if (vrp->last_tx_buf < vrp->num_tx_buf)
> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
> +		ret = vrp->tx_bufs + vrp->tx_buf_size_aligned * vrp->last_tx_buf++;
>  	/* or recycle a used one */
>  	else
>  		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -513,7 +518,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  	 * messaging), or to improve the buffer allocator, to support
>  	 * variable-length buffer sizes.
>  	 */
> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>  		dev_err(dev, "message is too big (%d)\n", len);
>  		return -EMSGSIZE;
>  	}
> @@ -646,7 +651,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  	struct rpmsg_device *rpdev = ept->rpdev;
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  
> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>  }
>  
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> @@ -672,7 +677,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * We currently use fixed-sized buffers, so trivially sanitize
>  	 * the reported payload length.
>  	 */
> -	if (len > vrp->buf_size ||
> +	if (len > vrp->rx_buf_size ||
>  	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
> @@ -705,7 +710,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>  
>  	/* publish the real size of the buffer */
> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>  
>  	/* add the buffer back to the remote processor's virtqueue */
>  	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> @@ -819,10 +824,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	struct virtproc_info *vrp;
>  	struct virtio_rpmsg_channel *vch = NULL;
>  	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
> +	u16 rpmsg_buf_align = 0;
>  	void *bufs_va;
>  	int err = 0, i;
>  	size_t total_buf_space;
>  	bool notify;
> +	u8 version;
> +	u16 size;
>  
>  	vrp = kzalloc_obj(*vrp);
>  	if (!vrp)
> @@ -854,9 +862,87 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
>  
> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
> +		/*
> +		 * Optional alignment applied to each buffer size and to the TX
> +		 * buffer base address (e.g. to align buffers on a cache line).
> +		 * It must be a power of two; zero means no extra alignment.
> +		 */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rpmsg_buf_align, &rpmsg_buf_align);
> +		if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: rpmsg_buf_align %u is not a power of 2\n",
> +				rpmsg_buf_align);
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
> +		if (rpmsg_buf_align) {
> +			vrp->rx_buf_size_aligned = ALIGN(vrp->rx_buf_size,
> +							 rpmsg_buf_align);
> +			vrp->tx_buf_size_aligned = ALIGN(vrp->tx_buf_size,
> +							 rpmsg_buf_align);
> +		} else {
> +			vrp->rx_buf_size_aligned = vrp->rx_buf_size;
> +			vrp->tx_buf_size_aligned = vrp->tx_buf_size;
> +		}
> +
> +		dev_dbg(&vdev->dev,
> +			"vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz = 0x%x\n",
> +			version, rpmsg_buf_align, vrp->rx_buf_size,
> +			vrp->tx_buf_size);
> +	} else {
> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +		vrp->rx_buf_size_aligned = vrp->rx_buf_size;
> +		vrp->tx_buf_size_aligned = vrp->tx_buf_size;
> +	}
> +
> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size_aligned) +
> +			  (vrp->num_tx_buf * vrp->tx_buf_size_aligned);
>  
>  	/* allocate coherent memory for the buffers */
>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -873,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	/* first part of the buffers is dedicated for RX */
>  	vrp->rx_bufs = bufs_va;
>  
> -	/* and second part is dedicated for TX */
> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> +	/*
> +	 * Here buf_va is aligned to a page. Also rx buf size is aligned with
> +	 * cache line alignment provided by the firmware, so tx buf's start
> +	 * address is guranteed to be aligned with the alignment provided by
> +	 * the firmware.
> +	 */
> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size_aligned);
>  
>  	/* set up the receive buffers */
>  	for (i = 0; i < vrp->num_rx_buf; i++) {
>  		struct scatterlist sg;
> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size_aligned;
>  
> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>  
>  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>  					  GFP_KERNEL);
> @@ -964,8 +1055,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>  static void rpmsg_remove(struct virtio_device *vdev)
>  {
>  	struct virtproc_info *vrp = vdev->priv;
> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> -	size_t total_buf_space = num_bufs * vrp->buf_size;
> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size_aligned) +
> +				 (vrp->num_tx_buf * vrp->tx_buf_size_aligned);
>  	int ret;
>  
>  	virtio_reset_device(vdev);
> @@ -991,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
>  
>  static unsigned int features[] = {
>  	VIRTIO_RPMSG_F_NS,
> +	VIRTIO_RPMSG_F_BUFSZ,
>  };
>  
>  static struct virtio_driver virtio_ipc_driver = {
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 000000000000..735a947d5582
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,48 @@
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
> +
> +/* Version of struct virtio_rpmsg_config understood by this driver */
> +#define RPMSG_VDEV_CONFIG_V1	1
> +
> +/**
> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> + *
> + * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> + * @size:	size of this structure in bytes.
> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
> + *		     two. If 0 then no alignment will be done. This alignment
> + *		     will not decide actual size of the buffer but will be
> + *		     used to decided the start address of the buffer. The
> + *		     actual size of the buffer can be different than the
> + *		     aligned size of the buffer.

Is there really a need to have a buffer size different from its alignment?  It's
not like the (small) delta between the buffer size and its alignment will be
used for something else.  I'm fine with a buffer alignment requirement but in
those cases, the firmware should set the size of the buffer in accordance with
its alignment requirement.  Otherwise, the complexity needed to manage the
discrpancy between the two yields a driver that is hard to maintain and prone to
bugs.

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
> +	__virtio16 rpmsg_buf_align;
> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +} __packed;
> +
> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> -- 
> 2.34.1
> 
