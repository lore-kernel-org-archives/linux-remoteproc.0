Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55392C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 08:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D9CA60C3E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 08:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFVIXZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Jun 2021 04:23:25 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51302 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229628AbhFVIXY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Jun 2021 04:23:24 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15M8HeHk027010;
        Tue, 22 Jun 2021 10:21:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CnR8n2w+AHd3yuSiBhtbCsTOmhBW+3bts1I+Dx593Tw=;
 b=P+aqvDvwXpCPXaGgYNb4zkBFeFK/p8rd7I/8kPQUX0//OTNKbAFyRVrqFL2fgy80JLtm
 hzRcJZ2FIxVjAprQ5oWTiP7vP6polA2WTv4N503sN5TR5qOMtYmbvj36pQDybOKq6tRj
 l0bHEbx/aPjr0Ipjk9lyvrm6pDQG74ej36XN7yuvhP2ECY1WoVusFw1aBJ9LhJLU6Myz
 TF3+eeoyHEqc7UIombnMI42v+y7y77Q1/AfOhCq8otrLtBvuNpqEZKeq7TLHuxePgMdi
 LVX4aUC76V6YwtZcCSY8Hhgym3B7Gkb/4lJ5As5jknbOzTvp7XIVy2iEcHfwZrAUK4tn Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39bbk80aun-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 10:21:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81B2C10002A;
        Tue, 22 Jun 2021 10:21:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C688210F85;
        Tue, 22 Jun 2021 10:21:03 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Jun
 2021 10:21:02 +0200
Subject: Re: [PATCH 3/4] rpmsg: char: Introduce the "rpmsg-raw" channel
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <20210607173032.30133-4-arnaud.pouliquen@foss.st.com>
 <20210615200102.GE604521@p14s>
 <b55cd4e5-fb9d-a0ab-03a9-3a771898db04@foss.st.com>
 <20210617213154.GA790564@p14s>
 <d8e81ecd-c77d-9d16-7e43-218bd54a9f83@foss.st.com>
 <20210621223852.GA980846@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b293bc1c-5f80-6a4c-4d9b-57bbada01958@foss.st.com>
Date:   Tue, 22 Jun 2021 10:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621223852.GA980846@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_04:2021-06-21,2021-06-22 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 6/22/21 12:38 AM, Mathieu Poirier wrote:
> On Fri, Jun 18, 2021 at 01:35:43PM +0200, Arnaud POULIQUEN wrote:
>> Hi Mathieu,
>>
>> On 6/17/21 11:31 PM, Mathieu Poirier wrote:
>>> On Wed, Jun 16, 2021 at 02:38:26PM +0200, Arnaud POULIQUEN wrote:
>>>> Hi Mathieu,
>>>>
>>>> On 6/15/21 10:01 PM, Mathieu Poirier wrote:
>>>>> On Mon, Jun 07, 2021 at 07:30:31PM +0200, Arnaud Pouliquen wrote:
>>>>>> Allows to probe the endpoint device on a remote name service announcement,
>>>>>> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
>>>>>>
>>>>>> With this patch the /dev/rpmsgX interface can be instantiated by the remote
>>>>>> firmware.
>>>>>>
>>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>>> ---
>>>>>>  drivers/rpmsg/rpmsg_char.c | 54 ++++++++++++++++++++++++++++++++++++--
>>>>>>  1 file changed, 52 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>>>>> index 4199ac1bee10..3b850b218eb0 100644
>>>>>> --- a/drivers/rpmsg/rpmsg_char.c
>>>>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>>>>> @@ -25,6 +25,8 @@
>>>>>>  
>>>>>>  #include "rpmsg_char.h"
>>>>>>  
>>>>>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>>>>>> +
>>>>>>  static dev_t rpmsg_major;
>>>>>>  static struct class *rpmsg_class;
>>>>>>  
>>>>>> @@ -416,6 +418,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>>>>>  }
>>>>>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>>>>>  
>>>>>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>>>> +{
>>>>>> +	struct rpmsg_channel_info chinfo;
>>>>>> +
>>>>>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>>>>>> +	chinfo.src = rpdev->src;
>>>>>> +	chinfo.dst = rpdev->dst;
>>>>>> +
>>>>>> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
>>>>>
>>>>> I am a little puzzled here as to why we need different modes... Why can't we
>>>>> simply call rpmsg_chrdev_eptdev_create() and let the endpoint be created on
>>>>> open() and destroyed on release() as per the current implementation?
>>>>
>>>> The main reason is the support of the NS announcement
>>>> a NS announcement is received from the remote processor:
>>>> channel name: "rpmsg-raw"
>>>> remote address (dst address): 0x400
>>>> local address (scr address) : RPMSG_ADDR_ANY
>>>> => no default endpoint, and not local address.
>>>>
>>>> case 1) if we use legacy implementation ( no default endpoint)
>>>> => create/destroy endpoint on open/stop
>>>> - on first open: created endpoint is bound to scr address 0x406
>>>> - a first message is sent to the remote side, the address 0x406 is stored as
>>>> default channel dst address on remote side.
>>>> - on close: endpoint is closed and associated address 0x406 is free.
>>>> - another driver create an enpoint the address 0x406 is reserved for this new
>>>> endpoint.
>>>> - on new open:  scr address is set to next value 0x407
>>>> => how to inform remote processor that the address has changed?
>>>> => no reservation mechanism that ensure that you can reuse the same address
>>>>
>>>> case 2) relying on use_default_ept
>>>> => Ensure that both side have always the same addresses to communicate.
>>>
>>> I see the problem and your solution is adequate - I think the code simply needs
>>> to be moved around a little.  Here is what I suggest:
>>>
>>> 1) Create the endpoint in rpmsg_chrdev_probe(), just before calling
>>> rpmsg_chrdev_eptdev_create().  That way changes to rpmsg_eptdev_open() can be
>>> kept to a minimum.  I don't think we'll be needing
>>> __rpmsg_chrdev_eptdev_create() anymore.
>>
>> Yes i could, but this will break a concept of the rpmsg_char that creates the
>> endpoint on open, meaning that application is ready to communicate.
> 
> In my opinion creating and destorying an endpoint on open/close is something we
> want to move away from. 

