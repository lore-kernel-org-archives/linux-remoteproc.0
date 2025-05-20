Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com [136.143.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AA2185A6;
	Tue, 20 May 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732106; cv=pass; b=dCmSceFpbDQ44BEguIHlzxk3BGHjm/B/SXycgvbGrsExPNK69PtCTZiK0EfR7yIwcXT5QBafuNUW2ply836tHjxsh6x77jWKKyIBY9lIKjTM/HFVVLW05raEJFGKaSOBoHPwLCRwWs8qqOPI2Ri6Ict77KdR5LiWFJBwkth/yRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732106; c=relaxed/simple;
	bh=EQzKfktN95HTIFpLcNeTxBoB8M051ppF/sUAYoUVdDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiKs3ENQqOELojBdfYK3IvYvhm5iHy25sV+z9O3luFSRuCY/B5M2VCDeLgsroRCr5w+zbXyw6byM+OfyPQPAbiyEH2L2UedcSmfbCWyCK+xIz0Thksd1B84F3h3yRZMHiJJT4HJaJcaWvL2zOeVHaXyanbLqaE+U0jC9ruCGwFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=SfTLMz2c; arc=pass smtp.client-ip=136.143.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="SfTLMz2c"
ARC-Seal: i=1; a=rsa-sha256; t=1747732092; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jy6euOTXP5YLMuqnexIA4dl4Wbv189sWDcTC0XSViR8jOp2Zj4bxirSuYHbtzFSG2Z357ARBevugK1eif68zA6Na1OoYEC464OluvC8iZemcoiJHazRLUGniAVvIovuxlku8gYyfaOz5T6TfzpjCr/B9+sC0yn3Y+1N6K3rrWNk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747732092; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wmdL8H13ur+9yRNBU4GhAviHzBEWJiDdLNvMilyCdXE=; 
	b=Oqyy2e+i7lua6XsulMwoL2qqxjukftzzqqX43LU17GD7j7+gVNbMVbu6SC58sLEqvD9+2o1VWAhPdoZC/52cHaJCFWiWA8RShLVUNV199cJefZysHoS06aSjz/hN0UqUvdFD2hdupSisvx2VEDUuqjWopvOtBnlsDFFZZ2eD7Cs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747732092;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wmdL8H13ur+9yRNBU4GhAviHzBEWJiDdLNvMilyCdXE=;
	b=SfTLMz2cUWOYhQjFu/mFyI/rD3phRWG1ecblWYjZAje0TPDqv/qf8UAnnc+cB07t
	lOLLBCKDx5oF6vrnfu0ZEr5UvR0RyN1LoGk6kYk79JT4btGoaAp+1zHgqE3p5QwGeWg
	430uev6yGn2jzzFyykGdTEk+OYqMaYpLXrfsOt9k=
Received: by mx.zohomail.com with SMTPS id 1747732074385971.7477326343657;
	Tue, 20 May 2025 02:07:54 -0700 (PDT)
Message-ID: <c746e97a-7792-4dfb-902b-7f1e705cb413@collabora.com>
Date: Tue, 20 May 2025 10:07:48 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in detach
 routine
To: Beleswar Prasad Padhi <b-padhi@ti.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
 jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
 jkangas@redhat.com, eballetbo@redhat.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com> <aCddoCUIpIV1ZxEW@p14s>
 <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com>
Content-Language: en-US
From: Martyn Welch <martyn.welch@collabora.com>
In-Reply-To: <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 17/05/2025 14:23, Beleswar Prasad Padhi wrote:
> 
> On 5/16/2025 9:15 PM, Mathieu Poirier wrote:
>> On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
>>> The rproc_detach() function invokes __rproc_detach() before
>>> rproc_unprepare_device(). The __rproc_detach() function sets the
>>> rproc->state to "RPROC_DETACHED".
>>>
>>> However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
>>> state in its .unprepare ops to identify IPC-only mode; which leads to
>>> resetting the rproc in detach routine.
>>>
>>> Therefore, correct the IPC-only mode detection logic to look for
>>> "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
>>>
>> This driver has been upstream for 9 whole months, it is hard for me to 
>> believe
>> this but was just noticed.  Martyn from Collabora should be CC'ed on 
>> this, and I
>> will also need the required R-b/T-b tags.
> 
> 
> Cc: Martyn Welch martyn.welch@collabora.com
> 
> Requesting Andrew/Judith for review and test too.
> 

It's been a while since I used this, IIRC the project I thought we 
needed this for went in a different direction almost as soon as I'd 
managed to get the driver upstream...  ...But I've spent some time to 
review as best as I can:

Reviewed-by: Martyn Welch <martyn.welch@collabora.com>

>>
>> Typically bug fixes are not part of refactoring exercises.
> 
> 
> Typically, yes. But the refactor depends on this fix. This 
> k3_m4_rproc_unprepare() function is entirely refactored to common driver 
> in [PATCH v12 26/36].
> 
> So, If the refactor is picked without this patch fix, the mainline M4 
> driver would be fixed, but the older stable kernels would always have 
> this bug. Let me know what you think.
> 
> Thanks,
> Beleswar
> 
>>   I suggest to apply
>> this set without this patch - you can then work on fixing this bug.
>>
>> Thanks,
>> Mathieu
>>
>>> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for 
>>> M4F subsystem")
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> v12: Changelog:
>>> 1. New patch. Fixup a state detection logic.
>>>
>>>   drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/ 
>>> remoteproc/ti_k3_m4_remoteproc.c
>>> index a16fb165fcedd..6cd50b16a8e82 100644
>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>> @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc 
>>> *rproc)
>>>       int ret;
>>>       /* If the core is going to be detached do not assert the module 
>>> reset */
>>> -    if (rproc->state == RPROC_ATTACHED)
>>> +    if (rproc->state == RPROC_DETACHED)
>>>           return 0;
>>>       ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>>> -- 
>>> 2.34.1
>>>

