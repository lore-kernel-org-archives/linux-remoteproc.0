Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523AE17580;
	Tue, 10 Dec 2024 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733826885; cv=none; b=FYdCe1fMZoI/SLoKk2W0mxzPBiBdZpJWekfsDF2rLU1eERZktsb+s9Cc/Y/UbqL+h6M7IWeWSDREDr04jbpvu7A7NHICyEPlY6OW9BIpfEs2d2VMLLJ6PnskJ0nHvqYvMWjtrm5qBNqLKaonsaPtVFqneN/F8hl0IVmjLnrSVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733826885; c=relaxed/simple;
	bh=Nl130zMyT6lEMjvMOZEO65O3vtrgDaTWFueQpoaFY88=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JqvfDBLzMElmWIENKQ4M2E5xxAwc4C+GuKGF27UhlZk42FfIrVsTNIrL/zbkR4PDjER3EaQl7U9zxIBtrjGmlg1viSlgoazivpPY0IV33brnOP5s/4VVLcj47nk/th+XD0QZtQwrH4+3X8/D71fDJ4U4CoRqlqbZOrYcUUz7u8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jtpE2uzq; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jtpE2uzq"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAACtBT022402;
	Tue, 10 Dec 2024 11:34:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5AUqyoGSkf9r8/Q3Kt2TBiaYLw/48j9YljWQXjn/bHk=; b=jtpE2uzqJDaSPA5p
	t94mhVifyhQcjbNEjUXtxjShPz5aiZPeKnCL0nB5UCvCzabb/vdoPrZPLjLFzcXC
	m9AhN5oVP0jjbUDdOiiKMxB/xpvnC+ip4QdVqZ/FRxgx4HTrtRnjnzbt0W0Hl/xr
	TNsQrYlVmxbQIp/y0NNsBkE1kQodgrcjMFnUWXLeEjh4bDYtThCrgWwJIp4MhA5p
	8RN1oVlEiPMDgQtGvbfa2ZYKRBybzwChExR+oQcauXILGII91wi7svonERkH5gjp
	7MMTL3tIpDFGB2Ra9e8nHc0BxbeFtHHWtMvi3PSBHyjNNAXmLOCWtWv8GCgP7it0
	58iXXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d26n9ka3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:34:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C306B4004B;
	Tue, 10 Dec 2024 11:33:49 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7A56242474;
	Tue, 10 Dec 2024 11:33:32 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 11:33:32 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 11:33:32 +0100
Message-ID: <a8654e63-ff92-4d11-a3f5-75626e6dc6fe@foss.st.com>
Date: Tue, 10 Dec 2024 11:33:31 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
To: Bjorn Andersson <andersson@kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com>
 <adqulwb54wvn36mnjq7u23qdiyapadr3ruhqluxab7mg3kowz5@4rexefd5mlwp>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <adqulwb54wvn36mnjq7u23qdiyapadr3ruhqluxab7mg3kowz5@4rexefd5mlwp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



On 12/10/24 00:14, Bjorn Andersson wrote:
> On Thu, Nov 28, 2024 at 09:42:10AM GMT, Arnaud Pouliquen wrote:
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
> 
> Why does this difference need to be encoded in rproc_ops? I think we
> should strive for having a single, simple high level flow of operations
> through the remoteproc core for which the specifics of each remoteproc
> instance can be encoded in that driver.
> 
> 
> Perhaps there's a good reason for this, but if so please read and follow
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> to make that reasoning clear in the commit message.
> 

The actual sequence to load a remoteproc firmware is
- get firmware from file system and store the firmware image in Linux kernel memory
- get resource table from the firmware image and make a copy(
- parse the resource table and handle the resources
- load the firmware
- start the firmware


In OP-TEE we support not only one ELF image but n images (for instance a TF-M +
a zephyr), the segments can be encrypted the OP-TEE load sequence is
 - copy header and meta data of the signed image in a secure memory
 - verify it
 - copy segments in remote processor memory and authenticate segments in place.
 - optionally decrypt the segments

Only at this step the resource table as been authenticated (and decrypted)

So the point is that we need to load the firmware before getting the resource table


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
>>  unprepare_rproc:
>>  	/* release HW resources if needed */
>>  	rproc_unprepare_device(rproc);
>> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  		return ret;
>>  	}
>>  
>> +	ret = rproc_load_fw(rproc, firmware_p);
> 
> It is not clear to me why in the case of OP-TEE we need to invoke the
> "load operation" here, and in the case of "legacy" ELF loading we do it
> first thing in rproc_start() (i.e. on the very next line of code being
> executed).

For the OP-TEE, please refer to my comment above.

The only reason I can see for the legacy ELF is that the resource table could
contain information to be able to configure some resources to load the firmware.
In case of OP-TEE this would be managed in OP-TEE.

> 
> 
> Should we start by renaming rproc_load_segments() rproc_load() and move
> it out of rproc_start()? (I.e. here?)
> 
> Perhaps define that rproc_load() is responsible for "loading firmware"
> (whatever that means) and establishing rproc->cached_table, and
> rproc->table_ptr?
> 
> (Note that this seems like a good cleanup of the spaghetti regardless)
> 

It's something that crossed my mind, but I don't know the legacy well enough to
guarantee that it will work in all drivers.

If you want to go in this direction, perhaps this is something that could be
addressed in a dedicated pull request? In this case, the ops could become
load_fw and load_fw_new, similar to how it is done for platform_driver::remove.


>> +	if (ret)
>> +		return ret;
>> +
>>  	/* boot the remote processor up again */
>>  	ret = rproc_start(rproc, firmware_p);
>> +	if (ret)
>> +		rproc_release_fw(rproc);
> 
> The fact that you rproc_release_fw() in the error path here, right
> before we unconditionally release_firmware() the actual firmware means
> that you have 2 different life cycles with very very similar names.
> 
> This will contain bugs, sooner or later.

So we need to find a better way for the ops if we continue in this direction.
What about introducing rproc_load_new and rproc_release?

> 
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
>> + *		processor expects to find it.
> 
> Why does it matter if it's an ELF or not?

No matter. It was more to differentiate from the legacy one, but it does not
make sense and adds to the argument that the ops naming is not accurate.

> 
> In the Qualcomm case, firmware comes in ELF format, Linux loads the
> LOAD segments and the trusted world then authenticates the content and
> start the remote processor.
> 
> 
> I think the difference in your case is that you have memory reserved
> elsewhere, and you want the "load" operation to pass the firmware to the
> TEE - which means that you need rproc_release_fw() to eventually clean
> up the state if rproc_start() fails - and upon shutdown.

Yes the OP-TEE is make more stuff:
- authenticate several firmware images
- decrypt images if encrypted
- ensure that the load is done in granted memories
- manage the memory access rights to enure that the code and data memory
 is never accessible by the Linux.

> 
> If we improve the definition of rproc_load_segments() to mean
> "remoteproc (or remoteproc driver) is loading segments", then in your
> case there's no "loading" operation in Linux. Instead you make that a
> nop and invoke LOAD_FW and START_FW within your start callback, then you
> can clean up the remnant state within your driver's start and stop
> callbacks - without complicating the core framework.

This would not work as I need to load the firmware before calling
rproc_handle_resources().

I can not use rproc_prepare_device() as it is not called on recovery

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> + * @release_fw:	optional function to release the firmware image from memories.
>> + *		This function is called after stopping the remote processor or in case of error
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
