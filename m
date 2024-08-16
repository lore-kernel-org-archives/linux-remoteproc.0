Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19821A7074
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Aug 2024 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818989; cv=none; b=YzpSNGovCo2c5kpaA54qWuigTI5l2k7Y35eCy/5b4ZgcN7w+s5EJEY9fzdNUyU6run5c+XPK8tWu70K30qd7dI2Nvo6Dzgrme6++iqSSK5GeM9er34qVUBrU3kRo5DQ/GbC5y9rps/GmzgvVpnkP97lETMhwAIXVOCOGxX9X6+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818989; c=relaxed/simple;
	bh=upAA/SitURGti9i50vPJNSzEcnH/6ch6qrdcZWPd1bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2hchWcjl/UT80PhMc3nDZftv3uPAHqoR9WmmCtbV8mRt7ig/Uz5XIJz/lG7DzdsuGBKeP5qAXwTZLW40s4rZb1aFe2e186nt5SBNIzS3v8GPAT8yEqeyyQiRRBDOic2Eb4gTLfalCTx05DwSvye1bD3hQbi3Mzc6bF3Pobd9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1u+PdIs; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1u+PdIs"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-710dc3015bfso1475686b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Aug 2024 07:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723818985; x=1724423785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LurE3B7B+jM9oToOQS5sSnfPvpBmnQADOuc2CgoXmws=;
        b=T1u+PdIszsVGt0tLEXjM4vPu+6eUAIPNiai8RF2uzOIcJk32ymkZobPV1CPNy4nWA8
         PZzqy5qKDmrsFuivuNM+5AuFvBFadFpGT0RrncB+8rB2REfdI9uP1UXHJk4d9I3QeJqs
         SM/cwxZBuU3SUib4PCB5LTjR159kRmMGROn/gOWjDyzJxNrYbQWnr9eVbk2WQ/+2S9s4
         9Swy+DgaV25orLZK9Uv8xdb1GgPgjNtRdtZomGLv92OYrDZZWaqyWvVyprcZiti/v5d2
         iG6BilCZwjzRD9Pq41xao6U8OkFP0av+qTcpryWGtcY6e5QaeCYSONXjl0F6sWri78ki
         4aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723818985; x=1724423785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LurE3B7B+jM9oToOQS5sSnfPvpBmnQADOuc2CgoXmws=;
        b=nnxEJobHGsw/pWSXKRfusVv8qDD9U1U+IqidqHbBammE4DEMk8F56fIWq7h9FQMeO9
         kyQYwiLSalAzM/cAZK1MVcANf+YoMblm/8O1aipJpY5NtURQOFQGaPzqOBLS5VZNmkws
         HwU39G5lxSH2CHZW8cedxCAXm+7xyd/bNIq6LRswdMyVA38JeueYmL4eFd3UysfW0bZZ
         4yuUVMcYnGMIwYaO9ze+it69+G0ulxInVygpFv1cHYrVN9mtwLIzP/jML2TPNEwgTIfC
         Y6bm/XyxRB9F1cnCQD5UxztD1evgvlTYfQGSYzpPvB7Dv9trlaHTZlK6dla6h/LjYYJQ
         MH1g==
X-Forwarded-Encrypted: i=1; AJvYcCVGN6ucLvTnBfUdY690AI29KZkuHr3WFXOL15LYzXDs9pjMKpHCB5A7DttGuAHFkD47t6rzSE6GEVHdGJInkRTevPBJXrmDjOK7xECLwhRvZw==
X-Gm-Message-State: AOJu0YxlOALynkPa9LPc/AUyyI/iAhHXBjOc3ijK5oNpICWOoKRbSsJP
	4Y4igAW83fkvuYhyorIGTAdD0UDVteBu8MkS+Q8ugo4ofrHRsL7UTG04Qj5kWXU=
X-Google-Smtp-Source: AGHT+IEF6G35L9FBgf2GK5QcHHCmLGBHx+AQjF5h+BENbgn0rqC+muLXRTQ50o237YEkbqUQVp9hPw==
X-Received: by 2002:a05:6a00:1ac7:b0:70d:32bf:aa45 with SMTP id d2e1a72fcca58-713c66e7abdmr3760650b3a.14.1723818984723;
        Fri, 16 Aug 2024 07:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b343:9a6:583a:ddcd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add68desm2695765b3a.29.2024.08.16.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 07:36:24 -0700 (PDT)
