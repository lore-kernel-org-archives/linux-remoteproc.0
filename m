Return-Path: <SRS0=Vkxm=5Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65199C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 20:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BDA320730
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 20:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NN9m6UmF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgDIUzm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 16:55:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35116 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgDIUzm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 16:55:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 039KtauM013660;
        Thu, 9 Apr 2020 15:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586465736;
        bh=l7GkzXRl+IQScYfIGZmCkkbK4ZjccMGxRwdQJDTaLcc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NN9m6UmFrvo6wvL/Hg6M+IC64F2HkF9EMuStR1BeDR9ApPC6gDiV/fFNY44QjAerj
         B/V3jj2CHVk7fNz/R54CLHDdNhlAVrsodIjKjDpg9D+FE0TWk31wclwFXuaPjI+TQB
         8JnEnK72zGnpBmQGFe1KiM47xSYmWZWkNfb9ONcA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039KtaxJ096541;
        Thu, 9 Apr 2020 15:55:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Apr
 2020 15:55:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Apr 2020 15:55:36 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039KtZDe102151;
        Thu, 9 Apr 2020 15:55:35 -0500
Subject: Re: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
 synchronisation when changing state
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-17-mathieu.poirier@linaro.org>
 <c9fb2f50e93b4f8dad43392bf61f736a@SFHDAG7NODE2.st.com>
 <20200330234934.GH31331@xps15> <5223cca7-5409-a113-8a7f-9f6923231353@ti.com>
 <20200401212910.GE17383@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <22ad887a-5758-8733-0afc-78dec913827d@ti.com>
Date:   Thu, 9 Apr 2020 15:55:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200401212910.GE17383@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200409205535.wbigy6xKy-cCAVhS8JjMHJHc0E8SDZuykTjaIXk_qWo@z>

