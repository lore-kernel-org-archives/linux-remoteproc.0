Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CEC17E4
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 May 2025 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635447; cv=none; b=CHI16n4hSXq94fwotD2/JsQuasQyFr3/1eS/VdJGHPk8lf8HZrdV9Nu3d++SOtsjKzPoEraBsmr88UuIW18b1cLqvSLjj7ghS3vimLsbYdTELzTDLjuikX59nbD1WFkXwP6TAABOCxZagbfHwYEZoEd7TRa1BHvLYQFQTyDfOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635447; c=relaxed/simple;
	bh=LInNBwtmQmhh+iR2AmbpmrN7STz4KqZWSfUdBGmf7hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvxW3KKGXLHkTMA+yMRm4bGwHqFnsuVVohYN2SUcBlFpxA7mwVD/lQzsXpfT0BOUo/xkq6RJZE6nnxYsxNoPY2Bdbff1rQaS0DczNX4D2EEk3ManG9EfVDM/E+x+48cZ/OP7luPLdXnZy8XK2/2duIjpFqspuvVfdaGqMso8iDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldkg5zcH; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldkg5zcH"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af579e46b5dso4911098a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 May 2025 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746635445; x=1747240245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUsaBdogGoXhNgcOsYCHqdg0IYk4tdqqXNTthc+RX+Q=;
        b=ldkg5zcHREoAIAFXZy/v3jyPUbHfTmSkkT1nDiCzwzplUXK0UIRuHeCwmO33sjQSl5
         J9OFwg/8AnookQdlxj4DhL2GzpAkw7Sx/gaDSLPqmJL7RgjsLBoiynFo2JVGWICHAnny
         qLqPjjQCK/09M7CdfSr9itaqTjq9R+oHCM518osWp/mSXxE34/G34kZEr3QZO4FEBX7Z
         BJGPgpY4GB4j8c2KyD0Td5agay9k23IA8mif4oMGBmx5AcvA4g/0cr3Gmj80AhVRJ6LF
         SoBD0XnoRLuH/QZ9J3xEc3HelnLMI1mF+vFSY606B417PgAe2th2+zu7oYChiP3fD51e
         jf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635445; x=1747240245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUsaBdogGoXhNgcOsYCHqdg0IYk4tdqqXNTthc+RX+Q=;
        b=UnJ7vJN9titpII89ybcI6feoZMT+fY5PVx2YW3TT2msJKf3ny2cTeCa7nVPNURTSmq
         wmRbEJUoxJ0pN4hfDSugcUVfzEjKCLfymTeFs3VKHyrtKv0jrNyKuJv6yM3jDlL/uqru
         Fytp8pXY5Qtz76JyjxRSisCBQdBH+dhbj0A33RZE/PNyhSOo57YcNL1LqvCSUPKXl0yM
         uvlBYB/OrQ2f/OKJEUlysK0rrPiu7x6wOaujSV3f8PAS4ESIl0h/ZqQhnDmJ1rdURTx+
         JpOt02K3r7Ma1Hqaz/c5JgHnp8HuPrSSJutcHGdVeUZGdkvb0ElRVBvwkC92r0Na9Phs
         dexw==
X-Forwarded-Encrypted: i=1; AJvYcCXdUtjtcmtskAoNGOBwxJYlOnuPe5dcqIWVXyx6+w0P9UeEXcieVorkn9OFnCjhdwiEpRIklCgvgslL/81dDyGB@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ/d8tmY0/n+7TsBwnHi8hpvnkUd6OBbKI1WDc6voMxGGtDY4U
	u5Z960n/99Ttn3kaQ/bezmEN2bAugx8MkmbKvJlFG+zkaYUGMkI0DFc2+cfgXp8=
X-Gm-Gg: ASbGncvR1Ez0YO1WcYtxKEyta58FM5TKsbDZOQ9P5YwBlzP6mnpjrotYVW0UxNjgpPM
	F9NnJD2pRHSRJINfWPiFtl5T6WzsH/C45xjx2q3MQjAQ+ph0pjBymTDYO1c/hrikCryvmDs9f8t
	RhUU2PIhN4dWwSPdEl14kBsae+hM44SAzYnxh6Ry/KWy47wLEMiEapuRmFXQ9m1eC6/uwbHFZ1Z
	VcWWn0r7JY+WnkV0gxb3SOB6V627yNQIErjLvf0ppzLgMG9eGp+B4xR3HGgb6xJ5KUVEYQ97aVx
	4/Lm8lprzko30qKfaCrtQPCp0zv/dVTzPpDWQ38rpSla
