Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0133D5;
	Wed,  3 Jul 2024 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719991266; cv=none; b=UpYYpPRxH4pOpLnZRsTbNSVAyJa6E/c4Rb1XxxwQtN5MZROBGiN1LrTdnoaBwOK6xxnAAld4noDTb3GePkrGfz4eF8JJFL5484DH7GPqnuRklCT3DXJEE2NxcijjrmtXHDaacq3LPCJQB8vWGhW9DdXX8JTyafRom4uSwKILf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719991266; c=relaxed/simple;
	bh=TTg4CPfdjRYDW1JBkP7OYmCC93nVcZxHSNVD1RCr3jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uvDnS7i0nqPwS3byCcdbZwITJzeplgMex7fPXJYiBe163eVJsMSzo6TU0Ofb4ss689XlreXQd0McTFXoQF64kLYceNWJSbYsGaCFBtJXPiCtYlYeI4ogk8pK7AoppBh4z56SJFQ5RW8lMFVnR0cHdpjxHGb+E+qRnn3M549GupU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ndVDEOHk; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ndVDEOHk"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46307GtF023736;
	Wed, 3 Jul 2024 09:20:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1/qMI2ZSAly0qG+/NLeEaqZCgk3N+qux9koNP9N4Svs=; b=ndVDEOHk+VsQUBLy
	lo/PsLTJkwCEWEypJf6GHsVTBBXVlENcFAWaarmzWtHAqfZWW32kFw09w/MrPBDB
	B3muuy3wli/JOEf5oAdnCNKwxq04VJLEfg8+4QeXIgu9md9p9AGcfS+3rgZldglp
	eJ+B+8ExQSDBlmdyYHpaQoeovjM+gQsbmb6EwwkOT/5wpiVTcI1kSRfFhFKR0ZYI
	hOuYuxsbemvs46rc1I1yFbwoTlsuUsQUWRC92OgGLN6o6DCathCLn65DUJ7xwRrN
	GSAbVyy+Seu4mFrM54MaROG1simZcUQC1uVUMWPGGbVR6FDWT+zoCQkzVF3rvthQ
	Vb6YMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402uu0vnm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 09:20:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 167244004D;
	Wed,  3 Jul 2024 09:20:35 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F507214529;
	Wed,  3 Jul 2024 09:19:46 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Jul
 2024 09:19:46 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Jul
 2024 09:19:45 +0200
Message-ID: <97eee634-1b11-490f-9d96-f1564b022b34@foss.st.com>
Date: Wed, 3 Jul 2024 09:19:44 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] remoteproc: Add TEE support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
 <20240621143759.547793-3-arnaud.pouliquen@foss.st.com>
 <ZoQuW7lXZlYf+kEF@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZoQuW7lXZlYf+kEF@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_03,2024-07-02_02,2024-05-17_01

Hello Mathieu

