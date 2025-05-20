Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5E747F;
	Tue, 20 May 2025 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743487; cv=none; b=DFMF5XbMXpijiPrtfhrqLKpxGqoVU49CAO4y4j5X42CTcDhlyv/662KcoLVOv7TfumsrAlV0gK01m4rz+t1ozxzSeNWv6g5MX6u3OlRttWTAonOdVQxT49M0oFuBclRqtzyJ7eBMiB9Zz9I2UQnBKbtIAi7DERGC5N/yX/Xa37g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743487; c=relaxed/simple;
	bh=uVxldG9OPVd84HQjya122tQ1Rkexc5kkav/s+xo6zd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JkWk6AUEqZpURd3xRfJbUrYLD5ACL2qyWVWlOCtZaDS9mMp03g5WaujQr0C/GFPEk6pQloUM+D8S7nHaomKoGdOeuChyhUz5CiYWfOJ7mNJJvoV2EaTB9xw6WQgXvV8Vm8VR0kb3jL8KYlZvUa2xMxtiU5wOqDeOfrT+bzNSu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RgdIkFrn; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RgdIkFrn"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54KCHf0E801340
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 07:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747743462;
	bh=v/HR03qjcCV/m67Su6/Fy1LtZqxTVoT+wx6cgo/l9Xk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RgdIkFrn+9oWD4KB7PRQpIafbBXyXBhiwEcLARSMptCsi8nH+Uqop9TIqN06XAhvN
	 LM4kBGZhyFi89GIF4mtEZgcGDucZ9AK35xebIaQXnB/AM24hzUEnT+JkIE3Vknpxn0
	 XbAOCnhe2EtYRwnL9r/poS1L31/R3dDs0S9GADoI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54KCHfKQ042331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 May 2025 07:17:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 May 2025 07:17:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 May 2025 07:17:41 -0500
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54KCHe2Y091414;
	Tue, 20 May 2025 07:17:41 -0500
Message-ID: <d8837685-5262-a66a-4b0c-2a4ed73f6c76@ti.com>
Date: Tue, 20 May 2025 07:17:40 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in detach
 routine
Content-Language: en-US
To: Beleswar Prasad Padhi <b-padhi@ti.com>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <martyn.welch@collabora.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com> <aCddoCUIpIV1ZxEW@p14s>
 <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com> <aCtCEvGlqIIDYtcn@p14s>
 <f480253a-225d-4941-af81-32e1a02bf793@ti.com>
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <f480253a-225d-4941-af81-32e1a02bf793@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/20/25 00:06, Beleswar Prasad Padhi wrote:
> Hi Mathieu,
> 
> On 19/05/25 20:07, Mathieu Poirier wrote:
>> On Sat, May 17, 2025 at 06:53:29PM +0530, Beleswar Prasad Padhi wrote:
>>> On 5/16/2025 9:15 PM, Mathieu Poirier wrote:
>>>> On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
>>>>> The rproc_detach() function invokes __rproc_detach() before
>>>>> rproc_unprepare_device(). The __rproc_detach() function sets the
>>>>> rproc->state to "RPROC_DETACHED".
>>>>>
>>>>> However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
>>>>> state in its .unprepare ops to identify IPC-only mode; which leads to
>>>>> resetting the rproc in detach routine.
>>>>>
>>>>> Therefore, correct the IPC-only mode detection logic to look for
>>>>> "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
>>>>>
>>>> This driver has been upstream for 9 whole months, it is hard for me to believe
>>>> this but was just noticed.  Martyn from Collabora should be CC'ed on this, and I
>>>> will also need the required R-b/T-b tags.
>>>
>>> Cc: Martyn Welch martyn.welch@collabora.com
>>>
>>> Requesting Andrew/Judith for review and test too.
>>>
>>>> Typically bug fixes are not part of refactoring exercises.
>>>
>>> Typically, yes. But the refactor depends on this fix. This
>>> k3_m4_rproc_unprepare() function is entirely refactored to common driver in
>>> [PATCH v12 26/36].
>>>
>>> So, If the refactor is picked without this patch fix, the mainline M4 driver
>>> would be fixed, but the older stable kernels would always have this bug. Let
>>> me know what you think.
>>>
>> I suggest you send this patch on its own and then the series (without this
>> patch) with a note in the cover letter that it depends on the fix.  That way we
>> get the best of both worlds.
> 
> 
> Sure. If I get any comments/reviews on this version, I will re-spin this patch separately than the series.
> 
> Thanks,
> Beleswar
> 
Reviewed-by: Hari Nagalla <hnagalla@ti.com>
>>
>>> Thanks,
>>> Beleswar
>>>
>>>>    I suggest to apply
>>>> this set without this patch - you can then work on fixing this bug.
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>>> ---
>>>>> v12: Changelog:
>>>>> 1. New patch. Fixup a state detection logic.
>>>>>
>>>>>    drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>> index a16fb165fcedd..6cd50b16a8e82 100644
>>>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>>>> @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
>>>>>    	int ret;
>>>>>    	/* If the core is going to be detached do not assert the module reset */
>>>>> -	if (rproc->state == RPROC_ATTACHED)
>>>>> +	if (rproc->state == RPROC_DETACHED)
>>>>>    		return 0;
>>>>>    	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>>>>> -- 
>>>>> 2.34.1
>>>>>

