Return-Path: <SRS0=LqBZ=74=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CADC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Jun 2020 20:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 614632074D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Jun 2020 20:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u47lE5VS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731517AbgFOUrM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Jun 2020 16:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731104AbgFOUrL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Jun 2020 16:47:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745B3C061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2020 13:47:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d6so400882pjs.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2020 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sY3v9sYLdx+yJk7RQ9f5Do40iq7nVqH7E+Z0rb4YUUY=;
        b=u47lE5VSuHjcXddFrSlbrFqfNA7V5UA/zItgY5njVoNcv2WLVVlXezPr7Odkjdf6+r
         d+ZHVAHZ3uzoox0+qOpfNZxaCIp7ovzRn/acKAJUvQGxn1WfeUOE5OlK8mBXSKXYkyw3
         HlkVackg2QuFJxuWZjhtBpKudBaG3QRQOjPQ6f9WcxQOEAel/GmpZzyKgfqG/a6t8KEl
         uPT5Q5Xqf9vMDhygoaAFM0dHOrqn+Fw1uBKwZWTofogOkWY1PeIMpWjYAJWuYs4+Hee/
         +ere7e95JGONp6lZaQ5U2AOqFJAg+K9tjFBhbMrbUD39PBvWRmLEQ70Pe46z1Ie3ZS37
         l0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sY3v9sYLdx+yJk7RQ9f5Do40iq7nVqH7E+Z0rb4YUUY=;
        b=r9pMJBA+YVyPJLiz6JFdm+PwWymnpIFopQPIJe8hQ8+7EekiyVqFuGY7ZIGf5qXEfs
         hVFmqA2bUh0OMHfKv8y3wyqJ71pLr0J+a8IV8VM4njiKX6ZOEomcvHcjERzNl+2RbZK1
         GIyNtIHI7h9XatXbq/CL9znc008EjF3FBTmJ3TAsvjkfsIKpkltnmF6+sEHAyEgU8FrC
         hk0pQungBfW/F0OExiKk9ZfILhBRUHM7Y02JX5fIdWzEJ6CnkexvWjAXsXH5uNGYW0Bn
         0b5y2dOFgIkPrUhXL4ikN/D1thJM1Th222fEOVjRDwYILxgqDsao8kR1rJYZqX5RK+jc
         b7Qg==
X-Gm-Message-State: AOAM532gJwjrlVe/lnYyWu4go8FQPKncwwa1cu1KafymFWSMlsTi3EYB
        tTEQgGvXh5UId6xiPdpvpb0xwA==
X-Google-Smtp-Source: ABdhPJwvhKqg6sOt6jCj4iee4PeFWI/McO2ltONXXkIj15Ue8wC4AD8PVPKZhi89GhEbkR0rSz2h4A==
X-Received: by 2002:a17:902:b493:: with SMTP id y19mr23118018plr.186.1592254030237;
        Mon, 15 Jun 2020 13:47:10 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r4sm1953911pgp.60.2020.06.15.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 13:47:09 -0700 (PDT)
Date:   Mon, 15 Jun 2020 14:47:07 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     linux-remoteproc@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH] rpmsg: virtio: add endianness conversions
Message-ID: <20200615204707.GA231755@xps15>
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

So how will this work with existing firmware?  

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

And here too, along with everything else that follows?

As Michael suggested using __virtioXY types would allow to use the
virtioXY_to_cpu() and cpu_to_virtioXY() macros, which is definitely a step in
the right direction.

Thanks,
Mathieu

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
> 
