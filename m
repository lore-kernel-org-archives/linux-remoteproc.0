Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BCDC433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 09:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDE6461457
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 09:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbhEGJbg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 05:31:36 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60049 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230092AbhEGJbf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 05:31:35 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1479RQRR018614;
        Fri, 7 May 2021 11:30:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3uwX1REXcbSlPla25X3n3sOP3igNFKC8rYtbuE/GcDs=;
 b=NP0tXgRKP1zoRi33MDuDZ73W7GYCbNBkHUTDJDAwJ2ED+4nL+8sVQTKYoPCG+XKr2wbY
 7KBWh1dvqdCwigNdFE2AcGJ86QalnrRTCgRQhnGkhLSvPXO8P9X3fSAf9QL+xoBgP5+Q
 MJKNBVjx0RcaXLdwmpGp+h4VTiDYAZS7IRM3k+XRJTt5gSmiPILt4zjI5asKlnIC1U50
 micVK3cRER8HyRCSnc83Q5v8hBaPagX/1x1+PN6IDdhZzpOzazrnTa2zR8fptQTXi6xx
 +5eF3+qpS2UT5EDYZqpIbfI/O1hBUZjyDLpmKUiTYN7mLEtpFyMW1Cg+4wHKWELqAGHB 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38csqg2wnv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 May 2021 11:30:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 749A010002A;
        Fri,  7 May 2021 11:30:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 633D8212FA9;
        Fri,  7 May 2021 11:30:32 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 11:30:31 +0200
Subject: Re: [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
 <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
 <20210506161125.GA1804623@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <e54fb7ce-41c9-4282-22d0-3188af81dc0f@foss.st.com>
Date:   Fri, 7 May 2021 11:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210506161125.GA1804623@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-07_03:2021-05-06,2021-05-07 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 5/6/21 6:11 PM, Mathieu Poirier wrote:
> Good day,
> 
> On Wed, May 05, 2021 at 08:25:24PM +0200, Arnaud POULIQUEN wrote:
>> Hi Mathieu,
>>
>> On 5/5/21 6:41 PM, Mathieu Poirier wrote:
>>> Hi Arnaud,
>>>
>>> On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
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
>>>>
>>>>  - add missing unregister_rpmsg_driver call on module exit.
>>>> ---
>>>>  drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 52 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>>> index 5c6a7da6e4d7..9166454c1310 100644
>>>> --- a/drivers/rpmsg/rpmsg_char.c
>>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>>> @@ -18,6 +18,8 @@
>>>>  
>>>>  #include "rpmsg_char.h"
>>>>  
>>>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>>>> +
>>>>  static dev_t rpmsg_major;
>>>>  static struct class *rpmsg_class;
>>>>  
>>>> @@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>>>  }
>>>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>>>  
>>>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>> +{
>>>> +	struct rpmsg_channel_info chinfo;
>>>> +
>>>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>>>> +	chinfo.src = rpdev->src;
>>>> +	chinfo.dst = rpdev->dst;
>>>> +
>>>> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
>>>> +}
>>>> +
>>>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
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
>>>> +	.drv = {
>>>> +		.name = "rpmsg_chrdev",
>>>> +	},
>>>> +};
>>>
>>> The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
>>> name service - but is it really needed?  Up to now and aside from GLINK and SMD,
>>> there asn't been other users of it so I'm wondering if it is worth going through
>>> all this trouble.
>>
>> It is a good point.
>>
>> Just as a reminder, the need of ST and, I assume, some other companies, is to
>> have a basic/generic communication channel to control a remote processor
>> application.
>>
>> Nothing generic exists today for a virtio transport based implementation.
>> Companies have to create their own driver.
>>
>> The purpose of my work is to allow our customer to use RPMsg without developing
>> a specific driver to control remote applications.
>>
>> The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
>> inter-processor link to send and receive data. The rpmsg_tty is another one.
>>
>> Focusing on the rpmsg_chrdev:
>> We did a part of the work with the first patch set that would be in 5.13.
>> But is it simple to use it for virtio transport based platforms?
>> If we don't implement the NS announcement support in rpmsg_chrdev, using
>> rpmsg_chrdev for a user application seems rather tricky.
>> How to instantiate the communication?
> 
> Since we already have /dev/rpmsg_ctrlX user space can instantiate an 
> using that interface, which is how things are done in the GLINK/SMD world.
> 
> Wouldn't that cover the usecases you had in mind?

