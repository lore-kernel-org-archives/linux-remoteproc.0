Return-Path: <SRS0=lk58=AL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A251C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Jun 2020 17:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3743120768
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Jun 2020 17:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xe6BdXFP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388898AbgF3RvB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Jun 2020 13:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387957AbgF3RvA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Jun 2020 13:51:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CA9C061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2020 10:51:00 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k1so8770171pls.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2020 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QVKAbXUl2coAHhkNmAZc35ggy8Z36qrOC8mI/HChiGE=;
        b=xe6BdXFPhzAg9hzeCiSNsqRCsXsse77P6+Ym+EUXZ/2ZAsLhpKu4+taWF4OuJJcibQ
         6P74sJGBwYO6VYaa3hk4ufJmxYI8KrSdENPNLGUtTfcQGdE8VvCqc/WP9W+bG1GM+fcC
         Eq6tGklhpjGyE1apO+ivT9iY0OWz2YHLAmR+37aTOmbtJswmHrED1/hd9VyxWN6wfP7K
         wVPqnJWYC7MWkIhmL9LGcfNjeOvQHRglVprE2ARN7/ZdULeMONGiE4cNbIxZLLK0tCT5
         bcn3aTU90ydmE685wQpVrA7Uy8AgO83AzND8gMGFp9GhFA1gSDSjfV2x9TIl8WRmKoLc
         bSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QVKAbXUl2coAHhkNmAZc35ggy8Z36qrOC8mI/HChiGE=;
        b=OuGDcVeEFU97vzKXPSpQ0Q7Z7u9T6Yip7WorUIe8YoxqNC6zTu+AwNFQPgC/4NZfoY
         /HEmOkjpLjiW71g/+j5pPNj91O8/Dl0LsVIoH/yAtjB1swYKZ8ZGigrggRHMSGbQ2vhJ
         VlCRmEi7LQOqXVUazg+eHKnn5BMglI83wi2bolXcrtnawusatMjWy64weXsxHyWrxFyu
         lMvkQ6+5A+BTJHI+KqCEM3p5vU3rx05zTYnaW2MINgTbgnO9UvMIMRqtn6quccPVry/R
         dAmcfFFWDEro76aAUJGrfg7TTU8lO5Re7ovxEc8kOX+mLf+3rQJ+3Xrz4NypBcPxJNoa
         FMow==
X-Gm-Message-State: AOAM530AG4lwhfHhbjsja0o9n20MdZhB0TIM9jGJiPKxBKjx7/bAMVJj
        7SRmfo2ZnCiFtGmGqQEcSNkGxA==
X-Google-Smtp-Source: ABdhPJx9b/HcWI0nYesYHASRGp3bpHCjV8plB1AnRgXgSt1I6HXA3U4nnbl2uSX15MaGKv5BMRtO/A==
X-Received: by 2002:a17:90a:f3ca:: with SMTP id ha10mr22634200pjb.46.1593539459788;
        Tue, 30 Jun 2020 10:50:59 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 81sm3281106pfz.55.2020.06.30.10.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:50:59 -0700 (PDT)
Date:   Tue, 30 Jun 2020 11:50:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     linux-remoteproc@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH v2] rpmsg: virtio: add endianness conversions
Message-ID: <20200630175057.GA3831001@xps15>
References: <20200608123932.GF10562@ubuntu>
 <20200615204707.GA231755@xps15>
 <20200616061456.GA2999@ubuntu>
 <20200616073011.GB2999@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616073011.GB2999@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 16, 2020 at 09:30:11AM +0200, Guennadi Liakhovetski wrote:
> According to the VirtIO 1.0 spec data, sent over virtual queues must
> be in little-endian format. Update the RPMsg VirtIO implementation
> to enforce that but let legacy configurations continue use native
> endianness.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
> 
> v2: Following suggestions from Michael and Mathieu switch to using virtio16/32 
> types and conversion functions.
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 63 ++++++++++++++++++++++------------------
>  1 file changed, 35 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 07d4f33..41025df 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -11,6 +11,8 @@
>  
>  #define pr_fmt(fmt) "%s: " fmt, __func__
>  
> +#include <asm/byteorder.h>
> +

Not sure about this header - what does it provide?

