Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF392206A5;
	Fri,  6 Dec 2024 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733508668; cv=none; b=bCI7aWZ0M86VvdT1UB3AUbOhR7Iz2DRnU6Fi4GxbomhrPQMHS6aNv/FSGhEvqjVEabqsYAL77sYI0rfB/4NutehxS7VS0GWiF9nLk40z8oBHl0lsYMriTvK3SelMY5QESp7UVNmXVwWsMVrTtMniLZsEAWk2w/BINPpvs0gWjFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733508668; c=relaxed/simple;
	bh=NnCOgIiKMBBErD+BRZBxEg9hZBjvYY/SURqi5oqSoAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mNoBtwV7WQ9Lc9iPdlT18x2/uB1cg+f42vujiJzmjIRdQEFsE5kINWtQPDlx5X6iANOGtx/OWjoa5UBsg3mIjqobxpIjLuk4ZzdBvuQABPUgyqnigFWjhzER0nvTIC8MLO9xaQOMZZMUu80BpoH5nXiOvorf1zQz/s245NDd71g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kpoh88CL; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kpoh88CL"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6BkREV019566;
	Fri, 6 Dec 2024 19:10:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Olm0a9pqR03S3xDSjZQGHTBUSCauGAnpTAw/IMPyBwI=; b=kpoh88CLzQgCnCd/
	F3TYjGlKGp3VlffGQW2dmsJA79swy2ZOP4QoOvHtuttl7QWy49RHvLRTzvnio8Tl
	A8km7lN7HtjEhMyyCgHUQUDLWbhM3AgHjEtfpkgb/ZQ26goHXj7FZVK+N13cInBk
	1Z/FksCs0Q+A2jwbHXwGLE90X2SXOqPPt+Jef9IgTQl/Y6oqLISDMGiX0YFyDqBf
	AcZHf5o6JTcty7BJ+fkHJsaW86WbysylZdm9/KbFe6+XyRwC3ccxi5s1lXvGh6TV
	zZMhcs8N/QsECjgrGd0VmTCDFwFVSh/Jq5iJcc7NYhoQabSo+d6Nflbc2LH0L33/
	hAvVgA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43c0pjhda3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 19:10:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BE5B34004F;
	Fri,  6 Dec 2024 19:10:04 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A90C32A66F9;
	Fri,  6 Dec 2024 19:09:47 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 6 Dec
 2024 19:09:47 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 6 Dec
 2024 19:09:47 +0100
Message-ID: <b22c0e6c-4988-430f-a544-479152e1fca8@foss.st.com>
Date: Fri, 6 Dec 2024 19:09:46 +0100
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
 <Z08+UnATLQQ6kmaD@p14s> <1b7c8c21-37bc-4a1a-91bb-1d736d900f00@foss.st.com>
 <CANLsYkxk0NdKmbzOPEcVHbVpW9hPEz0gS-+9PysWMULDMxbkxw@mail.gmail.com>
 <CANLsYkxqoN+CT6f=FHVsb_POgP9X8pp6-B+kQbybAU6qGMd5=w@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <CANLsYkxqoN+CT6f=FHVsb_POgP9X8pp6-B+kQbybAU6qGMd5=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



On 12/6/24 18:07, Mathieu Poirier wrote:
> On Fri, 6 Dec 2024 at 10:05, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>>
>> On Thu, 5 Dec 2024 at 11:22, Arnaud POULIQUEN
>> <arnaud.pouliquen@foss.st.com> wrote:
>>>
>>> Hello Mathieu,
>>>
>>> Thanks for the review!
>>> I just need to clarify a point below before preparing the next revision.
>>>
>>> On 12/3/24 18:22, Mathieu Poirier wrote:
>>>> On Thu, Nov 28, 2024 at 09:42:10AM +0100, Arnaud Pouliquen wrote:
>>>>> This patch updates the rproc_ops structures to include two new optional
>>>>> operations.
>>>>>
>>>>> - The load_fw() op is responsible for loading the remote processor
>>>>> non-ELF firmware image before starting the boot sequence. This ops will
>>>>> be used, for instance, to call OP-TEE to  authenticate an load the firmware
>>>>> image before accessing to its resources (a.e the resource table)
>>>>>
>>>>> - The release_fw op is responsible for releasing the remote processor
>>>>> firmware image. For instance to clean memories.
>>>>> The ops is called in the following cases:
>>>>>  - An error occurs between the loading of the firmware image and the
>>>>>    start of the remote processor.
>>>>>  - after stopping the remote processor.
>>>>>
>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>> ---
>>>>> Update vs version V13:
>>>>> - Rework the commit to introduce load_fw() op.
>>>>> - remove rproc_release_fw() call from  rproc_start() as called in
>>>>>   rproc_boot() and rproc_boot_recovery() in case of error.
>>>>> - create rproc_load_fw() and rproc_release_fw() internal functions.
>>>>> ---
>>>>>  drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
>>>>>  drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
>>>>>  include/linux/remoteproc.h               |  6 ++++++
>>>>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>> index ace11ea17097..8df4b2c59bb6 100644
>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>> @@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>>>>      kfree(rproc->cached_table);
>>>>>      rproc->cached_table = NULL;
>>>>>      rproc->table_ptr = NULL;
>>>>> +    rproc_release_fw(rproc);
>>>>
>>>> This is not needed since rproc_release_fw() is called in rproc_boot().
>>>>
>>>>>  unprepare_rproc:
>>>>>      /* release HW resources if needed */
>>>>>      rproc_unprepare_device(rproc);
>>>>> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>>>>              return ret;
>>>>>      }
>>>>>
>>>>> +    ret = rproc_load_fw(rproc, firmware_p);
>>>>> +    if (ret)
>>>>> +            return ret;
>>>>> +
>>>>>      /* boot the remote processor up again */
>>>>>      ret = rproc_start(rproc, firmware_p);
>>>>> +    if (ret)
>>>>> +            rproc_release_fw(rproc);
>>>>>
>>>>>      release_firmware(firmware_p);
>>>>>
>>>>> @@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
>>>>>                      goto downref_rproc;
>>>>>              }
>>>>>
>>>>> +            ret = rproc_load_fw(rproc, firmware_p);
>>>>> +            if (ret)
>>>>> +                    goto downref_rproc;
>>>>
>>>> In case of error the firmware is not released.
>>>
>>> I considered that if the load fails, the firmware is not loaded
>>> and therefore does not need to be released.
>>> In other words, in case of a load error in OP-TEE, OP-TEE should
>>> perform the cleanup to return to its initial state before the load.
>>>
>>> Do you see a use case where we should force the release in Linux?
>>> Otherwise, I would propose to implement this behavior later if needed.
>>>
>>
>> I'm talking about release_firmware() - it is not called if
>> rproc_load_fw(), and it needs to.
> 
> Take 2: I'm talking about release_firwware() - it is not called if
> rproc_load_fw() fails and it needs to.


