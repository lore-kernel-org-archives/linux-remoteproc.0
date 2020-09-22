Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9209FC2D0E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 19:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 381DD221E8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 19:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQxekdD0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgIVTg2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIVTg2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 15:36:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302BFC0613CF
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2020 12:36:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z18so13419454pfg.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2020 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CKUsU4rGCjPdd85QoQQ1kiVyYWJjlgX/KsDHYXuRhPU=;
        b=LQxekdD0+kO/mILq5QyHpgXU1VZUKLABcLs1BzX9O8izYzJtqvRQEHCggkik2Hyv1P
         Lee4swixhgFAlTmhrGYtusxdK+Mha6J3CPf0ZBtuH4FtOQawZJodkvpL4jcorukf+I4Z
         p+J6f+zbPoyUY2Es7Zk9+qkwHfyW8WbAHTLE7x7mh1flldf8zRLLjyId+GcVrPa+gK3y
         8P5JqJhgTD+mLMn5iq3ClEowjALRElucb2fK5lMj9fh6plFI7W5P3wOnIl+ms623KldZ
         3eQ9C0pUhqCpmi47cVIAbccjqYje7hFbyT7th3RrUeEOEmCTiUIJ8tngSShrl0eW9N2m
         OVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CKUsU4rGCjPdd85QoQQ1kiVyYWJjlgX/KsDHYXuRhPU=;
        b=l+bfwlp9xm7heExSwEelKkL1xBlI2xtupwYOlA1QrfY5hl4cZk3w96gShhr2wXxo0I
         sDF0Xkw/zqJCAMn/vMyHKbCrHc2mUTM5K1iIgai/NBs0IPHBBH5ZynmDAEgg346pKXIJ
         rwXShpxUgP1jTi/7RXnNotkKPkoQ+UEHQCxLKaHb6B/Ro6NUMS/yxPhJW/qLc3A+a4Hr
         dQlqYqLhD2QcAebf8vPVUAQ+/m6hn4X5n62P94+30U9EmQtswxvA0iDVKxwqkbqSjlda
         CJCviu3GUlMkgJagEpzcfIZ3UOgOoJD6q9zQMRvtG7pd5GDZ7fphYNCiLarNxioYgjyY
         zIqw==
X-Gm-Message-State: AOAM532p+WK4xqEwlotOjSKi5RPYPXoIWVcqt0YtciXb8Cl6ku9qIe0O
        NfJ7bg2dd3ZUKa6v2c7fENPOGg==
X-Google-Smtp-Source: ABdhPJyvEuzNa5bRaVU/3Q4qTACKFEV3JfPcqmjs6l69LLrZ7LKkSgG1ZY5VkjVDwniqqcSi6ZGwBw==
X-Received: by 2002:a65:51c7:: with SMTP id i7mr5003444pgq.325.1600803387544;
        Tue, 22 Sep 2020 12:36:27 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w203sm15665023pfc.97.2020.09.22.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:36:26 -0700 (PDT)
Date:   Tue, 22 Sep 2020 13:36:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] rpmsg: Move common structures and defines to
 headers
Message-ID: <20200922193624.GB931970@xps15>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-5-mathieu.poirier@linaro.org>
 <fd8601fe-355e-de80-6eb9-06c9e464e53d@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd8601fe-355e-de80-6eb9-06c9e464e53d@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 22, 2020 at 04:26:23PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 9/22/20 2:09 AM, Mathieu Poirier wrote:
