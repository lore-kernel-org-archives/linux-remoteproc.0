Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C39C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 17:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFA6D61052
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 17:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhKBROK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 13:14:10 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:45008 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229689AbhKBROD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 13:14:03 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2EJUeG011773;
        Tue, 2 Nov 2021 18:11:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jFbWexfVVsZE7MzAbDgySXVklqbP8iiroGc1J7oWwmQ=;
 b=lsx/4bc/GxkdTj3DB+PeRaUmncpVUwzcqZKITD3aJMI4U6D9OzZPu0cdPByz7uh3oWy9
 odEuRi7FTN9CkgD3t7i4VswSk3/4yIsuT5pyScb8FP0WWoq0G9zUHLt26ZdxXojMT53n
 Vhs5WliNbwchJ82JX/0QqQc4H2HKKvmj67NhvP8bZ3nnlhcPuhdsFsSuzmn9ZtrFFOIU
 CDd8zGsl1wl0LaN2/SFb6VF0eNI3sHat9FfjQQH9XFSgsLzP9DcfJlnHR+oiJ/+XlT7F
 TlqC6b1TW5yA3nkIjVmmRUvW4jaDM14eVXW5ehxsQwqwQgJo5l4jEXx2r640eOqtrXOF 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c2jfj6s7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 18:11:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1466B10002A;
        Tue,  2 Nov 2021 18:11:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 094DF220C6D;
        Tue,  2 Nov 2021 18:11:13 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 18:11:12 +0100
Subject: Re: [PATCH v6 02/10] rpmsg: create the rpmsg class in core instead of
 in rpmsg char
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
 <YYAcYLxEmbwJShg7@builder.lan>
 <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com> <YYFpit0SixojReo+@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <16853c3d-0b23-4d59-9c33-c7c99da4b9a1@foss.st.com>
Date:   Tue, 2 Nov 2021 18:11:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYFpit0SixojReo+@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/2/21 5:38 PM, Bjorn Andersson wrote:
> On Tue 02 Nov 08:23 PDT 2021, Arnaud POULIQUEN wrote:
> 
>>
>>
>> On 11/1/21 5:57 PM, Bjorn Andersson wrote:
>>> On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
>>>
>>>> Migrate the creation of the rpmsg class from the rpmsg_char
>>>> to the core that the class is usable by all rpmsg services.
>>>>
>>>> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>>  drivers/rpmsg/rpmsg_char.c | 14 ++------------
>>>>  drivers/rpmsg/rpmsg_core.c | 26 ++++++++++++++++++++++++--
>>>>  include/linux/rpmsg.h      | 10 ++++++++++
>>>>  3 files changed, 36 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>>> index 941c5c54dd72..327ed739a3a7 100644
>>>> --- a/drivers/rpmsg/rpmsg_char.c
>>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>>> @@ -28,7 +28,6 @@
>>>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>>>>  
>>>>  static dev_t rpmsg_major;
>>>> -static struct class *rpmsg_class;
>>>>  
>>>>  static DEFINE_IDA(rpmsg_ctrl_ida);
>>>>  static DEFINE_IDA(rpmsg_ept_ida);
>>>> @@ -362,7 +361,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>>>  	init_waitqueue_head(&eptdev->readq);
>>>>  
>>>>  	device_initialize(dev);
>>>> -	dev->class = rpmsg_class;
>>>> +	dev->class = rpmsg_get_class();
>>>>  	dev->parent = parent;
>>>>  	dev->groups = rpmsg_eptdev_groups;
>>>>  	dev_set_drvdata(dev, eptdev);
>>>> @@ -482,7 +481,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>>  	dev = &ctrldev->dev;
>>>>  	device_initialize(dev);
>>>>  	dev->parent = &rpdev->dev;
>>>> -	dev->class = rpmsg_class;
>>>> +	dev->class = rpmsg_get_class();
>>>>  
>>>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>>>  	ctrldev->cdev.owner = THIS_MODULE;
>>>> @@ -558,17 +557,9 @@ static int rpmsg_chrdev_init(void)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>>>> -	if (IS_ERR(rpmsg_class)) {
>>>> -		pr_err("failed to create rpmsg class\n");
>>>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> -		return PTR_ERR(rpmsg_class);
>>>> -	}
>>>> -
>>>>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>>>  	if (ret < 0) {
>>>>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
>>>> -		class_destroy(rpmsg_class);
>>>>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>  	}
>>>>  
>>>> @@ -579,7 +570,6 @@ postcore_initcall(rpmsg_chrdev_init);
>>>>  static void rpmsg_chrdev_exit(void)
>>>>  {
>>>>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>>> -	class_destroy(rpmsg_class);
>>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>  }
>>>>  module_exit(rpmsg_chrdev_exit);
>>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>>> index 9151836190ce..53162038254d 100644
>>>> --- a/drivers/rpmsg/rpmsg_core.c
>>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>>> @@ -20,6 +20,8 @@
>>>>  
>>>>  #include "rpmsg_internal.h"
>>>>  
>>>> +static struct class *rpmsg_class;
>>>> +
>>>>  /**
>>>>   * rpmsg_create_channel() - create a new rpmsg channel
>>>>   * using its name and address info.
>>>> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>>>  }
>>>>  EXPORT_SYMBOL(rpmsg_poll);
>>>>  
>>>> +/**
>>>> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
>>>> + *
>>>> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
>>>> + *
>>>> + * Returns the struct class pointer
>>>> + */
>>>> +struct class *rpmsg_get_class(void)
>>>
>>> What value does this helper function add? Can't we just expose
>>> rpmsg_class directly?
>>
>> look to me cleaner to not expose directly the rpmsg_class in rpmsg.h as this
>> variable is read only for rpmsg services.
>>
> 
> The pointer is read only, but the object isn't. So I think it's cleaner
> to just share the pointer in the first place.
> 
> But that said, looking at this a little bit more, I don't think there's
> any guarantee that class_create() has been executed before
> rpmsg_ctrl_probe() is being invoked.

