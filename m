Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1161BC9F6
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612335; cv=none; b=ls78TJ1+KykBwiQXkD1kbhj0Kkkgpa+0gdzTwPb5P9Joe4HJuNJP+8wRY9XkN+3RWorBL3Iexs7L01tNdK2pi9cL2qiqqCPSm6qtKcpbpBLOnrwbw11dUZ7Qb058Twj+41ZprdwPnbmA2BG0w7SXKLz4O1/t+TSvEefWAbnM9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612335; c=relaxed/simple;
	bh=kHo8sIuxFbLHSYOFK7SARA0PAdoM4GLl0qg3icRE4OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNr6t+1eEw59qeP35HW+haFmwWVlPJHFjY2WEwFvEsaZN/oau+j/OBW/0LTy6HJE4ItbJM79ZyxF5b+IXEtd5lYrkyhEfFz43mWlh+RSrBYpT1PI637LJosK4rx0RWKns2LEjf7HKp9J5Fjy+o0Gg+qhxnFBsfoiP5nELG3OgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=md+rt+yX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="md+rt+yX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cdbe608b3so47870115ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612333; x=1730217133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8AkVLCCPZxZ1fApkqmTMKj62SttuuqmnYfplcOKZMck=;
        b=md+rt+yXSRHE2x4e3VUG7e+34RmZf8f5VlTgsj8Mrv8EZEwy7u1RA98q1jbLSlnll4
         i/EuMWD1qcQ6YMPXGRVMLtSHKUC1FPGqME4CaIL3U+LpqRtCiophIrOmBXQ9QNk1Jn83
         71ZPGfxN4tX66DCDVRM5eVWWpxrvY/j/XvUxO1SL2r1LlYQAQSaLOMVrZYDgjtIzhyEt
         JBVAs2P454crlDW4RHhMpncYBJ3y9zCYp77MAUs+hHPoNfJ+4f7WEyPkoMJcSeBU/xLy
         UU8ziMSSy/jWawz8i5GkAKnHlQk+TLr0M49xyIL1e32y/r11Yha/ZUsqA6GITxJIgd1p
         6xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612333; x=1730217133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AkVLCCPZxZ1fApkqmTMKj62SttuuqmnYfplcOKZMck=;
        b=RQ6082MFvfzN34U3W+WHYoDAKT42iR3qRSx23Xsovgf8Q+KBB3dDvDgoeeSaNuCkG7
         9O8ax8SReu6YJCWxwETrufzjmrys1SiFgQhz674fI90DqNHAcsjXcAlS4+G8FhG0kBRl
         pdw90kbrMyegYoh0EE71uTxDDhzaToiR44pFXVSwhGeh4v/tXB3jY4Kpz9YyXKncF5to
         cwvt58kRIUB3HW2XsoCmGFPQ5heQPJzgZYtqSZLGwb6QgsU+mOwkvRkmOpxYWCOT2Pff
         RJtoZT3wyW/IwARdR/h+B7HQDrUhTFi3I9CHQjyMhlgasQvC9MgoR5ZYjSa1Sb/aY0ho
         OMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg4WtPYockKGecR3LICxiSg7YcsA+pI5z7nTY/psKOItjXy+xTlRlISRjkTrzLxv2BCtv8y/h6+Nr4z7QcAPCW@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOoU3G0kSyVY+gp4CzEXd0AFWVo45WI2rT54gdVC9HPe7v7J4
	GPsokrcMXFOE6UZ46+tYuEK4DXBoIKjhAPuDjLCwPH+5JYAFyBNstoZS2bugV64=
X-Google-Smtp-Source: AGHT+IEsN3+xGI76q2s1diRf4iXLrreaf3Jeckwsh5L0/TmOy3pREL6E0A6kjoW8nKAID3UtRLL8+w==
X-Received: by 2002:a17:903:1cc:b0:20c:c880:c3b0 with SMTP id d9443c01a7336-20e948aefd1mr44835425ad.21.1729612332913;
        Tue, 22 Oct 2024 08:52:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:567b:4c87:a9aa:a404])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0c5e4sm44510525ad.97.2024.10.22.08.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:52:12 -0700 (PDT)
