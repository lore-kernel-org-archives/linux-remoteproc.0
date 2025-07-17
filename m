Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF232BD033
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Jul 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763490; cv=none; b=AOSkEC9ACrkqUNPLWzoIGsLt+AC1yZUhM5qIY8MzXccpyD57Imbf7LxWwg9/tY/eCLb039xmlL1ZBIJkz1i8eAMe3uXLHhKA9NQql4eLoLCDw0yOTj/9o5RrYqzsCzfJGAmkUTzOS37uISZvKwRZZ4RUxPqh99AeZEZtArVkPUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763490; c=relaxed/simple;
	bh=N7zNq45QUNdUpyjATamHndz1kMnW2ULq+Iir8spcIZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sfd7trhU9UUZ78WhKRIJjPErMOwu/zuD3uJsBKQMZgkNH1Ua81sMTrRPf8oC1BrnK3JeoL6WCN3RL0r+XqpkXLuUCiZ1DPoV0sbzpRQnckV7hXEVnp4dDp5XvASd9gndJQjECGxwati0o1PFlkS7c1wyuoLSuAeUOjtEcNLF3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=leqL4wNi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="leqL4wNi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ea292956so9679635ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Jul 2025 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763488; x=1753368288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=;
        b=leqL4wNiDuf5F6bVJJadKFKU2XC12tD0ByftsRKOXFgZ2mwY2jbh+B6DtPmm0qYMoL
         /spx6vGog7DPsmb0vTMlPNEFhH7PDjejMUzsJPkh9+89r0cDJ9UVwtqEOSYI9rCKm+ht
         22ZORQ/MIB8qyb1c7Iyrbrc/0wPvfHeKl3o2aRM+yLEKV5LjYdyD8hzbOJxGXjmprjSl
         euq3L48kd1cB30URiyOPsd6GY49oeeN6lMkOpDCgbgATUu1HKrCjAefcBimotZHlkJex
         5LGJT+vEiO6ZoP4UXdk6uK975bgppuT/8YCcAQZUnVLdqG6X5a7w+q/T+UrTlHJYSd7e
         qVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763488; x=1753368288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=;
        b=i7mDE4JOwS9JNxq8FG47mZHnLcOB521KT5tWOyZ3rHlGmbX9ComuFrnG85lJhpknLR
         JH3L2FeDSDaXp6Elft2xLPy3b9BvKC/ywI0hh7ULKNwZWR+zdTje0VhgOFFcJ8C+7j7J
         w2kckrHE0n89tgnWKhtX93E8BAEdswdvlYMT2BB6UMcshRgN4HC0foxh0KDEZZnAd0el
         3Vb2RS/0gODgyUYB7CdTT/Ympy4WN9RiAmdvbUKOfNixzfFuWkvPInCUB/A1GzAAmzEu
         8mb/mWO16dcqU36OG6+2Vk6hPO0Af2tTpkgz+f4v2lBV5tzaP3/XiDKcWe59igX4znR6
         aW2A==
X-Forwarded-Encrypted: i=1; AJvYcCXG9OQtiZSQs1M8Clb0vgSrpebDIdtuGEyQqVo17fczUZUGWXqYNlgj2ZW41Hs+qKNUntCDkNTK4KCIcAZq6YLy@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYMasbLc3DztXm8fFm8WBTqAkAKKvx/uS7+/Pp5D0o60EyqFx
	BkTOeOgUDuz9dAK/IYaTXB8PxK7mO1QtHywl8JuadrDalDtX8dYHMjI9FXX1V60RXF4=
X-Gm-Gg: ASbGncv3Ti6f86nXwfcDBKP0c085VKfC2tPMJSJ5tkKLDZjrHHEawBErViN0oxaF8v6
	pnAZAow7MI6ihJo6o/VvZohTCBqR/ZRmv0EzX3FUtakHGUGKa9Vmjh3GBbcRG4J6VkJqihYQkpK
	ilx56x6kd3/4Z4/1hSFK8tCVJETzxbryGXZKd/rZkmMEujAijcv214cK+NJaIfK6bRqrSE7sQE9
	Rtgupnc1Q+8xTVGt9TQmk4SCp55ElUzdAaoYPUA77k9jaOJjzncaNwhDp1rvmLrx45kx7YsHEPi
	jZq54Ccof1FI70MEKUZcBzubXHI9smWISrJGE95X5CKJCeAvQNUttfs5hMs34wFDQ0KpgqgLiDh
	HVR6kXY2jurqm0uzUDRQJKUtp
X-Google-Smtp-Source: AGHT+IFxbtqBAGkJym8+VFRPzdrsyZhZt1QmNmPClKyw9FUHG1z6ALCqHlkDrXho3ZJx8sxkci5pug==
X-Received: by 2002:a17:903:1ac8:b0:234:d431:ec6e with SMTP id d9443c01a7336-23e256849dfmr104855025ad.3.1752763488194;
        Thu, 17 Jul 2025 07:44:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e0c8:a1e8:3882:b37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b2dsm145347495ad.92.2025.07.17.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:44:47 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:44:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aHkMXWfs0iXqFTbw@p14s>
References: <20250716194638.113115-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716194638.113115-1-hiagofranco@gmail.com>

On Wed, Jul 16, 2025 at 04:46:38PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the Cortex-M remote core is started and already running before
> Linux boots (typically by the Cortex-A bootloader using a command like
> bootaux), the current driver is unable to attach to it. This is because
> the driver only checks for remote cores running in different SCU
> partitions. However in this case, the M-core is in the same partition as
> Linux and is already powered up and running by the bootloader.
> 
> This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> M-core's power domains are already on. If all power domain devices are
> on, the driver assumes the M-core is running and proceed to attach to
> it.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), allowing the platform device become a
> consumer of the power domain provider without changing its current
> state.
> 
> During probe, also enable and sync the device runtime PM to make sure
> the power domains are correctly managed when the core is controlled by
> the kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> Hi Mathieu, Ulf,
> 
> This is the v8 of patch3 from the patch series:
> https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/
> 
> As patches 1 and 2 are already applied on Ulf's next branch, as
> requested I am sending now only the v8 of patch 3.
> 
> I made a small correction into the commit description, s/SCFW
> partitions/SCU partitions/g and updated with the check for the return
> value.
> 
> I hope this is ok.
> 
> Thanks!
> 
> Hiago.
> 
> v7 -> v8:
>     - Added return error check for dev_pm_domain_attach_list().
>     - Commit description: changed to use "SCU partitions" instead of
>       "SCFW partitions". This is more accurate since these are hardware
>       enforced partitions.
> v6 -> v7:
>  - Added Peng reviewed-by.
> v5 -> v6:
>  - Commit description improved, as suggested. Added Ulf Hansson reviewed
>    by. Comment on imx-rproc.c improved.
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
> ---
>  drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..a6eef0080ca9 100644
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
> @@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +	if (ret < 0)
> +		return ret;
> +	/*
> +	 * If all the power domain devices are already turned on, the remote
> +	 * core is already powered up and running when the kernel booted (e.g.,
> +	 * started by U-Boot's bootaux command). In this case attach to it.
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
> +	return 0;
>  }
>  
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
> @@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
> @@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
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
