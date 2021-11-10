Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1414C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 16:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8345961168
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 16:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhKJQ57 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Nov 2021 11:57:59 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:46334 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231577AbhKJQ56 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Nov 2021 11:57:58 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AABtc3e015818;
        Wed, 10 Nov 2021 17:55:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mO/Ss6mrE0C3GxnsXQ/FjD90wHACiXPvt8KfcgW7YAU=;
 b=QcIgqV2ns3xUelpIaoCrKnol31M70ip8/pa4Qy+ikVORg6qfRU2W1Xsn8FuOGajcpJQl
 tWtRibW+ps0TM/R74IS49dJrVSxEKbIHJDdO1dZE1yTpvOXm94IPVEVDuIYqoP6OdWYY
 a84VuoPxJyyhbXyzV6JGh3WAtcqueI7TQdyYLBw5HCqWTAl549qXpy3aysDATFhj8Og9
 Zh1gkwLEzzQ+RZMw3c9LObBeLOaOD4ks/2nzPfnzB85ToXEu1s1mniRuad9IfQvCjwXF
 +bknFFpNSB7ozdsgECpHcX6zwQJDp3IXVY0SfyaSCyDoVz02+PZz8mcm3zH6hrZOavmY YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c8dmw1u15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Nov 2021 17:55:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C506210002A;
        Wed, 10 Nov 2021 17:55:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB9E820AA92;
        Wed, 10 Nov 2021 17:55:07 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov
 2021 17:55:06 +0100
Subject: Re: [RFC PATCH v2 1/1] rpmsg: add syslog driver
To:     Christian Gmeiner <christian.gmeiner@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211109083926.32052-1-christian.gmeiner@gmail.com>
 <20211109083926.32052-2-christian.gmeiner@gmail.com>
 <YYq4tjyv0qh+Zpqe@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <30de037d-3acd-8e9d-979c-b3d0c1c84002@foss.st.com>
Date:   Wed, 10 Nov 2021 17:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYq4tjyv0qh+Zpqe@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_06,2021-11-08_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Christian,

On 11/9/21 7:06 PM, Bjorn Andersson wrote:
> On Tue 09 Nov 00:39 PST 2021, Christian Gmeiner wrote:
> 
>> Allows the remote firmware to log into syslog.
>>

For you information a similar patch has been sent few years ago:
https://www.spinics.net/lists/kernel/msg3045824.html

The suspend /resume mechanism seems interesting to manage the low power use case.

> 
> This allows the remote firmware to print log messages in the kernel log,
> not the syslog (although your system might inject the kernel log into
> the syslog as well)
> 
>> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>> ---
>>  drivers/rpmsg/Kconfig        |  8 +++++
>>  drivers/rpmsg/Makefile       |  1 +
>>  drivers/rpmsg/rpmsg_syslog.c | 65 ++++++++++++++++++++++++++++++++++++
> 
> drivers/rpmsg is for rpmsg bus and transport drivers. Client drivers
> should live elsewhere.
> 
> But perhaps, rather than having a driver for this, you could simply use
> rpmsg_char and a userspace tool; if you want to get the remote processor
> logs into syslog, instead of the kernel log?

This is also a question that comes to me while looking at the patch.
rpmsg_tty service (if available in 5.16) could be another alternative.

Regards,
Arnaud

> 
>>  3 files changed, 74 insertions(+)
>>  create mode 100644 drivers/rpmsg/rpmsg_syslog.c
>>
>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>> index 0b4407abdf13..801f9956ec21 100644
>> --- a/drivers/rpmsg/Kconfig
>> +++ b/drivers/rpmsg/Kconfig
>> @@ -73,4 +73,12 @@ config RPMSG_VIRTIO
>>  	select RPMSG_NS
>>  	select VIRTIO
>>  
>> +config RPMSG_SYSLOG
>> +	tristate "SYSLOG device interface"
>> +	depends on RPMSG
>> +	help
>> +	  Say Y here to export rpmsg endpoints as device files, usually found
>> +	  in /dev. They make it possible for user-space programs to send and
>> +	  receive rpmsg packets.
>> +
>>  endmenu
>> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
>> index 8d452656f0ee..75b2ec7133a5 100644
>> --- a/drivers/rpmsg/Makefile
>> +++ b/drivers/rpmsg/Makefile
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
>>  obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
>>  obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
>>  obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
>> +obj-$(CONFIG_RPMSG_SYSLOG)	+= rpmsg_syslog.o
>> diff --git a/drivers/rpmsg/rpmsg_syslog.c b/drivers/rpmsg/rpmsg_syslog.c
>> new file mode 100644
>> index 000000000000..b3fdae495fd9
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_syslog.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/rpmsg.h>
>> +
>> +static int rpmsg_syslog_cb(struct rpmsg_device *rpdev, void *data, int len,
>> +			   void *priv, u32 src)
>> +{
>> +	const char *buffer = data;
>> +
>> +	switch (buffer[0]) {
>> +	case 'e':
>> +		dev_err(&rpdev->dev, "%s", buffer + 1);
>> +		break;
>> +	case 'w':
>> +		dev_warn(&rpdev->dev, "%s", buffer + 1);
>> +		break;
>> +	case 'i':
>> +		dev_info(&rpdev->dev, "%s", buffer + 1);
>> +		break;
>> +	default:
>> +		dev_info(&rpdev->dev, "%s", buffer);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_endpoint *syslog_ept;
>> +	struct rpmsg_channel_info syslog_chinfo = {
>> +		.src = 42,
>> +		.dst = 42,
>> +		.name = "syslog",
>> +	};
>> +
>> +	/*
>> +	 * Create the syslog service endpoint associated to the RPMsg
>> +	 * device. The endpoint will be automatically destroyed when the RPMsg
>> +	 * device will be deleted.
>> +	 */
>> +	syslog_ept = rpmsg_create_ept(rpdev, rpmsg_syslog_cb, NULL, syslog_chinfo);
> 
> The rpmsg_device_id below should cause the device to probe on the
> presence of a "syslog" channel announcement, so why are you creating a
> new endpoint with the same here?
> 
> Why aren't you just specifying the callback of the driver?
> 
>> +	if (!syslog_ept) {
>> +		dev_err(&rpdev->dev, "failed to create the syslog ept\n");
>> +		return -ENOMEM;
>> +	}
>> +	rpdev->ept = syslog_ept;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct rpmsg_device_id rpmsg_driver_syslog_id_table[] = {
>> +	{ .name = "syslog" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_syslog_id_table);
>> +
>> +static struct rpmsg_driver rpmsg_syslog_client = {
>> +	.drv.name       = KBUILD_MODNAME,
>> +	.id_table       = rpmsg_driver_syslog_id_table,
>> +	.probe          = rpmsg_syslog_probe,
>> +};
>> +module_rpmsg_driver(rpmsg_syslog_client);
> 
> I would expect that building this as a module gives you complaints about
> lacking MODULE_LICENSE().
> 
> Regards,
> Bjorn
> 
>> -- 
>> 2.33.1
>>