>  #include <linux/dma-mapping.h>
>  #include <linux/idr.h>
>  #include <linux/jiffies.h>
> @@ -22,6 +24,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> +#include <linux/types.h>

This too... It should be fine with linux/virtio_config.h below since it 
already includes linux/virtio_byteorder.h

Moreover, please send another revision that applies on rproc-next.  The third
hunk in this patch doesn't apply.

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  #include <linux/virtio.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
> @@ -84,11 +87,11 @@ struct virtproc_info {
>   * Every message sent(/received) on the rpmsg bus begins with this header.
>   */
>  struct rpmsg_hdr {
> -	u32 src;
> -	u32 dst;
> -	u32 reserved;
> -	u16 len;
> -	u16 flags;
> +	__virtio32 src;
> +	__virtio32 dst;
> +	__virtio32 reserved;
> +	__virtio16 len;
> +	__virtio16 flags;
>  	u8 data[];
>  } __packed;
>  
> @@ -106,8 +109,8 @@ struct rpmsg_hdr {
>   */
>  struct rpmsg_ns_msg {
>  	char name[RPMSG_NAME_SIZE];
> -	u32 addr;
> -	u32 flags;
> +	__virtio32 addr;
> +	__virtio32 flags;
>  } __packed;
>  
>  /**
> @@ -335,8 +338,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->ept->addr;
> -		nsm.flags = RPMSG_NS_CREATE;
> +		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> +		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>  		if (err)
> @@ -359,8 +362,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->ept->addr;
> -		nsm.flags = RPMSG_NS_DESTROY;
> +		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> +		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>  		if (err)
> @@ -612,15 +615,15 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  		}
>  	}
>  
> -	msg->len = len;
> +	msg->len = cpu_to_virtio16(vrp->vdev, len);
>  	msg->flags = 0;
> -	msg->src = src;
> -	msg->dst = dst;
> +	msg->src = cpu_to_virtio32(vrp->vdev, src);
> +	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
>  	msg->reserved = 0;
>  	memcpy(msg->data, data, len);
>  
>  	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
> -		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> +		src, dst, len, msg->flags, msg->reserved);
>  #if defined(CONFIG_DYNAMIC_DEBUG)
>  	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
>  			 msg, sizeof(*msg) + msg->len, true);
> @@ -704,13 +707,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  {
>  	struct rpmsg_endpoint *ept;
>  	struct scatterlist sg;
> +	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
>  	int err;
>  
>  	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> -		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> +		virtio32_to_cpu(vrp->vdev, msg->src),
> +		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
> +		virtio16_to_cpu(vrp->vdev, msg->flags),
> +		virtio32_to_cpu(vrp->vdev, msg->reserved));
>  #if defined(CONFIG_DYNAMIC_DEBUG)
>  	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
> -			 msg, sizeof(*msg) + msg->len, true);
> +			 msg, sizeof(*msg) + msg_len, true);
>  #endif
>  
>  	/*
> @@ -718,15 +725,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * the reported payload length.
>  	 */
>  	if (len > vrp->buf_size ||
> -	    msg->len > (len - sizeof(struct rpmsg_hdr))) {
> -		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
> +	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
> +		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
>  	}
>  
>  	/* use the dst addr to fetch the callback of the appropriate user */
>  	mutex_lock(&vrp->endpoints_lock);
>  
> -	ept = idr_find(&vrp->endpoints, msg->dst);
> +	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
>  
>  	/* let's make sure no one deallocates ept while we use it */
>  	if (ept)
> @@ -739,8 +746,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  		mutex_lock(&ept->cb_lock);
>  
>  		if (ept->cb)
> -			ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
> -				msg->src);
> +			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
> +				virtio32_to_cpu(vrp->vdev, msg->src));
>  
>  		mutex_unlock(&ept->cb_lock);
>  
> @@ -846,15 +853,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	/* don't trust the remote processor for null terminating the name */
>  	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
>  
> -	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> -		 msg->name, msg->addr);
> -
>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = msg->addr;
> +	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> +
> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
> +		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> +		 "destroy" : "creat", msg->name, chinfo.dst);
>  
> -	if (msg->flags & RPMSG_NS_DESTROY) {
> +	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> -- 
> 1.9.3
> 
