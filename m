Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABCDC2BBD4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 08:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A479023DE7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 08:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388382AbgLJIwD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 03:52:03 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:43189 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388364AbgLJIwA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 03:52:00 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BA8m2j0007298;
        Thu, 10 Dec 2020 09:51:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=B/3tuzjIHOPWbgHJOdZTMpj3MXPOpjz00NZem2Gkp2g=;
 b=kZKfnHGsNmMCKrGj94POBE/rm7sB8e/rK5DHn6zMhPD3j2DetoT1oH5FFmgH+H99RvKO
 HfrF9yd4mRmjGG86n+Ev1oA8PObZqK1M0prFHKQpgYVLfxr9CDkIGkP9TaLaeFypft+c
 qd17m2F7ec2ALGdGZ4G+alHQr8sO378HJrnMkmWHNQ1dxXLNoUMuBe3YgePv2O6Mql8z
 b8yOAYSidRdgn4grG/7phNWSidbzTyLqo8gBHZKoIxU6/OyrIuAMxDfkWk61CMG/6hYu
 sJU8h8UXrBCzM5rVQZeqEX7JyhkgZY+BiJeDRl9cvU1ZHnLjbgkpsaajOioqYFWoYLt/ jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35agq69v9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 09:51:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 189A310002A;
        Thu, 10 Dec 2020 09:51:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE04922B71E;
        Thu, 10 Dec 2020 09:51:07 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Dec
 2020 09:51:07 +0100
Subject: Re: [PATCH v3 09/15] remoteproc: Introduce function rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-10-mathieu.poirier@linaro.org>
 <0e705760-b69a-d872-9770-c03dde85ab1c@st.com>
 <20201209005311.GB1601690@xps15>
 <cb959e29-65eb-ae89-0c53-cdbc4c7bc77a@st.com>
 <20201209211808.GA1814981@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <9e5a9101-485d-3e1c-d959-92cb26115ba4@st.com>