I have in mind that to make RPMsg easy to use, we need a generic driver with a
basic user interface to send end receive data, that supports the NS announcement:
-  remote side could instantiate it.
-  an instantiation of the device by a Linux application generates a NS
announcement sent to the remote side (for instance to create a channel for debug
trace).

On the other side, the initial work requested by Bjorn seems to be reached:
de-correlate the control part to be able to reuse it for other rpmsg devices.

I just have the feeling that we are stay in the middle of the road without the
patches 4,5 and 6 to have a first basic interface relying on RPMsg.

> 
> As you pointed out above rpmsg_chrdev should be light and simple - eliminating
> patches 4, 5 and 6 would yield that.
> 

My concern here is more about the complexity of using it by application, for
platforms that rely on virtio rpmsg transport. For instance applications need to
know the notion of local and remote RPMsg addressing.

Based on your feeling, here is my proposition for next steps:
 1- resend a version a version with only patch 1,2 3 + the patch to clean-up the
   #include in rpmsg_char
 2- switch back to the RPMsg TTY upstream.
 3- extend rpmsg_ctrl IOCTLs to allow instantiate RPMSG_TTY from Linux userland.


Then, we can come back to patches 4, 5 and 6 depending on the feedback from the
users.

Does this proposition would be OK for you?

Thanks,
Arnaud


>> The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
>> determine the services and associated remote address.
>>
>> I don't think the QCOM drivers have the same problem because they seems to
>> initiate the communication and work directly with the RPMsg endpoints ( new
>> channel creation on endpoint creation) while Virtio works with the RPMsg channel.
>>
>> By introducing the ability to instantiate rpmsg_chrdevs through the NS
>> announcement, we make this easy for applications to use.
>>
>> And without rpmsg_chrdevs instantiation, It also means that we can't create an
>> RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
>> right?
>>
>> That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
>> I'm not against leaving the rpmsg_char in this state and switching to the
>> rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
>> channels.
>>
>> We could come back on this if requested by someone else.
>>
>> Thanks,
>> Arnaud
>>
>>>
>>> As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
>>> service.  That way patches 4, 5 and 6 of this set can be dropped.
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +
>>>>  static int rpmsg_chrdev_init(void)
>>>>  {
>>>>  	int ret;
>>>> @@ -427,15 +463,30 @@ static int rpmsg_chrdev_init(void)
>>>>  	if (IS_ERR(rpmsg_class)) {
>>>>  		pr_err("failed to create rpmsg class\n");
>>>>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> -		return PTR_ERR(rpmsg_class);
>>>> +		ret = PTR_ERR(rpmsg_class);
>>>> +		goto free_region;
>>>> +	}
>>>> +
>>>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>>> +	if (ret < 0) {
>>>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>>>> +		goto free_class;
>>>>  	}
>>>>  
>>>>  	return 0;
>>>> +
>>>> +free_class:
>>>> +	class_destroy(rpmsg_class);
>>>> +free_region:
>>>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>> +
>>>> +	return ret;
>>>>  }
>>>>  postcore_initcall(rpmsg_chrdev_init);
>>>>  
>>>>  static void rpmsg_chrdev_exit(void)
>>>>  {
>>>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>>>  	class_destroy(rpmsg_class);
>>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>>  }
>>>> -- 
>>>> 2.17.1
>>>>
