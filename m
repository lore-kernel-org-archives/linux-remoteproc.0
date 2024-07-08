Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539113B7A3
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Jul 2024 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453425; cv=none; b=YOhFmsVkXjO9LtKWRR6MTD2r/bTvjGRybYh2AQzYCExKPz79x97dRXPAdvcENpliq4odQvaPmIMzoL1zjgt/4yhMhBmlB3ZbA8ZGbMhWX/JBHRx53jwnnTscvJh0+3J8xdZmWU+kOwl9jRrenFI2zj8iBKTVjUg4Uwn4zUL0gkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453425; c=relaxed/simple;
	bh=KTWVRZzHI1YzIZLxgrckm2B8zeheulXuMNiqSYQwwyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+JRBxENaXsKUFskwyqEtvVrCPA+mISVJ9Be8hRcimb2m4+kQ8PYU1rZC5qOQDbWInMF2pf2q1wS0GevW/sPIOjiQxCpH1NeZmABvSyfH26BsOaVlmw24WAZaiLfAc0YV3r0iWXtKyBXJUakqRdiAgM4E9i4HYGLPe7lAwSGI2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0X06UpJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0X06UpJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70b4267ccfcso210345b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jul 2024 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720453422; x=1721058222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cCFfgCKsjsi0zzRJdRNuU4+aquAhQGOS482eECDeuVY=;
        b=J0X06UpJ3kKsIGLg8lBt3hX+APSY5bwr0X0B9EUvdMUvjA1b03oS81iX26ZFHuo0xF
         Q2NPlYPn+R6JXE2PS1nmH31hmxNgORzWjeNEex6WA73YnBdlMU0JIoNk0niZNDEMnbzd
         6Pk3I16ZEIASjIkBizLSGZ3OygC1TOmPG29YUHm6fO+fFLkjsO0022TlgNFSkKoiyukY
         biNhzwkw2uxgLUFLrT8iTP/Qb5uUzGpxW0YSH+sZtFDlVor21fHcIe8M0XzRih5RlrLa
         MKtRvQ6s4PfbQxvdr22U/Mb+KHvHLkS0TmwGiBGLpDHTCGuOTCx8MGggRr2sWRn2jIMz
         4XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720453422; x=1721058222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCFfgCKsjsi0zzRJdRNuU4+aquAhQGOS482eECDeuVY=;
        b=HXVq/RYFGqUZKB5vAfPe7Ui5MwCYoEK9ZRnQFaE3D/jO+KBMGSu9NsTfygMylGiuLb
         QrLEw6ukxawvvZfNFRZINQ8DJZrZlVWFpR/k4qlF4MmKumkpCwXNw0/36BcCnh539qdx
         um0sIp1e1C+3Z10BFwIQgjo4OFzKNZ1QnEOegtQKwHha/BQKXKjTFpso007/zyUUsxUb
         NkbUZZkxeao1hXfyisg5G0bSqNMexUCYOLXWNQaSMP4FHXWolxEUHDNiYGp4zRREmcLu
         JOGaSnjt7Uo6B5gUOIsVUCmlgW5B6TC6e3/FItSa5qoEIV8YAEGMAq4TcZPHXLC8oDRh
         Qgww==
X-Forwarded-Encrypted: i=1; AJvYcCVVu39yZG1BNv70tOXoOhY6C+CbKBjEG+kmE3L5ir90SVTo4gs3gTaoKSCZR3hWqvIspsnQE0szZWId9QoigcfESA15jPBaSZ7C9Ph+hQWtGw==
X-Gm-Message-State: AOJu0YyuhJ5VCFmFLXukwi1JgxuV683OzoSsOJbnL5EqhBZd3DREAo22
	KT82nSVjX2W2LNE+Nm+kUMkRIUgYS1L1oDwoc65sClcqE8Z1ofUTxTK//S0TcE8=
X-Google-Smtp-Source: AGHT+IEEErIz4hEl08T/xieD4Xeuef1bTMyYdm2nPSnCPU4KyvjjQsdn6GvLrBw668s3DrTUYfNJUw==
X-Received: by 2002:a05:6a20:438d:b0:1c0:f5be:a3ca with SMTP id adf61e73a8af0-1c0f5bea4c8mr3174838637.30.1720453422150;
        Mon, 08 Jul 2024 08:43:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f189:baee:28ea:c31c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898e52sm6607b3a.11.2024.07.08.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:43:41 -0700 (PDT)
