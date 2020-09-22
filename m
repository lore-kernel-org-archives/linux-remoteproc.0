Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627C6C4363D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 14:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1F5C2395C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 14:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="C5xv+lDK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgIVOfN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 10:35:13 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:33930 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726566AbgIVOfM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 10:35:12 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08MEWKQS006543;
        Tue, 22 Sep 2020 16:35:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PzamxX9AJN7aRceX5qriwq4t1qCx7NwJJtMpaOT6rAk=;
 b=C5xv+lDKe2DXsZmN5movbx1KVIec2VS0KwGUbdbIV6WQPZD/EybvChk+HKcZIpqwhaR0
 nJGnxHhZ8ee5IGbQfJbb9vYooh3xXXSAtP5+4mDDXIlRXkm7zmcSa9JTye5rmO3lOG+B
 mxCcNkA2l3cT5zrgVKQDnc1Nb+cxrK2zZh3NjUi5c5x7Devs2mGmpmcPBnEHAHGxhUPA
 DnfYPqHtDswfnsK5lK3gPuocBIEKwadR8Tp4+EVSMUKvHHucTk/UvjqBq8dWmsYlwSaj
 agEwzRA7bZ5NH+Ay1TzIXYEI0yYmYzlGnvO+ONA2gYYRjPlnwUJvf4zGXsfwqDZVPihi fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33n7rvqg4q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Sep 2020 16:35:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BB9D10002A;
        Tue, 22 Sep 2020 16:35:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F7AF2B8A36;
        Tue, 22 Sep 2020 16:35:06 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 16:34:54 +0200
Subject: Re: [PATCH 08/10] rpmsg: core: Add RPMSG byte conversion operations
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>
CC:     Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-9-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <90c14e71-4c2b-9089-93d4-685b075873a9@st.com>
Date:   Tue, 22 Sep 2020 16:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922001000.899956-9-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-22_13:2020-09-21,2020-09-22 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/22/20 2:09 AM, Mathieu Poirier wrote:
> Add RPMSG device specific byte conversion operations as a first
> step to separate the RPMSG name space service from the virtIO
> transport layer.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_core.c     | 51 ++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h | 12 ++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 50a835eaf1ba..66ad5b5f1e87 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -20,6 +20,57 @@
>  
>  #include "rpmsg_internal.h"
>  
> +/**
> + * rpmsg{16|32}_to_cpu()
> + * cpu_to_rpmsg[16|32}() - rpmsg device specific byte conversion functions to
> + *			   perform byte conversion between rpmsg device and the
> + *			   transport layer it is operating on.
> + */
> +
> +u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, u16 val)
> +{
> +	if (WARN_ON(!rpdev))
> +		return -EINVAL;
> +	if (!rpdev->ops || !rpdev->ops->transport16_to_cpu)
> +		return -EPERM;
> +
> +	return rpdev->ops->transport16_to_cpu(rpdev, val);
> +}
> +EXPORT_SYMBOL(rpmsg16_to_cpu);
> +
> +u16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
> +{
> +	if (WARN_ON(!rpdev))
> +		return -EINVAL;
> +	if (!rpdev->ops || !rpdev->ops->cpu_to_transport16)
> +		return -EPERM;
> +
> +	return rpdev->ops->cpu_to_transport16(rpdev, val);
> +}
> +EXPORT_SYMBOL(cpu_to_rpmsg16);
> +
> +u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, u32 val)
> +{
> +	if (WARN_ON(!rpdev))
> +		return -EINVAL;
> +	if (!rpdev->ops || !rpdev->ops->transport32_to_cpu)
> +		return -EPERM;
> +
> +	return rpdev->ops->transport32_to_cpu(rpdev, val);
> +}
> +EXPORT_SYMBOL(rpmsg32_to_cpu);
> +
> +u32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
> +{
> +	if (WARN_ON(!rpdev))
> +		return -EINVAL;
> +	if (!rpdev->ops || !rpdev->ops->cpu_to_transport32)
> +		return -EPERM;

Alternative could be to choice the processor endianness ( it was the case
before the virtio patch to set the endianness

> +
> +	return rpdev->ops->cpu_to_transport32(rpdev, val);
> +}
> +EXPORT_SYMBOL(cpu_to_rpmsg32);
> +
>  /**
>   * rpmsg_create_channel() - create a new rpmsg channel
>   * using its name and address info.
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 2e65386f191e..2f0ad1a52698 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -81,6 +81,8 @@ struct virtio_rpmsg_channel {
>  
>  /**
>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> + * @transport{16|32}_to_cpu: byte conversion from rpmsg device to transport layer
> + * @cpu_to_transport{16|32}: byte conversion from transport layer to rpmsg device
>   * @create_channel:	create backend-specific channel, optional
>   * @release_channel:	release backend-specific channel, optional
>   * @create_ept:		create backend-specific endpoint, required
> @@ -92,6 +94,10 @@ struct virtio_rpmsg_channel {
>   * advertise new channels implicitly by creating the endpoints.
>   */
>  struct rpmsg_device_ops {
> +	u16 (*transport16_to_cpu)(struct rpmsg_device *rpdev, u16 val);
> +	u16 (*cpu_to_transport16)(struct rpmsg_device *rpdev, u16 val);
> +	u32 (*transport32_to_cpu)(struct rpmsg_device *rpdev, u32 val);
> +	u32 (*cpu_to_transport32)(struct rpmsg_device *rpdev, u32 val);

This trigg me a suggestion. Perhaps it would be simpler to have only on ops
to get the endianness.

Regards
Arnaud

>  	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
>  					     struct rpmsg_channel_info *chinfo);
>  	int (*release_channel)(struct rpmsg_device *rpdev,
> @@ -148,6 +154,12 @@ rpmsg_create_channel(struct rpmsg_device *rpdev,
>  		     struct rpmsg_channel_info *chinfo);
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
> +
> +u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, u16 val);
> +u16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val);
> +u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, u32 val);
> +u32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val);
> +
>  /**
>   * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
> 
