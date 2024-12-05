Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C921C199;
	Thu,  5 Dec 2024 18:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422929; cv=none; b=lEFgflj4/2A6I3pWNVibf8aTZisd+S687dvqhGxokXNLacJofJ+lIWw3rjfkne0pI5P1AcCLxooFZ3AY+uVIjjg2DJFDgaX9WsIevBTZfq+49IGI3naPhWpV2zOemd3RIvTNtArNDQnGa493IF3tUF9Lx827PyaEGGJNttuMHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422929; c=relaxed/simple;
	bh=ukX19/Ajca4hFBTbYCcOWhDG9KYzB+th1Gi6FvWuOvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Irnt5fPgJxHnW3Yp2D0DOePSTpmzOV84BmmyNAurf5indaUuC0YPga8EZdUgBtg8ILgX05MKPW/2DEEd/DXu1M9oJ/4y71VtcfbQ2c0decRWlqis1krMSI6R75gGzVAzkOvK+G6NTQJaxp7TpQ8Cp07dpIjGX++2A+2x6O+wGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DLaNp24k; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DLaNp24k"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5GBVHn026701;
	Thu, 5 Dec 2024 19:22:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	GrwrNX1cZ6QPNKB2X9oLiCJwNIpS0he1IbpZ0KohnIE=; b=DLaNp24kVB1OGBNe
	aSM1n6MRKobaDSnWJ2gLn40pKrDs8Ww0lDqmvycwy4uK5L8mfyrSLKm1s9zlHBaF
	FXizS2r7hvHltYqIh8LqolUJ1ueqIHvyLZ78LU+7mNwN7JJF4ce8GXQF1kxa1/Kh
	1f8FPcium7ZDZd5CuvERiokHOFKtnCY4CPs7hwH72f+kSmAz4rGrgg8N3WDRNVZ4
	yxu3BKu0tdlQspB5nQbTctLG6hrYMaPtqhChE4h/6u5l7M85b6I8EsglqOlx8AEH
	s8onZUpP8/JhXMWA1pk2H8lx+E4T8MwYZ66rbZP5R14UWQojZ8/fJOkRbGH/sqp0
	npbZYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 438ehp60mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 19:22:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6AEEE40044;
	Thu,  5 Dec 2024 19:21:15 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F99626DDBB;
	Thu,  5 Dec 2024 19:21:00 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 19:20:59 +0100
Received: from [10.252.23.89] (10.252.23.89) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 19:20:59 +0100
Message-ID: <1b7c8c21-37bc-4a1a-91bb-1d736d900f00@foss.st.com>
Date: Thu, 5 Dec 2024 19:20:50 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com>
 <Z08+UnATLQQ6kmaD@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <Z08+UnATLQQ6kmaD@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Mathieu,

Thanks for the review!
I just need to clarify a point below before preparing the next revision.

On 12/3/24 18:22, Mathieu Poirier wrote:
> On Thu, Nov 28, 2024 at 09:42:10AM +0100, Arnaud Pouliquen wrote:
>> This patch updates the rproc_ops structures to include two new optional
>> operations.
>>
>> - The load_fw() op is responsible for loading the remote processor
>> non-ELF firmware image before starting the boot sequence. This ops will
>> be used, for instance, to call OP-TEE to  authenticate an load the firmware
>> image before accessing to its resources (a.e the resource table)
>>
>> - The release_fw op is responsible for releasing the remote processor
>> firmware image. For instance to clean memories.
>> The ops is called in the following cases:
>>  - An error occurs between the loading of the firmware image and the
>>    start of the remote processor.
>>  - after stopping the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Update vs version V13:
>> - Rework the commit to introduce load_fw() op.
>> - remove rproc_release_fw() call from  rproc_start() as called in
>>   rproc_boot() and rproc_boot_recovery() in case of error.
>> - create rproc_load_fw() and rproc_release_fw() internal functions.
>> ---
>>  drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
>>  drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
>>  include/linux/remoteproc.h               |  6 ++++++
>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index ace11ea17097..8df4b2c59bb6 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>>  	rproc->table_ptr = NULL;
>> +	rproc_release_fw(rproc);
> 
> This is not needed since rproc_release_fw() is called in rproc_boot().
> 
>>  unprepare_rproc:
>>  	/* release HW resources if needed */
>>  	rproc_unprepare_device(rproc);
>> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  		return ret;
>>  	}
>>  
>> +	ret = rproc_load_fw(rproc, firmware_p);
>> +	if (ret)
>> +		return ret;
>> +
>>  	/* boot the remote processor up again */
>>  	ret = rproc_start(rproc, firmware_p);
>> +	if (ret)
>> +		rproc_release_fw(rproc);
>>  
>>  	release_firmware(firmware_p);
>>  
>> @@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
>>  			goto downref_rproc;
>>  		}
>>  
>> +		ret = rproc_load_fw(rproc, firmware_p);
>> +		if (ret)
>> +			goto downref_rproc;
> 
> In case of error the firmware is not released.

