Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5A3C4363D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 07:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E2AA23A1E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 07:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgIVHGP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 03:06:15 -0400
Received: from mga18.intel.com ([134.134.136.126]:65308 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728526AbgIVHGP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 03:06:15 -0400
IronPort-SDR: 8pUBE7FNmqi6p8V98cqX44KyNGZT8ZxmlrOe2+MeGh9iHo1JXFqHXoGCUXelfotI326gE8kbv7
 85ws1MGHv8nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148302149"
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; 
   d="scan'208";a="148302149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 00:06:14 -0700
IronPort-SDR: 6VRRqh5F/L/YzMyckyRpuZkfP75syOcDvUW5b9ewu6EYDGsLVNiGRfdIvmM0Z0JqOFXc0NGh9j
 dN3bvdf0ne/Q==
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; 
   d="scan'208";a="454377567"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.49.176])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 00:06:13 -0700
Date:   Tue, 22 Sep 2020 09:06:03 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] rpmsg: virtio: rename rpmsg_create_channel
Message-ID: <20200922070603.GA4648@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922001000.899956-2-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:09:51PM -0600, Mathieu Poirier wrote:
> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> 
> Rename the internal function as it is internal, and as
> the name will be used in rpmsg_core.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 7d7ed4e5cce7..e8d55c8b9cbf 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -395,8 +395,9 @@ static void virtio_rpmsg_release_device(struct device *dev)
>   * this function will be used to create both static and dynamic
>   * channels.
>   */
> -static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
> -						 struct rpmsg_channel_info *chinfo)
> +static struct rpmsg_device *
> +__rpmsg_create_channel(struct virtproc_info *vrp,
> +		       struct rpmsg_channel_info *chinfo)

Nitpick: we now have 100 characters, so there's no *need* any more to split that 
line, now it's more a matter of consistent style and personal preference. Most 
functions in that file have function type and name on the same line, but a few 
also make the split like here... So, we can choose our poison here I guess.

Thanks
Guennadi

>  {
>  	struct virtio_rpmsg_channel *vch;
>  	struct rpmsg_device *rpdev;
> @@ -869,7 +870,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
>  	} else {
> -		newch = rpmsg_create_channel(vrp, &chinfo);
> +		newch = __rpmsg_create_channel(vrp, &chinfo);
>  		if (!newch)
>  			dev_err(dev, "rpmsg_create_channel failed\n");
>  	}
> -- 
> 2.25.1
> 
