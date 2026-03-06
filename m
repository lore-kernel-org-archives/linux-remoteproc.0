Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3644352926
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818489; cv=none; b=bhsKqOiHEB/e6/D8D3E7xxenHw7vHOKxXmG13XN3QFpQ8iEiSPGWn7+qKaf35e3WppjF75KwaufDfRPybCHERQdYKRRbrZah+GyCwfJDeOLK/HOcinvcJm1+Em0Sf13bq/ztdCRXMkb1XsSc8aKGXi9mywQ9eWWGsfVVI+KMTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818489; c=relaxed/simple;
	bh=LIUVnBp5hbFOVSEmSvLbcJixaQOUSFJO5X3jFVJolf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bi4REwIJ+EwIRBEVahDQJLoXyLE8A1XmhGuY4dJ29l4cssEtWgh/QSv2jhIkVaLObjegK9oCUzbe24IoNubYPl+cXhyd8fGoQim+fi8N1v/c0L9xGEMXbh16C0PoJDltn+Oom27Oe7M0W6gwLuXf+2qbCD42JKqoW4djwmfoqZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRJ+zzgy; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRJ+zzgy"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3591cc98871so4263873a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 09:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772818487; x=1773423287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bsHwjpX3svwQqcv4ZOpNtbWOptDgn+RVXMCzx3rQGYM=;
        b=pRJ+zzgyhB5yLzaXpCouPqBxa8EMbpZJWaTm8N1HDz9GMTv1h246Hk0ru4vyIh1rVj
         tVWsSOL9O4tgb0gUS2UiOB8hnndkFvWaJGXCBkYugCnaijL9N/ETzlrPTeayvEshWEiU
         vqNk7SmmSIgJaYjMc3bPU+Wf8MWQVTfAS2ioj9Ust5rKoDs6AzAXT0C9g6GlIxsS0m7P
         Jh6ZDhtwLFKRR82SDMi8lxb4+3r3ulrksFuR3/rfipSeKaFe5ORs4r8UTzJkSDcnDJws
         YxiE7mUm/yQf2Gj/P5o+rbuAY0vvuXJ+aftF/4cNiKHoFxd9423LpPQj1paGy0lok3fd
         mzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772818487; x=1773423287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsHwjpX3svwQqcv4ZOpNtbWOptDgn+RVXMCzx3rQGYM=;
        b=hS34PWi2btQiaemYyfYNCvcfZuClig3Yf5g30wpJlngSjGtNHxsUInrZJOYvnj7nyg
         SgXyvfKqKbnaRQVOXBsk9ILL6QWOD1yBCtpeyt2b8mgty+smHfrSQt4pfDWmk9OAsU1u
         8iz+ty0cnVbDFmXxDJgi9LyVeEnXECi22tKBExj16FxG/EzzZhdyn/U8QjfzjcVOYwCQ
         77MxunGU4JsHtF5WLbwpHaI9vt1giKwX33IjwgqDZAyCsmJmkwfM6VLSjLiQr6B43pQy
         424UrWMHjQzG2dMlFYUYtmGoeB9mDaVjRY/zUX6YHNpKbbfbew2G78QnUFGGn3Qbwfet
         28sw==
X-Forwarded-Encrypted: i=1; AJvYcCWXMEDxU9hV0GsPZMbu1DgYcnfYT3zd+2bdOpV7cqV+3oPQ/7Gi/d9GO+7LKQGY4vTMkgdDZDQ355xMZOCqT/A1@vger.kernel.org
X-Gm-Message-State: AOJu0YwxxF3VVHT6rxzS6xeru56e9QuQPn7lL4kz1YrfmYOAvw0cc9Qw
	dV1hE9tlyQBie2pfj+sSJL+7isK5xbRxPLCZ6rYNhiykvHxN65l+Ikfg/lWEMvHm1Jc=
X-Gm-Gg: ATEYQzx+JptsOqElB48jhrYtISrtqbsKmBHRH/l2aGS9DY80u1SlfIu69YZoZeCpoee
	QcKK0U7fw3/K0OUdGoWm5ZJ3e/KzACLlqtwdvR101sbNyaiImtVKbBkUhfgJzR5kpjUdkeeH9pv
	Vo1sTuw5tTRebDQL8fRQjtR/wyTtnh17vwjAJ3q9vJat2ogwonkT6g2dTUbZDb6jGSVtZqmaF9q
	8ZdozYdzekIRrQk/k8g2GMwl11Iv/rqVPAawVTIEcQ0/wmigzwcbcDNYHliVfuks/Ha8Qca8lis
	gM21gfYPiwdfIAgSYZL7c8ZtjIEW3nltg899FgiDSvoZbFCOl7rD721yjs4h0WZ/1YFW5LAx7xd
	JTUvrlxM9IbrUw4PGmfzd2kwtnQ5X+LCYwbsBqNNgIRb6bQ57EKHarMKbiHyeV1ISXuMDq7MB2g
	+W/3p5VIeABvslzMtgJ6yU5tQeWck=
X-Received: by 2002:a17:903:110e:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2ae8243413cmr30310095ad.26.1772818487132;
        Fri, 06 Mar 2026 09:34:47 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:4b1b:60d0:c217:8ee9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57cb1sm23272465ad.9.2026.03.06.09.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:34:46 -0800 (PST)
Date: Fri, 6 Mar 2026 10:34:44 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: da8xx: Use dev_err_probe()
Message-ID: <aasQNH0hvbTWJTlO@p14s>
References: <20260302195616.312378-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302195616.312378-1-afd@ti.com>

On Mon, Mar 02, 2026 at 01:56:14PM -0600, Andrew Davis wrote:
> Simplify the probe() code by using dev_err_probe().
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>

I have applied this set...
 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index e418a2bf5d2ee..41744f3f0252f 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -306,10 +306,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(dev, irq, da8xx_rproc_callback,
>  					handle_event, 0, "da8xx-remoteproc",
>  					rproc);
> -	if (ret) {
> -		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "devm_request_threaded_irq error\n");
>  
>  	/*
>  	 * rproc_add() can end up enabling the DSP's clk with the DSP
> @@ -327,10 +325,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	drproc->irq = irq;
>  
>  	ret = devm_rproc_add(dev, rproc);
> -	if (ret) {
> -		dev_err(dev, "rproc_add failed: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "rproc_add failed\n");
>  
>  	return 0;
>  }
> -- 
> 2.39.2
> 
