Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4393F9E8
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jul 2024 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144322; cv=none; b=MXAxY8xnR1YR8k48eILQqQyebjP/IeX3eedLzNGSlxop4FCCkyEK00VrQCEF4v4wCGZLpclzXqKJnrUtBHrbka5KMm1yDYOmHMoAOs4bT5So13DysfcHTlD0GmShodQe4H//ckJe1g2uQSbklUjH8WB0GgVUXqU3Xe0oEFOj5nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144322; c=relaxed/simple;
	bh=wFRmeqZAChY0vBaEki4uMRrWLGdelkkOLKoOuO9tiyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0GMgwsc3ln1ToRsLmP+EDYsI7UO5lQ//TK/OwlRbU90GSPIsPw9qM7UNaC4UOOirfIrzpmCGreXIHiLHGdjQe1iWig2fMzVRe3gONtIUmc9Y1oYsThg/cDB6JSkY0+FrlgQhJmNHBxTXEQKTUOhGwet4K180es8IRinFwSSYi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZoYQahl; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZoYQahl"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-78512d44a13so3805089a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jul 2024 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721144320; x=1721749120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRJWJNrzc2jygwsryIDGVRubrMYo6CPq74PglfU61vc=;
        b=gZoYQahlP1Z+jz6OPl3Il9H5oJSx258hT1An6uOzq8UdskDfJy2+sHt5+ALoDL+SeB
         U1rdRwxfpV1KT1jEfpDirCSPJebRsYAYduas6Cv1gJghNlzqy+R50g2cYuTZIKgLVEiz
         DRo5ThFLP7PV8xLBTDXTQNDhD0K8JtQPKJtQTkQx4wX5ioGNfqxzD5htlQ2Iibpm0FzT
         Y5Y4k3m/2z14AnkbRR+2lBbiEzYIw6k4tNTxzWqZPqs8sy8WJQMEPnghYWw/Ps8u8WyU
         7H7Xbr3c7h/nfYQav5uF3/hQtDOH3LeUoZ12U403MuOQrXzBw3yIzQIB2woJc99teslH
         zZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144320; x=1721749120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRJWJNrzc2jygwsryIDGVRubrMYo6CPq74PglfU61vc=;
        b=cP6Yb9wadFgfiAscJ3Sl9RQCFgHMBVsASD2eHfZ//SoeQAlwtocnC3bmK0k59h8lyi
         AsYk6Ez0LCKJROp23X27eui9KxDP9b3djMbsbdQxV/dPEQGcQ5PH4QKzhm6KyyzcBYFu
         ZiVSG1J5yQpNB8ajEN4i0ARVXCurAMM9kdAwzAsc12LUlkSd8JBVnRRDp5w+cNXZ0yFD
         QkMMIcYWHwRkjQcwCK27uLZSunDVvcdL3t8N/5c5uoq7VM7EjZ87YM5sJ4l27HKQ7d9n
         gf4pURSvXuyA43BVVF0eFLrOs8k4qLAVshdPcejPPamUKt7VD51wkrYMvYTNfJFkWZEh
         Q3nw==
X-Forwarded-Encrypted: i=1; AJvYcCWg8HYqoSHrro++nMpEVnfqbcz9fUMwkjFfY0TQPB6HVdLnJREXHzSEFXeoOeuchLoGtlzdEbtikKTxm2byygzzrdLHRyccNdvuGFJnN9EpYg==
X-Gm-Message-State: AOJu0YwrWmV+w3w5yuIMvIO8Kbp/GKf4T+2uIX/9CHPNwygsHrFxJ4nF
	utVi5x11w9LRCByySXLeGgbAvy7oDkGqg0aDqODPfLyEwrkpUsU5I+hlqypb0SE=
X-Google-Smtp-Source: AGHT+IEDSWIUtRywATQg3qAhHcdwjWZgT7tZwoG/YQpCa+cTCsrStW9SpatZa0yN+LXWMK82f6rs3Q==
X-Received: by 2002:a05:6a20:3d8c:b0:1c0:f097:4eb8 with SMTP id adf61e73a8af0-1c3f1273b1emr3243135637.35.1721144319905;
        Tue, 16 Jul 2024 08:38:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5d01:167d:9cf4:148e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd3f10dfsm8466569a91.17.2024.07.16.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:38:39 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:38:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/6] remoteproc: imx_rproc: initialize workqueue earlier
Message-ID: <ZpaT/Ioa9l5LBT5Q@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-3-7bcf6732d328@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-3-7bcf6732d328@nxp.com>

On Fri, Jul 12, 2024 at 04:34:56PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Initialize workqueue before requesting mailbox channel, otherwise if
> mailbox interrupt comes before workqueue ready, the imx_rproc_rx_callback
> will trigger issue.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>

All reviews should be done publicly - please remove here and for all the other
patches.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 48c48b53a3aa..9e99bb27c033 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1087,6 +1087,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
> +

There should be a "Fixes:" tag on this patch.

>  	ret = imx_rproc_xtr_mbox_init(rproc);
>  	if (ret)
>  		goto err_put_wkq;
> @@ -1105,8 +1107,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put_scu;
>  
> -	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
> -
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
>  
> 
> -- 
> 2.37.1
> 
