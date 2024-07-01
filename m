Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB116E865;
	Mon,  1 Jul 2024 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852585; cv=none; b=e9b6kle1Ke6EA0HxEkAs6qnvNxu5sbtkqqKIz/uCOVjpBjdxoMgRMsPA50vYFVFMJtswe+JJU7L7YARzRq34OMxcsdbFdvCoEh9hq36dpipgNvy1weU1fEcD5nlgFxxYhwDrsvQniYjlWjWojikBDdSy+WxOLGlc60Rpf+iyD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852585; c=relaxed/simple;
	bh=D3GZWZhcZjfBD5GqhMXXEIk7dwayKFNlKAqL3PiE5q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWoR95YkpCuJKGKlY7KDFk+BMXNfnaUcZHvKKO7Iq0hYX9KLtnbx2XdPInISSPoz/2nMrFU2/HZS/oM1HaKaAv4e8f0gl11YB0EFyouuackOO/tT5zlc2KT9aNJXYjB+RVohb7GbupECKdks0a7r+XQZkJOyrDNrCBOXcqv3rMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FYm3sOEk; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FYm3sOEk"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A6EFF805;
	Mon,  1 Jul 2024 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719852581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqw//qZVbkknoRB7xj+XxlqfYFM2JTcioggZ82ZGBeM=;
	b=FYm3sOEk8Q77k+np/8znBiS9C8HG7LBRIYynJuoWhkKMxbpj06j2qVVuEaUNv9r89vy5iH
	r4RB2CcYcKBLqacNU8hxDWXeooHOH9bRaQyEC9TiHNjPhT+faOIuB27sTNbnAy5EN6dWGp
	mc9XTLDlTZaQbE1ho5+nui1ndvNIDWhLz2LbUJIJ2KIfmk+jPs6dSPohu1vGGVCZw9uRrb
	zV7LViIGV/Ck4CbtJet0wBUQ+aHKV28IQW+RUdDDWZwdQz58v5X1K5/PzgUgRAD+eKQB4z
	Vmx3pYhN5HZLlgE/otSlNXGq5rJN2YL/42KgH1FY0siNOVP7pLInZicwIhg0fg==
Message-ID: <73d5ee87-5985-4880-aefb-449eac3ee149@bootlin.com>
Date: Mon, 1 Jul 2024 18:49:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Udit Kumar <u-kumar1@ti.com>, Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Hari Nagalla
 <hnagalla@ti.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <20240621150058.319524-4-richard.genoud@bootlin.com> <Zn8orCbTx9VtA9Em@p14s>
 <99496000-a994-4641-861a-10cbb501910e@bootlin.com> <ZoLa5WklP5+T/qTO@p14s>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <ZoLa5WklP5+T/qTO@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Le 01/07/2024 à 18:35, Mathieu Poirier a écrit :
