Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495922331E;
	Wed,  5 Mar 2025 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179039; cv=none; b=UTUpWieXz0FxG3skkSvJBSQZeBw5kQHUf8iloCJRvHtPvtaEOJpnYOCvZZKJS0a5xYClUZta3f2w0hkEq+nJeMeRhgIzZt1BUMxKfzCktdvglpixsf4RxNIEHEBCA7LXO+9tBzINLgj0mMFn/6Be76AWPjzsVt55Suflr+IxlMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179039; c=relaxed/simple;
	bh=ZQU2Y+Y14/DyhMHnu1mXojjEgLsazf214u+C+LanRiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZOd4DFSNREmts1K2+mElGJaW9OxZPQyTt5tBATdGzSGC7pNQXOe5UB1b16G2GJLig51734eMCgScpiLkZGYVKeQg+u8soaCauS/wuwDu4IzTPeAPqfgkQbfMFokeD+A24Rnr0R7WtkN61GKpA+nu0Nm54Pi67+UoWbDlW502O/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KtjohfDG; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KtjohfDG"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525Cbhuq027802;
	Wed, 5 Mar 2025 13:50:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	h9j7PBk0K9EtoefJS48n7QgSfHh1wLCHIGHWBS9GvbQ=; b=KtjohfDGHfavfh6t
	lN47wLyD0wTdV7xhh8D8MMSsQ+eYLnaaqGjovULcFNUHiKaMLuns5guA6vfmK4ZM
	itLrMQwEUPcNI2bk786JS9MAmGs1nR9r353+ic3gXWJfspLq3WUGmdm+vyXaD15c
	ldLmRXSbHjVlYrEC4CktbYioAx3UW0gf4Gjg6N+Yatys4epMrURzLd12YkYzz/NS
	bVRn0+N9t3+/dhFrvzvEPuIhHj/0v7seNE+e9GhX39Jq9myX0C1ka40Iwtu1G3fv
	YPB4qlijvOSdFv6F6ATTcpcbHVzkkzysLCbND8upgLVOTfMUhDVXLzyWTbNW9mqW
	iE6vrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454cp8pqkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 13:50:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3743640050;
	Wed,  5 Mar 2025 13:49:34 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94358649C97;
	Wed,  5 Mar 2025 13:48:30 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 13:48:16 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 13:48:15 +0100
Message-ID: <f59a0de5-3db7-4344-ab6f-4907e6024e77@foss.st.com>
Date: Wed, 5 Mar 2025 13:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/8] remoteproc: Add TEE support
To: Bjorn Andersson <andersson@kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-3-arnaud.pouliquen@foss.st.com>
 <6fufphs3ajlc7htj74qus6gifdd4yd64l5yjn2zyjrtdezoe4f@cqbbzg63acv4>
 <93a0475f-c62f-4eab-b9c2-0306e24041bb@foss.st.com>
 <zcr3zg3t3iwshyz3e5valrfluk4s4isrqfiz7y3naw53goemtq@ph2ctpemqile>
 <e2e127a5-a451-486e-9978-7ddc13462da3@foss.st.com>
 <qxzsz2r7ugiyb7njphmdyupihqmalnmfbbsrtpi7meua37qfqb@bobtx24bwl6r>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <qxzsz2r7ugiyb7njphmdyupihqmalnmfbbsrtpi7meua37qfqb@bobtx24bwl6r>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01



