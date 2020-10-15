Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACA9C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 19:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2B90206DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 19:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iviUzr7N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgJOTcq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Oct 2020 15:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730192AbgJOTcq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 15:32:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A67C0613D2
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2020 12:32:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gv6so189864pjb.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2020 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w1x73aeVF4EkLTSqICXzgDqIALvOgzawfcc3sqn6vPQ=;
        b=iviUzr7NZRtKUH3I6clYxSnWDP6+48L0qnDd46FIK30VhIEJjHqJQne9FNJYEHsn7O
         TewtMVUsg+Ssl6JnP7FiofbkOEzSYoaRcSqCEnW1rTSUEAKsGNUWYV0/bvDtaWX9RdtS
         YgbZOlDNDLzHl0VZtOjGm3phQdXgDm+4h4ldnP6Anp46fn+kOa/zXzCrgGe0wFBUjkHQ
         +9gTo7EOWBYLLW/tcTVQRpazvgNYJCG39GTzM7+9j6UD/zCqIatn6jEivDXtNL4IGgje
         MaFRJ+RnmqiCv1NWiwAV5Cp/hmeCrJTEvHwCOJNQNzCM1YZY9hOs8Eqqo01rk/PhFZeZ
         +8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w1x73aeVF4EkLTSqICXzgDqIALvOgzawfcc3sqn6vPQ=;
        b=PZ5i60pt6lIvKYr6yGtCWnW8JGNeJe76sRL3YKaDSueYvZTGCg223Oy47MlagyKM/X
         xEbFtR+DJTOLe/IznaJHEU0JPemPm3SQqABifd3OUS/H8OgL3eBiHAGffr03HL+ZegKu
         69Hf9bpen7++y1Z4kc1anN6DLRFsGTTkWmStWTZFi8SHYkQEXtPScqpzLg+npNPNxhFM
         F2+KD6H1jkWt0v75z/NmvTx0hbiXFjeCdWG2Oy/B04tQ38xxth0exbiFWStoSoYLMxbe
         ARdlLgx2uW3dZbF14eOhMV3fgfErHAmY1/TzCBBCPuq5k8m82zap/J1pE+9ykQxaqX7l
         tGgg==
X-Gm-Message-State: AOAM530JUuMypX4svMfwSlKL/Kp7lrnZ5VI9Sbz4GivrwuNVSmwI5PEK
        YomzmvWbcc4K3loGq+tCn6iPVg==
X-Google-Smtp-Source: ABdhPJxwqd+LeNqpUUpKqYt+aCk43M6SKGHruqF+l60sOzOWsXKGKKWn/dKM2kWjLIwJ4RYtN6BoMw==
X-Received: by 2002:a17:902:b7c3:b029:d4:bc6e:8aae with SMTP id v3-20020a170902b7c3b02900d4bc6e8aaemr296093plz.12.1602790365641;
        Thu, 15 Oct 2020 12:32:45 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y137sm54277pfc.77.2020.10.15.12.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:32:45 -0700 (PDT)
Date:   Thu, 15 Oct 2020 13:32:43 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] rpmsg: Introduce __rpmsg{16|32|64} types
Message-ID: <20201015193243.GD1450102@xps15>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
 <20201013232519.1367542-3-mathieu.poirier@linaro.org>
 <03448851-b959-3f56-5618-d31a7b712392@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03448851-b959-3f56-5618-d31a7b712392@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

