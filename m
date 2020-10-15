Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34540C43457
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 08:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8ACA2075B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 08:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="uddb/mQm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbgJOIdf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:33:35 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:16640 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727121AbgJOIde (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 04:33:34 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09F8WPPL003759;
        Thu, 15 Oct 2020 10:33:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ssz2w8iggOqN04KJMoAoY3TT8F1XmgIcqSfwklU3lG0=;
 b=uddb/mQmRJSSrWx1bv2biDe24fTexdMn72lOX773/1WgWS17lMlg0cTwumlJsa2uOCVE
 S2TyKLh2JEKjKeUnL4HGQ20l++Eyr3DSgSGGxmQLzsok9yAxqugQNlKUNp+WnoWub3Mq
 1l9GsuttMd/f2ls5/LdBnYrsSp5PN5hBtgBw63zR6lVu1v9d7OpOxbavBBbGQZeWfOTt
 8uV8XmHjzmHW6C/x6DvZsjhxDtwppjmiwbSo3Zpigupt+6UpQHJdm3TaW9yND4xgg7Vk
 7K+w+4cfVh9r6V2NjBTy6/IG3WiGDYAO1ifM0eEOZuUiJPTVUy34h3wvGdbN8nmbGSar NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34353wmrbj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Oct 2020 10:33:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEE6B100034;
        Thu, 15 Oct 2020 10:33:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6797205D09;
        Thu, 15 Oct 2020 10:33:27 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 10:33:26 +0200
Subject: Re: [PATCH v2 4/9] rpmsg: Move rpmsg_hr and rpmsg_ns_msg to header
 file
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
 <20201013232519.1367542-5-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <61c25983-a339-e5de-eaf7-d608a9b9771b@st.com>
Date:   Thu, 15 Oct 2020 10:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013232519.1367542-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-15_03:2020-10-14,2020-10-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 10/14/20 1:25 AM, Mathieu Poirier wrote:
> Move structures rpmsg_hdr and rpmsg_ns_msg to their own header file
> so that they can be used by other entities.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 58 ++----------------------------
>  include/linux/rpmsg_ns.h         | 62 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/rpmsg.h       |  3 ++
>  3 files changed, 67 insertions(+), 56 deletions(-)
>  create mode 100644 include/linux/rpmsg_ns.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 793fe924671f..85f2acc4ed9f 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -19,7 +19,7 @@
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/rpmsg.h>
> -#include <linux/rpmsg_byteorder.h>
> +#include <linux/rpmsg_ns.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> @@ -27,6 +27,7 @@
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
>  #include <linux/wait.h>
> +#include <uapi/linux/rpmsg.h>
>  
>  #include "rpmsg_internal.h"
>  
> @@ -70,58 +71,6 @@ struct virtproc_info {
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
> -	__rpmsg32 src;
> -	__rpmsg32 dst;
> -	__rpmsg32 reserved;
> -	__rpmsg16 len;
> -	__rpmsg16 flags;
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
> -	__rpmsg32 addr;
> -	__rpmsg32 flags;
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
>   * @vrp: the remote processor this channel belongs to
>   */
> @@ -162,9 +111,6 @@ struct virtio_rpmsg_channel {
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
> index 000000000000..3d836b8580b2
> --- /dev/null
> +++ b/include/linux/rpmsg_ns.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _LINUX_RPMSG_NS_H
> +#define _LINUX_RPMSG_NS_H
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/types.h>
> +#include <linux/rpmsg_byteorder.h>
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
> +	__rpmsg32 src;
> +	__rpmsg32 dst;
> +	__rpmsg32 reserved;
> +	__rpmsg16 len;
> +	__rpmsg16 flags;
> +	u8 data[];
> +} __packed;

This structure is not related to the rpmsg ns service but to the rpmsg bus.
If this structure has to be exposed to rpmsg client should be in rpmsg.h, but 
Is there a need to expose it for now?
I suppose that it is for vhost...As the need will depends on the implementation, 
I would suggest leaving it internally and expose only if needed, in the
related series.

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
> +	__rpmsg32 addr;
> +	__rpmsg32 flags;
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
> +/* Address 53 is reserved for advertising remote services */
> +#define RPMSG_NS_ADDR			(53)

What about my proposal [1] to put this in rpmsg.h, to create a list of
reserved Address

[1] https://lkml.org/lkml/2020/7/31/442

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

Same suggestion here,i would drop this from this series

Thanks,
Arnaud

>  #endif
> 
