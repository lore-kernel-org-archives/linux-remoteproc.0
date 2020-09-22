Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87178C4727D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 14:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15D932395C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 14:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="0qruf9o9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgIVO0d (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 10:26:33 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:1032 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726507AbgIVO0d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 10:26:33 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08MENQnY023632;
        Tue, 22 Sep 2020 16:26:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=J/bYNdMDUE7sugg4EyT9z/l9KYrxiDoi+Ejytr6pvpU=;
 b=0qruf9o96RMRLL7HhKby+VwUtTyPnEsZhc/mtqTbLfmXh6CUGuqdZB9VMwdpWT3zaGRC
 JZPKpcPjh85bGqPB5tHvdxtcyAeFb8DBVkdaLZms2r764fUB03JnmAJwKjxMUM8tHBvi
 5/KpZLmskjPuMaoZN/EWEtgLxK5hpCZehq4wKyuasHgiALvwyBlI0qZosMabDC5xoCKV
 gd/1+x0ao47k514GAqyZqSwa2f8qm71FwyjMYWpa4MdeFaNszPlpu55WKbSybeB05KSl
 hINTc4jc/9xfanEAoIG7bVJON7JgXsFhR33ocwMl3ahybGeBNYIrBZVJ4K6WROCT3D9e vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33n7480v6w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Sep 2020 16:26:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA22F100034;
        Tue, 22 Sep 2020 16:26:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA73D2B8A1A;
        Tue, 22 Sep 2020 16:26:24 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 16:26:23 +0200
Subject: Re: [PATCH 04/10] rpmsg: Move common structures and defines to
 headers
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>
CC:     Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-5-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <fd8601fe-355e-de80-6eb9-06c9e464e53d@st.com>
Date:   Tue, 22 Sep 2020 16:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922001000.899956-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-22_13:2020-09-21,2020-09-22 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 9/22/20 2:09 AM, Mathieu Poirier wrote:
> From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> 
> virtio_rpmsg_bus.c keeps RPMsg protocol structure declarations and
> common defines like the ones, needed for name-space announcements,
> internal. Move them to common headers instead.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> [Renamed header file from linux/rpmsg/rpmsg_virtio.h to linux/rpmsg_ns.h]
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 78 +-----------------------------
>  include/linux/rpmsg_ns.h         | 83 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/rpmsg.h       |  3 ++
>  3 files changed, 88 insertions(+), 76 deletions(-)
>  create mode 100644 include/linux/rpmsg_ns.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index e87cf0b79542..eaf3b2c012c8 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -19,6 +19,7 @@
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/rpmsg.h>
> +#include <linux/rpmsg_ns.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> @@ -27,6 +28,7 @@
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
>  #include <linux/wait.h>
> +#include <uapi/linux/rpmsg.h>
>  
>  #include "rpmsg_internal.h"
>  
> @@ -70,58 +72,6 @@ struct virtproc_info {
>  	struct rpmsg_endpoint *ns_ept;
>  };
>  
> -/* The feature bitmap for virtio rpmsg */
> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> -
> -/**
> - * struct rpmsg_hdr - common header for all rpmsg messages
> - * @src: source address
> - * @dst: destination address
> - * @reserved: reserved for future use
> - * @len: length of payload (in bytes)
> - * @flags: message flags
> - * @data: @len bytes of message payload data
> - *
> - * Every message sent(/received) on the rpmsg bus begins with this header.
> - */
> -struct rpmsg_hdr {
> -	__virtio32 src;
> -	__virtio32 dst;
> -	__virtio32 reserved;
> -	__virtio16 len;
> -	__virtio16 flags;
> -	u8 data[];
> -} __packed;
> -
> -/**
> - * struct rpmsg_ns_msg - dynamic name service announcement message
> - * @name: name of remote service that is published
> - * @addr: address of remote service that is published
> - * @flags: indicates whether service is created or destroyed
> - *
> - * This message is sent across to publish a new service, or announce
> - * about its removal. When we receive these messages, an appropriate
> - * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> - * or ->remove() handler of the appropriate rpmsg driver will be invoked
> - * (if/as-soon-as one is registered).
> - */
> -struct rpmsg_ns_msg {
> -	char name[RPMSG_NAME_SIZE];
> -	__virtio32 addr;
> -	__virtio32 flags;
> -} __packed;
> -
> -/**
> - * enum rpmsg_ns_flags - dynamic name service announcement flags
> - *
> - * @RPMSG_NS_CREATE: a new remote service was just created
> - * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> - */
> -enum rpmsg_ns_flags {
> -	RPMSG_NS_CREATE		= 0,
> -	RPMSG_NS_DESTROY	= 1,
> -};
> -
>  /**
>   * struct virtio_rpmsg_channel - rpmsg channel descriptor
>   * @rpdev: the rpmsg channel device
> @@ -139,27 +89,6 @@ struct virtio_rpmsg_channel {
>  #define to_virtio_rpmsg_channel(_rpdev) \
>  	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
>  
> -/*
> - * We're allocating buffers of 512 bytes each for communications. The
> - * number of buffers will be computed from the number of buffers supported
> - * by the vring, upto a maximum of 512 buffers (256 in each direction).
> - *
> - * Each buffer will have 16 bytes for the msg header and 496 bytes for
> - * the payload.
> - *
> - * This will utilize a maximum total space of 256KB for the buffers.
> - *
> - * We might also want to add support for user-provided buffers in time.
> - * This will allow bigger buffer size flexibility, and can also be used
> - * to achieve zero-copy messaging.
> - *
> - * Note that these numbers are purely a decision of this driver - we
> - * can change this without changing anything in the firmware of the remote
> - * processor.
> - */
> -#define MAX_RPMSG_NUM_BUFS	(512)
> -#define MAX_RPMSG_BUF_SIZE	(512)
> -
>  /*
>   * Local addresses are dynamically allocated on-demand.
>   * We do not dynamically assign addresses from the low 1024 range,
> @@ -167,9 +96,6 @@ struct virtio_rpmsg_channel {
>   */
>  #define RPMSG_RESERVED_ADDRESSES	(1024)
>  
> -/* Address 53 is reserved for advertising remote services */
> -#define RPMSG_NS_ADDR			(53)
> -
>  static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
>  static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
> diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> new file mode 100644
> index 000000000000..aabc6c3c0d6d
> --- /dev/null
> +++ b/include/linux/rpmsg_ns.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _LINUX_RPMSG_NS_H
> +#define _LINUX_RPMSG_NS_H
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/types.h>
> +#include <linux/virtio_types.h>

