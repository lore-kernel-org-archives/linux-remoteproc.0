Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84E28D0A2;
	Tue,  4 Mar 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103884; cv=none; b=g5hGhu9w1ogUpgvP6N42vesz7h3hthRHOe3mz8xaCacdS/bJljPeZ/65QJmSaiROZ09QzS0MPOAolW3/CVQjBHrb7BHsYbHpdsqcLObJWrNFSJ0V+b0z7dqI2cxZXOD4XRxD62Yklba2sN5+PhFssJc5zEyaVqpJzCE6zVGS724=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103884; c=relaxed/simple;
	bh=X+Y0HQR0b88fojhcUUcYL5hdXM9c5QGbIFoh8/9h4oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlDKuJgNN2bNAyp7uRrjF0jG2iFtnSk7dJ3WH/+IoDXvmXBfATh6G24QA6T8xwv5sPdB5/b5AOWEF/d/UMLtcMhzp+rXlZZjLPD4NlM2jkDASTxDKclRZmqroSLqzh7fB83F2OSO7iE4LL5dBOZvyNABmB8YzToPHCKKL9G4xmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwcwLGcG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwcwLGcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66577C4CEE5;
	Tue,  4 Mar 2025 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741103883;
	bh=X+Y0HQR0b88fojhcUUcYL5hdXM9c5QGbIFoh8/9h4oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwcwLGcGgxtGqB5MPJ9o3gLB0nXaYMiG8laTGfoUekgdqpy49cC4ZbR/WC6M+z9eg
	 K5B+HPlsy6by4MB2RTxSZ3utbhATj3NdoO8060M3m/Ya/zYwzhbP9Ub+aoO0FyU33Q
	 Ftp3OYCUREgpbMzRSh7ye/k22kYfLX2k7i4BiA9hvp89DZpBICrR4QKG8pEx1RQzUZ
	 O7h+wVImn325V2aL39yEpWCMOsKSvraMQ3F4FigMFoBa6a6ow5H5yXGx0/3DlsbA3a
	 VY5rjNccnK6FDaJYeP4uhsJaTigd6BNXMxvLcNf7XPf8h/snl0nYyBRFC2KcFt8kG8
	 dJqdcOS6cWd9A==
Date: Tue, 4 Mar 2025 09:58:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v15 2/8] remoteproc: Add TEE support
Message-ID: <qxzsz2r7ugiyb7njphmdyupihqmalnmfbbsrtpi7meua37qfqb@bobtx24bwl6r>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-3-arnaud.pouliquen@foss.st.com>
 <6fufphs3ajlc7htj74qus6gifdd4yd64l5yjn2zyjrtdezoe4f@cqbbzg63acv4>
 <93a0475f-c62f-4eab-b9c2-0306e24041bb@foss.st.com>
 <zcr3zg3t3iwshyz3e5valrfluk4s4isrqfiz7y3naw53goemtq@ph2ctpemqile>
 <e2e127a5-a451-486e-9978-7ddc13462da3@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2e127a5-a451-486e-9978-7ddc13462da3@foss.st.com>

