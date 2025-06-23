Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51F28D8C7
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692593; cv=none; b=p/7zZadmh3pJyzbaZ1RXz7RP7fHru9gJgKeL2bpJS7vcl0Kydh99LZlrUj78j1HBWtH9nm8WPR1Qt/BZxBABtnStjL2zW0Ji4tJ0qNGIiGjhgjM9ZG2aAPzV58Y1UwUeSx9OC+3N9LHullWJ4vQKbzOaN2F0mQInhQwayd6h8Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692593; c=relaxed/simple;
	bh=rvlexOk2KxBUOGBjG89VU+HC4brRNmm9u14ZwZa9zuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB0m0I8eKGvyxsSj1ML/69bo3n69WtEsi1K2nRgm89X7ralawcHFMQwrwQB06qIoPg3XH5XxKZz5p4FsIBvcWetkrRMmHyvJHUXZa5w4c3N2NJbf5I5QePdzG8k6mxd7WVir2EhKjdI3Qs0jK+4l9fJMrJLNDhH44Q/PJWQRRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cmsz0fG1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cmsz0fG1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234d3261631so29663785ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692591; x=1751297391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=;
        b=cmsz0fG1MEpkD4+3zUVSaoPiglOu2d6FKV1k1BLSJfa8CyaqYNfLBp/3iB/MboJjnG
         4uogqpEL/Wg9a/cXazouEOGkuVyHzFuHNI73HJxdwIsc6aiX27xwyyZz1dXP/9tLz/6P
         /CiACCtg1UcZRxqsFlQKJt+dHC30EFW8F4+Q0LnddixxgqsMbIupQ/SSD5T/K97Uk/dT
         kGQIgoRvjjt6P5m/mITwYUhT2yxDhfWkAKbBHh6YXY5Rgag925OrA8JHJgUpQBBaIZ7S
         S9CbxcEnLMfwcl3o7LDl9YMLiMS8s6rwDA8g2ZGBTM/jlzAo3Lur6My3rXobCOfQsv4T
         UlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692591; x=1751297391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=;
        b=jare03wVTPH6bifCFTajGwk9p10hVU0fkIFRDfghudQMpIalA4tqFNtzL3cxx7UwPq
         gnhWCbJsrpduoryTTBhcdysA+Eg1IsEA20jgX37AsEoMpC7d8zj0nPmSqHJVHtOIekkn
         3hxzxDoUxYCwUm5CMzgyKg/CQaX7dLhAq5UB7ou9Eluiuirs/ExFMrzpIJMDMYwr+1ka
         /DWidLb1a1xDFHshelBfmIEPRXR+bFLwukZ1+E20bJTHG0VSCrolt/inbpQpYABw1I8u
         vTcgwONAZT3fZvsnxnBcghcGVx52EELPYtGM8u6p/2gL3Lj2b4E2fE6KK5VOViSiVTKA
         Bs3w==
X-Forwarded-Encrypted: i=1; AJvYcCVrEHYI/7mIxGTC/KdRYFF8AymdRs2uNPUXdbxuZ0WCbwp4ZvagwssAtx7DxbaKrqOjRv2uvBiuz9J7ToHeCGOk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3PjhsW/7INno5vs6+3Pyb2J/WYv0FD/1tW+8SyRuCwg4TPNN
	hHyJfGb2kTt7VOhgsUU1mdLl+SjezRxn0zL68QgiyierTtm6EFBxYpD0cUhiGr5CFZ7in77T5wC
	O2BMVuOs=
X-Gm-Gg: ASbGncuTfpadYl1/p9d0zW6OcUiyvFQx4eXD/JDZMl+8uIy1P9pe00O5y0eDlRTxGqb
	OhnWL+TMCumlgEPSMLArcJfppOR9sOhd+XbSA3v5nZ/smrarzxnorYIBGVLvvgR+bikfb7sN3Oh
	VtA9CTOn3Yh4P3NRUbyLXhtLCQhCNOD77mQXNAjUEfYwVNX9mTU2n2MudTrT4l1YdhJYOU3ijdB
	K7IxEADyd0AgfUZc/SD22BzxfUOJG2tPFwYFbH0gS810iKjBLwUhWw4eytfunSgbjDPX5PvrP4h
	Q/jxpRLaS0tPCLvPNaRcsc8z1K0JczhMIYEyW/RJxcuvUhfDDFH+D1fuqzFEYOzJ46RmwzyRxGM
	=
X-Google-Smtp-Source: AGHT+IE/tDEriXoZY84SIRgiQjRfx7Nqv/jCO1aRGKRzkXGAXMW0IvvtgLzNFd2r0jGkIlFdCJKogw==
X-Received: by 2002:a17:902:d501:b0:235:f3df:bc26 with SMTP id d9443c01a7336-237d976311fmr188832525ad.3.1750692590758;
        Mon, 23 Jun 2025 08:29:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12427cdsm7052225a12.39.2025.06.23.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:29:50 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:29:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aFly61yCMttkp12e@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-4-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-4-hiagofranco@gmail.com>

On Tue, Jun 17, 2025 at 04:34:50PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the remote core is started before Linux boots (e.g., by the
> bootloader), the driver currently is not able to attach because it only
> checks for cores running in different partitions. If the core was kicked

Again, we have a nomenclature issue here with "If the core was kicked by the
bootloader".  What does "kicked" mean here?  Is it just powered and held in
reset or is it executing.  And are you referring to the A core or the M core?


> by the bootloader, it is in the same partition as Linux and it is
> already up and running.
> 
> This adds power mode verification through dev_pm_genpd_is_on(), enabling
> the driver to detect when the remote core is already running and
> properly attach to it if all the power domain devices are on.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), letting the platform device become a
> consumer of the power domain provider. With that the current power state
> of the genpds will not change, allowing the detection of the remote core
> power state.
> 
> We enable and sync the device runtime PM during probe to make sure the
> power domains are correctly managed when the core is controlled by the
> kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..b53083f2553e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>  	struct device *dev = priv->dev;
> -	int ret;
> -	struct dev_pm_domain_attach_data pd_data = {
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> -	};
> +	int ret, i;
> +	bool detached = true;
>  
>  	/*
>  	 * If there is only one power-domain entry, the platform driver framework
> @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +	/*
> +	 * If all the power domain devices are already turned on, the remote
> +	 * core is already up when the kernel booted (e.g. kicked by the
> +	 * bootloader). In this case attach to it.

Same comment as above.  What got kicked?  A core or M core.  And what does
"kicked" mean?  I can guess what is happening but guessing rarely leads to
anything positive.

In the next revision, please use other words than "kicked".


> +	 */
> +	for (i = 0; i < ret; i++) {
> +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +			detached = false;
> +			break;
> +		}
> +	}
> +
> +	if (detached)
> +		priv->rproc->state = RPROC_DETACHED;
> +

Ok for the above.

>  	return ret < 0 ? ret : 0;
>  }
>  
> @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_enable(dev);
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret) {
> +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_disable(priv->dev);
> +		pm_runtime_put(priv->dev);
> +	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> -- 
> 2.39.5
> 