> > From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > 
> > virtio_rpmsg_bus.c keeps RPMsg protocol structure declarations and
> > common defines like the ones, needed for name-space announcements,
> > internal. Move them to common headers instead.
> > 
> > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > [Renamed header file from linux/rpmsg/rpmsg_virtio.h to linux/rpmsg_ns.h]
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 78 +-----------------------------
> >  include/linux/rpmsg_ns.h         | 83 ++++++++++++++++++++++++++++++++
> >  include/uapi/linux/rpmsg.h       |  3 ++
> >  3 files changed, 88 insertions(+), 76 deletions(-)
> >  create mode 100644 include/linux/rpmsg_ns.h
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index e87cf0b79542..eaf3b2c012c8 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/of_device.h>
> >  #include <linux/rpmsg.h>
> > +#include <linux/rpmsg_ns.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/sched.h>
> > @@ -27,6 +28,7 @@
> >  #include <linux/virtio_ids.h>
> >  #include <linux/virtio_config.h>
> >  #include <linux/wait.h>
> > +#include <uapi/linux/rpmsg.h>
> >  
> >  #include "rpmsg_internal.h"
> >  
> > @@ -70,58 +72,6 @@ struct virtproc_info {
> >  	struct rpmsg_endpoint *ns_ept;
> >  };
> >  
> > -/* The feature bitmap for virtio rpmsg */
> > -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> > -
> > -/**
> > - * struct rpmsg_hdr - common header for all rpmsg messages
> > - * @src: source address
> > - * @dst: destination address
> > - * @reserved: reserved for future use
> > - * @len: length of payload (in bytes)
> > - * @flags: message flags
> > - * @data: @len bytes of message payload data
> > - *
> > - * Every message sent(/received) on the rpmsg bus begins with this header.
> > - */
> > -struct rpmsg_hdr {
> > -	__virtio32 src;
> > -	__virtio32 dst;
> > -	__virtio32 reserved;
> > -	__virtio16 len;
> > -	__virtio16 flags;
> > -	u8 data[];
> > -} __packed;
> > -
> > -/**
> > - * struct rpmsg_ns_msg - dynamic name service announcement message
> > - * @name: name of remote service that is published
> > - * @addr: address of remote service that is published
> > - * @flags: indicates whether service is created or destroyed
> > - *
> > - * This message is sent across to publish a new service, or announce
> > - * about its removal. When we receive these messages, an appropriate
> > - * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> > - * or ->remove() handler of the appropriate rpmsg driver will be invoked
> > - * (if/as-soon-as one is registered).
> > - */
> > -struct rpmsg_ns_msg {
> > -	char name[RPMSG_NAME_SIZE];
> > -	__virtio32 addr;
> > -	__virtio32 flags;
> > -} __packed;
> > -
> > -/**
> > - * enum rpmsg_ns_flags - dynamic name service announcement flags
> > - *
> > - * @RPMSG_NS_CREATE: a new remote service was just created
> > - * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> > - */
> > -enum rpmsg_ns_flags {
> > -	RPMSG_NS_CREATE		= 0,
> > -	RPMSG_NS_DESTROY	= 1,
> > -};
> > -
> >  /**
> >   * struct virtio_rpmsg_channel - rpmsg channel descriptor
> >   * @rpdev: the rpmsg channel device
> > @@ -139,27 +89,6 @@ struct virtio_rpmsg_channel {
> >  #define to_virtio_rpmsg_channel(_rpdev) \
> >  	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
> >  
> > -/*
> > - * We're allocating buffers of 512 bytes each for communications. The
> > - * number of buffers will be computed from the number of buffers supported
> > - * by the vring, upto a maximum of 512 buffers (256 in each direction).
> > - *
> > - * Each buffer will have 16 bytes for the msg header and 496 bytes for
> > - * the payload.
> > - *
> > - * This will utilize a maximum total space of 256KB for the buffers.
> > - *
> > - * We might also want to add support for user-provided buffers in time.
> > - * This will allow bigger buffer size flexibility, and can also be used
> > - * to achieve zero-copy messaging.
> > - *
> > - * Note that these numbers are purely a decision of this driver - we
> > - * can change this without changing anything in the firmware of the remote
> > - * processor.
> > - */
> > -#define MAX_RPMSG_NUM_BUFS	(512)
> > -#define MAX_RPMSG_BUF_SIZE	(512)
> > -
> >  /*
> >   * Local addresses are dynamically allocated on-demand.
> >   * We do not dynamically assign addresses from the low 1024 range,
> > @@ -167,9 +96,6 @@ struct virtio_rpmsg_channel {
> >   */
> >  #define RPMSG_RESERVED_ADDRESSES	(1024)
> >  
> > -/* Address 53 is reserved for advertising remote services */
> > -#define RPMSG_NS_ADDR			(53)
> > -
> >  static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
> >  static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
> >  static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> > diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> > new file mode 100644
> > index 000000000000..aabc6c3c0d6d
> > --- /dev/null
> > +++ b/include/linux/rpmsg_ns.h
> > @@ -0,0 +1,83 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _LINUX_RPMSG_NS_H
> > +#define _LINUX_RPMSG_NS_H
> > +
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/types.h>
> > +#include <linux/virtio_types.h>
> 
> That means that this file is correlated with the virtio, right?
> there is a risk that It cannot be used by some platforms which not use virtio...

