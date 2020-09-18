Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD62C43464
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 23:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47C1B21707
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 23:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7dCujlV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgIRXK1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 19:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgIRXK0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 19:10:26 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB1AC0613CE
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Sep 2020 16:10:26 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so3756621plt.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Sep 2020 16:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dpdVLtoWDhg/MgaG2lrr/KNN32VwIq3tdEbOR5a5awQ=;
        b=Q7dCujlVPAYtZ0fMm1A3gP2IYnHgCJbnYp29dE0P+rjbeW6M06xO4QXPN66FHMQGgr
         d77rWBphdT/MKGwyXNx3b9aM4rTs+sCEAifBOuW67woBEb5XqLKpnSq9I+KxPhtpvlAK
         rnqcyFjzdc0UyoLzhQ14w6O9uOmNL/96WZWcWvA+dIPg38ijt9yuEiV1sVNTXWkFV8E3
         CwiC47daA9vlqbzpcm3b6YoLxZ6bE0UYcNQIxKX+B5A6b3YmSLuPBo7fO0LfFXDnjDzl
         hJp+soHcjPApnVvSJO12Mh0vmPzNEHgef0GESiW4GwCdMmjLG5KRQaSyn8VBgBnshK6x
         +4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dpdVLtoWDhg/MgaG2lrr/KNN32VwIq3tdEbOR5a5awQ=;
        b=SfpmZgVc7Ni1vQxwnz+5KN1IF1gbGhEh/yZ6UrIwBafw9MqZB7o1f8X93QRl+pOnV4
         huilETZT/b0kSKH9DaCCTKkSun4zj0VRYFoHj+tGlXl/iDUCE20ewUnL0d3mtUlkacwE
         Hbdr68KHTCyajfy0+EorXN9YUaawFiEpHNSZPS9Pq+xy4QR2GXu6aPu9GrBy+JGQ4R4+
         xvrCYF3Wq9l+QH4CtZNNXRC+XSZThdcz6bk6P19Y3fvqYvMDJBvZLINUIVN7TDWB83hi
         35geLFS8a86XtR42TjFnDNULDa0cRf3Vr7YVgHxwvPiqHKU/ln248+2OzQOW6Q6AEs7T
         yw+g==
X-Gm-Message-State: AOAM531W9L3JiTYSkx3wgyc0rT5bHm39N1FUvXKZLAUFJtKHhi3wptrH
        pOotYRg3nqcRRdSIE4YQmvt9/w==
X-Google-Smtp-Source: ABdhPJxk0JqxsU4ppA2/wMlCC7pjRsW9DW2LULP68dBcAFuqQa5XOebg8e9odeJU+SDNjSKwfKTk+g==
X-Received: by 2002:a17:90a:71c7:: with SMTP id m7mr15710591pjs.190.1600470626119;
        Fri, 18 Sep 2020 16:10:26 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a74sm4381005pfa.16.2020.09.18.16.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 16:10:24 -0700 (PDT)
Date:   Fri, 18 Sep 2020 17:10:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        guennadi.liakhovetski@linux.intel.com
Subject: Re: [PATCH v2 5/8] rpmsg: introduce reserved rpmsg driver for ns
 announcement
Message-ID: <20200918231023.GA209991@xps15>
References: <20200825164907.3642-1-arnaud.pouliquen@st.com>
 <20200825164907.3642-6-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825164907.3642-6-arnaud.pouliquen@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Arnaud,

On Tue, Aug 25, 2020 at 06:49:04PM +0200, Arnaud Pouliquen wrote:
> The name service announcement should not be linked to the RPMsg virtio bus
> but to the RPMsg protocol itself.
> 
> This patch proposes to break the dependency with the RPmsg virtio bus by
> the introduction of the reserved RPMsg name service driver which will be in
> charge of managing the RPMsg name service announcement.
> 
> This first patch only implements the probe and the RPMsg endpoint to
> manage create and release channels remote requests.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/Kconfig          |   8 ++
>  drivers/rpmsg/Makefile         |   1 +
>  drivers/rpmsg/rpmsg_internal.h |  17 +++++
>  drivers/rpmsg/rpmsg_ns.c       | 135 +++++++++++++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index f96716893c2a..c3fc75e6514b 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -15,6 +15,14 @@ config RPMSG_CHAR
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_NS
> +	tristate "RPMSG name service announcement"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the name service announcement
> +	  channel that probes the associated RPMsg device on remote endpoint
> +	  service announcement.
> +
>  config RPMSG_MTK_SCP
>  	tristate "MediaTek SCP"
>  	depends on MTK_SCP
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index ffe932ef6050..8d452656f0ee 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> +obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index d5ab286d0e5e..641b48f6bf2a 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -102,4 +102,21 @@ static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>  	return rpmsg_register_device(rpdev);
>  }
>  
> +/**
> + * rpmsg_ns_register_device() - register name service device based on rpdev
> + * @rpdev: prepared rpdev to be used for creating endpoints
> + *
> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> + * basis for the rpmsg name service device.
> + */
> +static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> +{
> +	strcpy(rpdev->id.name, "rpmsg_ns");
> +	rpdev->driver_override = "rpmsg_ns";
> +	rpdev->src = RPMSG_NS_ADDR;
> +	rpdev->dst = RPMSG_NS_ADDR;
> +
> +	return rpmsg_register_device(rpdev);
> +}
> +
>  #endif
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> new file mode 100644
> index 000000000000..3c929b6976a6
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> + */
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include "rpmsg_internal.h"
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
> +	__le32 addr;
> +	__le32 flags;
> +} __packed;
> +
> +/* Invoked when a name service announcement arrives */
> +static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> +		       void *priv, u32 src)
> +{
> +	struct rpmsg_ns_msg *msg = data;
> +	struct rpmsg_device *newch;
> +	struct rpmsg_channel_info chinfo;
> +	struct device *dev = &rpdev->dev;
> +	unsigned int flags = le32_to_cpu(msg->flags);
> +	int ret;
> +
> +#if defined(CONFIG_DYNAMIC_DEBUG)
> +	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
> +			 data, len, true);
> +#endif
> +
> +	if (len != sizeof(*msg)) {
> +		dev_err(dev, "malformed ns msg (%d)\n", len);
> +		return -EINVAL;
> +	}
> +
> +	/* Don't trust the remote processor for null terminating the name */
> +	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> +
> +	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> +	chinfo.src = RPMSG_ADDR_ANY;
> +	chinfo.dst = le32_to_cpu(msg->addr);

