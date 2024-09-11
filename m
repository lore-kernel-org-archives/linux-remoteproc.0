Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5D1AC426
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Sep 2024 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726067847; cv=none; b=jF7BghNj/X7tr3JEm/FIJr1QIkuvgsPssAYSb8N0QGT5zQ+toGCPOZW1QjhfJOBcFHDqKsQ9fbQnTKvDYZkaWtQxA/+6opRV4spTgtE9GDpqx2AbzbJk1mpWmlqn2M0CZCVITNADiAtZ7qKGkwwQP4n0/fy1nKJqjSw+VSzRXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726067847; c=relaxed/simple;
	bh=D6SNYqQEdmOmJ9/2mMJXbbd1fJCI/+I3lDRBHMvdSug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNU/JsNIIUOgaK1RjBUAUmwiEBRcFKPX+STDPrXgWI5UVdCz9oi6li+2aXn8rQ6c1BhVHMHdflxqX85oueI7xKt/mMpB6TjC1c/G5761/thlRmU0K3phGqjMbPKdToRqwRzBXCjIxjzgpdu77SdYmH/HCUu5eUF7dv4tPuD6KSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdrcXOVs; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdrcXOVs"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718e11e4186so1999868b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Sep 2024 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726067844; x=1726672644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfhjQRdRLw3MNtyMcFIRdcZDSaKbbDUDtoZNxNvSUdY=;
        b=KdrcXOVsTwgRibqO2VExvLmTxP08ZwKyZunkMWZDpRGhskJgqySybEMLi7Ox7jEqtW
         z67iMm41F2IAN4MkFEZzSbCtky3EIYlVKOy9qGkWiHqCiP4LNi+3XJWkzaOTExbn69hY
         YxmGwtax8U2ouONZlDcv9OhfY7U0IL8PDKrc66PKCARjqQj0Pf+1FCUXSGH/R0SvKKbf
         TmtaKnkD2cNoayW+NMnCD6L1TKIik54tXNwOYwBuDqcaKk16dOwpqvHyd/WIfg6wbHst
         P4dxJ4hKLU7ikj2c8YjzQhpMNI50h5PgLDev9pcEjN/D8ltwhcYGEwJ525WwrCEUxcHf
         xTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726067844; x=1726672644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfhjQRdRLw3MNtyMcFIRdcZDSaKbbDUDtoZNxNvSUdY=;
        b=hV+g2YSlbR0LXtxS9GPvdP/SYnVJdcqfj8P68Nob7uuDTfVATtrKjR3JK0jStdKkxI
         Y9L5eN7yDUkW4mQ7PK34VikSXV/kmz5ohFd4maGiI2956FzfggQnBvvX3lH/xjbbEoVi
         og6vOIb3+N73iKv/iP9maasPgViIOKBtvFJKHh0WGBnFhEcURBGIBWYYxt3sReQ4ZYt2
         1evi5u/P61ZhPlXGC8cV0CDaIIDHS1gE40VHJaR1CxtAuz+9o9d3DNQRioZj1SewN1WD
         Qk6vWDEAWQzK3NGkPc2mbNzy2bZGZhvhLnIZu8HGcq8QjPamefiWPJ501o6g1BkFAUK4
         nrBg==
X-Forwarded-Encrypted: i=1; AJvYcCVZjHa93bz+Im8Wk1nb3PkgKbmSHmcLl77cfE/U8nW5Uo1xLBys0kNU/fbz3rJp/s8K6RSLAKDwgpsVHJxEeVaU@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMC7l1EsaOT71fD8Jjci3dY2WXF8bVuwNYj+p/QelfLL6yrHI
	t2KpNAbHXKw6vF3KPdYN64Ky6T9+79GZItw11l1D0r50+IpuA6Rxbbsc/i5BowA=
X-Google-Smtp-Source: AGHT+IEgEEHQ319dylct111BVdonmRF4lvAoQbM93NqGgxblsB8ur8Sj3EAWbcW+vqy4FuK5mHi29Q==
X-Received: by 2002:a05:6a20:4499:b0:1ce:d418:a45c with SMTP id adf61e73a8af0-1cf62d88a65mr3842641637.50.1726067843469;
        Wed, 11 Sep 2024 08:17:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc9a:9892:2799:3634])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd44asm820645ad.125.2024.09.11.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:17:22 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:17:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 2/7] remoteproc: Add TEE support
