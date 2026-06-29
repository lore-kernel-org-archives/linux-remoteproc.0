Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C643D4E8
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747848; cv=none; b=BOJIbI9rqteYEP1ROLzAzuzSOtbk0AulAtwozporndG4pE+SFbm1UX1iOlgofnN14jp1iejn55iTIiWTvmrKGWIg/hed+gmPC+ubNI+BQLcrcTGHGsONcie4FKjLNeJs9Yyan15JAXSbZmtsA0Ck1fecnkBI9SWRSVOvbtBPDjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747848; c=relaxed/simple;
	bh=Q0as83+wI/lRVx+6dY3cdeBI6r8k7oIuik7EKF4V+t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nveWL4Yj/WWOp9Yy3aCrOrVauBHeUFg/KnbUgpWA0kdE7ZYSB9uLhVND1OxPYJ44IUsNADq8FybJGfMM/KVMC7mlKMK9Ntfj0dg2ubqhW2jzdyRMQyD82CkHi/aV+59vVXnFT1V7H9JDY9saqGJXtVZBlZ5DeaqUIRJ184lCMTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wimTxrfP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wimTxrfP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847921eed4aso722299b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782747845; x=1783352645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QPyQU6+yuB09FuIkfFeAr4jLXLJolnakzFOl2Nr96m8=;
        b=wimTxrfPgIduEPKqNvpuRCQCqONdUMjlnjnMjyN25tF+g3sOXQDmI4kbCFxMc0rPyH
         4sDtHu3JSCPvBUrOKXwNpxS696KwrBKzU+mWw4iMzU0Mcjg2Dg5Uo0I4Qa10kbiDtcre
         Q64u+EEVF5cn20Cdpza4x5Nrl+DSD3tNeG97twx7nO75xwG9T+sR/OttnU7krHz/hovx
         nrjqKN2jbCE3GOWFRXkCjQpb7ypyvCTB5TjaEV1lUtGjKPvb7NOmHGCyu6DJqPCjCKjr
         gi6Ogo7MYfmr5x+4LWjwLAMihFa6lWoZ1n4KUHz/TTsLDT/S2PgEGMaN8h1HBgGI+h60
         3vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747845; x=1783352645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPyQU6+yuB09FuIkfFeAr4jLXLJolnakzFOl2Nr96m8=;
        b=bjqL6nfuux4lXviuYodWzKwn3U4dW7X+eq/3bb5O9kQSsm1vb/gr1LgiRgRY+75B7I
         +HbUB+pzRjxQ0MHXydLS44VWdw9ok3240j9ZEoRGMF6VX3vPeWPk+PF6waE5IpgjkMsp
         rKR9J/mxBhJubuczXLchojQR6vg4a4qRFTiDCU8VNKrDLvlojBAuF192j5hqIdcJbIrh
         R8UXIN88ETKcXZBmpeYD6bEk6HKee4ATgI6QFVSiYapQGEl5MPdkUoOSbcpyuLZCDALP
         g5f0ZP7DMcLfdyj3hmilhR/g0bEXS9llZRyG5BzFMRC1nnu5cHgtQNF57p/DIPMwes6K
         9mXA==
X-Forwarded-Encrypted: i=1; AHgh+RpRAD4g/jjRNCNls5vFePaZV6ASzm1DU/pXf/cf7szhgR/NdC2fftTsd/eJhhClxacEJCwjz9vaM/jkK5MEDdt8@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHSX50D4i/P66QkAKDj86BbnHUfH16gYXrVIpeXZWxkE2OQ8L
	JLGlwkdowttfrxrlhYmRlEG/D0XOr/mf5LBZ4BR7MRp5pp4pxkvuX5p/i+UqP8y0Shw=
X-Gm-Gg: AfdE7cnw6JCecWq8jGJkTfG3LJ6NHnPMqmbHRv5imvRY7HHXZMaPalSX/FIxREQh727
	z07C3Ll/Hc9I1GShtUcX12Q1ZJXR6+5fmjUBO0i1qxOoEFhQ1MWW3g+F5/8Pkxe9Yv78kbwkrYd
	jgllZQFQBKDDdN5YyojPz9UtAiQPr964Y1pVGvFwlxTWxVSn7dgax+8jZGLTquc2a4W3QiIfWYF
	TZr6sybyR4qQE6f/O60KEgNSfH+MXm9HduIRZM1dcUB+WInNCRL0zSPdnyRdSF1RxH74MtbW8Ud
	duk5SYfn77mP1WH9LolsiBc1kmxZylFSckZ09v8Pi3qSqdoS7l5oMjroHb4zr2RKibIFZmCPf+L
	jM1U88oz1PluQNiS5lc+nvE+pqVcMT7LcIFHEMz/7Ko6Bu649pmuBnXraK14PoflcRpS3LLaCYg
	+rzwY4zSd2vZHJa1HGSM11nxbzoS4=
X-Received: by 2002:a05:6a00:1a86:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8479eeb6872mr89527b3a.9.1782747844789;
        Mon, 29 Jun 2026 08:44:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbcd9f5acsm73446a12.10.2026.06.29.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:44:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:44:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: michal.simek@amd.com, andersson@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
Message-ID: <akKSwrbbkFxNIiXu@p14s>
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
>  include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>  3 files changed, 110 insertions(+), 63 deletions(-)
>

Applied.

Thanks,
Mathieu
 
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
