Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B49C433E7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 19:46:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEA29206D5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 19:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHoiDCRM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391876AbgJOTqd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Oct 2020 15:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391865AbgJOTq3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 15:46:29 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AF0C0613D2
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2020 12:46:23 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id c20so38464pfr.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2020 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2B6qPsmlvYOq1VJmS3Fb59bMhTPVla3w+kRhwR0csHI=;
        b=GHoiDCRMPQe5eEw4lCoxQTi8hMI3fsc7zcLU76wc3KMpShLXGIYNnbE+sloA2kMpB4
         lluKlnO6fDNshGAwzvXGjDePDzs7DKIhec8ZDH3OPr43KZzZ1aheLqPMIQmjyeGlQmBs
         PoINOSjy7wUe08WWrqzlW1PVy5zr9Z0imNe/14J4Dc4C42YFo8CWvI79BcZ2zX7FIyiC
         ZoGRjy0+UY2cy+78Z0RKizXwBi8NFCxgp3U47X3ldjdsemxXBj9MGtUfdNkJNi7JmwcA
         m5SvoFJ1VWoF0O9AhaxDIOD4WVB4/oTi0vd9XptHVQg6lGnvs+wSY7aNDCmT2hjRPf/g
         MuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2B6qPsmlvYOq1VJmS3Fb59bMhTPVla3w+kRhwR0csHI=;
        b=gE7krMbeurxNzkTIrzq0xzQ+IG0lUBDIA8hiZZMUFSnYnc0rw34fXrUVj0quIRoLol
         zheX7pwJQKMbQGZW4vMB9BDmwz8Ed4nGTFIy2I8TI/eY9y7mZJZN9MIWVYlCqXqruURK
         1fU6eXi8kz3MrUael0l7YLAd9LX+4kn+Pb23xKmKw/R24vEEevtxUcJSc9S3L4GZV5CQ
         UIYZvV3eS6Krczf6S8qgx3IyA88EH0f1537DB3XhKikbjfKgXv4bVr3WifrRpuXsYfAq
         re3ojYU0+uks3a+HGI50STnFH2ZYdA2otKleMz6MzlB5Jhxayxo3RQ9HY4c4v1Q71OIi
         vzsg==
X-Gm-Message-State: AOAM5321mP7CQokiSMT0Fe3mYzg9BXuRgMGWFZwdRmwFw1RQX0PTGGlW
        KVUP16hbuwg4Oa7OmNUi4O0FFg==
X-Google-Smtp-Source: ABdhPJyQBp3cQsDOk0QxrJlQ5t/uv/1rbAtsI0N1/jx6Ynjk0QCu4h7IympQLLVq2LSrDhRD1x5hWg==
X-Received: by 2002:a63:db44:: with SMTP id x4mr118776pgi.435.1602791182999;
        Thu, 15 Oct 2020 12:46:22 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 14sm50893pfy.192.2020.10.15.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:46:22 -0700 (PDT)
Date:   Thu, 15 Oct 2020 13:46:20 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/9] rpmsg: virtio: Move from virtio to rpmsg byte
 conversion
Message-ID: <20201015194620.GE1450102@xps15>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
 <20201013232519.1367542-4-mathieu.poirier@linaro.org>
 <0264d2f6-22c7-6c6d-0db4-05fd9e0b1121@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0264d2f6-22c7-6c6d-0db4-05fd9e0b1121@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Oct 14, 2020 at 07:04:32PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 10/14/20 1:25 AM, Mathieu Poirier wrote:
