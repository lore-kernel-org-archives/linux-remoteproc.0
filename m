Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE51552FD
	for <linux-remoteproc@vger.kernel.org>; Sun,  1 Sep 2024 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725197713; cv=none; b=nmni0cm6Rss1/PDbbr4EAvuuG5NGwW2MGatEVctwy4e1dHpbXh0mGU5/Gd/V5Poq/GEa1O8i/XMtRPd59Yg1Qw6MoufMzhNvpFmQesxygEYZV9pldvAxtswjqndPSM4Uj2IU6cnKpCanz+8/5MTch5FQMQmoyxJco0wE5HW9DmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725197713; c=relaxed/simple;
	bh=BZYPIy6R3BUybWWreHcLMoudk2mWh6xWjnAqFXs9n7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=net8xz0AWm1PgAdisdaxMWywuqWG29Zex2lfeTdT2+qSzHouH67BaJj2jI6xDsaywiJJt4tlcZBgDAVHVd/vJN6ZTPqmtFTL76NM2A5gNaF2UhI9S4ZyR2GOSEVYRykXcL/nef+zvqitsbdhU8xdxkOjlFAvptoCCvu0KnvJTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gfii7p10; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gfii7p10"
Message-ID: <cb11a5b8-8134-4059-b4f8-96aa0e7f7c2f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725197707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5DQlTs2nlOPDf+z+agMCeOtbRkbOqIrhRru/M93h/k=;
	b=Gfii7p105zLmIKicGk19NjCasSNbi4QVxHQV5H2eSe8iMrOO5c+3Me/Y4P2FkMG4gWpxyy
	s6xmyymvKslgYkgrAAQhZWKklM/GGLmV9mmqnW1G3u4lSYDcwnAgEMjDFn3tYU/FUFQVgo
	xbSRnA06U2YMZLCYDHjGicaj7qf8w9s=
Date: Sun, 1 Sep 2024 21:34:37 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] hwspinlock: improve locking safety by using
 raw_spinlock_t
To: Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Dave Young <dyoung@redhat.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240824143847.5307-1-wen.yang@linux.dev>
 <4qotnhheec3q2beftcnstwws4haibaptyu7wafdkykewlpbg6g@f5k7jue52fl6>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <4qotnhheec3q2beftcnstwws4haibaptyu7wafdkykewlpbg6g@f5k7jue52fl6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2024/8/27 00:37, Bjorn Andersson wrote:
> On Sat, Aug 24, 2024 at 10:38:47PM GMT, Wen Yang wrote:
>> Both __hwspin_trylock and __hwspin_unlock use hwlock->lock, and require
>> running in atomic context, with a special annotation:
>> function will never sleep.
>> However, this requirement is not fulfilled on PREEMPT_RT.
>>
>> To address it, use raw_spinlock_t instead of spin_lock_t.
> 
> I think the "will never sleep" comment expresses that the function can
> be called in atomic or irq context, not necessarily that it must not
> sleep.
> 
> If this is the case, would it be better to fix the comment or the code?
> 

Thank you for your commens.
Let's try updating the following documents:
Documentation/locking/hwspinlock.rst
drivers/hwspinlock/hwspinlock_core.c
include/linux/hwspinlock.h

--
Best wishes,
Wen

> 
>>
>> Signed-off-by: Wen Yang <wen.yang@linux.dev>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: linux-remoteproc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/hwspinlock/hwspinlock_core.c     | 20 ++++++++++----------
>>   drivers/hwspinlock/hwspinlock_internal.h |  2 +-
>>   2 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
>> index 6505261e6068..76e5a6c645b1 100644
>> --- a/drivers/hwspinlock/hwspinlock_core.c
>> +++ b/drivers/hwspinlock/hwspinlock_core.c
>> @@ -111,17 +111,17 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
>>   	 */
>>   	switch (mode) {
>>   	case HWLOCK_IRQSTATE:
>> -		ret = spin_trylock_irqsave(&hwlock->lock, *flags);
>> +		ret = raw_spin_trylock_irqsave(&hwlock->lock, *flags);
>>   		break;
>>   	case HWLOCK_IRQ:
>> -		ret = spin_trylock_irq(&hwlock->lock);
>> +		ret = raw_spin_trylock_irq(&hwlock->lock);
>>   		break;
>>   	case HWLOCK_RAW:
>>   	case HWLOCK_IN_ATOMIC:
>>   		ret = 1;
>>   		break;
>>   	default:
>> -		ret = spin_trylock(&hwlock->lock);
>> +		ret = raw_spin_trylock(&hwlock->lock);
>>   		break;
>>   	}
>>   
>> @@ -136,17 +136,17 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
>>   	if (!ret) {
>>   		switch (mode) {
>>   		case HWLOCK_IRQSTATE:
>> -			spin_unlock_irqrestore(&hwlock->lock, *flags);
>> +			raw_spin_unlock_irqrestore(&hwlock->lock, *flags);
>>   			break;
>>   		case HWLOCK_IRQ:
>> -			spin_unlock_irq(&hwlock->lock);
>> +			raw_spin_unlock_irq(&hwlock->lock);
>>   			break;
>>   		case HWLOCK_RAW:
>>   		case HWLOCK_IN_ATOMIC:
>>   			/* Nothing to do */
>>   			break;
>>   		default:
>> -			spin_unlock(&hwlock->lock);
>> +			raw_spin_unlock(&hwlock->lock);
>>   			break;
>>   		}
>>   
>> @@ -289,17 +289,17 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
>>   	/* Undo the spin_trylock{_irq, _irqsave} called while locking */
>>   	switch (mode) {
>>   	case HWLOCK_IRQSTATE:
>> -		spin_unlock_irqrestore(&hwlock->lock, *flags);
>> +		raw_spin_unlock_irqrestore(&hwlock->lock, *flags);
>>   		break;
>>   	case HWLOCK_IRQ:
>> -		spin_unlock_irq(&hwlock->lock);
>> +		raw_spin_unlock_irq(&hwlock->lock);
>>   		break;
>>   	case HWLOCK_RAW:
>>   	case HWLOCK_IN_ATOMIC:
>>   		/* Nothing to do */
>>   		break;
>>   	default:
>> -		spin_unlock(&hwlock->lock);
>> +		raw_spin_unlock(&hwlock->lock);
>>   		break;
>>   	}
>>   }
>> @@ -535,7 +535,7 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
>>   	for (i = 0; i < num_locks; i++) {
>>   		hwlock = &bank->lock[i];
>>   
>> -		spin_lock_init(&hwlock->lock);
>> +		raw_spin_lock_init(&hwlock->lock);
>>   		hwlock->bank = bank;
>>   
>>   		ret = hwspin_lock_register_single(hwlock, base_id + i);
>> diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
>> index f298fc0ee5ad..9fbd66e8a82f 100644
>> --- a/drivers/hwspinlock/hwspinlock_internal.h
>> +++ b/drivers/hwspinlock/hwspinlock_internal.h
>> @@ -42,7 +42,7 @@ struct hwspinlock_ops {
>>    */
>>   struct hwspinlock {
>>   	struct hwspinlock_device *bank;
>> -	spinlock_t lock;
>> +	raw_spinlock_t lock;
>>   	void *priv;
>>   };
>>   
>> -- 
>> 2.25.1
>>
