Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F5BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 13:14:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5A1E2076C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 13:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hr2Uvhg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbgFHNOI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 09:14:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46329 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729130AbgFHNOH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 09:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591622044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NddjZeC8WKqtf5vxVl7q74tkrHXLvoLlkr9t1x72zzo=;
        b=hr2Uvhg2x/3GhOahcirF/0oRj+70V9WceFHLHQa4qTVbtp1zl8sk0KdbcNUtzS6lC1C1ka
        KzFycFisz7s9EvovACRpwDxYFZyuE9ktRisf7NDb/YNKWXP2OmEwDp3bZmpKo8+1/vZ3yJ
        Ey5nQf4XFEqex0s4v8dUVYedF4jY47I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-9Z8q_bRfNZWmUyju5JJ5mg-1; Mon, 08 Jun 2020 09:14:01 -0400
X-MC-Unique: 9Z8q_bRfNZWmUyju5JJ5mg-1
Received: by mail-wm1-f72.google.com with SMTP id b65so5230363wmb.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 06:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NddjZeC8WKqtf5vxVl7q74tkrHXLvoLlkr9t1x72zzo=;
        b=VlntqCYZWBt55QlmkVXJYNVvBAWC5cEmbWkiR+QZ+AO/Y6lGD5RVW4ZeWecMmkpN8l
         yngXxMT80mQEo41eSX87EU7B8V4X1B8Ee1E1GRSjas96bpd0qwOHS1h09U1GfjYZX8/x
         YCp8fFCEyDkVEZEk98f67BKgXYoqKaL0ACZ5AY9ladB7Saroya817o2RzSK7qM+v1UQ0
         vaVcmW1ndsu9vPkej19ggcdO169FlQcN2FzwxyN4CsPgfowRIEDgavSuqSko/PXBidxS
         TPerwpCM8Gvm4+9iOYlGQKK54CEQYq7ibQhlKyRux8MmWgYAiWxKB+vlDnDT3ijOTB82
         8LIA==
X-Gm-Message-State: AOAM530TToIvCjDqTdzEaurY01CcoL0r5M1tLIbN0LG9iV2qGDB8RwPj
        UXuDdkn2vEMIy8QlI8Koyu2/apzOhQ0Gx2KbFzrTYPONeJb1Ggv//NMWmdRbFIlmpVGdmkG/gxb
        0FeYThbhZiqgTWo7ghIpz9uGydD64ng==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr23317031wrr.365.1591622040278;
        Mon, 08 Jun 2020 06:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0mw38SC76us+yA4APa14YtmbDH9EgYY0l4Bq9aq3Nopgtl4FDPxorIcA7+Zqk+1xTIiSvEg==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr23317006wrr.365.1591622040023;
        Mon, 08 Jun 2020 06:14:00 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id z7sm22822774wrt.6.2020.06.08.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 06:13:59 -0700 (PDT)
Date:   Mon, 8 Jun 2020 09:13:57 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH] rpmsg: virtio: add endianness conversions
Message-ID: <20200608091215-mutt-send-email-mst@kernel.org>
References: <20200608123932.GF10562@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608123932.GF10562@ubuntu>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 08, 2020 at 02:39:32PM +0200, Guennadi Liakhovetski wrote:
> According to the VirtIO 1.0 spec data, sent over virtual queues must
> be in little-endian format. Update the RPMsg VirtIO implementation
> to enforce that.
> 
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 61 ++++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 07d4f33..b8ff42b 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -11,6 +11,8 @@
>  
>  #define pr_fmt(fmt) "%s: " fmt, __func__
>  
> +#include <asm/byteorder.h>
> +
>  #include <linux/dma-mapping.h>
>  #include <linux/idr.h>
>  #include <linux/jiffies.h>
> @@ -22,6 +24,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> +#include <linux/types.h>
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
> +	__le32 src;
> +	__le32 dst;
> +	__le32 reserved;
> +	__le16 len;
> +	__le16 flags;
>  	u8 data[];
>  } __packed;
>

I really has __virtio32/virtio16  types in mind.
This way existing BE setups (if any!) can keep working.

However if RPMSG maintainers want this, that's also fine
by me ...


  
> @@ -106,8 +109,8 @@ struct rpmsg_hdr {
>   */
>  struct rpmsg_ns_msg {
>  	char name[RPMSG_NAME_SIZE];
> -	u32 addr;
> -	u32 flags;
> +	__le32 addr;
> +	__le32 flags;
>  } __packed;
>  
>  /**
> @@ -335,8 +338,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->ept->addr;
> -		nsm.flags = RPMSG_NS_CREATE;
> +		nsm.addr = cpu_to_le32(rpdev->ept->addr);
> +		nsm.flags = cpu_to_le32(RPMSG_NS_CREATE);
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>  		if (err)
> @@ -359,8 +362,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->ept->addr;
> -		nsm.flags = RPMSG_NS_DESTROY;
> +		nsm.addr = cpu_to_le32(rpdev->ept->addr);
> +		nsm.flags = cpu_to_le32(RPMSG_NS_DESTROY);
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>  		if (err)
> @@ -612,15 +615,15 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  		}
>  	}
>  
> -	msg->len = len;
> +	msg->len = cpu_to_le16(len);
>  	msg->flags = 0;
> -	msg->src = src;
> -	msg->dst = dst;
> +	msg->src = cpu_to_le32(src);
> +	msg->dst = cpu_to_le32(dst);
>  	msg->reserved = 0;
>  	memcpy(msg->data, data, len);
>  
>  	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
> -		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> +		src, dst, len, msg->flags, msg->reserved);
>  #if defined(CONFIG_DYNAMIC_DEBUG)
>  	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
>  			 msg, sizeof(*msg) + msg->len, true);
> @@ -704,13 +707,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  {
>  	struct rpmsg_endpoint *ept;
>  	struct scatterlist sg;
> +	unsigned int msg_len = le16_to_cpu(msg->len);
>  	int err;
>  
>  	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> -		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> +		le32_to_cpu(msg->src), le32_to_cpu(msg->dst), msg_len,
> +		le16_to_cpu(msg->flags), le32_to_cpu(msg->reserved));
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
> +	ept = idr_find(&vrp->endpoints, le32_to_cpu(msg->dst));
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
> +				le32_to_cpu(msg->src));
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
> +	chinfo.dst = le32_to_cpu(msg->addr);
> +
> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
> +		 le32_to_cpu(msg->flags) & RPMSG_NS_DESTROY ? "destroy" : "creat",
> +		 msg->name, chinfo.dst);
>  
> -	if (msg->flags & RPMSG_NS_DESTROY) {
> +	if (le32_to_cpu(msg->flags) & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> -- 
> 1.9.3

