Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4DF29C328
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484177; cv=none; b=cCWAbZQKkz4EbeazGlr/G6I0YAuHogP9ttBlFThfCmqHwtgKPdvK5mFIvOWaKkAdNlV36tYME83t+nqZXpRXOU77QHACgiFsGSErOZ/Ox/KJU2prC5RhxdYfA1nnp5kvltj89CznBnldKxz0Hzy9bCxaWUF602R/jBtQoCXOYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484177; c=relaxed/simple;
	bh=jePVpy6+q0ZwdOkimr3ZdSF7ygrpTpCkiZepBmNE5nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9WobcSr/R5iq8w0dSTHuYnoDoXkBlxjP4EXmOOfSaZYCk+HnyINtKkqJ1Df97T4u2LfubaVlQx7yH4pFsCe6wFEc+TPufcVUdQh2kIqKn7Y+i8eWDYJzRwVgypsU7qhzs+AFnEG+18rzWTqI/6yRw/I0JETYGsHwHHoumrLfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3eDZyJ4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3eDZyJ4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298144fb9bcso60700005ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 08:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763484175; x=1764088975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=;
        b=G3eDZyJ4v2Jw/qn3M/gUFbk6yhVdMm0TyEGcYyuT0P2EV40y+z4yHAsvl0ni1hPoqe
         3vHzb0X/2Qpw57vxBo3dGX4TVuUWabgWRSQLfzwhplDcrzXdj0WRA9mZjbAN0V7vXJ5+
         MIg7j0FyMN8uAT3rWnUcJo7WLJVeSgLlbzENSsS59NE42nePz8QnC/DdIKoHHNPRD2/Y
         8Rc+lv5GrSmKiQ+ueVncVSULouRbvKVQtWw9zeCjJCgbFDETWCGvUp5DVoQFftcSIgYF
         sx3LmVJfWNL7mPX0pGzTKB/jAmNS1rLsW1x6Xs92JpbVus0onn0Zl+eRT6BwB3G8dESV
         Jmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484175; x=1764088975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajw2E1NL4+ilWTTz+HJjdJlqtmBwlpNjA2J8C3gJWjo=;
        b=h6JrZOu3P384sLAdcGCCsXOzmJDcEgqnj7Hi6XVIHhpN+GTZMzqH2e7tAXJNJAJxx7
         vEidlEis3nMSdEZUvbfYcTWQz1EsjmfG8lfi9NLrDaQK/DSWJ4fEsq7dXMY0qXj73www
         V+HZAfP9nSeVwwOUvZZrl2cySs4L0UFI+QxbiFXf+Rd/FiEvNed57mv92KcKA1CI+oTt
         nDboERdXIoKcSi1G9NjUy5C+1k8NWOXsXlxqh7NWZE97cyOMwwvmheYscY57/HWUqbzF
         O88zFDQ/wxOVZgflZp3/JmCoFLs3f0Dk+pxzoHk3loqymyvGdAGvJ2c/zRdjDzy3Q2eR
         FEtA==
X-Forwarded-Encrypted: i=1; AJvYcCUFYrVqokBzFPJhjRqAUTGsk2irgx0TwnsTi5eBXIDE0mmebOKnLMtOesVBTEcKuCCmb2ThrioPIiPO2YBGsYta@vger.kernel.org
X-Gm-Message-State: AOJu0YwufSgHhuqeVvv6ltekCzsK0ev8U7FzDEP7GMNkBMnIkAvmTRlM
	5O5OEjaNZVTNWfcQKdbVROnJikzsLccKPicnOmCs8w5Y+ckxW/j7Bg+oetzlTGWGNNs=
X-Gm-Gg: ASbGncun2nUuFXEtDoWMuwBtEzKqU0afyGo6FUCMTLdEp7yqhZzShE3A2dh+TH/PLhZ
	wJPju5+HPZJ+PzH+uP5IsLrvWjpLWWGz69F2K6IqEvo9IPjv1ebrc+8qAhaeQqyc0SClTM3zv08
	+RxKtkUutkxmk6bo62MSNcBW8smMMXmN1/RWSY/RUm66pPYL9606sj+gTjPzSlPxbJ4hZiej5hQ
	MW5u4JTsnGNUghRl9fLcifSDg5CBCBF3zXKRXzFP8iTqp3CqXFeJxs14GFPGmrOU4PEgrRbMcjl
	tb1waq+GxsJLI6vzSmhhWoIQ1SJHYu7JkKOX892Ds1Blj2uYifyfm/NHRuPiNG0dIm9a8y1kqNm
	ArRRATBSVk6ADESv6YGGnDc3YOm8MVI50D/RH7DTTfWCjgJcwpcF3nNIP0qFDD08xv+tKEG3XJi
	0zolu8ekI/YIHM4A==
X-Google-Smtp-Source: AGHT+IFHZInbopaXHrcms/mL2ZLWLLFWIrlmSWjRDYQeHFfnq14u/a3jqiLWEErsYjmSVeHRv2ntAw==
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id d9443c01a7336-2986a733395mr195293315ad.39.1763484175459;
        Tue, 18 Nov 2025 08:42:55 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm179110845ad.76.2025.11.18.08.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:42:54 -0800 (PST)
Date: Tue, 18 Nov 2025 09:42:51 -0700
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
Subject: Re: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Message-ID: <aRyiC2m5z9M_vPOc@p14s>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>

On Tue, Nov 11, 2025 at 09:41:22AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is no user of enum imx_rproc_method after moved to ops based
> method. Remove it.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -15,13 +15,6 @@ struct imx_rproc_att {
>  	int flags;
>  };
>  
> -/* Remote core start/stop method */
> -enum imx_rproc_method {
> -	IMX_RPROC_NONE,
> -	/* Through ARM SMCCC */
> -	IMX_RPROC_SMC,
> -};
> -
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>  #define IMX_RPROC_NEED_CLKS		BIT(1)
> @@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
>  	u32				gpr_wait;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
> -	enum imx_rproc_method		method;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
>  };

After all this cleanup, please remove the goto statements in
imx_dsp_rproc_{start,stop}(), as it was done for imx_rproc_{start,stop}().

This set can get in the next merge window if you send me another revision by
tomorrow.

Thanks,
Mathieu

> 
> -- 
> 2.37.1
> 
