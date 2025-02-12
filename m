Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548B20E6FE;
	Wed, 12 Feb 2025 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367839; cv=none; b=KGIyHyYuYKzgAq7XgmPV9JweBvw7JgotpwZ5J8K0RcC9Dyxrxp0oXYmzrgI4e/x57AAKZgXdIb4BYGRT1M9B6uEeKe+FoWhx1JQ0XZYpmK5mJwxXGNFlwtWq+wf+9XJKXeExkSEc8bnlaPUt7Rq63ksugXNT8b96GK2p+YuI5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367839; c=relaxed/simple;
	bh=0ZQKCKpfwk7lyL1CP2rW+/AYG6E5nVgbcqJ6JzfKiGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oZSFA55oNbDmW8aqtrQ2W42JZ0zECQzwFpDA4sIvA3ZzHETQQn6DxhqlIzymTVT7iNQpcYyIkT741Y79SynN58VC1ZddeYU4bh6qC1BRHgW28lhmj4+c0rWzlb8f8WeIi88d5hP4gcgpRZ5xAqPWETMryjfvEuinwo5AKuFePNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=5CQbdboD; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5CQbdboD"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CD5n1a028150;
	Wed, 12 Feb 2025 14:43:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XbsW/yWOpBwDNiKCVNzK6p6R2m2mUVLIwEHm2YkdcFo=; b=5CQbdboDm8cUYQX1
	s3dt2acfUPsrkV7LrEhnU+kSFBxgTdQXuVWfMTzzMNHzu9AiRMD2QjBoevjMjB0o
	mFR92VP0blLzt1HAIekFUkCrlwCrgJJM0QAQR24BGSl5ISBQzL4/YX4TL41/ePCB
	9aERsB5iNB8EmKqDIpcH8ng+CaZmidxM7RXPOrxSCCJLDAsNbqGzy/tNjP5tGCpW
	ZcxXYfxLHM9atppSuS5NwPcj14Nsfx3ewuKDdcyT1aqadhsQMMYbmafvydywkCm9
	wnx+17YAjLoxyNZarzULAGuIX5gFEn7pmFY/Yq/CzX/tFiRuZbX5EaCBCpWH2Ufi
	eeIgoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0q00ysu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:43:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C8C9440044;
	Wed, 12 Feb 2025 14:42:52 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB6632B09C7;
	Wed, 12 Feb 2025 14:42:29 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 14:42:29 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 14:42:29 +0100
Message-ID: <e2e127a5-a451-486e-9978-7ddc13462da3@foss.st.com>
Date: Wed, 12 Feb 2025 14:42:28 +0100
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
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <zcr3zg3t3iwshyz3e5valrfluk4s4isrqfiz7y3naw53goemtq@ph2ctpemqile>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01

Hello,