Date: Tue, 22 Oct 2024 09:52:09 -0600
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
Subject: Re: [PATCH v11 7/7] remoteproc: stm32: Add support of an OP-TEE TA
 to load the firmware
Message-ID: <ZxfKKe5C/O16x+J4@p14s>
References: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
 <20241009080108.4170320-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009080108.4170320-8-arnaud.pouliquen@foss.st.com>

On Wed, Oct 09, 2024 at 10:01:08AM +0200, Arnaud Pouliquen wrote:
> The new TEE remoteproc driver is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> updates vs v9 revision:
> - rename tee_interface to tee_rproc_itf
> - in stm32_rproc_probe(), test and use rproc->tee_rproc_itf instead of
>   trproc in the tee_rproc_unregister() call
> - initialize release_fw ops
> ---
>  drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 288bd70c7861..cb7093de41df 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> @@ -255,6 +256,19 @@ static int stm32_rproc_release(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> +{
> +	int err;
> +
> +	stm32_rproc_request_shutdown(rproc);
> +
> +	err = tee_rproc_stop(rproc);
> +	if (err)
> +		return err;
> +
> +	return stm32_rproc_release(rproc);
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -691,8 +705,20 @@ static const struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> +static const struct rproc_ops st_rproc_tee_ops = {
> +	.prepare	= stm32_rproc_prepare,
> +	.start		= tee_rproc_start,
> +	.stop		= stm32_rproc_tee_stop,
> +	.kick		= stm32_rproc_kick,
> +	.load		= tee_rproc_load_fw,
> +	.parse_fw	= tee_rproc_parse_fw,
> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> +	.release_fw	= tee_rproc_release_fw,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
>  	{ .compatible = "st,stm32mp1-m4" },
> +	{ .compatible = "st,stm32mp1-m4-tee" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -851,17 +877,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;

The cleaner this patchset get, the more obvious it is (at least to me) that
struct tee_rproc needs to be changed to struct rproc_tee.  Otherwise I keep
wondering if this is coming from the TEE subsystem or the remoteproc subsystem.

>  	struct rproc *rproc;
>  	unsigned int state;
> +	u32 proc_id;
>  	int ret;
>  
>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
>  
> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> -	if (!rproc)
> -		return -ENOMEM;
> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> +		/*
> +		 * Delegate the firmware management to the secure context.
> +		 * The firmware loaded has to be signed.
> +		 */
> +		ret = of_property_read_u32(np, "st,proc-id", &proc_id);
> +		if (ret) {
> +			dev_err(dev, "failed to read st,rproc-id property\n");
> +			return ret;
> +		}
> +
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +
> +		trproc = tee_rproc_register(dev, rproc, proc_id);

This should return an integer rather than a struct tee_rproc * since the latter
is available through rproc->tee_rproc_itf.

In line with my comment above, this should be changed to rproc_tee_register()
since it belongs to the remoteproc subsystem.  Before when I asked for
tee_remoteproc.c to be changed to remoteproc_tee.c, I thought we could get by
without changing the inside but now I think it is clear that we can't - this
needs to be addressed.  

> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);

                        return dev_err_probe(...);
> +		}
> +	} else {
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +	}
>  
>  	ddata = rproc->priv;
>  
> @@ -913,6 +964,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_rproc_itf)
> +		tee_rproc_unregister(rproc->tee_rproc_itf);
> +

If I read Bjorn's comment properly, this should probably be:

                rproc_tee_unregister(rproc);

with the if() inside the function.

>  	return ret;
>  }
>  
> @@ -933,6 +987,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_rproc_itf)
> +		tee_rproc_unregister(rproc->tee_rproc_itf);
> +

Same here.

I am done reviewing this set.

Thanks,
Mathieu

>  }
>  
>  static int stm32_rproc_suspend(struct device *dev)
> -- 
> 2.25.1
> 
