Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43355886;
	Thu, 30 May 2024 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717055003; cv=none; b=Mapk5yuGQktV7r4pkuIjcElIo3w1J6uGeTep7RYm+aPTGiVhZASm7EPQkh6royWs/O7255nBjvY/BDi4/Vo+BvTo6YLe8wX6o94YQ+F7Z/4nfDa8FPtvzUDSwLYYpkka2jxPE5swzZXNOHCDiOKgSpLoLOoMo7Xht1U4Q8wUUZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717055003; c=relaxed/simple;
	bh=oNJJ11ENx+WMZjobi6GIrYKXMhzMc273SSWi42nY6Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DlxX6Z6mChGFTtoohtg5bBMMKDQYe8cFNKkRhW9iG6h+tz3gKRhhDMuUwlxKrHrfb8CD9ippLGmYyehP6I/xvDlMgjTzsIzLY6adWHOihIhpHJYSBAQZxysHghcclLcsdd5n0GLMnNxzU3Vwo2O9Xxo6a6ONwqfbJiSP97rcrVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wV9dgpG7; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wV9dgpG7"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TNlAgZ026127;
	Thu, 30 May 2024 09:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4QyPR8FDRiyaoOXm3lR6AWDjZbHHST1J21PyvsDPG5E=; b=wV9dgpG7mTCii7J9
	Zo1SP1nG2/JNbrP+4O47gapc680bmAr8C44lZj+MyntWKawgZElT687QozlT/1Gm
	EWNmgME1mnS2FrWJyiJEQ0JRvrM2ppb9ovZGAj0QHkSJn/7RKhvth1v1SsQbsgKp
	gBuAqhhmSjsGKMt9biZblBAME17Eb5yFCU+Tir7QGiVA5opUZWhlboo5iQJreNCx
	YavHdggWSx5NlloR4Bx1ucsaPgvJx4hKK78UDbMSND8uLIDx67UfHmP1H5VzIvU5
	qGQxcQTTTVZVjNMTtrmyBA/JkUKkj/adeuOd9PiT+f3nira80fly+dZ+aqTS05yY
	4RyYFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yba5246k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 09:42:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74BC540046;
	Thu, 30 May 2024 09:42:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C122A2128B7;
	Thu, 30 May 2024 09:42:27 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 09:42:27 +0200
Received: from [10.252.16.204] (10.252.16.204) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 09:42:27 +0200
Message-ID: <5b3f8346-d6db-4da3-9613-20cf9f3c226b@foss.st.com>
Date: Thu, 30 May 2024 09:42:26 +0200
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
 <ZleReEIgD8O5zATO@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZleReEIgD8O5zATO@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_05,2024-05-28_01,2024-05-17_01

Hello Mathieu,

On 5/29/24 22:35, Mathieu Poirier wrote:
> On Wed, May 29, 2024 at 09:13:26AM +0200, Arnaud POULIQUEN wrote:
>> Hello Mathieu,
>>
>> On 5/28/24 23:30, Mathieu Poirier wrote:
>>> On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
>>>> 1) on start:
>>>> - Using the TEE loader, the resource table is loaded by an external entity.
>>>> In such case the resource table address is not find from the firmware but
>>>> provided by the TEE remoteproc framework.
>>>> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
>>>> - test that rproc->cached_table is not null before performing the memcpy
>>>>
>>>> 2)on stop
>>>> The use of the cached_table seems mandatory:
>>>> - during recovery sequence to have a snapshot of the resource table
>>>>   resources used,
>>>> - on stop to allow  for the deinitialization of resources after the
>>>>   the remote processor has been shutdown.
>>>> However if the TEE interface is being used, we first need to unmap the
>>>> table_ptr before setting it to rproc->cached_table.
>>>> The update of rproc->table_ptr to rproc->cached_table is performed in
>>>> tee_remoteproc.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
>>>>  1 file changed, 23 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index 42bca01f3bde..3a642151c983 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
>>>>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
>>>>  {
>>>>  	struct resource_table *loaded_table;
>>>> +	struct device *dev = &rproc->dev;
>>>>  
>>>>  	/*
>>>>  	 * The starting device has been given the rproc->cached_table as the
>>>> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
>>>>  	 * this information to device memory. We also update the table_ptr so
>>>>  	 * that any subsequent changes will be applied to the loaded version.
>>>>  	 */
>>>> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>>>> -	if (loaded_table) {
>>>> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>>>> -		rproc->table_ptr = loaded_table;
>>>> +	if (rproc->tee_interface) {
>>>> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
>>>> +		if (IS_ERR(loaded_table)) {
>>>> +			dev_err(dev, "can't get resource table\n");
>>>> +			return PTR_ERR(loaded_table);
>>>> +		}
>>>> +	} else {
>>>> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>>>>  	}
>>>>  
>>>> +	if (loaded_table && rproc->cached_table)
>>>> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>>>> +
>>>
>>> Why is this not part of the else {} above as it was the case before this patch?
>>> And why was an extra check for ->cached_table added?
>>
>> Here we have to cover 2 use cases if rproc->tee_interface is set.
>> 1) The remote processor is in stop state
>>      - loaded_table points to the resource table in the remote memory and
>>      -  rproc->cached_table is null
>>      => no memcopy
>> 2) crash recovery
>>      - loaded_table points to the resource table in the remote memory
>>      - rproc-cached_table point to a copy of the resource table
> 
> A cached_table exists because it was created in rproc_reset_rsc_table_on_stop().
> But as the comment says [1], that part of the code was meant to be used for the
> attach()/detach() use case.  Mixing both will become extremely confusing and
> impossible to maintain.

