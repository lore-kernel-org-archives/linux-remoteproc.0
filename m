Return-Path: <SRS0=TaqV=BA=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E825C433E7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Jul 2020 10:04:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49CBD20729
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Jul 2020 10:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iCm8M3y7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgGUKEb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Jul 2020 06:04:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50760 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727942AbgGUKEa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jul 2020 06:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595325868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lKz9jWOGUhn5Eq4r8ogm3LGunjs1KqG0NenFG+hKWHM=;
        b=iCm8M3y75S1pow2V1pdGf3wZvxpBhGwSxwWP2Sg+WgSELJEPWF7e5K7e1l57YnwbgYrY79
        WTHVUooAqoOdJ1W6jEnv47hTU84ce6QHYkTf4j263qModbCyuBRXyWgQ3NKR2Eh1DaQYNL
        HvXn/7A7/9dZrVr7fSn1P5vZcKm3R18=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-B45sj8gaNjW2t5TR8dpRQw-1; Tue, 21 Jul 2020 06:04:25 -0400
X-MC-Unique: B45sj8gaNjW2t5TR8dpRQw-1
Received: by mail-wm1-f69.google.com with SMTP id o13so807599wmh.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lKz9jWOGUhn5Eq4r8ogm3LGunjs1KqG0NenFG+hKWHM=;
        b=DYJV5MAZ4FvK42AgOvG9Od39w8o7UaaKqbkhAfX7F945va+REY+d0r6FUaxPBC+1Bs
         HaWpr57x5CVkkbHY4nn4/61JPdNucdM553cbmn+BkIho+8hUzgtQsdqfR6H7UT36/rub
         2gBNL2g91MU7id3Y/ihCI+IrDm+GNsb0Zzejm3VKZN07gKYcBpUnJyZbtUDzMUQtHnyd
         A8gP/tPIuIJwuElomHVkM6z/EoHDbXZsD6zcD4XKqfrdKPyMDSIPg5p+y/RsT3zDDEad
         pSa2aq7YbaMaHHsFIsVBmQi8ZM7rpU1o6Jf62ve3bMCl7jyhJHL8ticZutesDhXasEug
         HqJg==
X-Gm-Message-State: AOAM53084zAQSMObn5GDSpEqn8xTPxLILk00YycMI+Cs33id1S+ms0zv
        YGYtkRXJVcccYD2kIvlzf5bQIEHZQoRsFsW88ygQ+h1ZZLMFuIXyrSThIAxYXdYaa8JIftFGCNx
        7L/z0K+4GvfZ3s+aYV9itKHlgND8Iag==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr24784186wrv.328.1595325864042;
        Tue, 21 Jul 2020 03:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Tq0YT8vkXNrziwkpXWnML6fxK9Bbvitkj/UV96VFN6XkX7iN917b33ZXpNF8ADJAZTwDTg==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr24784175wrv.328.1595325863721;
        Tue, 21 Jul 2020 03:04:23 -0700 (PDT)
Received: from redhat.com (bzq-79-182-82-99.red.bezeqint.net. [79.182.82.99])
        by smtp.gmail.com with ESMTPSA id p8sm24985680wrq.9.2020.07.21.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 03:04:22 -0700 (PDT)
Date:   Tue, 21 Jul 2020 06:04:12 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH RESEND v4] rpmsg: virtio: add endianness conversions
Message-ID: <20200721060305-mutt-send-email-mst@kernel.org>
References: <20200616073011.GB2999@ubuntu>
 <20200630175057.GA3831001@xps15>
 <20200701055912-mutt-send-email-mst@kernel.org>
 <20200706124716.GA5457@ubuntu>
 <20200706125657.GB5457@ubuntu>
 <20200706133835.GC5457@ubuntu>
 <c5a4b0c7-859e-24ad-cf1e-3f80a2f15f38@st.com>
 <20200707153436.GA5970@ubuntu>
 <CANLsYkwuPsm+5uCWc91NLF4oxANvxVvgQ9NcRnoPAoVRGk+H5w@mail.gmail.com>
 <20200721085638.GA3815@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721085638.GA3815@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 21, 2020 at 10:56:38AM +0200, Guennadi Liakhovetski wrote:
> According to the VirtIO 1.0 spec data, sent over virtual queues must
> be in little-endian format. Update the RPMsg VirtIO implementation
> to enforce that but let legacy configurations continue use native
> endianness.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Looks good to me
Acked-by: Michael S. Tsirkin <mst@redhat.com>

Who's merging this? If me, could I get acks from maintainers on this please?


> ---
> 
> Ping: 2 weeks since the original submission. Also added back the updated
> "reviewed-by" tag.
> 
> v4: fix a left-over use of an LE value in calculation - thanks to Arnaud for
> catching!
> 
> v3: use the virtio_byteorder.h header
> 
> v2: Following suggestions from Michael and Mathieu switch to using virtio16/32
> types and conversion functions.
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 63 +++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 07d4f3374098..9006fc7f73d0 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -23,6 +23,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/virtio.h>
> +#include <linux/virtio_byteorder.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
>  #include <linux/wait.h>
> @@ -84,11 +85,11 @@ struct virtproc_info {
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
> @@ -106,8 +107,8 @@ struct rpmsg_hdr {
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
> @@ -335,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
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
> @@ -359,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
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
> @@ -612,18 +613,18 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
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
> -			 msg, sizeof(*msg) + msg->len, true);
> +			 msg, sizeof(*msg) + len, true);
>  #endif
>  
>  	rpmsg_sg_init(&sg, msg, sizeof(*msg) + len);
> @@ -704,13 +705,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
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
> @@ -718,15 +723,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
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
> @@ -739,8 +744,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
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
> @@ -846,15 +851,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
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
> 2.27.0

