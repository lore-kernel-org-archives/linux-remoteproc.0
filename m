Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879D22C6C0;
	Fri,  6 Dec 2024 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733522754; cv=none; b=Cx7NtltHEYk8mTMGRYZNQ1gQN/GpxehciduABku6r6ql5ump1uJIbVOFLwPLUsIvyYjVNhROqXNKP24eJAH2Isspw5pJlwsuvzrSeWdP876Ziyv30RWmqQopH4AzIYrNfpghxSgfKgS3JGajMdjuVgfY9DmH/cnGVl6jLZWK7tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733522754; c=relaxed/simple;
	bh=R+5ddbn7zv9DmCTmYGTDgubGYg7Sk+LWxaMCwuiC8to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVsOLeOubZL2M3la7oTvwofbVdEeTvHXE6w5mN8GIrRWO4Sx7FnU4MPgG2d/BYclR59zasa+UxauwDY9vfMoy/yI2VcqyRLlX+hyWrkFPELCXd6YppG3FtiegEMNNxe/HH53NjI9Q9igfSJEZqqEpPBcJB453XkAhT7GdR/11VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwXDdKud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwXDdKud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42D4C4CED2;
	Fri,  6 Dec 2024 22:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733522754;
	bh=R+5ddbn7zv9DmCTmYGTDgubGYg7Sk+LWxaMCwuiC8to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwXDdKudtBNiQE6G+tgJWPcv654X0E7OJxw2ED94trwYV6+jvA+8U0dK1GfyN0gjx
	 Qiy28DA1DJeg2mhK+Fh+pCB5UmOjmCACadZk59uaV7qme9X1LJMEEZnO1wxo8sZuLm
	 fkIz/Zx3fUyOATUP9VlLybFZ54EFBGwUuF6i0NsuL/2LK++IYUi8PbitPl8VTMoAtE
	 TdAbAneQ7nfeuh+WIblCWPkwOyOPQD8mNBTmVgoFWvDLqtv6zVFWCxPY+J9DGKhqEQ
	 fUa6D+pGek9Vs3TQ6WKtOqWMu0iNrP0npc7Iye/ludPCpPHEJx2sAymUyX3CRkmnjk
	 qTV+qVlPmBZWA==
Date: Fri, 6 Dec 2024 14:07:35 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v15 2/8] remoteproc: Add TEE support
Message-ID: <6fufphs3ajlc7htj74qus6gifdd4yd64l5yjn2zyjrtdezoe4f@cqbbzg63acv4>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128084219.2159197-3-arnaud.pouliquen@foss.st.com>

On Thu, Nov 28, 2024 at 09:42:09AM GMT, Arnaud Pouliquen wrote:
> Add a remoteproc TEE (Trusted Execution Environment) driver
> that will be probed by the TEE bus. If the associated Trusted
> application is supported on secure part this driver offers a client
> interface to load a firmware by the secure part.

If...else?

> This firmware could be authenticated by the secure trusted application.
> 

I would like for this to fully describe how this fits with the bus and
how it is expected to be used by a specific remoteproc driver.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates vs version v13:
> - define REMOTEPROC_TEE as bool instead of tristate,
> - remove the load of the firmware in rproc_tee_parse_fw as we will ensure
>   that the firmware is loaded using the load_fw() operation.
> ---
>  drivers/remoteproc/Kconfig          |  10 +
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/remoteproc_tee.c | 508 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h          |   4 +
>  include/linux/remoteproc_tee.h      | 105 ++++++
>  5 files changed, 628 insertions(+)
>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>  create mode 100644 include/linux/remoteproc_tee.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 955e4e38477e..f6335321d540 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -23,6 +23,16 @@ config REMOTEPROC_CDEV
>  
>  	  It's safe to say N if you don't want to use this interface.
>  
> +config REMOTEPROC_TEE
> +	bool "Remoteproc support by a TEE application"
> +	depends on OPTEE
> +	help
> +	  Support a remote processor with a TEE application.

Does the remote processor run TEE applications? (Rethorical question...)

> 	  The Trusted
> +	  Execution Context is responsible for loading the trusted firmware
> +	  image and managing the remote processor's lifecycle.
> +
> +	  It's safe to say N if you don't want to use remoteproc TEE.

It's not really about "wanting to use", it's a question whether your
device implements/provides the remoteproc TEE.

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
> index 000000000000..3fe3f31068f2
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_tee.c
> @@ -0,0 +1,508 @@
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

Exactly what does this imply? Will the content of @memref be copied into
some other memory?

> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor

Why not just "remote processor identifier"?

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