Date: Mon, 8 Jul 2024 09:43:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/5] remoteproc: Add TEE support
Message-ID: <ZowJKWFxgpsEzYHW@p14s>
References: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
 <20240621143759.547793-3-arnaud.pouliquen@foss.st.com>
 <ZoQuW7lXZlYf+kEF@p14s>
 <97eee634-1b11-490f-9d96-f1564b022b34@foss.st.com>
 <ZoVq0Dx5VVUgKzRg@p14s>
 <6c075817-10c4-4787-a486-b59a5330fdb6@foss.st.com>
 <ZobAg1ftbLXFBXD5@p14s>
 <42eca58f-0851-4193-bcb8-00ba0f0d58b4@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42eca58f-0851-4193-bcb8-00ba0f0d58b4@foss.st.com>

On Fri, Jul 05, 2024 at 09:33:55AM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 7/4/24 17:32, Mathieu Poirier wrote:
> > On Thu, Jul 04, 2024 at 10:05:24AM +0200, Arnaud POULIQUEN wrote:
> >>
> >>
> >> On 7/3/24 17:14, Mathieu Poirier wrote:
> >>> On Wed, Jul 03, 2024 at 09:19:44AM +0200, Arnaud POULIQUEN wrote:
> >>>> Hello Mathieu
> >>>>
> >>>> On 7/2/24 18:44, Mathieu Poirier wrote:
> >>>>> Good morning,
> >>>>>
> >>>>> On Fri, Jun 21, 2024 at 04:37:56PM +0200, Arnaud Pouliquen wrote:
> >>>>>> Add a remoteproc TEE (Trusted Execution Environment) driver
> >>>>>> that will be probed by the TEE bus. If the associated Trusted
> >>>>>> application is supported on secure part this driver offers a client
> >>>>>> interface to load a firmware by the secure part.
> >>>>>> This firmware could be authenticated by the secure trusted application.
> >>>>>>
> >>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>>>> ---
> >>>>>> Updates vs previous version:
> >>>>>> - rename tee_remoteproc.* file to rmeoteproc_tee.*,
> >>>>>> - rename TEE_REMOTEPROC config to REMOTEPROC_TEE,
> >>>>>> - remove "stm32" in some variable declarations,
> >>>>>> - remove useless "remoteproc_internal.h" include,
> >>>>>> - fix tee_rproc_ctx devm_kzalloc.
> >>>>>> - rework module description
> >>>>>> ---
> >>>>>>  drivers/remoteproc/Kconfig          |  10 +
> >>>>>>  drivers/remoteproc/Makefile         |   1 +
> >>>>>>  drivers/remoteproc/remoteproc_tee.c | 446 ++++++++++++++++++++++++++++
> >>>>>>  include/linux/remoteproc.h          |   4 +
> >>>>>>  include/linux/remoteproc_tee.h      | 100 +++++++
> >>>>>>  5 files changed, 561 insertions(+)
> >>>>>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >>>>>>  create mode 100644 include/linux/remoteproc_tee.h
> >>>>>>
> >>>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >>>>>> index 48845dc8fa85..278f197acb90 100644
> >>>>>> --- a/drivers/remoteproc/Kconfig
> >>>>>> +++ b/drivers/remoteproc/Kconfig
> >>>>>> @@ -365,6 +365,16 @@ config XLNX_R5_REMOTEPROC
> >>>>>>  
> >>>>>>  	  It's safe to say N if not interested in using RPU r5f cores.
> >>>>>>  
> >>>>>> +
> >>>>>> +config REMOTEPROC_TEE
> >>>>>> +	tristate "Remoteproc support by a TEE application"
> >>>>>> +	depends on OPTEE
> >>>>>> +	help
> >>>>>> +	  Support a remote processor with a TEE application. The Trusted
> >>>>>> +	  Execution Context is responsible for loading the trusted firmware
> >>>>>> +	  image and managing the remote processor's lifecycle.
> >>>>>> +	  This can be either built-in or a loadable module.
> >>>>>> +
> >>>>>>  endif # REMOTEPROC
> >>>>>>  
> >>>>>>  endmenu
> >>>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> >>>>>> index 91314a9b43ce..b4eb37177005 100644
> >>>>>> --- a/drivers/remoteproc/Makefile
> >>>>>> +++ b/drivers/remoteproc/Makefile
> >>>>>> @@ -36,6 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
> >>>>>>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
> >>>>>>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
> >>>>>>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
> >>>>>> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
> >>>>>>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
> >>>>>>  obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
> >>>>>>  obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
> >>>>>> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..70cb67451767
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/remoteproc/remoteproc_tee.c
> >>>>>> @@ -0,0 +1,446 @@
> >>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>>>>> +/*
> >>>>>> + * Copyright (C) STMicroelectronics 2024
> >>>>>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>>>> + */
> >>>>>> +
> >>>>>> +#include <linux/firmware.h>
> >>>>>> +#include <linux/io.h>
> >>>>>> +#include <linux/module.h>
> >>>>>> +#include <linux/remoteproc.h>
> >>>>>> +#include <linux/remoteproc_tee.h>
> >>>>>> +#include <linux/slab.h>
> >>>>>> +#include <linux/tee_drv.h>
> >>>>>> +
> >>>>>> +#define MAX_TEE_PARAM_ARRY_MEMBER	4
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * Authentication of the firmware and load in the remote processor memory
> >>>>>> + *
> >>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>>>> + * [in]	 params[1].memref:	buffer containing the image of the buffer
> >>>>>> + */
> >>>>>> +#define TA_RPROC_FW_CMD_LOAD_FW		1
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * Start the remote processor
> >>>>>> + *
> >>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>>>> + */
> >>>>>> +#define TA_RPROC_FW_CMD_START_FW	2
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * Stop the remote processor
> >>>>>> + *
> >>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>>>> + */
> >>>>>> +#define TA_RPROC_FW_CMD_STOP_FW		3
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * Return the address of the resource table, or 0 if not found
> >>>>>> + * No check is done to verify that the address returned is accessible by
> >>>>>> + * the non secure context. If the resource table is loaded in a protected
> >>>>>> + * memory the access by the non secure context will lead to a data abort.
> >>>>>> + *
> >>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>>>> + * [out]  params[1].value.a:	32bit LSB resource table memory address
> >>>>>> + * [out]  params[1].value.b:	32bit MSB resource table memory address
> >>>>>> + * [out]  params[2].value.a:	32bit LSB resource table memory size
> >>>>>> + * [out]  params[2].value.b:	32bit MSB resource table memory size
> >>>>>> + */
> >>>>>> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * Return the address of the core dump
> >>>>>> + *
> >>>>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>>>> + * [out] params[1].memref:	address of the core dump image if exist,
> >>>>>> + *				else return Null
> >>>>>> + */
> >>>>>> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
> >>>>>> +
> >>>>>> +struct tee_rproc_context {
> >>>>>> +	struct list_head sessions;
> >>>>>> +	struct tee_context *tee_ctx;
> >>>>>> +	struct device *dev;
> >>>>>> +};
> >>>>>> +
> >>>>>> +static struct tee_rproc_context *tee_rproc_ctx;
> >>>>>> +
> >>>>>> +static void tee_rproc_prepare_args(struct tee_rproc *trproc, int cmd,
> >>>>>> +				   struct tee_ioctl_invoke_arg *arg,
> >>>>>> +				   struct tee_param *param,
> >>>>>> +				   unsigned int num_params)
> >>>>>> +{
> >>>>>> +	memset(arg, 0, sizeof(*arg));
> >>>>>> +	memset(param, 0, MAX_TEE_PARAM_ARRY_MEMBER * sizeof(*param));
> >>>>>> +
> >>>>>> +	arg->func = cmd;
> >>>>>> +	arg->session = trproc->session_id;
> >>>>>> +	arg->num_params = num_params + 1;
> >>>>>> +
> >>>>>> +	param[0] = (struct tee_param) {
> >>>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> >>>>>> +		.u.value.a = trproc->rproc_id,
> >>>>>> +	};
> >>>>>> +}
> >>>>>> +
> >>>>>> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
> >>>>>> +{
> >>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> >>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
> >>>>>> +	struct tee_ioctl_invoke_arg arg;
> >>>>>> +	struct tee_shm *fw_shm;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	if (!trproc)
> >>>>>> +		return -EINVAL;
> >>>>>> +
> >>>>>> +	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
> >>>>>> +	if (IS_ERR(fw_shm))
> >>>>>> +		return PTR_ERR(fw_shm);
> >>>>>> +
> >>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
> >>>>>> +
> >>>>>> +	/* Provide the address of the firmware image */
> >>>>>> +	param[1] = (struct tee_param) {
> >>>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
> >>>>>> +		.u.memref = {
> >>>>>> +			.shm = fw_shm,
> >>>>>> +			.size = fw->size,
> >>>>>> +			.shm_offs = 0,
> >>>>>> +		},
> >>>>>> +	};
> >>>>>> +
> >>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> >>>>>> +	if (ret < 0 || arg.ret != 0) {
> >>>>>> +		dev_err(tee_rproc_ctx->dev,
> >>>>>> +			"TA_RPROC_FW_CMD_LOAD_FW invoke failed TEE err: %x, ret:%x\n",
> >>>>>> +			arg.ret, ret);
> >>>>>> +		if (!ret)
> >>>>>> +			ret = -EIO;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	tee_shm_free(fw_shm);
> >>>>>> +
> >>>>>> +	return ret;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_load_fw);
> >>>>>> +
> >>>>>> +static int tee_rproc_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
> >>>>>> +					  size_t *table_sz)
> >>>>>> +{
> >>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> >>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
> >>>>>> +	struct tee_ioctl_invoke_arg arg;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
> >>>>>> +
> >>>>>> +	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> >>>>>> +	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> >>>>>> +
> >>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> >>>>>> +	if (ret < 0 || arg.ret != 0) {
> >>>>>> +		dev_err(tee_rproc_ctx->dev,
> >>>>>> +			"TA_RPROC_FW_CMD_GET_RSC_TABLE invoke failed TEE err: %x, ret:%x\n",
> >>>>>> +			arg.ret, ret);
> >>>>>> +		return -EIO;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	*table_sz = param[2].u.value.a;
> >>>>>> +
> >>>>>> +	if (*table_sz)
> >>>>>> +		*rsc_pa = param[1].u.value.a;
> >>>>>> +	else
> >>>>>> +		*rsc_pa  = 0;
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >>>>>> +{
> >>>>>> +	phys_addr_t rsc_table;
> >>>>>> +	void __iomem *rsc_va;
> >>>>>> +	size_t table_sz;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	ret = tee_rproc_load_fw(rproc, fw);
> >>>>>> +	if (ret)
> >>>>>> +		return ret;
> >>>>>> +
> >>>>>> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
> >>>>>> +	if (ret)
> >>>>>> +		return ret;
> >>>>>
> >>>>> Do we need an API to unload the firware from memory too?  If anything fails we
> >>>>> still have firmware loaded into memory.
> >>>>
> >>>> For the time being, the clean-up of the memory is not implemented in OP-TEE.
> >>>
> >>> In my opinion cleaning up the firmware image loaded to memory when something
> >>> fails is important and should be part of this patchset.  Looking at the error
> >>> path in this function, it is clear something is missing.
> >>
> >>
> >> Please, could you detail what risks you see in not implementing the memory
> >> clean-up at this first step?
> >>
> > 
> > Almost everything in the Linux kernel is about allocation and release of
> > resources, the pattern is ubiquitous.  Reading function tee_rproc_parse_fw(),
> > the firmware is loaded by tee_rproc_load_fw() but never released - people
> > reading this driver will wonder about that.  There is also the possibility that
> > other implementations will use the free'd memory for other purposes.  This
> > interface driver is meant to be generic and as such needs to take care of those
> > corner cases.
> 
> Thank you for the clarification.
> If we want to support this, handling the error here would not be sufficient. For
> instance, many things can go wrong in rproc_start().
> 

I agree.

> So either we do nothing, as with the ELF support, and we put a comment in the
> remoteproc tee; or we may need to introduce new rproc ops to clean up/free
> resources in case of errors in the remoteproc core.
> 

Doing nothing is not an option.  The ELF case is easy because the cleanup only
involves rproc->cached_table - for the TEE it also involves freeing the FW
image.

I suggest introducting a new core function, i.e rproc_release_fw(), to
counterbalance rproc_parse_fw():

rproc_release_fw()
{
        if (rproc->tee_interface)
                tee_rproc_unload_fw();
        kfree(rproc->cached_table);
        rproc->cached_table = NULL;
        rproc->table_ptr = NULL;
}

Function rproc_release_fw() would be called in rproc_fw_boot()'s error path and
in rproc_shutdown().

> Or perhaps do you have another alternative to propose?
> 
> Thanks,
> Arnaud
> 
> > 
> >> Currently, OP-TEE upstream does not clean the memory. Upon the next load, it
> >> will either be overwritten or left unused by the newly authenticated firmware.
> >>
> >> If your concern is about the ability to read the code, the code is already
> >> accessible in the binary firmware image on the Linux filesystem.
> >>
> >> As a next step a platform-dependent strategy has to be implemented to enhance
> >> firmware protection:
> >> - Ensure the integrity of the code.
> >> - Preserve secrets.
> >>
> >> However, OP-TEE cannot trust the Non-secure context for this. Expecting Linux to
> >> call a clean-up service does not seem reliable to me.
> >>
> >> In the downstream stm32mp platform, we have implemented the clean-up but above
> >> all, ensured that Linux never has access to the remote processor firmware code
> >> and data by using firewall configurations.
> >> For time being we print a warning message on OP-TEE upstream[1]
> >>
> >> [1]https://elixir.bootlin.com/op-tee/latest/source/core/drivers/remoteproc/stm32_remoteproc.c#L361
> >>
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>>
> >>>> I plan to upstream this part in a second step, associated with a memory protection
> >>>> strategy. This should be directly implemented in the OP-TEE service to avoid
> >>>> reliance on Linux error management.
> >>>> Nonetheless, an API could be added to clean the memory if needed.
> >>>>
> >>>> Thanks,
> >>>> Arnaud
> >>>>
> >>>>>
> >>>>> More comments to come later.
> >>>>>
> >>>>> Mathieu
> >>>>>
> >>>>>> +
> >>>>>> +	/*
> >>>>>> +	 * We assume here that the memory mapping is the same between the TEE and Linux kernel
> >>>>>> +	 * contexts. Else a new TEE remoteproc service could be needed to get a copy of the
> >>>>>> +	 * resource table
> >>>>>> +	 */
> >>>>>> +	rsc_va = ioremap_wc(rsc_table, table_sz);
> >>>>>> +	if (IS_ERR_OR_NULL(rsc_va)) {
> >>>>>> +		dev_err(tee_rproc_ctx->dev, "Unable to map memory region: %pa+%zx\n",
> >>>>>> +			&rsc_table, table_sz);
> >>>>>> +		return -ENOMEM;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	/*
> >>>>>> +	 * Create a copy of the resource table to have the same behavior as the elf loader.
> >>>>>> +	 * This cached table will be used after the remoteproc stops to free resources, and for
> >>>>>> +	 * crash recovery to reapply the settings.
> >>>>>> +	 */
> >>>>>> +	rproc->cached_table = kmemdup((__force void *)rsc_va, table_sz, GFP_KERNEL);
> >>>>>> +	if (!rproc->cached_table) {
> >>>>>> +		ret = -ENOMEM;
> >>>>>> +		goto out;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	rproc->table_ptr = rproc->cached_table;
> >>>>>> +	rproc->table_sz = table_sz;
> >>>>>> +
> >>>>>> +out:
> >>>>>> +	iounmap(rsc_va);
> >>>>>> +	return ret;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_parse_fw);
> >>>>>> +
> >>>>>> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
> >>>>>> +						       const struct firmware *fw)
> >>>>>> +{
> >>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
> >>>>>> +	phys_addr_t rsc_table;
> >>>>>> +	size_t table_sz;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	if (!trproc)
> >>>>>> +		return ERR_PTR(-EINVAL);
> >>>>>> +
> >>>>>> +	ret = tee_rproc_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
> >>>>>> +	if (ret)
> >>>>>> +		return ERR_PTR(ret);
> >>>>>> +
> >>>>>> +	rproc->table_sz = table_sz;
> >>>>>> +	if (!table_sz)
> >>>>>> +		return NULL;
> >>>>>> +
> >>>>>> +	/*
> >>>>>> +	 * At this step the memory area that contains the resource table should have be declared
> >>>>>> +	 * in the remote proc platform driver and allocated by rproc_alloc_registered_carveouts().
> >>>>>> +	 */
> >>>>>> +	return (struct resource_table *)rproc_pa_to_va(rproc, rsc_table, table_sz, NULL);
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_find_loaded_rsc_table);
> >>>>>> +
> >>>>>> +int tee_rproc_start(struct rproc *rproc)
> >>>>>> +{
> >>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> >>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
> >>>>>> +	struct tee_ioctl_invoke_arg arg;
> >>>>>> +	int ret = 0;
> >>>>>> +
> >>>>>> +	if (!trproc)
> >>>>>> +		return -EINVAL;
> >>>>>> +
> >>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
> >>>>>> +
> >>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> >>>>>> +	if (ret < 0 || arg.ret != 0) {
> >>>>>> +		dev_err(tee_rproc_ctx->dev,
> >>>>>> +			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
> >>>>>> +			arg.ret, ret);
> >>>>>> +		if (!ret)
> >>>>>> +			return  -EIO;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_start);
> >>>>>> +
> >>>>>> +int tee_rproc_stop(struct rproc *rproc)
> >>>>>> +{
> >>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> >>>>>> +	struct tee_rproc *trproc = rproc->tee_interface;
> >>>>>> +	struct tee_ioctl_invoke_arg arg;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	if (!trproc)
> >>>>>> +		return -EINVAL;
> >>>>>> +
> >>>>>> +	tee_rproc_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
> >>>>>> +
> >>>>>> +	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
> >>>>>> +	if (ret < 0 || arg.ret != 0) {
> >>>>>> +		dev_err(tee_rproc_ctx->dev,
> >>>>>> +			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
> >>>>>> +			arg.ret, ret);
> >>>>>> +		if (!ret)
> >>>>>> +			ret = -EIO;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	return ret;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_stop);
> >>>>>> +
> >>>>>> +static const struct tee_client_device_id tee_rproc_id_table[] = {
> >>>>>> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
> >>>>>> +	{}
> >>>>>> +};
> >>>>>> +
> >>>>>> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
> >>>>>> +{
> >>>>>> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
> >>>>>> +	struct tee_ioctl_open_session_arg sess_arg;
> >>>>>> +	struct tee_client_device *tee_device;
> >>>>>> +	struct tee_rproc *trproc, *p_err;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	/*
> >>>>>> +	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
> >>>>>> +	 * reason. The bus could be not yet probed or the service not available in the secure
> >>>>>> +	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
> >>>>>> +	 */
> >>>>>> +	if (!tee_rproc_ctx)
> >>>>>> +		return ERR_PTR(-EPROBE_DEFER);
> >>>>>> +
> >>>>>> +	/* Prevent tee rproc module from being removed */
> >>>>>> +	if (!try_module_get(THIS_MODULE)) {
> >>>>>> +		dev_err(tee_rproc_ctx->dev, "can't get owner\n");
> >>>>>> +		return ERR_PTR(-ENODEV);
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
> >>>>>> +	if (!trproc) {
> >>>>>> +		p_err = ERR_PTR(-ENOMEM);
> >>>>>> +		goto module_put;
> >>>>>> +	}
> >>>>>> +	tee_device = to_tee_client_device(tee_rproc_ctx->dev);
> >>>>>> +	memset(&sess_arg, 0, sizeof(sess_arg));
> >>>>>> +
> >>>>>> +	memcpy(sess_arg.uuid, tee_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
> >>>>>> +
> >>>>>> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
> >>>>>> +	sess_arg.num_params = 1;
> >>>>>> +
> >>>>>> +	param[0] = (struct tee_param) {
> >>>>>> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> >>>>>> +		.u.value.a = rproc_id,
> >>>>>> +	};
> >>>>>> +
> >>>>>> +	ret = tee_client_open_session(tee_rproc_ctx->tee_ctx, &sess_arg, param);
> >>>>>> +	if (ret < 0 || sess_arg.ret != 0) {
> >>>>>> +		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
> >>>>>> +		p_err = ERR_PTR(-EINVAL);
> >>>>>> +		goto module_put;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	trproc->parent = dev;
> >>>>>> +	trproc->rproc_id = rproc_id;
> >>>>>> +	trproc->session_id = sess_arg.session;
> >>>>>> +
> >>>>>> +	trproc->rproc = rproc;
> >>>>>> +	rproc->tee_interface = trproc;
> >>>>>> +
> >>>>>> +	list_add_tail(&trproc->node, &tee_rproc_ctx->sessions);
> >>>>>> +
> >>>>>> +	return trproc;
> >>>>>> +
> >>>>>> +module_put:
> >>>>>> +	module_put(THIS_MODULE);
> >>>>>> +	return p_err;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_register);
> >>>>>> +
> >>>>>> +int tee_rproc_unregister(struct tee_rproc *trproc)
> >>>>>> +{
> >>>>>> +	struct rproc *rproc = trproc->rproc;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	ret = tee_client_close_session(tee_rproc_ctx->tee_ctx, trproc->session_id);
> >>>>>> +	if (ret < 0)
> >>>>>> +		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
> >>>>>> +
> >>>>>> +	list_del(&trproc->node);
> >>>>>> +	rproc->tee_interface = NULL;
> >>>>>> +
> >>>>>> +	module_put(THIS_MODULE);
> >>>>>> +
> >>>>>> +	return ret;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(tee_rproc_unregister);
> >>>>>> +
> >>>>>> +static int tee_rproc_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> >>>>>> +{
> >>>>>> +	/* Today we support only the OP-TEE, could be extend to other tees */
> >>>>>> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int tee_rproc_probe(struct device *dev)
> >>>>>> +{
> >>>>>> +	struct tee_context *tee_ctx;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	/* Open context with TEE driver */
> >>>>>> +	tee_ctx = tee_client_open_context(NULL, tee_rproc_ctx_match, NULL, NULL);
> >>>>>> +	if (IS_ERR(tee_ctx))
> >>>>>> +		return PTR_ERR(tee_ctx);
> >>>>>> +
> >>>>>> +	tee_rproc_ctx = devm_kzalloc(dev, sizeof(*tee_rproc_ctx), GFP_KERNEL);
> >>>>>> +	if (!tee_rproc_ctx) {
> >>>>>> +		ret = -ENOMEM;
> >>>>>> +		goto err;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	tee_rproc_ctx->dev = dev;
> >>>>>> +	tee_rproc_ctx->tee_ctx = tee_ctx;
> >>>>>> +	INIT_LIST_HEAD(&tee_rproc_ctx->sessions);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +err:
> >>>>>> +	tee_client_close_context(tee_ctx);
> >>>>>> +
> >>>>>> +	return ret;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int tee_rproc_remove(struct device *dev)
> >>>>>> +{
> >>>>>> +	struct tee_rproc *entry, *tmp;
> >>>>>> +
> >>>>>> +	list_for_each_entry_safe(entry, tmp, &tee_rproc_ctx->sessions, node) {
> >>>>>> +		tee_client_close_session(tee_rproc_ctx->tee_ctx, entry->session_id);
> >>>>>> +		list_del(&entry->node);
> >>>>>> +		kfree(entry);
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	tee_client_close_context(tee_rproc_ctx->tee_ctx);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +MODULE_DEVICE_TABLE(tee, tee_rproc_id_table);
> >>>>>> +
> >>>>>> +static struct tee_client_driver tee_rproc_fw_driver = {
> >>>>>> +	.id_table	= tee_rproc_id_table,
> >>>>>> +	.driver		= {
> >>>>>> +		.name		= KBUILD_MODNAME,
> >>>>>> +		.bus		= &tee_bus_type,
> >>>>>> +		.probe		= tee_rproc_probe,
> >>>>>> +		.remove		= tee_rproc_remove,
> >>>>>> +	},
> >>>>>> +};
> >>>>>> +
> >>>>>> +static int __init tee_rproc_fw_mod_init(void)
> >>>>>> +{
> >>>>>> +	return driver_register(&tee_rproc_fw_driver.driver);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void __exit tee_rproc_fw_mod_exit(void)
> >>>>>> +{
> >>>>>> +	driver_unregister(&tee_rproc_fw_driver.driver);
> >>>>>> +}
> >>>>>> +
> >>>>>> +module_init(tee_rproc_fw_mod_init);
> >>>>>> +module_exit(tee_rproc_fw_mod_exit);
> >>>>>> +
> >>>>>> +MODULE_DESCRIPTION(" remote processor support with a TEE application");
> >>>>>> +MODULE_LICENSE("GPL");
> >>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >>>>>> index 8fd0d7f63c8e..fbe1d6793709 100644
> >>>>>> --- a/include/linux/remoteproc.h
> >>>>>> +++ b/include/linux/remoteproc.h
> >>>>>> @@ -503,6 +503,8 @@ enum rproc_features {
> >>>>>>  	RPROC_MAX_FEATURES,
> >>>>>>  };
> >>>>>>  
> >>>>>> +struct tee_rproc;
> >>>>>> +
> >>>>>>  /**
> >>>>>>   * struct rproc - represents a physical remote processor device
> >>>>>>   * @node: list node of this rproc object
> >>>>>> @@ -545,6 +547,7 @@ enum rproc_features {
> >>>>>>   * @cdev: character device of the rproc
> >>>>>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> >>>>>>   * @features: indicate remoteproc features
> >>>>>> + * @tee_interface: pointer to the remoteproc tee context
> >>>>>>   */
> >>>>>>  struct rproc {
> >>>>>>  	struct list_head node;
> >>>>>> @@ -586,6 +589,7 @@ struct rproc {
> >>>>>>  	struct cdev cdev;
> >>>>>>  	bool cdev_put_on_release;
> >>>>>>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
> >>>>>> +	struct tee_rproc *tee_interface;
> >>>>>>  };
> >>>>>>  
> >>>>>>  /**
> >>>>>> diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..ccf34a218d54
> >>>>>> --- /dev/null
> >>>>>> +++ b/include/linux/remoteproc_tee.h
> >>>>>> @@ -0,0 +1,100 @@
> >>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >>>>>> +/*
> >>>>>> + * Copyright(c) 2024 STMicroelectronics
> >>>>>> + */
> >>>>>> +
> >>>>>> +#ifndef REMOTEPROC_TEE_H
> >>>>>> +#define REMOTEPROC_TEE_H
> >>>>>> +
> >>>>>> +#include <linux/tee_drv.h>
> >>>>>> +#include <linux/firmware.h>
> >>>>>> +#include <linux/remoteproc.h>
> >>>>>> +
> >>>>>> +struct rproc;
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * struct tee_rproc - TEE remoteproc structure
> >>>>>> + * @node:		Reference in list
> >>>>>> + * @rproc:		Remoteproc reference
> >>>>>> + * @parent:		Parent device
> >>>>>> + * @rproc_id:		Identifier of the target firmware
> >>>>>> + * @session_id:		TEE session identifier
> >>>>>> + */
> >>>>>> +struct tee_rproc {
> >>>>>> +	struct list_head node;
> >>>>>> +	struct rproc *rproc;
> >>>>>> +	struct device *parent;
> >>>>>> +	u32 rproc_id;
> >>>>>> +	u32 session_id;
> >>>>>> +};
> >>>>>> +
> >>>>>> +#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
> >>>>>> +
> >>>>>> +struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
> >>>>>> +				     unsigned int rproc_id);
> >>>>>> +int tee_rproc_unregister(struct tee_rproc *trproc);
> >>>>>> +int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw);
> >>>>>> +int tee_rproc_load_fw(struct rproc *rproc, const struct firmware *fw);
> >>>>>> +struct resource_table *tee_rproc_find_loaded_rsc_table(struct rproc *rproc,
> >>>>>> +						       const struct firmware *fw);
> >>>>>> +int tee_rproc_start(struct rproc *rproc);
> >>>>>> +int tee_rproc_stop(struct rproc *rproc);
> >>>>>> +
> >>>>>> +#else
> >>>>>> +
> >>>>>> +static inline struct tee_rproc *tee_rproc_register(struct device *dev, struct rproc *rproc,
> >>>>>> +						   unsigned int rproc_id)
> >>>>>> +{
> >>>>>> +	return ERR_PTR(-ENODEV);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >>>>>> +{
> >>>>>> +	/* This shouldn't be possible */
> >>>>>> +	WARN_ON(1);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static inline int tee_rproc_unregister(struct tee_rproc *trproc)
> >>>>>> +{
> >>>>>> +	/* This shouldn't be possible */
> >>>>>> +	WARN_ON(1);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static inline int tee_rproc_load_fw(struct rproc *rproc,  const struct firmware *fw)
> >>>>>> +{
> >>>>>> +	/* This shouldn't be possible */
> >>>>>> +	WARN_ON(1);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static inline int tee_rproc_start(struct rproc *rproc)
> >>>>>> +{
> >>>>>> +	/* This shouldn't be possible */
> >>>>>> +	WARN_ON(1);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static inline int tee_rproc_stop(struct rproc *rproc)
> >>>>>> +{
> >>>>>> +	/* This shouldn't be possible */
> >>>>>> +	WARN_ON(1);
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static inline struct resource_table *
> >>>>>> +tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
> >>>>>> +{
> >>>>>> +	/* This shouldn't be possible */
> >>>>>> +	WARN_ON(1);
> >>>>>> +
> >>>>>> +	return NULL;
> >>>>>> +}
> >>>>>> +#endif /* CONFIG_REMOTEPROC_TEE */
> >>>>>> +#endif /* REMOTEPROC_TEE_H */
> >>>>>> -- 
> >>>>>> 2.25.1
> >>>>>>
