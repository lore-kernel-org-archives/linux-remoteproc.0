Return-Path: <SRS0=A3Cg=DI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CEBC4727E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 16:14:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 940EF20759
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 16:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="XzW3ok3B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbgJAQO5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Oct 2020 12:14:57 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42124 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730534AbgJAQO5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Oct 2020 12:14:57 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 091GD1x4004237;
        Thu, 1 Oct 2020 18:14:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=gnZRMgovLNyZarhwmANpBM90CFjwCVSsIi+p1+jKpwE=;
 b=XzW3ok3BCVoGdAHVZW5bUFrLhX7uMCmqyazjstkgjQ6JSMGnQsTz4khi1d8MpQRU8ESe
 8LHMN70n5e8Ee3TX4WOseblxw5kzUEyKGLXzuzxWxdJQNWk87S5M0TDuXgO27AObg4C4
 ogc+Qx7ICbasY2/6B1M6NU26RMYPYNb0CCMsF4LfmJKyhHvPUgZ5d9b2RwtcISx3cQ2s
 aZlvtMHac2T1P7eVVhgQc4kCwdgeAbQWbooJHbPiKK75kPT08Ms5zJcTPUAePoRoMPGL
 3mxF6FgCjPQVFxnvigXt3r/eQi7hpCJFlGxIK6NlmdfcmBktMWbTOmt3ODgPAl6MvAiG UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33svhexed7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Oct 2020 18:14:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F48710002A;
        Thu,  1 Oct 2020 18:14:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90BE62B4D0D;
        Thu,  1 Oct 2020 18:14:49 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 18:14:20 +0200
Subject: Re: [PATCH 06/10] rpmsg: Turn name service into a stand alone driver
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-7-mathieu.poirier@linaro.org>
 <20200930070912.GE20683@ubuntu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <4d6c79d5-b98e-52ab-4114-d7441e83ed76@st.com>
