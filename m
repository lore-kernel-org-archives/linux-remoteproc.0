Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE61D0F5A
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 May 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636494; cv=none; b=on06PF57esaPhXwispMUSwCXXGhk99VsBFC1guhPBEwWHRUIwzjA2ybnPEEkvG//0N26sr1AImHRtW51/PWylGkuD5lc2nSe9Pjq2AduJ6BPrnU8HWcb4UPw+uNq9XDw2i+8wAe+0z3G5gexIhBeUVghWSG0oJh5DRD3PvXqbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636494; c=relaxed/simple;
	bh=rX9q4ian0XE+ioGL16FjAoU3QFvpU8OSWmFdhiz02sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emXaXL6KovXyyJtoMQhZlo+Op9JCr4Xmq7indqMJhTVq3p4nKoa0RHLsKlZP1yIfiDckMXZ114mMrUHtrr6KLgLmvkLWNgN5ap89x+yTfLqkaZVpVyX8kinA08CfCtYSx96b8V/tlUbFMdStiBdb7aDgpS4i8GpDgLJrBURl1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rm/sBZ5M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rm/sBZ5M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e15aea506so1228285ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 May 2025 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746636491; x=1747241291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uOpt6MepWln1adR2L4V7CRN+810t/NisidQaKnnEXiE=;
        b=Rm/sBZ5MsNTixNjWvHLAGe4jcurEraugAvHFNvtdrhowjUj1GrABthfQayUsP8qr75
         kZv/fZtkAJD6TSW11oLCU+KbfIbvkICDUkl+iJg6ezYlet7PD0M4vnIsTFm0tG5xCNGI
         GYnw+rh7Zt0wJGdiii/H9eoRhkqc6AikRM18FsgQAoJZ6pM9NzGvpVKTeBpQxaV2keKl
         QYbaivbtR1HptSCHhsFqc61zSl1cZxVCsyOM55HeNJFUMUR/wKuQ9E2v4NxlHKSqzqae
         ZnmqGIvR9V2qQu51bpbJhD9qwBBvK43gVKnCE7jpKEYFjA1g9Z6Ce9GO9ZZoNtAK8Rrv
         lQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636491; x=1747241291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOpt6MepWln1adR2L4V7CRN+810t/NisidQaKnnEXiE=;
        b=puHGmDhQF2cSs9+ctlzPQo6u3NCaPzZRvZlOVWchQbmsP3mBUga34m4x+FWniJUIVg
         jjPvOBdvEG0rVZsqhW/U7S0IYJ1jauwx2DW2FEVvLc7Gu+8B+yL53TR1Fpn+aPHCLVag
         PSiYK2jNVGPI4yhKgiG/FJnrzHdNqXHf4ERnuAVW+iyi5/gUSxxf4UHysqV3070akk6L
         a4JPParrt4uojGTpZnle/R2OhkWMtwz4fuB5t1sYSc125v+dkUOA5kHXDpcvHQyG1gEO
         HlNzmo5b6ilRVq7YAMyglxn06FcueiBX6nqzRUSgZWo6g69HUt4sitmx3BuQXaLgg1LR
         g4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWlpqVAIXE5RnyDKIiSRHUnBKDAaDPXLwqGKDSi7tdzWvunCZmWrlM/m4BWIe0wa1I/k/S3hoMvq9Ui9LKv6cuv@vger.kernel.org
X-Gm-Message-State: AOJu0YzGh9ODT3CGF2goDD6UNZuY48kIX1ri3rEMFrWtRiSPlAjSiKjK
	YI4K3OP3jL5g2agvW/suAW2NIEXmOPVWC30QM8Z6P8yZBFFvK6orMOYA0HIA6QI=
