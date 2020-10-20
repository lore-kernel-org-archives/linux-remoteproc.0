Return-Path: <SRS0=A2u3=D3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C95C433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E28592237B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="XXOqWHVN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404797AbgJTHFq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Oct 2020 03:05:46 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:10472 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404795AbgJTHFp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Oct 2020 03:05:45 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09K6vr5K026963;
        Tue, 20 Oct 2020 09:05:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=tMsttf46xU4kYvUDVad8LnVBDgDX9MKheLSKlG5oQcU=;
 b=XXOqWHVNGfxCPI/FMloW1w77GtKwwzQBkWUJQeDqGiLdKTbNI0MdG4DJBmWg+j5PMkGE
 GF5Yp0QhxGu01LMd0Bmylyf2JFTBkIWrdK1B/gnZWwLAWpOlFxntq8XjFK2I3xAE0GmV
 NaBYYyoYnEi959kSpBEAWW3buk/cnJeGJKbzd6exjGmx6uk59PYDdb0rBhapya3QwYdy
 htuv0BKGHadaSZ6gGLUUReP1orSnbccE66iX+1lyRtqv9ZrKA7aQ0THv81w4vGj/y+zx
 YCBa1SB5yXACJdMabGWZX8WzWVPG+ASFRDADfcSlEIg0tX/UiH/r7CV1YHRBQ+tWpV6n eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347p30gn5b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 09:05:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A2E010002A;
        Tue, 20 Oct 2020 09:05:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17B092ADA12;
        Tue, 20 Oct 2020 09:05:37 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 09:05:36 +0200
Subject: Re: [PATCH v3 2/8] rpmsg: virtio: Move from virtio to rpmsg byte
 conversion
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
 <20201019203438.501174-3-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b39274f7-5fe3-1b7a-df54-26990e7a62bf@st.com>
Date:   Tue, 20 Oct 2020 09:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019203438.501174-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_03:2020-10-16,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/19/20 10:34 PM, Mathieu Poirier wrote:
> Use rpmsg byte conversion functions in order for the RPMSG
> headers and generic functions to be used by external entities.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>


Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 53 +++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9006fc7f73d0..8927bcad56fd 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -19,11 +19,11 @@
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/rpmsg.h>
> +#include <linux/rpmsg_byteorder.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/virtio.h>
> -#include <linux/virtio_byteorder.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
>  #include <linux/wait.h>
> @@ -85,11 +85,11 @@ struct virtproc_info {
>   * Every message sent(/received) on the rpmsg bus begins with this header.
>   */
>  struct rpmsg_hdr {
> -	__virtio32 src;
> -	__virtio32 dst;
> -	__virtio32 reserved;
> -	__virtio16 len;
> -	__virtio16 flags;
> +	__rpmsg32 src;
> +	__rpmsg32 dst;
> +	__rpmsg32 reserved;
> +	__rpmsg16 len;
> +	__rpmsg16 flags;
>  	u8 data[];
>  } __packed;
>  
> @@ -107,8 +107,8 @@ struct rpmsg_hdr {
>   */
>  struct rpmsg_ns_msg {
>  	char name[RPMSG_NAME_SIZE];
> -	__virtio32 addr;
> -	__virtio32 flags;
> +	__rpmsg32 addr;
> +	__rpmsg32 flags;
>  } __packed;
>  
>  /**
> @@ -336,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
> +		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
> +		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_CREATE);
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>  		if (err)
> @@ -360,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
> +		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
> +		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_DESTROY);
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>  		if (err)
> @@ -420,6 +420,7 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>  	rpdev->src = chinfo->src;
>  	rpdev->dst = chinfo->dst;
>  	rpdev->ops = &virtio_rpmsg_ops;
> +	rpdev->little_endian = virtio_is_little_endian(vrp->vdev);
>  
>  	/*
>  	 * rpmsg server channels has predefined local address (for now),
> @@ -613,10 +614,10 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  		}
>  	}
>  
> -	msg->len = cpu_to_virtio16(vrp->vdev, len);
> +	msg->len = cpu_to_rpmsg16(rpdev, len);
>  	msg->flags = 0;
> -	msg->src = cpu_to_virtio32(vrp->vdev, src);
> -	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
> +	msg->src = cpu_to_rpmsg32(rpdev, src);
> +	msg->dst = cpu_to_rpmsg32(rpdev, dst);
>  	msg->reserved = 0;
>  	memcpy(msg->data, data, len);
>  
> @@ -705,14 +706,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  {
>  	struct rpmsg_endpoint *ept;
>  	struct scatterlist sg;
> -	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
> +	bool little_endian = virtio_is_little_endian(vrp->vdev);
> +	unsigned int msg_len = __rpmsg16_to_cpu(little_endian, msg->len);
>  	int err;
>  
>  	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> -		virtio32_to_cpu(vrp->vdev, msg->src),
> -		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
> -		virtio16_to_cpu(vrp->vdev, msg->flags),
> -		virtio32_to_cpu(vrp->vdev, msg->reserved));
> +		__rpmsg32_to_cpu(little_endian, msg->src),
> +		__rpmsg32_to_cpu(little_endian, msg->dst), msg_len,
> +		__rpmsg16_to_cpu(little_endian, msg->flags),
> +		__rpmsg32_to_cpu(little_endian, msg->reserved));
>  #if defined(CONFIG_DYNAMIC_DEBUG)
>  	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
>  			 msg, sizeof(*msg) + msg_len, true);
> @@ -731,7 +733,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	/* use the dst addr to fetch the callback of the appropriate user */
>  	mutex_lock(&vrp->endpoints_lock);
>  
> -	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
> +	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
>  
>  	/* let's make sure no one deallocates ept while we use it */
>  	if (ept)
> @@ -745,7 +747,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  
>  		if (ept->cb)
>  			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
> -				virtio32_to_cpu(vrp->vdev, msg->src));
> +				__rpmsg32_to_cpu(little_endian, msg->src));
>  
>  		mutex_unlock(&ept->cb_lock);
>  
> @@ -825,6 +827,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	struct rpmsg_channel_info chinfo;
>  	struct virtproc_info *vrp = priv;
>  	struct device *dev = &vrp->vdev->dev;
> +	bool little_endian = virtio_is_little_endian(vrp->vdev);
>  	int ret;
>  
>  #if defined(CONFIG_DYNAMIC_DEBUG)
> @@ -853,13 +856,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  
>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> +	chinfo.dst = __rpmsg32_to_cpu(little_endian, msg->addr);
>  
>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> +		 __rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY ?
>  		 "destroy" : "creat", msg->name, chinfo.dst);
>  
> -	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> +	if (__rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> 
