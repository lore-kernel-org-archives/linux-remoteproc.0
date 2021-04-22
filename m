Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4B6C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 07:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6144D61457
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 07:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhDVH7G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 03:59:06 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36325 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229487AbhDVH7G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 03:59:06 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13M7vPHl023905;
        Thu, 22 Apr 2021 09:58:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5nCw7851zINOTKX8lPZeKQCd1aIjzhMIwKVs4NjEjx0=;
 b=Trt2au3lZI8bOVWZkTn4Bu8/Jwg6KiLS+zG/kQngwrSO/nF9Vm/GvLKGdasGpkk2HuXK
 cignw0wd+tl/0AvByQydPg5kjzvqOb8fWXJxzEBewhBE4fQuODzk2XfN4DyqceW9uxiC
 rCwbjyDkxeBKjS8MGjjtqX//+jqZaCRHudY5ixQ8n2efE9Xl+FVq6ayOl42VN92kZeO0
 3lmsQmzBbwOyxG+dFP25oLuaS0BwI2q6GWFHo6OjFcD0oGKrH+3f1XtK7O0woU4vSJV1
 MRAPsFhay/P4n9pDI/k9d1LIt+BVlfk/Q8vZkmgKYv90gi+2yhVvUla1iwn9uyTptaip oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 382fftetqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Apr 2021 09:58:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F70410002A;
        Thu, 22 Apr 2021 09:58:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 417FE221F75;
        Thu, 22 Apr 2021 09:58:29 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 09:58:28 +0200
Subject: Re: [PATCH v2 5/7] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
 <20210421174053.GA1223348@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <47015357-b006-1c32-f63f-d4fcac054d6f@foss.st.com>
Date:   Thu, 22 Apr 2021 09:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421174053.GA1223348@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_01:2021-04-21,2021-04-21 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4/21/21 7:40 PM, Mathieu Poirier wrote:
> Good day Arnaud,
> 
> On Tue, Apr 13, 2021 at 03:44:56PM +0200, Arnaud Pouliquen wrote:
>> A rpmsg char device allows to probe the endpoint device on a remote name
>> service announcement.
>>
>> With this patch the /dev/rpmsgX interface is created either by a user
>> application or by the remote firmware.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>
>> ---
>> update from V1:
>>  - add missing unregister_rpmsg_driver call on module exit.
>>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index a64249d83172..4606787b7011 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -26,6 +26,8 @@
>>  #include "rpmsg_char.h"
>>  #include "rpmsg_internal.h"
>>  
>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>> +
> 
> Why not simply call it rpmsg-char?

I would avoid to link the rpmsg name service to the Linux Kernel device.

> 
>>  static dev_t rpmsg_major;
>>  
>>  static DEFINE_IDA(rpmsg_ept_ida);
>> @@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>  
>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_channel_info chinfo;
>> +	struct rpmsg_eptdev *eptdev;
>> +
>> +	if (!rpdev->ept)
>> +		return -EINVAL;
>> +
>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>> +	chinfo.src = rpdev->src;
>> +	chinfo.dst = rpdev->dst;
>> +
>> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
>> +	if (IS_ERR(eptdev))
>> +		return PTR_ERR(eptdev);
>> +
>> +	/* Set the private field of the default endpoint to retrieve context on callback. */
>> +	rpdev->ept->priv = eptdev;
> 
> This is already done in rpmsg_create_ept() when rpmsg_eptdev_open() is called.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>> +{
>> +	int ret;
>> +
>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
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
>> +	.callback = rpmsg_ept_cb,
> 
> Not sure why we need a callback associated to this driver when
> rpmsg_eptdev_open() already creates and rpmsg_endpoint.  To me the only thing
> having a callback provides is the association between the rpmsg_device and the
> rpmsg_endpoint[1] that happens in rpmsg_dev_probe().  The QC folks already do
> this association in their platform code[2].  Since this is not done in
> __rpmsg_create_ept() a check for rpdev->ept == NULL could be done in
> rpmsg_eptdev_open() and do the assignment there. 
> 
> [1]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/rpmsg_core.c#L513  
> [2]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/qcom_glink_native.c#L1623
> 

That's a good point! When I started the redesign, I faced some issues with the
approach you propose. But as I can not remember the reason and because the code
has evolved, i need to re-think about this.

Thanks,
Arnaud


>> +	.drv = {
>> +		.name = "rpmsg_chrdev",
>> +	},
>> +};
>> +
>>  static int rpmsg_chrdev_init(void)
>>  {
>>  	int ret;
>>  
>>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
>> -	if (ret < 0)
>> +	if (ret < 0) {
>>  		pr_err("rpmsg: failed to allocate char dev region\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>> +	if (ret < 0) {
>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> +	}
>>  
>>  	return ret;
>>  }
>> @@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
>>  
>>  static void rpmsg_chrdev_exit(void)
>>  {
>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>  }
>>  module_exit(rpmsg_chrdev_exit);
>> -- 
>> 2.17.1
>>