As I said in an earlier comment I would like to avoid redefining structures that
already exist.  With this patch [1] we made structure rpmsg_hdr and rpmsg_ns_msg
virtIO specific, which in hindsight, wasn't the best move forward.  After taking
another look at this set and keeping Guennadi's work in mind it is probably best
to keep rpmsg_hdr and rpmsg_ns_msg generic and do the byte conversion based on
the transport layer used by the rpmsg_device.  Taking the above as an example we
would have:

        chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);

Where rpmsg32_to_cpu() would be defined as follow:

u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, u32 val)
{
        return rpdev->ops->transport32_to_cpu(rpdev, val); 
}

And in the case of a virtIO based rpmsg_device like we currently have:

u32 virtio_transport32_to_cpu(struct rpmsg_device *rpdev, u32 val)
{
        struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
        struct virtproc_info *vrp = vch->vrp;

        return virtio32_to_cpu(vrp->vdev, val);
}

That would allow the virtualisation people (and anyone else) to use the RPMSG
common code without modification and split up RPMSG name service from the
transport layer, as you're doing in this patch.

We need to fix the current code before moving further with either
patchset (yours and Guennadi's).  I started working on a patchset that does that
but I'll need to merge it with yours on Monday (I'm out of time for today).

Thanks,
Mathieu 

[1]. 111d1089700c rpmsg: virtio: add endianness conversions

> +
> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
> +		 (flags & RPMSG_NS_DESTROY) ? "destroy" : "creat",
> +		 msg->name, chinfo.dst);
> +
> +	if (flags & RPMSG_NS_DESTROY) {
> +		ret = rpmsg_release_channel(rpdev, &chinfo);
> +		if (ret)
> +			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> +	} else {
> +		newch = rpmsg_create_channel(rpdev, &chinfo);
> +		if (!newch)
> +			dev_err(dev, "rpmsg_create_channel failed\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info ns_chinfo;
> +	struct rpmsg_endpoint *ns_ept;
> +
> +	ns_chinfo.src = RPMSG_NS_ADDR;
> +	ns_chinfo.dst = RPMSG_NS_ADDR;
> +	strcpy(ns_chinfo.name, "name_service");
> +
> +	/*
> +	 * Create the NS announcement service endpoint associated to the RPMsg
> +	 * device. The endpoint will be automatically destroyed when the RPMsg
> +	 * device will be deleted.
> +	 */
> +	ns_ept = rpmsg_create_ept(rpdev, rpmsg_ns_cb, NULL, ns_chinfo);
> +	if (!ns_ept) {
> +		dev_err(&rpdev->dev, "failed to create the ns ept\n");
> +		return -ENOMEM;
> +	}
> +	rpdev->ept = ns_ept;
> +
> +	return 0;
> +}
> +
> +static struct rpmsg_driver rpmsg_ns_driver = {
> +	.drv.name = "rpmsg_ns",
> +	.probe = rpmsg_ns_probe,
> +};
> +
> +static int rpmsg_ns_init(void)
> +{
> +	int ret;
> +
> +	ret = register_rpmsg_driver(&rpmsg_ns_driver);
> +	if (ret < 0)
> +		pr_err("%s: Failed to register rpmsg driver\n", __func__);
> +
> +	return ret;
> +}
> +postcore_initcall(rpmsg_ns_init);
> +
> +static void rpmsg_ns_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_ns_driver);
> +}
> +module_exit(rpmsg_ns_exit);
> +
> +MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> +MODULE_ALIAS("rpmsg_ns");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
