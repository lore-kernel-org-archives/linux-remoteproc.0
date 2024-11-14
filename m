Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14F18C90E
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Nov 2024 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731607175; cv=none; b=RA0oD5pyrutswKkQbyzfqa2Opu887eB60cSsZAooR9rOaW/s842MAZmfRhgk29y0t9HX3U5OCg3Yh8jt7VR2/YKEixp9odXCEcJ8pc8Ozjb4eJCxZ+rZHUDhQNyWXskF66ZvpG3t2TmV56Hp8s9qymEeYrfKgsGtsZpcF2pk2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731607175; c=relaxed/simple;
	bh=TbQjumOUSB5053y2uCQC+SR7MhLoFGR+yDaDUgCxkqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2FX81BZYtQmG4pRF47ug7U2mVILvhCO28kwM23AGeHTwALJmkm8H+/WbRO5eAhOdaOdeSrzdU6wbYXcu8c4A0qFRakk8MkavaUmuImISZa2GipXvigAWaT739wscRUMTGEObWOVpH03WK/A2wIzhd4Z5yKCdVBkHmJKsg3k5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZxPBLKD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZxPBLKD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72475e29578so14923b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Nov 2024 09:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731607171; x=1732211971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsBJWfJQgavP2i1OwpKo82x3yab7prry5Egon02cetk=;
        b=HZxPBLKDIjGAofO2qY+DxONnvlU7oPL6a5HpOoRZqknJUMIk5mdXqpQO7eZjI1BULS
         hdiQNeKzQxs6DWsuxboY/iiAFWSlj9S9icytZKIBLq2kVjfPzeW/kzCaiRrGbNFPW2T0
         +f8TVCcEwWgDV98m77UwzCOPU5JArZvHA6MGc+XZxqMHxBEOMYZ+UwOKKhOSHDTPNFFE
         x+izCCUr/RLyC4M3orDDgSa7j55CUalNlwRhA8bs2049zq3OekXhuZuimXmx4gMUqIBu
         /HFBqzHyAuGqn+OnwdPHbrOBvPMLVfrrFGXHSBLtYOuWiASEncwR1R51P/KgP7g5sH8P
         YpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731607171; x=1732211971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsBJWfJQgavP2i1OwpKo82x3yab7prry5Egon02cetk=;
        b=nrD1Qv/+G4ijQNQYtI9rLFpspur9IGzyTm8YjyhxzGEZGo4IUneutZf8HJcLy+SyED
         9s2gndSIKXrnaDggylZ9wwwbGpyS1HyrAs60oEJxsTOAJmG4FJo+oTMybgp0fKmfBaaB
         vjRbgkniSdJvrahAeblbk8yTVfuRzs/KhX29dbd7oetM6Dsymt/yEmE6w4Bnk21Rsoj3
         hZkBKprH7sLX2QpPuClxzzwaXpbiBsePb2tebtoNinLKHiIRhpRadI4Ep+FWmtrIawWs
         c8/hz0sAGb1DuTv1j+CApRT++gsTNnPPR7OIjOEmCboa+b2bwXJ6tLawRdZA4LBpryBn
         X+mw==
X-Forwarded-Encrypted: i=1; AJvYcCWjJ74hMSa+E04heEOZolW77utF1b7pz52luE0fUf54P0BgXEb+fvDIXavf+OhExf5QiKXqIrgonH2EinQyp4h2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTVBeHuyvQ9BLzpfGI6kqy5gUr3RxRXhcaCk+cdir7fMjxlB6
	Kxy6D8jF/ARiITtJGfU0MliVAn7M1TMCe5hHt/oxpJRtPj6cPUej6eHuwyl+Ego=
X-Google-Smtp-Source: AGHT+IHkgPWeFyfJ5h8fm3rKFlhOUK6Nlah851DTej9dXuAKXwYfiD4FF/ko/8VO1DJE/P0BEIvg5w==
X-Received: by 2002:a17:90b:524e:b0:2e2:cba1:67c9 with SMTP id 98e67ed59e1d1-2e9f2d60c0amr9129071a91.35.1731607171223;
        Thu, 14 Nov 2024 09:59:31 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:d240:c440:31fa:1568])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c4a551sm13511155ad.83.2024.11.14.09.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 09:59:30 -0800 (PST)
Date: Thu, 14 Nov 2024 10:59:27 -0700
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
Subject: Re: [PATCH v13 2/7] remoteproc: Add TEE support
Message-ID: <ZzY6f9rYqRzxkcgt@p14s>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104133515.256497-3-arnaud.pouliquen@foss.st.com>

