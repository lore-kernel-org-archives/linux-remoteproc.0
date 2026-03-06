Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58347DF9C
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817597; cv=none; b=BjtXKr+tLOZf1h+Nb6YuaHcpkIKiemt0oTFEL/AtpF15T2DFcPNleCSAzdERC9zFVV99fxeXDTKC+kRFEIlVPImUSHg/zKARPJcxYsaruQQa3ElCJgz5zNHDhalvs1Q331Gxwzt0Ktw1BIkVkc0JskwdUngwX2GyqFvLZiN0RiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817597; c=relaxed/simple;
	bh=2j42ASgQuUcDy6NgGPRY+GFusXmJMuTDHZ0l9H+pHJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2UUow24jUGtt/+ggJ6okIinE000i2dcvdUL0dWj68nYExryODrwogmIQ6rNaXUisSLNbtxe3C45R8PaWmWud/5862THibfhdgy4dqqwJz07iPdDYY6xvjqkO7Wwf+VymY2CpAQ2Oox1pl+BEukSiAq4cWqGDjkJnyBkaAt/wmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBH8fArG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBH8fArG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae41544dcfso72318935ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 09:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772817596; x=1773422396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5G2qfETfWaIeiwx7pdqCEdMtKTIzwBzgEQJjAbiAxY8=;
        b=JBH8fArGwUEdSEsxMdndPOxvUuqmbdtZ2id2efdOl4o9UDpigJj9zO+h2w30bpzt0H
         6P54fQMAjoQBgD2oTT6skGtlzYMUIi+dxt6RNkJWs4dDIATxuL4g5uoI/hEIPDT33VNl
         IfA8JV2oRjfsg3CPytLj6Jza/IRIuHaOgTWHDfMvNo7CLkZ3IhArKNSPl7frQCbU3qKQ
         77K8bg+7FB5DRojALrNBgXOs0bktrjBAiV2vZ7qu7db1CGINSJcAr3YC+mF7+vhMcr2/
         /8YaZkljpWTAEFT9cojdFD6kpvy66o7KFuN8dbiJjyYkzLosGmdFIG7ysyOJW5v19os7
         tGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817596; x=1773422396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G2qfETfWaIeiwx7pdqCEdMtKTIzwBzgEQJjAbiAxY8=;
        b=AXTH52bSO4jITthp+aQNDGY9R6IenniDUSRdYoCouiVZ4h2rJaQVUUuQXGyrJbQ9NP
         yqoY18BBNvnV6HYmvdgOESV0/DUgMzborVvFTOnmIQs+6pQ65Dwh1woMN2GiImfKiP0b
         RYDz5HD5uUzy88TS/7E6l40qjdoXeoNPVVSdsCkvXua7VunpbLqfEAEU4FQOtvg3VuOc
         Y5t1YgcoF8t74oAMkpFedxgc+kGYfDwRlbc5Q8gF5bQ3TsEUcbTxTUKUDLH4WPEBBkPT
         MUa4/FeIzUgUA+sEoWhbRJ+i39IUViYcDg4/dZxIZaq7MaMzjFNviFLo6V16zO1Tb8vy
         HB7g==
X-Forwarded-Encrypted: i=1; AJvYcCWWJI2mS6Kp/26kr+D4Eqk0YHRbXw4cyVUXkdasZ/pV28yh5w7ZB2c3ElBtObbahDTMe8WmxVnE1LbpR1XWCXJX@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNLRhjloi/WAIeU+3zx7EuPh348Q8genugLdj7ig4r93nCRuw
	gNw0NWBOTSaspsglQl/E4mMQYlOo41iD/O+2UstgOBBl4hF2dAMBZ0y5KDRHp1u5TOYR5dzd9Ug
	tOn+LtDc=
