Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D2AD2C
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 May 2024 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716483908; cv=none; b=GZqKT1kUpqddQbRon1Ppa/NCTATBobDO1w8/et2YsDZacRnJ4aIbUPAX/JdaEACw/ml/i+60Nv7r4fY9MLRXfh3RHMJVIljVTEKz903ZnX+sGDbrkII0VyebWTOa5bzljp2oxM+t6mlvLQBxoA6t0iXiv2f4dp4CUHA9Tjli/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716483908; c=relaxed/simple;
	bh=lOeQzefdV1ujcc6lI/nCeDyiDblKBfsalbyCqJPHad4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcC8hcgbzvjJG1A9GLoNcgnOrRbskVvgxBgVfpz2/yrzplDhPYcjtlWWvsXS8DA7V/5u00J5cB6/TlPPWOlEIMxSL6M8YDz2QqUp0XuNzLF/yyyXzcTbhEoHGEJtqT5ZWvHll2u8IxF3MTb3rMORnfxYFiGcW/3FR5IcCWGXrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpECOIMG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpECOIMG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f3421564d2so5937005ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 May 2024 10:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716483906; x=1717088706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae1VmCDv995JhgUsc3q4w75/9r5QM+oRThIFJgBEZQY=;
        b=tpECOIMGJavOgcI2tjd5mWN1d9PTwj37qWW7mEtFS9Mgin8CUfvc1YcX9HAqRGJNNh
         vAlbzMiVkLNWNrbUNXwUCBKloyB9Ldtq3/aNocQx77UQngrCQTWDmI1g7uzPOIITYof+
         VAiHioJdl30EQeYrsnF/6Py5t6IbS9GJpdhkoz9nB6bUOzTGRmPqT+xqdGOHdOtvYuvZ
         dcWu7NhQ9O5dbthh8r+SEw2XHX5E5Nc987qmGr6oE9ebTiVvAGpegZHSxJIX9AfT6O1u
         0lLqtea+Y61kIoIw4aZnKabEpUK1iudjKVaes+0bJJs1F0aZgLEySX4wWMOdQoBJo+zL
         +6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716483906; x=1717088706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae1VmCDv995JhgUsc3q4w75/9r5QM+oRThIFJgBEZQY=;
        b=Do3hJyQbfZGaegeX3ZGAN98j7C+N0cV1G383eaWIiV0Gm3QyAaaBy30Cr62Eq99LMH
         w3Cpqn1rdlFhY9jiFkP7obJaQUNhq3xfJIa/xkkyx3UIixRhtSmPrllICmyJIf5WrQWl
         d/oifnHLXYeWUcqY9m19yXIUjTv3S9R/jfeTYDIhJS8ha7axefWAkb424dJLi8cXCL6Q
         WsXmAad30KPKPs8toLmKk0+h4lWvU+JlUxMjgFT9BMXHqUHP7Ie9oa0gP7JbaJ++maA9
         oQJPJy/g8Afi2AJLFHvxsp0sqSMW21CochgMy+7wtsxraBoTCvesl2g9CL0e+Z00GOHb
         I4ug==
X-Forwarded-Encrypted: i=1; AJvYcCXpW4ZFb7wyfQxQqJr0tPIHX5ZIYyFRetysAVyPwjfoJdhATnHLCeXXi7CDIBTmpgq77Yx0VVCO+2t1hKYGps4A2ckOjiQYGjPtFjAAZbLdlg==
X-Gm-Message-State: AOJu0YxY0rBN1D0JI4qIYYNkKcuyDqWX28TKc6s5csAsh4ts7VSpwQJ9
	ZML5aCxw8u0RnqT0USqyVJmDb66tYStX4hLkQB/C7tVIG8hJq9dw3O3flrjowTg=
X-Google-Smtp-Source: AGHT+IFZOJv094uAkm4jnkBBhWHI4kPPu1EmFaIinvs2RPhSKhaxAJRrttBSye6TYTYEFEW6e1lEKQ==
X-Received: by 2002:a17:902:ccce:b0:1f2:fe49:71dd with SMTP id d9443c01a7336-1f44815e67emr474375ad.14.1716483905010;
        Thu, 23 May 2024 10:05:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ceb4:7a98:2d97:18fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f350dc9ae8sm4141985ad.120.2024.05.23.10.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 10:05:04 -0700 (PDT)
