Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A846548F7
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Sep 2024 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726243413; cv=none; b=FWqACdBDPtRFtQT7cAVZH7MqWQlT6uUI+fuKLQaIcNvDqKe8eU9sX6vBe0g+njaBPOFGI9gcPTXf/TFn589FEubXr5AxcSDYJDnxnrYMsWQd9qxG6ryw/XILXC3vrN3+ERjqhJqcBsJV2xJxf8aHPo78ZrWykvW7Yip+9j6V5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726243413; c=relaxed/simple;
	bh=YFd9KMnad5ZFpo0lEMT3590rclKuoUOMyj6EIrium6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HszItxV/YrrcfUBK89zgbLR0lGC/wEKI6h567QtwPREIrT3uJk134/luQZtOXeDp2OtHGQ7tdIxPo4n/k1kvoleCAuQvOuqL17dU0TfS40V8u2kuJlbN+NDtntF8aSpMbe0HOTnERbv5ldH3y8Zpr5DABogaUBKfvup2qYlNylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP8GPkYs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP8GPkYs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20573eb852aso22919845ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Sep 2024 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726243412; x=1726848212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4rJxA46YKftOjieYVN+HBOxnPrXbeWw//Bs8OxUrsg=;
        b=NP8GPkYsT+L3cMfFmCIHuehqG/lSSVYkESVRGsxfI9XypylDYf+dwunGUwLfNRz6J9
         g/XWhC+1neICiCjJJq6D6Csnl0OR0avcpziLPVJDlrp3esFvAljvloNOEUwbGYgvcnMq
         zi5JfMISPIu3MOgVbmj0eMATFqDLv1ZI3Gg/sCvRpczirCDKLl1InvZ2f0FMesJI+OhL
         W64+XKg8vyp/9l65aHNBT9strVgmYPI3IbFQ3UmoXD6UH3ElOx31tAA2r3D3bJk3wv2c
         xnP7d2kwLKJAwYEuBAw1QNQOaaGtX7PfZORSN5+h4daZNoU29hyHqtb2CjW6hdAOsOkv
         UxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243412; x=1726848212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4rJxA46YKftOjieYVN+HBOxnPrXbeWw//Bs8OxUrsg=;
        b=cVAKPgbdhUhgrukAc2+dJTRLVk/sUHphLxcX5NNwvQiE0mNbSQ6tLcZ0mhmRte7mhY
         W5A7ZT65cEBNN3unQ8LUhKzZjv9vDp0n1LuqPJWE1YPDqSrOgy/HNBsHG45T1lInmIXq
         awgE+MId5DtScnbnDyasRzt4Eb+CsTb1vvuD5AURXNzykDeqURJy2+jgrNm+OO0ZN5pn
         uorgk0LcRwZjjTMklcsO2JTTRxPfnbxTOoJzEjkYnJiIqEoQ8ujesvuf+BAaXm253f7V
         Urde96qxZlZ3COdAawH6Gmr84x9h2ZaG90uPXz+ovrEAXVdpBAe2mmohOvwdLw0H2lKH
         /7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX9C8Lx26rZiQDSG6PNg49aduDSgUUBGwclhEB9rdhlr5Z1xXJiCIHhQupDaaSB6ZmwBWJaOV7YNe5Yf1pLCpM1@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQzSjM7I0VmfkwyZkqnobxxCKCvJovuieDoxOwgwudmE7J5WQ
	mLHLQ+X3UaheVhR8DFs2I+yXPx5pz8y2BH4vbBTK3jWIvVIwfQrGRDurJlRdUiE=
X-Google-Smtp-Source: AGHT+IHHG7/l+/CqolXps5oc2mC7BwomTqGBul0o12SUT9T68nYYTvdvziy3yYLjWM7QytKM7qWGwA==
X-Received: by 2002:a17:902:ecc4:b0:207:2093:99bc with SMTP id d9443c01a7336-2076e591765mr96910475ad.14.1726243411549;
        Fri, 13 Sep 2024 09:03:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a6cd:be2b:8e1e:719e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af49293sm29809225ad.96.2024.09.13.09.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 09:03:31 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:03:27 -0600
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
Subject: Re: [PATCH v9 7/7] remoteproc: stm32: Add support of an OP-TEE TA to
 load the firmware
Message-ID: <ZuRiTxDN7+UO42H+@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-8-arnaud.pouliquen@foss.st.com>

On Fri, Aug 30, 2024 at 11:51:47AM +0200, Arnaud Pouliquen wrote:
> The new TEE remoteproc driver is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 79c638936163..400a7a93b1c9 100644
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
> @@ -257,6 +258,19 @@ static int stm32_rproc_release(struct rproc *rproc)
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
> @@ -693,8 +707,20 @@ static const struct rproc_ops st_rproc_ops = {
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
> +
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
>  	{ .compatible = "st,stm32mp1-m4" },
> +	{ .compatible = "st,stm32mp1-m4-tee" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -853,17 +879,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;
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
> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);
> +		}
> +	} else {
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +	}
>  
>  	ddata = rproc->priv;
>  
> @@ -915,6 +966,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (trproc)

        if (rproc->tee_interface)

I am done reviewing this set.

> +		tee_rproc_unregister(trproc);
> +
>  	return ret;
>  }
>  
> @@ -935,6 +989,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_interface)
> +		tee_rproc_unregister(rproc->tee_interface);
> +
>  }
>  
>  static int stm32_rproc_suspend(struct device *dev)
> -- 
> 2.25.1
> 
