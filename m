Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177E35F607
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893532; cv=none; b=hJUfNLmehF/zEy57PJFV1rXFdpzO1D8FqHPwAvTJxoqrOGUIv4AMF2lkv/joXNItVxDtakQiA/f/j5kmehU1ssGZLgTQ5U0/6mDKHkpmJ1wc1BJq0CAZqWrfUOg39Y/E3+O7hFA1lP+5GisVwJzu010QNw+3tNA8tqKXHzN3AME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893532; c=relaxed/simple;
	bh=Ob2DpnxEGRjh+H4R/5aZy/JVZltd6gqSjnffSViWHnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk1ZLT3icTx8NWyQAV2PSg4hKq01uMiUCOQYExWamMeJNI4mIa/XPJlQXpDgl7Qnlx72X5m8g0Ztcwak4aqSJSUXVAMG7ZNQgoxcXefp03Cg3xOjtlD92fUC/q9Dni+o5ZmNDMGb+CyfajbizTL5Gm6jPt+aalobsktPrDp2p+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RbtrT937; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RbtrT937"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3664df32e91so13514237a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779893530; x=1780498330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
        b=RbtrT937oiIsRMQHMBmBSKZU4qirFVpwSXx73n0CWi2DcC9PHEttwyH9KBZVBHt+Xp
         iGR3s6ldGvR8P6tQN4EHV5iPiIFTetR2pcl1K9FqvNapChmPk0ZGF3g73QzusQaXvVzC
         BWaw+d/PN/WKCHkBmCtfwhfQiDRrNZUKEIkbamkRnor1xfht8sUzXNxZGBfAmKVmp8Tp
         IgmYZpBVq+7ntR4oAkPhrunuc0jkY+UjGN5CjQ1+eWqpFsMuIYp92xWCvgh/tce9Jd+x
         Y1/o/g/OGFJ7JdBE8G4aN6ZcZ5TVsDIXpmsFfvFr8o5q2OZwKSr3FiXTpScCUZzbZktf
         zQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893530; x=1780498330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
        b=bHvjvrNe7VRyejhVxTb/ru7dqNuc1duyTxLwbuWbxZQ4+tX2hDHp+jpXGBXSL2Q4I2
         /9KIZSrkXSrsbfwt9uso6Iv8R02rD4klxYG4Jff0laPxIrM/1gRO227rxr7eYPt+u4gP
         F8mi9IvaBNYd/3luJ6C3x612MhMHC0C7MmhqW4EqBZSP4wBUjfY0GdgNh7/VLa2nOwiG
         INH5rad5zsE6LYSuoXiytCODEia4cfRJDFRuwIaozyvb9g2kQ3wQOz8RAoXjDmpKzYOA
         03FDFUUbpt0veeqLTOR2Q9vQL/y9POF2uSomcc2x59l+DS05MRI1xGigDS+f4lTQhie3
         GNCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7XS/gUo5tPF0DFmXwmWp0JfdjOkG6AaZjTIMumF5o5huqqazlyNrb/vUbOyn8FkAQLyTjyH2JFrR0pq0PvRWf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzpq6Fy/fLDkLeytTSMJOfGBHFtnZ071SsXFE63sWL+8QDWGFn
	6zLtG8AOdkdlkAh8SDkKkWRxpBXyXS4nW7J16rOuE2Js+Usp5A1vLFrmxRSf5jFwOuo=
X-Gm-Gg: Acq92OGn7CqKGYjMwNWq1HrfdzSyn7VXhrwf0Fcrv2RpGHQAJ5EzfprGMXa++/u0b5s
	tQoTeOk2pKqMknnAnmOtAEdHZbvwhowohG8BDeCk1xFeNlr2Wv2zlWCgqheK7r6UFiNR83nEQrP
	itxyeCk/ZGsxAP6W0MVEpr4vIIW0cXp+4L7ic6pltGwHI3qyGt2WQG8hstf5qKgvcGZzIR1zJ4x
	41//HHlUUTZKiZuJpfpo3zBYVkUloUrfXHLD6iFFodm2ZXi0B2WEZkF5VNLtw1WTGphpJLVvkTM
	lTQ4as3oVElh5GOFrsVjV6pGDu4p6QceOyGZZUgBZmO1g+PmyMUlEC43B+qmpIzoyps6GNP+ITK
	zgaPQ/6KxpCzUF+knyOqKn06aH+2art2UBeLlZyzvwf46bg/Pngs/GYkYRl0QMMkfP6K4NOhhXC
	zdBuFuI6gPh3PhtQvsEYvHLbdpGzw+uuRNh6STZw==
X-Received: by 2002:a17:90b:3fcb:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a6762cebdmr25100604a91.19.1779893529666;
        Wed, 27 May 2026 07:52:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm19906738a91.9.2026.05.27.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:52:08 -0700 (PDT)
Date: Wed, 27 May 2026 08:52:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, tanmay.shah@amd.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/5] remoteproc: switch exact-match drivers to
 wc-ioremap callbacks
Message-ID: <ahcFFkc2b0Pq9icR@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-3-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-3-ben.levinsky@amd.com>

