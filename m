Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC559B4A;
	Mon,  3 Jun 2024 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402955; cv=none; b=ItmYGYFSVQWL14KpDrUTgS1FKVAbeQys8Dhyy+eCl7md9RfJJfuanhPvBhd8A/0Sm2GPYKdrkzwkVqydzAXoyVg+v8e4dWvNg+g1YJUjMh3s/Dr78C0RbQ/p03Hfg1N4xWhvh4Ea3q3AZEyMc7OYUF+i85aNwGW2bO6ywwRZ2uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402955; c=relaxed/simple;
	bh=Sp+UwLPoUXiBhlBsK2hz+NdnP6tUiqoG0AQZwQrbotQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b38nja/KtjAMFLclW15z3QszDyPUrJbNKdiFYieBJhAcC7UNK3wCMijcr6O44KSIPyWUDoIkrRPwcj4y+k/04hCLCNKXi26Maux0vV8hF81YvStFK4Fj60Jr/52rJogdtaMMmeoUDbGr4ZmsK2bodofVcvYprxjGFQAwxOpyCjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=sm9IXnWd; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="sm9IXnWd"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45383Bvp005063;
	Mon, 3 Jun 2024 10:22:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QNs1QDg5zABNVZiubdYlhkkNfBlcOYTXl8ydHq4gR7g=; b=sm9IXnWdcyEEORui
	k9CEnAmG6fXNYODiuDDG5R1qgmONWFIQfNSwE7obgCoavoSiw/b9MaDUZy6hzXMi
	8ypo9AIJnyJAdSTC6TR17uhgP1RwahOSWian3xDXGn9oDSxfgeBR/+82iWkAeezf
	FBd7pl07XaDpFv7SOzzQLfJAkMbiK0+po+6ffkb3q42Q88EQVTdmyB+9t2CWRXDA
	Z1dpIf4r4ZckDNoxFq8LLIO2+TKwDqabv1zUDwnzoGpfrJULwEqpe0rUxwkVnkdb
	8F4he6p1eeMRqZqozcCvX29NNB5/DuSHpqfAdXk5DS+XIi3Utt+z6EBY8j6Y6bpe
	ltt/mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw9159cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 10:22:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1E66840045;
	Mon,  3 Jun 2024 10:22:03 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57D8D2138F1;
	Mon,  3 Jun 2024 10:21:43 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 10:21:43 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 10:21:42 +0200
Message-ID: <047e31c6-1b6d-4792-a913-4197e2e53b32@foss.st.com>
Date: Mon, 3 Jun 2024 10:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] remoteproc: core: support of the tee interface
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
 <ZlZM/hgSO4EeRVqS@p14s> <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
 <ZleReEIgD8O5zATO@p14s> <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com>
 <ZloIwfFwkpKYLU9k@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZloIwfFwkpKYLU9k@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_04,2024-05-30_01,2024-05-17_01

Hello Mathieu,

