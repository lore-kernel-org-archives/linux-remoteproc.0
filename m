Return-Path: <SRS0=A2u3=D3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D8FC433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8693C223BF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="sRIpVF35"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404828AbgJTHHK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Oct 2020 03:07:10 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57464 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404793AbgJTHHK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Oct 2020 03:07:10 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09K6vhij026952;
        Tue, 20 Oct 2020 09:07:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=AbyBXYQMSY/j33fnHvZd5ZjDsC1/dkjqZFY4XRJQcKA=;
 b=sRIpVF35CnK+MYwqZTM1q4+KLAXJi9U3gbBiy9WabEZHiSNGInFQj6WXMeKy/INmAogi
 Z9r9lmOwVcRcILhVRtUOpJf1Vlt22DLV1DWuw4LUWyZPncIl1cFvF11PH/j2oFUoX3Kd
 bdvjMfpruytB9/nS4z9FnTMG4dQ2AXO0se7AZ2OEEq8RNQxep5nF15mRcIC0K7zUe8jL
 UdzJiaTOof+fxwH2C51tv34fw0noiB2+z6Rmr9wTcQwUU2DyImrNLHSztvKQMl5KgK6o
 kI8E62XHWSgEuaKcBvH9Ew8LC8eNT+Kv1fy1Ij9p3FgZhncQaqnKV65Z1eIgNKCO4s3A Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347qgg15hh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 09:07:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08B87100034;
        Tue, 20 Oct 2020 09:07:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA3182ADA19;
        Tue, 20 Oct 2020 09:07:02 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 09:07:01 +0200
Subject: Re: [PATCH v3 3/8] rpmsg: Move structure rpmsg_ns_msg to header file
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
 <20201019203438.501174-4-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <95a5b23a-a2f6-bb62-4bc3-28fc16afadb4@st.com>
Date:   Tue, 20 Oct 2020 09:07:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019203438.501174-4-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_03:2020-10-16,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/19/20 10:34 PM, Mathieu Poirier wrote:
> Move structure rpmsg_ns_msg to its own header file so that
> it can be used by other entities.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 32 +-----------------------
>  include/linux/rpmsg_ns.h         | 42 ++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 31 deletions(-)
>  create mode 100644 include/linux/rpmsg_ns.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8927bcad56fd..1f8154ee1e90 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_device.h>
>  #include <linux/rpmsg.h>
>  #include <linux/rpmsg_byteorder.h>
> +#include <linux/rpmsg_ns.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> @@ -93,34 +94,6 @@ struct rpmsg_hdr {
>  	u8 data[];
>  } __packed;
>  
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
>  
>  /**
>   * @vrp: the remote processor this channel belongs to
> @@ -162,9 +135,6 @@ struct virtio_rpmsg_channel {
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
> index 000000000000..bb479f430080
> --- /dev/null
> +++ b/include/linux/rpmsg_ns.h
> @@ -0,0 +1,42 @@
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
> +
> +#endif
> 