Date: Thu, 23 May 2024 11:05:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drivers: remoteproc: xlnx: add attach detach
 support
Message-ID: <Zk93Pny2wCBeeBGQ@p14s>
References: <20240511005126.1240430-1-tanmay.shah@amd.com>
 <20240511005126.1240430-2-tanmay.shah@amd.com>
 <ZkzgVn4+iTcrLEDT@p14s>
 <4046d7a9-7d6a-47d1-9435-90185e6d32af@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4046d7a9-7d6a-47d1-9435-90185e6d32af@amd.com>

On Wed, May 22, 2024 at 09:36:26AM -0500, Tanmay Shah wrote:
> 
> 
> On 5/21/24 12:56 PM, Mathieu Poirier wrote:
> > Hi Tanmay,
> > 
> > On Fri, May 10, 2024 at 05:51:25PM -0700, Tanmay Shah wrote:
> >> It is possible that remote processor is already running before
> >> linux boot or remoteproc platform driver probe. Implement required
> >> remoteproc framework ops to provide resource table address and
> >> connect or disconnect with remote processor in such case.
> >> 
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >> 
> >> Changes in v2:
> >>   - Fix following sparse warnings
> >> 
> >> drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:    expected struct rsc_tbl_data *rsc_data_va
> >> drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:    expected struct resource_table *rsc_addr
> >> drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:    expected void volatile [noderef] __iomem *addr
> >> 
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 164 +++++++++++++++++++++++-
> >>  1 file changed, 160 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 84243d1dff9f..039370cffa32 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -25,6 +25,10 @@
> >>  /* RX mailbox client buffer max length */
> >>  #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> >>  				 sizeof(struct zynqmp_ipi_message))
> >> +
> >> +#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
> >> +				 (uint32_t)'m' << 8 | (uint32_t)'p')
> >> +
> >>  /*
> >>   * settings for RPU cluster mode which
> >>   * reflects possible values of xlnx,cluster-mode dt-property
> >> @@ -73,6 +77,15 @@ struct mbox_info {
> >>  	struct mbox_chan *rx_chan;
> >>  };
> >>  
> >> +/* Xilinx Platform specific data structure */
> >> +struct rsc_tbl_data {
> >> +	const int version;
> >> +	const u32 magic_num;
> >> +	const u32 comp_magic_num;
> > 
> > Why is a complement magic number needed?
> 
> Actually magic number is 64-bit. There is good chance that
> firmware can have 32-bit op-code or data same as magic number, but very less
> chance of its complement in the next address. So, we can assume magic number
> is 64-bit. 
>

So why not having a magic number that is a u64?

> > 
> >> +	const u32 rsc_tbl_size;
> >> +	const uintptr_t rsc_tbl;
> >> +} __packed;
> >> +
> >>  /*
> >>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
> >>   * compatibility with device-tree that does not have TCM information.
> >> @@ -95,20 +108,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> >>  /**
> >>   * struct zynqmp_r5_core
> >>   *
> >> + * @rsc_tbl_va: resource table virtual address
> >>   * @dev: device of RPU instance
> >>   * @np: device node of RPU instance
> >>   * @tcm_bank_count: number TCM banks accessible to this RPU
> >>   * @tcm_banks: array of each TCM bank data
> >>   * @rproc: rproc handle
> >> + * @rsc_tbl_size: resource table size retrieved from remote
> >>   * @pm_domain_id: RPU CPU power domain id
> >>   * @ipi: pointer to mailbox information
> >>   */
> >>  struct zynqmp_r5_core {
> >> +	struct resource_table *rsc_tbl_va;
> > 
> > Shouldn't this be of type "void __iomem *"?  Did sparse give you trouble on that
> > one?
> 
> I fixed sparse warnings with typecast below [1].
> 

My point is, ioremap_wc() returns a "void__iomem *" so why not using that
instead of a "struct resource_table *"?


> > 
> >>  	struct device *dev;
> >>  	struct device_node *np;
> >>  	int tcm_bank_count;
> >>  	struct mem_bank_data **tcm_banks;
> >>  	struct rproc *rproc;
> >> +	u32 rsc_tbl_size;
> >>  	u32 pm_domain_id;
> >>  	struct mbox_info *ipi;
> >>  };
> >> @@ -621,10 +638,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	int ret;
> >>  
> >> -	ret = add_tcm_banks(rproc);
> >> -	if (ret) {
> >> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> >> -		return ret;
> >> +	/**
> > 
> > Using "/**" is for comments that will endup in the documentation, which I don't
> > think is needed here.  Please correct throughout the patch.
> 
> Thanks. Ack, I will use only /* format.
> 
> > 
> >> +	 * For attach/detach use case, Firmware is already loaded so
> >> +	 * TCM isn't really needed at all. Also, for security TCM can be
> >> +	 * locked in such case and linux may not have access at all.
> >> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
> >> +	 * callback.
> >> +	 */
> >> +	if (rproc->state != RPROC_DETACHED) {
> >> +		ret = add_tcm_banks(rproc);
> >> +		if (ret) {
> >> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> >> +			return ret;
> >> +		}
> >>  	}
> >>  
> >>  	ret = add_mem_regions_carveout(rproc);
> >> @@ -662,6 +688,123 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
> >>  	return 0;
> >>  }
> >>  
> >> +static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
> >> +							     size_t *size)
> >> +{
> >> +	struct zynqmp_r5_core *r5_core;
> >> +
> >> +	r5_core = rproc->priv;
> >> +
> >> +	*size = r5_core->rsc_tbl_size;
> >> +
> >> +	return r5_core->rsc_tbl_va;
> >> +}
> >> +
> >> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >> +{
> >> +	struct device *dev = r5_core->dev;
> >> +	struct rsc_tbl_data *rsc_data_va;
> >> +	struct resource_table *rsc_addr;
> >> +	struct resource res_mem;
> >> +	struct device_node *np;
> >> +	int ret;
> >> +
> >> +	/**
> >> +	 * It is expected from remote processor firmware to provide resource
> >> +	 * table address via struct rsc_tbl_data data structure.
> >> +	 * Start address of first entry under "memory-region" property list
> >> +	 * contains that data structure which holds resource table address, size
> >> +	 * and some magic number to validate correct resource table entry.
> >> +	 */
> >> +	np = of_parse_phandle(r5_core->np, "memory-region", 0);
> >> +	if (!np) {
> >> +		dev_err(dev, "failed to get memory region dev node\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	ret = of_address_to_resource(np, 0, &res_mem);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to get memory-region resource addr\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	rsc_data_va = (struct rsc_tbl_data *)devm_ioremap_wc(dev, res_mem.start,
> >> +							     sizeof(struct rsc_tbl_data));
> > 
> > There is no point in holding memory until the driver is unloaded.  Please use
> > ioremap_wc() and free at the end of the function.
> > 
> 
> Ack.
> 
> >> +	if (!rsc_data_va) {
> >> +		dev_err(dev, "failed to map resource table data address\n");
> >> +		return -EIO;
> >> +	}
> >> +
> >> +	/**
> >> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
> >> +	 * do not consider resource table address valid and don't attach
> >> +	 */
> >> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
> >> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
> >> +		dev_dbg(dev, "invalid magic number, won't attach\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	rsc_addr = (struct resource_table *)ioremap_wc(rsc_data_va->rsc_tbl,
> >> +						       rsc_data_va->rsc_tbl_size);
> 
> [1] Here typecast is done.
> 
> >> +	if (!rsc_addr) {
> >> +		dev_err(dev, "failed to get rsc_addr\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	/**
> >> +	 * As of now resource table version 1 is expected. Don't fail to attach
> >> +	 * but warn users about it.
> >> +	 */
> >> +	if (rsc_addr->ver != 1)
> >> +		dev_warn(dev, "unexpected resource table version %d\n",
> >> +			 rsc_addr->ver);
> >> +
> >> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
> >> +	r5_core->rsc_tbl_va = rsc_addr;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int zynqmp_r5_attach(struct rproc *rproc)
> >> +{
> >> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +	int i, pm_domain_id, ret;
> >> +
> >> +	/*
> >> +	 * Firmware is loaded in TCM. Request TCM power domains to notify
> >> +	 * platform management controller that TCM is in use. This will be
> >> +	 * released during unprepare callback.
> >> +	 */
> >> +	for (i = 0; i < r5_core->tcm_bank_count; i++) {
> >> +		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> >> +		ret = zynqmp_pm_request_node(pm_domain_id,
> >> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> >> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >> +		if (ret < 0)
> >> +			pr_warn("TCM %d can't be requested\n", i);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int zynqmp_r5_detach(struct rproc *rproc)
> >> +{
> >> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +
> >> +	/*
> >> +	 * Generate last notification to remote after clearing virtio flag.
> >> +	 * Remote can avoid polling on virtio reset flag if kick is generated
> >> +	 * during detach by host and check virtio reset flag on kick interrupt.
> >> +	 */
> >> +	zynqmp_r5_rproc_kick(rproc, 0);
> >> +
> >> +	iounmap((void __iomem *)r5_core->rsc_tbl_va);
> >> +	r5_core->rsc_tbl_va = NULL;
> > 
> > This is puzzling...  What happens to ->tsc_tbl_va when the remote processor is
> > re-attached? 
> 
> Actually I don't see re-attach in life cycle. I might be missing something.
> Following is lifecycle I have tested:
> 
> 1) During driver probe, if resource table is found in memory, then state is
>    moved to detach.

Right.

> 2) Then user executes echo start > remoteproc* command, and state moved to attach.

Right.

> 3) After work is done with remote, user executes echo stop > remoteproc* command,
>    and state is moved to offline.
> 

Right.  But you have an ops::detach() function, which means you expect users to
be able to detach() and re-attach() as many times as they want.

> From here, remote is offline state, and I can't re-attach to it without loading
> firmware again. which is regular start/stop states. Please let me know if I am missing
> something.
> 
> From here, load firmware, and executing echo start > remoteproc* moves
> rproc state to running. Load firmware loads resource table from elf.
> 
> So, I believe attach is happening only during probe. And then, once r5 stops, user
> needs to load firmware and start R5. I think this use case is good for now.
>

If you don't want people to detach() and re-attach(), remove ops::detach()
entirely.  But if you go this way it is only a matter of time before
someone asks for the feature or provide a fix for it.

> > 
> > I will not look at the SRAM part.  Please re-submit when we are done with the
> > attach/detach feature.
> > 
> 
> Okay sounds good to me.
> Reviews are still welcomed if anyone in the community decides to review it.
> 
> Thanks,
> Tanmay
>  > Thanks,
> > Mathieu
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>  	.prepare	= zynqmp_r5_rproc_prepare,
> >>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> >> @@ -673,6 +816,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>  	.sanity_check	= rproc_elf_sanity_check,
> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >>  	.kick		= zynqmp_r5_rproc_kick,
> >> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
> >> +	.attach		= zynqmp_r5_attach,
> >> +	.detach		= zynqmp_r5_detach,
> >>  };
> >>  
> >>  /**
> >> @@ -723,6 +869,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  		goto free_rproc;
> >>  	}
> >>  
> >> +	/*
> >> +	 * Move rproc state to DETACHED to give one time opportunity to attach
> >> +	 * if firmware is already available in the memory. This can happen if
> >> +	 * firmware is loaded via debugger or by any other agent in the system.
> >> +	 * If firmware isn't available in the memory and resource table isn't found,
> >> +	 * then rproc state stay OFFLINE.
> >> +	 */
> >> +	if (!zynqmp_r5_get_rsc_table_va(r5_core))
> >> +		r5_rproc->state = RPROC_DETACHED;
> >> +
> >>  	r5_core->rproc = r5_rproc;
> >>  	return r5_core;
> >>  
> >> -- 
> >> 2.25.1
> >> 
> 
