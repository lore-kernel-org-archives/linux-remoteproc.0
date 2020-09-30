Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595C4C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 06:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 009702075F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 06:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgI3Gf7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:35:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:17107 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgI3Gf7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 02:35:59 -0400
IronPort-SDR: fQTnIapm0dTvTlWDBeIQM8eEYdgRjr/KW4ua03+YMwTLyryGstKQG7abhD0fybfgXuzAdSsv6r
 2OvA8U5Nzbcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="162436191"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="162436191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:35:58 -0700
IronPort-SDR: fafcu320OZH1ERuI4MiOsRdpfu4AXEkXKMnQ8UF7u/TiZMrnRwVs175i6bCgC6hxNNjHphzt4B
 /LzsoCl7bxnw==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="495887540"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.32.32])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:35:57 -0700
Date:   Wed, 30 Sep 2020 08:35:53 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] rpmsg: core: Add channel creation internal API
Message-ID: <20200930063553.GB20683@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922001000.899956-3-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:09:52PM -0600, Mathieu Poirier wrote:
> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> 
> Add the channel creation API as a first step to be able to define the
> name service announcement as a rpmsg driver independent from the RPMsg
> virtio bus.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c     | 45 ++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h | 12 +++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 91de940896e3..50a835eaf1ba 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -20,6 +20,51 @@
>  
>  #include "rpmsg_internal.h"
>  
> +/**
> + * rpmsg_create_channel() - create a new rpmsg channel
> + * using its name and address info.
> + * @rpdev: rpmsg driver

device

> + * @chinfo: channel_info to bind
> + *
> + * Returns a pointer to the new rpmsg device on success, or NULL on error.
> + */
> +struct rpmsg_device *
> +	rpmsg_create_channel(struct rpmsg_device *rpdev,

You might call this nitpicking, but we already have two indentation styles for 
functions:

return_type function(type1 arg1,
			...)

(my personal preference, it also has sub-variants - depending on the aligning 
of the second line and any following lines, and one more moving "type1 arg1" 
to the second line)

return_type
function(...

and now you're also introducing the third style - with "function" indented... 
Maybe we don't need more of those, particularly since now with 100 chars per 
line in most cases the very first style can be used.

> +			     struct rpmsg_channel_info *chinfo)
> +{
> +	if (WARN_ON(!rpdev))
> +		return NULL;
> +	if (!rpdev->ops || !rpdev->ops->create_channel) {
> +		dev_err(&rpdev->dev, "no create_channel ops found\n");
> +		return NULL;
> +	}
> +
> +	return rpdev->ops->create_channel(rpdev, chinfo);
> +}
> +EXPORT_SYMBOL(rpmsg_create_channel);
> +
> +/**
> + * rpmsg_release_channel() - release a rpmsg channel
> + * using its name and address info.
> + * @rpdev: rpmsg driver

device

> + * @chinfo: channel_info to bind
> + *
> + * Returns 0 on success or an appropriate error value.
> + */
> +int rpmsg_release_channel(struct rpmsg_device *rpdev,
> +			  struct rpmsg_channel_info *chinfo)
> +{
> +	if (WARN_ON(!rpdev))
> +		return -EINVAL;
> +	if (!rpdev->ops || !rpdev->ops->release_channel) {
> +		dev_err(&rpdev->dev, "no release_channel ops found\n");
> +		return -EPERM;

ENOSYS or EOPNOTSUPP? I'm never sure which one is appropriate for 
this kind of errors.

> +	}
> +
> +	return rpdev->ops->release_channel(rpdev, chinfo);
> +}
> +EXPORT_SYMBOL(rpmsg_release_channel);
> +
>  /**
>   * rpmsg_create_ept() - create a new rpmsg_endpoint
>   * @rpdev: rpmsg channel device
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 3fc83cd50e98..587f723757d4 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -20,6 +20,8 @@
>  
>  /**
>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> + * @create_channel:	create backend-specific channel, optional
> + * @release_channel:	release backend-specific channel, optional

Are they really optional? You return errors if they aren't available.

>   * @create_ept:		create backend-specific endpoint, required
>   * @announce_create:	announce presence of new channel, optional
>   * @announce_destroy:	announce destruction of channel, optional
> @@ -29,6 +31,11 @@
>   * advertise new channels implicitly by creating the endpoints.
>   */
>  struct rpmsg_device_ops {
> +	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
> +					     struct rpmsg_channel_info *chinfo);
> +	int (*release_channel)(struct rpmsg_device *rpdev,
> +			       struct rpmsg_channel_info *chinfo);
> +
>  	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
>  					    rpmsg_rx_cb_t cb, void *priv,
>  					    struct rpmsg_channel_info chinfo);
> @@ -75,6 +82,11 @@ int rpmsg_unregister_device(struct device *parent,
>  struct device *rpmsg_find_device(struct device *parent,
>  				 struct rpmsg_channel_info *chinfo);
>  
> +struct rpmsg_device *
> +rpmsg_create_channel(struct rpmsg_device *rpdev,
> +		     struct rpmsg_channel_info *chinfo);
> +int rpmsg_release_channel(struct rpmsg_device *rpdev,
> +			  struct rpmsg_channel_info *chinfo);
>  /**
>   * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
> -- 
> 2.25.1
> 