Message-ID: <ZuG0gEw1MQXi5nHB@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-3-arnaud.pouliquen@foss.st.com>

On Fri, Aug 30, 2024 at 11:51:42AM +0200, Arnaud Pouliquen wrote:
> Add a remoteproc TEE (Trusted Execution Environment) driver
> that will be probed by the TEE bus. If the associated Trusted
> application is supported on secure part this driver offers a client
> interface to load a firmware by the secure part.
> This firmware could be authenticated by the secure trusted application.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates vs previous version:
> - add TA_RPROC_CMD_RELEASE_FW TEE command support to release firmware resources,
> - add tee_rproc_release_fw() API that will be called by the remoteproc core,
> - release the firmware resources in case of error in tee_rproc_parse_fw() function
> ---
>  drivers/remoteproc/Kconfig          |  10 +
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/remoteproc_tee.c | 486 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h          |   4 +
>  include/linux/remoteproc_tee.h      | 109 +++++++
>  5 files changed, 610 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>  create mode 100644 include/linux/remoteproc_tee.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index dda2ada215b7..93c3de7727bb 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -366,6 +366,16 @@ config XLNX_R5_REMOTEPROC
>  
>  	  It's safe to say N if not interested in using RPU r5f cores.
>  
> +
> +config REMOTEPROC_TEE
> +	tristate "Remoteproc support by a TEE application"
> +	depends on OPTEE
> +	help
> +	  Support a remote processor with a TEE application. The Trusted
> +	  Execution Context is responsible for loading the trusted firmware
> +	  image and managing the remote processor's lifecycle.
> +	  This can be either built-in or a loadable module.
> +
>  endif # REMOTEPROC
>  
>  endmenu
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 91314a9b43ce..b4eb37177005 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
>  obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
>  obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
> new file mode 100644
> index 000000000000..d4a10c99f6e1
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_tee.c
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) STMicroelectronics 2024
> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> + */
> +
> +#include <linux/firmware.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
> +#include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +
> +#define MAX_TEE_PARAM_ARRY_MEMBER	4

s/MAX_TEE_PARAM_ARRY_MEMBER/MAX_TEE_PARAM_ARRAY_MEMBER

Comments for this patchset will be staggered over several days.  I will let you
know when I am done.

