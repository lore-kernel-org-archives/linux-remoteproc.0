Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F39311968
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235284; cv=none; b=gAePZRt4aYDsFAntmajIi9bEhHIM1aHI9K9FzRp/KWhqDtbJbKGEeAYq86dReUfTXg2HFldADikEkStAMfpXT1KB4zdMgBlCvq69F2KICAFYqkhAsXb5Rc1N3Vu9ZGQQyfXCXHSafljbsmL9kw++6EjQX2B1+/HGf4iNYlhgcIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235284; c=relaxed/simple;
	bh=+phoKe1Zhp9F6a7ic43ra5LbUagn+hfIVxxKzBTfmdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMWfvRgaRNZ9E7If91J+itG6i3HCxRAwLPmV9LdPJKPWzpT5yLGlFgLlLVsgz8wsPDiewwROexFqCCdsXWXAviJ1XB4etqlMr0q5tkIngNC3BOWXUnutJeRkaddT7kAZ+kcE56H7A9B2AVH62LwrLoxEQYf8NFq5AzjFVi0KVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4IaCvnY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4IaCvnY"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf1cda2b17so781945ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782235282; x=1782840082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOHqWIE7DXXEQCPB3d/HpjT74nQL9GCMig6xnM0nZ/U=;
        b=I4IaCvnYGpwqP83WhSjR/qt7WpEJ680K3Wr08v27dfaGlfVXOx7AXbyiUDF0ojyV47
         IwwB+ZE19MjjIEfFVLmnHLG7m2GdIjsHuP4G5R4GrE/epAd/lVGAm3kFpFJE8do6z1gd
         3MGuTwp3qUlur/9UGAO+T4aTP4bI5qnwTiECSROGFetI2LUZlnHDvmJ5pseU0bJUa+hW
         UfwwT1boirHWpXdjfkJxhvJOmOkSX1C2/xMZqgezEd6phnevQoJ9jIJDmnevdmA5sa3L
         4MLRWN2xHAIoYnmE7y9trND3KUXlhcxsP7B+YWY10WPGlisgyFC4UTX1pR8Q3xsgdb14
         YgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235282; x=1782840082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOHqWIE7DXXEQCPB3d/HpjT74nQL9GCMig6xnM0nZ/U=;
        b=IvEkb+aD1xOyVa94uKmn0jhlFYrz+zt58Dg/6cqo9g16EfdrucAyZJ12ogjw5QbOTn
         lbdrzz5IE1rnDgxlEJtIXpyi9qbQo/vbWzCc00h6CIW/xs7qU2xbAeL4tYRpwntRGICy
         wu2vdlUU+ku59eEpafzXKfwnyruCCPIrZcwtd8sN1G8iIR+kQPJuqIOzoS3aLiWLJMCm
         Xzv3tAIGgggZt5c1fpr9/AA/mXsYIXypihiIGaFnV4VaQJ1fFhPZBu9aCQUa8WeYpMQ/
         gi5He5YKziRpvMKN+kBSzJr7YQ9zfImD1g1iY+QsmKHvq/6xp/J8Y42x8QKlSDkJqTDh
         oq9w==
X-Forwarded-Encrypted: i=1; AHgh+Rr93WQ0FIOIr1HwR2MkhUYbXdDsKPvBRqRDZ0FKcADYkwK0J+LiRMOFb/DZtQLkshxOzgWTM08iMgdXswAWH5Or@vger.kernel.org
X-Gm-Message-State: AOJu0YxY/fFfQ8bHZdBqCST0ljGb2twzsrv/9/mTdYTnAqreIULYZyeP
	dLB1cQfdx7g67H+X6/zu9Kl8c8j1G+4k6WnBB9ILMDPjFyWEIqzOt6YxuqHOxJm12Dg=
