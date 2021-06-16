Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6284CC48BE6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 12:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C7DA60249
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 12:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhFPMkn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Jun 2021 08:40:43 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13224 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229456AbhFPMkm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Jun 2021 08:40:42 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15GCcRUW007162;
        Wed, 16 Jun 2021 14:38:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QzRWOR2kSXy9UXeKbv50amd1IimDpSe++L963P+6FOY=;
 b=KNVjFfC39a+P/aoF97I2lFe4Gu5CnlvlVDW0vxViwT5/syW9IPv3zJlvs6n+95dbJ3C0
 DhJVQmYlYfh1ADTrNvlasiMXnhDDA27j4P34rKcsKQoCogAZ+D0h3l3zy1V8c44aNfqt
 hyCM9Kxv3HzXdlDNeXBZAkeSs7yv1kCy6AI+2tNxmLNKIKS72atsyErd9D8c3AqD6emm
 qvxRGm14OwDnsARJei5m6KhdYrgOOQztbOMO4RoGT20bqIpjfwGx2rWPfKYbVLLl1+yl
 R0QunWbUkQ5agB4BmAOfJIL/401ZCUivoCfUDJ675v7Ea21anLDmvaYWJR7HfQ5MoyS7 Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 397etes260-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Jun 2021 14:38:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D73B510002A;
        Wed, 16 Jun 2021 14:38:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE41D226FC4;
        Wed, 16 Jun 2021 14:38:27 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 14:38:27 +0200
Subject: Re: [PATCH 3/4] rpmsg: char: Introduce the "rpmsg-raw" channel
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <20210607173032.30133-4-arnaud.pouliquen@foss.st.com>
 <20210615200102.GE604521@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b55cd4e5-fb9d-a0ab-03a9-3a771898db04@foss.st.com>
Date:   Wed, 16 Jun 2021 14:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615200102.GE604521@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_07:2021-06-15,2021-06-16 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 6/15/21 10:01 PM, Mathieu Poirier wrote:
> On Mon, Jun 07, 2021 at 07:30:31PM +0200, Arnaud Pouliquen wrote:
>> Allows to probe the endpoint device on a remote name service announcement,
>> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
>>
>> With this patch the /dev/rpmsgX interface can be instantiated by the remote
>> firmware.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 54 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 4199ac1bee10..3b850b218eb0 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -25,6 +25,8 @@
>>  
>>  #include "rpmsg_char.h"
>>  
>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>> +
>>  static dev_t rpmsg_major;
>>  static struct class *rpmsg_class;
>>  
>> @@ -416,6 +418,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>  
>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_channel_info chinfo;
>> +
>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>> +	chinfo.src = rpdev->src;
>> +	chinfo.dst = rpdev->dst;
>> +
>> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
> 
> I am a little puzzled here as to why we need different modes... Why can't we
> simply call rpmsg_chrdev_eptdev_create() and let the endpoint be created on
> open() and destroyed on release() as per the current implementation?

The main reason is the support of the NS announcement
a NS announcement is received from the remote processor:
channel name: "rpmsg-raw"
remote address (dst address): 0x400
local address (scr address) : RPMSG_ADDR_ANY
=> no default endpoint, and not local address.

case 1) if we use legacy implementation ( no default endpoint)
=> create/destroy endpoint on open/stop
- on first open: created endpoint is bound to scr address 0x406
- a first message is sent to the remote side, the address 0x406 is stored as
default channel dst address on remote side.
- on close: endpoint is closed and associated address 0x406 is free.
- another driver create an enpoint the address 0x406 is reserved for this new
endpoint.
- on new open:  scr address is set to next value 0x407
=> how to inform remote processor that the address has changed?
=> no reservation mechanism that ensure that you can reuse the same address

case 2) relying on use_default_ept
=> Ensure that both side have always the same addresses to communicate.

> 
> I'd rather keep things simple for the refactoring and introduce new features
> later if need be.

Yes I agree with you, but here it could become a nightmare for the remote
processor if the Linux endpoint address is not stable.

Anyway we can consider this as a workaround waiting the extension of the NS
announcement to have a better management of the address exchange on channel
initialization.

Thanks
Arnaud

> 
> As I said, it may be that I don't understand the usecase.
> 
> Thanks,
> Mathieu
> 
>> +}
>> +
>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>> +{
>> +	int ret;
>> +
>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>> +	if (ret)
>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>> +}
>> +
>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>> +	{ .name	= RPMSG_CHAR_DEVNAME },
>> +	{ },
>> +};
>> +
>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>> +	.probe = rpmsg_chrdev_probe,
>> +	.remove = rpmsg_chrdev_remove,
>> +	.id_table = rpmsg_chrdev_id_table,
>> +	.drv = {
>> +		.name = "rpmsg_chrdev",
>> +	},
>> +};
>> +
>>  static int rpmsg_chrdev_init(void)
>>  {
>>  	int ret;
>> @@ -429,16 +465,30 @@ static int rpmsg_chrdev_init(void)
>>  	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>>  	if (IS_ERR(rpmsg_class)) {
>>  		pr_err("failed to create rpmsg class\n");
>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> -		return PTR_ERR(rpmsg_class);
>> +		ret = PTR_ERR(rpmsg_class);
>> +		goto free_region;
>> +	}
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>> +	if (ret < 0) {
>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>> +		goto free_class;
>>  	}
>>  
>>  	return 0;
>> +
>> +free_class:
>> +	class_destroy(rpmsg_class);
>> +free_region:
>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> +
>> +	return ret;
>>  }
>>  postcore_initcall(rpmsg_chrdev_init);
>>  
>>  static void rpmsg_chrdev_exit(void)
>>  {
>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>  	class_destroy(rpmsg_class);
>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>  }
>> -- 
>> 2.17.1
>>
