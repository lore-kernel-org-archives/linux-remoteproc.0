Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E12848A1
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483999; cv=none; b=BqAf/GGB33Hg7LaOZA8SMbhglBmBCaAgxpXBc5cJ5rQVegGbHWaItGqVDynCrtnt8RU93Dy5ySrxnsCvkNAV9YZNvsyKYAbuiIbdNWfEIQIYSOLz3RY8r4IN4pXkok2GvaSdP10MuZyfw9A7w3AkH3v30e6VMHxXxZ8T7kUsPbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483999; c=relaxed/simple;
	bh=g92a+owQQJ0oobr4+N/9Jj+4Z5cJlQRxuQ3I+2k3zpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNSbfnuRnrnKlNWkXJYmTxkrjxNhjjU7Yqsx8bQzch1vhuGHh9h4b4qBKOwWBPkwz/mdz+GLi/D0pj/uA8xEXS0YyqrEJQ7XfWt/51OuR0sZNvHglCaGJCOossv66Pxnzavs9RnXvVnE4c4l1cHRdX2wZyyWTwoMiAvBMh8rI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwBUCSIc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwBUCSIc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2956d816c10so60238665ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483996; x=1764088796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=;
        b=JwBUCSIc/JtHm1+LbFOsvQm9JGUyVgjfDbwV0vLkzEhD52+bde6QAzB/UW8Kn2Rk8Q
         Q6VGKoVnY/AqXTkelaqEn9x/tlHk6gQFOBmTXv5oVSUHHEuVxdz0RQIGUTdzV4RKp0B0
         tn5S0DE8aCsDXuTgPCD0Kw+H4S/4Tv3rPgbuIrhDah9KX4xvGZug107x5llJhy/awszA
         Sy43Z1ukXy0zO2NOFmJnPBddFQo/yO+pmvgd3lgRAhwIrkUYzNm0+ihDB+0lKCXPkmEZ
         kPRYHhFM8A5Xx+JkArO+n3I7y+Gp6+fo+X7Yg8vJN05U7udVG0FW6wrOyYRn1QPCmLzv
         QGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483996; x=1764088796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=;
        b=aKeAEhEY7CURoOxQTH0FvxfQl7Oj+Kj3nkMjn5O6NzTVvedq4bXaOhlPV+Xubbeqz4
         Zx5xrjs64xlbc8jutq67DVSwUy7d0DwXJ73oGxPX19N2+6f2apqAldAXFNO+pvWEPZms
         IB+qYG8YJRgqFzVxeAL+k5FJ+vErYG0NiuKNWJdIdh2+tHWzP4H01AXI1mjBKIPY+vBO
         R63ktDyHuA5P+OrMX1N7J9hTnEl8m7IJcqgCSEfinoYcVqzlp1/cSgN3Ww8P2QrksdRI
         gKInzhBkD6EaxbCucpet1UwOg4YSnR2v5MN2meCp9Q+w5Xuu5Y8/h6Rvm++JKFSnrrR8
         KB4A==
X-Forwarded-Encrypted: i=1; AJvYcCUIE1jxn6+ycBBJlNfT1yK6erdcSE+X5vfcmpmeccnxjQi2bOpR1COfCE7wB+bZY4za/yEo+Kc6vvd4hRdpDBId@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmhb++UIckSJugcBcxEWQ9bAFsfckWFcR9UsoaQ9X8rwep8Lf
	GUw4Utfg7t00kF7BjXyu4TXFwm5fxTKuaUPExUEnqMvsw+KIo1iqJKcsOQNGuknCMZE=
X-Gm-Gg: ASbGncsuRWisi/oDGAC6NwvZQeYxKRY7QjHVWee13tWOKG5iSFm46vEzg4f4VffCniw
	1T1mGUNZG+Ycl4LFq9H+9Y0aKVsbpr4r2Jb5gIVJkqPAsyQwl+QYUhPOaRI1UksTj6DeyTqbue2
	S7l2FxqMOo1XUtBDTUEJQn3dah+kre5u1bF2uBPb/NZEMvD44nR3D44UBvRU+wcUtc6l4d0GLT/
	GrQ4/db1B2bpeIORKrcSwnm0VSKTFAjn4l8JuNIrSWg6kuquYqlTvL4E0eKWrv8kbcJekfWd4dz
	/wWOCyl/IHygTxqcTT9Y11x7uAV+XxE4tsPN9tCKbUA7COGINIhKcoDIX556Bfl5Xxv6/iiV4tW
	YQVB59e2GBQ0SWka9VtlLVOxKMpuMf/JFs2LK6R4c6bXtPGOZSjvTrjbjlETbAMCbpfAwhK/dxA
	BKr7U=
X-Google-Smtp-Source: AGHT+IFFlRKqGN0EFfOvRr2kyUDj7RRlM7hPl1xppO9T/OtL5bWQkM7hLz3RHkgvILrGF6je2OfB2w==
X-Received: by 2002:a17:902:f607:b0:298:1f9c:e0a2 with SMTP id d9443c01a7336-2986a76f992mr206752045ad.54.1763483996482;
        Tue, 18 Nov 2025 08:39:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986e54f019sm143681775ad.15.2025.11.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:39:55 -0800 (PST)
Date: Tue, 18 Nov 2025 09:39:52 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 01/11] remoteproc: imx_dsp_rproc: simplify power
 domain attach and error handling
Message-ID: <aRyhWF5Wh5GxXsCg@p14s>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>

On Tue, Nov 11, 2025 at 09:41:12AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
> directly, removing manual detach logic and simplifying resource management.
> 
> Also replace verbose error handling in imx_dsp_rproc_probe() with
> dev_err_probe() for cleaner and more consistent error reporting.
> 
> No functional changes.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  {
>  	struct device *dev = priv->rproc->dev.parent;
> -	int ret;
>  
>  	/* A single PM domain is already attached. */
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
>  }
>  
>  /**
> @@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  
>  	/* There are multiple power domains required by DSP on some platform */
>  	ret = imx_dsp_attach_pm_domains(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
> +
>  	/* Get clocks */
>  	ret = imx_dsp_rproc_clk_get(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
>  
>  	init_completion(&priv->pm_comp);
>  	rproc->auto_boot = false;
>  	ret = rproc_add(rproc);
> -	if (ret) {
> -		dev_err(dev, "rproc_add failed\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "rproc_add failed\n");
>  
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>  
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -
> -err_detach_domains:
> -	dev_pm_domain_detach_list(priv->pd_list);
> -
> -	return ret;
>  }
>  
>  static void imx_dsp_rproc_remove(struct platform_device *pdev)
> @@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  	rproc_del(rproc);
> -	dev_pm_domain_detach_list(priv->pd_list);

This patch is giving me a compilation warning.

>  }
>  
>  /* pm runtime functions */
> 
> -- 
> 2.37.1
> 
