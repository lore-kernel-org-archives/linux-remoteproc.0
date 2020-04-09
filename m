Return-Path: <SRS0=Vkxm=5Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C9EC2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 21:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF1D22072F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 21:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rBoQXvnu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgDIVxn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 17:53:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40552 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgDIVxm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 17:53:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 039LrVi5028565;
        Thu, 9 Apr 2020 16:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586469211;
        bh=tPU56uNiAAL+gf/V/aX4CynehtFz+YGCX4eHOyWKjzc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rBoQXvnuj5xT8rF+EjiLUaVqVBoB8C/6lJfTb/R4oeuIcgoWc2ybzIIjjz+hB19m7
         oxbe83DeC/+tuHunjAuSrUCH5q/2Rl5wEOcVmf6rAjBW7ixj5AK3RjuekSzLwPf7kK
         LOoGRtszkHx+7KHU8pDCMOQnn9s42qq10aa65ujg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039LrVVk045866;
        Thu, 9 Apr 2020 16:53:31 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Apr
 2020 16:53:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Apr 2020 16:53:31 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039LrVLF072663;
        Thu, 9 Apr 2020 16:53:31 -0500
Subject: Re: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
 <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
 <88f56a4e-dccb-0d50-4656-82380a2e57aa@ti.com> <20200401202950.GA17383@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <35ddd269-f6a6-2eb7-ebc8-1adc68466493@ti.com>
Date:   Thu, 9 Apr 2020 16:53:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200401202950.GA17383@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200409215331.Ffid0tvWYXuBm7V8qE847yqPz8UPlLkYYg8rQ7EqqV4@z>

On 4/1/20 3:29 PM, Mathieu Poirier wrote:
> Hi Suman,
> 
> On Mon, Mar 30, 2020 at 03:38:14PM -0500, Suman Anna wrote:
>> Hi Mathieu,
>>
>> On 3/27/20 6:10 AM, Loic PALLARDY wrote:
>>> Hi Mathieu,
>>>
>>>>
>>>> In preparation to allocate the synchronisation operation and state
>>>> machine, spin off a new function in order to keep rproc_alloc() as
>>>> clean as possible.
>>>>
>>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
>>>> -
>>>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>>> b/drivers/remoteproc/remoteproc_core.c
>>>> index ee277bc5556c..9da245734db6 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
>>>> const struct rproc_ops *ops)
>>>>  	return 0;
>>>>  }
>>>>
>>>> +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>>>> +				 const struct rproc_ops *boot_ops,
>>>> +				 const char *firmware, int len)
>>>
>>> len argument is not used in the patch nor in the following, maybe removed from my pov.
>>
>> Indeed.
>>
>>>
>>> Regards,
>>> Loic
>>
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	/* We have a boot_ops so allocate firmware name and operations */
>>>> +	if (boot_ops) {
>>>> +		ret = rproc_alloc_firmware(rproc, name, firmware);
>>>> +		if (ret)
>>>> +			return ret;
>>
>> So, can you explain why firmware allocation now becomes conditional on
>> this boot_ops?
> 
> There is no point in allocating a firmware name in a scenario where the
> remoteproc core is only synchronising with the MCU.  As soon as a boot_ops (to
> be renamed ops as per your comment below) is present I assume firmware loading
> will be involved at some point.   Do you see a scenario where that wouldn't be
> be case?

No. But that isn't until the whole sync stuff is introduced. As of this
patch, it it still code refactoring. And I would think that the cases
where only sync_ops will be used will be the minority.

regards
Suman

> 
>>
>> Perhaps, continue to call this as ops following the field name in struct
>> rproc.
> 
> Ok
> 
>>
>> regards
>> Suman
>>
>>>> +
>>>> +		ret = rproc_alloc_ops(rproc, boot_ops);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  /**
>>>>   * rproc_alloc() - allocate a remote processor handle
>>>>   * @dev: the underlying device
>>>> @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const
>>>> char *name,
>>>>  	rproc->dev.class = &rproc_class;
>>>>  	rproc->dev.driver_data = rproc;
>>>>
>>>> -	if (rproc_alloc_firmware(rproc, name, firmware))
>>>> -		goto out;
>>>> -
>>>> -	if (rproc_alloc_ops(rproc, ops))
>>>> +	if (rproc_alloc_internals(rproc, name, ops,
>>>> +				  firmware, len))
>>>>  		goto out;
>>>>
>>>>  	/* Assign a unique device index and name */
>>>> --
>>>> 2.20.1
>>>
>>