On 4/1/20 4:29 PM, Mathieu Poirier wrote:
> On Tue, Mar 31, 2020 at 05:35:58PM -0500, Suman Anna wrote:
>> Hi Mathieu,
>>
>> On 3/30/20 6:49 PM, Mathieu Poirier wrote:
>>> On Fri, Mar 27, 2020 at 02:04:36PM +0000, Loic PALLARDY wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> Sent: mardi 24 mars 2020 22:46
>>>>> To: bjorn.andersson@linaro.org
>>>>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
>>>>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
>>>>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
>>>>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
>>>>> Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
>>>>> synchronisation when changing state
>>>>>
>>>>> This patch deals with state changes when synchronising with an MCU. More
>>>>> specifically it prevents the MCU from being started if it already has been
>>>>> started by another entity.  Similarly it prevents the AP from stopping the
>>>>> MCU if it hasn't been given the capability by platform firmware.
>>>>>
>>>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> ---
>>>>>  drivers/remoteproc/remoteproc_sysfs.c | 32
>>>>> ++++++++++++++++++++++++++-
>>>>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>>>>> b/drivers/remoteproc/remoteproc_sysfs.c
>>>>> index 4956577ad4b4..741a3c152b82 100644
>>>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>>>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>>>> @@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct
>>>>> device_attribute *attr,
>>>>>  	return sprintf(buf, "%s\n", rproc_state_string[state]);
>>>>>  }
>>>>>
>>>>> +static int rproc_can_shutdown(struct rproc *rproc)
>>>>> +{
>>>>> +	/* The MCU is not running, obviously an invalid operation. */
>>>>> +	if (rproc->state != RPROC_RUNNING)
>>>>> +		return false;
>>>>> +
>>>>> +	/*
>>>>> +	 * The MCU is not running (see above) and the remoteproc core is
>>>>> the
>>>>> +	 * lifecycle manager, no problem calling for a shutdown.
>>>>> +	 */
>>>>> +	if (!rproc_sync_with_mcu(rproc))
>>>>> +		return true;
>>>>> +
>>>>> +	/*
>>>>> +	 * The MCU has been loaded by another entity (see above) and the
>>>>> +	 * platform code has _not_ given us the capability of stopping it.
>>>>> +	 */
>>>>> +	if (!rproc->sync_ops->stop)
>>>>> +		return false;
>>>>
>>>> Test could be simplified
>>>> if (rproc_sync_with_mcu(rproc)) && !rproc->sync_ops->stop)
>>>> 	return false;
>>>
>>> I laid out the test individually on purpose.  That way there is no coupling
>>> between conditions, it is plane to see what is going on and remains maintainable
>>> as we add new tests.
>>>
>>>>
>>>>> +
>>>>> +	return true;
>>>>> +}
>>>>> +
>>>>>  /* Change remote processor state via sysfs */
>>>>>  static ssize_t state_store(struct device *dev,
>>>>>  			      struct device_attribute *attr,
>>>>> @@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
>>>>>  		if (rproc->state == RPROC_RUNNING)
>>>>>  			return -EBUSY;
>>>>>
>>>>> +		/*
>>>>> +		 * In synchronisation mode, booting the MCU is the
>>>>> +		 * responsibility of an external entity.
>>>>> +		 */
>>>>> +		if (rproc_sync_with_mcu(rproc))
>>>>> +			return -EINVAL;
>>>>> +
>>>> I don't understand this restriction, simply because it is preventing to resynchronize with a
>>>> coprocessor after a "stop".
>>
>> There's actually one more scenario even without "stop". If auto_boot is
>> set to false, then rproc_actuate will never get called.
> 
> I fail to fully understand the situation you are describing - can you give me
> more information?

The platform driver has auto_boot set to false and sync_states set, so
rproc_trigger_auto_initiate() never gets called in rproc_add(), and
rproc_actuate() doesn't happen either. rproc->state is not RUNNING, and
you will bail out here, and there is no way to start it either.

> 
>>
>>>> In the following configuration which can be configuration for coprocessor with romed/flashed
>>>> firmware (no reload needed):
>>>> on_init = true
>>>> after_stop = true
>>>> after_crash = true
>>>> Once you stop it via sysfs interface, you can't anymore restart/resync to it.
>>>
>>> Very true.  The MCU will get restarted by another entity but the AP won't
>>> synchronise with it.  I need more time to think about the best way to deal with
>>> this and may have to get back to you for further discussions.
>>>
>>>>
>>>> I think it will be better to modify rproc_boot() to take into account rproc_sync_with_mcu()
>>>> as below:
>>>>
>>>> int rproc_boot(struct rproc *rproc)
>>>>  {
>>>> -	const struct firmware *firmware_p;
>>>> +	const struct firmware *firmware_p = NULL;
>>>>  	struct device *dev = &rproc->dev;
>>>>  	int ret;
>>>>  
>>>>  	if (!rproc) {
>>>>  		pr_err("invalid rproc handle\n");
>>>>  		return -EINVAL;
>>>>  	}
>>>>  
>>>>  	/* load firmware */
>>>> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>>> -	if (ret < 0) {
>>>> -		dev_err(dev, "request_firmware failed: %d\n", ret);
>>>> -		return ret;
>>>> +	if (!rproc_sync_with_mcu(rproc)) {
>>
>> I guess this is what the original skip_fw_load was doing. And with the
>> current series, the userspace loading support usecase I have cannot be
>> achieved. If this is added back, I can try if that works for my usecases.
>>
>>>> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>>> +		if (ret < 0) {
>>>> +			dev_err(dev, "request_firmware failed: %d\n", ret);
>>>> +			return ret;
>>>> +		}
>>>>  	}
>>>>  
>>>>  	ret = rproc_actuate(rproc, firmware_p);
>>>>  
>>>> -	release_firmware(firmware_p);
>>>> +	if (firmware_p)
>>>> +		release_firmware(firmware_p);
>>>>  
>>>>  	return ret;
>>>>  }
>>>>  
>>>> Thanks to these modifications, I'm able to resync after a stop with coprocessor without reloading firmware.
>>>>
>>>>>  		ret = rproc_boot(rproc);
>>>>>  		if (ret)
>>>>>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>>>>>  	} else if (sysfs_streq(buf, "stop")) {
>>>>> -		if (rproc->state != RPROC_RUNNING)
>>>>> +		if (!rproc_can_shutdown(rproc))
>>>>>  			return -EINVAL;
>>>>>
>>>>>  		rproc_shutdown(rproc);
>>>> As rproc shutdown is also accessible as kernel API, I propose to move
>>>> rproc_can_shutdown() check inside rproc_shutdown() and to test
>>>> returned error
>>>
>>> Ah yes, it is public...  As you point out, I think we'll need to move
>>> rproc_can_shutdown() in rproc_shutdown().
>>
>> I am assuming only the new conditions, right?
> 
> Once again I fail to grasp the extent of your comment.  Can you be more specific
> about the "new conditions"?

rproc_can_shutdown() has three checks, where the first check is existing
check that got moved, and the other 2 are the new checks that deal with
the sync states. So, I meant these 2 new sync checks.

regards
Suman

> 
> Thanks
> Mathieu
> 
>>
>> regards
>> Suman
>>
>>>
>>> Thank you for taking the time to review this set,
>>> Mathieu
>>>

