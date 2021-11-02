Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072ABC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 15:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3A9F60F70
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 15:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKBPpI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 11:45:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:53520 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231674AbhKBPpI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 11:45:08 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2CTrSr027604;
        Tue, 2 Nov 2021 16:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SEQvxgbEG7jl8FccYv+bset8lr+Fd4DjQdgic8HgRak=;
 b=kxYDxBUWmc2/YlCTpxSzvuSy5i2QLnUDxqq77BxgLUunK8ngwWumewZySJcLbfO1cKlC
 hfapgEQ7X6VZWFsw/5jZpRlKz1Fym+FjNtQ64ql/OXMdXhKOz8uYkxrbGhCC4ruuoki9
 n/MD/EAFHxneCHUA2UkkDI9hRpR8Q87EF4Ib2jMBUPRnfCDw412qW8CaDKSa/jlenKFk
 wwIb9RI0uz8DjATR66ovLs/5BG/LmSnfQNNGBTh7NZv5uCeh6KtARcd0VanZXVkAJ+UI
 fIc5k6NYGmVf1ewJZQPJUDsQrL32eiQh8ksCwRaG0EReY045IKtfLtLTQwjXYGZCOI9D bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30uvkbfx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 16:42:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C459310002A;
        Tue,  2 Nov 2021 16:42:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB7BE2A4D74;
        Tue,  2 Nov 2021 16:42:29 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 16:42:29 +0100
Subject: Re: [PATCH v6 03/10] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-4-arnaud.pouliquen@foss.st.com>
 <YYAe1tUR+aCZ8cw0@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <37c37910-9cc0-2caa-de48-614d3b2f41a8@foss.st.com>
Date:   Tue, 2 Nov 2021 16:42:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYAe1tUR+aCZ8cw0@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/1/21 6:07 PM, Bjorn Andersson wrote:
> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
> 
>> Create the rpmsg_ctrl.c module and move the code related to the
>> rpmsg_ctrldev device in this new module.
>>
>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
>> kconfig file.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>
>> ---
>> update vs previous version:
>> - set the ctrl device class with new rpmsg_get_class API for legacy support
>> ---
>>  drivers/rpmsg/Kconfig      |   9 ++
>>  drivers/rpmsg/Makefile     |   1 +
>>  drivers/rpmsg/rpmsg_char.c | 169 +----------------------------
>>  drivers/rpmsg/rpmsg_char.h |   2 +
>>  drivers/rpmsg/rpmsg_ctrl.c | 216 +++++++++++++++++++++++++++++++++++++
>>  5 files changed, 230 insertions(+), 167 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>
>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>> index 0b4407abdf13..d822ec9ec692 100644
>> --- a/drivers/rpmsg/Kconfig
>> +++ b/drivers/rpmsg/Kconfig
>> @@ -10,11 +10,20 @@ config RPMSG_CHAR
>>  	tristate "RPMSG device interface"
>>  	depends on RPMSG
>>  	depends on NET
>> +	select RPMSG_CTRL
> 
> We don't want select of user selectable config options.
> 
>>  	help
>>  	  Say Y here to export rpmsg endpoints as device files, usually found
>>  	  in /dev. They make it possible for user-space programs to send and
>>  	  receive rpmsg packets.
>>  
>> +config RPMSG_CTRL
> 
> I still don't like the introduction of more Kconfig options - search the
> list for the number of patches that has corrected Kconfig dependency
> issues.
> 
> That said, if you get it right...
> 
>> +	tristate "RPMSG control interface"
>> +	depends on RPMSG
>> +	help
>> +	  Say Y here to enable the support of the /dev/rpmsg_ctrlX API. This API
>> +	  allows user-space programs to create endpoints with specific service name,
>> +	  source and destination addresses.
>> +
>>  config RPMSG_NS
>>  	tristate "RPMSG name service announcement"
>>  	depends on RPMSG
> [..]
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> [..]
>> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
>> index 109c2c43005f..ff1acc42628a 100644
>> --- a/drivers/rpmsg/rpmsg_char.h
>> +++ b/drivers/rpmsg/rpmsg_char.h
>> @@ -12,6 +12,8 @@
>>   * In such case a kernel warning is printed to help develloper to fix the issue.
>>   */
>>  
>> +#define RPMSG_DEV_MAX	(MINORMASK + 1)
> 
> This was used to define the minors of the rpmsg chdev, now you're
> splitting that range in one for the ctrl and one for the char.
> 
> Moving this define to a common place gives an impression that there's a
> relationship between the two, but I don't see any. So I think you should
> duplicate this in the two files - just like the other stuff.

That's true, I will fix this

> 
>> +
>>  #if IS_REACHABLE(CONFIG_RPMSG_CHAR)
>>  /**
>>   * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> new file mode 100644
>> index 000000000000..1d3c12e5cdcf
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2021, STMicroelectronics
> 
> Did you actually change anything that warrant the explicit copyright
> claim?
> 

Mainly because i created a new file here, but right it is a copy-past, so
I will remove it.

Thanks,
Arnaud

>> + * Copyright (c) 2016, Linaro Ltd.
>> + * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>> + * Copyright (c) 2012, PetaLogix
>> + * Copyright (c) 2011, Texas Instruments, Inc.
>> + * Copyright (c) 2011, Google, Inc.
>> + *
>> + * Based on rpmsg performance statistics driver by Michal Simek, which in turn
>> + * was based on TI & Google OMX rpmsg driver.
>> + */
> [..]
>> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_ctrldev *ctrldev;
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
>> +	if (!ctrldev)
>> +		return -ENOMEM;
>> +
>> +	ctrldev->rpdev = rpdev;
>> +
>> +	dev = &ctrldev->dev;
>> +	device_initialize(dev);
>> +	dev->parent = &rpdev->dev;
>> +	dev->class = rpmsg_get_class();
> 
> Thank you.
> 
> Regards,
> Bjorn
> 
