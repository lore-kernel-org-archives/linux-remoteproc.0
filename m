Return-Path: <SRS0=Vkxm=5Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B78C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 19:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 410792082D
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 19:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FOZOWpEV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDITCO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 15:02:14 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53292 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDITCO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 15:02:14 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 039J25Z5115886;
        Thu, 9 Apr 2020 14:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586458925;
        bh=/+romrwNIBzUf90kmfLY/33tt4t9YhTV7CIot0zTCd0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FOZOWpEV1xvv0Ew0T3EMidEgiRT1i9Z252dJ8psbiboRjNDXBdjkOFp/5KE4rGevP
         2KgcWbBVNOfWbuqAtuZIJnkmma3pboMP0vGKwTTiEI81cHl3l6+xLiYNVL1nV/mHi0
         HuyO8AT4iseXSIQK13vxaiH+cM2bsqjGHlZFDCIY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 039J25Bj010096
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Apr 2020 14:02:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Apr
 2020 14:02:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Apr 2020 14:02:04 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039J24st058621;
        Thu, 9 Apr 2020 14:02:04 -0500
Subject: Re: [PATCH v2 14/17] remoteproc: Refactor function
 rproc_trigger_recovery()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-15-mathieu.poirier@linaro.org>
 <2b052de0-baf3-f474-152b-a71e1284852f@ti.com> <20200402203540.GB9160@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <cda58159-24f6-6101-2fe2-5e8264a42818@ti.com>
Date:   Thu, 9 Apr 2020 14:02:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200402203540.GB9160@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200409190204.M9n14usNDcRTRMDc63u8Cy6JoBwwwGXRoOHOZboa-LY@z>

On 4/2/20 3:35 PM, Mathieu Poirier wrote:
> On Tue, Mar 31, 2020 at 04:52:12PM -0500, Suman Anna wrote:
>> Hi Mathieu,
>>
>> On 3/24/20 4:46 PM, Mathieu Poirier wrote:
>>> Refactor function rproc_trigger_recovery() in order to avoid
>>> reloading the fw image when synchronising with an MCU rather than
>>> booting it.
>>>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
>>>  1 file changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index d3c4d7e6ca25..dbb0a8467205 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1661,7 +1661,7 @@ static void rproc_coredump(struct rproc *rproc)
>>>   */
>>>  int rproc_trigger_recovery(struct rproc *rproc)
>>>  {
>>> -	const struct firmware *firmware_p;
>>> +	const struct firmware *firmware_p = NULL;
>>>  	struct device *dev = &rproc->dev;
>>>  	int ret;
>>>  
>>> @@ -1678,14 +1678,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>>  	/* generate coredump */
>>>  	rproc_coredump(rproc);
>>>  
>>> -	/* load firmware */
>>> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>> -	if (ret < 0) {
>>> -		dev_err(dev, "request_firmware failed: %d\n", ret);
>>> -		goto unlock_mutex;
>>> +	/* load firmware if need be */
>>> +	if (!rproc_sync_with_mcu(rproc)) {
>>> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>>> +		if (ret < 0) {
>>> +			dev_err(dev, "request_firmware failed: %d\n", ret);
>>> +			goto unlock_mutex;
>>> +		}
>>
>> So, I am trying to understand the need for the flag around
>> RPROC_SYNC_STATE_CRASHED. Can you explain what all usecases that is
>> covering?
> 
> There could scenarios where another entity is in charge of the entire MCU
> lifecycle.  That entity could be able to recognise the MCU has crashed and
> automatically boot it again, in which case all the remoteproc core needs to do
> is synchronise with it.

So, Linux won't be responsible for error recovery in that case, and
wondering why this function would even be called in such a scenario?

> 
> But it could also be that another entity has booted the MCU when the system
> started but if the MCU crashes or is manually stopped, then the AP becomes the
> MCU lifecycle.

Yeah, this is more of a standard early-boot by bootloader scenario which
should be satisfied by just the on_init state.

I mostly still trying to understand the usecase here.

regards
Suman


> 
>>
>> In anycase, you should probably combine this piece with the flag change
>> for STATE_CRASHED on the last patch.
> 
> Sure.
> 
>>
>> regards
>> Suman
>>
>>>  	}
>>>  
>>> -	/* boot the remote processor up again */
>>> +	/* boot up or synchronise with the remote processor again */
>>>  	ret = rproc_start(rproc, firmware_p);
>>>  
>>>  	release_firmware(firmware_p);
>>>
>>