X-Gm-Gg: ATEYQzxICrK4bmeAd3AsKOYYvzBp3sgrZwei8BjoxEPZ+Z+ykygu7Tnqi4qcDsyzsiH
	C0MFL/c8MHAPjMckmNT0sdA5NCv13SFWQNTGxBP9r9dNNLe9/yUS6NAfk7VdYED2fFGRx83DR1Y
	L+Xb4XEXyxrljT/6Jvgp6uypU7LHH0CbVmEnNFwc9Ht2vwfVqj7xH4CjgczcaKVsBHij2Fr/Qlu
	52dZuEVKNr79lLmnycm594crJ8CJDk+aX3RBmTgSAkMTsPs5oea7Qrj3YfcTm6JhyevxMHxZZ04
	uCGrEaKY6Cy8EjmAO2WHopz9Pqd+WWg73vLqTu3GrpurPKjV4dawfzeAY6V/9lbcXxZHYFHqKI1
	i8r+dsBV1nLzIrqf4qlirZwJUdOxmSq0ULN1dHYQPLwyPaNGTx8fZHplZ13qYK8bGJXPgIs82uS
	jJ6/NbN/MUe8joysDo1ofsV9GOWkCbX9wfixnaXw==
X-Received: by 2002:a17:902:c950:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2ae82367a0bmr34730745ad.3.1772817595846;
        Fri, 06 Mar 2026 09:19:55 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:4b1b:60d0:c217:8ee9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7837bsm25214605ad.48.2026.03.06.09.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:19:55 -0800 (PST)
Date: Fri, 6 Mar 2026 10:19:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: keystone: Request IRQs in probe()
Message-ID: <aasMuUHVnyAx3FmS@p14s>
References: <20260302201734.320747-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302201734.320747-1-afd@ti.com>

Good day,

On Mon, Mar 02, 2026 at 02:17:34PM -0600, Andrew Davis wrote:
> IRQs can be registered in probe and only need to be enabled/disabled
> during remoteproc start/stop. This lets us catch IRQ issues early
> and simplify remoteproc start/stop.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/keystone_remoteproc.c | 41 +++++++++---------------
>  1 file changed, 15 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 4d6550b485675..e7fde55097866 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -173,35 +173,16 @@ static int keystone_rproc_start(struct rproc *rproc)
>  
>  	INIT_WORK(&ksproc->workqueue, handle_event);
>  
> -	ret = request_irq(ksproc->irq_ring, keystone_rproc_vring_interrupt, 0,
> -			  dev_name(ksproc->dev), ksproc);
> -	if (ret) {
> -		dev_err(ksproc->dev, "failed to enable vring interrupt, ret = %d\n",
> -			ret);
> -		goto out;
> -	}
> +	enable_irq(ksproc->irq_ring);
> +	enable_irq(ksproc->irq_fault);
>  
> -	ret = request_irq(ksproc->irq_fault, keystone_rproc_exception_interrupt,
> -			  0, dev_name(ksproc->dev), ksproc);
> +	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
>  	if (ret) {
> -		dev_err(ksproc->dev, "failed to enable exception interrupt, ret = %d\n",
> -			ret);
> -		goto free_vring_irq;
> +		flush_work(&ksproc->workqueue);
> +		return ret;
>  	}
>  
> -	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
> -	if (ret)
> -		goto free_exc_irq;
> -
>  	return 0;
> -
> -free_exc_irq:
> -	free_irq(ksproc->irq_fault, ksproc);
> -free_vring_irq:
> -	free_irq(ksproc->irq_ring, ksproc);
> -	flush_work(&ksproc->workqueue);
> -out:
> -	return ret;
>  }
>  
>  /*
> @@ -215,8 +196,8 @@ static int keystone_rproc_stop(struct rproc *rproc)
>  	struct keystone_rproc *ksproc = rproc->priv;
>  
>  	keystone_rproc_dsp_reset(ksproc);
> -	free_irq(ksproc->irq_fault, ksproc);
> -	free_irq(ksproc->irq_ring, ksproc);
> +	disable_irq(ksproc->irq_fault);
> +	disable_irq(ksproc->irq_ring);
>  	flush_work(&ksproc->workqueue);
>  
>  	return 0;
> @@ -427,10 +408,18 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	ksproc->irq_ring = platform_get_irq_byname(pdev, "vring");
>  	if (ksproc->irq_ring < 0)
>  		return ksproc->irq_ring;
> +	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
> +			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
>  
>  	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
>  	if (ksproc->irq_fault < 0)
>  		return ksproc->irq_fault;
> +	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
> +			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);

request_irq() sets irqflags IRQF_COND_ONESHOT, something that is not done here.
Are you sure this is what you want?

Thanks,
Mathieu

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
>  
>  	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
>  	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> -- 
> 2.39.2
> 