On Wed, Oct 14, 2020 at 06:31:49PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 10/14/20 1:25 AM, Mathieu Poirier wrote:
> > Introduce __rpmsg{16|32|64} types along with byte order conversion
> > functions based on an rpmsg_device operation as a foundation to
> > make RPMSG modular and transport agnostic.
> > 
> > Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  include/linux/rpmsg.h            | 51 ++++++++++++++++++++++++
> >  include/linux/rpmsg_byteorder.h  | 67 ++++++++++++++++++++++++++++++++
> >  include/uapi/linux/rpmsg_types.h | 11 ++++++
> >  3 files changed, 129 insertions(+)
> >  create mode 100644 include/linux/rpmsg_byteorder.h
> >  create mode 100644 include/uapi/linux/rpmsg_types.h
> > 
> > diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > index 9fe1c54ae995..165e4c6d4cd3 100644
> > --- a/include/linux/rpmsg.h
> > +++ b/include/linux/rpmsg.h
> > @@ -17,6 +17,7 @@
> >  #include <linux/kref.h>
> >  #include <linux/mutex.h>
> >  #include <linux/poll.h>
> > +#include <linux/rpmsg_byteorder.h>
> >  
> >  #define RPMSG_ADDR_ANY		0xFFFFFFFF
> >  
> > @@ -40,6 +41,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> >  
> >  /**
> >   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> > + * @is_little_endian:	returns true if using little endian byte ordering
> >   * @create_ept:		create backend-specific endpoint, required
> >   * @announce_create:	announce presence of new channel, optional
> >   * @announce_destroy:	announce destruction of channel, optional
> > @@ -49,6 +51,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> >   * advertise new channels implicitly by creating the endpoints.
> >   */
> >  struct rpmsg_device_ops {
> > +	bool (*is_little_endian)(struct rpmsg_device *rpdev);
> >  	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
> >  					    rpmsg_rx_cb_t cb, void *priv,
> >  					    struct rpmsg_channel_info chinfo);
> > @@ -129,6 +132,54 @@ struct rpmsg_driver {
> >  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> >  };
> >  
> > +static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> > +{
> > +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
> > +		return __rpmsg16_to_cpu(rpmsg_is_little_endian(), val);
> > +	else
> > +		return __rpmsg16_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
> > +}
> > +
> > +static inline __rpmsg16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
> > +{
> > +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
> > +		return __cpu_to_rpmsg16(rpmsg_is_little_endian(), val);
> > +	else
> > +		return __cpu_to_rpmsg16(rpdev->ops->is_little_endian(rpdev), val);
> > +}
> > +
> > +static inline u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, __rpmsg32 val)
> > +{
> > +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
> > +		return __rpmsg32_to_cpu(rpmsg_is_little_endian(), val);
> > +	else
> > +		return __rpmsg32_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
> > +}
> > +
> > +static inline __rpmsg32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
> > +{
> > +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
> > +		return __cpu_to_rpmsg32(rpmsg_is_little_endian(), val);
> > +	else
> > +		return __cpu_to_rpmsg32(rpdev->ops->is_little_endian(rpdev), val);
> > +}
> > +
> > +static inline u64 rpmsg64_to_cpu(struct rpmsg_device *rpdev, __rpmsg64 val)
> > +{
> > +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
> > +		return __rpmsg64_to_cpu(rpmsg_is_little_endian(), val);
> > +	else
> > +		return __rpmsg64_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
> > +}
> > +
> > +static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
> > +{
> > +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
> > +		return __cpu_to_rpmsg64(rpmsg_is_little_endian(), val);
> > +	else
> > +		return __cpu_to_rpmsg64(rpdev->ops->is_little_endian(rpdev), val);
> > +}
> > +
> >  #if IS_ENABLED(CONFIG_RPMSG)
> >  
> >  int register_rpmsg_device(struct rpmsg_device *dev);
> > diff --git a/include/linux/rpmsg_byteorder.h b/include/linux/rpmsg_byteorder.h
> > new file mode 100644
> > index 000000000000..c0f565dbad6d
> > --- /dev/null
> > +++ b/include/linux/rpmsg_byteorder.h
> > @@ -0,0 +1,67 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Follows implementation found in linux/virtio_byteorder.h
> > + */
> > +#ifndef _LINUX_RPMSG_BYTEORDER_H
> > +#define _LINUX_RPMSG_BYTEORDER_H
> > +#include <linux/types.h>
> > +#include <uapi/linux/rpmsg_types.h>
> > +
> > +static inline bool rpmsg_is_little_endian(void)
> > +{
> > +#ifdef __LITTLE_ENDIAN
> > +	return true;
> > +#else
> > +	return false;
> > +#endif
> > +}
> 
> A suggestion:
> 
> static inline bool rpmsg_is_little_endian(void)
> #if defined(__BYTE_ORDER)
> #  if __BYTE_ORDER == __BIG_ENDIAN
> 	return true;
> #  elif __BYTE_ORDER == __LITTLE_ENDIAN
> 	return false;
> #  else
> #    warning "unknown endianess, set to little by default"
> 	return true;
> #  endif
> #endif
> }

I found that __BYTE_ORDER is not defined stm32mp157 - have you used it before? 

> 
> Otherwise
> 
> Reviewed-by:  Arnaud Pouliquen <arnaud.pouliquen@st.com>
> 
> Thanks,
> Arnaud
> 
> > +
> > +static inline u16 __rpmsg16_to_cpu(bool little_endian, __rpmsg16 val)
> > +{
> > +	if (little_endian)
> > +		return le16_to_cpu((__force __le16)val);
> > +	else
> > +		return be16_to_cpu((__force __be16)val);
> > +}
> > +
> > +static inline __rpmsg16 __cpu_to_rpmsg16(bool little_endian, u16 val)
> > +{
> > +	if (little_endian)
> > +		return (__force __rpmsg16)cpu_to_le16(val);
> > +	else
> > +		return (__force __rpmsg16)cpu_to_be16(val);
> > +}
> > +
> > +static inline u32 __rpmsg32_to_cpu(bool little_endian, __rpmsg32 val)
> > +{
> > +	if (little_endian)
> > +		return le32_to_cpu((__force __le32)val);
> > +	else
> > +		return be32_to_cpu((__force __be32)val);
> > +}
> > +
> > +static inline __rpmsg32 __cpu_to_rpmsg32(bool little_endian, u32 val)
> > +{
> > +	if (little_endian)
> > +		return (__force __rpmsg32)cpu_to_le32(val);
> > +	else
> > +		return (__force __rpmsg32)cpu_to_be32(val);
> > +}
> > +
> > +static inline u64 __rpmsg64_to_cpu(bool little_endian, __rpmsg64 val)
> > +{
> > +	if (little_endian)
> > +		return le64_to_cpu((__force __le64)val);
> > +	else
> > +		return be64_to_cpu((__force __be64)val);
> > +}
> > +
> > +static inline __rpmsg64 __cpu_to_rpmsg64(bool little_endian, u64 val)
> > +{
> > +	if (little_endian)
> > +		return (__force __rpmsg64)cpu_to_le64(val);
> > +	else
> > +		return (__force __rpmsg64)cpu_to_be64(val);
> > +}
> > +
> > +#endif /* _LINUX_RPMSG_BYTEORDER_H */
> > diff --git a/include/uapi/linux/rpmsg_types.h b/include/uapi/linux/rpmsg_types.h
> > new file mode 100644
> > index 000000000000..36e3b9404391
> > --- /dev/null
> > +++ b/include/uapi/linux/rpmsg_types.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +#ifndef _UAPI_LINUX_RPMSG_TYPES_H
> > +#define _UAPI_LINUX_RPMSG_TYPES_H
> > +
> > +#include <linux/types.h>
> > +
> > +typedef __u16 __bitwise __rpmsg16;
> > +typedef __u32 __bitwise __rpmsg32;
> > +typedef __u64 __bitwise __rpmsg64;
> > +
> > +#endif /* _UAPI_LINUX_RPMSG_TYPES_H */
> > 