Not simple to answer... As discussed a mechanism is requested by some developer
to be able on a ns announcement to inform the remote side that the user
application or the client driver is ready to communicate, the endpoint creation
could be the trigger.

That said, let's go by steps. For this patchset I will try to come back to my
first implementation where i created the endpoint on probe.

> 
>>
>> I would rather preserve this behavior.
>>
>>>
>>> 2) We can get rid of use_default_ept by taking advantage of the fact that the
>>> rpmsg_char driver does not use rpmsg_device::ept.  If we create the endpoint in
>>> rpmsg_chrdev_probe() we know that if rpdev->ept exists, we must not create
>>> or destroy the endpoint in rpmsg_eptdev_open() and rpmsg_eptdev_release().
>>>
>>> 3) Function rpmsg_eptdev_open() doesn't change much.  If rpdev->ept is NULL
>>> than
>>> an endpoint is created as the current implementation.  Otherwise we simply do:
>>>
>>>         eptdev->ept = rpdev->ept;
>>>
>>
>> In qcom_glink_create_chrdev, a rpmsg_ctrl rpdev with a default endpoint is
>> created and used as parameter of the  pmsg_ctrldev_register_device [1]
>> => rpdev->ept is not NULL.
>>
>> So the rpmsg_char has to differentiate 2 cases on rpmsg_eptdev_open:
>> - A enpdoint has to be created as requested by RPMSG_CREATE_EPT_IOCTL
>> (regardless of the rpdev->ept value)
>> - for a rpmsg device created by an NS announcement: A default endpoint has to be
>> reused (or created if rpdev->ept is null).
>>
>> so the rpdev->ept test is not relevant for decision, the use_default_ept ( or
>> another flag) is mandatory.
> 
> Yes, we need a flag.  May I suggest "fixed_ept" rather than "used_default_ept"?

"fixed_ept" could be miss-understood . It can be interpreted as an endpoint with
a fixed address (not set to RPMSG_ADDR_ANY).
What about "default_ept" or "static_ept"?

Thanks
Arnaud

> 
>>
>>
>>> 4) Make sure the teardown path works as well.  From what I can see, it should.
>>>
>>> 5) Add a __lot__ of comments.
>>>
>>> If the above all works this entire patchset should become really small.
>>
>> Thanks,
>> Arnaud
>>
>>>
>>>>
>>>>>
>>>>> I'd rather keep things simple for the refactoring and introduce new features
>>>>> later if need be.
>>>>
>>>> Yes I agree with you, but here it could become a nightmare for the remote
>>>> processor if the Linux endpoint address is not stable.
>>>>
>>>> Anyway we can consider this as a workaround waiting the extension of the NS
>>>> announcement to have a better management of the address exchange on channel
>>>> initialization.
>>>>
>>>> Thanks
>>>> Arnaud
>>>>
>>>>>
>>>>> As I said, it may be that I don't understand the usecase.
>>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>
>>>>>> +}
>>>>>> +
>>>>>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>>>>> +{
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>>>>>> +	if (ret)
>>>>>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>>>>>> +}
>>>>>> +
>>>>>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>>>>>> +	{ .name	= RPMSG_CHAR_DEVNAME },
>>>>>> +	{ },
>>>>>> +};
>>>>>> +
>>>>>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>>>>>> +	.probe = rpmsg_chrdev_probe,
>>>>>> +	.remove = rpmsg_chrdev_remove,
>>>>>> +	.id_table = rpmsg_chrdev_id_table,
>>>>>> +	.drv = {
>>>>>> +		.name = "rpmsg_chrdev",
>>>>>> +	},
>>>>>> +};
>>>>>> +
>>>>>>  static int rpmsg_chrdev_init(void)
>>>>>>  {
>>>>>>  	int ret;
>>>>>> @@ -429,16 +465,30 @@ static int rpmsg_chrdev_init(void)
>>>>>>  	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>>>>>>  	if (IS_ERR(rpmsg_class)) {
>>>>>>  		pr_err("failed to create rpmsg class\n");
>>>>>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>>> -		return PTR_ERR(rpmsg_class);
>>>>>> +		ret = PTR_ERR(rpmsg_class);
>>>>>> +		goto free_region;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>>>>> +	if (ret < 0) {
>>>>>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>>>>>> +		goto free_class;
>>>>>>  	}
>>>>>>  
>>>>>>  	return 0;
>>>>>> +
>>>>>> +free_class:
>>>>>> +	class_destroy(rpmsg_class);
>>>>>> +free_region:
>>>>>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>>> +
>>>>>> +	return ret;
>>>>>>  }
>>>>>>  postcore_initcall(rpmsg_chrdev_init);
>>>>>>  
>>>>>>  static void rpmsg_chrdev_exit(void)
>>>>>>  {
>>>>>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>>>>>  	class_destroy(rpmsg_class);
>>>>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>>>  }
>>>>>> -- 
>>>>>> 2.17.1
>>>>>>