On 3/4/25 16:58, Bjorn Andersson wrote:
> On Wed, Feb 12, 2025 at 02:42:28PM +0100, Arnaud POULIQUEN wrote:
>> Hello,
>>
>> On 2/12/25 04:18, Bjorn Andersson wrote:
>>> On Tue, Dec 10, 2024 at 09:57:40AM +0100, Arnaud POULIQUEN wrote:
>>>> Hello Bjorn,
>>>>
>>>> On 12/6/24 23:07, Bjorn Andersson wrote:
>>>>> On Thu, Nov 28, 2024 at 09:42:09AM GMT, Arnaud Pouliquen wrote:
>>>>>> Add a remoteproc TEE (Trusted Execution Environment) driver
>>>>>> that will be probed by the TEE bus. If the associated Trusted
>>>>>> application is supported on secure part this driver offers a client
>>>>>> interface to load a firmware by the secure part.
>>>>>
>>>>> If...else?
>>>>>
>>>>>> This firmware could be authenticated by the secure trusted application.
>>>>>>
>>>>>
>>>>> I would like for this to fully describe how this fits with the bus and
>>>> Are you speaking about the OP-TEE bus?
>>>>
>>>> I assume that your attempt is that I provide more details on the live cycle
>>>> sequence, right?
>>>>
>>>
>>> Right, there's a tee_client_driver and there's a remoteproc driver.
>>> Let's document clearly how these interact.
>>>
>>>>> how it is expected to be used by a specific remoteproc driver.
>>>>>
>>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>>> ---
>>>>>> Updates vs version v13:
>>>>>> - define REMOTEPROC_TEE as bool instead of tristate,
>>>>>> - remove the load of the firmware in rproc_tee_parse_fw as we will ensure
>>>>>>   that the firmware is loaded using the load_fw() operation.
>>>>>> ---
>>>>>>  drivers/remoteproc/Kconfig          |  10 +
>>>>>>  drivers/remoteproc/Makefile         |   1 +
>>>>>>  drivers/remoteproc/remoteproc_tee.c | 508 ++++++++++++++++++++++++++++
>>>>>>  include/linux/remoteproc.h          |   4 +
>>>>>>  include/linux/remoteproc_tee.h      | 105 ++++++
>>>>>>  5 files changed, 628 insertions(+)
>>>>>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>>>>>  create mode 100644 include/linux/remoteproc_tee.h
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>>>> index 955e4e38477e..f6335321d540 100644
>>>>>> --- a/drivers/remoteproc/Kconfig
>>>>>> +++ b/drivers/remoteproc/Kconfig
>>>>>> @@ -23,6 +23,16 @@ config REMOTEPROC_CDEV
>>>>>>  
>>>>>>  	  It's safe to say N if you don't want to use this interface.
>>>>>>  
>>>>>> +config REMOTEPROC_TEE
>>>>>> +	bool "Remoteproc support by a TEE application"
>>>>>> +	depends on OPTEE
>>>>>> +	help
>>>>>> +	  Support a remote processor with a TEE application.
>>>>>
>>>>> Does the remote processor run TEE applications? (Rethorical question...)
>>>>>
>>>>>> 	  The Trusted
>>>>>> +	  Execution Context is responsible for loading the trusted firmware
>>>>>> +	  image and managing the remote processor's lifecycle.
>>>>>> +
>>>>>> +	  It's safe to say N if you don't want to use remoteproc TEE.
>>>>>
>>>>> It's not really about "wanting to use", it's a question whether your
>>>>> device implements/provides the remoteproc TEE.
>>>>>
>>>>>> +
>>>>>>  config IMX_REMOTEPROC
>>>>>>  	tristate "i.MX remoteproc support"
>>>>>>  	depends on ARCH_MXC
>>>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>>>> index 5ff4e2fee4ab..f77e0abe8349 100644
>>>>>> --- a/drivers/remoteproc/Makefile
>>>>>> +++ b/drivers/remoteproc/Makefile
>>>>>> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
>>>>>>  remoteproc-y				+= remoteproc_virtio.o
>>>>>>  remoteproc-y				+= remoteproc_elf_loader.o
>>>>>>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>>>>>> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
>>>>>>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>>>>>>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>>>>>>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>>>>>> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..3fe3f31068f2
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/remoteproc/remoteproc_tee.c
>>>>>> @@ -0,0 +1,508 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> +/*
>>>>>> + * Copyright (C) STMicroelectronics 2024
>>>>>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/firmware.h>
>>>>>> +#include <linux/io.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/remoteproc.h>
>>>>>> +#include <linux/remoteproc_tee.h>
>>>>>> +#include <linux/slab.h>
>>>>>> +#include <linux/tee_drv.h>
>>>>>> +
>>>>>> +#define MAX_TEE_PARAM_ARRAY_MEMBER	4
>>>>>> +
>>>>>> +/*
>>>>>> + * Authentication of the firmware and load in the remote processor memory
>>>>>
>>>>> Exactly what does this imply? Will the content of @memref be copied into
>>>>> some other memory?
>>>>
>>>> The objective is to authenticate and load in one step. So, yes, the image is
>>>> loaded into the remoteproc destination memory.
>>>>
>>>
>>> So, some separate device-memory, or some preallocated carveout which is
>>> only accessible from secure world?
>>
>> No sure to understand the difference you do between eparate device-memory and
>> preallocated carveout.
>>
> 
> The main clarification I was looking for was that in your design you
> don't use any resources on the Linux side for when your remoteproc
> instance is running - i.e. no carveouts etc on the Linux side.
> 
>> In OP-TEE, we use the same principle as in Linux. OP-TEE uses memory regions
>> declared in its device tree to list memories usable for the coprocessor (with
>> associated access rights). On load, it checks that the segments to load  are
>> included in these memory regions.
>>
>> Linux only declares the shared memory-regions in the device tree, for IPC.
>>
>>>
>>> Does the OS need to retain @memref past this point?
>>
>> No need,and as the area contains the reult of request_firmware() that can be
>> corrupted by Linux, OP-TEE considered this as a temporaray unsafe memory. After
>> the load + authentication step this buffer is no more used.
>> For detail, OPTEE make a copy of the header and TLV (metadata) in a secure
>> memory. and load the firmware images in destination memories All these memories
>>  are not accessible from the Linux.
>>
> 
> No concerns with this, but these semantics should be clearly documented
> here.
> 
>>>
>>>> On stm32mp1 we can not store the elf file in a temporary secure memory as
>>>> the memory is encrypted by software (this would take to much time).
>>>>
>>>> For your information, in OP-TEE, the application code is split into a generic
>>>> part and a platform adaptation layer. The generic application is mainly
>>>> responsible for:
>>>>
>>>> - Copying the binary header and metadata into secure memory and authenticating them.
>>>> - Parsing the ELF images and providing segments to load with associated
>>>> authenticated hashes to the platform application.
>>>> In the future, someone can add their own format if needed.
>>>>
>>>> But the generic part could be enhance to authenticate and load a non ELF binary.
>>>> So I'm trying to be generic as possible here.
>>>>
>>>
>>> Generic might be okay, but I'd prefer this to be less vague.
>>> Also worth noting is the Qualcomm implementation of TZ-backed
>>> remoteproc, which is already in the tree. 
>>
>> Could you point me the code in Linux and your TEE, please?
>>
> 
> One example is drivers/remoteproc/qcom_q6v5_pas.c where this is captured
> in adsp_start().
> 
> qcom_mdt_pas_init() parses out the ELF header and signature information
> and passes this to the secure world, it then loads the segments of the
> ELF into the carvouts (qcom_mdt_load_no_init()) and finally it jumps to
> secure world with qcom_scm_pas_auth_and_reset(), which will lock down
> Linux's access to the carveouts, then based on previously established
> data will authenticate the loaded firmware and finally start execution
> on the remote processor.
> 
> The difference in this model though is that we don't need the resource
> table for rproc_handle_resources() - so this doesn't meet your needs.
> 
>>> There the firmware is loaded
>>> into carveouts, the certificates and hashes are validated. 
>>
>> Seems to me that there is also a partial Authentication done during the load step.
>>
> 
> Given that the ELF header and signature information is vetted before the
> actually copy the segments into carveouts, it's conceivable that the ELF
> header could be sanity checked...
> 
>>> Lastly
>>> the operation "authenticate and start" is invoked, which does that, and
>>> locks the OS out of the given memory region - until "shutdown" is
>>> invoked.
>>
>> The differnce between the 2 implementations is the authentication method done in
>> 2 steps for Qualcomm implementation , in one step for OP-TEE.
>>
> 
> Yes, but it needs to be pointed out that this is because you want the
> resource table to be authenticated.
> 
>> So here if I just remove the term 'authentication' in the command description
>> does it ok for you?
>>
> 
> No, perhaps I'm misinterpreting you here; but the goal isn't to play
> word games until it's good enough - the goal is to have a clean design
> that will cover the various cases, and for that we need to establish
> what your actual requirements on the host OS side is (typically while
> considering the "other side" to be a black box).
> 
>>>
>>>>
>>>>>
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>
>>>>> Why not just "remote processor identifier"?
>>>>>
>>>>>> + * [in]	 params[1].memref:	buffer containing the image of the buffer
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_LOAD_FW		1
>>>>>> +
>>>>>> +/*
>>>>>> + * Start the remote processor
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_START_FW	2
>>>>>
>>>>> Why is there two "FW" in this constant? Why isn't it just
>>>>> "TA_RPROC_FW_CMD_START"?
>>>>>
>>>>> And why is it not TEE_PROC_FW_CMD_START?
>>>>>
>>>>>> +
>>>>>> +/*
>>>>>> + * Stop the remote processor
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_STOP_FW		3
>>>>>> +
>>>>>> +/*
>>>>>> + * Return the address of the resource table, or 0 if not found
>>>>>> + * No check is done to verify that the address returned is accessible by
>>>>>> + * the non secure context. If the resource table is loaded in a protected
>>>>>> + * memory the access by the non secure context will lead to a data abort.
>>>>>
>>>>> These three lines describe a scenario that doesn't make any sense to me.
>>>>> But if that's the case, you should be able to describe that the API
>>>>> might give you a inaccessible pointer, by design.
>>>>
>>>> On STM32MP, we have a kind of firewall in OP-TEE that sets memory access rights
>>>> from the device tree. So if the firmware image is not linked according to the
>>>> firewall configuration, the pointer may not be accessible.
>>>>
>>>> I will update the comment as you propose.
>>>>
>>>>>
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + * [out]  params[1].value.a:	32bit LSB resource table memory address
>>>>>> + * [out]  params[1].value.b:	32bit MSB resource table memory address
>>>>>> + * [out]  params[2].value.a:	32bit LSB resource table memory size
>>>>>> + * [out]  params[2].value.b:	32bit MSB resource table memory size
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
>>>>>> +
>>>>>> +/*
>>>>>> + * Return the address of the core dump
>>>>>
>>>>> What does this mean? What will I find at @memref after this call?
>>>>
>>>> I do not have a simple answer here as it depends on the OP-TEE strategy.
>>>> It could be an obscure core dump with possible encryption.
>>>>
>>>> I will remove this as it is not yet implemented in OP-TEE.
>>>>
>>>
>>> Okay. But I would prefer that we define the semantics before it's
>>> implemented...
>>
>> that seems fair, I notice that we will have to address this in a separate thread
>> strating with a series in Linux.
>>
>>
>>>
>>>> https://elixir.bootlin.com/op-tee/4.4.0/source/ta/remoteproc/src/remoteproc_core.c#L1131
>>>>
>>>>>
>>>>>> + *
>>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>>>> + * [out] params[1].memref:	address of the core dump image if exist,
>>>>>> + *				else return Null
>>>>>
>>>>> s/else return Null/or NULL/
>>>>>
>>>>>> + */
>>>>>> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
>>>>>> +
>>>>>> +/*
>>>>>> + * Release remote processor firmware images and associated resources.
>>>>>
>>>>> Exactly what does this mean for the caller?
>>>>
>>>> It is platform dependent. It can consist in cleaning the memory, but
>>>> can be also something else such as firewall configuration.
>>>> On stm323mp we clean all the memories region reserved for the remote processor.
>>>>
>>>
>>> We can't have an ABI which isn't well defined in intent. Your examples
>>> would easily fall in the realm of a well defined interface, but this
>>> ties into the question above - what does is actually mean in terms of
>>> the memory carveouts and such.
>>>
>>
>> Regarding this comment and the one below, does following description would
>> respond to your expectations? else do you have a suggestion?
>>
>> /*
>>  * This command should be used in case an error occurs between the loading of
>>  * the firmware images (TA_RPROC_CMD_LOAD_FW) and the starting of the remote
>>  * processor (TA_RPROC_CMD_START_FW),
> 
> This is valuable information related to TA_RPROC_CMD_LOAD_FW and
> TA_RPROC_CMD_START_FW, so let's document this there instead.
> 
>>  * or after stopping the remote processor
>>  * (TA_RPROC_CMD_STOP_FW).
>>  *
>>  * This command is used to inform the TEE (Trusted Execution Environment) that
>>  * resources associated with the remote processor can be released. After this
>>  * command, the firmware is no longer present in the remote processor's memories
>>  * and must be reloaded (TA_RPROC_FW_CMD_LOAD_FW) to restart the remote
>>  * processor.
> 
> I guess it's fine to define it like this on this level, but in the
> remoteproc core I'd like us to express the related logic as "release
> resources allocated durign rproc_parse_fw(). (And I don't think these
> two interpretations are in conflict).
> 
> What's unexpected to me then is that you're not actually reloading your
> firmware across a recovery/restart?

I do it. in rproc_boot_recovery()
- we call on rproc_stop()
    rproc_reset_rsc_table_on_stop() copy the resource table in
    rproc->cached_table
- we call rproc_load_fw()  added in patch 3/8
- we call rproc_start() which overwrite the resource table with values in
  proc->cached_table
	

The proc->cached_table avoid to release and reallocate all the carveout on recovery.
This management is one of the points that complexity the sequence in the
remoteproc_tee case.


Thanks,
Arnaud

> 
> Regards,
> Bjorn
