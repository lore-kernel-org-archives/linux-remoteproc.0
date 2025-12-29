Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89AF2F7AD0
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006511; cv=none; b=AkoaszqYixjWgFbch6nXFdpy1HVLcUmH2aKMdRRzZhNiJ6BFMvpVJf1TUx90Niw0+rK7wXyACBNAh00fzuoaGlGpx4/0YK7PaQSxgXp9gnMMoSwqncfKRZE4OQ92ujvCqVs924pqosKQf+3FgJHYp/uxxYEWeer2lGrnxf8CU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006511; c=relaxed/simple;
	bh=mvTRMMCL5RZ4BZ6ReS6eys7tkGj6CcSCpfSOhXlEW4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cILzdAtgrLFogPONXsdz09JwfYprl+dMhDpfGEZ/rTx6ZizHfsrUfaOo5VZqvnztfjc8zPom7rjZgBnnY0Oxxiuv75MrWogLIW4b4F0YdKGKdLTv+W+gxFLG8c/SNv26ecU9HnbjB/e/Lvhg06qVciFVxElMFkvXyBYDbAqpA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=icdti6Ls; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icdti6Ls"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so1135543566b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767006508; x=1767611308; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EDNpH0M3uSivXuXT5U5j0XwxOr48cVPii2SiJVOuw30=;
        b=icdti6LsWw/+HVAON6tthsJrH+7zWnGbaXLy/O6kgmqgAUpIo0a2txy/M6eyF2KSVK
         TldkctQTplXkYmPqAHLUZBbl16S8pzXtse18TV1fENnabFjxx8uNdeeGsDRZsZfy+HJ2
         ZAlAHGet5N1gT8uf6t6US3mHFKZ/IdnAIEySPQ+dkKIbhH8KiSdQqtNneZEg1OWDGAhu
         QE+ZdLIlzY35V0bPgMHxpMobtDsb57tRQSsV/oh/sQAkpclVNmu22RhIhuiuucsJvsrV
         e/hCWbGYhQ4v7Icjub2Yny6cm6a6PRoQqO6jlXbA2CelkRQLDR5pxVTGxqpWw9jJPvuE
         1xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006508; x=1767611308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDNpH0M3uSivXuXT5U5j0XwxOr48cVPii2SiJVOuw30=;
        b=dU5OdH23OGZh+O5GHuW/TL9MMoDL9cl8EvSBIiIwU8p1EzWZO0LouTTuMnwbz4EZgf
         aTsTDsp5s0TmsnO8q2XMxsskPbX6a+30Gi9Hu9dBR+jW+vY/YiQpfork6Sd+G4D+cXra
         SwiylZb8+1lL5iH9w5Bz4k1/8Y+G5mWQE8yUv8h7/pDGGZljvefOz0JA45KYLQUnTANT
         UWjBhE6n47VWTbhoV9brkyDpWXFagdstZGByEqrrFqL6OiKMn6yBU34CC0ThbjzNbRO6
         FedyzvCG4VhWqVwl/RjbDzDNlfeFfXKgzcZHVoUGMKCpz2BX/kCegG+qo2o3hKXdAJ/x
         059g==
X-Forwarded-Encrypted: i=1; AJvYcCWZtnQUdvpbtCK9XGcSbia5OGqG0GVW+gH1s7X6Wm3nrFAk+4f2UJmltd1vKOPsUqAyW89znGj3ZqaGMPMFfqhc@vger.kernel.org
X-Gm-Message-State: AOJu0YyqVkKVZciCiJFf+IKG+4JC9eEWMTLSNoNaJrDwCL0MFcpnoZHx
	3saUHYWMnU21krdKWTV9ZOIbg+26aAmo4wY9opaQy2gEYxnAVMi9AvHBd7R4lbNGzTE=
X-Gm-Gg: AY/fxX7ge4bltEP75H/DfZo4l6ucVju9ivfBONFoVCDBl6+ipCI9tPtZQLrqS4vmjJo
	Qy3GzrCyr4E+28rez0PKElyaPNzw7xTFi9YYRWdBH2IWJBsJCnMOhTvXfjJeDJPhZzfWOn+/AWz
	4W7pfg7qAuNrfs80vnNI4M6edQ8t4R9q3tMassbeG+AQNqK/IIQ4W0Iy/SYQUk+GBYGHkbGWxjj
	JfA65d7qQ6DfOQqlM8nn4KkziG2diyPb0weN0EldVp4ueMEu+2Z6/487XnI4xbqzrnKPvGJLoch
	lzsFZyu/iFGMeBuLInFy5afW/D2lWTXkGrO1mPBsmqk0ev+BkpEZ2HSIkqiEE28288t0KngDQH7
	u1wza02cKw1mLvdljBd8I8maeTMEELeYHxtFPPvWb0k0jYDRlgbQ4dV58D+/55DeOfrkDnc5epJ
	tS1YlZ6oRmZkGXoQMK
