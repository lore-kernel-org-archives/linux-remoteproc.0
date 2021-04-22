Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EAEC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 000FA613F6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbhDVQya (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 12:54:30 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:18338 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236459AbhDVQya (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 12:54:30 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13MGq5TF018200;
        Thu, 22 Apr 2021 18:53:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EBYiS5O6HVn14SjBcZWFZ+4S7ILRBpaMYileQHLz1Zg=;
 b=GPIQ8HMySYd0FtxRdHXTo8ifY2P8v9xcpAcqUaRKOHj41eqbh6XMl681dXVnE+8l3qqS
 tZQgtE0FXgBkAI04Wl0q66oCCppnVog8+7ygy8LtFidXAkNeX6fix1JXG+Ps7ZcEd2xG
 /dX1EpFWRVXehYmkSUYnGim1rE8GDVJ3/3ofuc78kWxlk3cRlPI7G44D06Z4+Ht5Md5f
 q/onjCwhxyh6D6pGQGM/M40H6FO2zZxx9jaBpsNnenkXNUNaMsMBVQvonreOT+SbgCo0
 VpmI3zfD4vQpOXwqBvqdFoDSiXM7mC0qBk8nuPdyNHZ+aVntUzQBGISJWTUut6xZRMoM bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 382fxqj5ex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Apr 2021 18:53:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D98810002A;
        Thu, 22 Apr 2021 18:53:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DCA1249F9F;
        Thu, 22 Apr 2021 18:53:52 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 18:53:51 +0200
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
 <47015357-b006-1c32-f63f-d4fcac054d6f@foss.st.com>
 <20210422163622.GC1256950@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <dcdd8857-ceea-8059-c15d-c37d1d1fc8bb@foss.st.com>
Date:   Thu, 22 Apr 2021 18:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210422163622.GC1256950@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_11:2021-04-22,2021-04-22 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 4/22/21 6:36 PM, Mathieu Poirier wrote:
> On Thu, Apr 22, 2021 at 09:58:27AM +0200, Arnaud POULIQUEN wrote:
>> On 4/21/21 7:40 PM, Mathieu Poirier wrote:
>>> Good day Arnaud,
>>>
>>> On Tue, Apr 13, 2021 at 03:44:56PM +0200, Arnaud Pouliquen wrote:
>>>> A rpmsg char device allows to probe the endpoint device on a remote name
>>>> service announcement.
>>>>
>>>> With this patch the /dev/rpmsgX interface is created either by a user
>>>> application or by the remote firmware.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>
>>>> ---
>>>> update from V1:
>>>>  - add missing unregister_rpmsg_driver call on module exit.
>>>>
>>>> ---
>>>>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 58 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>>> index a64249d83172..4606787b7011 100644
>>>> --- a/drivers/rpmsg/rpmsg_char.c
>>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>>> @@ -26,6 +26,8 @@
>>>>  #include "rpmsg_char.h"
>>>>  #include "rpmsg_internal.h"
>>>>  
>>>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>>>> +
>>>
>>> Why not simply call it rpmsg-char?
>>
>> I would avoid to link the rpmsg name service to the Linux Kernel device.
> 
> To me that's exactly what we want to do...  Am I missing something?

A discussion started about a service layer in the OpenAMP library.
"rpmsg-char" doesn't really make sense in OpenAMP, especially for
OpenAMP<->openAMP communication.

That's why I think a generic name would be more suitable.

Regards,
Arnaud

> 
>>
>>>
>>>>  static dev_t rpmsg_major;
>>>>  
>>>>  static DEFINE_IDA(rpmsg_ept_ida);
>>>> @@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>>>  }
>>>>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>>>  
>>>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>> +{
>>>> +	struct rpmsg_channel_info chinfo;
>>>> +	struct rpmsg_eptdev *eptdev;
>>>> +
>>>> +	if (!rpdev->ept)
>>>> +		return -EINVAL;
>>>> +
>>>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>>>> +	chinfo.src = rpdev->src;
>>>> +	chinfo.dst = rpdev->dst;
>>>> +
>>>> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
>>>> +	if (IS_ERR(eptdev))
>>>> +		return PTR_ERR(eptdev);
>>>> +
>>>> +	/* Set the private field of the default endpoint to retrieve context on callback. */
>>>> +	rpdev->ept->priv = eptdev;
>>>
>>> This is already done in rpmsg_create_ept() when rpmsg_eptdev_open() is called.
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
>>>> +	if (ret)
>>>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>>>> +}
>>>> +
>>>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>>>> +	{ .name	= RPMSG_CHAR_DEVNAME },
>>>> +	{ },
>>>> +};
>>>> +
>>>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>>>> +	.probe = rpmsg_chrdev_probe,
>>>> +	.remove = rpmsg_chrdev_remove,
>>>> +	.id_table = rpmsg_chrdev_id_table,
>>>> +	.callback = rpmsg_ept_cb,
>>>
>>> Not sure why we need a callback associated to this driver when
>>> rpmsg_eptdev_open() already creates and rpmsg_endpoint.  To me the only thing
>>> having a callback provides is the association between the rpmsg_device and the
>>> rpmsg_endpoint[1] that happens in rpmsg_dev_probe().  The QC folks already do
>>> this association in their platform code[2].  Since this is not done in
>>> __rpmsg_create_ept() a check for rpdev->ept == NULL could be done in
>>> rpmsg_eptdev_open() and do the assignment there. 
>>>
>>> [1]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/rpmsg_core.c#L513  
>>> [2]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/qcom_glink_native.c#L1623
>>>
>>
>> That's a good point! When I started the redesign, I faced some issues with the
>> approach you propose. But as I can not remember the reason and because the code
>> has evolved, i need to re-think about this.
>>
> 
> Glad to see we're on the same page.  I stared at this code for a very long time,
> thinking there was some kind of bigger picture I wasn't getting.
> 
> 
>> Thanks,
>> Arnaud
>>
>>
>>>> +	.drv = {
>>>> +		.name = "rpmsg_chrdev",
>>>> +	},
>>>> +};
>>>> +
>>>>  static int rpmsg_chrdev_init(void)
>>>>  {
>>>>  	int ret;
>>>>  
>>>>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
>>>> -	if (ret < 0)
>>>> +	if (ret < 0) {
>>>>  		pr_err("rpmsg: failed to allocate char dev region\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>>> +	if (ret < 0) {
>>>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>>>> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> +	}
>>>>  
>>>>  	return ret;
>>>>  }
>>>> @@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
>>>>  
>>>>  static void rpmsg_chrdev_exit(void)
>>>>  {
>>>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>  }
>>>>  module_exit(rpmsg_chrdev_exit);
>>>> -- 
>>>> 2.17.1
>>>>