I completely missed that, and moreover, there is the same error in
trproc_boot_recovery() :(

Thanks!
Arnaud

> 
>>
>>> Thanks,
>>> Arnaud
>>>
>>>>
>>>>> +
>>>>>              ret = rproc_fw_boot(rproc, firmware_p);
>>>>> +            if (ret)
>>>>> +                    rproc_release_fw(rproc);
>>>>>
>>>>>              release_firmware(firmware_p);
>>>>>      }
>>>>> @@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
>>>>>      kfree(rproc->cached_table);
>>>>>      rproc->cached_table = NULL;
>>>>>      rproc->table_ptr = NULL;
>>>>> +    rproc_release_fw(rproc);
>>>>
>>>> Please move this after rproc_disable_iommu().
>>>>
>>>>
>>>>>  out:
>>>>>      mutex_unlock(&rproc->lock);
>>>>>      return ret;
>>>>> @@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>>>>>      if (!rproc->ops->coredump)
>>>>>              rproc->ops->coredump = rproc_coredump;
>>>>>
>>>>> -    if (rproc->ops->load)
>>>>> +    if (rproc->ops->load || rproc->ops->load_fw)
>>>>>              return 0;
>>>>>
>>>>>      /* Default to ELF loader if no load function is specified */
>>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>>> index 0cd09e67ac14..2104ca449178 100644
>>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>>> @@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
>>>>>      return (val <= (size_t) -1);
>>>>>  }
>>>>>
>>>>> +static inline void rproc_release_fw(struct rproc *rproc)
>>>>> +{
>>>>> +    if (rproc->ops->release_fw)
>>>>> +            rproc->ops->release_fw(rproc);
>>>>> +}
>>>>> +
>>>>> +static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
>>>>> +{
>>>>> +    if (rproc->ops->load_fw)
>>>>> +            return rproc->ops->load_fw(rproc, fw);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>  #endif /* REMOTEPROC_INTERNAL_H */
>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>> index 2e0ddcb2d792..ba6fd560f7ba 100644
>>>>> --- a/include/linux/remoteproc.h
>>>>> +++ b/include/linux/remoteproc.h
>>>>> @@ -381,6 +381,10 @@ enum rsc_handling_status {
>>>>>   * @panic:  optional callback to react to system panic, core will delay
>>>>>   *          panic at least the returned number of milliseconds
>>>>>   * @coredump:         collect firmware dump after the subsystem is shutdown
>>>>> + * @load_fw:        optional function to load non-ELF firmware image to memory, where the remote
>>>>
>>>> Round this down to 80 characters please.  Here having a longer line doesn't
>>>> improve readability.
>>>>
>>>>> + *          processor expects to find it.
>>>>> + * @release_fw:     optional function to release the firmware image from memories.
>>>>> + *          This function is called after stopping the remote processor or in case of error
>>>>
>>>> Same.
>>>>
>>>> More comments tomorrow or later during the week.
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>>   */
>>>>>  struct rproc_ops {
>>>>>      int (*prepare)(struct rproc *rproc);
>>>>> @@ -403,6 +407,8 @@ struct rproc_ops {
>>>>>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>>>>>      unsigned long (*panic)(struct rproc *rproc);
>>>>>      void (*coredump)(struct rproc *rproc);
>>>>> +    int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
>>>>> +    void (*release_fw)(struct rproc *rproc);
>>>>>  };
>>>>>
>>>>>  /**
>>>>> --
>>>>> 2.25.1
>>>>>
