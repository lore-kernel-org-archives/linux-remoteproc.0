Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE71C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 17:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E4F060249
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 17:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbhHIRBK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 13:01:10 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8246 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232979AbhHIRBI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 13:01:08 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 179Gwqw1022833;
        Mon, 9 Aug 2021 19:00:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=02jCAhpFUnn47oyWIEk4dg1QdVAKJIUUqwcrrITXrNY=;
 b=txF/eMLc/FuVstdNIQlhpHS8hHVdPA0lSUP3lryXj+hnc28KX2R9OpRi2XOpU34KKKxA
 gAYs7xQmlwleNPEE6PVneZgU4UcUnUnU7HXpbPs7bjT8+/ZosMYHkhqNyE2mOnGTXFNr
 br2ZLZHge/gsR/8khg5yIpaF9eU4hTzsUGOyatDQbE0woTtqEc/jVq/MT9bzwB/yteU0
 JqrAs4GjOmB6pTuQz5XtfjX8bCCC5+XRBphG41qGG6sTMYKKBxw+RMzyE00JzywSjJmA
 CF/dU9f6GnfIJ+4XFcMN8i/83UPSNoiP5HUl/WeTtesO4FmAzbBZW7/bO77q38zTP4Z+ Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3aax1kk1r1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Aug 2021 19:00:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC5D910002A;
        Mon,  9 Aug 2021 19:00:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1920B2128CE;
        Mon,  9 Aug 2021 19:00:28 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 9 Aug
 2021 19:00:27 +0200
Subject: Re: [PATCH v2 1/5] remoteproc: Add support for detach-only during
 shutdown
To:     Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210723220248.6554-1-s-anna@ti.com>
 <20210723220248.6554-2-s-anna@ti.com> <20210802184431.GC3051951@p14s>
 <cd399fef-6db7-72eb-933f-7454a043ed14@ti.com> <20210803162311.GB3091608@p14s>
 <7e264184-60ea-a035-7bd3-1fc2c76a160d@ti.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <1c526c7c-40cd-90b5-c5b3-0e130f54bc1e@foss.st.com>
Date:   Mon, 9 Aug 2021 19:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7e264184-60ea-a035-7bd3-1fc2c76a160d@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-09_06:2021-08-06,2021-08-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Suman, Mathieu,


