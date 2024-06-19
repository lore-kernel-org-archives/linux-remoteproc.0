Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060D200AE;
	Wed, 19 Jun 2024 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718814877; cv=none; b=dTuO/UqX3iK8eeKJNHdvawcl9Nr1+qs3G3FoS2iu9DTuZugYFl2Rd6C44Ozmi52hCaUD7Tyx1Mdu1KHtFwBD3VXgdwT3E5nfvucHg32AdSPf9tV3cGapxNPPNO5VyDMcWW8zH3vL66G1u5etL9shctKHO3wZjGBZ4tIYz1E3OoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718814877; c=relaxed/simple;
	bh=vogObXz6xG9tf5hibn6rGBSneiwOKO2TsQbeCgdsssg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O0x4OYQMyUrRxjcluAUzdzBJf3HzwXQDgzRaHGETLUVCGmvIoAnAy/Sak4zljxGn3IJUlYJ8YZgfg2Hs3BvEggjsUydrqZt7j5RCg+FW43cJVGaGBgp0iLLTVoKzMxAPZ3cUH9Euzd9QbJRJ4kXr9wj96hIDOrglADArtHx3yIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=yKC+8ox+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yKC+8ox+"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JCHv1u002270;
	Wed, 19 Jun 2024 18:34:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pmYmBq+jonH8KQpLIzKB0S1XD/i496ShTwP/flxtcYQ=; b=yKC+8ox+wGybVcg9
	Auk5rnBaYWk6uoK5U0S3CRm9sfiwQIE7pG/2jaRJqZgHp9jSTKDeqxdVjmrbyIxL
	8uiWQm5uj4DFN8VLXs5PK9DA9s0VtXZTXVo3I5/nawJCBtoIomhyAZYIPr1LWQLH
	Js9XdWS8u1y5boTvTZR9sQiADEl0VbHllVhAOYuwhfoiWVVtC82KB0cfsxwI9r+j
	jq9PySiFSs6ur1vP7CLrbhY46bgYj3z1PT2qVKHss2y7o0gIS9hwi4e8Bg6kkCAD
	YGMe1z2wbocm0K6SLjEFnWBB2QcQR2KnU+MCyhLCMqAY55V1ZbnrcGlT5yP8zrWN
	ZgCr9A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9n4gq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:34:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 77D3B4002D;
	Wed, 19 Jun 2024 18:33:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9991221961;
	Wed, 19 Jun 2024 18:33:06 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 18:33:06 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 18:33:05 +0200
Message-ID: <e4c07c98-be03-489b-9e56-6a0c0ed27c37@foss.st.com>
Date: Wed, 19 Jun 2024 18:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] remoteproc: Add TEE support
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
References: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
 <20240611073904.475019-3-arnaud.pouliquen@foss.st.com>
 <ZnL8Po+VnaabrTtZ@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZnL8Po+VnaabrTtZ@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01

Hi,

