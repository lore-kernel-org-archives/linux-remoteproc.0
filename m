Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C4BE4A
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Jun 2024 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515298; cv=none; b=ojyHyuVkk5JS1laA9mAIjtlokR5YPz29Xzy13Uv9y32nUOHMIxyP2/esnFuS0hXEdPQQyNlg8QMdILksmm0qk4Ty+9nn2C9wLS27zQwZ2vwv6MhJV2zrOHVwnGeyme9B1652+9PqqGbWwuRjhZi/HtQgKFQvjUrZuDE1x7s1Zo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515298; c=relaxed/simple;
	bh=s6HeRUn8hNcotHmVGrszDsEOL+nkCHLSqD5p3msLcl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XG5KW9uq4i4C/AuWSJih29sSJBrSNvMzgTDNWjEbKzHu/jdirjp8/WVE1lqnaEb5eZrHNq4VuswYmSzSaW3apF6VGzYezv44kJhwzG/DsP6U9V61ubbpZ7lPhYjMnJPeYGtc2v5OGkr2bcucww0FJaA/lOMRvY2iy4sd8oihXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxD5iLyG; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxD5iLyG"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3888031a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Jun 2024 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717515296; x=1718120096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrLRq9xE0IdvvQ2UMhxPgmfsaQVQkAduH2f3xIBTdIg=;
        b=kxD5iLyGXLLsrM/caesR2fAIzIawZD5Cj5Tz/7YZMJMSkkRhe1Xq+1gtR0V5eVe5Iq
         +SGxwc+hnQFW/UvTLkE16BhIuDzQKeSS3YPmavzSF6YflRGbcBNntOYta4nEp5F1imWE
         OZ+QFLDY+gsVSKHV8G6Oi9xM0QV5L6YXUztuvys0gJHsjulzw3H/KkxchK0s+0g5aTGO
         dWrnIh3IiGlwmivqFiI3n2ldZ6X570zFDiJnzwZDmT0MXFexxOdDwnm8mIUODOE29KRX
         G3oXArMIXzzwOV8MhUNe6hFoxbw9gOcqEdrpjXVpMtO2/2TBDxeHf1UZVhUIztjqysxO
         +IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717515296; x=1718120096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrLRq9xE0IdvvQ2UMhxPgmfsaQVQkAduH2f3xIBTdIg=;
        b=j/fQuVzeOVGN9fqZyg3c2XwO9hGpEZoZvfQdan39lCKxAeOMsuyYWXYZ7jWiPZv9c7
         Iow++0OUtNRgoO9C0D7CVSzFknY3lGtNm1sSROArkEEfu6TIV9jcFdGZDaRL7cODi6uU
         aOea25n5NIYyUDMPfdBXiIM21Iy6LL+RYwx4d9R5KI3HbSJZnhrL3/JHRZyvkQxoECTK
         vr6EXbiXJi9ifiDwrPlT7L/lHv4mZPomiOujY7kAmvzth8wwzAnwEpe7TzjJgebGjR2c
         q6lB5W621o8VE1IKd1+fxbm+E+5NxDaCae+9+Js7im/Nbkn9v2U9U7PrUHg+zkhauT2S
         hliw==
X-Forwarded-Encrypted: i=1; AJvYcCVup/o19Z1NbwB3XbIZL5JUhMy9R3E1H8VysAqVgqMwZmAXClKcrpgFwy7YQt+FKJo4iMLPHrFOkzJOaxa+VGIg0Ju2JhSyI3V8aHarQky4VA==
X-Gm-Message-State: AOJu0YxGkW0WlkIZ/wHEXGD4RWXLC1oAPqyIHa3VIlD0dYr9DTkOqv2J
	tJwlZmg/HzWAvQxSZcsY/vFyqp50wnp6owh2hIjMjm5R5HXf63RFfQQBPzXX3bbl2bxOHRwt4DH
	H
X-Google-Smtp-Source: AGHT+IEE3cjoFQR5bNMLw6uv/KUWrW0bmqvm3EKhtm4Alb3DSlK/WSCVIyNqdxP9udZIIpm3IgGFCg==
X-Received: by 2002:a05:6a21:3385:b0:1a7:aabc:24ae with SMTP id adf61e73a8af0-1b26f138dfdmr12637503637.18.1717515295829;
        Tue, 04 Jun 2024 08:34:55 -0700 (PDT)
