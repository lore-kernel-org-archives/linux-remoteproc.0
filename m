Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9A2C63697
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 14:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 476A42158C
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 14:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="eCPoeo1a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgKSOxA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:53:00 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:17162 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725877AbgKSOxA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:53:00 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AJEl8As028587;
        Thu, 19 Nov 2020 15:52:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=SSOxPz2TniKo2TDBHtQk/G3kKQIftya/l+9yYYdaKxo=;
 b=eCPoeo1ajO+SFDAKHUuiCaV5MWUUHQGoL+XpPvbO1qyXwBy3TS9CgT5eFmWtgko+/anL
 gTdFYJD6HZL4iFWC60NCAPUMz1dkacFPk6YYuZBTciyznXoEL8+0ihTwn3ETWi0NY9B0
 Dy6jfQCmTeyjviDoOw5cphSnv/WKgW7JWTOpkpQXBJBMwpHpijSwzoMpOmEFLZFeC36k
 NMn2n6AzQmL7uoXC+7qvq99eT9wWfKm3ms7HXe8WgGQ+6HHTBZfVwm2ATqX+X54thjlr
 KeBK4ahZPJkWVAeCR3FX6UXgCFiJe4y2LmgKgub7idos7ZUh3RX+b2FZTVJc/Wpjxanl vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34t58d0xvy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Nov 2020 15:52:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D11610002A;
        Thu, 19 Nov 2020 15:52:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D82A290CA6;
        Thu, 19 Nov 2020 15:52:52 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 15:52:51 +0100
Subject: Re: [PATCH v6 8/8] rpmsg: Turn name service into a stand alone driver
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
 <20201118213700.74106-9-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <447fdbd6-2e3d-2786-c444-25148efcb9f8@st.com>
