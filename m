Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27F626B942
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Oct 2025 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974652; cv=none; b=Imz4nvqTAg37EV+i9Cs/Q+CI2WrMzkI4p7PJCEyg5hhR4mqHHMy+/+quSz/6GsFXA/JCc2GhFF0hW3AQojf7PDqXcmQR74tJjfEZWdKD6DV+d2VMqN1SEZ8VDdegstSsoXW/g1Kre1zgumTHggmeGSpyYpdAaaAp0RgIjyUhnOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974652; c=relaxed/simple;
	bh=uvtKdw8fhD9Bm/d4sfVL5BsOH6AlqthiaBj+rlosuKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emuL04huXAy5FWG8m9WHCgVaXmp7B7xHKokXW2RVtDeCSRlOnqRL1U4Ufn5SAAtwqdbNYesr3nZc5egIImOJqAkaRxZWIlQxrmQtnicIfzYUiqqfa09Kk0+UOr+WR79Bmcf6+42wj+ToL1QTTDBdtTy2/MkipWb3K7Ah0HCFkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4euLhwA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4euLhwA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33c4252c3c5so2870640a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Oct 2025 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760974650; x=1761579450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=;
        b=w4euLhwA6VURPhLN5/9ZDgcbPBFUP/Uo/bNr3L84dwkiV9zOPQIXTfBWhgt84fXFQB
         uBEbeTdS4mnyucbAYkLdxj7r9URbTlA74QelQRVeB4YUzkjbvGW3xETWpjYywcu2Ps4n
         KUO5NT5UtptrzjN4bf6cKwA0DURGe8GlY5wulGkBTrHCjLNc0zsdmVgobDDT+EyOLSP9
         B4S6/O5J6qE7yaxML+FKhyi4/GFKL3HnQsg0M8yQBCZ9Xy/PJ4cXKSmqU4qRSQBxKoRD
         qIS5pCVl+QEmT0O0GJBoLsU3ZUE/ghxUoFmcZ66VXnY/Wl3i5+d4CmQmeWE5Og5IJV6U
         Z5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974650; x=1761579450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=;
        b=D8O5qYNk70ah7/2fzLTXLwFsq2Xi2sInaV3DiouJ5NvRSFavzB5p9J7IyKnTnQ6bNc
         dT24TDytIdM/goaStKAFx/mnH/dNYVIJcHGms8bBJKE3PTTSLq7vqVG0Kh9xCyyUVaOL
         cPzJ84gacVKI/6A9Jggcwk42xACPtVoKksPJdmJex3wMTdK6M4ydJ5MVVZcHqhvsUlZm
         5yny3uF+7SnL52Ehxxu8iSH31/FXRBLKC0mfUbs2I++lGvNUUn/EjXdF3o3Py0FWrcny
         fCWe1pjuxsSGCD2SuGmqskV3pQkuvzC9LHTtiqbe5YczdTSQJD6zD128zLcRpq7Ta+l5
         5N4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjz2DqOUKV3CYDJ5BPQ0SUQbp7b+LzImmv1DtUc/QEsX8c2yKx86arEng9S28bpVoydSEqGNmgPftH+VMP5XUl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CA+qe5jBviw4iXdM/nyLuw507yVOtJdpVz7Wlbw7Fbcq8dVw
	fG9/tBoNwUECjWBoYecZ0+R61DV66VCIOc822EAsaQQXP2lTa2nVVifw43xGNBIAYUQ=
X-Gm-Gg: ASbGnctT9qzGpU6+fCVUbXwJpYE1q1ONT8q5UqPyzdkOP86+0pYaohCXAqzc3ITo3e9
	mknOI6Zi49EIiX7sr1W1VbknwO4DAxQRP76TSiKx7Ul13xZOXmBu768GYo6gX7ZzP8fCJfSTXMH
	KYavoPkRde71g8E1+pQz+JVRqnCN5Zt42AU+8SIVzwThBuOw/bJuLGIzc7UWyLl6BAdd12NnYZb
	pgSUKZfBuQdkvjaiaKp6LXAl270sDGtKh5J7WVGHAIagcDeTWrU70+BT87TPOlsTGy/KyLeLuoY
	Pl5sjKWsxqKe1TV+0VVBejZQr7GCg3V0LWYYFEPTsN1HIRQBznuBgZSpH+eVfCWiSlFQVNNPx/S
	qa/HKBokLdx6p1c5TuKcc3qxTxdwkBXHsf4wk40pD/vMLOVtiFAKsFWpffhFH4JZxHJI7NikVkM
	W1HY66Qw2yXuHnhg==
X-Google-Smtp-Source: AGHT+IEmsmD6amTLvHHE+2cwS/e0HUauPuXtYyoBUNl10cvdG4E4NSTe+f3ScOSD6PoiCIK82vESEA==
X-Received: by 2002:a17:90a:d44f:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-33bcf880809mr18130535a91.12.1760974650080;
        Mon, 20 Oct 2025 08:37:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2360:6c8a:189d:ae5a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33ba93cbb7asm6652052a91.1.2025.10.20.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:37:29 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:37:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Message-ID: <aPZXNlY1MK4--Q_g@p14s>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>

On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>  
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> -		ret = pm_runtime_resume_and_get(dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
> -	}
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
>  
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
> @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_put_pm:
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(dev);
> -		pm_runtime_put_noidle(dev);
> -	}
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  
>  	return ret;
>  }
> @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put_noidle(priv->dev);
> -	}
> +	pm_runtime_disable(priv->dev);
> +	pm_runtime_put_noidle(priv->dev);
>  }

Daniel - what is your take on this one?

>  
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
> 
> -- 
> 2.37.1
> 