On 2/12/25 04:18, Bjorn Andersson wrote:
> On Tue, Dec 10, 2024 at 09:57:40AM +0100, Arnaud POULIQUEN wrote:
>> Hello Bjorn,
>>
>> On 12/6/24 23:07, Bjorn Andersson wrote:
>>> On Thu, Nov 28, 2024 at 09:42:09AM GMT, Arnaud Pouliquen wrote:
>>>> Add a remoteproc TEE (Trusted Execution Environment) driver
>>>> that will be probed by the TEE bus. If the associated Trusted
>>>> application is supported on secure part this driver offers a client
>>>> interface to load a firmware by the secure part.
>>>
>>> If...else?
>>>
>>>> This firmware could be authenticated by the secure trusted application.
>>>>
>>>
>>> I would like for this to fully describe how this fits with the bus and
>> Are you speaking about the OP-TEE bus?
>>
>> I assume that your attempt is that I provide more details on the live cycle
>> sequence, right?
>>
> 
> Right, there's a tee_client_driver and there's a remoteproc driver.
> Let's document clearly how these interact.
> 
>>> how it is expected to be used by a specific remoteproc driver.
>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>> Updates vs version v13:
>>>> - define REMOTEPROC_TEE as bool instead of tristate,
>>>> - remove the load of the firmware in rproc_tee_parse_fw as we will ensure
>>>>   that the firmware is loaded using the load_fw() operation.
>>>> ---
>>>>  drivers/remoteproc/Kconfig          |  10 +
>>>>  drivers/remoteproc/Makefile         |   1 +
>>>>  drivers/remoteproc/remoteproc_tee.c | 508 ++++++++++++++++++++++++++++
>>>>  include/linux/remoteproc.h          |   4 +
>>>>  include/linux/remoteproc_tee.h      | 105 ++++++
>>>>  5 files changed, 628 insertions(+)
>>>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>>>  create mode 100644 include/linux/remoteproc_tee.h
>>>>
>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>> index 955e4e38477e..f6335321d540 100644
>>>> --- a/drivers/remoteproc/Kconfig
>>>> +++ b/drivers/remoteproc/Kconfig
>>>> @@ -23,6 +23,16 @@ config REMOTEPROC_CDEV
>>>>  
>>>>  	  It's safe to say N if you don't want to use this interface.
>>>>  
>>>> +config REMOTEPROC_TEE
>>>> +	bool "Remoteproc support by a TEE application"
>>>> +	depends on OPTEE
>>>> +	help
>>>> +	  Support a remote processor with a TEE application.
>>>
>>> Does the remote processor run TEE applications? (Rethorical question...)
>>>
>>>> 	  The Trusted
>>>> +	  Execution Context is responsible for loading the trusted firmware
>>>> +	  image and managing the remote processor's lifecycle.
>>>> +
>>>> +	  It's safe to say N if you don't want to use remoteproc TEE.
>>>
>>> It's not really about "wanting to use", it's a question whether your
>>> device implements/provides the remoteproc TEE.
>>>
>>>> +
>>>>  config IMX_REMOTEPROC
>>>>  	tristate "i.MX remoteproc support"
>>>>  	depends on ARCH_MXC
>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>> index 5ff4e2fee4ab..f77e0abe8349 100644
>>>> --- a/drivers/remoteproc/Makefile
>>>> +++ b/drivers/remoteproc/Makefile
>>>> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
>>>>  remoteproc-y				+= remoteproc_virtio.o
>>>>  remoteproc-y				+= remoteproc_elf_loader.o
>>>>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>>>> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
>>>>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>>>>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>>>>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>>>> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
>>>> new file mode 100644
>>>> index 000000000000..3fe3f31068f2
>>>> --- /dev/null
>>>> +++ b/drivers/remoteproc/remoteproc_tee.c
>>>> @@ -0,0 +1,508 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Copyright (C) STMicroelectronics 2024
>>>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> + */
>>>> +
>>>> +#include <linux/firmware.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/remoteproc.h>
>>>> +#include <linux/remoteproc_tee.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/tee_drv.h>
>>>> +
>>>> +#define MAX_TEE_PARAM_ARRAY_MEMBER	4
>>>> +
>>>> +/*
>>>> + * Authentication of the firmware and load in the remote processor memory
>>>
>>> Exactly what does this imply? Will the content of @memref be copied into
>>> some other memory?
>>
>> The objective is to authenticate and load in one step. So, yes, the image is
>> loaded into the remoteproc destination memory.
>>
> 
> So, some separate device-memory, or some preallocated carveout which is
> only accessible from secure world?

No sure to understand the difference you do between eparate device-memory and
preallocated carveout.

In OP-TEE, we use the same principle as in Linux. OP-TEE uses memory regions
declared in its device tree to list memories usable for the coprocessor (with
associated access rights). On load, it checks that the segments to load  are
included in these memory regions.

Linux only declares the shared memory-regions in the device tree, for IPC.

> 
> Does the OS need to retain @memref past this point?

No need,and as the area contains the reult of request_firmware() that can be
corrupted by Linux, OP-TEE considered this as a temporaray unsafe memory. After
the load + authentication step this buffer is no more used.
For detail, OPTEE make a copy of the header and TLV (metadata) in a secure
memory. and load the firmware images in destination memories All these memories
 are not accessible from the Linux.

> 
>> On stm32mp1 we can not store the elf file in a temporary secure memory as
>> the memory is encrypted by software (this would take to much time).
>>
>> For your information, in OP-TEE, the application code is split into a generic
>> part and a platform adaptation layer. The generic application is mainly
>> responsible for:
>>
>> - Copying the binary header and metadata into secure memory and authenticating them.
>> - Parsing the ELF images and providing segments to load with associated
>> authenticated hashes to the platform application.
>> In the future, someone can add their own format if needed.
>>
>> But the generic part could be enhance to authenticate and load a non ELF binary.
>> So I'm trying to be generic as possible here.
>>
> 
> Generic might be okay, but I'd prefer this to be less vague.
> Also worth noting is the Qualcomm implementation of TZ-backed
> remoteproc, which is already in the tree. 

Could you point me the code in Linux and your TEE, please?

> There the firmware is loaded
> into carveouts, the certificates and hashes are validated. 

Seems to me that there is also a partial Authentication done during the load step.

> Lastly
> the operation "authenticate and start" is invoked, which does that, and
> locks the OS out of the given memory region - until "shutdown" is
> invoked.

The differnce between the 2 implementations is the authentication method done in
2 steps for Qualcomm implementation , in one step for OP-TEE.

So here if I just remove the term 'authentication' in the command description
does it ok for you?

> 
>>
>>>
>>>> + *
>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>
>>> Why not just "remote processor identifier"?
>>>
>>>> + * [in]	 params[1].memref:	buffer containing the image of the buffer
>>>> + */
>>>> +#define TA_RPROC_FW_CMD_LOAD_FW		1
>>>> +
>>>> +/*
>>>> + * Start the remote processor
>>>> + *
>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>> + */
>>>> +#define TA_RPROC_FW_CMD_START_FW	2
>>>
>>> Why is there two "FW" in this constant? Why isn't it just
>>> "TA_RPROC_FW_CMD_START"?
>>>
>>> And why is it not TEE_PROC_FW_CMD_START?
>>>
>>>> +
>>>> +/*
>>>> + * Stop the remote processor
>>>> + *
>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>> + */
>>>> +#define TA_RPROC_FW_CMD_STOP_FW		3
>>>> +
>>>> +/*
>>>> + * Return the address of the resource table, or 0 if not found
>>>> + * No check is done to verify that the address returned is accessible by
>>>> + * the non secure context. If the resource table is loaded in a protected
>>>> + * memory the access by the non secure context will lead to a data abort.
>>>
>>> These three lines describe a scenario that doesn't make any sense to me.
>>> But if that's the case, you should be able to describe that the API
>>> might give you a inaccessible pointer, by design.
>>
>> On STM32MP, we have a kind of firewall in OP-TEE that sets memory access rights
>> from the device tree. So if the firmware image is not linked according to the
>> firewall configuration, the pointer may not be accessible.
>>
>> I will update the comment as you propose.
>>
>>>
>>>> + *
>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>> + * [out]  params[1].value.a:	32bit LSB resource table memory address
>>>> + * [out]  params[1].value.b:	32bit MSB resource table memory address
>>>> + * [out]  params[2].value.a:	32bit LSB resource table memory size
>>>> + * [out]  params[2].value.b:	32bit MSB resource table memory size
>>>> + */
>>>> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
>>>> +
>>>> +/*
>>>> + * Return the address of the core dump
>>>
>>> What does this mean? What will I find at @memref after this call?
>>
>> I do not have a simple answer here as it depends on the OP-TEE strategy.
>> It could be an obscure core dump with possible encryption.
>>
>> I will remove this as it is not yet implemented in OP-TEE.
>>
> 
> Okay. But I would prefer that we define the semantics before it's
> implemented...

that seems fair, I notice that we will have to address this in a separate thread
strating with a series in Linux.


> 
>> https://elixir.bootlin.com/op-tee/4.4.0/source/ta/remoteproc/src/remoteproc_core.c#L1131
>>
>>>
>>>> + *
>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>>>> + * [out] params[1].memref:	address of the core dump image if exist,
>>>> + *				else return Null
>>>
>>> s/else return Null/or NULL/
>>>
>>>> + */
>>>> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
>>>> +
>>>> +/*
>>>> + * Release remote processor firmware images and associated resources.
>>>
>>> Exactly what does this mean for the caller?
>>
>> It is platform dependent. It can consist in cleaning the memory, but
>> can be also something else such as firewall configuration.
>> On stm323mp we clean all the memories region reserved for the remote processor.
>>
> 
> We can't have an ABI which isn't well defined in intent. Your examples
> would easily fall in the realm of a well defined interface, but this
> ties into the question above - what does is actually mean in terms of
> the memory carveouts and such.
> 

Regarding this comment and the one below, does following description would
respond to your expectations? else do you have a suggestion?

/*
 * This command should be used in case an error occurs between the loading of
 * the firmware images (TA_RPROC_CMD_LOAD_FW) and the starting of the remote
 * processor (TA_RPROC_CMD_START_FW), or after stopping the remote processor
 * (TA_RPROC_CMD_STOP_FW).
 *
 * This command is used to inform the TEE (Trusted Execution Environment) that
 * resources associated with the remote processor can be released. After this
 * command, the firmware is no longer present in the remote processor's memories
 * and must be reloaded (TA_RPROC_FW_CMD_LOAD_FW) to restart the remote
 * processor.
 */

