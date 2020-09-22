Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAC4C4363D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 14:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F250720C09
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 14:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="DLQgI3vO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVO2F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 10:28:05 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:2626 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726494AbgIVO2F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 10:28:05 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08MEMUe6022762;
        Tue, 22 Sep 2020 16:27:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=n2aplRdODBpDw2kM2y5CVuA2OqHJiDu4gUxPULscp7k=;
 b=DLQgI3vOyFsylCGvxY6icOie/g7WM7250oM901c58VMi5jQQYPSWfRWkUNqFX740Q1qU
 opGxL6K4DVBCK78TPSSgp6lsvHFdRF/2uEC/odbW+rgwqZuyGKaXA2lUShZEZmJELhwg
 YkH7YfrV/dNc/rtRe/sUayNpR2wLg5uFkXWjkxHCGZ0DPZZAPBSAtAcZEPQWVnb19WN/
 SNVKWksbFsOiQIw0Bwv+84V+SzrVFXc329nbI7s3V0r7rQ5WmzQKUSfq9RQBZNFaN/o7
 I46m36xJeFhz3d/gLt2Wv2/cYOLygbItTdqXJO78ghjC39lK5dy3tjQilTtIOwsQHktL kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33n7eyqjpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Sep 2020 16:27:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E394D10002A;
        Tue, 22 Sep 2020 16:27:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D45992B8A2B;
        Tue, 22 Sep 2020 16:27:57 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 16:27:56 +0200
Subject: Re: [PATCH 05/10] rpmsg: virtio: Move virtio RPMSG structures to
 private header
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>
CC:     Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-6-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b4eb29ad-2a7a-487d-c753-5e10a3d70811@st.com>
Date:   Tue, 22 Sep 2020 16:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922001000.899956-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-22_13:2020-09-21,2020-09-22 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/22/20 2:09 AM, Mathieu Poirier wrote:
> Move structure virtiproc_info and virtio_rpmsg_channel to rpmsg_internal.h
> so that they can be used by rpmsg_ns.c
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_internal.h   | 62 ++++++++++++++++++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 57 -----------------------------
>  2 files changed, 62 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 587f723757d4..3ea9cec26fc0 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -12,12 +12,74 @@
>  #ifndef __RPMSG_INTERNAL_H__
>  #define __RPMSG_INTERNAL_H__
>  
> +#include <linux/idr.h>
> +#include <linux/mutex.h>
>  #include <linux/rpmsg.h>
> +#include <linux/types.h>
> +#include <linux/virtio.h>

This also creates a dependency with virtio
This file is included by several drivers...

Regards,
Arnaud

> +#include <linux/wait.h>
>  #include <linux/poll.h>
>  
>  #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
>  #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
>  
> +/**
> + * struct virtproc_info - virtual remote processor state
> + * @vdev:	the virtio device
> + * @rvq:	rx virtqueue
> + * @svq:	tx virtqueue
> + * @rbufs:	kernel address of rx buffers
> + * @sbufs:	kernel address of tx buffers
> + * @num_bufs:	total number of buffers for rx and tx
> + * @buf_size:   size of one rx or tx buffer
> + * @last_sbuf:	index of last tx buffer used
> + * @bufs_dma:	dma base addr of the buffers
> + * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> + *		sending a message might require waking up a dozing remote
> + *		processor, which involves sleeping, hence the mutex.
> + * @endpoints:	idr of local endpoints, allows fast retrieval
> + * @endpoints_lock: lock of the endpoints set
> + * @sendq:	wait queue of sending contexts waiting for a tx buffers
> + * @sleepers:	number of senders that are waiting for a tx buffer
> + * @ns_ept:	the bus's name service endpoint
> + *
> + * This structure stores the rpmsg state of a given virtio remote processor
> + * device (there might be several virtio proc devices for each physical
> + * remote processor).
> + */
> +struct virtproc_info {
> +	struct virtio_device *vdev;
> +	struct virtqueue *rvq, *svq;
> +	void *rbufs, *sbufs;
> +	unsigned int num_bufs;
> +	unsigned int buf_size;
> +	int last_sbuf;
> +	dma_addr_t bufs_dma;
> +	struct mutex tx_lock;
> +	struct idr endpoints;
> +	struct mutex endpoints_lock;
> +	wait_queue_head_t sendq;
> +	atomic_t sleepers;
> +	struct rpmsg_endpoint *ns_ept;
> +};
> +
> +/**
> + * struct virtio_rpmsg_channel - rpmsg channel descriptor
> + * @rpdev: the rpmsg channel device
> + * @vrp: the virtio remote processor device this channel belongs to
> + *
> + * This structure stores the channel that links the rpmsg device to the virtio
> + * remote processor device.
> + */
> +struct virtio_rpmsg_channel {
> +	struct rpmsg_device rpdev;
> +
> +	struct virtproc_info *vrp;
> +};
> +
> +#define to_virtio_rpmsg_channel(_rpdev) \
> +	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
> +
>  /**
>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
>   * @create_channel:	create backend-specific channel, optional
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index eaf3b2c012c8..0635d86d490f 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -32,63 +32,6 @@
>  
>  #include "rpmsg_internal.h"
>  
> -/**
> - * struct virtproc_info - virtual remote processor state
> - * @vdev:	the virtio device
> - * @rvq:	rx virtqueue
> - * @svq:	tx virtqueue
> - * @rbufs:	kernel address of rx buffers
> - * @sbufs:	kernel address of tx buffers
> - * @num_bufs:	total number of buffers for rx and tx
> - * @buf_size:   size of one rx or tx buffer
> - * @last_sbuf:	index of last tx buffer used
> - * @bufs_dma:	dma base addr of the buffers
> - * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
> - *		sending a message might require waking up a dozing remote
> - *		processor, which involves sleeping, hence the mutex.
> - * @endpoints:	idr of local endpoints, allows fast retrieval
> - * @endpoints_lock: lock of the endpoints set
> - * @sendq:	wait queue of sending contexts waiting for a tx buffers
> - * @sleepers:	number of senders that are waiting for a tx buffer
> - * @ns_ept:	the bus's name service endpoint
> - *
> - * This structure stores the rpmsg state of a given virtio remote processor
> - * device (there might be several virtio proc devices for each physical
> - * remote processor).
> - */
> -struct virtproc_info {
> -	struct virtio_device *vdev;
> -	struct virtqueue *rvq, *svq;
> -	void *rbufs, *sbufs;
> -	unsigned int num_bufs;
> -	unsigned int buf_size;
> -	int last_sbuf;
> -	dma_addr_t bufs_dma;
> -	struct mutex tx_lock;
> -	struct idr endpoints;
> -	struct mutex endpoints_lock;
> -	wait_queue_head_t sendq;
> -	atomic_t sleepers;
> -	struct rpmsg_endpoint *ns_ept;
> -};
> -
> -/**
> - * struct virtio_rpmsg_channel - rpmsg channel descriptor
> - * @rpdev: the rpmsg channel device
> - * @vrp: the virtio remote processor device this channel belongs to
> - *
> - * This structure stores the channel that links the rpmsg device to the virtio
> - * remote processor device.
> - */
> -struct virtio_rpmsg_channel {
> -	struct rpmsg_device rpdev;
> -
> -	struct virtproc_info *vrp;
> -};
> -
> -#define to_virtio_rpmsg_channel(_rpdev) \
> -	container_of(_rpdev, struct virtio_rpmsg_channel, rpdev)
> -
>  /*
>   * Local addresses are dynamically allocated on-demand.
>   * We do not dynamically assign addresses from the low 1024 range,
> 