Date: Fri, 16 Aug 2024 08:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hari Nagalla <hnagalla@ti.com>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/9] remoteproc: k3-m4: Add a remoteproc driver for
 M4F subsystem
Message-ID: <Zr9j5HBjRqqRIoaD@p14s>
References: <20240802152109.137243-1-afd@ti.com>
 <20240802152109.137243-4-afd@ti.com>
 <Zr4w8Vj0mVo5sBsJ@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr4w8Vj0mVo5sBsJ@p14s>

On Thu, Aug 15, 2024 at 10:46:41AM -0600, Mathieu Poirier wrote:
> Hi,
> 
> On Fri, Aug 02, 2024 at 10:21:03AM -0500, Andrew Davis wrote:
> > From: Martyn Welch <martyn.welch@collabora.com>
> > 
> > The AM62x and AM64x SoCs of the TI K3 family has a Cortex M4F core in
> > the MCU domain. This core is typically used for safety applications in a
> > stand alone mode. However, some application (non safety related) may
> > want to use the M4F core as a generic remote processor with IPC to the
> > host processor. The M4F core has internal IRAM and DRAM memories and are
> > exposed to the system bus for code and data loading.
> > 
> > A remote processor driver is added to support this subsystem, including
> > being able to load and boot the M4F core. Loading includes to M4F
> > internal memories and predefined external code/data memories. The
> > carve outs for external contiguous memory is defined in the M4F device
> > node and should match with the external memory declarations in the M4F
> > image binary. The M4F subsystem has two resets. One reset is for the
> > entire subsystem i.e including the internal memories and the other, a
> > local reset is only for the M4F processing core. When loading the image,
> > the driver first releases the subsystem reset, loads the firmware image
> > and then releases the local reset to let the M4F processing core run.
> > 
> > Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> > Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > ---
> >  drivers/remoteproc/Kconfig               |  13 +
> >  drivers/remoteproc/Makefile              |   1 +
> >  drivers/remoteproc/ti_k3_m4_remoteproc.c | 667 +++++++++++++++++++++++
> >  3 files changed, 681 insertions(+)
> >  create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index dda2ada215b7c..0f0862e20a932 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -340,6 +340,19 @@ config TI_K3_DSP_REMOTEPROC
> >  	  It's safe to say N here if you're not interested in utilizing
> >  	  the DSP slave processors.
> >  
> > +config TI_K3_M4_REMOTEPROC
> > +	tristate "TI K3 M4 remoteproc support"
> > +	depends on ARCH_K3 || COMPILE_TEST
> > +	select MAILBOX
> > +	select OMAP2PLUS_MBOX
> > +	help
> > +	  Say m here to support TI's M4 remote processor subsystems
> > +	  on various TI K3 family of SoCs through the remote processor
> > +	  framework.
> > +
> > +	  It's safe to say N here if you're not interested in utilizing
> > +	  a remote processor.
> > +
> >  config TI_K3_R5_REMOTEPROC
> >  	tristate "TI K3 R5 remoteproc support"
> >  	depends on ARCH_K3
> > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > index 91314a9b43cef..5ff4e2fee4abd 100644
> > --- a/drivers/remoteproc/Makefile
> > +++ b/drivers/remoteproc/Makefile
> > @@ -37,5 +37,6 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
> >  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
> >  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
> >  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
> > +obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o
> >  obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
> >  obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
> > diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > new file mode 100644
> > index 0000000000000..09f0484a90e10
> > --- /dev/null
> > +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > @@ -0,0 +1,667 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * TI K3 Cortex-M4 Remote Processor(s) driver
> > + *
> > + * Copyright (C) 2021-2024 Texas Instruments Incorporated - https://www.ti.com/
> > + *	Hari Nagalla <hnagalla@ti.com>
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/reset.h>
> > +#include <linux/slab.h>
> > +
> > +#include "omap_remoteproc.h"
> > +#include "remoteproc_internal.h"
> > +#include "ti_sci_proc.h"
> > +
> > +#define K3_M4_IRAM_DEV_ADDR 0x00000
> > +#define K3_M4_DRAM_DEV_ADDR 0x30000
> > +
> > +/**
> > + * struct k3_m4_rproc_mem - internal memory structure
> > + * @cpu_addr: MPU virtual address of the memory region
> > + * @bus_addr: Bus address used to access the memory region
> > + * @dev_addr: Device address of the memory region from remote processor view
> > + * @size: Size of the memory region
> > + */
> > +struct k3_m4_rproc_mem {
> > +	void __iomem *cpu_addr;
> > +	phys_addr_t bus_addr;
> > +	u32 dev_addr;
> > +	size_t size;
> > +};
> > +
> > +/**
> > + * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
> > + * @name: name for this memory entry
> > + * @dev_addr: device address for the memory entry
> > + */
> > +struct k3_m4_rproc_mem_data {
> > +	const char *name;
> > +	const u32 dev_addr;
> > +};
> > +
> > +/**
> > + * struct k3_m4_rproc - k3 remote processor driver structure
> > + * @dev: cached device pointer
> > + * @mem: internal memory regions data
> > + * @num_mems: number of internal memory regions
> > + * @rmem: reserved memory regions data
> > + * @num_rmems: number of reserved memory regions
> > + * @reset: reset control handle
> > + * @tsp: TI-SCI processor control handle
> > + * @ti_sci: TI-SCI handle
> > + * @ti_sci_id: TI-SCI device identifier
> > + * @mbox: mailbox channel handle
> > + * @client: mailbox client to request the mailbox channel
> > + */
> > +struct k3_m4_rproc {
> > +	struct device *dev;
> > +	struct k3_m4_rproc_mem *mem;
> > +	int num_mems;
> > +	struct k3_m4_rproc_mem *rmem;
> > +	int num_rmems;
> > +	struct reset_control *reset;
> > +	struct ti_sci_proc *tsp;
> > +	const struct ti_sci_handle *ti_sci;
> > +	u32 ti_sci_id;
> > +	struct mbox_chan *mbox;
> > +	struct mbox_client client;
> > +};
> > +
> > +/**
> > + * k3_m4_rproc_mbox_callback() - inbound mailbox message handler
> > + * @client: mailbox client pointer used for requesting the mailbox channel
> > + * @data: mailbox payload
> > + *
> > + * This handler is invoked by the K3 mailbox driver whenever a mailbox
> > + * message is received. Usually, the mailbox payload simply contains
> > + * the index of the virtqueue that is kicked by the remote processor,
> > + * and we let remoteproc core handle it.
> > + *
> > + * In addition to virtqueue indices, we also have some out-of-band values
> > + * that indicate different events. Those values are deliberately very
> > + * large so they don't coincide with virtqueue indices.
> > + */
> > +static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
> > +{
> > +	struct device *dev = client->dev;
> > +	struct rproc *rproc = dev_get_drvdata(dev);
> > +	u32 msg = (u32)(uintptr_t)(data);
> > +
> > +	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
> > +
> > +	switch (msg) {
> > +	case RP_MBOX_CRASH:
> > +		/*
> > +		 * remoteproc detected an exception, but error recovery is not
> > +		 * supported. So, just log this for now
> > +		 */
> > +		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
> > +		break;
> > +	case RP_MBOX_ECHO_REPLY:
> > +		dev_info(dev, "received echo reply from %s\n", rproc->name);
> > +		break;
> > +	default:
> > +		/* silently handle all other valid messages */
> > +		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> > +			return;
> > +		if (msg > rproc->max_notifyid) {
> > +			dev_dbg(dev, "dropping unknown message 0x%x", msg);
> > +			return;
> > +		}
> > +		/* msg contains the index of the triggered vring */
> > +		if (rproc_vq_interrupt(rproc, msg) == IRQ_NONE)
> > +			dev_dbg(dev, "no message was found in vqid %d\n", msg);
> > +	}
> > +}
> > +
> > +/*
> > + * Kick the remote processor to notify about pending unprocessed messages.
> > + * The vqid usage is not used and is inconsequential, as the kick is performed
> > + * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
> > + * the remote processor is expected to process both its Tx and Rx virtqueues.
> > + */
> > +static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	struct device *dev = kproc->dev;
> > +	u32 msg = (u32)vqid;
> > +	int ret;
> > +
> > +	/*
> > +	 * Send the index of the triggered virtqueue in the mailbox payload.
> > +	 * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
> > +	 * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
> > +	 */
> > +	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
> > +	if (ret < 0)
> > +		dev_err(dev, "failed to send mailbox message, status = %d\n",
> > +			ret);
> > +}
> > +
> > +static int k3_m4_rproc_ping_mbox(struct k3_m4_rproc *kproc)
> > +{
> > +	struct device *dev = kproc->dev;
> > +	int ret;
> > +
> > +	/*
> > +	 * Ping the remote processor, this is only for sanity-sake for now;
> > +	 * there is no functional effect whatsoever.
> > +	 *
> > +	 * Note that the reply will _not_ arrive immediately: this message
> > +	 * will wait in the mailbox fifo until the remote processor is booted.
> > +	 */
> > +	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> > +	if (ret < 0) {
> > +		dev_err(dev, "mbox_send_message failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * The M4 cores have a local reset that affects only the CPU, and a
> > + * generic module reset that powers on the device and allows the internal
> > + * memories to be accessed while the local reset is asserted. This function is
> > + * used to release the global reset on remote cores to allow loading into the
> > + * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
> > + * firmware loading, and is followed by the .start() ops after loading to
> > + * actually let the remote cores to run.
> > + */
> > +static int k3_m4_rproc_prepare(struct rproc *rproc)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	struct device *dev = kproc->dev;
> > +	int ret;
> > +
> > +	/* If the core is running already no need to deassert the module reset */
> > +	if (rproc->state == RPROC_DETACHED)
> > +		return 0;
> > +
> > +	/*
> > +	 * Ensure the local reset is asserted so the core doesn't
> > +	 * execute bogus code when the module reset is released.
> > +	 */
> > +	ret = reset_control_assert(kproc->reset);
> > +	if (ret) {
> > +		dev_err(dev, "could not assert local reset\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = reset_control_status(kproc->reset);
> > +	if (ret <= 0) {
> > +		dev_err(dev, "local reset still not asserted\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> > +						    kproc->ti_sci_id);
> > +	if (ret) {
> > +		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * This function implements the .unprepare() ops and performs the complimentary
> > + * operations to that of the .prepare() ops. The function is used to assert the
> > + * global reset on applicable cores. This completes the second portion of
> > + * powering down the remote core. The cores themselves are only halted in the
> > + * .stop() callback through the local reset, and the .unprepare() ops is invoked
> > + * by the remoteproc core after the remoteproc is stopped to balance the global
> > + * reset.
> > + */
> > +static int k3_m4_rproc_unprepare(struct rproc *rproc)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	struct device *dev = kproc->dev;
> > +	int ret;
> > +
> > +	/* If the core is going to be detached do not assert the module reset */
> > +	if (rproc->state == RPROC_ATTACHED)
> > +		return 0;
> > +
> > +	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> > +						    kproc->ti_sci_id);
> > +	if (ret) {
> > +		dev_err(dev, "module-reset assert failed\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * This function implements the .get_loaded_rsc_table() callback and is used
> > + * to provide the resource table for a booted remote processor in IPC-only
> > + * mode. The remote processor firmwares follow a design-by-contract approach
> > + * and are expected to have the resource table at the base of the DDR region
> > + * reserved for firmware usage. This provides flexibility for the remote
> > + * processor to be booted by different bootloaders that may or may not have the
> > + * ability to publish the resource table address and size through a DT
> > + * property.
> > + */
> > +static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
> > +							 size_t *rsc_table_sz)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	struct device *dev = kproc->dev;
> > +
> > +	if (!kproc->rmem[0].cpu_addr) {
> > +		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	/*
> > +	 * NOTE: The resource table size is currently hard-coded to a maximum
> > +	 * of 256 bytes. The most common resource table usage for K3 firmwares
> > +	 * is to only have the vdev resource entry and an optional trace entry.
> > +	 * The exact size could be computed based on resource table address, but
> > +	 * the hard-coded value suffices to support the IPC-only mode.
> > +	 */
> > +	*rsc_table_sz = 256;
> > +	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
> > +}
> > +
> > +/*
> > + * Custom function to translate a remote processor device address (internal
> > + * RAMs only) to a kernel virtual address.  The remote processors can access
> > + * their RAMs at either an internal address visible only from a remote
> > + * processor, or at the SoC-level bus address. Both these addresses need to be
> > + * looked through for translation. The translated addresses can be used either
> > + * by the remoteproc core for loading (when using kernel remoteproc loader), or
> > + * by any rpmsg bus drivers.
> > + */
> > +static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	void __iomem *va = NULL;
> > +	phys_addr_t bus_addr;
> > +	u32 dev_addr, offset;
> > +	size_t size;
> > +	int i;
> > +
> > +	if (len == 0)
> > +		return NULL;
> > +
> > +	for (i = 0; i < kproc->num_mems; i++) {
> > +		bus_addr = kproc->mem[i].bus_addr;
> > +		dev_addr = kproc->mem[i].dev_addr;
> > +		size = kproc->mem[i].size;
> > +
> > +		/* handle M4-view addresses */
> > +		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
> > +			offset = da - dev_addr;
> > +			va = kproc->mem[i].cpu_addr + offset;
> > +			return (__force void *)va;
> > +		}
> > +
> > +		/* handle SoC-view addresses */
> > +		if (da >= bus_addr && ((da + len) <= (bus_addr + size))) {
> > +			offset = da - bus_addr;
> > +			va = kproc->mem[i].cpu_addr + offset;
> > +			return (__force void *)va;
> > +		}
> > +	}
> > +
> > +	/* handle static DDR reserved memory regions */
> > +	for (i = 0; i < kproc->num_rmems; i++) {
> > +		dev_addr = kproc->rmem[i].dev_addr;
> > +		size = kproc->rmem[i].size;
> > +
> > +		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
> > +			offset = da - dev_addr;
> > +			va = kproc->rmem[i].cpu_addr + offset;
> > +			return (__force void *)va;
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
> > +				       struct k3_m4_rproc *kproc)
> > +{
> > +	static const char * const mem_names[] = { "iram", "dram" };
> > +	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	int num_mems;
> > +	int i;
> > +
> > +	num_mems = ARRAY_SIZE(mem_names);
> > +	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
> > +				  sizeof(*kproc->mem), GFP_KERNEL);
> > +	if (!kproc->mem)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_mems; i++) {
> > +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > +						   mem_names[i]);
> > +		if (!res) {
> > +			dev_err(dev, "found no memory resource for %s\n",
> > +				mem_names[i]);
> > +			return -EINVAL;
> > +		}
> > +		if (!devm_request_mem_region(dev, res->start,
> > +					     resource_size(res),
> > +					     dev_name(dev))) {
> > +			dev_err(dev, "could not request %s region for resource\n",
> > +				mem_names[i]);
> > +			return -EBUSY;
> > +		}
> > +
> > +		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
> > +							 resource_size(res));
> > +		if (!kproc->mem[i].cpu_addr) {
> > +			dev_err(dev, "failed to map %s memory\n",
> > +				mem_names[i]);
> > +			return -ENOMEM;
> > +		}
> > +		kproc->mem[i].bus_addr = res->start;
> > +		kproc->mem[i].dev_addr = mem_addrs[i];
> > +		kproc->mem[i].size = resource_size(res);
> > +
> > +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> > +			mem_names[i], &kproc->mem[i].bus_addr,
> > +			kproc->mem[i].size, kproc->mem[i].cpu_addr,
> > +			kproc->mem[i].dev_addr);
> > +	}
> > +	kproc->num_mems = num_mems;
> > +
> > +	return 0;
> > +}
> > +
> > +static void k3_m4_rproc_dev_mem_release(void *data)
> > +{
> > +	struct device *dev = data;
> > +
> > +	of_reserved_mem_device_release(dev);
> > +}
> > +
> > +static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
> > +{
> > +	struct device *dev = kproc->dev;
> > +	struct device_node *np = dev->of_node;
> > +	struct device_node *rmem_np;
> > +	struct reserved_mem *rmem;
> > +	int num_rmems;
> > +	int ret, i;
> > +
> > +	num_rmems = of_property_count_elems_of_size(np, "memory-region",
> > +						    sizeof(phandle));
> > +	if (num_rmems < 0) {
> > +		dev_err(dev, "device does not reserved memory regions (%d)\n",
> > +			num_rmems);
> > +		return -EINVAL;
> > +	}
> > +	if (num_rmems < 2) {
> > +		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
> > +			num_rmems);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* use reserved memory region 0 for vring DMA allocations */
> > +	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
> > +	if (ret) {
> > +		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
> > +		return ret;
> > +	}
> > +	ret = devm_add_action_or_reset(dev, k3_m4_rproc_dev_mem_release, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	num_rmems--;
> > +	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
> > +	if (!kproc->rmem)
> > +		return -ENOMEM;
> > +
> > +	/* use remaining reserved memory regions for static carveouts */
> > +	for (i = 0; i < num_rmems; i++) {
> > +		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
> > +		if (!rmem_np)
> > +			return -EINVAL;
> > +
> > +		rmem = of_reserved_mem_lookup(rmem_np);
> > +		if (!rmem) {
> > +			of_node_put(rmem_np);
> > +			return -EINVAL;
> > +		}
> > +		of_node_put(rmem_np);
> > +
> > +		kproc->rmem[i].bus_addr = rmem->base;
> > +		/* 64-bit address regions currently not supported */
> > +		kproc->rmem[i].dev_addr = (u32)rmem->base;
> > +		kproc->rmem[i].size = rmem->size;
> > +		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
> > +		if (!kproc->rmem[i].cpu_addr) {
> > +			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
> > +				i + 1, &rmem->base, &rmem->size);
> > +			return -ENOMEM;
> > +		}
> > +
> > +		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> > +			i + 1, &kproc->rmem[i].bus_addr,
> > +			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
> > +			kproc->rmem[i].dev_addr);
> > +	}
> > +	kproc->num_rmems = num_rmems;
> > +
> > +	return 0;
> > +}
> > +
> > +static void k3_m4_release_tsp(void *data)
> > +{
> > +	struct ti_sci_proc *tsp = data;
> > +
> > +	ti_sci_proc_release(tsp);
> > +}
> > +
> > +/*
> > + * Power up the M4 remote processor.
> > + *
> > + * This function will be invoked only after the firmware for this rproc
> > + * was loaded, parsed successfully, and all of its resource requirements
> > + * were met. This callback is invoked only in remoteproc mode.
> > + */
> > +static int k3_m4_rproc_start(struct rproc *rproc)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	struct device *dev = kproc->dev;
> > +	int ret;
> > +
> > +	ret = k3_m4_rproc_ping_mbox(kproc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_deassert(kproc->reset);
> > +	if (ret) {
> > +		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Stop the M4 remote processor.
> > + *
> > + * This function puts the M4 processor into reset, and finishes processing
> > + * of any pending messages. This callback is invoked only in remoteproc mode.
> > + */
> > +static int k3_m4_rproc_stop(struct rproc *rproc)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	struct device *dev = kproc->dev;
> > +	int ret;
> > +
> > +	ret = reset_control_assert(kproc->reset);
> > +	if (ret) {
> > +		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Attach to a running M4 remote processor (IPC-only mode)
> > + *
> > + * The remote processor is already booted, so there is no need to issue any
> > + * TI-SCI commands to boot the M4 core. This callback is used only in IPC-only
> > + * mode.
> > + */
> > +static int k3_m4_rproc_attach(struct rproc *rproc)
> > +{
> > +	struct k3_m4_rproc *kproc = rproc->priv;
> > +	int ret;
> > +
> > +	ret = k3_m4_rproc_ping_mbox(kproc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Detach from a running M4 remote processor (IPC-only mode)
> > + *
> > + * This rproc detach callback performs the opposite operation to attach
> > + * callback, the M4 core is not stopped and will be left to continue to
> > + * run its booted firmware. This callback is invoked only in IPC-only mode.
> > + */
> > +static int k3_m4_rproc_detach(struct rproc *rproc)
> > +{
> > +	return 0;
> > +}
> 
> Please remove.

Forget this comment since it would cause an error in __rproc_detach().  

> 
> Other than the above I'm good with this driver.  That said I can't move forward
> without a nod from the DT crew.  I also noticed a fair amount of code
> duplication with the k3_r5 and k3_dsp drivers.  Dealing with that should not be
> part of the current work but will need to be done before another k3 driver can
> be merged.
> 

The above still apply though.

> Thanks,
> Mathieu
> 
> > +
> > +static const struct rproc_ops k3_m4_rproc_ops = {
> > +	.prepare = k3_m4_rproc_prepare,
> > +	.unprepare = k3_m4_rproc_unprepare,
> > +	.start = k3_m4_rproc_start,
> > +	.stop = k3_m4_rproc_stop,
> > +	.attach = k3_m4_rproc_attach,
> > +	.detach = k3_m4_rproc_detach,
> > +	.kick = k3_m4_rproc_kick,
> > +	.da_to_va = k3_m4_rproc_da_to_va,
> > +	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
> > +};
> > +
> > +static int k3_m4_rproc_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct k3_m4_rproc *kproc;
> > +	struct rproc *rproc;
> > +	const char *fw_name;
> > +	bool r_state = false;
> > +	bool p_state = false;
> > +	int ret;
> > +
> > +	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
> > +
> > +	rproc = devm_rproc_alloc(dev, dev_name(dev), &k3_m4_rproc_ops, fw_name,
> > +				 sizeof(*kproc));
> > +	if (!rproc)
> > +		return -ENOMEM;
> > +
> > +	rproc->has_iommu = false;
> > +	rproc->recovery_disabled = true;
> > +	kproc = rproc->priv;
> > +	kproc->dev = dev;
> > +	platform_set_drvdata(pdev, rproc);
> > +
> > +	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
> > +	if (IS_ERR(kproc->ti_sci))
> > +		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
> > +				     "failed to get ti-sci handle\n");
> > +
> > +	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &kproc->ti_sci_id);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
> > +
> > +	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
> > +	if (IS_ERR(kproc->reset))
> > +		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
> > +
> > +	kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
> > +	if (IS_ERR(kproc->tsp))
> > +		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
> > +				     "failed to construct ti-sci proc control\n");
> > +
> > +	ret = ti_sci_proc_request(kproc->tsp);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> > +	ret = devm_add_action_or_reset(dev, k3_m4_release_tsp, kproc->tsp);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = k3_m4_rproc_of_get_memories(pdev, kproc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = k3_m4_reserved_mem_init(kproc);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "reserved memory init failed\n");
> > +
> > +	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> > +					       &r_state, &p_state);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to get initial state, mode cannot be determined\n");
> > +
> > +	/* configure devices for either remoteproc or IPC-only mode */
> > +	if (p_state) {
> > +		rproc->state = RPROC_DETACHED;
> > +		dev_info(dev, "configured M4F for IPC-only mode\n");
> > +	} else {
> > +		dev_info(dev, "configured M4F for remoteproc mode\n");
> > +	}
> > +
> > +	kproc->client.dev = dev;
> > +	kproc->client.tx_done = NULL;
> > +	kproc->client.rx_callback = k3_m4_rproc_mbox_callback;
> > +	kproc->client.tx_block = false;
> > +	kproc->client.knows_txdone = false;
> > +	kproc->mbox = mbox_request_channel(&kproc->client, 0);
> > +	if (IS_ERR(kproc->mbox))
> > +		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > +				     "mbox_request_channel failed\n");
> > +
> > +	ret = devm_rproc_add(dev, rproc);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to register device with remoteproc core\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id k3_m4_of_match[] = {
> > +	{ .compatible = "ti,am64-m4fss", },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, k3_m4_of_match);
> > +
> > +static struct platform_driver k3_m4_rproc_driver = {
> > +	.probe	= k3_m4_rproc_probe,
> > +	.driver	= {
> > +		.name = "k3-m4-rproc",
> > +		.of_match_table = k3_m4_of_match,
> > +	},
> > +};
> > +module_platform_driver(k3_m4_rproc_driver);
> > +
> > +MODULE_AUTHOR("Hari Nagalla <hnagalla@ti.com>");
> > +MODULE_DESCRIPTION("TI K3 M4 Remoteproc driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.39.2
> > 
