Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D821D0167;
	Wed,  4 Sep 2024 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448838; cv=none; b=eBkSI5mg1DfR1P+OaMoViGNi+pDHGmlQxplcIDzcxEOcMEn0JXf2xa/inXoD1Yl07vD1zMAxruB8jrCiM9x/EJXB9ds0Y+ZAOr731cmibHlzmA+6mn+AbQQ4+EsVT05YjBTe+qz5kECl3tNpt6t0twO1lX9HacxHWQbVH93CA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448838; c=relaxed/simple;
	bh=/p67161pq4mFVbBAVqpn+WmmAOac3AJuuOBsiT98BCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U/mg7uAnAq07LWxu3J0vOKttOZxBYi0mMrF1S2TMVSBBqajO+BxbtGAIEIF805NEhRzP65wsniKdmC4RQXgid1yO8ugTEEDzvDmjid+wEg/kOYFBnAzpT49Zc5m+BOSMP8J96PMgt/1qHo98n5RL52ITTk9tLhPLLlo/ujlBLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RUQZoTLu; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RUQZoTLu"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 484BKIsb002952;
	Wed, 4 Sep 2024 06:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725448818;
	bh=2JE8yXmqVX5IfjYueX0kdENmSWkRL9BydcoG+TvETAQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RUQZoTLu8dUpEGshxZDCyjESQyGqE+tLIArQSwQ5H/I5KMYfg7w3l4w7AhFhkqFWV
	 zm93GYs5NXdlDagjilxaniEzz9VJf8sa6mAx8FKf/m8sIUcaCOICEBMozOWIxrKM4b
	 KgLjLP8S1/IqtfhtP2ZdCL7L3EwmgMbbtldUlFvc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 484BKICn052628;
	Wed, 4 Sep 2024 06:20:18 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Sep 2024 06:20:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Sep 2024 06:20:18 -0500
Received: from [10.250.149.209] ([10.250.149.209])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 484BKFLo106649;
	Wed, 4 Sep 2024 06:20:15 -0500
Message-ID: <40ad98dd-6a1d-4619-9732-459ca837468e@ti.com>
Date: Wed, 4 Sep 2024 16:50:14 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3-r5: Delay notification of wakeup event
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240820105004.2788327-1-b-padhi@ti.com>
 <522affaa-47ad-4834-be3c-acdd04902821@ti.com>
 <CANLsYkzfpO4dcF=xkfZRo8ekCOzyNwvjHkwu8t5T58B2hV8-AQ@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CANLsYkzfpO4dcF=xkfZRo8ekCOzyNwvjHkwu8t5T58B2hV8-AQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180


On 03-09-2024 20:02, Mathieu Poirier wrote:
> On Tue, 3 Sept 2024 at 04:15, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>> Hi Mathieu,
>>
>> On 20-08-2024 16:20, Beleswar Padhi wrote:
>>> From: Udit Kumar <u-kumar1@ti.com>
>>>
>>> Few times, core1 was scheduled to boot first before core0, which leads
>>> to error:
>>>
>>> 'k3_r5_rproc_start: can not start core 1 before core 0'.
>>>
>>> This was happening due to some scheduling between prepare and start
>>> callback. The probe function waits for event, which is getting
>>> triggered by prepare callback. To avoid above condition move event
>>> trigger to start instead of prepare callback.
>>>
>>> Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
>>
>> Please put this patch on hold. I have some additional changelog that
>> should go in v3.
>>
> I applied this patch a couple of weeks ago - are those changes to the
> code?  If so please send another patch on top of rproc-next.


Understood. Those are code changes, I will post another patch series for 
the same.

Thanks,
Beleswar

>
>> Thanks,
>> Beleswar
>>
>>> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>>> [ Applied wakeup event trigger only for Split-Mode booted rprocs ]
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> v2: Changelog:
>>> * Mathieu
>>> 1) Rebased changes on top of -next-20240820 tag.
>>>
>>> Link to v1:
>>> https://lore.kernel.org/all/20240809060132.308642-1-b-padhi@ti.com/
>>>
>>>    drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> index 8a63a9360c0f..e61e53381abc 100644
>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> @@ -469,8 +469,6 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>>>                        ret);
>>>                return ret;
>>>        }
>>> -     core->released_from_reset = true;
>>> -     wake_up_interruptible(&cluster->core_transition);
>>>
>>>        /*
>>>         * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
>>> @@ -587,6 +585,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>>                ret = k3_r5_core_run(core);
>>>                if (ret)
>>>                        return ret;
>>> +
>>> +             core->released_from_reset = true;
>>> +             wake_up_interruptible(&cluster->core_transition);
>>>        }
>>>
>>>        return 0;
