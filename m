Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E75B199947
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Oct 2024 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730223538; cv=none; b=nm0Qgb8JZJ+H7iUc1B4jSMNk4ZXrGl8bKVqJqdtqYBpIokXmD/DEbKcnVDT8ltkr46Pr02ohuqWyKFtFktpCFQEWp+1gcCsoRUUKLvKAt405BKAc7/vKe5l0gG2dmhYQbRiYUN+yC4Da1w6uvF/ezAzsvHOi79032yDc/lrZFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730223538; c=relaxed/simple;
	bh=Bx34qjywAD4wjrKfSRfeHfQ43RmKUXYWvON9HBZiifc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaR82HKvOPiLm00tiWHqmo99laVPmt4c8zA/UuSdOAfiA2ia0W+vmcszxS658mlOkvvZxnQJemY8zfQBYTiVJT6SFjRU/iQ0pQ1NJcAna5JGgAjram2QMoXNIiQ6QpDEIOjQZtoIOBrJGQotHnw2HE27Me8yyx0QaG6a3Mq8t4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9LtC5fO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9LtC5fO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cdda5cfb6so55726035ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Oct 2024 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730223535; x=1730828335; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gTWBiDv/lBHxCHErSCX5+LLHKQwcFg45RvoWheD3HTQ=;
        b=S9LtC5fOqv5qGmvEzZa7KzDV5ynCFfh0Rec1XhMkcbLC9+S2UiNQxwxr6K731J6794
         Jjy4er5iCxvhcasgn4oJP/ayJ9nr5Wldg3+4Lvwg8rO7uuJX4N7n48IwWwcAjklvqV0n
         ijoUjtr69eg9DZIdjtn/vdZQbUuSPQta6xT8J4oZSshj7gzfSNYPBBLBOVhsO46vyYQ+
         GaK7Y8WplbvtRVFRez00lbOn3kW3ZJO+EI6m/nGLTd5nJcu9S6+NzcKlgr+BTi5no2Lk
         fs+8HsM6SLg80WUDp8t0yqa+Q+u+OUP1AOznn1gM3/VmxpZk0R5OU2Ak0YeV47Cq0Svu
         Mueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730223535; x=1730828335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTWBiDv/lBHxCHErSCX5+LLHKQwcFg45RvoWheD3HTQ=;
        b=R5B8m13VYManW8ua2PVLNlkO1FzW8dbMobUldUnaSW2+pBDv65p+mR6fTc+Fzy3pXI
         Qe1/FEiIhlFlKhfQsTwQ7phj83YgkqZKaGCfsdposEFgP0CRVz7vnUI/j3zBTnynnjYV
         4nSoXL4WJkLyJ4OIX+JpiLWApR0jS/Ylml/W7Gdd5ymxWl8+wIIce0lmZYwDoOkAu6hq
         n76BOlOAK451dHp4dD1rXwnfGQ776cnf1biKF1+zD3BQcgCxtIYgHVIIGM16KfVBYUPx
         pOIyVX7UEE7h7rOemV96tJ0pZ9RMWMuzq9SxjBGlZ3nGgHHAtgbyBUC1V8zHIOpXAAcU
         WbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQkPX1m8NsbX0ACWF19FqCJOsKwtQUO/JrkbMSkkx94VDecw/V0NNq084e/a3/pCG8Ot1zdyfGLLGmqomp8doc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6QtqI/5lQUbfbssFbzb1SiSGx8sijzxwqVLZ8GG/5hviz2LDe
	GizIy3B1wkpIgDzHI9e5x7lJki+iw7rvOByscVt5FfYUPgF5lTvrvUUNnA/zPPg=
X-Google-Smtp-Source: AGHT+IHCsNFwdPsXXO9Xl7m20U3GvS7WmwnyHCSxxeBK2l//5JaYTjGPeUyo50Z1uCSszi4CKDQeZQ==
X-Received: by 2002:a17:902:ecc7:b0:20c:5263:247a with SMTP id d9443c01a7336-210c6cd3749mr149926505ad.38.1730223535336;
        Tue, 29 Oct 2024 10:38:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:303f:610b:d879:8715])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc045437sm68375475ad.267.2024.10.29.10.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:38:54 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:38:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Switch back to struct
 platform_driver::remove()
Message-ID: <ZyEdrO7uPlJjoh2P@p14s>
References: <20241025131340.258233-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025131340.258233-2-u.kleine-koenig@baylibre.com>