X-Google-Smtp-Source: AGHT+IHR3m6m/Eqn3XsP38+nDffBcKX6Edkp/1GWHAAYvLM3/JjXG8P2wcY+Avn1alqMHUYGGnlz4Q==
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:769a:a4bf with SMTP id adf61e73a8af0-2148d5402d0mr6180569637.36.1746635445071;
        Wed, 07 May 2025 09:30:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d6b9:fb9b:e26b:ab43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b51570sm9703725a12.20.2025.05.07.09.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:30:44 -0700 (PDT)
Date: Wed, 7 May 2025 10:30:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 07/35] remoteproc: k3-r5: Use k3_r5_rproc_mem_data
 structure for memory info
Message-ID: <aBuKsolD-4_yzcZM@p14s>
References: <20250425104135.830255-1-b-padhi@ti.com>
 <20250425104135.830255-8-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425104135.830255-8-b-padhi@ti.com>

On Fri, Apr 25, 2025 at 04:11:07PM +0530, Beleswar Padhi wrote:
> The ti_k3_r5_remoteproc.c driver previously hardcoded device memory
> region addresses and names. Change this to use the k3_r5_rproc_mem_data
> structure to store memory information. This aligns with K3 DSP and M4
> drivers, and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Reviewed-by: Andrew Davis <afd@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---
> v11: Changelog:
> 1. Carried T/B tag.
> 
> Link to v10:
> https://lore.kernel.org/all/20250417182001.3903905-8-b-padhi@ti.com/
> 
> v10: Changelog:
> 1. Collected R/B from v9 version of this patch.
> 
> Link to v9:
> https://lore.kernel.org/all/20250317120622.1746415-4-b-padhi@ti.com/
> 
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 65 ++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 5a460cfdfb4c4..e2dd5c38a0668 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -84,18 +84,44 @@ enum cluster_mode {
>  	CLUSTER_MODE_SINGLECORE
>  };
>  
> +/**
> + * struct k3_r5_mem_data - memory definitions for a R5
> + * @name: name for this memory entry
> + * @dev_addr: device address for the memory entry
> + */
> +struct k3_r5_mem_data {
> +	const char *name;
> +	const u32 dev_addr;
> +};
> +
> +/**
> + * struct k3_r5_dev_data - device data structure for a R5
> + * @mems: pointer to memory definitions for a R5
> + * @num_mems: number of memory regions in @mems
> + * @boot_align_addr: boot vector address alignment granularity
> + * @uses_lreset: flag to denote the need for local reset management
> + */
> +struct k3_r5_dev_data {
> +	const struct k3_r5_mem_data *mems;
> +	u32 num_mems;
> +	u32 boot_align_addr;
> +	bool uses_lreset;
> +};
> +
>  /**
>   * struct k3_r5_soc_data - match data to handle SoC variations
>   * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
>   * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
>   * @single_cpu_mode: flag to denote if SoC/IP supports Single-CPU mode
>   * @is_single_core: flag to denote if SoC/IP has only single core R5
> + * @core_data: pointer to R5-core-specific device data
>   */
>  struct k3_r5_soc_data {
>  	bool tcm_is_double;
>  	bool tcm_ecc_autoinit;
>  	bool single_cpu_mode;
>  	bool is_single_core;
> +	const struct k3_r5_dev_data *core_data;
>  };
>  
>  /**
> @@ -151,6 +177,7 @@ struct k3_r5_core {
>   * @rmem: reserved memory regions data
>   * @num_rmems: number of reserved memory regions
>   * @reset: reset control handle
> + * @data: pointer to R5-core-specific device data
>   * @tsp: TI-SCI processor control handle
>   * @ti_sci: TI-SCI handle
>   * @ti_sci_id: TI-SCI device identifier
> @@ -166,6 +193,7 @@ struct k3_r5_rproc {
>  	struct k3_r5_mem *rmem;
>  	int num_rmems;
>  	struct reset_control *reset;
> +	const struct k3_r5_dev_data *data;
>  	struct ti_sci_proc *tsp;
>  	const struct ti_sci_handle *ti_sci;
>  	u32 ti_sci_id;
> @@ -1235,31 +1263,32 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>  static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>  					       struct k3_r5_rproc *kproc)
>  {
> -	static const char * const mem_names[] = {"atcm", "btcm"};
> +	const struct k3_r5_dev_data *data = kproc->data;
>  	struct device *dev = &pdev->dev;
>  	struct k3_r5_core *core = kproc->priv;
>  	struct resource *res;
>  	int num_mems;
>  	int i;
>  
> -	num_mems = ARRAY_SIZE(mem_names);
> -	kproc->mem = devm_kcalloc(dev, num_mems, sizeof(*kproc->mem), GFP_KERNEL);
> +	num_mems = kproc->data->num_mems;

        num_mems = data->num_mems;

If this is the only thing I find then it is not worth a new revision.  Let's see
how things play out.  More comments to come.

Mathieu

> +	kproc->mem = devm_kcalloc(kproc->dev, num_mems, sizeof(*kproc->mem),
> +				  GFP_KERNEL);
>  	if (!kproc->mem)
>  		return -ENOMEM;
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
> @@ -1273,7 +1302,8 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>  		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
>  							 resource_size(res));
>  		if (!kproc->mem[i].cpu_addr) {
> -			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
> +			dev_err(dev, "failed to map %s memory\n",
> +				data->mems[i].name);
>  			return -ENOMEM;
>  		}
>  		kproc->mem[i].bus_addr = res->start;
> @@ -1286,7 +1316,7 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>  		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
>  		 * SoCs) based on loczrama setting
>  		 */
> -		if (!strcmp(mem_names[i], "atcm")) {
> +		if (!strcmp(data->mems[i].name, "atcm")) {
>  			kproc->mem[i].dev_addr = core->loczrama ?
>  							0 : K3_R5_TCM_DEV_ADDR;
>  		} else {
> @@ -1296,7 +1326,7 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>  		kproc->mem[i].size = resource_size(res);
>  
>  		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> -			mem_names[i], &kproc->mem[i].bus_addr,
> +			data->mems[i].name, &kproc->mem[i].bus_addr,
>  			kproc->mem[i].size, kproc->mem[i].cpu_addr,
>  			kproc->mem[i].dev_addr);
>  	}
> @@ -1408,6 +1438,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  		kproc->priv = core;
>  		kproc->dev = cdev;
>  		kproc->rproc = rproc;
> +		kproc->data = cluster->soc_data->core_data;
>  		core->kproc = kproc;
>  
>  		kproc->ti_sci = devm_ti_sci_get_by_phandle(cdev, "ti,sci");
> @@ -1772,11 +1803,24 @@ static int k3_r5_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct k3_r5_mem_data r5_mems[] = {
> +	{ .name = "atcm", .dev_addr = 0x0 },
> +	{ .name = "btcm", .dev_addr = K3_R5_TCM_DEV_ADDR },
> +};
> +
> +static const struct k3_r5_dev_data r5_data = {
> +	.mems = r5_mems,
> +	.num_mems = ARRAY_SIZE(r5_mems),
> +	.boot_align_addr = 0,
> +	.uses_lreset = true,
> +};
> +
>  static const struct k3_r5_soc_data am65_j721e_soc_data = {
>  	.tcm_is_double = false,
>  	.tcm_ecc_autoinit = false,
>  	.single_cpu_mode = false,
>  	.is_single_core = false,
> +	.core_data = &r5_data,
>  };
>  
>  static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
> @@ -1784,6 +1828,7 @@ static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
>  	.tcm_ecc_autoinit = true,
>  	.single_cpu_mode = false,
>  	.is_single_core = false,
> +	.core_data = &r5_data,
>  };
>  
>  static const struct k3_r5_soc_data am64_soc_data = {
> @@ -1791,6 +1836,7 @@ static const struct k3_r5_soc_data am64_soc_data = {
>  	.tcm_ecc_autoinit = true,
>  	.single_cpu_mode = true,
>  	.is_single_core = false,
> +	.core_data = &r5_data,
>  };
>  
>  static const struct k3_r5_soc_data am62_soc_data = {
> @@ -1798,6 +1844,7 @@ static const struct k3_r5_soc_data am62_soc_data = {
>  	.tcm_ecc_autoinit = true,
>  	.single_cpu_mode = false,
>  	.is_single_core = true,
> +	.core_data = &r5_data,
>  };
>  
>  static const struct of_device_id k3_r5_of_match[] = {
> -- 
> 2.34.1
> 
