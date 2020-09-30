Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18080C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 07:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C86DF207C3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 07:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgI3HDx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:03:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:57638 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgI3HDx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 03:03:53 -0400
IronPort-SDR: 2Jc76T9mMbLYd1mM/HHYYOCNqWzw/3Pcrxh3HUxYB9YaFmSO++C13T1LFn1GAfGiMABN+GiNHh
 eBbajRqV78WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159716103"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="159716103"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 00:03:52 -0700
IronPort-SDR: hFa+CCle1o2YtDp6k8YhnmRjAtjVzeyCzmNEPglJjYq6RfZAMBI7rUUp6NuagthWPANtz0QPPQ
 whbLoIeRwFNQ==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="294520650"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.32.32])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 00:03:50 -0700
Date:   Wed, 30 Sep 2020 09:03:45 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] rpmsg: virtio: Move virtio RPMSG structures to
 private header
Message-ID: <20200930070345.GD20683@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-6-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922001000.899956-6-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:09:55PM -0600, Mathieu Poirier wrote:
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

I think it would be better to not add any VirtIO dependencies here even 
temporarily.

> +#include <linux/wait.h>
>  #include <linux/poll.h>
>  
>  #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
>  #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
>  
> +/**
> + * struct virtproc_info - virtual remote processor state

This struct shouldn't be here, let's first prepare the NS callback by 
removing any VirtIO dependencies and only then move it to the generic 
driver.

Thanks
Guennadi

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
> -- 
> 2.25.1
> 