> +
> +/*
> + * Authentication of the firmware and load in the remote processor memory
> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> + * [in]	 params[1].memref:	buffer containing the image of the buffer
> + */
> +#define TA_RPROC_FW_CMD_LOAD_FW		1
> +
> +/*
> + * Start the remote processor
> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> + */
> +#define TA_RPROC_FW_CMD_START_FW	2
> +
> +/*
> + * Stop the remote processor
> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> + */
> +#define TA_RPROC_FW_CMD_STOP_FW		3
> +
> +/*
> + * Return the address of the resource table, or 0 if not found
> + * No check is done to verify that the address returned is accessible by
> + * the non secure context. If the resource table is loaded in a protected
> + * memory the access by the non secure context will lead to a data abort.
> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> + * [out]  params[1].value.a:	32bit LSB resource table memory address
> + * [out]  params[1].value.b:	32bit MSB resource table memory address
> + * [out]  params[2].value.a:	32bit LSB resource table memory size
> + * [out]  params[2].value.b:	32bit MSB resource table memory size
> + */
> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
> +
> +/*
> + * Return the address of the core dump
> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> + * [out] params[1].memref:	address of the core dump image if exist,
> + *				else return Null
> + */
> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
> +
> +/*
> + * Release remote processor firmware images and associated resources.
> + * This command should be used in case an error occurs between the loading of
> + * the firmware images (A_RPROC_CMD_LOAD_FW) and the starting of the remote
> + * processor (TA_RPROC_CMD_START_FW) or after stopping the remote processor
> + * to release associated resources (TA_RPROC_CMD_STOP_FW).
> + *
> + * [in]  params[0].value.a: Unique 32-bit remote processor identifier
> + */
> +#define TA_RPROC_CMD_RELEASE_FW		6
> +
> +struct tee_rproc_context {
> +	struct list_head sessions;
> +	struct tee_context *tee_ctx;
> +	struct device *dev;
> +};
> +
> +static struct tee_rproc_context *tee_rproc_ctx;
> +
> +static void tee_rproc_prepare_args(struct tee_rproc *trproc, int cmd,
> +				   struct tee_ioctl_invoke_arg *arg,
> +				   struct tee_param *param,
> +				   unsigned int num_params)
> +{
> +	memset(arg, 0, sizeof(*arg));
> +	memset(param, 0, MAX_TEE_PARAM_ARRY_MEMBER * sizeof(*param));
> +
> +	arg->func = cmd;
> +	arg->session = trproc->session_id;
> +	arg->num_params = num_params + 1;
> +
> +	param[0] = (struct tee_param) {
> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +		.u.value.a = trproc->rproc_id,
> +	};
> +}
> +
> +int tee_rproc_release_fw(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> +	struct tee_rproc *trproc = rproc->tee_interface;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	tee_rproc_prepare_args(trproc, TA_RPROC_CMD_RELEASE_FW, &arg, param, 0);
> +
> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(tee_rproc_ctx->dev,
> +			"TA_RPROC_CMD_RELEASE_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_release_fw);
> +
> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> +	struct tee_rproc *trproc = rproc->tee_interface;
> +	struct tee_ioctl_invoke_arg arg;
> +	struct tee_shm *fw_shm;
> +	int ret;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
> +	if (IS_ERR(fw_shm))
> +		return PTR_ERR(fw_shm);
> +
> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
> +
> +	/* Provide the address of the firmware image */
> +	param[1] = (struct tee_param) {
> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
> +		.u.memref = {
> +			.shm = fw_shm,
> +			.size = fw->size,
> +			.shm_offs = 0,
> +		},
> +	};
> +
> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(tee_rproc_ctx->dev,
> +			"TA_RPROC_FW_CMD_LOAD_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		if (!ret)
> +			ret = -EIO;
> +	}
> +
> +	tee_shm_free(fw_shm);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_load_fw);
> +
> +static int tee_rproc_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
> +					  size_t *table_sz)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> +	struct tee_rproc *trproc = rproc->tee_interface;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
> +
> +	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> +	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> +
> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(tee_rproc_ctx->dev,
> +			"TA_RPROC_FW_CMD_GET_RSC_TABLE invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		return -EIO;
> +	}
> +
> +	*table_sz = param[2].u.value.a;
> +
> +	if (*table_sz)
> +		*rsc_pa = param[1].u.value.a;
> +	else
> +		*rsc_pa  = 0;
> +
> +	return 0;
> +}
> +
> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	phys_addr_t rsc_table;
> +	void __iomem *rsc_va;
> +	size_t table_sz;
> +	int ret;
> +
> +	ret = tee_rproc_load_fw(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
> +	if (ret)
> +		goto release_fw;
> +
> +	/*
> +	 * We assume here that the memory mapping is the same between the TEE and Linux kernel
> +	 * contexts. Else a new TEE remoteproc service could be needed to get a copy of the
> +	 * resource table
> +	 */
> +	rsc_va = ioremap_wc(rsc_table, table_sz);
> +	if (IS_ERR_OR_NULL(rsc_va)) {
> +		dev_err(tee_rproc_ctx->dev, "Unable to map memory region: %pa+%zx\n",
> +			&rsc_table, table_sz);
> +		ret = -ENOMEM;
> +		goto release_fw;
> +	}
> +
> +	/*
> +	 * Create a copy of the resource table to have the same behavior as the elf loader.
> +	 * This cached table will be used after the remoteproc stops to free resources, and for
> +	 * crash recovery to reapply the settings.
> +	 */
> +	rproc->cached_table = kmemdup((__force void *)rsc_va, table_sz, GFP_KERNEL);
> +	iounmap(rsc_va);
> +
> +	if (!rproc->cached_table) {
> +		ret = -ENOMEM;
> +		goto release_fw;
> +	}
> +
> +	rproc->table_ptr = rproc->cached_table;
> +	rproc->table_sz = table_sz;
> +
> +	return 0;
> +
> +release_fw:
> +	tee_rproc_release_fw(rproc);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_parse_fw);
> +
> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
> +						       const struct firmware *fw)
> +{
> +	struct tee_rproc *trproc = rproc->tee_interface;
> +	phys_addr_t rsc_table;
> +	size_t table_sz;
> +	int ret;
> +
> +	if (!trproc)
> +		return NULL;
> +
> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
> +	if (ret)
> +		return NULL;
> +
> +	rproc->table_sz = table_sz;
> +	if (!table_sz)
> +		return NULL;
> +
> +	/*
> +	 * At this step the memory area that contains the resource table should have been registered
> +	 * by the remote proc platform driver and allocated by rproc_alloc_registered_carveouts().
> +	 */
> +	return (struct resource_table *)rproc_pa_to_va(rproc, rsc_table, table_sz, NULL);
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_find_loaded_rsc_table);
> +
> +int tee_rproc_start(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> +	struct tee_rproc *trproc = rproc->tee_interface;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret = 0;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
> +
> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(tee_rproc_ctx->dev,
> +			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		if (!ret)
> +			return  -EIO;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_start);
> +
> +int tee_rproc_stop(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> +	struct tee_rproc *trproc = rproc->tee_interface;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
> +
> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(tee_rproc_ctx->dev,
> +			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		if (!ret)
> +			ret = -EIO;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_stop);
> +
> +static const struct tee_client_device_id tee_rproc_id_table[] = {
> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
> +	{}
> +};
> +
> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> +	struct tee_ioctl_open_session_arg sess_arg;
> +	struct tee_client_device *tee_device;
> +	struct tee_rproc *trproc, *p_err;
> +	int ret;
> +
> +	/*
> +	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
> +	 * reason. The bus could be not yet probed or the service not available in the secure
> +	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
> +	 */
> +	if (!tee_rproc_ctx)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	/* Prevent tee rproc module from being removed */
> +	if (!try_module_get(THIS_MODULE)) {
> +		dev_err(tee_rproc_ctx->dev, "can't get owner\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
> +	if (!trproc) {
> +		p_err = ERR_PTR(-ENOMEM);
> +		goto module_put;
> +	}
> +	tee_device = to_tee_client_device(tee_rproc_ctx->dev);
> +	memset(&sess_arg, 0, sizeof(sess_arg));
> +
> +	memcpy(sess_arg.uuid, tee_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
> +
> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
> +	sess_arg.num_params = 1;
> +
> +	param[0] = (struct tee_param) {
> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +		.u.value.a = rproc_id,
> +	};
> +
> +	ret = tee_client_open_session(tee_rproc_ctx->tee_ctx, &sess_arg, param);
> +	if (ret < 0 || sess_arg.ret != 0) {
> +		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
> +		p_err = ERR_PTR(-EINVAL);
> +		goto module_put;
> +	}
> +
> +	trproc->parent = dev;
> +	trproc->rproc_id = rproc_id;
> +	trproc->session_id = sess_arg.session;
> +
> +	trproc->rproc = rproc;
> +	rproc->tee_interface = trproc;
> +
> +	list_add_tail(&trproc->node, &tee_rproc_ctx->sessions);
> +
> +	return trproc;
> +
> +module_put:
> +	module_put(THIS_MODULE);
> +	return p_err;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_register);
> +
> +int tee_rproc_unregister(struct tee_rproc *trproc)
> +{
> +	struct rproc *rproc = trproc->rproc;
> +	int ret;
> +
> +	ret = tee_client_close_session(tee_rproc_ctx->tee_ctx, trproc->session_id);
> +	if (ret < 0)
> +		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
> +
> +	list_del(&trproc->node);
> +	rproc->tee_interface = NULL;
> +
> +	module_put(THIS_MODULE);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tee_rproc_unregister);
> +
> +static int tee_rproc_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	/* Today we support only the OP-TEE, could be extend to other tees */
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> +}
> +
> +static int tee_rproc_probe(struct device *dev)
> +{
> +	struct tee_context *tee_ctx;
> +	int ret;
> +
> +	/* Open context with TEE driver */
> +	tee_ctx = tee_client_open_context(NULL, tee_rproc_ctx_match, NULL, NULL);
> +	if (IS_ERR(tee_ctx))
> +		return PTR_ERR(tee_ctx);
> +
> +	tee_rproc_ctx = devm_kzalloc(dev, sizeof(*tee_rproc_ctx), GFP_KERNEL);
> +	if (!tee_rproc_ctx) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	tee_rproc_ctx->dev = dev;
> +	tee_rproc_ctx->tee_ctx = tee_ctx;
> +	INIT_LIST_HEAD(&tee_rproc_ctx->sessions);
> +
> +	return 0;
> +err:
> +	tee_client_close_context(tee_ctx);
> +
> +	return ret;
> +}
> +
> +static int tee_rproc_remove(struct device *dev)
> +{
> +	struct tee_rproc *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &tee_rproc_ctx->sessions, node) {
> +		tee_client_close_session(tee_rproc_ctx->tee_ctx, entry->session_id);
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +
> +	tee_client_close_context(tee_rproc_ctx->tee_ctx);
> +
> +	return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(tee, tee_rproc_id_table);
> +
> +static struct tee_client_driver tee_rproc_fw_driver = {
> +	.id_table	= tee_rproc_id_table,
> +	.driver		= {
> +		.name		= KBUILD_MODNAME,
> +		.bus		= &tee_bus_type,
> +		.probe		= tee_rproc_probe,
> +		.remove		= tee_rproc_remove,
> +	},
> +};
> +
> +static int __init tee_rproc_fw_mod_init(void)
> +{
> +	return driver_register(&tee_rproc_fw_driver.driver);
> +}
> +
> +static void __exit tee_rproc_fw_mod_exit(void)
> +{
> +	driver_unregister(&tee_rproc_fw_driver.driver);
> +}
> +
> +module_init(tee_rproc_fw_mod_init);
> +module_exit(tee_rproc_fw_mod_exit);
> +
> +MODULE_DESCRIPTION(" remote processor support with a TEE application");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 8fd0d7f63c8e..fbe1d6793709 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -503,6 +503,8 @@ enum rproc_features {
>  	RPROC_MAX_FEATURES,
>  };
>  
> +struct tee_rproc;
> +
>  /**
>   * struct rproc - represents a physical remote processor device
>   * @node: list node of this rproc object
> @@ -545,6 +547,7 @@ enum rproc_features {
>   * @cdev: character device of the rproc
>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>   * @features: indicate remoteproc features
> + * @tee_interface: pointer to the remoteproc tee context
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -586,6 +589,7 @@ struct rproc {
>  	struct cdev cdev;
>  	bool cdev_put_on_release;
>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
> +	struct tee_rproc *tee_interface;
>  };
>  
>  /**
> diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
> new file mode 100644
> index 000000000000..ab4d9b29c04b
> --- /dev/null
> +++ b/include/linux/remoteproc_tee.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright(c) 2024 STMicroelectronics
> + */
> +
> +#ifndef REMOTEPROC_TEE_H
> +#define REMOTEPROC_TEE_H
> +
> +#include <linux/tee_drv.h>
> +#include <linux/firmware.h>
> +#include <linux/remoteproc.h>
> +
> +struct rproc;
> +
> +/**
> + * struct tee_rproc - TEE remoteproc structure
> + * @node:		Reference in list
> + * @rproc:		Remoteproc reference
> + * @parent:		Parent device
> + * @rproc_id:		Identifier of the target firmware
> + * @session_id:		TEE session identifier
> + */
> +struct tee_rproc {
> +	struct list_head node;
> +	struct rproc *rproc;
> +	struct device *parent;
> +	u32 rproc_id;
> +	u32 session_id;
> +};
> +
> +#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
> +
> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
> +				     unsigned int rproc_id);
> +int tee_rproc_unregister(struct tee_rproc *trproc);
> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw);
> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw);
> +int tee_rproc_release_fw(struct rproc *rproc);
> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
> +						       const struct firmware *fw);
> +int tee_rproc_start(struct rproc *rproc);
> +int tee_rproc_stop(struct rproc *rproc);
> +
> +#else
> +
> +static inline struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
> +						   unsigned int rproc_id)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int tee_rproc_unregister(struct tee_rproc *trproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int tee_rproc_load_fw(struct rproc *rproc,  const struct firmware *fw)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int tee_rproc_start(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int tee_rproc_stop(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int tee_rproc_release_fw(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline struct resource_table *
> +tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return NULL;
> +}
> +#endif /* CONFIG_REMOTEPROC_TEE */
> +#endif /* REMOTEPROC_TEE_H */
> -- 
> 2.25.1
> 
