Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDB1E9B2A;
	Tue, 20 May 2025 05:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747717602; cv=none; b=T07ZR5Rh3HGgTvG8hhDW5fkPWzEme78fPBGGr4ClA+5EocWKm0g3yzDYYlJeHEufVDZ63Tn/QoCTVXA6GDE7YeXLJb5ETjjuKkLKF3wa1/mXQCGDkLkSZLfbEcWO0bviQ7pLYDCU00BGT2dFpCDWVcyS/hP3kwMYOQjwAa7q9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747717602; c=relaxed/simple;
	bh=1wJfxsQ7E5QN6neRl8f0zOKyuFv7iUPKfiIuZQuaCBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iQBLy6QKYmyvvlWNTOAepITLihScw8ank/wnUqZM4ZYslFd2Afl9VYzskcSQA0QL1j3bMKWOISglTqVmDeS5XJtTu1uDTaxK2ZUVEikYlKOx3qr+YOBWVJjgMlnmv59nk0x4AI+org8D13tNgdvpYtENSZVS7aoBFbijyIUlSvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pwa1prFw; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pwa1prFw"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54K56IAV325444
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 00:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747717578;
	bh=F+faamJ2UEc6QY9BsjEfoc4sAC9/HSj+HkOgAnMFDpI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pwa1prFwGNjKgemmSS6b8lOahqRW3sYZeqktWyPUAQoHRQ3i8WAjI8PCReqKZZi1Y
	 66HT7ytBNgP3Dp5Q5kGSFBszEVtKCDGZdK2GeHC4POS+t83Q0Sp8Mi/Jd+a0YNNu3Z
	 8nmL3UFU9XFXFNMrz+SDUsBKP82f4zadyaS6KvuY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54K56Ior047985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 May 2025 00:06:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 May 2025 00:06:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 May 2025 00:06:17 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54K56DnN050080;
	Tue, 20 May 2025 00:06:14 -0500
Message-ID: <f480253a-225d-4941-af81-32e1a02bf793@ti.com>
Date: Tue, 20 May 2025 10:36:12 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in detach
 routine
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jm@ti.com>, <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <martyn.welch@collabora.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com> <aCddoCUIpIV1ZxEW@p14s>
 <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com> <aCtCEvGlqIIDYtcn@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <aCtCEvGlqIIDYtcn@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Mathieu,

On 19/05/25 20:07, Mathieu Poirier wrote:
> On Sat, May 17, 2025 at 06:53:29PM +0530, Beleswar Prasad Padhi wrote:
>> On 5/16/2025 9:15 PM, Mathieu Poirier wrote:
>>> On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
>>>> The rproc_detach() function invokes __rproc_detach() before
>>>> rproc_unprepare_device(). The __rproc_detach() function sets the
>>>> rproc->state to "RPROC_DETACHED".
>>>>
>>>> However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
>>>> state in its .unprepare ops to identify IPC-only mode; which leads to
>>>> resetting the rproc in detach routine.
>>>>
>>>> Therefore, correct the IPC-only mode detection logic to look for
>>>> "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
>>>>
>>> This driver has been upstream for 9 whole months, it is hard for me to believe
>>> this but was just noticed.  Martyn from Collabora should be CC'ed on this, and I
>>> will also need the required R-b/T-b tags.
>>
>> Cc: Martyn Welch martyn.welch@collabora.com
>>
>> Requesting Andrew/Judith for review and test too.
>>
>>> Typically bug fixes are not part of refactoring exercises.
>>
>> Typically, yes. But the refactor depends on this fix. This
>> k3_m4_rproc_unprepare() function is entirely refactored to common driver in
>> [PATCH v12 26/36].
>>
>> So, If the refactor is picked without this patch fix, the mainline M4 driver
>> would be fixed, but the older stable kernels would always have this bug. Let
>> me know what you think.
>>
> I suggest you send this patch on its own and then the series (without this
> patch) with a note in the cover letter that it depends on the fix.  That way we
> get the best of both worlds.


Sure. If I get any comments/reviews on this version, I will re-spin this patch separately than the series.

Thanks,
Beleswar

>
>> Thanks,
>> Beleswar
>>
>>>   I suggest to apply
>>> this set without this patch - you can then work on fixing this bug.
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> ---
>>>> v12: Changelog:
>>>> 1. New patch. Fixup a state detection logic.
>>>>
>>>>   drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> index a16fb165fcedd..6cd50b16a8e82 100644
>>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>> @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
>>>>   	int ret;
>>>>   	/* If the core is going to be detached do not assert the module reset */
>>>> -	if (rproc->state == RPROC_ATTACHED)
>>>> +	if (rproc->state == RPROC_DETACHED)
>>>>   		return 0;
>>>>   	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>>>> -- 
>>>> 2.34.1
>>>>