X-Google-Smtp-Source: AGHT+IFdqvRMDU+1HShKXzvNt54ZV5MxDiUe71q1HsCeGk+c7DD7LsfJqZBS0W+l8rfo3mlbyZkzHQ==
X-Received: by 2002:a17:907:d87:b0:b73:5d8c:dd0d with SMTP id a640c23a62f3a-b80371d69e5mr3256854366b.52.1767006508045;
        Mon, 29 Dec 2025 03:08:28 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm31698752a12.18.2025.12.29.03.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:08:27 -0800 (PST)
Date: Mon, 29 Dec 2025 12:08:15 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
Message-ID: <aVJhH17XH1srlroL@linaro.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org>

On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
> Add support for MSM8917 MSS it is similar for MDM9607 MSS
> only difference is the mss power domain.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 46 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ffafbe501a05..2579558fb567 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -259,6 +259,7 @@ enum {
>  	MSS_MSM8226,
>  	MSS_MSM8909,
>  	MSS_MSM8916,
> +	MSS_MSM8917,
>  	MSS_MSM8926,
>  	MSS_MSM8953,
>  	MSS_MSM8974,
> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  		goto pbl_wait;
>  	} else if (qproc->version == MSS_MDM9607 ||
>  		   qproc->version == MSS_MSM8909 ||
> +		   qproc->version == MSS_MSM8917 ||
>  		   qproc->version == MSS_MSM8953 ||
>  		   qproc->version == MSS_MSM8996 ||
>  		   qproc->version == MSS_MSM8998 ||
>  		   qproc->version == MSS_SDM660) {
>  
>  		/* Override the ACC value if required */
> -		if (qproc->version == MSS_MDM9607)
> +		if (qproc->version == MSS_MDM9607 ||
> +		    qproc->version == MSS_MSM8917)
>  			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>  			       qproc->reg_base + QDSP6SS_STRAP_ACC);
>  		else if (qproc->version != MSS_MSM8909 &&
> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  
>  			/* Turn on L1, L2, ETB and JU memories 1 at a time */
>  			if (qproc->version == MSS_MDM9607 ||
> +			    qproc->version == MSS_MSM8917 ||
>  			    qproc->version == MSS_MSM8953 ||
>  			    qproc->version == MSS_MSM8996) {
>  				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  				 * Set first 5 bits in reverse to avoid
>  				 * "inrush current" issues.
>  				 */
> -				if (qproc->version == MSS_MDM9607)
> +				if (qproc->version == MSS_MDM9607 ||
> +				    qproc->version == MSS_MSM8917)
>  					reverse = 6;
>  			} else {
>  				/* MSS_MSM8998, MSS_SDM660 */
> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res msm8916_mss = {
>  	.version = MSS_MSM8916,
>  };
>  
> +static const struct rproc_hexagon_res msm8917_mss = {
> +	.hexagon_mba_image = "mba.mbn",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "pll",
> +			.uA = 100000,
> +		},
> +		{}
> +	},
> +	.proxy_clk_names = (char*[]){
> +		"xo",
> +		NULL
> +	},
> +	.active_clk_names = (char*[]){
> +		"iface",
> +		"bus",
> +		"mem",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]) {
> +		"cx",
> +		"mx",
> +		"mss",

Are you sure mss/pm8937_s1 also works as a power domain? It seems to be
a plain regulator downstream (similar to msm8226/msm8974).

Same thing applies to MSM8953 as well though and there we seem to have
decided to model it as a power domain ...

> +		NULL
> +	},
> +	.need_mem_protection = false,
> +	.has_alt_reset = false,
> +	.has_mba_logs = false,
> +	.has_spare_reg = false,
> +	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
> +	.has_ext_cntl_regs = false,
> +	.has_vq6 = false,
> +	.version = MSS_MSM8917,

You could set MSS_MDM9607 here to drop the extra diff above (but not
sure if that would be clearer).

Thanks,
Stephan