On Fri, Oct 25, 2024 at 03:13:41PM +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/remoteproc to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of drivers/remoteproc. While I usually
> prefer to do one logical change per patch, this seems to be
> overengineering here as the individual changes are really trivial and
> shouldn't be much in the way for stable backports. But I'll happily
> split the patch if you prefer it split.
> 
> Note I didn't Cc: the maintainers of each driver as this would hit
> sending limits.
> 
> This is based on today's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend.
> 
> Best regards
> Uwe
> 
>  drivers/remoteproc/da8xx_remoteproc.c     | 2 +-
>  drivers/remoteproc/imx_dsp_rproc.c        | 2 +-
>  drivers/remoteproc/imx_rproc.c            | 2 +-
>  drivers/remoteproc/keystone_remoteproc.c  | 2 +-
>  drivers/remoteproc/meson_mx_ao_arc.c      | 2 +-
>  drivers/remoteproc/mtk_scp.c              | 2 +-
>  drivers/remoteproc/pru_rproc.c            | 2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c        | 2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c        | 2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 2 +-
>  drivers/remoteproc/qcom_wcnss.c           | 2 +-
>  drivers/remoteproc/rcar_rproc.c           | 2 +-
>  drivers/remoteproc/remoteproc_virtio.c    | 2 +-
>  drivers/remoteproc/st_remoteproc.c        | 2 +-
>  drivers/remoteproc/stm32_rproc.c          | 2 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
>  drivers/remoteproc/wkup_m3_rproc.c        | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)

I have applied this patch.

Regards,
Mathieu

> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 7daaab8124e8..93031f0867d1 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -365,7 +365,7 @@ MODULE_DEVICE_TABLE(of, davinci_rproc_of_match);
>  
>  static struct platform_driver da8xx_rproc_driver = {
>  	.probe = da8xx_rproc_probe,
> -	.remove_new = da8xx_rproc_remove,
> +	.remove = da8xx_rproc_remove,
>  	.driver = {
>  		.name = "davinci-rproc",
>  		.of_match_table = of_match_ptr(davinci_rproc_of_match),
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 376187ad5754..ea5024919c2f 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1258,7 +1258,7 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
>  
>  static struct platform_driver imx_dsp_rproc_driver = {
>  	.probe = imx_dsp_rproc_probe,
> -	.remove_new = imx_dsp_rproc_remove,
> +	.remove = imx_dsp_rproc_remove,
>  	.driver = {
>  		.name = "imx-dsp-rproc",
>  		.of_match_table = imx_dsp_rproc_of_match,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 800015ff7ff9..74299af1d7f1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1198,7 +1198,7 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
>  
>  static struct platform_driver imx_rproc_driver = {
>  	.probe = imx_rproc_probe,
> -	.remove_new = imx_rproc_remove,
> +	.remove = imx_rproc_remove,
>  	.driver = {
>  		.name = "imx-rproc",
>  		.of_match_table = imx_rproc_of_match,
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 8f0f7a4cfef2..6e54093d1732 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -490,7 +490,7 @@ MODULE_DEVICE_TABLE(of, keystone_rproc_of_match);
>  
>  static struct platform_driver keystone_rproc_driver = {
>  	.probe	= keystone_rproc_probe,
> -	.remove_new = keystone_rproc_remove,
> +	.remove = keystone_rproc_remove,
>  	.driver	= {
>  		.name = "keystone-rproc",
>  		.of_match_table = keystone_rproc_of_match,
> diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
> index f6744b538323..7dfdf11b0036 100644
> --- a/drivers/remoteproc/meson_mx_ao_arc.c
> +++ b/drivers/remoteproc/meson_mx_ao_arc.c
> @@ -246,7 +246,7 @@ MODULE_DEVICE_TABLE(of, meson_mx_ao_arc_rproc_match);
>  
>  static struct platform_driver meson_mx_ao_arc_rproc_driver = {
>  	.probe = meson_mx_ao_arc_rproc_probe,
> -	.remove_new = meson_mx_ao_arc_rproc_remove,
> +	.remove = meson_mx_ao_arc_rproc_remove,
>  	.driver = {
>  		.name = "meson-mx-ao-arc-rproc",
>  		.of_match_table = meson_mx_ao_arc_rproc_match,
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..0f4a7065d0bd 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1521,7 +1521,7 @@ MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>  
>  static struct platform_driver mtk_scp_driver = {
>  	.probe = scp_probe,
> -	.remove_new = scp_remove,
> +	.remove = scp_remove,
>  	.driver = {
>  		.name = "mtk-scp",
>  		.of_match_table = mtk_scp_of_match,
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 327f0c7ee3d6..1656574b7317 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1132,7 +1132,7 @@ static struct platform_driver pru_rproc_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  	.probe  = pru_rproc_probe,
> -	.remove_new = pru_rproc_remove,
> +	.remove = pru_rproc_remove,
>  };
>  module_platform_driver(pru_rproc_driver);
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..cbd9a914880b 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -840,7 +840,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
>  
>  static struct platform_driver adsp_pil_driver = {
>  	.probe = adsp_probe,
> -	.remove_new = adsp_remove,
> +	.remove = adsp_remove,
>  	.driver = {
>  		.name = "qcom_q6v5_adsp",
>  		.of_match_table = adsp_of_match,
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2a42215ce8e0..103368d11a96 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2533,7 +2533,7 @@ MODULE_DEVICE_TABLE(of, q6v5_of_match);
>  
>  static struct platform_driver q6v5_driver = {
>  	.probe = q6v5_probe,
> -	.remove_new = q6v5_remove,
> +	.remove = q6v5_remove,
>  	.driver = {
>  		.name = "qcom-q6v5-mss",
>  		.of_match_table = q6v5_of_match,
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..297ef0c69054 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1477,7 +1477,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
>  
>  static struct platform_driver adsp_driver = {
>  	.probe = adsp_probe,
> -	.remove_new = adsp_remove,
> +	.remove = adsp_remove,
>  	.driver = {
>  		.name = "qcom_q6v5_pas",
>  		.of_match_table = adsp_of_match,
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index e913dabae992..810441f43396 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -1111,7 +1111,7 @@ MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
>  
>  static struct platform_driver q6v5_wcss_driver = {
>  	.probe = q6v5_wcss_probe,
> -	.remove_new = q6v5_wcss_remove,
> +	.remove = q6v5_wcss_remove,
>  	.driver = {
>  		.name = "qcom-q6v5-wcss-pil",
>  		.of_match_table = q6v5_wcss_of_match,
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index a7bb9da27029..5b5664603eed 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -682,7 +682,7 @@ MODULE_DEVICE_TABLE(of, wcnss_of_match);
>  
>  static struct platform_driver wcnss_driver = {
>  	.probe = wcnss_probe,
> -	.remove_new = wcnss_remove,
> +	.remove = wcnss_remove,
>  	.driver = {
>  		.name = "qcom-wcnss-pil",
>  		.of_match_table = wcnss_of_match,
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index cc17e8421f65..921d853594f4 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -214,7 +214,7 @@ MODULE_DEVICE_TABLE(of, rcar_rproc_of_match);
>  
>  static struct platform_driver rcar_rproc_driver = {
>  	.probe = rcar_rproc_probe,
> -	.remove_new = rcar_rproc_remove,
> +	.remove = rcar_rproc_remove,
>  	.driver = {
>  		.name = "rcar-rproc",
>  		.of_match_table = rcar_rproc_of_match,
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d3f39009b28e..25a655f33ec0 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -593,7 +593,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
>  /* Platform driver */
>  static struct platform_driver rproc_virtio_driver = {
>  	.probe		= rproc_virtio_probe,
> -	.remove_new	= rproc_virtio_remove,
> +	.remove		= rproc_virtio_remove,
>  	.driver		= {
>  		.name	= "rproc-virtio",
>  	},
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 1340be9d0110..5df99bae7131 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -457,7 +457,7 @@ static void st_rproc_remove(struct platform_device *pdev)
>  
>  static struct platform_driver st_rproc_driver = {
>  	.probe = st_rproc_probe,
> -	.remove_new = st_rproc_remove,
> +	.remove = st_rproc_remove,
>  	.driver = {
>  		.name = "st-rproc",
>  		.of_match_table = of_match_ptr(st_rproc_match),
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8c7f7950b80e..b02b36a3f515 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -946,7 +946,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
>  
>  static struct platform_driver stm32_rproc_driver = {
>  	.probe = stm32_rproc_probe,
> -	.remove_new = stm32_rproc_remove,
> +	.remove = stm32_rproc_remove,
>  	.driver = {
>  		.name = "stm32-rproc",
>  		.pm = pm_ptr(&stm32_rproc_pm_ops),
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d08a3a98ada1..aed88a5061cc 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -791,7 +791,7 @@ MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
>  
>  static struct platform_driver k3_dsp_rproc_driver = {
>  	.probe	= k3_dsp_rproc_probe,
> -	.remove_new = k3_dsp_rproc_remove,
> +	.remove = k3_dsp_rproc_remove,
>  	.driver	= {
>  		.name = "k3-dsp-rproc",
>  		.of_match_table = k3_dsp_of_match,
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index 36a55f7ffa64..d8be21e71721 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -251,7 +251,7 @@ static const struct dev_pm_ops wkup_m3_rproc_pm_ops = {
>  
>  static struct platform_driver wkup_m3_rproc_driver = {
>  	.probe = wkup_m3_rproc_probe,
> -	.remove_new = wkup_m3_rproc_remove,
> +	.remove = wkup_m3_rproc_remove,
>  	.driver = {
>  		.name = "wkup_m3_rproc",
>  		.of_match_table = wkup_m3_rproc_of_match,
> 
> base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
> -- 
> 2.45.2
> 
