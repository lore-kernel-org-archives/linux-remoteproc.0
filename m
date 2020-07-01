Return-Path: <SRS0=eZwm=AM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59EEC433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jul 2020 10:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A57D20747
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jul 2020 10:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HE/VPeRh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgGAKAp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Jul 2020 06:00:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59497 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725440AbgGAKAo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jul 2020 06:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593597642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zaBsLrkkgE4mad/LWATODeSW9y5pQ/lZH4R3QzJbNAA=;
        b=HE/VPeRhIKcpeXeboQWNLNT4KpyLmBry6egFjO/EGd4wKgO08eyFqnl3aXoyT+60WPQR7I
        9C+MoFB5WYrUDfpPTV1WfPOBcvyrloMZng8zmO7dBuJ56Sdd+SpQB0VkEKGRUVVXchkwJY
        1xoeMAAedYCQzypvPPonIj92UvsFWaU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-PjP0DCh3Oqy7qS0IX5RdSw-1; Wed, 01 Jul 2020 06:00:37 -0400
X-MC-Unique: PjP0DCh3Oqy7qS0IX5RdSw-1
Received: by mail-wm1-f71.google.com with SMTP id q20so12813781wme.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2020 03:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zaBsLrkkgE4mad/LWATODeSW9y5pQ/lZH4R3QzJbNAA=;
        b=BtXCvv4B2kL9Ahz9DHOK8R42N5wXT/RGBW72NUnjAly1Iz59f4HjxNE3YIvXzOzfhK
         buizlTrrmy3vZcSDO9pZ0NPkAI2+V70M2+8bkLtr6TsoJARoo9VCX/paOy0Adgal3nuI
         aC3r9UB3SN5cHypayhy0uFKOmcEkI6NkB1fIz9+IlQrDFjtK6FwWRhduftEMYSYhoOF7
         n8vgsMh57WnpojNDXTvwO3qB6tlObSrhBKnQcNwINu5gaFPtZBRYEJCAP0uNqZUSuw5w
         4xil5NYhSamZP7tWIHpvSYEUfwKWT9gkSvtXs6ikUxOmG5WYLyI62xK3gAutQj5XDyDy
         6iIg==
X-Gm-Message-State: AOAM532hk22M2mfdw87Wq7H0zFTpjOVJGa8G5uqEbfEW3wUZCA+NQmJQ
        1foFldJNUG9/m15JCkVY5yNrMWt5UqV1Qk+A9UnERnWPs+a5U1y4UWmn43ocBZnOwJsIW+aGsdz
        wkY6u4HzYjMd7sH9mw702Mz+XasF3QA==
X-Received: by 2002:a7b:c3c7:: with SMTP id t7mr24023794wmj.97.1593597635837;
        Wed, 01 Jul 2020 03:00:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNip4jhIiBERuT31lTdVzbfdfJyxCgZLq7/bLXKdIQKzUz1LPcKSqbpY0LW9x2Awm2dLvGrA==
X-Received: by 2002:a7b:c3c7:: with SMTP id t7mr24023764wmj.97.1593597635565;
        Wed, 01 Jul 2020 03:00:35 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
        by smtp.gmail.com with ESMTPSA id x7sm6807358wrr.72.2020.07.01.03.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 03:00:34 -0700 (PDT)
Date:   Wed, 1 Jul 2020 06:00:30 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH v2] rpmsg: virtio: add endianness conversions
Message-ID: <20200701055912-mutt-send-email-mst@kernel.org>
References: <20200608123932.GF10562@ubuntu>
 <20200615204707.GA231755@xps15>
 <20200616061456.GA2999@ubuntu>
 <20200616073011.GB2999@ubuntu>
 <20200630175057.GA3831001@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630175057.GA3831001@xps15>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 30, 2020 at 11:50:57AM -0600, Mathieu Poirier wrote:
> On Tue, Jun 16, 2020 at 09:30:11AM +0200, Guennadi Liakhovetski wrote:
> > According to the VirtIO 1.0 spec data, sent over virtual queues must
> > be in little-endian format. Update the RPMsg VirtIO implementation
> > to enforce that but let legacy configurations continue use native
> > endianness.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > ---
> > 
> > v2: Following suggestions from Michael and Mathieu switch to using virtio16/32 
> > types and conversion functions.
> > 
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 63 ++++++++++++++++++++++------------------
> >  1 file changed, 35 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 07d4f33..41025df 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -11,6 +11,8 @@
> >  
> >  #define pr_fmt(fmt) "%s: " fmt, __func__
> >  
> > +#include <asm/byteorder.h>
> > +
> 
> Not sure about this header - what does it provide?
> 
> >  #include <linux/dma-mapping.h>
> >  #include <linux/idr.h>
> >  #include <linux/jiffies.h>
> > @@ -22,6 +24,7 @@
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/sched.h>
> > +#include <linux/types.h>
> 
> This too... It should be fine with linux/virtio_config.h below since it 
> already includes linux/virtio_byteorder.h

It's probably best to include linux/virtio_byteorder.h explicitly.