On 7/2/24 18:44, Mathieu Poirier wrote:
> Good morning,
> 
> On Fri, Jun 21, 2024 at 04:37:56PM +0200, Arnaud Pouliquen wrote:
>> Add a remoteproc TEE (Trusted Execution Environment) driver
>> that will be probed by the TEE bus. If the associated Trusted
>> application is supported on secure part this driver offers a client
>> interface to load a firmware by the secure part.
>> This firmware could be authenticated by the secure trusted application.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Updates vs previous version:
>> - rename tee_remoteproc.* file to rmeoteproc_tee.*,
>> - rename TEE_REMOTEPROC config to REMOTEPROC_TEE,
>> - remove "stm32" in some variable declarations,
>> - remove useless "remoteproc_internal.h" include,
>> - fix tee_rproc_ctx devm_kzalloc.
>> - rework module description
>> ---
>>  drivers/remoteproc/Kconfig          |  10 +
>>  drivers/remoteproc/Makefile         |   1 +
>>  drivers/remoteproc/remoteproc_tee.c | 446 ++++++++++++++++++++++++++++
>>  include/linux/remoteproc.h          |   4 +
>>  include/linux/remoteproc_tee.h      | 100 +++++++
>>  5 files changed, 561 insertions(+)
>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>  create mode 100644 include/linux/remoteproc_tee.h
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 48845dc8fa85..278f197acb90 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -365,6 +365,16 @@ config XLNX_R5_REMOTEPROC
>>  
>>  	  It's safe to say N if not interested in using RPU r5f cores.
>>  
>> +
>> +config REMOTEPROC_TEE
>> +	tristate "Remoteproc support by a TEE application"
>> +	depends on OPTEE
>> +	help
>> +	  Support a remote processor with a TEE application. The Trusted
>> +	  Execution Context is responsible for loading the trusted firmware
>> +	  image and managing the remote processor's lifecycle.
>> +	  This can be either built-in or a loadable module.
>> +
>>  endif # REMOTEPROC
>>  
>>  endmenu
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index 91314a9b43ce..b4eb37177005 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
>>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
>>  obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
>>  obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
>> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
>> new file mode 100644
>> index 000000000000..70cb67451767
>> --- /dev/null
>> +++ b/drivers/remoteproc/remoteproc_tee.c
>> @@ -0,0 +1,446 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) STMicroelectronics 2024
>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> + */
>> +
>> +#include <linux/firmware.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/remoteproc.h>
>> +#include <linux/remoteproc_tee.h>
>> +#include <linux/slab.h>
>> +#include <linux/tee_drv.h>
>> +
>> +#define MAX_TEE_PARAM_ARRY_MEMBER	4
>> +
>> +/*
>> + * Authentication of the firmware and load in the remote processor memory
>> + *
>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>> + * [in]	 params[1].memref:	buffer containing the image of the buffer
>> + */
>> +#define TA_RPROC_FW_CMD_LOAD_FW		1
>> +
>> +/*
>> + * Start the remote processor
>> + *
>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>> + */
>> +#define TA_RPROC_FW_CMD_START_FW	2
>> +
>> +/*
>> + * Stop the remote processor
>> + *
>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>> + */
>> +#define TA_RPROC_FW_CMD_STOP_FW		3
>> +
>> +/*
>> + * Return the address of the resource table, or 0 if not found
>> + * No check is done to verify that the address returned is accessible by
>> + * the non secure context. If the resource table is loaded in a protected
>> + * memory the access by the non secure context will lead to a data abort.
>> + *
>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>> + * [out]  params[1].value.a:	32bit LSB resource table memory address
>> + * [out]  params[1].value.b:	32bit MSB resource table memory address
>> + * [out]  params[2].value.a:	32bit LSB resource table memory size
>> + * [out]  params[2].value.b:	32bit MSB resource table memory size
>> + */
>> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
>> +
>> +/*
>> + * Return the address of the core dump
>> + *
>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
>> + * [out] params[1].memref:	address of the core dump image if exist,
>> + *				else return Null
>> + */
>> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
>> +
>> +struct tee_rproc_context {
>> +	struct list_head sessions;
>> +	struct tee_context *tee_ctx;
>> +	struct device *dev;
>> +};
>> +
>> +static struct tee_rproc_context *tee_rproc_ctx;
>> +
>> +static void tee_rproc_prepare_args(struct tee_rproc *trproc, int cmd,
>> +				   struct tee_ioctl_invoke_arg *arg,
>> +				   struct tee_param *param,
>> +				   unsigned int num_params)
>> +{
>> +	memset(arg, 0, sizeof(*arg));
>> +	memset(param, 0, MAX_TEE_PARAM_ARRY_MEMBER * sizeof(*param));
>> +
>> +	arg->func = cmd;
>> +	arg->session = trproc->session_id;
>> +	arg->num_params = num_params + 1;
>> +
>> +	param[0] = (struct tee_param) {
>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>> +		.u.value.a = trproc->rproc_id,
>> +	};
>> +}
>> +
>> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>> +	struct tee_rproc *trproc = rproc->tee_interface;
>> +	struct tee_ioctl_invoke_arg arg;
>> +	struct tee_shm *fw_shm;
>> +	int ret;
>> +
>> +	if (!trproc)
>> +		return -EINVAL;
>> +
>> +	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
>> +	if (IS_ERR(fw_shm))
>> +		return PTR_ERR(fw_shm);
>> +
>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
>> +
>> +	/* Provide the address of the firmware image */
>> +	param[1] = (struct tee_param) {
>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>> +		.u.memref = {
>> +			.shm = fw_shm,
>> +			.size = fw->size,
>> +			.shm_offs = 0,
>> +		},
>> +	};
>> +
>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>> +	if (ret < 0 || arg.ret != 0) {
>> +		dev_err(tee_rproc_ctx->dev,
>> +			"TA_RPROC_FW_CMD_LOAD_FW invoke failed TEE err: %x, ret:%x\n",
>> +			arg.ret, ret);
>> +		if (!ret)
>> +			ret = -EIO;
>> +	}
>> +
>> +	tee_shm_free(fw_shm);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_load_fw);
>> +
>> +static int tee_rproc_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
>> +					  size_t *table_sz)
>> +{
>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>> +	struct tee_rproc *trproc = rproc->tee_interface;
>> +	struct tee_ioctl_invoke_arg arg;
>> +	int ret;
>> +
>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
>> +
>> +	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
>> +	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
>> +
>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>> +	if (ret < 0 || arg.ret != 0) {
>> +		dev_err(tee_rproc_ctx->dev,
>> +			"TA_RPROC_FW_CMD_GET_RSC_TABLE invoke failed TEE err: %x, ret:%x\n",
>> +			arg.ret, ret);
>> +		return -EIO;
>> +	}
>> +
>> +	*table_sz = param[2].u.value.a;
>> +
>> +	if (*table_sz)
>> +		*rsc_pa = param[1].u.value.a;
>> +	else
>> +		*rsc_pa  = 0;
>> +
>> +	return 0;
>> +}
>> +
>> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	phys_addr_t rsc_table;
>> +	void __iomem *rsc_va;
>> +	size_t table_sz;
>> +	int ret;
>> +
>> +	ret = tee_rproc_load_fw(rproc, fw);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
>> +	if (ret)
>> +		return ret;
> 
> Do we need an API to unload the firware from memory too?  If anything fails we
> still have firmware loaded into memory.

