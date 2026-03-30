Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE4B377542
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887761; cv=none; b=TWuhlD3z9samTZDmrbrU9SOlc6jEjeXO6UaLFx49CAvQnK8h5Ked8Cil7g2G2BVA2iVHPn7Wnwy36Rbh3xxVBs9QeBCKCZ0+RsGliF+OJOAcYyh91Ph2srardFeXTgo5jp+vRY5+GF5CatRSalTk2KQwtWptasSUAzRojeJ8oF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887761; c=relaxed/simple;
	bh=OWclWe7z9oM5qjVK/Jh3Q3Y6NyRY3zTBQRnXXXEeho8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4MhdgfIVx8sr2RZ5LHKgGDprYJ4iw6QZPUaBDGLHRMJ3jbl62ggVmml2PB7botb0k2cDBWEsq3DfWI5DND16eDe/5kUu0+/DMvAgCNH9leHVoxxsAsWLpCM9l+teFfmcHXxg4wOfn5yUDBDTF7xDUktwB+AroSLb396u1W8B74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2Lswia0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2Lswia0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b23fcf90b2so25586615ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774887759; x=1775492559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMohgIf2kDkk6Cae0YiULQonmSDmJhFZPXEiKdJxSFI=;
        b=H2Lswia0bGZQlew6iHeRgsY2jOh49NG923eTLx3ClsGwNG/38hZQY5IZ09+PGSsTX/
         vqLozyncrYxiq+LyXKRutCfwwbRN5lHfPOrZO8ZzfU63XRjcFSwIJoGNzT5V2koj9r5K
         syvfBUCj60oMRlGVQ28WQfKuyRf1tRI53stcRUfD3iZhtGHtPlzwAe1SL1dTH+K8K4u7
         X4fKUFOORfbbilA2DFC11ZQ7WnbjrJ0ZKNMwasgcz/jaCDI06iyLqwvjyUz3naV5qdKg
         jbnumdbbPobak0tR40ladiic5HNIf5MalwRp64TCm2x5asYHmmhCH/mtTmDMGmuwlKZ9
         Q3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774887759; x=1775492559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMohgIf2kDkk6Cae0YiULQonmSDmJhFZPXEiKdJxSFI=;
        b=DtxrupNXCBZkIoIJi/W5c3pMOf+vfZIchWMWw//kTzvYgKkcF+pjBuc5Pg75eHbEse
         Q0WbVdf56DhP/VlDe9FBTzeXlGqtFqlKfAGL6GwKalq5WvIIios7aI4FFeruhi7GGOnc
         1TGsSPF86Ri1gGHKHEmIN88yTDgECoJZ2XBQ8RQpogIvQ69z539qkCAxa29WjnP5tYOd
         HB/zYkEUmAGb+vgWVZzN+Fxsgk12Xmt/In0TlMEAx+ldkYuuZGhwm5RkH13h63SgizG/
         Gtw7wBuR9zGVmlA0sbw+sDkPVBs4MtaDI/Tw26xv3ofQtwWry1XKlcL2nqhRh20ylaZn
         3Mag==
X-Forwarded-Encrypted: i=1; AJvYcCVHs2KL2gA+ofsSA4Qlhk+yQjFO9170l5kgLOJTM/ZgX4qGzIPm7KHr6aUT7HgVnfMLRATi8s3mGmiLFhf3boHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAHRl94uG15vXUL+1QmoD//MRuRCuPDVsEqgvK9pCia2xv/pB
	DiGJXYE71sNCY6l6ykKTgkdz9duNYm0fttiftw8RPi8fBQGN7JzHT3dI/RrRDCsc5jU=
