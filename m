Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53922EF5
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 17:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716314204; cv=none; b=QKj1PZ3mCb3DtkgRmJ7Qq0HGBloYtn2mxGvz7IJFaFA17VvNEM/cYQst6xxPcXY5qYZ9BxkfDo35Zv4zgPZun6Zf6MbCwdG1XMtGYSTO/IGdYkXDPAN0OSZ3e83fTzPw7fRnBMbVjqNlMb05EZba7WhZx2no/N3w25pPQwVKanw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716314204; c=relaxed/simple;
	bh=bDHcmbpIp0r0FWpkiKnjDUI8tY8MBvJykebIsqf3NAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2fAfAhq21WRzXXOwuFiEZsnWhdyLBoIQib4LPrSmVJdUDaSs33MulQUilavRRllVdVh0D17C0AQAz2gHDVcDbUGDxf0FPvB8lXuj25x8URC2X48ozSKQlDsCEza9llztKCHV57ukWq63YAxh4AR9EQqTI9wOeV9VEphOa+J+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XBtP+RAI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XBtP+RAI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f4472561f1so719442b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716314201; x=1716919001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/0tLDG/7KmzSkl24NrS9rk2GSTb3gpnCYP3/DHpRdA=;
        b=XBtP+RAIcdmgwvg+hYHylmaFlnZfu2qmS6+ruUqc/hqcK5ilS/xp976ydzTtaw+7Kb
         vupnMTMRHJK9GY63gmiIYGSqqHjwqCdQqx6wMd519Nyfr4D1lkPNV56Fs3SfFYjLrt8r
         WdiUS9r/BhsEA+GBIFpvXzXZlP+XDsmeDlPvS4xJj6EgR+p9qy35Ks47ZGFMsXvNijMj
         37OVq05QUS3PiGKtozzD3nWZ5VpblfCV0mGXmrgnBR73izUZJZo5sqViroSpYfGeJVle
         tz3ar3oB3IMXfJqP6ffUfe3Brh/GS21CxcvDaDHXyCs3q37EvWIqPPac8m1HjMX3zwOu
         EFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716314201; x=1716919001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/0tLDG/7KmzSkl24NrS9rk2GSTb3gpnCYP3/DHpRdA=;
        b=w58Sbjok0YsN7Y2oxdP3/wjHSztjgors8ZDNn+bUNB9+ksRVDnwhkooQHXn4UAlOrS
         Nx5hmwjJUwtnEoOboKHwWzIXAzxvmLSRU8uzUAoRVT6zpHil9wtmcSevKAFoOJvNdH/s
         74lo0MwkKa+zOguXAQiUIifjiPcGoj5r0iEsft9bEtvK64ZOWDFvTBMFiG1conENIVcR
         kfKAfdGLoiku3aEwzh0fl7KUdY4QOOiiCpYeQtk5lKaK+YAZo6fBxtnJ9UrCanSHRXxg
         sJnaBsIOoTHqgecZ2Gv01IPcfo0eXsvGmE1ZAEwViUO3fHcnnfWlx0og0Bj8O+XQZR7T
         XxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlsNIdQCtr7F+2UjJANKL6Wdr8F14N1zC8JG7Jvq9yylzwsgGX4ZrU8B6ycxaZL6ihgGyU6SmHCLUEBMgbeZUXhgDOTUbP1cFRecBSi8Y4rA==
X-Gm-Message-State: AOJu0YwBPYR6fy8w9BHm+B58xJ9VVh4COG0Pz9WM3X3WFdAimtAg6/FB
	UzOsk25bWBqNBrOUJaNvz9JL8UdudEUh8Ri/+Y9j0vpOSQBwuc0Hp13+tYiYXCI=
X-Google-Smtp-Source: AGHT+IEknBswCPs65C6IpOvr2vy7Fw9UnethBJrMAwXqSIUGQaX2rnjHowINfpqRZKZXnW3qSmhJNw==
X-Received: by 2002:a17:902:e80b:b0:1f3:618:4624 with SMTP id d9443c01a7336-1f306184973mr70267365ad.49.1716314201490;
        Tue, 21 May 2024 10:56:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:df1a:22de:40b2:f110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad819csm224586005ad.84.2024.05.21.10.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:56:41 -0700 (PDT)
