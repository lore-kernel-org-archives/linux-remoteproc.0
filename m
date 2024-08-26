Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0181946B0
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2024 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689369; cv=none; b=C6lTTPVD9DOrNWy9q7EGoavK4XM8FCz4ErFbcDADwz89gMxg9lh+N0aaV+5bybwulldILLkVnzYwIyL+YZoKccj3Ysi9pOAyvOl2e9Eeu4SJpRPWqSnlg1x64Msyc2HXnf/RhkRgf5F2jq0wpofosCO2uTUYB6Y2NPnjWcnxwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689369; c=relaxed/simple;
	bh=n17DFLWyl3CSI/X+WLKk0icF5uEAcJUa1ajvrl1pPoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feQ9MAKW6QWj3DkUw1aqLmpJV/6BOR6IwicMC32f6ZfiD7RvGemSUlQ8gSa/jLe9/yUcjdMxIqtda4+44eXQVY9Zlvl9rvSrDDkYifZ5rCw/EW8UC3oHMqNcjMkUbKRtriZZwXe0bOJWlHt0Y1VC7nZGVdkcNDbcFinjPZsJwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JfijHjDr; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JfijHjDr"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39d20c4be2eso17393825ab.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2024 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724689367; x=1725294167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ5wZ/vKWIbDs4M6ax+M16y6/0zt2H1gMgY/mimetxo=;
        b=JfijHjDrD0t/bvnMJ1RTxXs0B4QKE+pXJ3i2BRrqHXmiItv2q7wIevAu002fz58tmW
         TKF0V+bDuDSYeyZzoFlZArhi16FqGCnJYuGZmMUCorTbMQY5zmnqREvSoVuxbAzBsePP
         lA3CVrjxwG+XnBUQPAIhtV6RooVbBOJN/dY3KcLnKqUEDZdrxC6I2UYSoszHMUXXofEp
         MlCXZ431hFlep8DGhQlUYyLL2BULqwusOEaXNdgPqeZt5KtbjSMr6P7hbvTe/hiWtF4L
         CQi8UlYhaLQK2LaHKv9JPLPHJ90Rc4Qwea1RIuBgGTSqdO7T8o+cBuVvfYanrp7g8QUN
         EMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724689367; x=1725294167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ5wZ/vKWIbDs4M6ax+M16y6/0zt2H1gMgY/mimetxo=;
        b=p33lablk1G9y+D4QeyqyYSH+JApo73jULv1ggob35JJWaV8Mu+AwoXkbjQ0mfxktWN
         hm3/6Chzzm9saeGZ5ItwKEKEQd9FVhd89M9i0Z04AeEjgVFoOmOHDzE0hB6hzeL7tfp8
         X5d9pFGBw8TaXkcang3pHgbTqGhjqiicFeJJv0H9wMuOaBZwkgTVkpJO4+6kdjRap7HL
         s3B9Wan4+DbCQNzFjLdk1CIog3NE7wymPfXJFFf/NJpMRHAynWDOv7NyDbC4YzftLMVm
         8qqdADT58qk0M7vl01yjnk0oxCFuOPbCLAkdQwZ5Tn2jAQ5wioypNWm7YdLhO9t140lo
         Gteg==
X-Forwarded-Encrypted: i=1; AJvYcCW8LpdVGQDkTBHrMF9NxT9dmJmvA5bKa2dAQFsCVikgyLYrjv4OmWnKMCtjTMB4+OWRj+XLeI94F7jiSDwd8ce2@vger.kernel.org
X-Gm-Message-State: AOJu0YyM2zDS3a74mQZNEsSrOA99JfS3w06uYzJT0dBQ/a+7n7xaQeeA
	wh4Sw5ds5GM91KktXmU7L/mlQTmjxSeDIa2Obn14mLxXRmkmEL4KyTAHSz33cbdUVMR6cnBQSCQ
	Z
X-Google-Smtp-Source: AGHT+IFI3P8hGX0KfCf1HPUh36zOUQ9yWsLm6yuGu+xiFXneZ7zWnTsUEV3fUbMh6Xcdf6Ks6WUa7A==
X-Received: by 2002:a05:6e02:1905:b0:398:f487:5a04 with SMTP id e9e14a558f8ab-39e3c985372mr129550985ab.11.1724689367061;
        Mon, 26 Aug 2024 09:22:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:841:3fb0:c1d:cf23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad5529csm7634145a12.68.2024.08.26.09.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:22:46 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:22:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] remoteproc: xlnx: add sram support
