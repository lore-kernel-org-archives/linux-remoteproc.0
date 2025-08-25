Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEBC16D4EF
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 Aug 2025 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141312; cv=none; b=kUuZLX/hFutNm4SfuOAx79xIFIMp7bUWzc2mCFC9o5WFlzTHs3aTXvhken2oLX0qXqM+zYt4zexNYyWzF/1MBgBRGCnwJNm56APS9kp5rSiwZFqgk4Ycwod9LwC6ApbsCj58SgIV3Kwv8KklEB0paIEAUMZRy21YkujhJLA1p/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141312; c=relaxed/simple;
	bh=JbjaUCNNq59pUE+ugocXnVw1t4DerBdPv3Lw3ndbspo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG/B21c8LrhRwc3TyYNWu9DqiT1P9ffZKjCq09X3GS/yfeZnI9umCtwgVBc2rGAACj6nXoErtH9nuMOEPe24BIblNk8TpoZh8TeifoP9lC57aZhkJjwA3AKom2xPZkzPDWvV1O5+oNngHkYC5xkd2o9Ve007KCYIzj2wQLvVs3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y38Tenu3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y38Tenu3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24622df0d95so25690135ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Aug 2025 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756141309; x=1756746109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ak9l7Fg6l2LvYXRcTPen8iTILFfM1AH3OjnsIesU9Y=;
        b=y38Tenu3MfLAuUPkGKFXnrPQizsR3bfefu1w3R2+1q1d7vF2zH44jeR2ryhRNNoxcz
         MR/5UilkcdQJ/6y/Qn+XknyIN+iKw9+BZYVBPKKwMI888SFlyxFiepazbHvR0wW+/Yun
         +NPd8nCXf9Isr3m6GaoOhLfySM+52kA3xaYnp31oP4JrUUJD9WEUuSn5/OBNAOdZ7QFG
         dPfS9IbKjgJj/nbA+eF8iJuSyCZwhAwEC3QdUd44vNdpGqxqbf9qMIMI2bjARTdtt6Cj
         ej6ewAjeLMOiKMc2yCSimZniwnVV5AbXu6dhA4opByKsyXgZWNqmwrdeU1ge1rgvgZLt
         /BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141309; x=1756746109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ak9l7Fg6l2LvYXRcTPen8iTILFfM1AH3OjnsIesU9Y=;
        b=kA5csRonZWN6S45p2O9oHSwLA1A7lVxreTxG/urDxZwsMLfNdxIQWUxoEWsBBk6fg3
         R4NO1tLF/oSPPNvNAMuBXcCVaN3lnw/0mfOhO5kxb1cc5mZQSK1nqMRS11dyujlLEdPo
         RlPYZtNckLljvYFL3jB/HKjrURLn4kVHxobLdM+b3mSIbf8uWCiO33guRVcZG2WII5su
         +c9r6dMV+Cjb+uWPpNunloEPWsWAYn9Gd043R0byyYTJndizS2fmFq9xl0MbTGZY5UJH
         DfQDewFXUjalwqcEAgGsdHWqZcCQEg6nyHxZ1VcWBRhRTDJvmj1upAC6YmQE8fItUsT1
         Yntg==
X-Forwarded-Encrypted: i=1; AJvYcCVnUPMSHYe0Uh6savo4dpWR0sVLf7saHfwzuOsJOVFZHFB0m0/z4+Ea3aSGWfAkiVtvhO9ofjBBTChKw794H+zV@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJx4LhxeRBHb5drnI8e/jCMD0EOTU1IS/zx3fGrof/p+0IBF3
	AjnaVPcWjtB+4Xn+GCIkiFVRscWlZ69k/SRxBKjV1Ly9kw+1F7y1Dx//13sssJWgqrY=
X-Gm-Gg: ASbGnctSxS6anZvG/fkbGkWg9MRXrDhDVS/MmodctLtybeINnKNEZZPf2iOmr95CBQq
	BtaRZsoI2RbHr3zYADB8EPzZfzxIV6xHG4dm8OzBsuAp1/fPS3zCgoLUOtn40UQUd9Vp1c8d9nQ
	D+Zdb2hnzzfjvBGvsUna0xq9At/W+oomCj2oMfMkcQmrjtd6GhovGMUfPOkNFo1IaANKBY9nKBK
	2ZMncgzougc+FYoGAbCl2Yq+3LJJOa9fU8w9lDCn1r+8nmG6qEd7WtaUbD0MeWloq7SE3TAIwmd
	iczxiWUsNn9JYm5pcH+d+HIv+ZQUFx5Yf/nM9Dnw8xItljV03edLIanyIsztyCJ61wLFvPOpJpn
	J34JIbvEH5nrY5ZqBJ1IdCli4vDp4QRXsyRFKNitvtkGPMgwzOHQp1RA04fmYSErfSOI0TvFZGf
	ssaKuA5wCXI9kbLCXXg1P9plSf
X-Google-Smtp-Source: AGHT+IE1SxCcVPjQEknO8iyQnbOBTN5XYqsMYCNx0q4628NZu3zWYavkSuR+TiKqhP2rTdODkzX2FA==
X-Received: by 2002:a17:902:ce01:b0:245:fd33:5b16 with SMTP id d9443c01a7336-2462ef1f2f6mr178350195ad.36.1756141309478;
        Mon, 25 Aug 2025 10:01:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f3a7:cbcf:8fdd:91a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466878152esm73702815ad.12.2025.08.25.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:01:48 -0700 (PDT)
Date: Mon, 25 Aug 2025 11:01:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: da8xx: Use devm_rproc_alloc() helper
Message-ID: <aKyW-oMAZR791GF2@p14s>
References: <20250814135532.638040-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135532.638040-1-afd@ti.com>

On Thu, Aug 14, 2025 at 08:55:30AM -0500, Andrew Davis wrote:
> Use the device lifecycle managed allocation function. This helps prevent
> mistakes like freeing out of order in cleanup functions and forgetting to
> free on error paths.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>

Applied.
 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 93031f0867d10..47df21bea5254 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -276,8 +276,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
>  	}
>  
> -	rproc = rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
> -		sizeof(*drproc));
> +	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
> +				 sizeof(*drproc));
>  	if (!rproc) {
>  		ret = -ENOMEM;
>  		goto free_mem;
> @@ -294,7 +294,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  
>  	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
>  	if (ret)
> -		goto free_rproc;
> +		goto free_mem;
>  
>  	platform_set_drvdata(pdev, rproc);
>  
> @@ -304,7 +304,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  					rproc);
>  	if (ret) {
>  		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
> -		goto free_rproc;
> +		goto free_mem;
>  	}
>  
>  	/*
> @@ -314,7 +314,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	 */
>  	ret = reset_control_assert(dsp_reset);
>  	if (ret)
> -		goto free_rproc;
> +		goto free_mem;
>  
>  	drproc->chipsig = chipsig;
>  	drproc->bootreg = bootreg;
> @@ -325,13 +325,11 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed: %d\n", ret);
> -		goto free_rproc;
> +		goto free_mem;
>  	}
>  
>  	return 0;
>  
> -free_rproc:
> -	rproc_free(rproc);
>  free_mem:
>  	if (dev->of_node)
>  		of_reserved_mem_device_release(dev);
> @@ -352,7 +350,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
>  	disable_irq(drproc->irq);
>  
>  	rproc_del(rproc);
> -	rproc_free(rproc);
>  	if (dev->of_node)
>  		of_reserved_mem_device_release(dev);
>  }
> -- 
> 2.39.2
> 
