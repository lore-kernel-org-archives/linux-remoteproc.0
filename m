Return-Path: <SRS0=Av4F=BB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A76C433E3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 03:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32EA20714
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 03:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ai/DdV/C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731954AbgGVDlW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Jul 2020 23:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731793AbgGVDlV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jul 2020 23:41:21 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BD1C061794
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 20:41:21 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k1so442484pjt.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 20:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PZzzlTGx/ICdhYe+2uHcmJLnh4ijELIbpQJzlcitfzg=;
        b=ai/DdV/CJqkiOTk/OxKYWooQARnR8PUlYupif/hTCNrBSfYZYZGLan35Mzh+SgFcr9
         VpeqiEbNmH5tPYS8hwLxjJ96WSug8dspyG/XUm2hqIHvH3vAS3aSLNMwlXSJNzTumeDV
         c8V3urmNxLey8ErM0fG3OJEz4xOkaTZYWxbSj223JpiveIi4G4B4xNjoHho5jU1OaF/2
         lgDmrpVn43fQ/UxHBfI7qaTP/IlW2C3awRugCDDcly3hpFGkIWwG+bQVxuAxe+JhV5LM
         HerhCrIsFkOFqPcY63GaNXBNcJhQVjsrr5cFdzmSQCKwWdbuuerdiNhpppVRDAsM+MdU
         Ox1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PZzzlTGx/ICdhYe+2uHcmJLnh4ijELIbpQJzlcitfzg=;
        b=WrzB1Y0LJ2qhXEfjWGckdoamgi1Cizg8u8x3JL6hleysUfTNb0+WlR83Eul4RWghap
         BarOLtgCJrYk3NXzKO5SGexgs54dP4zBv6M28EH/wtbdvbxEV/HF/PpComExE/krDnRp
         THsrk1oKsFFFO2m6r3qMOqNBn4hDH/csQ8sGt6LbkOzK/FyUhXrN9/MKmYUFpFIhfEkm
         LoA5qBT6xHRf2ND87iQj+eSax4utJDjii4rBzZLmFsZwMEL5Dsdgk0M+mYjoMcbwaKi5
         wH6yj+NeoU3PmdnvNCLDL3EP3d9zhKk/OO7O1rNEd38d108QbIqxLIfx1XqRZYJS0OZF
         icXw==
X-Gm-Message-State: AOAM532un6Mx2NRfpM59GWiJSJEzqS3tD0b59Nu9sGChmJkFiOxXHZaK
        iraXxg05hfUXBvpf3na0Iwygig==
X-Google-Smtp-Source: ABdhPJz/qm9oGSAzIvz0j5eCSOowl+IiQ+z2o+LLeHpHXzL3pbfV/hIo+8xixeLKPlOIw8u6Zyq+cQ==
X-Received: by 2002:a17:90b:4a06:: with SMTP id kk6mr7813256pjb.186.1595389281036;
        Tue, 21 Jul 2020 20:41:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x10sm22150394pfp.80.2020.07.21.20.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 20:41:20 -0700 (PDT)
Date:   Tue, 21 Jul 2020 20:39:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH RESEND v4] rpmsg: virtio: add endianness conversions
Message-ID: <20200722033926.GN2922385@builder.lan>
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

On Tue 21 Jul 01:56 PDT 2020, Guennadi Liakhovetski wrote:

> According to the VirtIO 1.0 spec data, sent over virtual queues must
> be in little-endian format. Update the RPMsg VirtIO implementation
> to enforce that but let legacy configurations continue use native
> endianness.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
> 
> Ping: 2 weeks since the original submission. Also added back the updated
> "reviewed-by" tag.
> 

Sorry about that, I missed the reviewed version in my inbox. Applied to
the rpmsg-next tree for v5.9, with Michael's ack.

Regards,
Bjorn

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
> 