Date:   Thu, 19 Nov 2020 15:52:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118213700.74106-9-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-19_09:2020-11-19,2020-11-19 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 11/18/20 10:37 PM, Mathieu Poirier wrote:
> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> 
> Make the RPMSG name service announcement a stand alone driver so that it
> can be reused by other subsystems.  It is also the first step in making the
> functionatlity transport independent, i.e that is not tied to virtIO.
> 
> Co-developed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Co-developed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/Kconfig            |   9 +++
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c |  86 +++++----------------
>  include/linux/rpmsg/ns.h         |   3 +
>  5 files changed, 158 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index f96716893c2a..0b4407abdf13 100644
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
> @@ -62,6 +70,7 @@ config RPMSG_VIRTIO
>  	tristate "Virtio RPMSG bus driver"
>  	depends on HAS_DMA
>  	select RPMSG
> +	select RPMSG_NS
>  	select VIRTIO
>  
>  endmenu
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
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> new file mode 100644
> index 000000000000..66a22497d316
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> + */
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/ns.h>
> +
> +#include "rpmsg_internal.h"
> +
> +/**
> + * rpmsg_ns_register_device() - register name service device based on rpdev
> + * @rpdev: prepared rpdev to be used for creating endpoints
> + *
> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> + * basis for the rpmsg name service device.
> + */
> +int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> +{
> +	strcpy(rpdev->id.name, "rpmsg_ns");
> +	rpdev->driver_override = "rpmsg_ns";
> +	rpdev->src = RPMSG_NS_ADDR;
> +	rpdev->dst = RPMSG_NS_ADDR;
> +
> +	return rpmsg_register_device(rpdev);
> +}
> +EXPORT_SYMBOL(rpmsg_ns_register_device);
> +
> +/* invoked when a name service announcement arrives */
> +static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> +		       void *priv, u32 src)
> +{
> +	struct rpmsg_ns_msg *msg = data;
> +	struct rpmsg_device *newch;
> +	struct rpmsg_channel_info chinfo;
> +	struct device *dev = rpdev->dev.parent;
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
> +	/* don't trust the remote processor for null terminating the name */
> +	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> +
> +	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> +	chinfo.src = RPMSG_ADDR_ANY;
> +	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
> +
> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
> +		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
> +		 "destroy" : "creat", msg->name, chinfo.dst);
> +
> +	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
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
> +	struct rpmsg_endpoint *ns_ept;
> +	struct rpmsg_channel_info ns_chinfo = {
> +		.src = RPMSG_NS_ADDR,
> +		.dst = RPMSG_NS_ADDR,
> +		.name = "name_service",
> +	};
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
> +	.drv.name = KBUILD_MODNAME,
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
> +MODULE_DESCRIPTION("Name service announcement rpmsg driver");
> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 6ec299f7f790..338f16c6563d 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -49,7 +49,6 @@
>   * @endpoints_lock: lock of the endpoints set
>   * @sendq:	wait queue of sending contexts waiting for a tx buffers
>   * @sleepers:	number of senders that are waiting for a tx buffer
> - * @ns_ept:	the bus's name service endpoint
>   *
>   * This structure stores the rpmsg state of a given virtio remote processor
>   * device (there might be several virtio proc devices for each physical
> @@ -68,7 +67,6 @@ struct virtproc_info {
>  	struct mutex endpoints_lock;
>  	wait_queue_head_t sendq;
>  	atomic_t sleepers;
> -	struct rpmsg_endpoint *ns_ept;
>  };
>  
>  /* The feature bitmap for virtio rpmsg */
> @@ -815,69 +813,14 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
>  	wake_up_interruptible(&vrp->sendq);
>  }
>  
> -/* invoked when a name service announcement arrives */
> -static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> -		       void *priv, u32 src)
> -{
> -	struct rpmsg_ns_msg *msg = data;
> -	struct rpmsg_device *newch;
> -	struct rpmsg_channel_info chinfo;
> -	struct virtproc_info *vrp = priv;
> -	struct device *dev = &vrp->vdev->dev;
> -	bool little_endian = virtio_is_little_endian(vrp->vdev);
> -	int ret;
> -
> -#if defined(CONFIG_DYNAMIC_DEBUG)
> -	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
> -			 data, len, true);
> -#endif
> -
> -	if (len != sizeof(*msg)) {
> -		dev_err(dev, "malformed ns msg (%d)\n", len);
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * the name service ept does _not_ belong to a real rpmsg channel,
> -	 * and is handled by the rpmsg bus itself.
> -	 * for sanity reasons, make sure a valid rpdev has _not_ sneaked
> -	 * in somehow.
> -	 */
> -	if (rpdev) {
> -		dev_err(dev, "anomaly: ns ept has an rpdev handle\n");
> -		return -EINVAL;
> -	}
> -
> -	/* don't trust the remote processor for null terminating the name */
> -	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> -
> -	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> -	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = __rpmsg32_to_cpu(little_endian, msg->addr);
> -
> -	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 __rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY ?
> -		 "destroy" : "creat", msg->name, chinfo.dst);
> -
> -	if (__rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY) {
> -		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
> -		if (ret)
> -			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> -	} else {
> -		newch = __rpmsg_create_channel(vrp, &chinfo);
> -		if (!newch)
> -			dev_err(dev, "rpmsg_create_channel failed\n");
> -	}
> -
> -	return 0;
> -}
> -
>  static int rpmsg_probe(struct virtio_device *vdev)
>  {
>  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
>  	static const char * const names[] = { "input", "output" };
>  	struct virtqueue *vqs[2];
>  	struct virtproc_info *vrp;
> +	struct virtio_rpmsg_channel *vch;
> +	struct rpmsg_device *rpdev_ns;
>  	void *bufs_va;
>  	int err = 0, i;
>  	size_t total_buf_space;
> @@ -953,14 +896,26 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	/* if supported by the remote processor, enable the name service */
>  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
> -		/* a dedicated endpoint handles the name service msgs */
> -		vrp->ns_ept = __rpmsg_create_ept(vrp, NULL, rpmsg_ns_cb,
> -						vrp, RPMSG_NS_ADDR);
> -		if (!vrp->ns_ept) {
> -			dev_err(&vdev->dev, "failed to create the ns ept\n");
> +		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
> +		if (!vch) {
>  			err = -ENOMEM;
>  			goto free_coherent;
>  		}
> +
> +		/* Link the channel to our vrp */
> +		vch->vrp = vrp;
> +
> +		/* Assign public information to the rpmsg_device */
> +		rpdev_ns = &vch->rpdev;
> +		rpdev_ns->ops = &virtio_rpmsg_ops;
> +		rpdev_ns->little_endian = virtio_is_little_endian(vrp->vdev);
> +
> +		rpdev_ns->dev.parent = &vrp->vdev->dev;
> +		rpdev_ns->dev.release = virtio_rpmsg_release_device;
> +
> +		err = rpmsg_ns_register_device(rpdev_ns);
> +		if (err)
> +			goto free_coherent;

As Guennadi mentionned in a previous mail
a kfree(vch) is missing on error

@@ -949,10 +949,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	dev_info(&vdev->dev, "rpmsg host is online\n");

 	return 0;

 free_coherent:
+	kfree(vch);
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:

Otherwise i tested this series successfully.

Thanks,
Arnaud

>  	}
>  
>  	/*
> @@ -1013,9 +968,6 @@ static void rpmsg_remove(struct virtio_device *vdev)
>  	if (ret)
>  		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
>  
> -	if (vrp->ns_ept)
> -		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
> -
>  	idr_destroy(&vrp->endpoints);
>  
>  	vdev->config->del_vqs(vrp->vdev);
> diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
> index 73ecc91dc26f..a7804edd6d58 100644
> --- a/include/linux/rpmsg/ns.h
> +++ b/include/linux/rpmsg/ns.h
> @@ -4,6 +4,7 @@
>  #define _LINUX_RPMSG_NS_H
>  
>  #include <linux/mod_devicetable.h>
> +#include <linux/rpmsg.h>
>  #include <linux/rpmsg/byteorder.h>
>  #include <linux/types.h>
>  
> @@ -39,4 +40,6 @@ enum rpmsg_ns_flags {
>  /* Address 53 is reserved for advertising remote services */
>  #define RPMSG_NS_ADDR			(53)
>  
> +int rpmsg_ns_register_device(struct rpmsg_device *rpdev);
> +
>  #endif
> 