On 8/4/21 9:17 PM, Suman Anna wrote:
> Hi Mathieu,
> 
> On 8/3/21 11:23 AM, Mathieu Poirier wrote:
>> Good morning,
>>
>> On Mon, Aug 02, 2021 at 06:21:38PM -0500, Suman Anna wrote:
>>> Hi Mathieu,
>>>
>>> On 8/2/21 1:44 PM, Mathieu Poirier wrote:
>>>> On Fri, Jul 23, 2021 at 05:02:44PM -0500, Suman Anna wrote:
>>>>> The remoteproc core has support for both stopping and detaching a
>>>>> remote processor that was attached to previously, through both the
>>>>> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
>>>>> unconditionally only uses the stop functionality at present. This
>>>>> may not be the default desired functionality for all the remoteproc
>>>>> platform drivers.
>>>>>
>>>>> Enhance the remoteproc core logic to key off the presence of the
>>>>> .stop() ops and allow the individual remoteproc drivers to continue
>>>>> to use the standard rproc_add() and rproc_del() API. This allows
>>>>> the remoteproc drivers to only do detach if supported when the driver
>>>>> is uninstalled, and the remote processor continues to run undisturbed
>>>>> even after the driver removal.
>>>>>
>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>> ---
>>>>> v2: Addressed various review comments from v1
>>>>>  - Reworked the logic to not use remoteproc detach_on_shutdown and
>>>>>    rely only on rproc callback ops
>>>>>  - Updated the last para of the patch description
>>>>> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-3-s-anna@ti.com/
>>>>>
>>>>>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
>>>>>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
>>>>>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>>>>>  3 files changed, 17 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
>>>>> index 4ad98b0b8caa..16c932beed88 100644
>>>>> --- a/drivers/remoteproc/remoteproc_cdev.c
>>>>> +++ b/drivers/remoteproc/remoteproc_cdev.c
>>>>> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>>>>>  		    rproc->state != RPROC_ATTACHED)
>>>>>  			return -EINVAL;
>>>>>  
>>>>> +		if (rproc->state == RPROC_ATTACHED &&
>>>>
>>>> This is already checked just above.
>>>>
>>>>> +		    !rproc->ops->stop) {
>>>
>>> Well, this is checking for both conditions, and not just the stop ops
>>> independently. We expect to have .stop() defined normally for both regular
>>> remoteproc mode and attached mode where you want to stop (and not detach), but
>>> as you can see, I am supporting only detach and so will not have .stop() defined
>>>  with RPROC_ATTACHED.
>>>
>>>>
>>>> This is checked in rproc_stop() where -EINVAL is returned if ops::stop has not
>>>> been provided.
>>>
>>> rproc_shutdown() actually doesn't return any status, so all its internal
>>> checking gets ignored and a success is returned today.
>>>
>>
>> That is correct, and I have suggested to add a return value in my previous
>> review.
> 
> Yeah ok. I can add a separate patch fixing that, and couple of these checks then
> become redundant.
> 
>>
>>>>
>>>>> +			dev_err(&rproc->dev,
>>>>> +				"stop not supported for this rproc, use detach\n");
>>>>
>>>> The standard error message from the shell should be enough here, the same way it
>>>> is enough when the "start" and "stop" scenarios fail.
>>>
>>> Thought this was a bit more informative, but sure this trace can be dropped.
>>>
>>>>
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +
>>>>>  		rproc_shutdown(rproc);
>>>>>  	} else if (!strncmp(cmd, "detach", len)) {
>>>>>  		if (rproc->state != RPROC_ATTACHED)
>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>> index 7de5905d276a..ab9e52180b04 100644
>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>> @@ -2075,7 +2075,10 @@ void rproc_shutdown(struct rproc *rproc)
>>>>>  	if (!atomic_dec_and_test(&rproc->power))
>>>>>  		goto out;
>>>>>  
>>>>> -	ret = rproc_stop(rproc, false);
>>>>> +	if (rproc->state == RPROC_ATTACHED && !rproc->ops->stop)
>>>>> +		ret = __rproc_detach(rproc);
>>>>> +	else
>>>>> +		ret = rproc_stop(rproc, false);
>>>>
>>>> As I indicated in my last review I think rproc_shutdown() and rproc_del() should
>>>> be decoupled and the right call made in the platform drivers based on the state
>>>> of the remote processor.  

Agree With Mathieu. More than that it looks to me that the stop ops is not
optional and mandatory to implement the remoteproc shutdown. It should be the
role of the platform driver to decide if a stop is a detachment.

This behavior may also depend on the project for multi purpose platforms. In
this case DT property might be more appropriate than a null stop ops to
determine the behavior.

>>>
>>> We have various remoteproc API provided in pairs - rproc_alloc()/rproc_free(),
>>> rproc_add()/rproc_del(), rproc_boot()/rproc_shutdown() and
>>> rproc_attach()/rproc_detach(). The drivers are configuring conditions for
>>> auto-boot and RPROC_DETACHED. The reason they are coupled is primarily because
>>> of the auto-boot done during rproc_add(). And we handle the RPROC_DETACHED case
>>> just as well in rproc_boot().
>>>
>>
>> The difference with rproc_boot() is that we are checking only the state of the
>> remoteproc, everything else related to the remote processor operations is
>> seamlessly handles by the state machine.  It is also tied to the
>> rproc_trigger_auto_boot() mechanic - decoupling that would be messy without
>> bringing any advantages other than keeping with a semantic symmetry.
> 
> Most of this is actually tied to auto_boot if you think about it, not just the
> rproc state. If we have auto_boot set to false, then rproc_add() would not do
> anything, and the decision to start or attach can either be done through the
> sysfs/cdev or a kernel remoteproc or some consumer driver. And the state machine
> is getting influenced by this flag. auto-boot is a very useful feature.
> 
> You are asking is to do things differently between the regular start/stop case
> and attach/detach case ignoring the auto-boot. The semantic symmetry actually
> makes it easier to follow the state machine given that there are some internal
> reference counts as well.
> 
> Note that we also have the devres API, and rproc_alloc()/rproc_free() and
> rproc_add()/rproc_del() form the main remoteproc subsystem API. The drivers
> would end up using matching calls if we don't have auto_boot.
> 
>>
>>> While what you have suggested works, but I am not quite convinced on this
>>> asymmetric usage, and why this state-machine logic should be split between the
>>> core and remoteproc drivers differently between attach and detach. To me,
>>> calling rproc_detach() in remoteproc drivers would have made sense only if they
>>> are also calling rproc_attach().

In current implementation to be able to detach a remote processor we need to be
in RPROC_ATTACHED state. If I well remember the reason is the backup of the
resource table to reinitialize it on detach.should we improve this?

We could also consider the attach and detach as 2 separate features:
- attach is used for a pre loaded firmware (e.g early action use case waiting
Linux boot)
   => can be stopped as a loaded firmware.

- boot a remote firmware loaded from sysfs but detach it on Linux shutdown to
allow it to property stop it own activities (e.g Linux independent reboot).

>>
>> As pointed out above I see rproc_boot() as a special case but if that really
>> concerns you I'm open to consider patches that will take rproc_attach() out of
>> rproc_boot(). 
>>
> 
> We are talking about a bigger behavioral change to remoteproc core here. So I
> would definitely want to hear from others as well on this before we spend any
> time reworking code.

I'm not sure to understand what would be behind this rework. What is exactly the
issue on the rproc_boot? having a semantic symmetry? In this case do you expect
that the user application determines the current state of the remote processor
and "start" it or "attach" it, depending on state? Or does it be implemented in
rproc_sysfs and rpcroc_cdev (and few platform drivers).

Look to me that take rproc_attach() out of rproc_boot() could break or
complexify some legacy APIs.

Regards,
Arnaud

> 
> Meanwhile, how do I take this series forward? One option I can probably do is
> turn off auto-boot for early-boot case in my drivers and do the matching
> attach/detach.
> 
> regards
> Suman
> 
>>>
>>>
>>> Conditions such as the above make the core code
>>>> brittle, difficult to understand and tedious to maintain.
>>>
>>> The logic I have added actually makes rproc_shutdown behavior to be on par with
>>> the rproc_boot().
>>>
>>> regards
>>> Suman
>>>
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>>  	if (ret) {
>>>>>  		atomic_inc(&rproc->power);
>>>>>  		goto out;
>>>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
>>>>> index ea8b89f97d7b..133e766f38d4 100644
>>>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>>>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>>>> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
>>>>>  		    rproc->state != RPROC_ATTACHED)
>>>>>  			return -EINVAL;
>>>>>  
>>>>> +		if (rproc->state == RPROC_ATTACHED &&
>>>>> +		    !rproc->ops->stop) {
>>>>> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +
>>>>>  		rproc_shutdown(rproc);
>>>>>  	} else if (sysfs_streq(buf, "detach")) {
>>>>>  		if (rproc->state != RPROC_ATTACHED)
>>>>> -- 
>>>>> 2.32.0
>>>>>
>>>
> 
