Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4539D6E619
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Sep 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466876; cv=none; b=lXmHFrbjtx44pK5fzndYBW45Ge753ZZ7Lpm7EwQsvsf3hQRkQH6RXXksBS+yxthvCYnFtZlc4Gf0ZTMJF6fL+aSUhlOOJsfKBP7OsNasyHDSnn3Q/ESltEVbMsPEGRqiUIc2Lv/IuQLsIlYbVvTjQZe/EAN9cqxjKffoMaL6GfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466876; c=relaxed/simple;
	bh=CoyqvOgwtCZPWZSoclyZkEX5+I1LpHTxJf8NXDiWuu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWWafAe3geVqh3BRlI5vZRro3mc+VgeNfJCNXrCzfq+GSyXM7btvyR3dPGkDnCzrxGZEA7/Xga02/O1NiAeP9ER7QJ2zlZ3L+aG0p4Ee++DUBMHrhLWlGaMQ3zB1kjGWOo+nX3jZk6MlTijsRwCVyalfqiLpZwhv7Vzu6A/8BZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPj3QEpb; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPj3QEpb"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso749878a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Sep 2024 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725466874; x=1726071674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=weNh0QX5nezonyihacHlDzSp/qiDEiH8F2h5VX1i+hE=;
        b=EPj3QEpb5grwTtXfJ6UeiG0xGRMRqHqUIwuY+CVmHgwL0OuPBalHpGd+Hsnd0KgCGg
         kejb5u86V7jrgwpH2DEl8R9YTqAgipNJKywKJmL8onvHFY7jKC0CFJ2xxWfOTD1KEdgt
         DFTDo/lwTp3WsUuhP0EsyEnIC0DDnPMT63B3rm8TWnoNgQdb5/SIT9UvZBt92Vsw3fte
         WND5mWu9Y0l3mxcI2qx97UX1XlyW3RI9wU3+5VXJtHnqtBgjUx8ketVlhK4fB9pzub/k
         zeb3rnddKi4uW4oDHpVcS2UarDwSOolxU2LCTS76oEQ99IyfrUoNdLX4JAY32wtdBhZ9
         Ok7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466875; x=1726071675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weNh0QX5nezonyihacHlDzSp/qiDEiH8F2h5VX1i+hE=;
        b=rbd1YWux0RSqeoYOYzRqwiCBQaA++PNVdgfzgPpitJ17kU6dxuJgo/f33+FYKof+cB
         Z8IfFu2TJBV/WQk6wfrjljGxa/w5bDms4QEuCoGK+3gGoVVeC5L2JRDjLC53WXEEFiAR
         3u1WE4ej1MnKEPpx91NoHsYBIKV9uXgzdZnKzR5DSVZHJftmFNzPg+z0unXGgRPhd10o
         LrqxbV4GyOJ0fAV+SeL1kkiR7fb7NUhkWBB9Ygd7apMH6RbY6CNWkB03Gsp3GSqGHFIt
         1cCb3xzYcBDQSEBi/KcDHXB4guJc7Hy5sEFJJPBaMUI150KZUC7PKzArGwnrXfCS6x2d
         EbQg==
X-Forwarded-Encrypted: i=1; AJvYcCVIwH38r2Ow+I3Wp6a5DfzngQ7OwEcwRCRb4HVwEY02R5cXMYhSsktdnIyOmIDCWH9Gqrk+rIf5n/KTjfv/nCOe@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhW6owwWZU+5sWDqFpqBSDY4CexpabYTTT0GF4k1bQzYxHdT3
	vv22qFo0Nu5yVOG+7mwU4g5+S2NnoDU+Sf2PNJaX2MsLZuD+ZT1gNKZC8IDYAIAwoklyUVAmj8Q
	t
