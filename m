Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC582FB0B9
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006823; cv=none; b=JcRawPEtxMe2K2B6wOik6gS6NDEt3CXQkOvl68H8YUJP97wgLJhe0jGG20x4K8MaXPZ6zW/bc1OUEiYpngRu4A7bZcyBn14k9gDc8asAk6Ht4kBwqmrwFad57dKxMeye7td8PMVtGKp5XczTPIWeTlHVq8jNVDpGHrNDPJcGuWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006823; c=relaxed/simple;
	bh=MNKxZ13dLy0csS0Q8BnwqAOO+/2a6wKxalUKlQsPf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkyEEDvhkA7/KWzwDZtGyEGKGbmAVzX7AxlE2Q7O6TbudJWBXwhtCS1hOzrUkYDT6FBWM3JhYSdzowyD0YhgJ2VR9e5kxxAiDNj1YVfI2795JPgZ7Sr2qiBuOSroXA3lPNHcon+0BXSdqxpmD1b+s+7UJC6RqLYVoFhSuMqo4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbos0lCp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbos0lCp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1344973966b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 03:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767006820; x=1767611620; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W0BlcXumR4uZaESfBgC79Dk7xaStWlmJAXD7mWPegz8=;
        b=dbos0lCpZImZirFV8MHi1oFhHsRnaZHfEpwqDGQXR4D5Ney8Ve53LQ/7RCSA1lD1fc
         l2xVSM5HWDRQMyrr207Gn22ZwEjcYAXf1JrWQ0LKEemuUfr2eE9A0+ur1NPYQFpYRXly
         Bu817M0qoY9yzoorP9l0azj2+Rs4ds7glpfE9UXOV948DszKr6yMrUpQd7a0pkcebhEz
         BPGB24FjFQu1F/jMqDPg/kqKJAXfMCR/9bGauEgqysGFG7SbWIHC21w0IHQAogMKzIMi
         5CyBLNTb6vdADVrm92rtSaUqyCpR10m8tsd7wFOCj8eFpu6fAIO8buXI6sor1ub2eFmY
         vOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006820; x=1767611620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0BlcXumR4uZaESfBgC79Dk7xaStWlmJAXD7mWPegz8=;
        b=etWRLnFfO7wQj6FUwklv2pdoxiNuBYkULhMasvAdpMQpu5KzpoVmDyxmZDmcZY6S2m
         r22EE6ndixfRllMJhuxYFtWzPr3VVIlJkdfHU4zq5QZV3I8OqELhbxFc0aQUbfbzmmmg
         3crpugYFjuhPuBv2IZwVx8B563wvU7dzBOew/8++Eay0P9qwv4Se/HotstmUFQCdaIul
         +d7RIT2Wi/JXleMDa/Ko13q77ZprIOUcmYtZHYwGtQgETAU0LCnUwMCOm2umJsGouxXi
         YSTYki85yJ+LSBBPzbsfx+zRUtUqJ8aFpB30xr/ILcTPuCRIjELedjipHGhfPEOzAaDJ
         40bw==
X-Forwarded-Encrypted: i=1; AJvYcCX9WyX01eQbndLBDjQVq4WjnIUE8leUWeHxtcXONscSKmFClESyX+x0v6TEQkPrc/3qHKRQPn+IeQp3W6XYpJqr@vger.kernel.org
X-Gm-Message-State: AOJu0YyPac6ApjhMtTJFirVUn1722erT0gH+T9sc35Jp1yQJEcxHuw5n
	KeJYqIzeqm6hg/V9fzudD+o2AII5iFlumt8y/RoSLQmKe2BPDQbdtI6ZvajLexJKfas=
X-Gm-Gg: AY/fxX5lfv1ddqbNtyscN+K6JAwwUVpT8LITjDLF+p/tugHpvY1dk3sWgBFjW/UT0lc
	MlfxVCV67XD9YH0M1fRX7xUht1ayOA0YV7yk8dNfFXI1u9AMToTPTOc4WEdMJJJgnt8zUvD+pK0
	Nz+TfO5gqT/BqDHGA2Tm25C4nD/67zeexvNUNVR9lDMrEmpTKic8j85zkvhfyyJUa72RXJhnbpd
	c+5tHx8gfQdMLtC5WdIJmINGjXjCOvVFk0+vgOPdTfgBK/VLuwZnL55IGEyv/PeJMsH89GhStOi
	ocVIeB1+q48FSSZMbJGRWywPDbSL03294Vdh9Nec7n1OyGYEFQPe/wuiA86HItN1sZnfIOooq1Z
	6VszMlgsM2qyY5BYDHpsUNdCLzSTlaOY3ju+fqJAINNA/lbVfE2NkvRmFszq0zSAkX+fr52y8zi
	UGcxtpYnw6gctpLZsb