Date:   Thu, 1 Oct 2020 18:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930070912.GE20683@ubuntu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-01_05:2020-10-01,2020-10-01 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/30/20 9:09 AM, Guennadi Liakhovetski wrote:
> On Mon, Sep 21, 2020 at 06:09:56PM -0600, Mathieu Poirier wrote:
>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>
>> Make the RPMSG name service announcement a stand alone driver so that it
>> can be reused by other subsystems.  It is also the first step in making the
>> functionatlity transport independent, i.e that is not tied to virtIO.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/rpmsg/Kconfig          |   8 +++
>>  drivers/rpmsg/Makefile         |   1 +
>>  drivers/rpmsg/rpmsg_internal.h |  18 ++++++
>>  drivers/rpmsg/rpmsg_ns.c       | 110 +++++++++++++++++++++++++++++++++
>>  4 files changed, 137 insertions(+)
>>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>>
>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>> index f96716893c2a..c3fc75e6514b 100644
>> --- a/drivers/rpmsg/Kconfig
>> +++ b/drivers/rpmsg/Kconfig
>> @@ -15,6 +15,14 @@ config RPMSG_CHAR
>>  	  in /dev. They make it possible for user-space programs to send and
>>  	  receive rpmsg packets.
>>  
>> +config RPMSG_NS
>> +	tristate "RPMSG name service announcement"
>> +	depends on RPMSG
>> +	help
>> +	  Say Y here to enable the support of the name service announcement
>> +	  channel that probes the associated RPMsg device on remote endpoint
>> +	  service announcement.
>> +
>>  config RPMSG_MTK_SCP
>>  	tristate "MediaTek SCP"
>>  	depends on MTK_SCP
>> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
>> index ffe932ef6050..8d452656f0ee 100644
>> --- a/drivers/rpmsg/Makefile
>> +++ b/drivers/rpmsg/Makefile
>> @@ -1,6 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
>> +obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index 3ea9cec26fc0..04e6cb287e18 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -15,6 +15,7 @@
>>  #include <linux/idr.h>
>>  #include <linux/mutex.h>
>>  #include <linux/rpmsg.h>
>> +#include <linux/rpmsg_ns.h>
>>  #include <linux/types.h>
>>  #include <linux/virtio.h>
>>  #include <linux/wait.h>
>> @@ -164,4 +165,21 @@ static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>>  	return rpmsg_register_device(rpdev);
>>  }
>>  
>> +/**
>> + * rpmsg_ns_register_device() - register name service device based on rpdev
>> + * @rpdev: prepared rpdev to be used for creating endpoints
>> + *
>> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
>> + * basis for the rpmsg name service device.
>> + */
>> +static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
>> +{
>> +	strcpy(rpdev->id.name, "rpmsg_ns");
>> +	rpdev->driver_override = "rpmsg_ns";
>> +	rpdev->src = RPMSG_NS_ADDR;
>> +	rpdev->dst = RPMSG_NS_ADDR;
>> +
>> +	return rpmsg_register_device(rpdev);
>> +}
>> +
>>  #endif
>> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
>> new file mode 100644
>> index 000000000000..b3318bf84433
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_ns.c
>> @@ -0,0 +1,110 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
>> + */
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/rpmsg_ns.h>
>> +#include <linux/virtio_config.h>
>> +#include "rpmsg_internal.h"
>> +
>> +/* Invoked when a name service announcement arrives */
>> +static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>> +		       void *priv, u32 src)
>> +{
>> +	struct rpmsg_ns_msg *msg = data;
>> +	struct rpmsg_device *newch;
>> +	struct rpmsg_channel_info chinfo;
>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> 
> Let's not do this, non-VirtIO RPMsg drivers shouldn't need this struct.

Is this patch could be merged with the patch 10/10 to avoid this
temporay implementation?

Regards,
Arnaud

> 
>> +	struct virtproc_info *vrp = vch->vrp;
>> +	struct device *dev = &vrp->vdev->dev;
>> +	int ret;
>> +
>> +#if defined(CONFIG_DYNAMIC_DEBUG)
>> +	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
>> +			 data, len, true);
>> +#endif
>> +
>> +	if (len != sizeof(*msg)) {
>> +		dev_err(dev, "malformed ns msg (%d)\n", len);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Don't trust the remote processor for null terminating the name */
>> +	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
>> +
>> +	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>> +	chinfo.src = RPMSG_ADDR_ANY;
>> +	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
>> +
>> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
>> +		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
>> +		 "destroy" : "creat", msg->name, chinfo.dst);
>> +
>> +	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
>> +		ret = rpmsg_release_channel(rpdev, &chinfo);
>> +		if (ret)
>> +			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
>> +	} else {
>> +		newch = rpmsg_create_channel(rpdev, &chinfo);
>> +		if (!newch)
>> +			dev_err(dev, "rpmsg_create_channel failed\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_channel_info ns_chinfo;
> 
> +	struct rpmsg_channel_info ns_chinfo = {
> +		.src = RPMSG_NS_ADDR,
> +		.dst = RPMSG_NS_ADDR,
> +		.name = "name_service",
> +	};
> 
> Thanks
> Guennadi
> 
>> +	struct rpmsg_endpoint *ns_ept;
>> +
>> +	ns_chinfo.src = RPMSG_NS_ADDR;
>> +	ns_chinfo.dst = RPMSG_NS_ADDR;
>> +	strcpy(ns_chinfo.name, "name_service");
>> +
>> +	/*
>> +	 * Create the NS announcement service endpoint associated to the RPMsg
>> +	 * device. The endpoint will be automatically destroyed when the RPMsg
>> +	 * device will be deleted.
>> +	 */
>> +	ns_ept = rpmsg_create_ept(rpdev, rpmsg_ns_cb, NULL, ns_chinfo);
>> +	if (!ns_ept) {
>> +		dev_err(&rpdev->dev, "failed to create the ns ept\n");
>> +		return -ENOMEM;
>> +	}
>> +	rpdev->ept = ns_ept;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct rpmsg_driver rpmsg_ns_driver = {
>> +	.drv.name = "rpmsg_ns",
>> +	.probe = rpmsg_ns_probe,
>> +};
>> +
>> +static int rpmsg_ns_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_ns_driver);
>> +	if (ret < 0)
>> +		pr_err("%s: Failed to register rpmsg driver\n", __func__);
>> +
>> +	return ret;
>> +}
>> +postcore_initcall(rpmsg_ns_init);
>> +
>> +static void rpmsg_ns_exit(void)
>> +{
>> +	unregister_rpmsg_driver(&rpmsg_ns_driver);
>> +}
>> +module_exit(rpmsg_ns_exit);
>> +
>> +MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
>> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
>> +MODULE_ALIAS("rpmsg_ns");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> 2.25.1
>>