Date: Tue, 21 May 2024 11:56:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drivers: remoteproc: xlnx: add attach detach
 support
Message-ID: <ZkzgVn4+iTcrLEDT@p14s>
References: <20240511005126.1240430-1-tanmay.shah@amd.com>
 <20240511005126.1240430-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511005126.1240430-2-tanmay.shah@amd.com>

Hi Tanmay,

On Fri, May 10, 2024 at 05:51:25PM -0700, Tanmay Shah wrote:
> It is possible that remote processor is already running before
> linux boot or remoteproc platform driver probe. Implement required
> remoteproc framework ops to provide resource table address and
> connect or disconnect with remote processor in such case.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v2:
>   - Fix following sparse warnings
> 
> drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:    expected struct rsc_tbl_data *rsc_data_va
> drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:    expected struct resource_table *rsc_addr
> drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:    expected void volatile [noderef] __iomem *addr
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 164 +++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 84243d1dff9f..039370cffa32 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -25,6 +25,10 @@
>  /* RX mailbox client buffer max length */
>  #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
>  				 sizeof(struct zynqmp_ipi_message))
> +
> +#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
> +				 (uint32_t)'m' << 8 | (uint32_t)'p')
> +
>  /*
>   * settings for RPU cluster mode which
>   * reflects possible values of xlnx,cluster-mode dt-property
> @@ -73,6 +77,15 @@ struct mbox_info {
>  	struct mbox_chan *rx_chan;
>  };
>  
> +/* Xilinx Platform specific data structure */
> +struct rsc_tbl_data {
> +	const int version;
> +	const u32 magic_num;
> +	const u32 comp_magic_num;

Why is a complement magic number needed?

> +	const u32 rsc_tbl_size;
> +	const uintptr_t rsc_tbl;
> +} __packed;
> +
>  /*
>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>   * compatibility with device-tree that does not have TCM information.
> @@ -95,20 +108,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>  /**
>   * struct zynqmp_r5_core
>   *
> + * @rsc_tbl_va: resource table virtual address
>   * @dev: device of RPU instance
>   * @np: device node of RPU instance
>   * @tcm_bank_count: number TCM banks accessible to this RPU
>   * @tcm_banks: array of each TCM bank data
>   * @rproc: rproc handle
> + * @rsc_tbl_size: resource table size retrieved from remote
>   * @pm_domain_id: RPU CPU power domain id
>   * @ipi: pointer to mailbox information
>   */
>  struct zynqmp_r5_core {
> +	struct resource_table *rsc_tbl_va;

Shouldn't this be of type "void __iomem *"?  Did sparse give you trouble on that
one?

>  	struct device *dev;
>  	struct device_node *np;
>  	int tcm_bank_count;
>  	struct mem_bank_data **tcm_banks;
>  	struct rproc *rproc;
> +	u32 rsc_tbl_size;
>  	u32 pm_domain_id;
>  	struct mbox_info *ipi;
>  };
> @@ -621,10 +638,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>  {
>  	int ret;
>  
> -	ret = add_tcm_banks(rproc);
> -	if (ret) {
> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> -		return ret;
> +	/**

Using "/**" is for comments that will endup in the documentation, which I don't
think is needed here.  Please correct throughout the patch.

> +	 * For attach/detach use case, Firmware is already loaded so
> +	 * TCM isn't really needed at all. Also, for security TCM can be
> +	 * locked in such case and linux may not have access at all.
> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
> +	 * callback.
> +	 */
> +	if (rproc->state != RPROC_DETACHED) {
> +		ret = add_tcm_banks(rproc);
> +		if (ret) {
> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	ret = add_mem_regions_carveout(rproc);
> @@ -662,6 +688,123 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
> +							     size_t *size)
> +{
> +	struct zynqmp_r5_core *r5_core;
> +
> +	r5_core = rproc->priv;
> +
> +	*size = r5_core->rsc_tbl_size;
> +
> +	return r5_core->rsc_tbl_va;
> +}
> +
> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> +{
> +	struct device *dev = r5_core->dev;
> +	struct rsc_tbl_data *rsc_data_va;
> +	struct resource_table *rsc_addr;
> +	struct resource res_mem;
> +	struct device_node *np;
> +	int ret;
> +
> +	/**
> +	 * It is expected from remote processor firmware to provide resource
> +	 * table address via struct rsc_tbl_data data structure.
> +	 * Start address of first entry under "memory-region" property list
> +	 * contains that data structure which holds resource table address, size
> +	 * and some magic number to validate correct resource table entry.
> +	 */
> +	np = of_parse_phandle(r5_core->np, "memory-region", 0);
> +	if (!np) {
> +		dev_err(dev, "failed to get memory region dev node\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_address_to_resource(np, 0, &res_mem);
> +	if (ret) {
> +		dev_err(dev, "failed to get memory-region resource addr\n");
> +		return -EINVAL;
> +	}
> +
> +	rsc_data_va = (struct rsc_tbl_data *)devm_ioremap_wc(dev, res_mem.start,
> +							     sizeof(struct rsc_tbl_data));

There is no point in holding memory until the driver is unloaded.  Please use
ioremap_wc() and free at the end of the function.

> +	if (!rsc_data_va) {
> +		dev_err(dev, "failed to map resource table data address\n");
> +		return -EIO;
> +	}
> +
> +	/**
> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
> +	 * do not consider resource table address valid and don't attach
> +	 */
> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
> +		dev_dbg(dev, "invalid magic number, won't attach\n");
> +		return -EINVAL;
> +	}
> +
> +	rsc_addr = (struct resource_table *)ioremap_wc(rsc_data_va->rsc_tbl,
> +						       rsc_data_va->rsc_tbl_size);
> +	if (!rsc_addr) {
> +		dev_err(dev, "failed to get rsc_addr\n");
> +		return -EINVAL;
> +	}
> +
> +	/**
> +	 * As of now resource table version 1 is expected. Don't fail to attach
> +	 * but warn users about it.
> +	 */
> +	if (rsc_addr->ver != 1)
> +		dev_warn(dev, "unexpected resource table version %d\n",
> +			 rsc_addr->ver);
> +
> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
> +	r5_core->rsc_tbl_va = rsc_addr;
> +
> +	return 0;
> +}
> +
> +static int zynqmp_r5_attach(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	int i, pm_domain_id, ret;
> +
> +	/*
> +	 * Firmware is loaded in TCM. Request TCM power domains to notify
> +	 * platform management controller that TCM is in use. This will be
> +	 * released during unprepare callback.
> +	 */
> +	for (i = 0; i < r5_core->tcm_bank_count; i++) {
> +		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> +		ret = zynqmp_pm_request_node(pm_domain_id,
> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +		if (ret < 0)
> +			pr_warn("TCM %d can't be requested\n", i);
> +	}
> +
> +	return 0;
> +}
> +
> +static int zynqmp_r5_detach(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +
> +	/*
> +	 * Generate last notification to remote after clearing virtio flag.
> +	 * Remote can avoid polling on virtio reset flag if kick is generated
> +	 * during detach by host and check virtio reset flag on kick interrupt.
> +	 */
> +	zynqmp_r5_rproc_kick(rproc, 0);
> +
> +	iounmap((void __iomem *)r5_core->rsc_tbl_va);
> +	r5_core->rsc_tbl_va = NULL;

This is puzzling...  What happens to ->tsc_tbl_va when the remote processor is
re-attached?  

I will not look at the SRAM part.  Please re-submit when we are done with the
attach/detach feature.

Thanks,
Mathieu

> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> @@ -673,6 +816,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  	.kick		= zynqmp_r5_rproc_kick,
> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
> +	.attach		= zynqmp_r5_attach,
> +	.detach		= zynqmp_r5_detach,
>  };
>  
>  /**
> @@ -723,6 +869,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> +	/*
> +	 * Move rproc state to DETACHED to give one time opportunity to attach
> +	 * if firmware is already available in the memory. This can happen if
> +	 * firmware is loaded via debugger or by any other agent in the system.
> +	 * If firmware isn't available in the memory and resource table isn't found,
> +	 * then rproc state stay OFFLINE.
> +	 */
> +	if (!zynqmp_r5_get_rsc_table_va(r5_core))
> +		r5_rproc->state = RPROC_DETACHED;
> +
>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> -- 
> 2.25.1
> 