X-Google-Smtp-Source: AGHT+IH70Qucqc4w3IuTRnC0ArVA/LCFl7Nyz3bO3XGxKL2AKr1w6zXgO+S845CmkbKE1RgpX1KEyQ==
X-Received: by 2002:a17:903:40c5:b0:206:b1fa:ccc3 with SMTP id d9443c01a7336-206b1fae4a4mr30019055ad.20.1725466874577;
        Wed, 04 Sep 2024 09:21:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8490:5dd6:5f49:1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea6661dsm15330635ad.253.2024.09.04.09.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:21:14 -0700 (PDT)
Date: Wed, 4 Sep 2024 10:21:11 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] remoteproc: xlnx: add sram support
Message-ID: <ZtiI98P/ipMkwMh1@p14s>
References: <20240830173735.279432-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830173735.279432-1-tanmay.shah@amd.com>

Good morning,

On Fri, Aug 30, 2024 at 10:37:36AM -0700, Tanmay Shah wrote:
> AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
> R5 cores can access OCM and access is faster than DDR memory but slower
> than TCM memories available. Sram region can have optional multiple
> power-domains. Platform management firmware is responsible
> to operate these power-domains.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v5:
>   - remoteproc: xlnx: remove genpool use for OCM sram
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
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 135 ++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 2cea97c746fd..af4e0e53dc9d 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -56,6 +56,17 @@ struct mem_bank_data {
>  	char *bank_name;
>  };
>  
> +/**
> + * struct zynqmp_sram_bank - sram bank description
> + *
> + * @sram_res: sram address region information
> + * @da: device address of sram
> + */
> +struct zynqmp_sram_bank {
> +	struct resource sram_res;
> +	u32 da;
> +};
> +
>  /**
>   * struct mbox_info
>   *
> @@ -120,6 +131,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * struct zynqmp_r5_core
>   *
>   * @rsc_tbl_va: resource table virtual address
> + * @sram: Array of sram memories assigned to this core
> + * @num_sram: number of sram for this core
>   * @dev: device of RPU instance
>   * @np: device node of RPU instance
>   * @tcm_bank_count: number TCM banks accessible to this RPU
> @@ -131,6 +144,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   */
>  struct zynqmp_r5_core {
>  	void __iomem *rsc_tbl_va;
> +	struct zynqmp_sram_bank *sram;
> +	int num_sram;
>  	struct device *dev;
>  	struct device_node *np;
>  	int tcm_bank_count;
> @@ -494,6 +509,45 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int add_sram_carveouts(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct rproc_mem_entry *rproc_mem;
> +	struct zynqmp_sram_bank *sram;
> +	dma_addr_t dma_addr;
> +	size_t len;
> +	int da, i;
> +
> +	for (i = 0; i < r5_core->num_sram; i++) {
> +		sram = &r5_core->sram[i];
> +
> +		dma_addr = (dma_addr_t)sram->sram_res.start;
> +
> +		len = resource_size(&sram->sram_res);
> +		da = sram->da;
> +
> +		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
> +						 (dma_addr_t)dma_addr,

@dma_addr is already declared as a dma_addr_t, which is what
rproc_mem_entry_init() is expecting.  As such I do not see a reason for the
extra casting - do you?

If you agree with my assessment I am proposing to remove it before applying the
patch rather than having to send another revision.

Let me know what you think.

Thanks,
Mathieu

> +						 len, da,
> +						 zynqmp_r5_mem_region_map,
> +						 zynqmp_r5_mem_region_unmap,
> +						 sram->sram_res.name);
> +		if (!rproc_mem) {
> +			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
> +				sram->sram_res.name, da, len);
> +			return -ENOMEM;
> +		}
> +
> +		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, da, len);
> +
> +		dev_dbg(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
> +			sram->sram_res.name, dma_addr, da, len);
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * tcm_mem_unmap()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -669,6 +723,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
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
> @@ -881,6 +941,77 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
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
> +			return -EINVAL;
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
> @@ -1095,6 +1226,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
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
> base-commit: 057e5c17e29fe67fae4c2786d558c31fd3b106ba
> -- 
> 2.25.1
> 