On 5/31/24 19:28, Mathieu Poirier wrote:
> On Thu, May 30, 2024 at 09:42:26AM +0200, Arnaud POULIQUEN wrote:
>> Hello Mathieu,
>>
>> On 5/29/24 22:35, Mathieu Poirier wrote:
>>> On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
>>>> Hello Mathieu,
>>>>
>>>> On 5/28/24 23:30, Mathieu Poirier wrote:
>>>>> On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
>>>>>> 1) on start:
>>>>>> - Using the TEE loader, the resource table is loaded by an external entity.
>>>>>> In such case the resource table address is not find from the firmware but
>>>>>> provided by the TEE remoteproc framework.
>>>>>> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
>>>>>> - test that rproc->cached_table is not null before performing the memcpy
>>>>>>
>>>>>> 2)on stop
>>>>>> The use of the cached_table seems mandatory:
>>>>>> - during recovery sequence to have a snapshot of the resource table
>>>>>>   resources used,
>>>>>> - on stop to allow  for the deinitialization of resources after the
>>>>>>   the remote processor has been shutdown.
>>>>>> However if the TEE interface is being used, we first need to unmap the
>>>>>> table_ptr before setting it to rproc->cached_table.
>>>>>> The update of rproc->table_ptr to rproc->cached_table is performed in
>>>>>> tee_remoteproc.
>>>>>>
>>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>>> ---
>>>>>>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
>>>>>>  1 file changed, 23 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>>> index 42bca01f3bde..3a642151c983 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
>>>>>>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
>>>>>>  {
>>>>>>  	struct resource_table *loaded_table;
>>>>>> +	struct device *dev = &rproc->dev;
>>>>>>  
>>>>>>  	/*
>>>>>>  	 * The starting device has been given the rproc->cached_table as the
>>>>>> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
>>>>>>  	 * this information to device memory. We also update the table_ptr so
>>>>>>  	 * that any subsequent changes will be applied to the loaded version.
>>>>>>  	 */
>>>>>> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>>>>>> -	if (loaded_table) {
>>>>>> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>>>>>> -		rproc->table_ptr = loaded_table;
>>>>>> +	if (rproc->tee_interface) {
>>>>>> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
>>>>>> +		if (IS_ERR(loaded_table)) {
>>>>>> +			dev_err(dev, "can't get resource table\n");
>>>>>> +			return PTR_ERR(loaded_table);
>>>>>> +		}
>>>>>> +	} else {
>>>>>> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>>>>>>  	}
>>>>>>  
>>>>>> +	if (loaded_table && rproc->cached_table)
>>>>>> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>>>>>> +
>>>>>
>>>>> Why is this not part of the else {} above as it was the case before this patch?
>>>>> And why was an extra check for ->cached_table added?
>>>>
>>>> Here we have to cover 2 use cases if rproc->tee_interface is set.
>>>> 1) The remote processor is in stop state
>>>>      - loaded_table points to the resource table in the remote memory and
>>>>      -  rproc->cached_table is null
>>>>      => no memcopy
>>>> 2) crash recovery
>>>>      - loaded_table points to the resource table in the remote memory
>>>>      - rproc-cached_table point to a copy of the resource table
>>>
>>> A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
>>> But as the comment says [1], that part of the code was meant to be used for the
>>> attach()/detach() use case.  Mixing both will become extremely confusing and
>>> impossible to maintain.
>>
>> i am not sure to understand your point here... the cached_table table was
>> already existing for the "normal" case[2]. Seems to me that the cache table is
>> needed on stop in all scenarios.
>>
>> [2]
>> https://elixir.bootlin.com/linux/v4.20.17/source/drivers/remoteproc/remoteproc_core.c#L1402
>>
>>>
>>> I think the TEE scenario should be as similar as the "normal" one where TEE is
>>> not involved.  To that end, I suggest to create a cached_table in
>>> tee_rproc_parse_fw(), exactly the same way it is done in
>>> rproc_elf_load_rsc_table().  That way the code path in
>>> rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
>>> work with when the remote processor is recovered.  In fact we may not need
>>> rproc_set_rsc_table_on_start() at all but that needs to be asserted.
>>
>> This is was I proposed in my V4 [3]. Could you please confirm that this aligns
>> with what you have in mind?
> 
> After spending more time on this I have the following 3 observations:
> 
> 1) We need a ->cached_table, otherwise the crash recovery path gets really
> messy.
> 
> 2) It _might_ be a good idea to rename tee_rproc_get_loaded_rsc_table() to
> tee_rproc_find_loaded_rsc_table() to be aligned with the scenario where the
> firmware is loaded by the remoteproc core.  I think you had
> tee_rproc_find_loaded_rsc_table() in the first place and I asked you to change
> it.  If so, apologies - reviewing patches isn't an exact science.
> 
> 3) The same way ->cached_table is created in rproc_elf_load_rsc_table(), which
> is essentially ops::parse_fw(), we should create one in tee_rproc_parse_fw()
> with a kmemdup().  Exactly the same as in rproc_elf_load_rsc_table().  In
> tee_rproc_parse_fw(), @rsc_table should be iounmap'ed right away so that we
> don't need to keep a local variable to free it later.  In rproc_start() the call
> to rproc_find_loaded_rsc_table() will get another mapped handle to the resource
> table in memory.  It might be a little unefficient but it sure beats doing a lot
> of modifications in the core.

Remapping the resource table in rproc_find_loaded_rsc_table will require that we
unmap it on rproc_stop before updating rproc->table_ptr to rproc->cached_table.

On the other hand, I wonder if declaring the memory region in the stm32-rproc DT
node would address this second mapping and avoid a map in
rproc_find_loaded_rsc_table().

I will do the V6 integrating your suggestions and having a deeper look on the
resource table map/unmap.

> 
> As I said above this isn't an exact science and we may need to changes more
> things but at least it should take us a little further.

That seems to me reasonable and part of the normal upstream process :)


Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
>> In such a case, should I keep the updates below in
>> rproc_reset_rsc_table_on_stop(), or should I revert to using rproc->rsc_table to
>> store the pointer to the resource table in tee_remoteproc for the associated
>> memory map/unmap?"
>>
>> [3]
>> https://patchwork.kernel.org/project/linux-remoteproc/patch/20240308144708.62362-2-arnaud.pouliquen@foss.st.com/
>>
>> Thanks,
>> Arnaud
>>
>>>
>>> [1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565
>>>
>>>>      => need to perform the memcpy to reapply settings in the resource table
>>>>
>>>> I can duplicate the memcpy in if{} and else{} but this will be similar code
>>>> as needed in both case.
>>>> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
>>>> reasonable as a memcpy from 0 should not be performed.
>>>>
>>>>
>>>>>
>>>>> This should be a simple change, i.e introduce an if {} else {} block to take
>>>>> care of the two scenarios.  Plus the comment is misplaced now. 
>>>>
>>>> What about split it in 2 patches?
>>>> - one adding the test on rproc->cached_table for the memcpy
>>>> - one adding the if {} else {}?
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>
>>>>>
>>>>> More comments tomorrow.
>>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>
>>>>>> +	rproc->table_ptr = loaded_table;
>>>>>> +
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>>>>>>  	kfree(rproc->clean_table);
>>>>>>  
>>>>>>  out:
>>>>>> -	/*
>>>>>> -	 * Use a copy of the resource table for the remainder of the
>>>>>> -	 * shutdown process.
>>>>>> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
>>>>>> +	 * before updating the proc->table_ptr reference.
>>>>>>  	 */
>>>>>> -	rproc->table_ptr = rproc->cached_table;
>>>>>> +	if (!rproc->tee_interface) {
>>>>>> +		/*
>>>>>> +		 * Use a copy of the resource table for the remainder of the
>>>>>> +		 * shutdown process.
>>>>>> +		 */
>>>>>> +		rproc->table_ptr = rproc->cached_table;
>>>>>> +	}
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
