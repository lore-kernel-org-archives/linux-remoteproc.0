Return-Path: <SRS0=A2u3=D3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4883FC433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A37062237B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="q5L/vYhE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404728AbgJTHEZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Oct 2020 03:04:25 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:59411 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404723AbgJTHEZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Oct 2020 03:04:25 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09K6vsKH026983;
        Tue, 20 Oct 2020 09:04:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=s4nQYuoqPavXoCqW23JwfVqDR5D4+8KScwo2N9KV8wg=;
 b=q5L/vYhEdiBYHOSHhr4tyO2eD7crs5PTT1ztsz1qRJAeGhSBnxnrBjIfW2rEHRC7CWq4
 DSNlPmtdBZmgR4RKAqthw4pcHA65N9TNGmHDGejEOHbjV4h5KlUWnkEIR4EzJBI8hWlS
 Uam5CH3Ht5IvXPxSClKOGV08/hQ/TiibAA8MD/9fSdl9jgcbdqybsFDVENFWVW1dG9GD
 GQrfdoMGMXp7VkdUbWRQ1Xq6dzqi1vJFBuhzEA91okVUAtS0kX0ImLvwbJznCYYRa31a
 b+UzisTseTsvG4mLE5FsLbZ4Nk45HbKsdWRLzxoVjlvg1Ry+2sls9NiCjW0MED47j0e8 Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347p30gmrc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 09:04:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20FBB10002A;
        Tue, 20 Oct 2020 09:04:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BF892ADA0E;
        Tue, 20 Oct 2020 09:04:18 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 09:04:17 +0200
Subject: Re: [PATCH v3 1/8] rpmsg: Introduce __rpmsg{16|32|64} types
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
 <20201019203438.501174-2-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <d3fe9b33-ea92-a3d2-e801-bf3d823b108d@st.com>
Date:   Tue, 20 Oct 2020 09:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019203438.501174-2-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_03:2020-10-16,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,


