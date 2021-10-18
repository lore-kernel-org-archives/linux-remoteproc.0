Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC32C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Oct 2021 09:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44D08610C7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Oct 2021 09:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhJRJPV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Oct 2021 05:15:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:50712 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231372AbhJRJPU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Oct 2021 05:15:20 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I866p3017986;
        Mon, 18 Oct 2021 11:13:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q05oiVZenwvMaTTs9dcXkuW+qIz1ZGdBjDkzxjUaWFs=;
 b=As7Y4FHjuqy2kZU2fG019L7ghM6kt5QA1P+myJtlL5jxqV+e+5BhEd7tv+5n6vwO3AIQ
 j9d183SjS3XEULfdd20sato6QaC69FBFWOF9POgz9rzb1cjmpiWlygB1TAq4+HrcUB8W
 cEt/c/1/j5xMvYcBmBy1Srh9OAYpmNYU1NmkyZWIkA4BegbBlRnC7X7E/XVzL5sO4JBv
 3ULZSs7EPm5b+I2hyMN9vLYCW/wwUip6V5WvR0wiMXsWzhgs0GW0pMkUfFdEGc+GPBLY
 kSonsIGYcs6xvdk8S49hG+9Iu9Xjbm1x5bUZbfgC+YKhBpZd6e3+b5iAIVM6m1iHyHyV cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3brxbm2k4b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Oct 2021 11:13:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 290B910002A;
        Mon, 18 Oct 2021 11:13:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20A8F216EF1;
        Mon, 18 Oct 2021 11:13:06 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 18 Oct
 2021 11:13:05 +0200
Subject: Re: [PATCH v5 3/4] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
 <YWDVwArEz5Yub3GJ@ripper> <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
 <YWpZMwgWqcPMvL5q@yoga>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ffb110dc-bc3b-dbc2-679f-de2416f7b90f@foss.st.com>
Date:   Mon, 18 Oct 2021 11:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWpZMwgWqcPMvL5q@yoga>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/16/21 6:46 AM, Bjorn Andersson wrote:
> On Mon 11 Oct 05:46 CDT 2021, Arnaud POULIQUEN wrote:
> 
>>
>>
>> On 10/9/21 1:35 AM, Bjorn Andersson wrote:
>>> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
>>>
>>>> Create the rpmsg_ctrl.c module and move the code related to the
>>>> rpmsg_ctrldev device in this new module.
>>>>
>>>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
>>>> kconfig file.
>>>>
>>>
>>> As I said in the cover letter, the only reason I can see for doing this
>>> refactoring is in relation to the introduction of
>>> RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
>>> that patch, together with a good motivation why there's merit to
>>> creating yet another kernel module (and by bind/unbind can't be used).
>>>
>>> Perhaps I'm just missing some good usecase related to this?
>>
>>
>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>> ---
>>>>  drivers/rpmsg/Kconfig      |   9 ++
>>>>  drivers/rpmsg/Makefile     |   1 +
>>>>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
>>>>  drivers/rpmsg/rpmsg_char.h |   2 +
>>>>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
>>>>  5 files changed, 229 insertions(+), 168 deletions(-)
>>>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>>>
>>> [..]
>>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>> [..]
>>>> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>> -{
>>> [..]
>>>> -	dev = &ctrldev->dev;
>>>> -	device_initialize(dev);
>>>> -	dev->parent = &rpdev->dev;
>>>> -	dev->class = rpmsg_class;
>>> [..]
>>>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>>> [..]
>>>> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>>>> +{
>>> [..]
>>>> +	dev = &ctrldev->dev;
>>>> +	device_initialize(dev);
>>>> +	dev->parent = &rpdev->dev;
>>>
>>> You lost the assignment of dev->class here, which breaks the udev rules
>>> we use to invoke rpmsgexport to create endpoints and it causes udevadm
>>> to complain that rpmsg_ctrlN doesn't have a "subsystem".
>>
>> We discussed this point with Mathieu, as a first step i kept the class, but that
>> generated another dependency with the rpmsg_char device while information was
>> available on the rpmsg bus. The char device and ctrl device should share the
>> same class. As rpmsg_ctrl is created first it would have to create the class,and
>> provide an API to rpmsg char
>>
> 
> Perhaps if this is considered a common piece shared between multiple
> rpmsg modules we can create such class in the rpmsg "core" itself?

Yes that seems a good alternative

> 
>> Please could you details what does means "rpmsg_ctrlN doesn't have a
>> "subsystem"." What exactly the udev is looking for? could it base it check on
>> the /dev/rpmsg_ctrl0 or /sys/bus/rpmsg/devices/...?
>>
> 
> If I read the uevent messages correctly they seem to contain a SUBSYTEM=
> property when the class is provided. But I'm not sure about the reasons
> for that.

If it part of the udev requirement, i suppose that it is mandatory, and in this
case, declare the class in the core make sense.

I will send a new patchset that will squash all the remaining patches, taking
into account your comment.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Thanks,
>> Arnaud
>>
>>>
>>> Regards,
>>> Bjorn
>>>
