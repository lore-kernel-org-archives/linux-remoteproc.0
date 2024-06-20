Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381E47FBBD
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918945; cv=none; b=fGt4SQQJQ5D6acQbnLCwy3OIlKGtp5vRuAgjpkZRPRdfZp6HvITOQwE/n/mNkNXedjT7YSnic+UE2Lv0ycgv0zGnzgiTYl7L4w4FHg7IeIAMxaWawCN6j0OVhIpH52ydy6s48FBeh7dsOzAa9qbgekwUzqc3vt/ih9WS2w8zb4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918945; c=relaxed/simple;
	bh=0/zeAXqfW2oltaDHEjTacTvAs02fOUXZz68GM++pw3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gilYgbMldD4bnNn/lR8EFYujRRsk4OZcnkoFdhxQG/KWbKnbDBFBIPjNq+pnvyrCt4qB3NsBAEJJE/Q2NBgRQZ1b/rKvh6kqTJ0Or3WeVU8mFPZIkSFXe3C3H3mRsl/e63hhShdFKy1AFZaLUACaqvpsAUgazMk0jI6bHrCA95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4mGa7f2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4mGa7f2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f9e5fb4845so307405ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718918942; x=1719523742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1B8n/9x5UV/1SNK0e2sD4WDigveg5fhKDxICWDMhEd8=;
        b=M4mGa7f2BJBaZHF6/cHaV7Xs2f4h/ngSLZew7tIUBHEgLEGg5sFs12ieQTCekvC17B
         RTbSSDLKHC1/y+Vb8/VIxE/ope3mLAoXZxRpbiHi4HvWl8IjEEG8RqUKOO7xwBURjK76
         rC79c+NiWZCtHuC0AQo3GSTXFg/vSBXhM05K7db9FjDJ2zjzvk4ADnznMivvAdEkcjyt
         tA1gtPVRbH3uMIolgtDI71J7u6Nq2gJOmLzn49W1schMvyBuZaXs802z7Yuc+EPG1pAu
         YvewnSj5yL44HELxxO42LMlwddtPw5ytxGdlrTTvkYIxBD1pLGYVP8nRjJvcK2B6pAYM
         RFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918942; x=1719523742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B8n/9x5UV/1SNK0e2sD4WDigveg5fhKDxICWDMhEd8=;
        b=BHRSRLQGv0FQKVgJBcvsCcJcyQH3Wh0TtbLmwDF7PmnLOlT9gqXMf5rcI6TbBF+GEm
         iFgvT+toaP7hB66PKV+POmvu7RLZTP7QyVsyJbZFNx7Wj8CqDTB8juhs786Kek2Le9rs
         C2/6sLkv8GWhfAiluLHm4+6xWZsW3xn+aRUPx6VazGlCrll4jw8I89EkXCRWXWC+U6lq
         oU0fA7faYqORQ9xG5h4PtPRp2t4tlAEz/cJDKrWbPon8CjOLmv72H7Fh/yX217Ym7Npj
         Zl7CSv5FXcUujs5AY0hu9Qte+2IrzTyxcAfeCLg0qQn2rymjzxAW6MMFKIagG1Rz42Zs
         YOGA==
X-Forwarded-Encrypted: i=1; AJvYcCVDl8KqgdTxHo3Drf5wprdqJcU0NJaq9+S6+Bl+wM6udblBWq+hjBs/Q08FcvIiCbasTjjw2652euO0bBVnxu+Dws984ae4DA3Mv1q7weJszg==
X-Gm-Message-State: AOJu0YwY1aWFmVoxk89sEsJK3l4HeG+5CFYOhrPQpUO3yq3vOLxbgETH
	al+GnRnS+KfMCFcH1c/mU2FFtLT5QZAVMLhhPBuqTrx4n5g8bC5OZUKXZr34X0E=
X-Google-Smtp-Source: AGHT+IGRZRV15RUYJQ36Wvbuz7tQOaEP3gRrX62dbm+NaihBOC+cfum9DmWH761VwwydaedMpum6CQ==
X-Received: by 2002:a17:902:daca:b0:1f8:66fb:1679 with SMTP id d9443c01a7336-1f9a9274fb1mr93302075ad.30.1718918942421;
        Thu, 20 Jun 2024 14:29:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800::9eba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbbc1cbsm698255ad.282.2024.06.20.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:29:01 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:28:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] remoteproc: core: Introduce rproc_pa_to_va helper
