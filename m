Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF133385AB
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259356; cv=none; b=CI13tZkJ+4NbzNgJUSq4u+j5FyHE7tFHl1u/e7Mvjzdi3BuRXtotbDm/KyiXLpGBF/znZ8o/EL3W+vx7Pjbc67yHNB0lRRM8IDAroOvOLvlPRC/SyhL4RGrH3T1OuP7Nvdg9uMoZmhIqe2isP/WSWBX+0sLJaIt4YsUX6blOFvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259356; c=relaxed/simple;
	bh=vyTrsB1e+2MkE4MM/o0IDxBEJy6eYzaBtOBs5fod1Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFBA91U/kzYjpJ7zgyAScpXmN35kDkEe6zoGInPtevjtWNKty/O/wswb4jrTevdlDZprigg4PcCCKM7Kvq+I0McmEV1IHLYo0q2c3UyWxEVYf2kjonf2ih0DYHgBcwDTCcpnxoWEi2LHwj6372zmgQpcolapc1ZaoSN/yxlOhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rLqpkjik; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLqpkjik"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297f35be2ffso15503735ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259353; x=1764864153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=rLqpkjikhHVsmYqRok5k1kdfGgUMrxgdLgwH/07nQgW6/o6/iCYg3TJJOBqBGM7vuY
         3NvH4RH5aFSD3RGC1B42bE2qzwQ2mG7QLSfICBpaNSgTKHyR6MhjX5mLMIP1C6o9j8uu
         IhdiFRi3w1ggyAFX+eotM0DxEk50gGO2KU6OZ1RAMHEKlJjJfJSP5PZ1vNbcR+xuJGuR
         sm5Ro4UuFaGvfkiJ4XBsZ98kUsOfVNb80vJwhYx5V7TQZlW+Za/S3GvuA7B/UOiYDQQx
         x4ywjS8xz4i8qIVE7g+8qU1aEzFR8WzUEhJzhTZW08ekbkPZlWl0uAHmXO2Ua26KN2+k
         jrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259353; x=1764864153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=dofMb/rL00J4TzcGX2J4ZQlpW8PfV0cRYgJDsQxo5dvhd4HRd/o3/A9nBdVMmTElZO
         01FNdHkHdKZQYYCqNtLkl/REo/+1iEQ/jVP4cAb+seWzm6DQkWWvO9+WycjDYlPURCZ6
         KB350G93UIUQvnQBDsbLrij8RDTE809sf6rwEjKE1BUDxpb+bO7xX4/bHCha2FuaTOC5
         1Qae/4K6ePvuqhW78rVQijGUbV+UyeEvV01T5GLVcDiyYiTaDlWoe3UvnRyhSF2Z7noa
         k65roMOs/pij1yfhMM+NRPBeEGnueNbx3mt5hdb3mB1kkLsnzd5T5eQKP8rLhsyKhXHu
         ilyg==
X-Forwarded-Encrypted: i=1; AJvYcCXM2JefslqMpkJJo8FgXihPH9ys9Lw63xY6VwXbXknJaWZO+Vj87Mzfa3I4ph2PoMCWUsecIrGE0MUlPpiQDs/P@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3pnFpU2sy9if7mVgnlGPunV/TdDHzSJfq2ENMBj7Y0Fbxs/y
	rDmrr6D9GnAwIGaNG76GI72Rlt4NCGJcfWNQ+LZXTotZlUbpttFR/38C+2lTkNCurGk=
X-Gm-Gg: ASbGncuDnz/1GboxeyEeNGQtVfIKlnWUX7z8bFR0TvZ5DQl5EG7WkEznpDSZ3f5rNDJ
	KpZ48whwHtyQj3Hs7Uok0ehw1Bnb0K18YM1ZwgtwFL+t/1kcV4/dcc0i43rXDo4AWgEzUy7JFE0
	H5qwQ7YF8GVT30vpxkJ72VQTIV/2JLbxlqF1OtrpwTES7RzWjGEiLod80GTnQApyGxaiyEnM35l
	25hA1hA3JsAZuQwj3BsQtBJz1kGCfpmiV0llsFip2hocq0g4KuvERfbVrLvrH1CiWXhtLHnXRHX
	dDSzO5rfYyy7c6N0CCuRm8lJD1qXkp0mbPeByZ16YRsqCKg2BYDWY7hGvRJvc/P6bjPj600jrpz
	VL71tf3oodrMKacSiui9nxWN9jfrXU4kb8wfMWMjtkf+Pgq9YiNTOLghVBIcnjjQDGmOzelOjUb
	VLpcgWYbTV9As4ZtfRuK0M1kMK
X-Google-Smtp-Source: AGHT+IEBS49WXHa1OQkXmOSzrd/2INN0XNe3pKmNT4J9ufCzVEdO1kJQ5meC0md/PjmvEoKECkjFdA==
X-Received: by 2002:a17:903:292:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-29b6c3dc29fmr271962935ad.4.1764259352803;
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4703a9sm21523835ad.42.2025.11.27.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Date: Thu, 27 Nov 2025 09:02:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug
 in imx_dsp_rproc_add_carveout()
Message-ID: <aSh2FVTS8jGUSInR@p14s>
References: <aSf6OerBbPcxBUVt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSf6OerBbPcxBUVt@stanley.mountain>

On Thu, Nov 27, 2025 at 10:14:01AM +0300, Dan Carpenter wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index be83b5f20f15..5130a35214c9 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  			return -EINVAL;
>  
>  		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (!cpu_addr) {
> +		if (IS_ERR(cpu_addr)) {
>  			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return -ENOMEM;
> +			return PTR_ERR(cpu_addr);

Applied.

Thanks,
Mathieu

>  		}
>  
>  		/* Register memory region */
> -- 
> 2.51.0
> 