X-Google-Smtp-Source: AGHT+IHpHbSYeUsMKF1bneJOp2e1mcsZqW7jjFgL1tS2yD3fcf9ju47/5ORafIsbEaCJr1G9FTrRbQ==
X-Received: by 2002:a17:907:94c4:b0:b80:4615:1d2d with SMTP id a640c23a62f3a-b8046151dfbmr2885186966b.3.1767006819915;
        Mon, 29 Dec 2025 03:13:39 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a61595sm3362188366b.8.2025.12.29.03.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:13:39 -0800 (PST)
Date: Mon, 29 Dec 2025 12:13:37 +0100
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
Subject: Re: [PATCH 6/8] remoteproc: qcom_q6v5_mss: Add MSM8937
Message-ID: <aVJiYSbpmHMGJarA@linaro.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-6-aeb36b1f7a3f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251228-mss-v1-6-aeb36b1f7a3f@mainlining.org>

On Sun, Dec 28, 2025 at 03:21:56PM +0100, Barnabás Czémán wrote:
> Add support for MSM8937 MSS it similar to MSM8917 MSS.
> It differs primarily in that TZ needs to be informed of
> the modem start address and pas_id.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 49 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2579558fb567..2ffcea7dbc79 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -261,6 +261,7 @@ enum {
>  	MSS_MSM8916,
>  	MSS_MSM8917,
>  	MSS_MSM8926,
> +	MSS_MSM8937,
>  	MSS_MSM8953,
>  	MSS_MSM8974,
>  	MSS_MSM8996,
> @@ -751,6 +752,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  	} else if (qproc->version == MSS_MDM9607 ||
>  		   qproc->version == MSS_MSM8909 ||
>  		   qproc->version == MSS_MSM8917 ||
> +		   qproc->version == MSS_MSM8937 ||
>  		   qproc->version == MSS_MSM8953 ||
>  		   qproc->version == MSS_MSM8996 ||
>  		   qproc->version == MSS_MSM8998 ||
> @@ -758,7 +760,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  
>  		/* Override the ACC value if required */
>  		if (qproc->version == MSS_MDM9607 ||
> -		    qproc->version == MSS_MSM8917)
> +		    qproc->version == MSS_MSM8917 ||
> +		    qproc->version == MSS_MSM8937)
>  			writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>  			       qproc->reg_base + QDSP6SS_STRAP_ACC);
>  		else if (qproc->version != MSS_MSM8909 &&
> @@ -821,6 +824,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  			/* Turn on L1, L2, ETB and JU memories 1 at a time */
>  			if (qproc->version == MSS_MDM9607 ||
>  			    qproc->version == MSS_MSM8917 ||
> +			    qproc->version == MSS_MSM8937 ||
>  			    qproc->version == MSS_MSM8953 ||
>  			    qproc->version == MSS_MSM8996) {
>  				mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
> @@ -831,7 +835,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  				 * "inrush current" issues.
>  				 */
>  				if (qproc->version == MSS_MDM9607 ||
> -				    qproc->version == MSS_MSM8917)
> +				    qproc->version == MSS_MSM8917 ||
> +				    qproc->version == MSS_MSM8937)
>  					reverse = 6;
>  			} else {
>  				/* MSS_MSM8998, MSS_SDM660 */
> @@ -1466,7 +1471,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
>  	}
>  
> -	if (qproc->version == MSS_MSM8953) {
> +	if (qproc->version == MSS_MSM8937 ||
> +	    qproc->version == MSS_MSM8953) {
>  		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
>  		if (ret) {
>  			dev_err(qproc->dev,

I think for consistency it would be cleaner if this was a flag like
"need_mem_protection" (i.e. something like "need_pas_mem_setup"). Then
you could reuse the actual reset sequence from MSS_MDM9607 similar to
MSM8917.

Thanks,
Stephan
