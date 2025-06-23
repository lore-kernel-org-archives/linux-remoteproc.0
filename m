Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B7299AAE
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691757; cv=none; b=bkUkwDk0J7I62IO3gQgCN7TbwKEp72LFuLZAhwwyvpxSmyRFBjm+4G+oN2U8pZ+BACK22E5xxoeKZjFtGXNS43RHnXZ9sjxG2OWoXQUx44u/oe8ZvoB4YGvLMkDO8PYb7up9Oz+9zUFKX/RL2DksPvaAOhnUTxzSXL+yBcmkMNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691757; c=relaxed/simple;
	bh=hY1AO9wd7FYeyL43dCiTnguCwp/cs4kPIauJ1coyPFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzubkmtYvWLKoQvJ2ptowAMf8QRIZd6flbZ+5lSMD8hwUAPz6LaazOJHBIOyHRchW6KYR6kivIZufrllBTv4xqwh0oaqvtsdOyz17z6/Uza+dGq/UD0nsmBW6XBgBJme9p9OuiC9ArZwntdiBQpLSBErB1NfADBMpqJgKobJ8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ecvmKvQV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecvmKvQV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-236377f00a1so39406065ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691755; x=1751296555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=;
        b=ecvmKvQVSsFDCL4gILMJcuuv0vsvKhtdS2iS3QwgZ8v9BVO4m0kn1XewyZ3vFdbZzd
         INqAk62Zz+oZe0dCKX4nX9F7kv7UOYC8g2G/8zGpUJPb+XKopYIijISRxe3VQYoiy7Pp
         8bxm/gxc/5mUoTQN+bh6YAROdbYEuwQFc56v11MVmOJcrn4u4AN1DXQsCuVJDWqF9TYe
         SdGIgJHBIP231dk8objzems6Z53hsBXyd9dkpb0DsphGKHCOOoCD0zFra04BXH6YCJgv
         EGACSMZL9cnQQcZJvdTKVuMi8350JkcF6R16DL+DCcb84v+IJAV+/tGPvWcQt7iYKrKS
         N3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691755; x=1751296555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=;
        b=r6KYPJ04py4AlMfbzndRZOORBMwFLhyvQLsPEfsXKs+FLJJUbP0JVsf7YRyXYEsv8o
         fM+Lhtyhx4davkBWhbsSeRQ7YjWLIZZU7uUU5wSBdZ0mqdlxMofTWZKpUnLeYdFnigFC
         MSS5bwqO0s7u11oN895FzX6TNuVEBrn0fEYE42tMpCCJvrzhBpLstYFK+ca/ngqUiyxM
         rmiAbv0d6ckqMjFTYMsItDUUeBWkR8C4OLe11pYTsAVwjWhiDv1AWtaMLSVer/u3iAef
         xQvHMu+nhl6QBo1kowWkC8bXiQzgcP3xMDgS/CQcXh+nNCDG95OUs4MiXNwepR28EG2p
         mipA==
X-Forwarded-Encrypted: i=1; AJvYcCXh2WlcSUsbXh09qtUy8QCxA5VYpsWcqm3Xo4NuvHBExaTGPonqaYho7lrZwMP8qu4jJ15G3HTbqIjQYQZXJ6zh@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsgaPL2Qu3nzP1ujdvgn2BI2eEbEfOjUpGlVnq2xOeejwAfCK
	RZPzMe36V85oJb2swtWz33FLT++tMxZrJupEh1TA9OBirfnSX+VFHwOBTHkyja8/VvI=
X-Gm-Gg: ASbGncsHIe/5eKrqkP+Eb3w6MojMfBruu4Z1O40DBSOcHey3gmfTkVaB6KmGDs5l1v3
	Wm/FVO6lJLiagD2p6FaWmO2J+djvEl+aO2kAz8xD0dzJrRcZB2ZemhbtcmyouZWVvf2ve87QKF2
	yEL/HVBueZyfKs0ff40L10NAJMRDrUdf/B0Br96HGYtG+dBbm6UTtiGjBZzomtMBbHWcDNW63ti
	QF03EXv4Gka4sCFsrXjdj2vSDVtROZVN99DnosY4pMnAbGGFt+CxnQ/JZ1ys/jtLjXmRipcZCXY
	uO/Cjlbx58rMqj9J7rA5/EEviB79HGPuBD8gTmTccyMCdb1lOYObTIqF09H+Iliz
X-Google-Smtp-Source: AGHT+IGEfd7ew/DbegL4/ehEu6z8rdU2NqGKWQUxfqGQJFlSmPlquHaa0QFJscSdtTcWRu86BS4OCA==
X-Received: by 2002:a17:903:1b66:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-237d96dfe41mr236501275ad.10.1750691755197;
        Mon, 23 Jun 2025 08:15:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866488csm85961605ad.158.2025.06.23.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:15:54 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:15:52 -0600
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
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when
 M-core is managed by the SCU
Message-ID: <aFlvqK6SHvWHIpMn@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-3-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-3-hiagofranco@gmail.com>

Hi Hiago,

On Tue, Jun 17, 2025 at 04:34:49PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> by the bootloader, M-core and Linux are in same SCFW (System Controller
> Firmware) partition, so linux has permission to control M-core.

Ok

> 
> But when M-core is started, the SCFW will automatically enable the clock

I find the "But when M-core is started" part confusing.  Started by who?  And
are you making a distinction between "powered up" and "started"?  It is not
possible for someone that doesn't have HW documentation to understand what is
going on. 

> and configure the rate, and any users that want to enable the clock will
> get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> fails because clk_prepare_enable also fails. With that, the M-core power
> domain is powered off when it is still running, causing a SCU (System
> Controller Unit) fault reset, and the system restarts.
> 
> To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> because SCFW will automatically enable and configure the clock.
> 
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v4 -> v5:
>  - Unchanged.
> v3 -> v4:
>  - Unchanged.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Commit description updated, as suggested. Fixed Peng Fan email.
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..627e57a88db2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux */
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	/* Remote core is not under control of Linux or it is managed by SCU API */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>  		return 0;
>  
>  	priv->clk = devm_clk_get(dev, NULL);
> -- 
> 2.39.5
> 