X-Gm-Gg: AfdE7ckNl7zUyNkDTbBQhFLu2oPwm4EopZdXybFOEmrNXWEmEYDMSy0uLuL3Ke5bLyW
	lkcpk1aGkSm28KOBtr6ltE8AJIPUMKNu8jN3jIDSQwBgc1v5W2JEZa49WpQPkI5FIL9ZamzEFds
	0VXVTrjzkV+0yOB2nTO6+lJBG+5kYoBYKTjvK1jchi/HeI97QcZ0fQgy8S1SKtPVtSNKAfU+tm4
	zeSSbgBNoNAV/YECDNgBVGqi58YGP7GUyHU2hDThJjxnf5L++NlvDDEgbkHI05suGieclI0SQMz
	sT9PYrCBjAScg0B1BxOt+5h++MOII+vEUFF19uapYPLjLKBpAbRMp1ihSWL4a7YkVL+IYVDGFNp
	LM+ftCAHG5TABEB7+epor7Sbe/S149k/WcTApectCFRxsmzUA4Ii37ajhq0VAe6Phpw2SnFnlx9
	fiDECA2Vicfrx7j2s/
X-Received: by 2002:a17:902:d549:b0:2c7:c63a:2d69 with SMTP id d9443c01a7336-2c7c63a2ed4mr33756515ad.15.1782235282346;
        Tue, 23 Jun 2026 10:21:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:864a:82f7:7789:bd1a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f90d4sm107525595ad.34.2026.06.23.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:21:21 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:21:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: michal.simek@amd.com, andersson@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
Message-ID: <ajrAj2qfjvogDDrP@p14s>
References: <20260619163854.410392-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619163854.410392-1-tanmay.shah@amd.com>