X-Gm-Gg: ATEYQzxGISM6fbyzQHxCV1KLb2UvAE0ClQ+Mxkv/zL2NE4eef1W/wXokJ3Du/YUC+/2
	HobPHvWW+YUMwHzOJlKYF6FsTr8fqygothAFEJ7Zsc3OzapMsZ2jm9orx8HFWFCKQDduSTgdHq8
	Ub8MFQBGboA+QMm++b791MmVqcQGXURYWPBulEI0YSbwRVoQdpX67HdAxskZOhQmcTFqNQ6Fcu2
	zHEJ6UmYdIaCjB29gJNkrLt+sCWauCXafbzzYrG7Wi9UOnjsEf+nV88jhDVJzD/VXp1Nw6SFnGK
	fqvC/yoRQDANIu1eVfU1Wmy1q9yduvDy+8E/FetnW90bL8NgZci/gzZOxe7e2RHgiKkjJRulc+f
	+JIi3xbcrZL/J6jHagBDH+JWSksJzmJJRPdCfQZEO/x0XVghJ+RPFN49o+tkqVyk6pZcJx/xOR2
	+PbZLE4TzX7ohyYTBbQvDs6GLuMiE=
X-Received: by 2002:a17:902:e843:b0:2b2:5428:ead8 with SMTP id d9443c01a7336-2b2542902d6mr38590925ad.0.1774887759333;
        Mon, 30 Mar 2026 09:22:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e8c9:5e1e:f42a:2b73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268aa4fsm83826645ad.36.2026.03.30.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:22:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:22:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <acqjS440STRl2sK2@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>

On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Cortex-M[7,33] processors use a fixed reset vector table format:
> 
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
> 
> In ELF images, the corresponding layout is:
> 
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
> 
> Reset_Handler:  --> ELF entry point address
>         ...
> 
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
> 
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
> 
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>

But why?  Why can't the ELF image be set to the right reset base?
 
> To derive the correct hardware reset address, the unused lower bits must
> be masked off. The boot code should apply a SoC-specific mask before
> programming the reset address registers, e.g.:
> 
>   reset_address = entry & reset_vector_mask
> 
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfully.
> 
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. To derive the proper reset vector, this
> patch introduces imx_rproc_get_boot_addr(), which masks the ELF entry
> point using the SoC‑specific 'reset_vector_mask'. The resulting reset
> vector address is then passed to the SM CPU/LMM reset vector API calls.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 17 ++++++++++++++---
>  drivers/remoteproc/imx_rproc.h |  2 ++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 0dd80e688b0ea3df4c66e5726884dc86c8a5a881..d8ead42640881bd523d605fa7002935ef6e98077 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -345,7 +345,7 @@ static int imx_rproc_sm_cpu_start(struct rproc *rproc)
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	int ret;
>  
> -	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, rproc->bootaddr, true, false, false);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
>  		return ret;
> @@ -365,7 +365,7 @@ static int imx_rproc_sm_lmm_start(struct rproc *rproc)
>  	 * If the remoteproc core can't start the M7, it will already be
>  	 * handled in imx_rproc_sm_lmm_prepare().
>  	 */
> -	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, rproc->bootaddr);
>  	if (ret) {
>  		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
>  			dcfg->lmid, dcfg->cpuid, ret);
> @@ -739,6 +739,17 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  	return rproc_elf_find_loaded_rsc_table(rproc, fw);
>  }
>  
> +static u64 imx_rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	u32 reset_vector_mask = GENMASK_U32(31, 0);
> +
> +	if (priv->dcfg->reset_vector_mask)
> +		reset_vector_mask = priv->dcfg->reset_vector_mask;
> +
> +	return rproc_elf_get_boot_addr(rproc, fw) & reset_vector_mask;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> @@ -752,7 +763,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> -	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.get_boot_addr	= imx_rproc_get_boot_addr,
>  };
>  
>  static int imx_rproc_addr_init(struct imx_rproc *priv,
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index d37e6f90548cec727b4aeb874680b42af85bdbb4..0d7d48352a1091ad24e8e083172ce6da6d26ae10 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -41,6 +41,8 @@ struct imx_rproc_dcfg {
>  	/* For System Manager(SM) based SoCs */
>  	u32				cpuid; /* ID of the remote core */
>  	u32				lmid;  /* ID of the Logcial Machine */
> +	/* reset_vector = elf_entry_addr & reset_vector_mask */
> +	u32				reset_vector_mask;
>  };
>  
>  #endif /* _IMX_RPROC_H */
> 
> -- 
> 2.37.1
> 