On Mon, Nov 04, 2024 at 02:35:10PM +0100, Arnaud Pouliquen wrote:
> Add a remoteproc TEE (Trusted Execution Environment) driver
> that will be probed by the TEE bus. If the associated Trusted
> application is supported on secure part this driver offers a client
> interface to load a firmware by the secure part.
> This firmware could be authenticated by the secure trusted application.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from version V11:
> - rename structures, functions, and variables from "tee_rproc_xxx" to
>   "rproc_tee_xxx",
> - update rproc_tee_register to return an error instead of
>   "struct rproc_tee *" pointer,
> - update rproc_tee_unregister argument from "struct rproc_tee *trproc"
>   to "struct rproc *rproc",
> - reword MODULE_DESCRIPTION.
> ---
>  drivers/remoteproc/Kconfig          |  10 +
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/remoteproc_tee.c | 510 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h          |   4 +
>  include/linux/remoteproc_tee.h      | 105 ++++++
>  5 files changed, 630 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>  create mode 100644 include/linux/remoteproc_tee.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 955e4e38477e..d0284220a194 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -23,6 +23,16 @@ config REMOTEPROC_CDEV
>  
>  	  It's safe to say N if you don't want to use this interface.
>  
> +config REMOTEPROC_TEE
> +	tristate "Remoteproc support by a TEE application"

Tristate?  Didn't we agree this would be either compiled in or out, but not as a
module?

> +	depends on OPTEE
> +	help
> +	  Support a remote processor with a TEE application. The Trusted
> +	  Execution Context is responsible for loading the trusted firmware
> +	  image and managing the remote processor's lifecycle.
> +
> +	  It's safe to say N if you don't want to use remoteproc TEE.
> +
>  config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 5ff4e2fee4ab..f77e0abe8349 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
>  remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
> new file mode 100644
> index 000000000000..f258b9304daf
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_tee.c
> @@ -0,0 +1,510 @@
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
> +#define MAX_TEE_PARAM_ARRAY_MEMBER	4
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

s/A_RPROC_CMD_LOAD_FW/TA_RPROC_CMD_LOAD_FW

