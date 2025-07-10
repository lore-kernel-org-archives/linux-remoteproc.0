Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55849277029
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jul 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158889; cv=none; b=rhbDa8Oi1B52FuH+V2MhIhfge+HiWdECQ0RkyHQr8kq+Z4Nxk9EZN96MuonfAC6qXnoyZw0QlfpYTiVWs6brh0rS7P9Db9lV9FqSLZo8BrVKhXyzUJJCY3SeSHrrI7EpBDGKUIz9h1i2zl4/bK55P2iBGZR4nBqZS9gFifL58Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158889; c=relaxed/simple;
	bh=2cIMHUhX+1c5+mkwL7rxFG92dv6iIfSQwLBq+uKyI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZj1rpb/qzvIKoGejccUzJOT3VnocRelp84GxzEn1+9rSfqfaXMFg3l8Wqlu7NVJo5A5bNjOlu4eykgbbPZLhkKB4o738b2y4Iu9mJ7x0sWga/Ccoz0paYMTL2FFjEwBIcSW1b0VTDZMVDAUpZVTLpo7rI3Wro9PakAQMpy+PpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+GCSVvG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+GCSVvG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1086257b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jul 2025 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158885; x=1752763685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=;
        b=G+GCSVvGhsQG/YChNWX26RS2P+Ornzu9trm9rfN4NIL2WEiu9Qmn/ZD20PCouXZtWl
         jKR7SmNmxDrgcoNjeZh5fkp7KMDBkhESHvIXTE+sY1R6Lld01diZZyVJKXsy3AhRTXP8
         DqeDsLlMFvscBo1cRVtFQvt8FvxssbFAVC1KeOYYhvoT/oqpPbaWxAjZjBz+83Vy0E3c
         jWzcgVXlw8CIelvT5uNtLAxq4IkmTryMoh7PMgH+Hy2LdQ00FgprfTPIxo5OA1efvpRC
         tV6lb7tbQXtFdQ6k7kbXMiZjFYNcNhLsfKjmTHy/XxloJeeVxmq19b7X2+m1S5BjcTSP
         ugdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158885; x=1752763685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=;
        b=BuGBaWjVaPxKVYMPeZcK0jYVXFJ9WUDldJZofqFiPnqyjD3iEihvwjACqdFBuZHgTX
         oOCApbRVyUzRY9vs0+da4y2E7Ym5wqK7ot4h2E+gxRurGBqV80M4QfF1VR1m+rR1p3+t
         bd1QwfnKUz+xPpqho9lJl1NzOQei6SYzc1Hx5TAIpcVJ8/lvNsGEGNxo3cnTqfdDyVmA
         jfod7boUp+eqdYfC/klnQXiQM09FILL37zqRSXDS2IX/YgLDnFUOo/P41jCE+MR9MQ1r
         W0sfwJuCfGYfRe8xTw8SoMWnv23EM1u5dzCrN2OoQENkl0Bzf4Ce1tCgmGr6LEh8QVnk
         h7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUu8kS0fxPzLu+T0zaEmol9kp8M95mwueeHa8leG+AXrPwG2SwV5T7IkJBrg2zZVdSwKobFX/whXBpxL/aammdq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw078cjKPRD0X6cZadyO9ArEVdMMazOI93pAIQdHB4NWGhqQbCa
	PNm6XWGdNEtju1dofBUGKNH+C2gBd4Bh1UNO6MOzEPwcLgIB5WOWl1jkeQvs4tW6O5Q=
X-Gm-Gg: ASbGnct9RxufoGfPDTFVnSeLfUHMC6NuFH4KqcSIo2IsiuG+PZu5NPSinW4X3eO/32p
	6DscEkhPS6xlfAXAelWxCtSYO01PZYUjsvhQ0LeqIrw4DMh2k+qu8ysyH86fH0XKJJUe8OR+09g
	sEUTAyRr+cBMGIakAAMbt+UZzzgcowDsVxI/TTyyXWGEBVdKWyqXm2+T78kMHO2dDaIfT8sQfb3
	dcKvBJ+6J3ZgC7y9TYO5rKp/Ky/eqXVIRDSDq2GhXzcvuDN3ans0dcmsG/m1D9Tlkkeb6/DpxGz
	uuXsA42Ce/PHi2jLpTboWhkYCmGXmns5C6EbgaFkRB7MydHX8FWtHbtMG7rzQpZQ5KVbOHvLH80
	=
X-Google-Smtp-Source: AGHT+IGKNID1gQGS7oI+kpuFVzsANRPvMDcUoQn73a5qDrhqS0bdqghfssNgK8KQOfs1Md97STuJ/A==
X-Received: by 2002:a05:6a00:1795:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-74ea64572dcmr9520507b3a.10.1752158885496;
        Thu, 10 Jul 2025 07:48:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c1:4dff:9df5:b97c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe727e33sm2514249a12.68.2025.07.10.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:48:05 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:48:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of
 recovery process
Message-ID: <aG_SosukEqUxrHvH@p14s>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704052529.1040602-2-shengjiu.wang@nxp.com>

On Fri, Jul 04, 2025 at 01:25:28PM +0800, Shengjiu Wang wrote:
> When recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow. As the software reset is needed
> before DSP starts, so move software reset from imx_dsp_runtime_resume()
> to .load() to make the recovery work. And make sure memory is cleared
> before loading firmware.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5ee622bf5352..ba764fc55686 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> -	struct rproc_mem_entry *carveout;
>  	int ret;
>  
>  	ret = imx_dsp_rproc_add_carveout(priv);
> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  
>  	pm_runtime_get_sync(dev);
>  
> -	/*
> -	 * Clear buffers after pm rumtime for internal ocram is not
> -	 * accessible if power and clock are not enabled.
> -	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> -	}
> -
>  	return  0;
>  }
>  
> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	struct rproc_mem_entry *carveout;
> +	int ret;
> +
> +	/* Reset DSP if needed */
> +	if (dsp_dcfg->reset)
> +		dsp_dcfg->reset(priv);
> +	/*
> +	 * Clear buffers after pm rumtime for internal ocram is not
> +	 * accessible if power and clock are not enabled.
> +	 */
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		if (carveout->va)
> +			memset(carveout->va, 0, carveout->len);
> +	}
> +
> +	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +

This is a much better approach.  During my last review I said that I would not
move forward with this work until Daniel or Iuliana provide their R-B and yet,
they have not been added to the recipient list.

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load		= imx_dsp_rproc_load,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct imx_dsp_rproc *priv = rproc->priv;
> -	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	int ret;
>  
>  	/*
> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> -	/* Reset DSP if needed */
> -	if (dsp_dcfg->reset)
> -		dsp_dcfg->reset(priv);
> -
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