Message-ID: <ZnSfGkcjxr/4qJn/@p14s>
References: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
 <20240611073904.475019-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611073904.475019-2-arnaud.pouliquen@foss.st.com>

On Tue, Jun 11, 2024 at 09:39:00AM +0200, Arnaud Pouliquen wrote:
> When a resource table is loaded by an external entity such as U-boot or
> OP-TEE, we do not necessary get the device address(da) but the physical

s/necessary/necessarily

> address(pa).
> This helper performs similar translation than the rproc_da_to_va()
> but based on a physical address.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 74 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  3 ++
>  2 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..3fdec0336fd6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -230,6 +230,77 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  }
>  EXPORT_SYMBOL(rproc_da_to_va);
>  
> +/**
> + * rproc_pa_to_va() - lookup the kernel virtual address for a physical address of a remoteproc
> + * memory
> + *
> + * @rproc: handle of a remote processor
> + * @pa: remoteproc physical address
> + * @len: length of the memory region @pa is pointing to
> + * @is_iomem: optional pointer filled in to indicate if @da is iomapped memory
> + *
> + * Some remote processors will ask us to allocate them physically contiguous
> + * memory regions (which we call "carveouts"), and map them to specific
> + * device addresses (which are hardcoded in the firmware). They may also have
> + * dedicated memory regions internal to the processors, and use them either
> + * exclusively or alongside carveouts.
> + *
> + * They may then ask us to copy objects into specific addresses (e.g.
> + * code/data sections) or expose us certain symbols in other device address
> + * (e.g. their trace buffer).
> + *
> + * This function is a helper function with which we can go over the allocated
> + * carveouts and translate specific physical addresses to kernel virtual addresses
> + * so we can access the referenced memory. This function also allows to perform
> + * translations on the internal remoteproc memory regions through a platform
> + * implementation specific pa_to_va ops, if present.
> + *
> + * Note: phys_to_virt(iommu_iova_to_phys(rproc->domain, da)) will work too,
> + * but only on kernel direct mapped RAM memory. Instead, we're just using
> + * here the output of the DMA API for the carveouts, which should be more
> + * correct.

No point in copying all this.  Just say that it does the same thing as
rproc_da_to_va(), but with the PA address.

> + *
> + * Return: a valid kernel address on success or NULL on failure
> + */
> +void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem)
> +{
> +	struct rproc_mem_entry *carveout;
> +	void *ptr = NULL;
> +
> +	if (rproc->ops->da_to_va) {

This is really wrong.

> +		ptr = rproc->ops->pa_to_va(rproc, pa, len);
> +		if (ptr)
> +			goto out;
> +	}

There is no current customer for ops::pa_to_va() so please remove.

Thanks,
Mathieu

> +
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		int offset = pa - carveout->dma;
> +
> +		/*  Verify that carveout is allocated */
> +		if (!carveout->va)
> +			continue;
> +
> +		/* try next carveout if da is too small */
> +		if (offset < 0)
> +			continue;
> +
> +		/* try next carveout if da is too large */
> +		if (offset + len > carveout->len)
> +			continue;
> +
> +		ptr = carveout->va + offset;
> +
> +		if (is_iomem)
> +			*is_iomem = carveout->is_iomem;
> +
> +		break;
> +	}
> +
> +out:
> +	return ptr;
> +}
> +EXPORT_SYMBOL(rproc_pa_to_va);
> +
>  /**
>   * rproc_find_carveout_by_name() - lookup the carveout region by a name
>   * @rproc: handle of a remote processor
> @@ -724,8 +795,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>  	 * firmware was compiled with.
>  	 *
>  	 * In this case, we must use the IOMMU API directly and map
> -	 * the memory to the device address as expected by the remote
> -	 * processor.
> +	 * the memory to the device address as etable
>  	 *
>  	 * Obviously such remote processor devices should not be configured
>  	 * to use the iommu-based DMA API: we expect 'dma' to contain the
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..28aa62a3b505 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -367,6 +367,7 @@ enum rsc_handling_status {
>   * @detach:	detach from a device, leaving it powered up
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @pa_to_va:	optional platform hook to perform address translations
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
>   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> @@ -391,6 +392,7 @@ struct rproc_ops {
>  	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +	void * (*pa_to_va)(struct rproc *rproc, phys_addr_t da, size_t len);
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> @@ -690,6 +692,7 @@ int rproc_detach(struct rproc *rproc);
>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem);
>  
>  /* from remoteproc_coredump.c */
>  void rproc_coredump_cleanup(struct rproc *rproc);
> -- 
> 2.25.1
> 