class_create is called in in the rpmsg_init (rpmsg_core.c). as RPMSG_CTRL and
RPMSG_CHAR depend on RPMSG config this use case should not occurs, or did I miss
something?

> 
>>>
>>>> +{
>>>> +	return rpmsg_class;
>>>> +}
>>>> +EXPORT_SYMBOL(rpmsg_get_class);
> [..]
>>>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>>>
>>> Isn't this just going to be used by rpmsg_char and rpmsg_ctrl? Do we
>>> really need to expose it in the client-facing API?
>>
>> I based this dev on hypothesis that the class could be used by some other rpmsg
>> clients. But it is not mandatory. It can be extended later, on need.
>>
> 
> That's a good hypothesis, it might be useful in other places as well.
> But I think it's best to keep it local for now and make an explicit
> decision about opening up when that need comes.
> 
>> What would you propose as an alternative to this API?
>>
>> I can see 2 alternatives:
>> - Define the rpmsg_class in rpmsg_internal.h
>>   In current patchset rpmsg_char.c does not include the rpmsg_internal.h.
>>   I'm not sure if this include makes sense for an rpmsg service driver.
>>
> 
> rpmsg_ctrl and rpmsg_char are more tightly coupled to rpmsg than typical
> rpmsg drivers, so I think it's better to include rpmsg_internal.h than to
> open up the API to the clients.

So i will declare the variable in rpmsg_internal.h and remove the
rpmsg_get_class to use directly the variable.

Thanks,
Arnaud

> 
> Thanks,
> Bjorn
> 
>> - Use "extern struct class *rpmsg_class; " in rpmsg_char and rpmsg_ctrl modules
>>
>> Regards,
>> Arnaud
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> index a8dcf8a9ae88..6fe51549d931 100644
>>>> --- a/include/linux/rpmsg.h
>>>> +++ b/include/linux/rpmsg.h
>>>> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>>>  			poll_table *wait);
>>>>  
>>>> +struct class *rpmsg_get_class(void);
>>>> +
>>>>  #else
>>>>  
>>>>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
>>>> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static inline struct class *rpmsg_get_class(void)
>>>> +{
>>>> +	/* This shouldn't be possible */
>>>> +	WARN_ON(1);
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>>>>  
>>>>  /* use a macro to avoid include chaining to get THIS_MODULE */
>>>> -- 
>>>> 2.17.1
>>>>