An astute observation...

> 
> > +
> > +/**
> > + * struct rpmsg_hdr - common header for all rpmsg messages
> > + * @src: source address
> > + * @dst: destination address
> > + * @reserved: reserved for future use
> > + * @len: length of payload (in bytes)
> > + * @flags: message flags
> > + * @data: @len bytes of message payload data
> > + *
> > + * Every message sent(/received) on the rpmsg bus begins with this header.
> > + */
> > +struct rpmsg_hdr {
> > +	__virtio32 src;
> > +	__virtio32 dst;
> > +	__virtio32 reserved;
> > +	__virtio16 len;
> > +	__virtio16 flags;
> > +	u8 data[];
> > +} __packed;
> This header is related to the virtio implementation, and represent the header of
> the RPMsgs in virtio implementation not only the ns annoucement.
> 
> What about splitting it in 2 files?
> 1) rpmsg_ns.h 
>   definitions related to the ns announcement
> 
> 2) rpmsg_virtio.h
> - definitions related to the RPMsg virtio implementation
> - This file could include the rpmsg_ns.h

Yes, that make sense.

> 
> Thanks,
> Arnaud
> 
> > +
> > +/**
> > + * struct rpmsg_ns_msg - dynamic name service announcement message
> > + * @name: name of remote service that is published
> > + * @addr: address of remote service that is published
> > + * @flags: indicates whether service is created or destroyed
> > + *
> > + * This message is sent across to publish a new service, or announce
> > + * about its removal. When we receive these messages, an appropriate
> > + * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> > + * or ->remove() handler of the appropriate rpmsg driver will be invoked
> > + * (if/as-soon-as one is registered).
> > + */
> > +struct rpmsg_ns_msg {
> > +	char name[RPMSG_NAME_SIZE];
> > +	__virtio32 addr;
> > +	__virtio32 flags;
> > +} __packed;
> > +
> > +/**
> > + * enum rpmsg_ns_flags - dynamic name service announcement flags
> > + *
> > + * @RPMSG_NS_CREATE: a new remote service was just created
> > + * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> > + */
> > +enum rpmsg_ns_flags {
> > +	RPMSG_NS_CREATE		= 0,
> > +	RPMSG_NS_DESTROY	= 1,
> > +};
> > +
> > +/*
> > + * We're allocating buffers of 512 bytes each for communications. The
> > + * number of buffers will be computed from the number of buffers supported
> > + * by the vring, upto a maximum of 512 buffers (256 in each direction).
> > + *
> > + * Each buffer will have 16 bytes for the msg header and 496 bytes for
> > + * the payload.
> > + *
> > + * This will utilize a maximum total space of 256KB for the buffers.
> > + *
> > + * We might also want to add support for user-provided buffers in time.
> > + * This will allow bigger buffer size flexibility, and can also be used
> > + * to achieve zero-copy messaging.
> > + *
> > + * Note that these numbers are purely a decision of this driver - we
> > + * can change this without changing anything in the firmware of the remote
> > + * processor.
> > + */
> > +#define MAX_RPMSG_NUM_BUFS	512
> > +#define MAX_RPMSG_BUF_SIZE	512
> > +
> > +/* Address 53 is reserved for advertising remote services */
> > +#define RPMSG_NS_ADDR		53
> > +
> > +#endif
> > diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> > index e14c6dab4223..d669c04ef289 100644
> > --- a/include/uapi/linux/rpmsg.h
> > +++ b/include/uapi/linux/rpmsg.h
> > @@ -24,4 +24,7 @@ struct rpmsg_endpoint_info {
> >  #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
> >  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
> >  
> > +/* The feature bitmap for virtio rpmsg */
> > +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> > +
> >  #endif
> > 