Message-ID: <Zsyr0+za1Wy1BjI2@p14s>
References: <20240819170937.3666806-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819170937.3666806-1-tanmay.shah@amd.com>

Good morning,

First and foremost the overall structure of your code has improved immensely and
I commend you for that.

On Mon, Aug 19, 2024 at 10:09:38AM -0700, Tanmay Shah wrote:
> AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
> R5 cores can access OCM and access is faster than DDR memory but slower
> than TCM memories available. Sram region can have optional multiple
> power-domains. Platform management firmware is responsible
> to operate these power-domains.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v4:
>   - Free previously allocalted genpool if adding carveouts fail for any
>     sram.
>   - add comment about sram size used in creating carveouts.
> 
> Changes in v3:
>   - make @sram an array rather than an array of pointers
>   - fix of_node_put usage to maintain proper refcount of node
>   - s/proprty/property
>   - Use gen pool framework for mapping sram address space.
> 
> Changes in v2:
>   - Expand commit message with power-domains related information.
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 165 ++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 2cea97c746fd..6d2ac7b85c8a 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/genalloc.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/mailbox/zynqmp-ipi-message.h>
> @@ -56,6 +57,21 @@ struct mem_bank_data {
>  	char *bank_name;
>  };
>  
> +/**
> + * struct zynqmp_sram_bank - sram bank description
> + *
> + * @sram_pool: gen pool for his sram
> + * @sram_res: sram address region information
> + * @va: virtual address of allocated genpool
> + * @da: device address of sram
> + */
> +struct zynqmp_sram_bank {
> +	struct gen_pool *sram_pool;
> +	struct resource sram_res;
> +	void __iomem *va;
> +	u32 da;
> +};
> +
>  /**
>   * struct mbox_info
>   *
> @@ -120,6 +136,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * struct zynqmp_r5_core
>   *
>   * @rsc_tbl_va: resource table virtual address
> + * @sram: Array of sram memories assigned to this core
> + * @num_sram: number of sram for this core
>   * @dev: device of RPU instance
>   * @np: device node of RPU instance
>   * @tcm_bank_count: number TCM banks accessible to this RPU
> @@ -131,6 +149,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   */
>  struct zynqmp_r5_core {
>  	void __iomem *rsc_tbl_va;
> +	struct zynqmp_sram_bank *sram;
> +	int num_sram;
>  	struct device *dev;
>  	struct device_node *np;
>  	int tcm_bank_count;
> @@ -494,6 +514,56 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int add_sram_carveouts(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct rproc_mem_entry *rproc_mem;
> +	struct zynqmp_sram_bank *sram;
> +	size_t len, pool_size;
> +	dma_addr_t dma_addr;
> +	int da, i;
> +
> +	for (i = 0; i < r5_core->num_sram; i++) {
> +		sram = &r5_core->sram[i];
> +
> +		dma_addr = (dma_addr_t)sram->sram_res.start;
> +
> +		/* Use actual resource size, as genpool size can be rounded up */
> +		len = resource_size(&sram->sram_res);
> +		da = sram->da;
> +
> +		pool_size = gen_pool_size(sram[i].sram_pool);
> +		sram->va = (void __iomem *)gen_pool_alloc(sram->sram_pool, pool_size);

The genpool subsystem API is used to allocate the genpool but other than
being free'd int zynqmp_r5_rproc_unprepare(), nothing is done with the genpool.
Do you have plans to change that in an upcoming patchset?  If not please remove.

Thanks,
Mathieu

> +		if (!sram->va) {
> +			dev_err(r5_core->dev, "failed to alloc sram idx %d pool\n", i);
> +			goto fail_add_sram_carveouts;
> +		}
> +
> +		rproc_mem = rproc_mem_entry_init(&rproc->dev, sram->va,
> +						 (dma_addr_t)dma_addr,
> +						 len, da,
> +						 NULL, NULL,
> +						 sram->sram_res.name);
> +
> +		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, da, len);
> +
> +		dev_dbg(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
> +			sram->sram_res.name, dma_addr, da, len);
> +	}
> +
> +	return 0;
> +
> +fail_add_sram_carveouts:
> +	while (--i > 0) {
> +		pool_size = gen_pool_size(sram[i].sram_pool);
> +		gen_pool_free(sram[i].sram_pool,
> +			      (unsigned long)r5_core->sram[i].va, pool_size);
> +	}
> +
> +	return -ENOMEM;
> +}
> +
>  /*
>   * tcm_mem_unmap()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -669,6 +739,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	ret = add_sram_carveouts(rproc);
> +	if (ret) {
> +		dev_err(&rproc->dev, "failed to get sram carveout %d\n", ret);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -695,6 +771,12 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>  				 "can't turn off TCM bank 0x%x", pm_domain_id);
>  	}
>  
> +	for (i = 0; i < r5_core->num_sram; i++) {
> +		gen_pool_free(r5_core->sram[i].sram_pool,
> +			      (unsigned long)r5_core->sram[i].va,
> +			      gen_pool_size(r5_core->sram[i].sram_pool));
> +	}
> +
>  	return 0;
>  }
>  
> @@ -881,6 +963,85 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	return ERR_PTR(ret);
>  }
>  
> +static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
> +{
> +	struct device_node *np = r5_core->np;
> +	struct device *dev = r5_core->dev;
> +	struct zynqmp_sram_bank *sram;
> +	struct device_node *sram_np;
> +	int num_sram, i, ret;
> +	u64 abs_addr, size;
> +
> +	/* "sram" is optional property. Do not fail, if unavailable. */
> +	if (!of_property_present(r5_core->np, "sram"))
> +		return 0;
> +
> +	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
> +	if (num_sram <= 0) {
> +		dev_err(dev, "Invalid sram property, ret = %d\n",
> +			num_sram);
> +		return -EINVAL;
> +	}
> +
> +	sram = devm_kcalloc(dev, num_sram,
> +			    sizeof(struct zynqmp_sram_bank), GFP_KERNEL);
> +	if (!sram)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_sram; i++) {
> +		sram_np = of_parse_phandle(np, "sram", i);
> +		if (!sram_np) {
> +			dev_err(dev, "failed to get sram %d phandle\n", i);
> +			ret = -EINVAL;
> +			goto fail_sram_get;
> +		}
> +
> +		if (!of_device_is_available(sram_np)) {
> +			dev_err(dev, "sram device not available\n");
> +			ret = -EINVAL;
> +			goto fail_sram_get;
> +		}
> +
> +		ret = of_address_to_resource(sram_np, 0, &sram[i].sram_res);
> +		if (ret) {
> +			dev_err(dev, "addr to res failed\n");
> +			goto fail_sram_get;
> +		}
> +
> +		sram[i].sram_pool = of_gen_pool_get(np, "sram", i);
> +		if (!sram[i].sram_pool) {
> +			dev_err(dev, "failed to get sram idx %d gen pool\n", i);
> +			ret = -ENOMEM;
> +			goto fail_sram_get;
> +		}
> +
> +		/* Get SRAM device address */
> +		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
> +		if (ret) {
> +			dev_err(dev, "failed to get reg property\n");
> +			goto fail_sram_get;
> +		}
> +
> +		sram[i].da = (u32)abs_addr;
> +
> +		of_node_put(sram_np);
> +
> +		dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx\n",
> +			i, sram[i].sram_res.name, sram[i].sram_res.start,
> +			sram[i].da, resource_size(&sram[i].sram_res));
> +	}
> +
> +	r5_core->sram = sram;
> +	r5_core->num_sram = num_sram;
> +
> +	return 0;
> +
> +fail_sram_get:
> +	of_node_put(sram_np);
> +
> +	return ret;
> +}
> +
>  static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
>  {
>  	int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
> @@ -1095,6 +1256,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  				return ret;
>  			}
>  		}
> +
> +		ret = zynqmp_r5_get_sram_banks(r5_core);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return 0;
> 
> base-commit: 1a491aaf1d1ce3a1cf5190394c36f21d805c7e96
> -- 
> 2.25.1
> 