i am not sure to understand your point here... the cached_table table was
already existing for the "normal" case[2]. Seems to me that the cache table is
needed on stop in all scenarios.

[2]
https://elixir.bootlin.com/linux/v4.20.17/source/drivers/remoteproc/remoteproc_core.c#L1402

> 
> I think the TEE scenario should be as similar as the "normal" one where TEE is
> not involved.  To that end, I suggest to create a cached_table in
> tee_rproc_parse_fw(), exactly the same way it is done in
> rproc_elf_load_rsc_table().  That way the code path in
> rproc_set_rsc_table_on_start() become very similar and we have a cached_table to
> work with when the remote processor is recovered.  In fact we may not need
> rproc_set_rsc_table_on_start() at all but that needs to be asserted.

This is was I proposed in my V4 [3]. Could you please confirm that this aligns
with what you have in mind?
In such a case, should I keep the updates below in
rproc_reset_rsc_table_on_stop(), or should I revert to using rproc->rsc_table to
store the pointer to the resource table in tee_remoteproc for the associated
memory map/unmap?"

[3]
https://patchwork.kernel.org/project/linux-remoteproc/patch/20240308144708.62362-2-arnaud.pouliquen@foss.st.com/

Thanks,
Arnaud

> 
> [1]. https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/remoteproc/remoteproc_core.c#L1565
> 
>>      => need to perform the memcpy to reapply settings in the resource table
>>
>> I can duplicate the memcpy in if{} and else{} but this will be similar code
>> as needed in both case.
>> Adding rproc->cached_table test if proc->tee_interface=NULL seems also
>> reasonable as a memcpy from 0 should not be performed.
>>
>>
>>>
>>> This should be a simple change, i.e introduce an if {} else {} block to take
>>> care of the two scenarios.  Plus the comment is misplaced now. 
>>
>> What about split it in 2 patches?
>> - one adding the test on rproc->cached_table for the memcpy
>> - one adding the if {} else {}?
>>
>> Thanks,
>> Arnaud
>>
>>
>>>
>>> More comments tomorrow.
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +	rproc->table_ptr = loaded_table;
>>>> +
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>>>>  	kfree(rproc->clean_table);
>>>>  
>>>>  out:
>>>> -	/*
>>>> -	 * Use a copy of the resource table for the remainder of the
>>>> -	 * shutdown process.
>>>> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
>>>> +	 * before updating the proc->table_ptr reference.
>>>>  	 */
>>>> -	rproc->table_ptr = rproc->cached_table;
>>>> +	if (!rproc->tee_interface) {
>>>> +		/*
>>>> +		 * Use a copy of the resource table for the remainder of the
>>>> +		 * shutdown process.
>>>> +		 */
>>>> +		rproc->table_ptr = rproc->cached_table;
>>>> +	}
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -- 
>>>> 2.25.1
>>>>