Thanks;
Arnaud


>>>
>>>> + * This command should be used in case an error occurs between the loading of
>>>> + * the firmware images (TA_RPROC_CMD_LOAD_FW) and the starting of the remote
>>>> + * processor (TA_RPROC_CMD_START_FW) or after stopping the remote processor
>>>> + * to release associated resources (TA_RPROC_CMD_STOP_FW).
>>>
>>> This description belongs adjacent to LOAD_FW, and describe it in terms
>>> of what state LOAD_FW leaves the buffers and remote processor in.
>>
>> Sorry, it is not clear to me what you are expecting here.
>>
> 
> This describes the state LOAD_FW leaves things in and the action you
> expect the caller to take. Right now I need to read all the
> documentation in order to understand how LOAD_FW works.
> 
> Document this behavior in relation to LOAD_FW.
> 
>>>
>>>> + *
>>>> + * [in]  params[0].value.a: Unique 32-bit remote processor identifier
>>>> + */
>>>> +#define TA_RPROC_CMD_RELEASE_FW		6
>>>> +
>>>> +struct rproc_tee_context {
>>>> +	struct list_head sessions;
>>>> +	struct tee_context *tee_ctx;
>>>> +	struct device *dev;
>>>> +};
>>>> +
>>>> +static struct rproc_tee_context *rproc_tee_ctx;
>>>> +
>>>> +static void rproc_tee_prepare_args(struct rproc_tee *trproc, int cmd,
>>>> +				   struct tee_ioctl_invoke_arg *arg,
>>>> +				   struct tee_param *param,
>>>> +				   unsigned int num_params)
>>>> +{
>>>> +	memset(arg, 0, sizeof(*arg));
>>>> +	memset(param, 0, MAX_TEE_PARAM_ARRAY_MEMBER * sizeof(*param));
>>>> +
>>>> +	arg->func = cmd;
>>>> +	arg->session = trproc->session_id;
>>>> +	arg->num_params = num_params + 1;
>>>> +
>>>> +	param[0] = (struct tee_param) {
>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>>>> +		.u.value.a = trproc->rproc_id,
>>>> +	};
>>>> +}
>>>> +
>>>
>>> Provide kernel-doc for EXPORT_SYMBOL*() functions.
>>
>> Should it be in the remoteproc kernel doc or in a new doc file that
>> provide an overview of the remoteproc_tee usage?
>>
> 
> I'm referring to
> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation,
> i.e. a /** func() ... */ comment above each such function.
> 
> This allow the caller to easily reach the documentation by using
> mechanism such as "jump-to-definition" in their IDE.
> 
>>
>>>
>>>> +void rproc_tee_release_fw(struct rproc *rproc)
>>>> +{
>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
>>>> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
>>>> +	struct tee_ioctl_invoke_arg arg;
>>>> +	int ret;
>>>> +
>>>> +	if (!rproc) {
>>>
>>> How can this happen?
>>>
>>> This error will happen in two cases:
>>>
>>> 1) on your desk while you develop the client and you have to hunt
>>> through the kernel log to figure out that the reason you can't start
>>> your remoteproc is because 5 minutes ago there was a error log saying
>>> that we didn't stop it last time.
>>>
>>> 2) in the customer device because of some obscure bug, where no one will
>>> read the logs and the software will happily continue to execute with a
>>> broken state.
>>>
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * If the remote processor state is RPROC_DETACHED, just ignore the
>>>> +	 * request, as the remote processor is still running.
>>>> +	 */
>>>> +	if (rproc->state == RPROC_DETACHED)
>>>> +		return;
>>>> +
>>>> +	if (rproc->state != RPROC_OFFLINE) {
>>>> +		ret = -EBUSY;
>>>
>>> The function is void... Defensive coding is only useful when it saves
>>> you from future mistakes, not when it hides problems from you.
>>>
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	rproc_tee_prepare_args(trproc, TA_RPROC_CMD_RELEASE_FW, &arg, param, 0);
>>>> +
>>>> +	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
>>>> +	if (ret < 0 || arg.ret != 0) {
>>>> +		dev_err(rproc_tee_ctx->dev,
>>>> +			"TA_RPROC_CMD_RELEASE_FW invoke failed TEE err: %x, ret:%x\n",
>>>> +			arg.ret, ret);
>>>
>>> At least @ret will be base 10, so don't print that in base 16 without
>>> indication that it's not base 10.
>>>
>>>
>>> Also, this will result in two dev_err() prints, printing out two
>>> different error codes.
>>
>> Here i copy /past error managing from other drivers [1][2].
> 
> No, both of these examples has a '#' between '%' and 'x', which will
> make the number be prefixed with 0x - making the base clear to the
> reader.
> 
>> Should I make it different and use 2 dev_err?
>>
> 
> What I mean is that here you're telling the user that there was an
> error, with one value of "ret". Then you continue below, will find ret
> with -EIO and then you will print another message saying that it failed
> and this time with -EIO.
> 
> Why two prints?
> 
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.12.1/source/drivers/firmware/arm_scmi/transports/optee.c#L244
>>
>> [2]
>> https://elixir.bootlin.com/linux/v6.12.1/source/drivers/firmware/arm_scmi/transports/optee.c#L244
>>
>>>
>>>> +		ret = -EIO;
>>>> +	}
>>>> +
>>>> +out:
>>>> +	if (ret)
>>>> +		/* Unexpected state without solution to come back in a stable state */
>>>> +		dev_err(rproc_tee_ctx->dev, "Failed to release TEE remoteproc firmware: %d\n", ret);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(rproc_tee_release_fw);
>>>> +
> 
> Regards,
> Bjorn