On Fri, Jun 19, 2026 at 09:38:54AM -0700, Tanmay Shah wrote:
> Current _start and _stop ops are implemented using various APIs from the
> platform management firmware driver. Instead provide respective RPU
> start and stop API in the firmware driver and move the logic to interact
> with the PM firmware in the firmware driver. The remoteproc driver doesn't
> need to know actual logic, but only the final result i.e. RPU start/stop
> was success or not. This refactor keeps the remoteproc driver simple and
> moves firmware interaction logic to the firmware driver.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>  3 files changed, 110 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index af838b2dc327..f9a3a95b0638 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
>  }
>  EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>  
> +/**
> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on SoC
> + *
> + * @node: power-domains id of the core
> + * @bootaddr: Boot address of elf
> + *
> + * Return: status, either success or error+reason
> + */
> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> +{
> +	enum rpu_boot_mem bootmem;
> +	int ret;
> +
> +	/*
> +	 * The exception vector pointers (EVP) refer to the base-address of
> +	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> +	 * starts at the base-address and subsequent vectors are on 4-byte
> +	 * boundaries.
> +	 *
> +	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> +	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
> +	 *
> +	 * Usually firmware will put Exception vectors at LOVEC.
> +	 *
> +	 * It is not recommend that you change the exception vector.
> +	 * Changing the EVP to HIVEC will result in increased interrupt latency
> +	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
> +	 * is non-secured, then the Cortex-R5F processor cannot access the
> +	 * HIVEC exception vectors in the OCM.
> +	 */
> +	bootmem = (bootaddr >= 0xFFFC0000) ?
> +		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> +
> +	pr_debug("RPU boot addr 0x%llx from %s.", bootaddr,
> +		 bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> +
> +	/* Request node before starting RPU core if new version of API is supported */
> +	if (zynqmp_pm_feature(PM_REQUEST_NODE) > PM_API_VERSION_1) {
> +		ret = zynqmp_pm_request_node(node,
> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +		if (ret < 0) {
> +			pr_err("failed to request 0x%x", node);
> +			return ret;
> +		}
> +	}
> +
> +	ret = zynqmp_pm_request_wake(node, true,
> +				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +	if (ret)
> +		pr_err("failed to start RPU = 0x%x\n", node);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_start_rpu);
> +
> +/**
> + * zynqmp_pm_stop_rpu - Stop Real-time Processing Unit (Cortex-R) on SoC
> + *
> + * @node: power-domains id of the core
> + *
> + * Return: status, either success or error+reason
> + */
> +int zynqmp_pm_stop_rpu(const u32 node)
> +{
> +	int ret;
> +
> +	/* Use release node API to stop core if new version of API is supported */
> +	if (zynqmp_pm_feature(PM_RELEASE_NODE) > PM_API_VERSION_1) {
> +		ret = zynqmp_pm_release_node(node);
> +		if (ret)
> +			pr_err("failed to stop remoteproc RPU %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check expected version of EEMI call before calling it. This avoids
> +	 * any error or warning prints from firmware as it is expected that fw
> +	 * doesn't support it.
> +	 */
> +	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != PM_API_VERSION_1) {
> +		pr_debug("EEMI interface %d ver 1 not supported\n",
> +			 PM_FORCE_POWERDOWN);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* maintain force pwr down for backward compatibility */
> +	ret = zynqmp_pm_force_pwrdwn(node, ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +	if (ret)
> +		pr_err("core force power down failed\n");
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_stop_rpu);
> +
>  /**
>   * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
>   * @node:		Node ID of the slave
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 3349d1877751..dcd8a93f031c 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -364,49 +364,12 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>  static int zynqmp_r5_rproc_start(struct rproc *rproc)
>  {
>  	struct zynqmp_r5_core *r5_core = rproc->priv;
> -	enum rpu_boot_mem bootmem;
>  	int ret;
>  
> -	/*
> -	 * The exception vector pointers (EVP) refer to the base-address of
> -	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> -	 * starts at the base-address and subsequent vectors are on 4-byte
> -	 * boundaries.
> -	 *
> -	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> -	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
> -	 *
> -	 * Usually firmware will put Exception vectors at LOVEC.
> -	 *
> -	 * It is not recommend that you change the exception vector.
> -	 * Changing the EVP to HIVEC will result in increased interrupt latency
> -	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
> -	 * is non-secured, then the Cortex-R5F processor cannot access the
> -	 * HIVEC exception vectors in the OCM.
> -	 */
> -	bootmem = (rproc->bootaddr >= 0xFFFC0000) ?
> -		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> -
> -	dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
> -		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> -
> -	/* Request node before starting RPU core if new version of API is supported */
> -	if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
> -		ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
> -					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> -					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> -		if (ret < 0) {
> -			dev_err(r5_core->dev, "failed to request 0x%x",
> -				r5_core->pm_domain_id);
> -			return ret;
> -		}
> -	}
> -
> -	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
> -				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +	ret = zynqmp_pm_start_rpu(r5_core->pm_domain_id, rproc->bootaddr);
>  	if (ret)
> -		dev_err(r5_core->dev,
> -			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
> +		dev_err(&rproc->dev, "failed to start RPU\n");
> +
>  	return ret;
>  }
>  
> @@ -423,30 +386,9 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	struct zynqmp_r5_core *r5_core = rproc->priv;
>  	int ret;
>  
> -	/* Use release node API to stop core if new version of API is supported */
> -	if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
> -		ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
> -		if (ret)
> -			dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> -		return ret;
> -	}
> -
> -	/*
> -	 * Check expected version of EEMI call before calling it. This avoids
> -	 * any error or warning prints from firmware as it is expected that fw
> -	 * doesn't support it.
> -	 */
> -	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
> -		dev_dbg(r5_core->dev, "EEMI interface %d ver 1 not supported\n",
> -			PM_FORCE_POWERDOWN);
> -		return -EOPNOTSUPP;
> -	}
> -
> -	/* maintain force pwr down for backward compatibility */
> -	ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
> -				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +	ret = zynqmp_pm_stop_rpu(r5_core->pm_domain_id);
>  	if (ret)
> -		dev_err(r5_core->dev, "core force power down failed\n");
> +		dev_err(&rproc->dev, "failed to stop RPU\n");
>  
>  	return ret;
>  }
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 7e27b0f7bf7e..347df66ee176 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -644,6 +644,8 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  			      u32 *const requirements, u32 *const usage);
>  int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
>  				  u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr);
> +int zynqmp_pm_stop_rpu(const u32 node);
>  int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>  int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>  			     u32 value);
> @@ -960,6 +962,16 @@ static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const statu
>  	return -ENODEV;
>  }
>  
> +static inline int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int zynqmp_pm_stop_rpu(const u32 node)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int zynqmp_pm_set_sd_config(u32 node,
>  					  enum pm_sd_config_type config,
>  					  u32 value)
> 
> base-commit: 721396afea31eac476d88f5db10ba111ba4b8382
> -- 
> 2.34.1
> 
