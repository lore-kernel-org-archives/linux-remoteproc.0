Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C536C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 14:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F4E760C4B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 14:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhKBOzn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:55:43 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:47414 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234136AbhKBOzm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 10:55:42 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2CdoCn027700;
        Tue, 2 Nov 2021 15:52:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eqvDdd0ahR8WFYpXCJbJgfrk+LtLUkWSTird/QHRFCA=;
 b=0mpz1fqwlOx5hgWloXUXxbwxWISXqNoqiMewf04rZRXuE4Htlst4Jp8D9WtPgpiZOgAP
 ne00m6j7wPwFJmqIvEwsgmrfjsco6RF7t/+viJBYGo4RsIQOmYEgggyFPfjX5QOpMYzY
 BXAzbOQ+9QH29vApoCKUIQCy/NkNN7H9fcAeUMgSij6k2+QALc7U3c1kgDTNICi0aeVn
 e3UTDdpRYZ2huhc7YS2gSqLjsj4sTDTsgkaCDMH8Dl8rSyHjwzsZNW/HfuAxf+4NZV5L
 uwDKN+Bz9iVkpsBNniLmo/PcrR/YgnJBV9ApCDHeiL4jdrzslCIH54fYsC5EuT6Q2H73 /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30uvk2hc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 15:52:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CEEE10002A;
        Tue,  2 Nov 2021 15:52:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CE3E24165D;
        Tue,  2 Nov 2021 15:52:56 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 15:52:55 +0100
Subject: Re: [PATCH v6 01/10] rpmsg: char: Export eptdev create an destroy
 functions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-2-arnaud.pouliquen@foss.st.com>
 <YYAb8P1Exqf4emQ3@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <c7a7d901-8472-d641-1e14-4c8339d124fc@foss.st.com>
Date:   Tue, 2 Nov 2021 15:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYAb8P1Exqf4emQ3@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On 11/1/21 5:55 PM, Bjorn Andersson wrote:
> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
> 
>> To prepare the split of the code related to the control (ctrldev)
>> and the endpoint (eptdev) devices in 2 separate files:
>>
>> - Rename and export the functions in rpmsg_char.h.
>>
>> - Suppress the dependency with the rpmsg_ctrldev struct in the
>>   rpmsg_eptdev_create function.
>>
>> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  update vs previous revision:
>>   - add comment to explain the IS_REACHABLE usage
>>   - remove Mathieu Poirier reviewed-by as patch updated
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 18 +++++++-----
>>  drivers/rpmsg/rpmsg_char.h | 57 ++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 68 insertions(+), 7 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index b5907b80727c..941c5c54dd72 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> + * Copyright (C) 2021, STMicroelectronics
>>   * Copyright (c) 2016, Linaro Ltd.
>>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>>   * Copyright (c) 2012, PetaLogix
>> @@ -22,6 +23,8 @@
>>  #include <linux/uaccess.h>
>>  #include <uapi/linux/rpmsg.h>
>>  
>> +#include "rpmsg_char.h"
>> +
>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>>  
>>  static dev_t rpmsg_major;
>> @@ -76,7 +79,7 @@ struct rpmsg_eptdev {
>>  	wait_queue_head_t readq;
>>  };
>>  
>> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>>  {
>>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>>  
>> @@ -95,6 +98,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>>  
>>  static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>>  			void *priv, u32 addr)
>> @@ -278,7 +282,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>>  		return -EINVAL;
>>  
>> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
>> +	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>>  }
>>  
>>  static const struct file_operations rpmsg_eptdev_fops = {
>> @@ -337,10 +341,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>>  	kfree(eptdev);
>>  }
>>  
>> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>>  			       struct rpmsg_channel_info chinfo)
>>  {
>> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
>>  	struct rpmsg_eptdev *eptdev;
>>  	struct device *dev;
>>  	int ret;
>> @@ -360,7 +363,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>>  
>>  	device_initialize(dev);
>>  	dev->class = rpmsg_class;
>> -	dev->parent = &ctrldev->dev;
>> +	dev->parent = parent;
>>  	dev->groups = rpmsg_eptdev_groups;
>>  	dev_set_drvdata(dev, eptdev);
>>  
>> @@ -403,6 +406,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>>  
>>  	return ret;
>>  }
>> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>  
>>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>>  {
>> @@ -442,7 +446,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	chinfo.src = eptinfo.src;
>>  	chinfo.dst = eptinfo.dst;
>>  
>> -	return rpmsg_eptdev_create(ctrldev, chinfo);
>> +	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>>  };
>>  
>>  static const struct file_operations rpmsg_ctrldev_fops = {
>> @@ -528,7 +532,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>  	int ret;
>>  
>>  	/* Destroy all endpoints */
>> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
>> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>>  	if (ret)
>>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>>  
>> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
>> new file mode 100644
>> index 000000000000..109c2c43005f
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_char.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) STMicroelectronics 2021.
>> + */
>> +
>> +#ifndef __RPMSG_CHRDEV_H__
>> +#define __RPMSG_CHRDEV_H__
>> +
>> +/*
>> + * The IS_REACHABLE macro is used here to prevent unresolved symbol error during link,
>> + * building with RPMSG_CHAR=m and RPMSG_CTRL=y configuration.
>> + * In such case a kernel warning is printed to help develloper to fix the issue.
>> + */
> 
> I think we concluded that RPMSG_CHAR=n, RPMSG_CTRL=y is a valid
> combination. If so I presume you don't want the user to get the kernel
> log spammed by the WARN_ON()?
> 
> Afaict this should only ever be invoked by rpmsg_ctrl and with
> RPMSG_CHAR disabled the related ioctls should just fail nicely.
> 
> 
> As such. I think this should be #if IS_ENABLED() and we should put:
> 
> 	depends on RPMSG_CHAR || RPMSG_CHAR=n
> 
> in the RPMSG_CTRL Kconfig.

Need to make more tests but that seems to me a very good way to solve the
dependency.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +
>> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
>> +/**
>> + * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
>> + * @rpdev:  prepared rpdev to be used for creating endpoints
>> + * @parent: parent device
>> + * @chinfo: associated endpoint channel information.
>> + *
>> + * This function create a new rpmsg char endpoint device to instantiate a new
>> + * endpoint based on chinfo information.
>> + */
>> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo);
>> +
>> +/**
>> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
>> + * @data: private data associated to the endpoint device
>> + *
>> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
>> + * control.
>> + */
>> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
>> +
>> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
>> +
>> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>> +					     struct rpmsg_channel_info chinfo)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
>> +
>> +#endif /*__RPMSG_CHRDEV_H__ */
>> -- 
>> 2.17.1
>>