For the time being, the clean-up of the memory is not implemented in OP-TEE.
I plan to upstream this part in a second step, associated with a memory protection
strategy. This should be directly implemented in the OP-TEE service to avoid
reliance on Linux error management.
Nonetheless, an API could be added to clean the memory if needed.

Thanks,
Arnaud

> 
> More comments to come later.
> 
> Mathieu
> 
>> +
>> +	/*
>> +	 * We assume here that the memory mapping is the same between the TEE and Linux kernel
>> +	 * contexts. Else a new TEE remoteproc service could be needed to get a copy of the
>> +	 * resource table
>> +	 */
>> +	rsc_va = ioremap_wc(rsc_table, table_sz);
>> +	if (IS_ERR_OR_NULL(rsc_va)) {
>> +		dev_err(tee_rproc_ctx->dev, "Unable to map memory region: %pa+%zx\n",
>> +			&rsc_table, table_sz);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/*
>> +	 * Create a copy of the resource table to have the same behavior as the elf loader.
>> +	 * This cached table will be used after the remoteproc stops to free resources, and for
>> +	 * crash recovery to reapply the settings.
>> +	 */
>> +	rproc->cached_table = kmemdup((__force void *)rsc_va, table_sz, GFP_KERNEL);
>> +	if (!rproc->cached_table) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	rproc->table_ptr = rproc->cached_table;
>> +	rproc->table_sz = table_sz;
>> +
>> +out:
>> +	iounmap(rsc_va);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_parse_fw);
>> +
>> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
>> +						       const struct firmware *fw)
>> +{
>> +	struct tee_rproc *trproc = rproc->tee_interface;
>> +	phys_addr_t rsc_table;
>> +	size_t table_sz;
>> +	int ret;
>> +
>> +	if (!trproc)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	rproc->table_sz = table_sz;
>> +	if (!table_sz)
>> +		return NULL;
>> +
>> +	/*
>> +	 * At this step the memory area that contains the resource table should have be declared
>> +	 * in the remote proc platform driver and allocated by rproc_alloc_registered_carveouts().
>> +	 */
>> +	return (struct resource_table *)rproc_pa_to_va(rproc, rsc_table, table_sz, NULL);
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_find_loaded_rsc_table);
>> +
>> +int tee_rproc_start(struct rproc *rproc)
>> +{
>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>> +	struct tee_rproc *trproc = rproc->tee_interface;
>> +	struct tee_ioctl_invoke_arg arg;
>> +	int ret = 0;
>> +
>> +	if (!trproc)
>> +		return -EINVAL;
>> +
>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
>> +
>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>> +	if (ret < 0 || arg.ret != 0) {
>> +		dev_err(tee_rproc_ctx->dev,
>> +			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
>> +			arg.ret, ret);
>> +		if (!ret)
>> +			return  -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_start);
>> +
>> +int tee_rproc_stop(struct rproc *rproc)
>> +{
>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>> +	struct tee_rproc *trproc = rproc->tee_interface;
>> +	struct tee_ioctl_invoke_arg arg;
>> +	int ret;
>> +
>> +	if (!trproc)
>> +		return -EINVAL;
>> +
>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
>> +
>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
>> +	if (ret < 0 || arg.ret != 0) {
>> +		dev_err(tee_rproc_ctx->dev,
>> +			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
>> +			arg.ret, ret);
>> +		if (!ret)
>> +			ret = -EIO;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_stop);
>> +
>> +static const struct tee_client_device_id tee_rproc_id_table[] = {
>> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
>> +	{}
>> +};
>> +
>> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
>> +{
>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
>> +	struct tee_ioctl_open_session_arg sess_arg;
>> +	struct tee_client_device *tee_device;
>> +	struct tee_rproc *trproc, *p_err;
>> +	int ret;
>> +
>> +	/*
>> +	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
>> +	 * reason. The bus could be not yet probed or the service not available in the secure
>> +	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
>> +	 */
>> +	if (!tee_rproc_ctx)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	/* Prevent tee rproc module from being removed */
>> +	if (!try_module_get(THIS_MODULE)) {
>> +		dev_err(tee_rproc_ctx->dev, "can't get owner\n");
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
>> +	if (!trproc) {
>> +		p_err = ERR_PTR(-ENOMEM);
>> +		goto module_put;
>> +	}
>> +	tee_device = to_tee_client_device(tee_rproc_ctx->dev);
>> +	memset(&sess_arg, 0, sizeof(sess_arg));
>> +
>> +	memcpy(sess_arg.uuid, tee_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
>> +
>> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
>> +	sess_arg.num_params = 1;
>> +
>> +	param[0] = (struct tee_param) {
>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
>> +		.u.value.a = rproc_id,
>> +	};
>> +
>> +	ret = tee_client_open_session(tee_rproc_ctx->tee_ctx, &sess_arg, param);
>> +	if (ret < 0 || sess_arg.ret != 0) {
>> +		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
>> +		p_err = ERR_PTR(-EINVAL);
>> +		goto module_put;
>> +	}
>> +
>> +	trproc->parent = dev;
>> +	trproc->rproc_id = rproc_id;
>> +	trproc->session_id = sess_arg.session;
>> +
>> +	trproc->rproc = rproc;
>> +	rproc->tee_interface = trproc;
>> +
>> +	list_add_tail(&trproc->node, &tee_rproc_ctx->sessions);
>> +
>> +	return trproc;
>> +
>> +module_put:
>> +	module_put(THIS_MODULE);
>> +	return p_err;
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_register);
>> +
>> +int tee_rproc_unregister(struct tee_rproc *trproc)
>> +{
>> +	struct rproc *rproc = trproc->rproc;
>> +	int ret;
>> +
>> +	ret = tee_client_close_session(tee_rproc_ctx->tee_ctx, trproc->session_id);
>> +	if (ret < 0)
>> +		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
>> +
>> +	list_del(&trproc->node);
>> +	rproc->tee_interface = NULL;
>> +
>> +	module_put(THIS_MODULE);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tee_rproc_unregister);
>> +
>> +static int tee_rproc_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>> +{
>> +	/* Today we support only the OP-TEE, could be extend to other tees */
>> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
>> +}
>> +
>> +static int tee_rproc_probe(struct device *dev)
>> +{
>> +	struct tee_context *tee_ctx;
>> +	int ret;
>> +
>> +	/* Open context with TEE driver */
>> +	tee_ctx = tee_client_open_context(NULL, tee_rproc_ctx_match, NULL, NULL);
>> +	if (IS_ERR(tee_ctx))
>> +		return PTR_ERR(tee_ctx);
>> +
>> +	tee_rproc_ctx = devm_kzalloc(dev, sizeof(*tee_rproc_ctx), GFP_KERNEL);
>> +	if (!tee_rproc_ctx) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	tee_rproc_ctx->dev = dev;
>> +	tee_rproc_ctx->tee_ctx = tee_ctx;
>> +	INIT_LIST_HEAD(&tee_rproc_ctx->sessions);
>> +
>> +	return 0;
>> +err:
>> +	tee_client_close_context(tee_ctx);
>> +
>> +	return ret;
>> +}
>> +
>> +static int tee_rproc_remove(struct device *dev)
>> +{
>> +	struct tee_rproc *entry, *tmp;
>> +
>> +	list_for_each_entry_safe(entry, tmp, &tee_rproc_ctx->sessions, node) {
>> +		tee_client_close_session(tee_rproc_ctx->tee_ctx, entry->session_id);
>> +		list_del(&entry->node);
>> +		kfree(entry);
>> +	}
>> +
>> +	tee_client_close_context(tee_rproc_ctx->tee_ctx);
>> +
>> +	return 0;
>> +}
>> +
>> +MODULE_DEVICE_TABLE(tee, tee_rproc_id_table);
>> +
>> +static struct tee_client_driver tee_rproc_fw_driver = {
>> +	.id_table	= tee_rproc_id_table,
>> +	.driver		= {
>> +		.name		= KBUILD_MODNAME,
>> +		.bus		= &tee_bus_type,
>> +		.probe		= tee_rproc_probe,
>> +		.remove		= tee_rproc_remove,
>> +	},
>> +};
>> +
>> +static int __init tee_rproc_fw_mod_init(void)
>> +{
>> +	return driver_register(&tee_rproc_fw_driver.driver);
>> +}
>> +
>> +static void __exit tee_rproc_fw_mod_exit(void)
>> +{
>> +	driver_unregister(&tee_rproc_fw_driver.driver);
>> +}
>> +
>> +module_init(tee_rproc_fw_mod_init);
>> +module_exit(tee_rproc_fw_mod_exit);
>> +
>> +MODULE_DESCRIPTION(" remote processor support with a TEE application");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 8fd0d7f63c8e..fbe1d6793709 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -503,6 +503,8 @@ enum rproc_features {
>>  	RPROC_MAX_FEATURES,
>>  };
>>  
>> +struct tee_rproc;
>> +
>>  /**
>>   * struct rproc - represents a physical remote processor device
>>   * @node: list node of this rproc object
>> @@ -545,6 +547,7 @@ enum rproc_features {
>>   * @cdev: character device of the rproc
>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>>   * @features: indicate remoteproc features
>> + * @tee_interface: pointer to the remoteproc tee context
>>   */
>>  struct rproc {
>>  	struct list_head node;
>> @@ -586,6 +589,7 @@ struct rproc {
>>  	struct cdev cdev;
>>  	bool cdev_put_on_release;
>>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
>> +	struct tee_rproc *tee_interface;
>>  };
>>  
>>  /**
>> diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
>> new file mode 100644
>> index 000000000000..ccf34a218d54
>> --- /dev/null
>> +++ b/include/linux/remoteproc_tee.h
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright(c) 2024 STMicroelectronics
>> + */
>> +
>> +#ifndef REMOTEPROC_TEE_H
>> +#define REMOTEPROC_TEE_H
>> +
>> +#include <linux/tee_drv.h>
>> +#include <linux/firmware.h>
>> +#include <linux/remoteproc.h>
>> +
>> +struct rproc;
>> +
>> +/**
>> + * struct tee_rproc - TEE remoteproc structure
>> + * @node:		Reference in list
>> + * @rproc:		Remoteproc reference
>> + * @parent:		Parent device
>> + * @rproc_id:		Identifier of the target firmware
>> + * @session_id:		TEE session identifier
>> + */
>> +struct tee_rproc {
>> +	struct list_head node;
>> +	struct rproc *rproc;
>> +	struct device *parent;
>> +	u32 rproc_id;
>> +	u32 session_id;
>> +};
>> +
>> +#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
>> +
>> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
>> +				     unsigned int rproc_id);
>> +int tee_rproc_unregister(struct tee_rproc *trproc);
>> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw);
>> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw);
>> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
>> +						       const struct firmware *fw);
>> +int tee_rproc_start(struct rproc *rproc);
>> +int tee_rproc_stop(struct rproc *rproc);
>> +
>> +#else
>> +
>> +static inline struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
>> +						   unsigned int rproc_id)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +
>> +static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int tee_rproc_unregister(struct tee_rproc *trproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int tee_rproc_load_fw(struct rproc *rproc,  const struct firmware *fw)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int tee_rproc_start(struct rproc *rproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int tee_rproc_stop(struct rproc *rproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline struct resource_table *
>> +tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return NULL;
>> +}
>> +#endif /* CONFIG_REMOTEPROC_TEE */
>> +#endif /* REMOTEPROC_TEE_H */
>> -- 
>> 2.25.1
>>