> Moreover, please send another revision that applies on rproc-next.  The third
> hunk in this patch doesn't apply.
> 
> With the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> >  #include <linux/virtio.h>
> >  #include <linux/virtio_ids.h>
> >  #include <linux/virtio_config.h>
> > @@ -84,11 +87,11 @@ struct virtproc_info {
> >   * Every message sent(/received) on the rpmsg bus begins with this header.
> >   */
> >  struct rpmsg_hdr {
> > -	u32 src;
> > -	u32 dst;
> > -	u32 reserved;
> > -	u16 len;
> > -	u16 flags;
> > +	__virtio32 src;
> > +	__virtio32 dst;
> > +	__virtio32 reserved;
> > +	__virtio16 len;
> > +	__virtio16 flags;
> >  	u8 data[];
> >  } __packed;
> >  
> > @@ -106,8 +109,8 @@ struct rpmsg_hdr {
> >   */
> >  struct rpmsg_ns_msg {
> >  	char name[RPMSG_NAME_SIZE];
> > -	u32 addr;
> > -	u32 flags;
> > +	__virtio32 addr;
> > +	__virtio32 flags;
> >  } __packed;
> >  
> >  /**
> > @@ -335,8 +338,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
> >  		struct rpmsg_ns_msg nsm;
> >  
> >  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > -		nsm.addr = rpdev->ept->addr;
> > -		nsm.flags = RPMSG_NS_CREATE;
> > +		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> > +		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
> >  
> >  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> >  		if (err)
> > @@ -359,8 +362,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> >  		struct rpmsg_ns_msg nsm;
> >  
> >  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > -		nsm.addr = rpdev->ept->addr;
> > -		nsm.flags = RPMSG_NS_DESTROY;
> > +		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> > +		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
> >  
> >  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> >  		if (err)
> > @@ -612,15 +615,15 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >  		}
> >  	}
> >  
> > -	msg->len = len;
> > +	msg->len = cpu_to_virtio16(vrp->vdev, len);
> >  	msg->flags = 0;
> > -	msg->src = src;
> > -	msg->dst = dst;
> > +	msg->src = cpu_to_virtio32(vrp->vdev, src);
> > +	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
> >  	msg->reserved = 0;
> >  	memcpy(msg->data, data, len);
> >  
> >  	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
> > -		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> > +		src, dst, len, msg->flags, msg->reserved);
> >  #if defined(CONFIG_DYNAMIC_DEBUG)
> >  	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
> >  			 msg, sizeof(*msg) + msg->len, true);
> > @@ -704,13 +707,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  {
> >  	struct rpmsg_endpoint *ept;
> >  	struct scatterlist sg;
> > +	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
> >  	int err;
> >  
> >  	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> > -		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> > +		virtio32_to_cpu(vrp->vdev, msg->src),
> > +		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
> > +		virtio16_to_cpu(vrp->vdev, msg->flags),
> > +		virtio32_to_cpu(vrp->vdev, msg->reserved));
> >  #if defined(CONFIG_DYNAMIC_DEBUG)
> >  	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
> > -			 msg, sizeof(*msg) + msg->len, true);
> > +			 msg, sizeof(*msg) + msg_len, true);
> >  #endif
> >  
> >  	/*
> > @@ -718,15 +725,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  	 * the reported payload length.
> >  	 */
> >  	if (len > vrp->buf_size ||
> > -	    msg->len > (len - sizeof(struct rpmsg_hdr))) {
> > -		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
> > +	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
> > +		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
> >  		return -EINVAL;
> >  	}
> >  
> >  	/* use the dst addr to fetch the callback of the appropriate user */
> >  	mutex_lock(&vrp->endpoints_lock);
> >  
> > -	ept = idr_find(&vrp->endpoints, msg->dst);
> > +	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
> >  
> >  	/* let's make sure no one deallocates ept while we use it */
> >  	if (ept)
> > @@ -739,8 +746,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  		mutex_lock(&ept->cb_lock);
> >  
> >  		if (ept->cb)
> > -			ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
> > -				msg->src);
> > +			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
> > +				virtio32_to_cpu(vrp->vdev, msg->src));
> >  
> >  		mutex_unlock(&ept->cb_lock);
> >  
> > @@ -846,15 +853,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> >  	/* don't trust the remote processor for null terminating the name */
> >  	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> >  
> > -	dev_info(dev, "%sing channel %s addr 0x%x\n",
> > -		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> > -		 msg->name, msg->addr);
> > -
> >  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> >  	chinfo.src = RPMSG_ADDR_ANY;
> > -	chinfo.dst = msg->addr;
> > +	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> > +
> > +	dev_info(dev, "%sing channel %s addr 0x%x\n",


Let's not try tricks. Just %s and destroying/creating below.
Wastes 3 bytes of kernel space but is clearer.

> > +		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> > +		 "destroy" : "creat", msg->name, chinfo.dst);
> >  
> > -	if (msg->flags & RPMSG_NS_DESTROY) {
> > +	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> >  		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
> >  		if (ret)
> >  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> > -- 
> > 1.9.3
> > 