Why is there two "FW" in this constant? Why isn't it just
"TA_RPROC_FW_CMD_START"?

And why is it not TEE_PROC_FW_CMD_START?

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

These three lines describe a scenario that doesn't make any sense to me.
But if that's the case, you should be able to describe that the API
might give you a inaccessible pointer, by design.

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

What does this mean? What will I find at @memref after this call?

> + *
> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> + * [out] params[1].memref:	address of the core dump image if exist,
> + *				else return Null

s/else return Null/or NULL/

> + */
> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
> +
> +/*
> + * Release remote processor firmware images and associated resources.

Exactly what does this mean for the caller?

> + * This command should be used in case an error occurs between the loading of
> + * the firmware images (TA_RPROC_CMD_LOAD_FW) and the starting of the remote
> + * processor (TA_RPROC_CMD_START_FW) or after stopping the remote processor
> + * to release associated resources (TA_RPROC_CMD_STOP_FW).

This description belongs adjacent to LOAD_FW, and describe it in terms
of what state LOAD_FW leaves the buffers and remote processor in.

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

Provide kernel-doc for EXPORT_SYMBOL*() functions.

> +void rproc_tee_release_fw(struct rproc *rproc)
> +{
> +	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
> +	struct rproc_tee *trproc = rproc->rproc_tee_itf;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret;
> +
> +	if (!rproc) {

How can this happen?

This error will happen in two cases:

1) on your desk while you develop the client and you have to hunt
through the kernel log to figure out that the reason you can't start
your remoteproc is because 5 minutes ago there was a error log saying
that we didn't stop it last time.

2) in the customer device because of some obscure bug, where no one will
read the logs and the software will happily continue to execute with a
broken state.

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

The function is void... Defensive coding is only useful when it saves
you from future mistakes, not when it hides problems from you.

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

At least @ret will be base 10, so don't print that in base 16 without
indication that it's not base 10.


Also, this will result in two dev_err() prints, printing out two
different error codes.

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

kernel-doc.

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

More confused bases

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
> +	/* At this point, the firmware has to be loaded to be able to parse the resource table. */

There's two ways to read this, either you're saying "we now need to load
the firmware, so that we can parse the resource table", or "let's hope
the firmware is loaded because I will parse it now!" 

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

When does ioremap_wc() return IS_ERR()?

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

This unrolls state that this function didn't establish. This will at
best confuse the caller.

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

We're doing this in the core because there's no direct dependency on the
remoteproc driver which we will jump to through rproc_ops.

In contrast, your remoteproc driver will be prevented from being
unloaded by the core's refcount and this module can't be unloaded
because your driver is referencing it directly.


That said, none of this matter now that you made the tee driver bool.

I.e. drop this.

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

How can this happen?

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

rproc_tee_register() checks if rproc_tee_ctx is non-NULL before
continuing, which means that if you have a client calling that at the
same time as you're here...you will have a NULL dereference - and/or
other exciting issues.

> +
> +	rproc_tee_ctx->dev = dev;
> +	rproc_tee_ctx->tee_ctx = tee_ctx;
> +	INIT_LIST_HEAD(&rproc_tee_ctx->sessions);
> +
> +	return 0;
> +err:
> +	tee_client_close_context(tee_ctx);

devm_kzalloc() seems like a simpler function, and it's definitely easier
to unroll than the tee context, so flip the open/alloc and your cleanup
will be easier.

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

So each remoteproc driver have a rproc_tee context on
&rproc_tee_ctx-->sessions and without telling them, you just destroy
and free their context?

Perhaps I'm misinterpreting what you're doing here, but did you test
this?

> +	}
> +
> +	tee_client_close_context(rproc_tee_ctx->tee_ctx);

As you return here, the devres-allocated rproc_tee_ctx memory will be
freed, and you have a seemingly valid looking pointer and whole bunch of
use-after-free cases.

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

Please add an equivalent of the module_platform_driver() macro to tee
framework instead of open-coding this.

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

TEE is just one specific remoteproc implementation, why does it need to
infest the core data structure? Do you want a stm32_rproc here as well?

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

Isn't that rproc->dev->parent?

> + * @rproc_id:		Identifier of the target firmware
> + * @session_id:		TEE session identifier
> + */
> +struct rproc_tee {

As far as I can tell this isn't dereferenced outside remoteproc_tee.c,
can we hide it therein?

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

Do we really need yet another bunch of stubs? Can't we just leave
CONFIG_REMOTEPROC_TEE non-user-selectable and have the drivers that rely
on it do "select REMOTEPROC_TEE"?

If my measurements are correct, it's 3.1kB of code...

Regards,
Bjorn

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
