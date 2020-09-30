Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175A3C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 07:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA5102075F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 07:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgI3HNi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:13:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:58566 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgI3HNi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 03:13:38 -0400
IronPort-SDR: dZExfxSzhfoay5wjGTkJsluQo3h+LxLvNsK5EHpIT7Pn44EzVZqfucmCB+X1CDlBkiNwPk19PT
 JFZcQhtgomfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159718663"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="159718663"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 00:13:32 -0700
IronPort-SDR: 0eVKIvdJYnys5eG7EL7geLBzpBXRZBYMoVWTjiAOjMpjonTK4PU+qhO/a8pwAH+B80mYHFudQk
 Bg8dy4uuK4SQ==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="294522431"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.32.32])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 00:13:30 -0700
Date:   Wed, 30 Sep 2020 09:13:27 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] rpmsg: ns: Make Name service module transport
 agnostic
Message-ID: <20200930071327.GG20683@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-11-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922001000.899956-11-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:10:00PM -0600, Mathieu Poirier wrote:
> Make name service module transport agnostic by using the rpmsg
> device specific byte conversion routine.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_ns.c | 10 ++++------
>  include/linux/rpmsg_ns.h |  4 ++--
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index b3318bf84433..1df3aaadfe10 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -18,9 +18,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	struct rpmsg_ns_msg *msg = data;
>  	struct rpmsg_device *newch;
>  	struct rpmsg_channel_info chinfo;
> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> -	struct virtproc_info *vrp = vch->vrp;
> -	struct device *dev = &vrp->vdev->dev;
> +	struct device *dev = &rpdev->dev;
>  	int ret;
>  
>  #if defined(CONFIG_DYNAMIC_DEBUG)
> @@ -38,13 +36,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  
>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> +	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
>  
>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> +		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
>  		 "destroy" : "creat", msg->name, chinfo.dst);
>  
> -	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> +	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_release_channel(rpdev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> index aabc6c3c0d6d..9f3030b2145b 100644
> --- a/include/linux/rpmsg_ns.h
> +++ b/include/linux/rpmsg_ns.h
> @@ -41,8 +41,8 @@ struct rpmsg_hdr {
>   */
>  struct rpmsg_ns_msg {
>  	char name[RPMSG_NAME_SIZE];
> -	__virtio32 addr;
> -	__virtio32 flags;
> +	u32 addr;
> +	u32 flags;

These aren't (necessarily) native endianness, right? Don't they deserve a 
separate type? __rpmsg32?

Thanks
Guennadi

>  } __packed;
>  
>  /**
> -- 
> 2.25.1
> 