> On Mon, Jul 01, 2024 at 10:03:22AM +0200, Richard GENOUD wrote:
>> Le 28/06/2024 à 23:18, Mathieu Poirier a écrit :
>>> On Fri, Jun 21, 2024 at 05:00:57PM +0200, Richard Genoud wrote:
>>>> In the next commit, a RP_MBOX_SHUTDOWN message will be sent in
>>>> k3_r5_rproc_stop() to the remote proc (in lockstep on not)
>>>> Thus, the sanity check "do not allow core 0 to stop before core 1"
>>>> should be moved at the beginning of the function so that the generic case
>>>> can be dealt with.
>>>>
>>>> In order to have an easier patch to review, those actions are broke in
>>>> two patches:
>>>> - this patch: moving the sanity check at the beginning (No functional
>>>>     change).
>>>> - next patch: doing the real job (sending shutdown messages to remote
>>>>     procs before halting them).
>>>>
>>>> Basically, we had:
>>>> - cluster_mode actions
>>>> - !cluster_mode sanity check
>>>> - !cluster_mode actions
>>>> And now:
>>>> - !cluster_mode sanity check
>>>> - cluster_mode actions
>>>> - !cluster_mode actions
>>>>
>>>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>>>> ---
>>>>    drivers/remoteproc/ti_k3_r5_remoteproc.c | 24 ++++++++++++++----------
>>>>    1 file changed, 14 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> index 1f18b08618c8..a2ead87952c7 100644
>>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> @@ -636,16 +636,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>>>    	struct k3_r5_core *core1, *core = kproc->core;
>>>>    	int ret;
>>>> -	/* halt all applicable cores */
>>>> -	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>>> -		list_for_each_entry(core, &cluster->cores, elem) {
>>>> -			ret = k3_r5_core_halt(core);
>>>> -			if (ret) {
>>>> -				core = list_prev_entry(core, elem);
>>>> -				goto unroll_core_halt;
>>>> -			}
>>>> -		}
>>>> -	} else {
>>>> +
>>>> +	if (cluster->mode != CLUSTER_MODE_LOCKSTEP) {
>>>>    		/* do not allow core 0 to stop before core 1 */
>>>>    		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
>>>>    					elem);
>>>> @@ -656,6 +648,18 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>>>    			ret = -EPERM;
>>>>    			goto out;
>>>>    		}
>>>> +	}
>>>> +
>>>> +	/* halt all applicable cores */
>>>> +	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>>> +		list_for_each_entry(core, &cluster->cores, elem) {
>>>> +			ret = k3_r5_core_halt(core);
>>>> +			if (ret) {
>>>> +				core = list_prev_entry(core, elem);
>>>> +				goto unroll_core_halt;
>>>> +			}
>>>> +		}
>>>> +	} else {
>>>>    		ret = k3_r5_core_halt(core);
>>>>    		if (ret)
>>>
>>> With this patch, the "else" in this "if" condition is coupled with the "if" from
>>> the lockstep mode, making the code extremaly hard to read.  The original code
>>> has a k3_r5_core_halt() in both "if" conditions, making the condition
>>> independent from one another.
>>>
>> I'm not sure I understand what you mean.
> 
> With your patch applied I get the following: https://pastebin.com/yTZ0pKcS
> 
> Let's say the R5 is in split mode and k3_r5_rproc_stop() called on core1.  The
> if() that deal with that condition is on line 10, while the function that halts
> the remote processor is online 34, part of the else clause that handles lockstep
> mode.  The two if() clauses are entangled and nothing good can come out of that.

Ok, I see your point now.

Thanks !

> 
>> Anyway, I'm not happy with this diff, it doesn't reflect what was intended.
>> (which is moving the check "core 0 should not be stop before core 1" at the beginning)
>>
>> Tweaking around with the diff algorithms, I came with something way easier to read I think:
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 1f18b08618c8..a2ead87952c7 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -636,6 +636,20 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>          struct k3_r5_core *core1, *core = kproc->core;
>>          int ret;
>> +
>> +       if (cluster->mode != CLUSTER_MODE_LOCKSTEP) {
>> +               /* do not allow core 0 to stop before core 1 */
>> +               core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
>> +                                       elem);
>> +               if (core != core1 && core1->rproc->state != RPROC_OFFLINE &&
>> +                   core1->rproc->state != RPROC_SUSPENDED) {
>> +                       dev_err(dev, "%s: can not stop core 0 before core 1\n",
>> +                               __func__);
>> +                       ret = -EPERM;
>> +                       goto out;
>> +               }
>> +       }
>> +
>>          /* halt all applicable cores */
>>          if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>                  list_for_each_entry(core, &cluster->cores, elem) {
>> @@ -646,16 +660,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>                          }
>>                  }
>>          } else {
>> -               /* do not allow core 0 to stop before core 1 */
>> -               core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
>> -                                       elem);
>> -               if (core != core1 && core1->rproc->state != RPROC_OFFLINE &&
>> -                   core1->rproc->state != RPROC_SUSPENDED) {
>> -                       dev_err(dev, "%s: can not stop core 0 before core 1\n",
>> -                               __func__);
>> -                       ret = -EPERM;
>> -                       goto out;
>> -               }
>>                  ret = k3_r5_core_halt(core);
>>                  if (ret)
>>
>>