On Thu, May 14, 2026 at 09:21:26AM -0700, Ben Levinsky wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. This
> covers xlnx_r5_remoteproc, rcar_rproc, st_remoteproc, stm32_rproc,
> imx_rproc, and imx_dsp_rproc.
> 
> Leave the zynqmp R5 TCM callbacks alone because they also clear the
> mapped memory and are therefore not exact matches for the shared
> helpers.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 36 ++++---------------
>  drivers/remoteproc/imx_rproc.c          | 32 ++---------------
>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------
>  drivers/remoteproc/st_remoteproc.c      | 31 ++--------------
>  drivers/remoteproc/stm32_rproc.c        | 34 ++----------------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
>  6 files changed, 18 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 008741af9f11..2d9f14fbef1d 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -644,32 +644,6 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  	mbox_free_channel(priv->rxdb_ch);
>  }
>  
> -static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> -				     struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  /**
>   * imx_dsp_rproc_add_carveout() - request mailbox channels
>   * @priv: private data pointer
> @@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> -					   att->size, da, imx_dsp_rproc_mem_alloc,
> -					   imx_dsp_rproc_mem_release, "dsp_mem");
> +					   att->size, da,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
> +					   "dsp_mem");
>  
>  		if (mem)
>  			rproc_coredump_add_segment(rproc, da, att->size);
> @@ -732,8 +708,8 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					    imx_dsp_rproc_mem_alloc,
> -					    imx_dsp_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
>  		if (!mem)
>  			return -ENOMEM;
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244ac..6249815b54d8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -600,35 +600,6 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	return va;
>  }
>  
> -static int imx_rproc_mem_alloc(struct rproc *rproc,
> -			       struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_rproc_mem_release(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -692,7 +663,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name,
>  					   res.name);
>  		if (!mem)
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index 3c25625f966d..e3121fadd292 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -19,35 +19,6 @@ struct rcar_rproc {
>  	struct reset_control *rst;
>  };
>  
> -static int rcar_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = &rproc->dev;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int rcar_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  		mem = rproc_mem_entry_init(dev, NULL,
>  					   res.start,
>  					   resource_size(&res), da,
> -					   rcar_rproc_mem_alloc,
> -					   rcar_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   res.name);
>  
>  		if (!mem)
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a07edf7217d2..486180cdccb4 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -88,33 +88,6 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_err(dev, "failed to send message via mbox: %d\n", ret);
>  }
>  
> -static int st_rproc_mem_alloc(struct rproc *rproc,
> -			      struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int st_rproc_mem_release(struct rproc *rproc,
> -				struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -138,8 +111,8 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), res.start,
> -						   st_rproc_mem_alloc,
> -						   st_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s",
>  						   strchrnul(res.name, '@') - res.name,
>  						   res.name);
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..7ac8265b60ac 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -113,35 +113,6 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
>  	return -EINVAL;
>  }
>  
> -static int stm32_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
> -	va = (__force void *)ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int stm32_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap((__force __iomem void *)mem->va);
> -
> -	return 0;
> -}
> -
>  static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
>  					      struct stm32_rproc *ddata)
>  {
> @@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), da,
> -						   stm32_rproc_mem_alloc,
> -						   stm32_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s", strchrnul(res.name, '@') - res.name,
>  						   res.name);
>  			if (mem)
> @@ -957,4 +928,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
>  MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
>  MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
>  MODULE_LICENSE("GPL v2");
> -

Spurious change.

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..e5d1903c9636 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -447,45 +447,6 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_mem_region_map()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem descriptor to map reserved memory-regions
> - *
> - * Callback to map va for memory-region's carveout.
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_mem_region_map(struct rproc *rproc,
> -				    struct rproc_mem_entry *mem)
> -{
> -	void __iomem *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va))
> -		return -ENOMEM;
> -
> -	mem->va = (void *)va;
> -
> -	return 0;
> -}
> -
> -/*
> - * zynqmp_r5_rproc_mem_unmap
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem entry to unmap
> - *
> - * Unmap memory-region carveout
> - *
> - * return: always returns 0
> - */
> -static int zynqmp_r5_mem_region_unmap(struct rproc *rproc,
> -				      struct rproc_mem_entry *mem)
> -{
> -	iounmap((void __iomem *)mem->va);
> -	return 0;
> -}
> -
>  /*
>   * add_mem_regions_carveout()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -522,8 +483,8 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  							 (dma_addr_t)res.start,
>  							 resource_size(&res), res.start,
> -							 zynqmp_r5_mem_region_map,
> -							 zynqmp_r5_mem_region_unmap,
> +							 rproc_mem_entry_ioremap_wc,
> +							 rproc_mem_entry_iounmap,
>  							 "%.*s",
>  							 strchrnul(res.name, '@') - res.name,
>  							 res.name);
> @@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
>  		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  						 dma_addr,
>  						 len, da,
> -						 zynqmp_r5_mem_region_map,
> -						 zynqmp_r5_mem_region_unmap,
> +						 rproc_mem_entry_ioremap_wc,
> +						 rproc_mem_entry_iounmap,
>  						 sram->sram_res.name);
>  		if (!rproc_mem) {
>  			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
> -- 
> 2.34.1
> 