Date:   Thu, 10 Dec 2020 09:51:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209211808.GA1814981@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-10_02:2020-12-09,2020-12-10 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 12/9/20 10:18 PM, Mathieu Poirier wrote:
> On Wed, Dec 09, 2020 at 09:45:32AM +0100, Arnaud POULIQUEN wrote:
>>
>>
>> On 12/9/20 1:53 AM, Mathieu Poirier wrote:
>>> On Tue, Dec 08, 2020 at 07:35:18PM +0100, Arnaud POULIQUEN wrote:
>>>> Hi Mathieu,
>>>>
>>>>
>>>> On 11/26/20 10:06 PM, Mathieu Poirier wrote:
>>>>> Introduce function rproc_detach() to enable the remoteproc
>>>>> core to release the resources associated with a remote processor
>>>>> without stopping its operation.
>>>>>
>>>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>>>>> ---
>>>>>  drivers/remoteproc/remoteproc_core.c | 65 +++++++++++++++++++++++++++-
>>>>>  include/linux/remoteproc.h           |  1 +
>>>>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>> index 928b3f975798..f5adf05762e9 100644
>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>> @@ -1667,7 +1667,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>>>>  /*
>>>>>   * __rproc_detach(): Does the opposite of rproc_attach()
>>>>>   */
>>>>> -static int __maybe_unused __rproc_detach(struct rproc *rproc)
>>>>> +static int __rproc_detach(struct rproc *rproc)
>>>>>  {
>>>>>  	struct device *dev = &rproc->dev;
>>>>>  	int ret;
>>>>> @@ -1910,6 +1910,69 @@ void rproc_shutdown(struct rproc *rproc)
>>>>>  }
>>>>>  EXPORT_SYMBOL(rproc_shutdown);
>>>>>  
>>>>> +/**
>>>>> + * rproc_detach() - Detach the remote processor from the
>>>>> + * remoteproc core
>>>>> + *
>>>>> + * @rproc: the remote processor
>>>>> + *
>>>>> + * Detach a remote processor (previously attached to with rproc_actuate()).
>>>>> + *
>>>>> + * In case @rproc is still being used by an additional user(s), then
>>>>> + * this function will just decrement the power refcount and exit,
>>>>> + * without disconnecting the device.
>>>>> + *
>>>>> + * Function rproc_detach() calls __rproc_detach() in order to let a remote
>>>>> + * processor know that services provided by the application processor are
>>>>> + * no longer available.  From there it should be possible to remove the
>>>>> + * platform driver and even power cycle the application processor (if the HW
>>>>> + * supports it) without needing to switch off the remote processor.
>>>>> + */
>>>>> +int rproc_detach(struct rproc *rproc)
>>>>> +{
>>>>> +	struct device *dev = &rproc->dev;
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = mutex_lock_interruptible(&rproc->lock);
>>>>> +	if (ret) {
>>>>> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
>>>>> +		ret = -EPERM;
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>>>> +	/* if the remote proc is still needed, bail out */
>>>>> +	if (!atomic_dec_and_test(&rproc->power)) {
>>>>> +		ret = -EBUSY;
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>>>> +	ret = __rproc_detach(rproc);
>>>>> +	if (ret) {
>>>>> +		atomic_inc(&rproc->power);
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>>>> +	/* clean up all acquired resources */
>>>>> +	rproc_resource_cleanup(rproc);
>>>>
>>>> I started to test the series, I found 2 problems testing in STM32P1 board.
>>>>
>>>> 1) the resource_table pointer is unmapped if the firmware has been booted by the
>>>> Linux, generating a crash in rproc_free_vring.
>>>> I attached a fix at the end of the mail.
>>>>
>>>
>>> I have reproduced the condition on my side and confirm that your solution is
>>> correct.  See below for a minor comment. 
>>>
>>>> 2) After the detach, the rproc state is "detached"
>>>> but it is no longer possible to re-attach to it correctly.
>>>> Neither if the firmware is standalone, nor if it has been booted
>>>> by the Linux.
>>>>
>>>
>>> Did you update your FW image?  If so, I need to run the same one.
>>>
>>>> I did not investigate, but the issue is probably linked to the resource
>>>> table address which is set to NULL.
>>>>
>>>> So we either have to fix the problem in order to attach or forbid the transition.
>>>>
>>>>
>>>> Regards,
>>>> Arnaud
>>>>
>>>>> +
>>>>> +	rproc_disable_iommu(rproc);
>>>>> +
>>>>> +	/*
>>>>> +	 * Set the remote processor's table pointer to NULL.  Since mapping
>>>>> +	 * of the resource table to a virtual address is done in the platform
>>>>> +	 * driver, unmapping should also be done there.
>>>>> +	 */
>>>>> +	rproc->table_ptr = NULL;
>>>>> +out:
>>>>> +	mutex_unlock(&rproc->lock);
>>>>> +	return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(rproc_detach);
>>>>> +
>>>>>  /**
>>>>>   * rproc_get_by_phandle() - find a remote processor by phandle
>>>>>   * @phandle: phandle to the rproc
>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>> index da15b77583d3..329c1c071dcf 100644
>>>>> --- a/include/linux/remoteproc.h
>>>>> +++ b/include/linux/remoteproc.h
>>>>> @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>>>>>  
>>>>>  int rproc_boot(struct rproc *rproc);
>>>>>  void rproc_shutdown(struct rproc *rproc);
>>>>> +int rproc_detach(struct rproc *rproc);
>>>>>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>>>>>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>>>>>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>>>>>
>>>>
>>>> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
>>>> Date: Tue, 8 Dec 2020 18:54:51 +0100
>>>> Subject: [PATCH] remoteproc: core: fix detach for unmapped table_ptr
>>>>
>>>> If the firmware has been loaded and started by the kernel, the
>>>> resource table has probably been mapped by the carveout allocation
>>>> (see rproc_elf_find_loaded_rsc_table).
>>>> In this case the memory can have been unmapped before the vrings are free.
>>>> The result is a crash that occurs in rproc_free_vring while try to use the
>>>> unmapped pointer.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c | 17 ++++++++++++++---
>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>>> b/drivers/remoteproc/remoteproc_core.c
>>>> index 2b0a52fb3398..3508ffba4a2a 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1964,6 +1964,13 @@ int rproc_detach(struct rproc *rproc)
>>>>  		goto out;
>>>>  	}
>>>>
>>>> +	/*
>>>> +	 * Prevent case that the installed resource table is no longer
>>>> +	 * accessible (e.g. memory unmapped), use the cache if available
>>>> +	 */
>>>> +	if (rproc->cached_table)
>>>> +		rproc->table_ptr = rproc->cached_table;
>>>
>>> I don't think there is an explicit need to check ->cached_table.  If the remote
>>> processor has been started by the remoteproc core it is valid anyway.  And below
>>> kfree() is called invariably. 
>>
>> The condition is needed, the  rproc->cached_table is null if the firmware as
>> been preloaded and the Linux remote proc just attaches to it.
>> The cached is used only when Linux loads the firmware, as the resource table is
>> extracted from the elf file to parse resource before the load of the firmware.
> 
> I have taken another look at this and you are correct. The if() condition is
> needed because ->table_ptr is set only once when the platform driver is
> probed.  See further down...
> 
>>
>>>
>>> So that problem is fixed.  Let me know about your FW image and we'll pick it up
>>> from there.
>>
>> I use the following example available on the stm32mp1 image:
>> /usr/local/Cube-M4-examples/STM32MP157C-DK2/Applications/OpenAMP/OpenAMP_TTY_echo_wakeup/lib/firmware/
>> This exemple use the RPMsg and also blink a LED when while running.
>>
>> Don't hesitate if you need me to send it to you by mail.
>>
>> Thank,
>> Arnaud
>>
>>>
>>> Mathieu
>>>
>>>> +
>>>>  	ret = __rproc_detach(rproc);
>>>>  	if (ret) {
>>>>  		atomic_inc(&rproc->power);
>>>> @@ -1975,10 +1982,14 @@ int rproc_detach(struct rproc *rproc)
>>>>
>>>>  	rproc_disable_iommu(rproc);
>>>>
>>>> +	/* Free the chached table memory that can has been allocated*/
>>>> +	kfree(rproc->cached_table);
>>>> +	rproc->cached_table = NULL;
>>>>  	/*
>>>> -	 * Set the remote processor's table pointer to NULL.  Since mapping
>>>> -	 * of the resource table to a virtual address is done in the platform
>>>> -	 * driver, unmapping should also be done there.
>>>> +	 * Set the remote processor's table pointer to NULL. If mapping
>>>> +	 * of the resource table to a virtual address has been done in the
>>>> +	 * platform driver(attachment to an existing firmware),
>>>> +	 * unmapping should also be done there.
>>>>  	 */
>>>>  	rproc->table_ptr = NULL;
> 
> With the above in mind we can't to that, otherwise trying to re-attach with
> rproc_attach() won't work because ->table_ptr will be NULL.

Yes, or an alternative would be to call find_loaded_rsc_table on attach. I did
not test it but could make sense to call the ops instead of expecting that the
platform has set table_ptr.

> 
> I wasn't able to test that code path because I didn't have the FW that supported
> detaching.  Now that the feature is maturing it needs to be done.  
> 
>>>>  out:
>>>> -- 
>>>> 2.17.1
>>>>
>>>>
>>>>