X-Gm-Gg: ASbGncvsqqabDpqgl7Mj4sTmu/CkbHx5DFM5BxvoSIBZoTXMzXVIHiNksANm+E7UiO1
	8bjV8SLgPenAgiClrQszUXVZSpsGnWAlJhT4A66IefG4lgB/k+GdplIzT3uPz4tkiLKluYth3K7
	AQ/ght0dBg+XhyVf4eMi/AWYXz855iFwkjLylzVFEWwqlGhtYNNuMVB27uU6Q5Vpdt64vlrQ0c4
	8WWQvQpGyfh2/p2D0VbsgZ8GJIf92HkziRrERLtUD4lgalUZkBwsVspRWdhgPKbcIiioXVDCL26
	lwz82df+lO67mPe+TtWUo6XdDqDifWL+tFc6yMr6pFwC
X-Google-Smtp-Source: AGHT+IEFeTXf80XDm0jrk6cN4RIo7G3+/lsPL8HQXJq7aLj2VqmrdEAlWFcJTPahi2aFpIJHqE7SIA==
X-Received: by 2002:a17:903:41c2:b0:22e:4cab:f786 with SMTP id d9443c01a7336-22e863d50b9mr226295ad.18.1746636491411;
        Wed, 07 May 2025 09:48:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d6b9:fb9b:e26b:ab43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e73111537sm11198565ad.10.2025.05.07.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:48:10 -0700 (PDT)
Date: Wed, 7 May 2025 10:48:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/35] remoteproc: k3-m4: Use k3_rproc_mem_data
 structure for memory info
Message-ID: <aBuOyKWV-EsFXU3N@p14s>
References: <20250425104135.830255-1-b-padhi@ti.com>
 <20250425104135.830255-11-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425104135.830255-11-b-padhi@ti.com>