On Wed, Feb 12, 2025 at 02:42:28PM +0100, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 2/12/25 04:18, Bjorn Andersson wrote:
> > On Tue, Dec 10, 2024 at 09:57:40AM +0100, Arnaud POULIQUEN wrote:
> >> Hello Bjorn,
> >>
> >> On 12/6/24 23:07, Bjorn Andersson wrote:
> >>> On Thu, Nov 28, 2024 at 09:42:09AM GMT, Arnaud Pouliquen wrote:
> >>>> Add a remoteproc TEE (Trusted Execution Environment) driver
> >>>> that will be probed by the TEE bus. If the associated Trusted
> >>>> application is supported on secure part this driver offers a client
> >>>> interface to load a firmware by the secure part.
> >>>
> >>> If...else?
> >>>
> >>>> This firmware could be authenticated by the secure trusted application.
> >>>>
> >>>
> >>> I would like for this to fully describe how this fits with the bus and
> >> Are you speaking about the OP-TEE bus?
> >>
> >> I assume that your attempt is that I provide more details on the live cycle
> >> sequence, right?
> >>
> > 
> > Right, there's a tee_client_driver and there's a remoteproc driver.
> > Let's document clearly how these interact.
> > 
> >>> how it is expected to be used by a specific remoteproc driver.
> >>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> ---
> >>>> Updates vs version v13:
> >>>> - define REMOTEPROC_TEE as bool instead of tristate,
> >>>> - remove the load of the firmware in rproc_tee_parse_fw as we will ensure
> >>>>   that the firmware is loaded using the load_fw() operation.
> >>>> ---
> >>>>  drivers/remoteproc/Kconfig          |  10 +
> >>>>  drivers/remoteproc/Makefile         |   1 +
> >>>>  drivers/remoteproc/remoteproc_tee.c | 508 ++++++++++++++++++++++++++++
> >>>>  include/linux/remoteproc.h          |   4 +
> >>>>  include/linux/remoteproc_tee.h      | 105 ++++++
> >>>>  5 files changed, 628 insertions(+)
> >>>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >>>>  create mode 100644 include/linux/remoteproc_tee.h
> >>>>
> >>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >>>> index 955e4e38477e..f6335321d540 100644
> >>>> --- a/drivers/remoteproc/Kconfig
> >>>> +++ b/drivers/remoteproc/Kconfig
> >>>> @@ -23,6 +23,16 @@ config REMOTEPROC_CDEV
> >>>>  
> >>>>  	  It's safe to say N if you don't want to use this interface.
> >>>>  
> >>>> +config REMOTEPROC_TEE
> >>>> +	bool "Remoteproc support by a TEE application"
> >>>> +	depends on OPTEE
> >>>> +	help
> >>>> +	  Support a remote processor with a TEE application.
> >>>
> >>> Does the remote processor run TEE applications? (Rethorical question...)
> >>>
> >>>> 	  The Trusted
> >>>> +	  Execution Context is responsible for loading the trusted firmware
> >>>> +	  image and managing the remote processor's lifecycle.
> >>>> +
> >>>> +	  It's safe to say N if you don't want to use remoteproc TEE.
> >>>
> >>> It's not really about "wanting to use", it's a question whether your
> >>> device implements/provides the remoteproc TEE.
> >>>
> >>>> +
> >>>>  config IMX_REMOTEPROC
> >>>>  	tristate "i.MX remoteproc support"
> >>>>  	depends on ARCH_MXC
> >>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> >>>> index 5ff4e2fee4ab..f77e0abe8349 100644
> >>>> --- a/drivers/remoteproc/Makefile
> >>>> +++ b/drivers/remoteproc/Makefile
> >>>> @@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
> >>>>  remoteproc-y				+= remoteproc_virtio.o
> >>>>  remoteproc-y				+= remoteproc_elf_loader.o
> >>>>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> >>>> +obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
> >>>>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
> >>>>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
> >>>>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> >>>> diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
> >>>> new file mode 100644
> >>>> index 000000000000..3fe3f31068f2
> >>>> --- /dev/null
> >>>> +++ b/drivers/remoteproc/remoteproc_tee.c
> >>>> @@ -0,0 +1,508 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>>> +/*
> >>>> + * Copyright (C) STMicroelectronics 2024
> >>>> + * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> + */
> >>>> +
> >>>> +#include <linux/firmware.h>
> >>>> +#include <linux/io.h>
> >>>> +#include <linux/module.h>
> >>>> +#include <linux/remoteproc.h>
> >>>> +#include <linux/remoteproc_tee.h>
> >>>> +#include <linux/slab.h>
> >>>> +#include <linux/tee_drv.h>
> >>>> +
> >>>> +#define MAX_TEE_PARAM_ARRAY_MEMBER	4
> >>>> +
> >>>> +/*
> >>>> + * Authentication of the firmware and load in the remote processor memory
> >>>
> >>> Exactly what does this imply? Will the content of @memref be copied into
> >>> some other memory?
> >>
> >> The objective is to authenticate and load in one step. So, yes, the image is
> >> loaded into the remoteproc destination memory.
> >>
> > 
> > So, some separate device-memory, or some preallocated carveout which is
> > only accessible from secure world?
> 
> No sure to understand the difference you do between eparate device-memory and
> preallocated carveout.
> 

The main clarification I was looking for was that in your design you
don't use any resources on the Linux side for when your remoteproc
instance is running - i.e. no carveouts etc on the Linux side.

> In OP-TEE, we use the same principle as in Linux. OP-TEE uses memory regions
> declared in its device tree to list memories usable for the coprocessor (with
> associated access rights). On load, it checks that the segments to load  are
> included in these memory regions.
> 
> Linux only declares the shared memory-regions in the device tree, for IPC.
> 
> > 
> > Does the OS need to retain @memref past this point?
> 
> No need,and as the area contains the reult of request_firmware() that can be
> corrupted by Linux, OP-TEE considered this as a temporaray unsafe memory. After
> the load + authentication step this buffer is no more used.
> For detail, OPTEE make a copy of the header and TLV (metadata) in a secure
> memory. and load the firmware images in destination memories All these memories
>  are not accessible from the Linux.
> 

No concerns with this, but these semantics should be clearly documented
here.

> > 
> >> On stm32mp1 we can not store the elf file in a temporary secure memory as
> >> the memory is encrypted by software (this would take to much time).
> >>
> >> For your information, in OP-TEE, the application code is split into a generic
> >> part and a platform adaptation layer. The generic application is mainly
> >> responsible for:
> >>
> >> - Copying the binary header and metadata into secure memory and authenticating them.
> >> - Parsing the ELF images and providing segments to load with associated
> >> authenticated hashes to the platform application.
> >> In the future, someone can add their own format if needed.
> >>
> >> But the generic part could be enhance to authenticate and load a non ELF binary.
> >> So I'm trying to be generic as possible here.
> >>
> > 
> > Generic might be okay, but I'd prefer this to be less vague.
> > Also worth noting is the Qualcomm implementation of TZ-backed
> > remoteproc, which is already in the tree. 
> 
> Could you point me the code in Linux and your TEE, please?
> 

One example is drivers/remoteproc/qcom_q6v5_pas.c where this is captured
in adsp_start().

qcom_mdt_pas_init() parses out the ELF header and signature information
and passes this to the secure world, it then loads the segments of the
ELF into the carvouts (qcom_mdt_load_no_init()) and finally it jumps to
secure world with qcom_scm_pas_auth_and_reset(), which will lock down
Linux's access to the carveouts, then based on previously established
data will authenticate the loaded firmware and finally start execution
on the remote processor.

The difference in this model though is that we don't need the resource
table for rproc_handle_resources() - so this doesn't meet your needs.

> > There the firmware is loaded
> > into carveouts, the certificates and hashes are validated. 
> 
> Seems to me that there is also a partial Authentication done during the load step.
> 

Given that the ELF header and signature information is vetted before the
actually copy the segments into carveouts, it's conceivable that the ELF
header could be sanity checked...

> > Lastly
> > the operation "authenticate and start" is invoked, which does that, and
> > locks the OS out of the given memory region - until "shutdown" is
> > invoked.
> 
> The differnce between the 2 implementations is the authentication method done in
> 2 steps for Qualcomm implementation , in one step for OP-TEE.
> 

Yes, but it needs to be pointed out that this is because you want the
resource table to be authenticated.

> So here if I just remove the term 'authentication' in the command description
> does it ok for you?
> 

No, perhaps I'm misinterpreting you here; but the goal isn't to play
word games until it's good enough - the goal is to have a clean design
that will cover the various cases, and for that we need to establish
what your actual requirements on the host OS side is (typically while
considering the "other side" to be a black box).

> > 
> >>
> >>>
> >>>> + *
> >>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>
> >>> Why not just "remote processor identifier"?
> >>>
> >>>> + * [in]	 params[1].memref:	buffer containing the image of the buffer
> >>>> + */
> >>>> +#define TA_RPROC_FW_CMD_LOAD_FW		1
> >>>> +
> >>>> +/*
> >>>> + * Start the remote processor
> >>>> + *
> >>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>> + */
> >>>> +#define TA_RPROC_FW_CMD_START_FW	2
> >>>
> >>> Why is there two "FW" in this constant? Why isn't it just
> >>> "TA_RPROC_FW_CMD_START"?
> >>>
> >>> And why is it not TEE_PROC_FW_CMD_START?
> >>>
> >>>> +
> >>>> +/*
> >>>> + * Stop the remote processor
> >>>> + *
> >>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>> + */
> >>>> +#define TA_RPROC_FW_CMD_STOP_FW		3
> >>>> +
> >>>> +/*
> >>>> + * Return the address of the resource table, or 0 if not found
> >>>> + * No check is done to verify that the address returned is accessible by
> >>>> + * the non secure context. If the resource table is loaded in a protected
> >>>> + * memory the access by the non secure context will lead to a data abort.
> >>>
> >>> These three lines describe a scenario that doesn't make any sense to me.
> >>> But if that's the case, you should be able to describe that the API
> >>> might give you a inaccessible pointer, by design.
> >>
> >> On STM32MP, we have a kind of firewall in OP-TEE that sets memory access rights
> >> from the device tree. So if the firmware image is not linked according to the
> >> firewall configuration, the pointer may not be accessible.
> >>
> >> I will update the comment as you propose.
> >>
> >>>
> >>>> + *
> >>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>> + * [out]  params[1].value.a:	32bit LSB resource table memory address
> >>>> + * [out]  params[1].value.b:	32bit MSB resource table memory address
> >>>> + * [out]  params[2].value.a:	32bit LSB resource table memory size
> >>>> + * [out]  params[2].value.b:	32bit MSB resource table memory size
> >>>> + */
> >>>> +#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
> >>>> +
> >>>> +/*
> >>>> + * Return the address of the core dump
> >>>
> >>> What does this mean? What will I find at @memref after this call?
> >>
> >> I do not have a simple answer here as it depends on the OP-TEE strategy.
> >> It could be an obscure core dump with possible encryption.
> >>
> >> I will remove this as it is not yet implemented in OP-TEE.
> >>
> > 
> > Okay. But I would prefer that we define the semantics before it's
> > implemented...
> 
> that seems fair, I notice that we will have to address this in a separate thread
> strating with a series in Linux.
> 
> 
> > 
> >> https://elixir.bootlin.com/op-tee/4.4.0/source/ta/remoteproc/src/remoteproc_core.c#L1131
> >>
> >>>
> >>>> + *
> >>>> + * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
> >>>> + * [out] params[1].memref:	address of the core dump image if exist,
> >>>> + *				else return Null
> >>>
> >>> s/else return Null/or NULL/
> >>>
> >>>> + */
> >>>> +#define TA_RPROC_FW_CMD_GET_COREDUMP	5
> >>>> +
> >>>> +/*
> >>>> + * Release remote processor firmware images and associated resources.
> >>>
> >>> Exactly what does this mean for the caller?
> >>
> >> It is platform dependent. It can consist in cleaning the memory, but
> >> can be also something else such as firewall configuration.
> >> On stm323mp we clean all the memories region reserved for the remote processor.
> >>
> > 
> > We can't have an ABI which isn't well defined in intent. Your examples
> > would easily fall in the realm of a well defined interface, but this
> > ties into the question above - what does is actually mean in terms of
> > the memory carveouts and such.
> > 
> 
> Regarding this comment and the one below, does following description would
> respond to your expectations? else do you have a suggestion?
> 
> /*
>  * This command should be used in case an error occurs between the loading of
>  * the firmware images (TA_RPROC_CMD_LOAD_FW) and the starting of the remote
>  * processor (TA_RPROC_CMD_START_FW),

This is valuable information related to TA_RPROC_CMD_LOAD_FW and
TA_RPROC_CMD_START_FW, so let's document this there instead.

>  * or after stopping the remote processor
>  * (TA_RPROC_CMD_STOP_FW).
>  *
>  * This command is used to inform the TEE (Trusted Execution Environment) that
>  * resources associated with the remote processor can be released. After this
>  * command, the firmware is no longer present in the remote processor's memories
>  * and must be reloaded (TA_RPROC_FW_CMD_LOAD_FW) to restart the remote
>  * processor.

I guess it's fine to define it like this on this level, but in the
remoteproc core I'd like us to express the related logic as "release
resources allocated durign rproc_parse_fw(). (And I don't think these
two interpretations are in conflict).

What's unexpected to me then is that you're not actually reloading your
firmware across a recovery/restart?

Regards,
Bjorn