I considered that if the load fails, the firmware is not loaded
and therefore does not need to be released.
In other words, in case of a load error in OP-TEE, OP-TEE should
perform the cleanup to return to its initial state before the load.

Do you see a use case where we should force the release in Linux?
Otherwise, I would propose to implement this behavior later if needed.

Thanks,
Arnaud

> 
>> +
>>  		ret = rproc_fw_boot(rproc, firmware_p);
>> +		if (ret)
>> +			rproc_release_fw(rproc);
>>  
>>  		release_firmware(firmware_p);
>>  	}
>> @@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>>  	rproc->table_ptr = NULL;
>> +	rproc_release_fw(rproc);
> 
> Please move this after rproc_disable_iommu().
> 
> 
>>  out:
>>  	mutex_unlock(&rproc->lock);
>>  	return ret;
>> @@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>>  	if (!rproc->ops->coredump)
>>  		rproc->ops->coredump = rproc_coredump;
>>  
>> -	if (rproc->ops->load)
>> +	if (rproc->ops->load || rproc->ops->load_fw)
>>  		return 0;
>>  
>>  	/* Default to ELF loader if no load function is specified */
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 0cd09e67ac14..2104ca449178 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
>>  	return (val <= (size_t) -1);
>>  }
>>  
>> +static inline void rproc_release_fw(struct rproc *rproc)
>> +{
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>> +}
>> +
>> +static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	if (rproc->ops->load_fw)
>> +		return rproc->ops->load_fw(rproc, fw);
>> +
>> +	return 0;
>> +}
>> +
>>  #endif /* REMOTEPROC_INTERNAL_H */
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 2e0ddcb2d792..ba6fd560f7ba 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -381,6 +381,10 @@ enum rsc_handling_status {
>>   * @panic:	optional callback to react to system panic, core will delay
>>   *		panic at least the returned number of milliseconds
>>   * @coredump:	  collect firmware dump after the subsystem is shutdown
>> + * @load_fw:	optional function to load non-ELF firmware image to memory, where the remote
> 
> Round this down to 80 characters please.  Here having a longer line doesn't
> improve readability.
> 
>> + *		processor expects to find it.
>> + * @release_fw:	optional function to release the firmware image from memories.
>> + *		This function is called after stopping the remote processor or in case of error
> 
> Same.
> 
> More comments tomorrow or later during the week.
> 
> Thanks,
> Mathieu
> 
>>   */
>>  struct rproc_ops {
>>  	int (*prepare)(struct rproc *rproc);
>> @@ -403,6 +407,8 @@ struct rproc_ops {
>>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>>  	unsigned long (*panic)(struct rproc *rproc);
>>  	void (*coredump)(struct rproc *rproc);
>> +	int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
>> +	void (*release_fw)(struct rproc *rproc);
>>  };
>>  
>>  /**
>> -- 
>> 2.25.1
>>