> > Use rpmsg byte conversion functions in order for the RPMSG
> > headers and generic functions to be used by external entities.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 60 +++++++++++++++++++-------------
> >  1 file changed, 35 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 9006fc7f73d0..793fe924671f 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -19,11 +19,11 @@
> >  #include <linux/mutex.h>
> >  #include <linux/of_device.h>
> >  #include <linux/rpmsg.h>
> > +#include <linux/rpmsg_byteorder.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/sched.h>
> >  #include <linux/virtio.h>
> > -#include <linux/virtio_byteorder.h>
> >  #include <linux/virtio_ids.h>
> >  #include <linux/virtio_config.h>
> >  #include <linux/wait.h>
> > @@ -85,11 +85,11 @@ struct virtproc_info {
> >   * Every message sent(/received) on the rpmsg bus begins with this header.
> >   */
> >  struct rpmsg_hdr {
> > -	__virtio32 src;
> > -	__virtio32 dst;
> > -	__virtio32 reserved;
> > -	__virtio16 len;
> > -	__virtio16 flags;
> > +	__rpmsg32 src;
> > +	__rpmsg32 dst;
> > +	__rpmsg32 reserved;
> > +	__rpmsg16 len;
> > +	__rpmsg16 flags;
> >  	u8 data[];
> >  } __packed;
> >  
> > @@ -107,8 +107,8 @@ struct rpmsg_hdr {
> >   */
> >  struct rpmsg_ns_msg {
> >  	char name[RPMSG_NAME_SIZE];
> > -	__virtio32 addr;
> > -	__virtio32 flags;
> > +	__rpmsg32 addr;
> > +	__rpmsg32 flags;
> >  } __packed;
> >  
> >  /**
> > @@ -280,6 +280,14 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
> >  	return NULL;
> >  }
> >  
> > +static bool virtio_rpmsg_is_little_endian(struct rpmsg_device *rpdev)
> > +{
> > +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> > +	struct virtproc_info *vrp = vch->vrp;
> > +
> > +	return virtio_is_little_endian(vrp->vdev);
> > +}
> 
> Regarding this i wonder if the endianess could not be a rpmsg_device field that would be set on 
> __rpmsg_create_channel?
> I don't think that the endianess could change, so perhaps no need to call ops for each conversion
> using interface implemented in rpmsg.h...

That's a valid point - I certainly don't expect the endianness to change
dynamically.

> But perhaps I missed something?
>  
> > +
> >  static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev,
> >  						      rpmsg_rx_cb_t cb,
> >  						      void *priv,
> > @@ -336,8 +344,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
> >  		struct rpmsg_ns_msg nsm;
> >  
> >  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> > -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
> > +		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
> > +		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_CREATE);
> >  
> >  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> >  		if (err)
> > @@ -360,8 +368,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> >  		struct rpmsg_ns_msg nsm;
> >  
> >  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> > -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
> > +		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
> > +		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_DESTROY);
> >  
> >  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> >  		if (err)
> > @@ -372,6 +380,7 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> >  }
> >  
> >  static const struct rpmsg_device_ops virtio_rpmsg_ops = {
> > +	.is_little_endian = virtio_rpmsg_is_little_endian,
> >  	.create_ept = virtio_rpmsg_create_ept,
> >  	.announce_create = virtio_rpmsg_announce_create,
> >  	.announce_destroy = virtio_rpmsg_announce_destroy,
> > @@ -613,10 +622,10 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >  		}
> >  	}
> >  
> > -	msg->len = cpu_to_virtio16(vrp->vdev, len);
> > +	msg->len = cpu_to_rpmsg16(rpdev, len);
> >  	msg->flags = 0;
> > -	msg->src = cpu_to_virtio32(vrp->vdev, src);
> > -	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
> > +	msg->src = cpu_to_rpmsg32(rpdev, src);
> > +	msg->dst = cpu_to_rpmsg32(rpdev, dst);
> >  	msg->reserved = 0;
> >  	memcpy(msg->data, data, len);
> >  
> > @@ -705,14 +714,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  {
> >  	struct rpmsg_endpoint *ept;
> >  	struct scatterlist sg;
> > -	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
> > +	bool little_endian = rpmsg_is_little_endian();
> > +	unsigned int msg_len = __rpmsg16_to_cpu(little_endian, msg->len);
> >  	int err;
> >  
> >  	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> > -		virtio32_to_cpu(vrp->vdev, msg->src),
> > -		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
> > -		virtio16_to_cpu(vrp->vdev, msg->flags),
> > -		virtio32_to_cpu(vrp->vdev, msg->reserved));
> > +		__rpmsg32_to_cpu(little_endian, msg->src),
> > +		__rpmsg32_to_cpu(little_endian, msg->dst), msg_len,
> > +		__rpmsg16_to_cpu(little_endian, msg->flags),
> > +		__rpmsg32_to_cpu(little_endian, msg->reserved));
> 
> Nitpicking: sometime rpmsgXX_to_cpu is used, sometime __rpmsgXX_to_cpu, 
> Perhaps only one API should be used... But i don't see any blocking point to use both...:)

Here we have to use __rpmsgXX_to_CPU() because the rpmsg_device is not
available.  It could be fixed but would require a serious amount of refactoring
for little value.  Moreover since this rpmsg_recv_single() is specific to the
virtIO implementation the end result is the same.

> 
> Thanks,
> Arnaud
> 
> >  #if defined(CONFIG_DYNAMIC_DEBUG)
> >  	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
> >  			 msg, sizeof(*msg) + msg_len, true);
> > @@ -731,7 +741,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  	/* use the dst addr to fetch the callback of the appropriate user */
> >  	mutex_lock(&vrp->endpoints_lock);
> >  
> > -	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
> > +	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
> >  
> >  	/* let's make sure no one deallocates ept while we use it */
> >  	if (ept)
> > @@ -745,7 +755,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >  
> >  		if (ept->cb)
> >  			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
> > -				virtio32_to_cpu(vrp->vdev, msg->src));
> > +				__rpmsg32_to_cpu(little_endian, msg->src));
> >  
> >  		mutex_unlock(&ept->cb_lock);
> >  
> > @@ -853,13 +863,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> >  
> >  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> >  	chinfo.src = RPMSG_ADDR_ANY;
> > -	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> > +	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
> >  
> >  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> > -		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> > +		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
> >  		 "destroy" : "creat", msg->name, chinfo.dst);
> >  
> > -	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> > +	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
> >  		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
> >  		if (ret)
> >  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> > 
