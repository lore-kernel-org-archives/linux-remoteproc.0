Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C50C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 07:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBE5B2075F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 07:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgI3HMC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:12:02 -0400
Received: from mga02.intel.com ([134.134.136.20]:45173 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728425AbgI3HMC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 03:12:02 -0400
IronPort-SDR: fG39PqSRiAhgCBrP/LwIjq2QA/47IfVb4ywHoBjsIpse+Sg/kUi6IZ3hizwH3bKXjCRCVpcttf
 UI9832P56kuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150042505"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="150042505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 00:11:56 -0700
IronPort-SDR: AaB/pZyd2viAHOlLIL31XcqTMB1pUYmsLZQlZfiJrrRVyf00j/sKQiwjkptB7kjg4vyimcKhcD
 nNwrJR8HkCgQ==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="294522164"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.32.32])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 00:11:54 -0700
Date:   Wed, 30 Sep 2020 09:11:51 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] rpmsg: core: Add RPMSG byte conversion operations
Message-ID: <20200930071151.GF20683@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-9-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922001000.899956-9-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:09:58PM -0600, Mathieu Poirier wrote:
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

All the endianness conversions are great as long as they compile to 
NOPs where no conversion is needed. Can we come up with a solution 
to keep it that way?

Thanks
Guennadi

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
> -- 
> 2.25.1
> 