Received: from p14s ([199.212.41.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70245aa1982sm6843540b3a.163.2024.06.04.08.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 08:34:55 -0700 (PDT)
Date: Tue, 4 Jun 2024 09:34:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drivers: remoteproc: xlnx: add attach detach support
Message-ID: <Zl80Hanwo5siD6CG@p14s>
References: <20240603203437.973009-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603203437.973009-1-tanmay.shah@amd.com>

Hi Tanmay,

On Mon, Jun 03, 2024 at 01:34:38PM -0700, Tanmay Shah wrote:
> It is possible that remote processor is already running before
> linux boot or remoteproc platform driver probe. Implement required
> remoteproc framework ops to provide resource table address and
> connect or disconnect with remote processor in such case.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> 
> ---
> Changes in v4:
>   - Move change log out of commit text
> 
> Changes in v3:
> 
>   - Drop SRAM patch from the series
>   - Change type from "struct resource_table *" to void __iomem *
>   - Change comment format from /** to /*
>   - Remove unmap of resource table va address during detach, allowing
>     attach-detach-reattach use case.
>   - Unmap rsc_data_va after retrieving resource table data structure.
>   - Unmap resource table va during driver remove op
> 
> Changes in v2:
> 
>   - Fix typecast warnings reported using sparse tool.
>   - Fix following sparse warnings:
> 
> drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse: warning: incorrect type in assignment (different address spaces)
> drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse: warning: incorrect type in assignment (different address spaces)
> drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse: warning: incorrect type in argument 1 (different address spaces)
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 173 +++++++++++++++++++++++-
>  1 file changed, 169 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 84243d1dff9f..6898d4761566 100644
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
> @@ -73,6 +77,26 @@ struct mbox_info {
>  	struct mbox_chan *rx_chan;
>  };
>  
> +/**
> + * struct rsc_tbl_data
> + *
> + * Platform specific data structure used to sync resource table address.
> + * It's important to maintain order and size of each field on remote side.
> + *
> + * @version: version of data structure
> + * @magic_num: 32-bit magic number.
> + * @comp_magic_num: complement of above magic number
> + * @rsc_tbl_size: resource table size
> + * @rsc_tbl: resource table address
> + */
> +struct rsc_tbl_data {
> +	const int version;
> +	const u32 magic_num;
> +	const u32 comp_magic_num;

I thought we agreed on making the magic number a u64 - did I get this wrong?

> +	const u32 rsc_tbl_size;
> +	const uintptr_t rsc_tbl;
> +} __packed;
> +
>  /*
>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>   * compatibility with device-tree that does not have TCM information.
> @@ -95,20 +119,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
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
> +	void __iomem *rsc_tbl_va;
>  	struct device *dev;
>  	struct device_node *np;
>  	int tcm_bank_count;
>  	struct mem_bank_data **tcm_banks;
>  	struct rproc *rproc;
> +	u32 rsc_tbl_size;
>  	u32 pm_domain_id;
>  	struct mbox_info *ipi;
>  };
> @@ -621,10 +649,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>  {
>  	int ret;
>  
> -	ret = add_tcm_banks(rproc);
> -	if (ret) {
> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> -		return ret;
> +	/*
> +	 * For attach/detach use case, Firmware is already loaded so
> +	 * TCM isn't really needed at all. Also, for security TCM can be
> +	 * locked in such case and linux may not have access at all.
> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
> +	 * callback.
> +	 */
> +	if (rproc->state != RPROC_DETACHED) {

        if (rproc->state == RPROC_DETACHED)
                return 0;

        ret = add_tcm_banks(rproc);
        if (ret) {
                dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
                return ret;
	}

> +		ret = add_tcm_banks(rproc);
> +		if (ret) {
> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	ret = add_mem_regions_carveout(rproc);
> @@ -662,6 +699,120 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
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
> +	return (struct resource_table *)r5_core->rsc_tbl_va;
> +}
> +
> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> +{
> +	struct resource_table *rsc_tbl_addr;
> +	struct device *dev = r5_core->dev;
> +	struct rsc_tbl_data *rsc_data_va;
> +	struct resource res_mem;
> +	struct device_node *np;
> +	int ret;
> +
> +	/*
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
> +	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
> +							sizeof(struct rsc_tbl_data));
> +	if (!rsc_data_va) {
> +		dev_err(dev, "failed to map resource table data address\n");
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
> +	 * do not consider resource table address valid and don't attach
> +	 */
> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
> +		dev_dbg(dev, "invalid magic number, won't attach\n");
> +		return -EINVAL;
> +	}
> +
> +	r5_core->rsc_tbl_va = ioremap_wc(rsc_data_va->rsc_tbl,
> +					 rsc_data_va->rsc_tbl_size);
> +	if (!r5_core->rsc_tbl_va) {
> +		dev_err(dev, "failed to get resource table va\n");
> +		return -EINVAL;
> +	}
> +
> +	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
> +
> +	/*
> +	 * As of now resource table version 1 is expected. Don't fail to attach
> +	 * but warn users about it.
> +	 */
> +	if (rsc_tbl_addr->ver != 1)
> +		dev_warn(dev, "unexpected resource table version %d\n",
> +			 rsc_tbl_addr->ver);
> +
> +	iounmap((void __iomem *)rsc_data_va);
> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
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
> +	/*
> +	 * Generate last notification to remote after clearing virtio flag.
> +	 * Remote can avoid polling on virtio reset flag if kick is generated
> +	 * during detach by host and check virtio reset flag on kick interrupt.
> +	 */
> +	zynqmp_r5_rproc_kick(rproc, 0);
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> @@ -673,6 +824,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  	.kick		= zynqmp_r5_rproc_kick,
> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
> +	.attach		= zynqmp_r5_attach,
> +	.detach		= zynqmp_r5_detach,
>  };
>  
>  /**
> @@ -723,6 +877,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> +	/*
> +	 * Move rproc state to DETACHED to give one time opportunity to attach


"one time opportunity" ?

Other than the above this patch is sound.  That said I reviewed your work from
the airport, which is not optimal.  We'll what turns up with the next revision.

Thanks, Mathieu

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
> @@ -1134,6 +1298,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>  	for (i = 0; i < cluster->core_count; i++) {
>  		r5_core = cluster->r5_cores[i];
>  		zynqmp_r5_free_mbox(r5_core->ipi);
> +		iounmap(r5_core->rsc_tbl_va);
>  		of_reserved_mem_device_release(r5_core->dev);
>  		put_device(r5_core->dev);
>  		rproc_del(r5_core->rproc);
> 
> base-commit: d7faf9a16886a748c9dd4063ea897f1e68b412f2
> -- 
> 2.37.6
> 