On 10/19/20 10:34 PM, Mathieu Poirier wrote:
> Introduce __rpmsg{16|32|64} types along with byte order conversion
> functions based on an rpmsg_device operation as a foundation to
> make RPMSG modular and transport agnostic.
> 
> Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  include/linux/rpmsg.h            | 51 ++++++++++++++++++++++++
>  include/linux/rpmsg_byteorder.h  | 67 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/rpmsg_types.h | 11 ++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 include/linux/rpmsg_byteorder.h
>  create mode 100644 include/uapi/linux/rpmsg_types.h
> 
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 9fe156d1c018..97098a90c496 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -17,6 +17,7 @@
>  #include <linux/kref.h>
>  #include <linux/mutex.h>
>  #include <linux/poll.h>
> +#include <linux/rpmsg_byteorder.h>
>  
>  #define RPMSG_ADDR_ANY		0xFFFFFFFF
>  
> @@ -46,6 +47,7 @@ struct rpmsg_channel_info {
>   * @dst: destination address
>   * @ept: the rpmsg endpoint of this channel
>   * @announce: if set, rpmsg will announce the creation/removal of this channel
> + * @little_endian: True if transport is using little endian byte representation
>   */
>  struct rpmsg_device {
>  	struct device dev;
> @@ -55,6 +57,7 @@ struct rpmsg_device {
>  	u32 dst;
>  	struct rpmsg_endpoint *ept;
>  	bool announce;
> +	bool little_endian;
>  
>  	const struct rpmsg_device_ops *ops;
>  };
> @@ -111,6 +114,54 @@ struct rpmsg_driver {
>  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
>  };
>  
> +static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
> +{
> +	if (!rpdev)
> +		return __rpmsg16_to_cpu(rpmsg_is_little_endian(), val);
> +	else
> +		return __rpmsg16_to_cpu(rpdev->little_endian, val);
> +}
> +
> +static inline __rpmsg16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
> +{
> +	if (!rpdev)
> +		return __cpu_to_rpmsg16(rpmsg_is_little_endian(), val);
> +	else
> +		return __cpu_to_rpmsg16(rpdev->little_endian, val);
> +}
> +
> +static inline u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, __rpmsg32 val)
> +{
> +	if (!rpdev)
> +		return __rpmsg32_to_cpu(rpmsg_is_little_endian(), val);
> +	else
> +		return __rpmsg32_to_cpu(rpdev->little_endian, val);
> +}
> +
> +static inline __rpmsg32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
> +{
> +	if (!rpdev)
> +		return __cpu_to_rpmsg32(rpmsg_is_little_endian(), val);
> +	else
> +		return __cpu_to_rpmsg32(rpdev->little_endian, val);
> +}
> +
> +static inline u64 rpmsg64_to_cpu(struct rpmsg_device *rpdev, __rpmsg64 val)
> +{
> +	if (!rpdev)
> +		return __rpmsg64_to_cpu(rpmsg_is_little_endian(), val);
> +	else
> +		return __rpmsg64_to_cpu(rpdev->little_endian, val);
> +}
> +
> +static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
> +{
> +	if (!rpdev)
> +		return __cpu_to_rpmsg64(rpmsg_is_little_endian(), val);
> +	else
> +		return __cpu_to_rpmsg64(rpdev->little_endian, val);
> +}
> +
>  #if IS_ENABLED(CONFIG_RPMSG)
>  
>  int register_rpmsg_device(struct rpmsg_device *dev);
> diff --git a/include/linux/rpmsg_byteorder.h b/include/linux/rpmsg_byteorder.h
> new file mode 100644
> index 000000000000..c0f565dbad6d
> --- /dev/null
> +++ b/include/linux/rpmsg_byteorder.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Follows implementation found in linux/virtio_byteorder.h
> + */
> +#ifndef _LINUX_RPMSG_BYTEORDER_H
> +#define _LINUX_RPMSG_BYTEORDER_H
> +#include <linux/types.h>
> +#include <uapi/linux/rpmsg_types.h>
> +
> +static inline bool rpmsg_is_little_endian(void)
> +{
> +#ifdef __LITTLE_ENDIAN
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
> +static inline u16 __rpmsg16_to_cpu(bool little_endian, __rpmsg16 val)
> +{
> +	if (little_endian)
> +		return le16_to_cpu((__force __le16)val);
> +	else
> +		return be16_to_cpu((__force __be16)val);
> +}
> +
> +static inline __rpmsg16 __cpu_to_rpmsg16(bool little_endian, u16 val)
> +{
> +	if (little_endian)
> +		return (__force __rpmsg16)cpu_to_le16(val);
> +	else
> +		return (__force __rpmsg16)cpu_to_be16(val);
> +}
> +
> +static inline u32 __rpmsg32_to_cpu(bool little_endian, __rpmsg32 val)
> +{
> +	if (little_endian)
> +		return le32_to_cpu((__force __le32)val);
> +	else
> +		return be32_to_cpu((__force __be32)val);
> +}
> +
> +static inline __rpmsg32 __cpu_to_rpmsg32(bool little_endian, u32 val)
> +{
> +	if (little_endian)
> +		return (__force __rpmsg32)cpu_to_le32(val);
> +	else
> +		return (__force __rpmsg32)cpu_to_be32(val);
> +}
> +
> +static inline u64 __rpmsg64_to_cpu(bool little_endian, __rpmsg64 val)
> +{
> +	if (little_endian)
> +		return le64_to_cpu((__force __le64)val);
> +	else
> +		return be64_to_cpu((__force __be64)val);
> +}
> +
> +static inline __rpmsg64 __cpu_to_rpmsg64(bool little_endian, u64 val)
> +{
> +	if (little_endian)
> +		return (__force __rpmsg64)cpu_to_le64(val);
> +	else
> +		return (__force __rpmsg64)cpu_to_be64(val);
> +}
> +
> +#endif /* _LINUX_RPMSG_BYTEORDER_H */
> diff --git a/include/uapi/linux/rpmsg_types.h b/include/uapi/linux/rpmsg_types.h
> new file mode 100644
> index 000000000000..36e3b9404391
> --- /dev/null
> +++ b/include/uapi/linux/rpmsg_types.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_RPMSG_TYPES_H
> +#define _UAPI_LINUX_RPMSG_TYPES_H
> +
> +#include <linux/types.h>
> +
> +typedef __u16 __bitwise __rpmsg16;
> +typedef __u32 __bitwise __rpmsg32;
> +typedef __u64 __bitwise __rpmsg64;
> +
> +#endif /* _UAPI_LINUX_RPMSG_TYPES_H */
> 
