Return-Path: <SRS0=pQ+L=6G=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D11C54FCB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Apr 2020 22:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFBB320724
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Apr 2020 22:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rSaOQp9o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgDVW4v (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Apr 2020 18:56:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40786 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDVW4v (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 18:56:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03MMugWh025203;
        Wed, 22 Apr 2020 17:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587596202;
        bh=KCkHU5OdRMwx9gM/UQCU65+MU5AihdIwIiSvQznQ9ck=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rSaOQp9ovVvQ66i6x26RZfoDsF9Vr3nRMGtJHlLpIlZs3IaA0hGXb+3WYHSX7F2+O
         vRZ7yhiX/orIj/nkQaR6MQKRux0ugKHIocf6Kg0HFvqi+MDeuLuB3AhWHORQDncD/k
         MCq/HRZLK94w2fZF5XaFpKTwvK8zovZtRqveiQXE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03MMug5e011612
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Apr 2020 17:56:42 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Apr 2020 17:56:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Apr 2020 17:56:42 -0500
Received: from [10.250.70.56] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03MMug3p085914;
        Wed, 22 Apr 2020 17:56:42 -0500
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
 <20200330232139.GF31331@xps15> <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
 <20200422212927.GA20503@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <88967ac7-a7bf-a63c-d20b-e8efef69685f@ti.com>
Date:   Wed, 22 Apr 2020 17:56:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422212927.GA20503@xps15>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200422225642.ZCao5rvcr_udpGKWq0HG9jDyGFNUkIdxmUXsXgIlzIM@z>

On 4/22/20 4:29 PM, Mathieu Poirier wrote:
> Hi Suman,
> 
> On Tue, Mar 31, 2020 at 05:14:18PM -0500, Suman Anna wrote:
>> Hi Mathieu,
>>
>> On 3/30/20 6:21 PM, Mathieu Poirier wrote:
>>> On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
>>>>
>>>>> This patch prevents the firmware image from being displayed or changed
>>>>> when
>>>>> the remoteproc core is synchronising with an MCU. This is needed since
>>>>> there is no guarantee about the nature of the firmware image that is loaded
>>>>> by the external entity.
>>>>>
>>>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>> ---
>>>>>   drivers/remoteproc/remoteproc_sysfs.c | 25
>>>>> ++++++++++++++++++++++++-
>>>>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>>>>> b/drivers/remoteproc/remoteproc_sysfs.c
>>>>> index 7f8536b73295..4956577ad4b4 100644
>>>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>>>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>>>> @@ -13,9 +13,20 @@
>>>>>   static ssize_t firmware_show(struct device *dev, struct device_attribute
>>>>> *attr,
>>>>>   			  char *buf)
>>>>>   {
>>>>> +	ssize_t ret;
>>>>>   	struct rproc *rproc = to_rproc(dev);
>>>>>
>>>>> -	return sprintf(buf, "%s\n", rproc->firmware);
>>>>> +	/*
>>>>> +	 * In most instances there is no guarantee about the firmware
>>>>> +	 * that was loaded by the external entity.  As such simply don't
>>>>> +	 * print anything.
>>>>> +	 */
>>>>> +	if (rproc_sync_with_mcu(rproc))
>>>>> +		ret = sprintf(buf, "\n");
>>>> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
>>>>
>>>
>>> Don't know... It is easy to find plenty of cases in sysfs where null values are
>>> represented with a "\n", and just as many where "unknown", "undefined" or "-1"
>>> are used. I know GKH prefers the least amount of information as possible, hence
>>> going with a "\n".
>>>
>>> Again, no strong opinion...
>>>
>>>> Regards,
>>>> Loic
>>>>> +	else
>>>>> +		ret = sprintf(buf, "%s\n", rproc->firmware);
>>>>> +
>>>>> +	return ret;
>>>>>   }
>>>>>
>>>>>   /* Change firmware name via sysfs */
>>>>> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
>>>>>   		return -EINVAL;
>>>>>   	}
>>>>>
>>>>> +	/*
>>>>> +	 * There is no point in trying to change the firmware if the MCU
>>>>> +	 * is currently running or if loading of the image is done by
>>>>> +	 * another entity.
>>>>> +	 */
>>>>> +	if (rproc_sync_with_mcu(rproc)) {
>>>>> +		dev_err(dev,
>>>>> +			"can't change firmware while synchronising with
>>>>> MCU\n");
>>>>> +		err = -EBUSY;
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>
>> So, I have done a patch sometime back to deny sysfs operations [1] (the
>> primary usecase is for a rproc-client driver driven boot where auto-boot
>> is not set) which is still a need for me. Do you see that as orthogonal
>> to that, or can we leverage that here somehow. I cannot use the sync_
>> conditions for my cases since they are not already booted before.
> 
> No matter how much I try to fit the functionality provided by the
> "deny_sysfs_ops" flag in the patch you pointed out, I just can't come up with
> something I am happy with.
> 
> The only thing the topics of remote processor synchronisation and kernel
> initiated remote processor boot have in common is preventing sysfs access under
> specific circumstances. As such it is probably best to keep their implemenation
> seperated for the time being.

Yeah, OK, we can revisit this. We already have an in-kernel user 
wkup_m3_ipc driver that controls the boot and shutdown of the wkup_m3 
rproc driver, which is used for SoC Power Management, and so we really 
do not want any control from userspace for that. I will have the same 
need for the PRU remoteproc client usage perspective as well.

regards
Suman

> 
> Thanks,
> Mathieu
> 
>>
>> Also, any reason why you want to do this check before the rproc->state
>> unlike the logic around the 'state' file in the next patch?
>>
>> [1] https://patchwork.kernel.org/patch/10601325/
>>
>> regards
>> Suman
>>
>>>>>   	if (rproc->state != RPROC_OFFLINE) {
>>>>>   		dev_err(dev, "can't change firmware while running\n");
>>>>>   		err = -EBUSY;
>>>>> --
>>>>> 2.20.1
>>>>
>>