On Fri, Apr 25, 2025 at 04:11:10PM +0530, Beleswar Padhi wrote:
> The ti_k3_m4_remoteproc.c driver previously hardcoded device memory
> region addresses and names. Change this to use the k3_rproc_mem_data
> structure to store memory information. This aligns with DSP and R5
> drivers, and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---
> v11: Changelog:
> 1. Carried T/B tag.
> 
> Link to v10:
> https://lore.kernel.org/all/20250417182001.3903905-11-b-padhi@ti.com/
> 
> v10: Changelog:
> None
> 
> Link to v9:
> https://lore.kernel.org/all/20250317120622.1746415-6-b-padhi@ti.com/
> 
>  drivers/remoteproc/ti_k3_m4_remoteproc.c | 60 ++++++++++++++++++------
>  1 file changed, 45 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index d0ee7a8d460d4..e83bef7cfddfd 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -20,9 +20,6 @@
>  #include "remoteproc_internal.h"
>  #include "ti_sci_proc.h"
>  
> -#define K3_M4_IRAM_DEV_ADDR 0x00000
> -#define K3_M4_DRAM_DEV_ADDR 0x30000
> -
>  /**
>   * struct k3_m4_rproc_mem - internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -38,15 +35,29 @@ struct k3_m4_rproc_mem {
>  };
>  
>  /**
> - * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
> + * struct k3_m4_mem_data - memory definitions for a remote processor
>   * @name: name for this memory entry
>   * @dev_addr: device address for the memory entry
>   */
> -struct k3_m4_rproc_mem_data {
> +struct k3_m4_mem_data {
>  	const char *name;
>  	const u32 dev_addr;
>  };
>  
> +/**
> + * struct k3_m4_dev_data - device data structure for a M4 core
> + * @mems: pointer to memory definitions for a M4 core
> + * @num_mems: number of memory regions in @mems
> + * @boot_align_addr: boot vector address alignment granularity
> + * @uses_lreset: flag to denote the need for local reset management
> + */
> +struct k3_m4_dev_data {
> +	const struct k3_m4_mem_data *mems;
> +	u32 num_mems;
> +	u32 boot_align_addr;
> +	bool uses_lreset;
> +};
> +
>  /**
>   * struct k3_m4_rproc - k3 remote processor driver structure
>   * @dev: cached device pointer
> @@ -56,6 +67,7 @@ struct k3_m4_rproc_mem_data {
>   * @rmem: reserved memory regions data
>   * @num_rmems: number of reserved memory regions
>   * @reset: reset control handle
> + * @data: pointer to M4-specific device data
>   * @tsp: TI-SCI processor control handle
>   * @ti_sci: TI-SCI handle
>   * @ti_sci_id: TI-SCI device identifier
> @@ -71,6 +83,7 @@ struct k3_m4_rproc {
>  	struct k3_m4_rproc_mem *rmem;
>  	int num_rmems;
>  	struct reset_control *reset;
> +	const struct k3_m4_dev_data *data;
>  	struct ti_sci_proc *tsp;
>  	const struct ti_sci_handle *ti_sci;
>  	u32 ti_sci_id;
> @@ -336,14 +349,13 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
>  static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>  				       struct k3_m4_rproc *kproc)
>  {
> -	static const char * const mem_names[] = { "iram", "dram" };
> -	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
> +	const struct k3_m4_dev_data *data = kproc->data;
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	int num_mems;
>  	int i;
>  
> -	num_mems = ARRAY_SIZE(mem_names);
> +	num_mems = kproc->data->num_mems;

Same a previous comment.

>  	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
>  				  sizeof(*kproc->mem), GFP_KERNEL);
>  	if (!kproc->mem)
> @@ -351,17 +363,17 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>  
>  	for (i = 0; i < num_mems; i++) {
>  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   mem_names[i]);
> +						   data->mems[i].name);
>  		if (!res) {
>  			dev_err(dev, "found no memory resource for %s\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>  			return -EINVAL;
>  		}
>  		if (!devm_request_mem_region(dev, res->start,
>  					     resource_size(res),
>  					     dev_name(dev))) {
>  			dev_err(dev, "could not request %s region for resource\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>  			return -EBUSY;
>  		}
>  
> @@ -369,15 +381,15 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>  							 resource_size(res));
>  		if (!kproc->mem[i].cpu_addr) {
>  			dev_err(dev, "failed to map %s memory\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>  			return -ENOMEM;
>  		}
>  		kproc->mem[i].bus_addr = res->start;
> -		kproc->mem[i].dev_addr = mem_addrs[i];
> +		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
>  		kproc->mem[i].size = resource_size(res);
>  
>  		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> -			mem_names[i], &kproc->mem[i].bus_addr,
> +			data->mems[i].name, &kproc->mem[i].bus_addr,
>  			kproc->mem[i].size, kproc->mem[i].cpu_addr,
>  			kproc->mem[i].dev_addr);
>  	}
> @@ -563,12 +575,17 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct k3_m4_rproc *kproc;
> +	const struct k3_m4_dev_data *data;
>  	struct rproc *rproc;
>  	const char *fw_name;
>  	bool r_state = false;
>  	bool p_state = false;
>  	int ret;
>  
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
>  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
> @@ -583,6 +600,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  	kproc = rproc->priv;
>  	kproc->dev = dev;
>  	kproc->rproc = rproc;
> +	kproc->data = data;
>  	platform_set_drvdata(pdev, rproc);
>  
>  	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
> @@ -650,8 +668,20 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct k3_m4_mem_data am64_m4_mems[] = {
> +	{ .name = "iram", .dev_addr = 0x0 },
> +	{ .name = "dram", .dev_addr = 0x30000 },
> +};
> +
> +static const struct k3_m4_dev_data am64_m4_data = {
> +	.mems = am64_m4_mems,
> +	.num_mems = ARRAY_SIZE(am64_m4_mems),
> +	.boot_align_addr = SZ_1K,
> +	.uses_lreset = true,
> +};
> +
>  static const struct of_device_id k3_m4_of_match[] = {
> -	{ .compatible = "ti,am64-m4fss", },
> +	{ .compatible = "ti,am64-m4fss", .data = &am64_m4_data, },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, k3_m4_of_match);
> -- 
> 2.34.1
> 
