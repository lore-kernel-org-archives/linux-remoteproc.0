Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17F2EA75C
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557234; cv=none; b=IZxtyqxLE6quz5i83kb+jXpuMN3Cuj9BuNfXDuXCVwKEGJbMrHCwODrkpta8LrIRV5BlxUeU5QTyWtF4HcTHYuHQuGGKChHvZIijPgY/rInuRs0VCQ1SCpAMaHeMSZ8omggOU/0mCk2OM12D5Rgb0x/7DqoUHX7WXQxpIgQLNUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557234; c=relaxed/simple;
	bh=SGd/Y77sUXn6Zr/jkMncw9ZuF4nFQwtDQXKAhq+qfS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoP4WNpR8K+2f2RslABDdwfI7mdPIuPHse970ff/+ssBcqdHMYI8UPHSBtNVEqmOaPHg73jCJYghnGlu12Wm8S2jxFKvJdh8TPFbS93/QAUWcvafseRj/H1tCX7idLxmA0lzaKNy+ZTTKj94yLT621wm622Zt0Ul44gKkEy1FR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRLfBTly; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRLfBTly"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55562f3130so530797a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758557232; x=1759162032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=;
        b=DRLfBTlyHnUlMcWvnYMgQvmpSaqcJiqzu0BEqpV1QgdubDyXcYGLmLUnJxLti/all/
         dj/5C5VxBetClD9Mqyhzea5S+AaWykDwyvTRSXnxn7gxMI/lfVQ1WfDrN7u0ep2Ob5/9
         XKMODoLfya6/uZJEUFyCuM7sS5CdHQHvR+tGs8jLU0s2/vmZHa4T5Dt5mVizV1z78zA0
         3tII8HM3bLRGPauj6SO6sLU0hDEZ7bmafog/uxTmYaAPprJgh/9+cNGohmVxsDlhFDL4
         XS/wHbJ7KMbNyTfOFgG0N+Vt5VB6Do56MBtBx3oCXEvoiGlh3XdyytqWAqKOryA0X7Yq
         Jy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557232; x=1759162032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=;
        b=YCxIpZovxmNm6sCCZg7RX3/Iv47OhzFc+tU7TisPOHmPHS7Q9XUvbxojqdS40dZv/C
         gHim9Wjq2NOMpG4sNMGwJxreiea1ARNbJfNrHF9ESr8k/Emaerb8BbgQ7MKiqpAu4C+W
         4VHRq1mBdN8AHqFFsSgRoo8nXhJoOlIBr1nStKP7TI22TCn1eoOXofOvqV/L0062VZDl
         KQrvSYwzNhpPcbL/H1fg0ldsrXjwduwbAKFQukrxOUFZZFHqoaN1HTdWSM+Iz2jM8VAu
         DNNM/K88vUt8yBkH1ERbt5TwF2PERvyM0dkQFDNSaROQs75eYUtwvffaRZ3mPv34PuTP
         K+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWyC5jGRCuPje/yhuLh8477LK/WcYni8uQ7+wZcsqv5KkyWKNA1oCBupWqUQ0RkPQE8VFJMAwiOq92kaqDD1COJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTEbNDXM2WqdCtEEkoo6aKxRo18Kk5VH2tNJquFIYeXkbP1pZb
	0L9KQsfzY0wwWzzbQKt8XXZHEKXnKL+gy4eUs5fc5LCCAb3vc8y0IUtT/Cd6bKDMNfU=
X-Gm-Gg: ASbGnct+Wy7QrMqMl7u83E7KbtwVuDyIhCA2NPpzIpFwhpguCWDA3ymvieQ/++plyMd
	ZIuRGE5ZLYET6ELJMAot/EMglAKSVq4GYpYCCDhHrzBXtrN+1RYiViM2p0mD+GTFeiq11vUgKy/
	O2W3owRZseHU14Qr1ksA470XyGDfyDan/2gEEL+ub1WWFvD04laAs4TOQi8GjGoRa9aoPHrJcfy
	KXpiZyM86OPUP4kwPYNT8ymJlPtlBczz9q3OpWAOLKDSQDGoAL0PHtsGO289fw/PtV48ot8fhj/
	vPw1VR1QnQcIobwx4KWY4fAz+heEpfa7EP9UeOfrwVvYd6MSN80JhfydDzf/YSYT47Pn2PzNppO
	dUv3eaRvX96VZQ1hPyq1TrlS2pqbN7Qtq7lRaAghExLH33Yxu4jtM5nhzJtrkNDM/GSUimIoe+9
	0nlGV2VhIqfyxoRYBHNdkhAXrjd5LK9ZaWvCg=
X-Google-Smtp-Source: AGHT+IH2NzERQbi1RoTQELtlO5ZOlqSD7C5iySM5N99gbWGr6H6ojxxoxB4xZsUBWMUxh34xDnn+dA==
X-Received: by 2002:a17:902:ccd2:b0:267:99bf:6724 with SMTP id d9443c01a7336-269ba50876fmr165383605ad.31.1758557232460;
        Mon, 22 Sep 2025 09:07:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4631:7929:7e95:6485])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803184d3sm133896545ad.116.2025.09.22.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:07:11 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:07:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Message-ID: <aNF0LFkuS_hADmrz@p14s>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>

On Wed, Sep 17, 2025 at 09:19:13PM +0800, Peng Fan wrote:
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines.

Where is this mentioned?  I have looked in [1] and couldn't find anything.

[1]. Documentation/power/runtime_pm.rst

> Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.
> 
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.
> 
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.
> 
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +	struct device *dev = data;
> +
> +	pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> +		ret = devm_pm_runtime_enable(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +			goto err_put_clk;
> +		}
> +
>  		ret = pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			dev_err(dev, "pm_runtime get failed: %d\n", ret);
>  			goto err_put_clk;
>  		}
> +
> +		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +			goto err_put_clk;
> +		}
>  	}
>  
>  	ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put(priv->dev);
> -	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> 
> -- 
> 2.37.1
> 