That means that this file is correlated with the virtio, right?
there is a risk that It cannot be used by some platforms which not use virtio...

> +
> +/**
> + * struct rpmsg_hdr - common header for all rpmsg messages
> + * @src: source address
> + * @dst: destination address
> + * @reserved: reserved for future use
> + * @len: length of payload (in bytes)
> + * @flags: message flags
> + * @data: @len bytes of message payload data
> + *
> + * Every message sent(/received) on the rpmsg bus begins with this header.
> + */
> +struct rpmsg_hdr {
> +	__virtio32 src;
> +	__virtio32 dst;
> +	__virtio32 reserved;
> +	__virtio16 len;
> +	__virtio16 flags;
> +	u8 data[];
> +} __packed;
This header is related to the virtio implementation, and represent the header of
the RPMsgs in virtio implementation not only the ns annoucement.

What about splitting it in 2 files?
1) rpmsg_ns.h 
  definitions related to the ns announcement

2) rpmsg_virtio.h
- definitions related to the RPMsg virtio implementation
- This file could include the rpmsg_ns.h 

Thanks,
Arnaud

> +
> +/**
> + * struct rpmsg_ns_msg - dynamic name service announcement message
> + * @name: name of remote service that is published
> + * @addr: address of remote service that is published
> + * @flags: indicates whether service is created or destroyed
> + *
> + * This message is sent across to publish a new service, or announce
> + * about its removal. When we receive these messages, an appropriate
> + * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
> + * or ->remove() handler of the appropriate rpmsg driver will be invoked
> + * (if/as-soon-as one is registered).
> + */
> +struct rpmsg_ns_msg {
> +	char name[RPMSG_NAME_SIZE];
> +	__virtio32 addr;
> +	__virtio32 flags;
> +} __packed;
> +
> +/**
> + * enum rpmsg_ns_flags - dynamic name service announcement flags
> + *
> + * @RPMSG_NS_CREATE: a new remote service was just created
> + * @RPMSG_NS_DESTROY: a known remote service was just destroyed
> + */
> +enum rpmsg_ns_flags {
> +	RPMSG_NS_CREATE		= 0,
> +	RPMSG_NS_DESTROY	= 1,
> +};
> +
> +/*
> + * We're allocating buffers of 512 bytes each for communications. The
> + * number of buffers will be computed from the number of buffers supported
> + * by the vring, upto a maximum of 512 buffers (256 in each direction).
> + *
> + * Each buffer will have 16 bytes for the msg header and 496 bytes for
> + * the payload.
> + *
> + * This will utilize a maximum total space of 256KB for the buffers.
> + *
> + * We might also want to add support for user-provided buffers in time.
> + * This will allow bigger buffer size flexibility, and can also be used
> + * to achieve zero-copy messaging.
> + *
> + * Note that these numbers are purely a decision of this driver - we
> + * can change this without changing anything in the firmware of the remote
> + * processor.
> + */
> +#define MAX_RPMSG_NUM_BUFS	512
> +#define MAX_RPMSG_BUF_SIZE	512
> +
> +/* Address 53 is reserved for advertising remote services */
> +#define RPMSG_NS_ADDR		53
> +
> +#endif
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index e14c6dab4223..d669c04ef289 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -24,4 +24,7 @@ struct rpmsg_endpoint_info {
>  #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>  
> +/* The feature bitmap for virtio rpmsg */
> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> +
>  #endif
> 