On 6/19/24 17:41, Mathieu Poirier wrote:
> Hi,
> 
> On Tue, Jun 11, 2024 at 09:39:01AM +0200, Arnaud Pouliquen wrote:
>> Add a remoteproc TEE (Trusted Execution Environment) driver
>> that will be probed by the TEE bus. If the associated Trusted
>> application is supported on secure part this driver offers a client
>> interface to load a firmware in the secure part.
>> This firmware could be authenticated by the secure trusted application.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> update from V
>> - Fix missing "{" in tee_rproc_find_loaded_rsc_table inline definition.
>>
>> update from V5
>> - make tee_rproc_get_loaded_rsc_table() local and replace this API by
>>   tee_rproc_find_loaded_rsc_table()
>> - map and unmap the resource table in tee_rproc_parse_fw to make a cached copy
>> - use the new rproc_pa_to_va() API to map the resource table memory declared in carevout
>> - remove tee_rproc_release_loaded_rsc_table as no more used.
>> ---
>>  drivers/remoteproc/Kconfig          |  10 +
>>  drivers/remoteproc/Makefile         |   1 +
>>  drivers/remoteproc/tee_remoteproc.c | 451 ++++++++++++++++++++++++++++
>>  include/linux/remoteproc.h          |   4 +
>>  include/linux/tee_remoteproc.h      | 100 ++++++
>>  5 files changed, 566 insertions(+)
>>  create mode 100644 drivers/remoteproc/tee_remoteproc.c
>>  create mode 100644 include/linux/tee_remoteproc.h
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 48845dc8fa85..6c1c07202276 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -365,6 +365,16 @@ config XLNX_R5_REMOTEPROC
>>  
>>  	  It's safe to say N if not interested in using RPU r5f cores.
>>  
>> +
>> +config TEE_REMOTEPROC
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
>> index 91314a9b43ce..fa8daebce277 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>> +obj-$(CONFIG_TEE_REMOTEPROC)		+= tee_remoteproc.o
>>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
>>  obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
>>  obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
>> diff --git a/drivers/remoteproc/tee_remoteproc.c b/drivers/remoteproc/tee_remoteproc.c
>> new file mode 100644
>> index 000000000000..9455fd9d0d2d
>> --- /dev/null
>> +++ b/drivers/remoteproc/tee_remoteproc.c
>> @@ -0,0 +1,451 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> + */
>> +
>> +#include <linux/firmware.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/remoteproc.h>
>> +#include <linux/slab.h>
>> +#include <linux/tee_drv.h>
>> +#include <linux/tee_remoteproc.h>
>> +
>> +#include "remoteproc_internal.h"
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
>> +
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
>> +static const struct tee_client_device_id stm32_tee_rproc_id_table[] = {
>> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905,
>> +		   0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
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
>> +		p_err = ERR_PTR(-ENODEV);
>> +		goto module_put;
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
>> +	trproc->parent =  dev;
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
>> +	tee_rproc_ctx = devm_kzalloc(dev, sizeof(*tee_ctx), GFP_KERNEL);
> 
> I started reviewing this set - aside from the above allocation that isn't right,
> I am definitely not sure about ops::pa_to_va().  There is a patchset from TI on
> the mailing list [1] that also needs to translate addresses only accessible to
> the remote processor and they simply enhanced their ops::da_to_va().  Perhaps
> I'll find an answer as I continue to review this set...


The DA to PA conversion is handled by OP-TEE when loading the firmware.
Therefore, I have assumed that Linux could not know how to convert from DA to
PA. This question is also relevant for the "attach" use case, I guess.

If we consider that the DA to VA conversion should always be supported by the
remoteproc driver, we would need to obtain the DA from OP-TEE.

The impact would be to update the TA_RPROC_FW_CMD_GET_RSC_TABLE API to also
return the DA. This would require changes in the OP-TEE code by adding a new
output parameter to retrieve the DA.

Thanks,
Arnaud


> 
> [1]. [PATCH v10 0/8] TI K3 M4F support on AM62 and AM64 SoCs
> 
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
>> +MODULE_DEVICE_TABLE(tee, stm32_tee_rproc_id_table);
>> +
>> +static struct tee_client_driver tee_rproc_fw_driver = {
>> +	.id_table	= stm32_tee_rproc_id_table,
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
>> +MODULE_DESCRIPTION(" TEE remote processor control driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 28aa62a3b505..6168f778414f 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -505,6 +505,8 @@ enum rproc_features {
>>  	RPROC_MAX_FEATURES,
>>  };
>>  
>> +struct tee_rproc;
>> +
>>  /**
>>   * struct rproc - represents a physical remote processor device
>>   * @node: list node of this rproc object
>> @@ -547,6 +549,7 @@ enum rproc_features {
>>   * @cdev: character device of the rproc
>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>>   * @features: indicate remoteproc features
>> + * @tee_interface: pointer to the remoteproc tee context
>>   */
>>  struct rproc {
>>  	struct list_head node;
>> @@ -588,6 +591,7 @@ struct rproc {
>>  	struct cdev cdev;
>>  	bool cdev_put_on_release;
>>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
>> +	struct tee_rproc *tee_interface;
>>  };
>>  
>>  /**
>> diff --git a/include/linux/tee_remoteproc.h b/include/linux/tee_remoteproc.h
>> new file mode 100644
>> index 000000000000..c9ae4f60e844
>> --- /dev/null
>> +++ b/include/linux/tee_remoteproc.h
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright(c) 2024 STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#ifndef TEE_REMOTEPROC_H
>> +#define TEE_REMOTEPROC_H
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
>> +#if IS_REACHABLE(CONFIG_TEE_REMOTEPROC)
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
>> +#endif /* CONFIG_TEE_REMOTEPROC */
>> +#endif /* TEE_REMOTEPROC_H */
>> -- 
>> 2.25.1
>>