> + * processor (TA_RPROC_CMD_START_FW) or after stopping the remote processor
> + * to release associated resources (TA_RPROC_CMD_STOP_FW).
> + *
> + * [in]  params[0].value.a: Unique 32-bit remote processor identifier
> + */
> +#define TA_RPROC_CMD_RELEASE_FW		6
> +
> +struct rproc_tee_context {
> +	struct list_head sessions;
> +	struct tee_context *tee_ctx;
> +	struct device *dev;
> +};
> +
> +static struct rproc_tee_context *rproc_tee_ctx;
> +
> +static void rproc_tee_prepare_args(struct rproc_tee *trproc, int cmd,
> +				   struct tee_ioctl_invoke_arg *arg,
> +				   struct tee_param *param,
> +				   unsigned int num_params)
> +{
> +	memset(arg, 0, sizeof(*arg));
> +	memset(param, 0, MAX_TEE_PARAM_ARRAY_MEMBER * sizeof(*param));
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
> +void rproc_tee_release_fw(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	if (!rproc) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/*
> +	 * If the remote processor state is RPROC_DETACHED, just ignore the
> +	 * request, as the remote processor is still running.
> +	 */
> +	if (rproc->state == RPROC_DETACHED)
> +		return;
> +
> +	if (rproc->state != RPROC_OFFLINE) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	rproc_tee_prepare_args(trproc, TA_RPROC_CMD_RELEASE_FW, &arg, param, 0);
> +
> +	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(rproc_tee_ctx->dev,
> +			"TA_RPROC_CMD_RELEASE_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		ret = -EIO;
> +	}
> +
> +out:
> +	if (ret)
> +		/* Unexpected state without solution to come back in a stable state */
> +		dev_err(rproc_tee_ctx->dev, "Failed to release TEE remoteproc firmware: %d\n", ret);
> +}
> +EXPORT_SYMBOL_GPL(rproc_tee_release_fw);
> +
> +int rproc_tee_load_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	struct tee_ioctl_invoke_arg arg;
> +	struct tee_shm *fw_shm;
> +	int ret;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	fw_shm = tee_shm_register_kernel_buf(rproc_tee_ctx->tee_ctx, (void *)fw->data, fw->size);
> +	if (IS_ERR(fw_shm))
> +		return PTR_ERR(fw_shm);
> +
> +	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
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
> +	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(rproc_tee_ctx->dev,
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
> +EXPORT_SYMBOL_GPL(rproc_tee_load_fw);
> +
> +static int rproc_tee_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
> +					  size_t *table_sz)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
> +
> +	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> +	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> +
> +	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(rproc_tee_ctx->dev,
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
> +int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	phys_addr_t rsc_table;
> +	void __iomem *rsc_va;
> +	size_t table_sz;
> +	int ret;
> +
> +	if (!rproc)
> +		return -EINVAL;
> +
> +	ret = rproc_tee_load_fw(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	ret = rproc_tee_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
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
> +		dev_err(rproc_tee_ctx->dev, "Unable to map memory region: %pa+%zx\n",
> +			&rsc_table, table_sz);
> +		ret = -ENOMEM;
> +		goto release_fw;
> +	}
> +
> +	/*
> +	 * Create a copy of the resource table to have the same behavior as the ELF loader.
> +	 * This cached table will be used by the remoteproc core after the remoteproc stops
> +	 * to free resources and for crash recovery to reapply the settings.
> +	 * The cached table will be freed by the remoteproc core.
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
> +	rproc_tee_release_fw(rproc);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rproc_tee_parse_fw);
> +
> +struct resource_table *rproc_tee_find_loaded_rsc_table(struct rproc *rproc,
> +						       const struct firmware *fw)
> +{
> +	phys_addr_t rsc_table;
> +	size_t table_sz;
> +	int ret;
> +
> +	ret = rproc_tee_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
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
> +EXPORT_SYMBOL_GPL(rproc_tee_find_loaded_rsc_table);
> +
> +int rproc_tee_start(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret = 0;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
> +
> +	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(rproc_tee_ctx->dev,
> +			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		if (!ret)
> +			return  -EIO;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rproc_tee_start);
> +
> +int rproc_tee_stop(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	if (!trproc)
> +		return -EINVAL;
> +
> +	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
> +
> +	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(rproc_tee_ctx->dev,
> +			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
> +			arg.ret, ret);
> +		if (!ret)
> +			ret = -EIO;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rproc_tee_stop);
> +
> +static const struct tee_client_device_id rproc_tee_id_table[] = {
> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
> +	{}
> +};
> +
> +int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct tee_ioctl_open_session_arg sess_arg;
> +	struct tee_client_device *tee_device;
> +	struct rproc_tee *trproc;
> +	int ret;
> +
> +	/*
> +	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
> +	 * reason. The bus could be not yet probed or the service not available in the secure
> +	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
> +	 */
> +	if (!rproc_tee_ctx)
> +		return -EPROBE_DEFER;
> +
> +	/* Prevent rproc tee module from being removed */
> +	if (!try_module_get(THIS_MODULE)) {
> +		dev_err(rproc_tee_ctx->dev, "can't get owner\n");
> +		return -ENODEV;
> +	}
> +
> +	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
> +	if (!trproc) {
> +		ret = -ENOMEM;
> +		goto module_put;
> +	}
> +
> +	tee_device = to_tee_client_device(rproc_tee_ctx->dev);
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
> +	ret = tee_client_open_session(rproc_tee_ctx->tee_ctx, &sess_arg, param);
> +	if (ret < 0 || sess_arg.ret != 0) {
> +		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
> +		ret = -EINVAL;
> +		goto module_put;
> +	}
> +
> +	trproc->parent = dev;
> +	trproc->rproc_id = rproc_id;
> +	trproc->session_id = sess_arg.session;
> +
> +	trproc->rproc = rproc;
> +	rproc->rproc_tee_itf = trproc;
> +
> +	list_add_tail(&trproc->node, &rproc_tee_ctx->sessions);
> +
> +	return 0;
> +
> +module_put:
> +	module_put(THIS_MODULE);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rproc_tee_register);
> +
> +int rproc_tee_unregister(struct rproc *rproc)
> +{
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	int ret;
> +
> +	if (!rproc->rproc_tee_itf)
> +		return -ENODEV;
> +
> +	ret = tee_client_close_session(rproc_tee_ctx->tee_ctx, trproc->session_id);
> +	if (ret < 0)
> +		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
> +
> +	list_del(&trproc->node);
> +	rproc->rproc_tee_itf = NULL;
> +
> +	module_put(THIS_MODULE);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rproc_tee_unregister);
> +
> +static int rproc_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	/* Today we support only the OP-TEE, could be extend to other tees */
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> +}
> +
> +static int rproc_tee_probe(struct device *dev)
> +{
> +	struct tee_context *tee_ctx;
> +	int ret;
> +
> +	/* Open context with TEE driver */
> +	tee_ctx = tee_client_open_context(NULL, rproc_tee_ctx_match, NULL, NULL);
> +	if (IS_ERR(tee_ctx))
> +		return PTR_ERR(tee_ctx);
> +
> +	rproc_tee_ctx = devm_kzalloc(dev, sizeof(*rproc_tee_ctx), GFP_KERNEL);
> +	if (!rproc_tee_ctx) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	rproc_tee_ctx->dev = dev;
> +	rproc_tee_ctx->tee_ctx = tee_ctx;
> +	INIT_LIST_HEAD(&rproc_tee_ctx->sessions);
> +
> +	return 0;
> +err:
> +	tee_client_close_context(tee_ctx);
> +
> +	return ret;
> +}
> +
> +static int rproc_tee_remove(struct device *dev)
> +{
> +	struct rproc_tee *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &rproc_tee_ctx->sessions, node) {
> +		tee_client_close_session(rproc_tee_ctx->tee_ctx, entry->session_id);
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +
> +	tee_client_close_context(rproc_tee_ctx->tee_ctx);
> +
> +	return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(tee, rproc_tee_id_table);
> +
> +static struct tee_client_driver rproc_tee_fw_driver = {
> +	.id_table	= rproc_tee_id_table,
> +	.driver		= {
> +		.name		= KBUILD_MODNAME,
> +		.bus		= &tee_bus_type,
> +		.probe		= rproc_tee_probe,
> +		.remove		= rproc_tee_remove,
> +	},
> +};
> +
> +static int __init rproc_tee_fw_mod_init(void)
> +{
> +	return driver_register(&rproc_tee_fw_driver.driver);
> +}
> +
> +static void __exit rproc_tee_fw_mod_exit(void)
> +{
> +	driver_unregister(&rproc_tee_fw_driver.driver);
> +}
> +
> +module_init(rproc_tee_fw_mod_init);
> +module_exit(rproc_tee_fw_mod_exit);
> +
> +MODULE_DESCRIPTION(" remote processor TEE module");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 8fd0d7f63c8e..2e0ddcb2d792 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -503,6 +503,8 @@ enum rproc_features {
>  	RPROC_MAX_FEATURES,
>  };
>  
> +struct rproc_tee;
> +
>  /**
>   * struct rproc - represents a physical remote processor device
>   * @node: list node of this rproc object
> @@ -545,6 +547,7 @@ enum rproc_features {
>   * @cdev: character device of the rproc
>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>   * @features: indicate remoteproc features
> + * @rproc_tee_itf: pointer to the remoteproc tee context
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -586,6 +589,7 @@ struct rproc {
>  	struct cdev cdev;
>  	bool cdev_put_on_release;
>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
> +	struct rproc_tee *rproc_tee_itf;
>  };
>  
>  /**
> diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
> new file mode 100644
> index 000000000000..9b498a8eff4d
> --- /dev/null
> +++ b/include/linux/remoteproc_tee.h
> @@ -0,0 +1,105 @@
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
> + * struct rproc_tee - TEE remoteproc structure
> + * @node:		Reference in list
> + * @rproc:		Remoteproc reference
> + * @parent:		Parent device
> + * @rproc_id:		Identifier of the target firmware
> + * @session_id:		TEE session identifier
> + */
> +struct rproc_tee {
> +	struct list_head node;
> +	struct rproc *rproc;
> +	struct device *parent;
> +	u32 rproc_id;
> +	u32 session_id;
> +};
> +
> +#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
> +
> +int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id);
> +int rproc_tee_unregister(struct rproc *rproc);
> +int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw);
> +int rproc_tee_load_fw(struct rproc *rproc, const struct firmware *fw);
> +void rproc_tee_release_fw(struct rproc *rproc);
> +struct resource_table *rproc_tee_find_loaded_rsc_table(struct rproc *rproc,
> +						       const struct firmware *fw);
> +int rproc_tee_start(struct rproc *rproc);
> +int rproc_tee_stop(struct rproc *rproc);
> +
> +#else
> +
> +static inline int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int rproc_tee_unregister(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int rproc_tee_load_fw(struct rproc *rproc,  const struct firmware *fw)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int rproc_tee_start(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline int rproc_tee_stop(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +static inline void rproc_tee_release_fw(struct rproc *rproc)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +}
> +
> +static inline struct resource_table *
> +rproc_tee_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
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
