Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710701C232C
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Jun 2024 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597873; cv=none; b=KZ3jGECjuMFrY3fcJsUiz9m0RrakK5WxbEFRv6nQFgOm3Q8j8fTNeJaHRWB7qSVbmmPfnqErLe/vdFI5P+SLhF8ZpdO8NgCNvLIxRgcuB5QnkKm+qMTVdUc4L4IOdj/ZMOlNdKoWIldOJJEHX9qB+5ePGIJfxvTyLIaOXKGS58o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597873; c=relaxed/simple;
	bh=lyCr9Ts8yOItO/JjBC31u0Jzvm/bIEehcd6kdgpqGmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiKTOSkPOQCyt7bcN7Ofo1chbwudaTy4vjrWYDNrfEemBsR1616Q94YAhgqPjcw7yMSUu8Au2i4nqSuFK+7uI+gEpZ9g2rd8k/uXGmh5cy/bOa0r8GG1CW8jvm9eWC6TGo/zy3SijLbTcIXee1AW8RWF3Uzwj3MKev5aaljw+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxtV2BLH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxtV2BLH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fa2ea1c443so6888585ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Jun 2024 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719597872; x=1720202672; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+ruGPETppbEAZdscNhJIuUHT64dVUBzmWwyvnp1b7w=;
        b=UxtV2BLHFb/9O6h1o9CA/8Vv/NfuTKXWDh+9SQmahY1MQRibbV/n8o7tyuekSdB8Yz
         +CQdjON5kqe5Mkm8VTGxyVZD8S5UxHY7sUhTyIOdIqdFnTTudhdtdnUg+rVrtCFrgD7y
         k5aebTuSyjLxXlvkJG9WXvzV3y9JvaAuWLbbiDSLYZAHpkscKn1dBZEUKmEvtpkRDMes
         zu9lNwLVWQwDnc/JPqffCG+gcjBBVZn65whi871j6a3ERZKwJ4nD0Jl6e5shWXKoLW7+
         M3ePNQ81SAILM/gZl+QczNAaPX+cg951HID+30E3uQwxJWY0Yl1Xv7sM6Qgxingt5d00
         U+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597872; x=1720202672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+ruGPETppbEAZdscNhJIuUHT64dVUBzmWwyvnp1b7w=;
        b=sT3X5Lb+VoZ3snRWIukg+fEAlvBqbM6rWBwEog4hit53eruonfIVmnRtkQzHclzErj
         yYNCJ0uMUIV67OSy9qe/4C3LYNbTpSkmbeydzigicHGx6WIjoy3aF5uImrPRyHlN30xu
         GJxKHzrDogQk/N8YmDCBPWB1ZfhRE9bu1fCjohDsN6C2irnzszXo+NomHI1WU+qRveIe
         JtFj2mdrIkwI4CLqnC+7goNnksRxpRm5fC2InMKOhvYIG0zO5rdEL+IZxk1hq4dGVb4c
         +qWfKwsoPBbjc5aqftwXu6Ra8BJPhi1SqCeY8RpAIpwI28cBR1HE8W3kW0jHr5QQr8Dm
         6wxw==
X-Forwarded-Encrypted: i=1; AJvYcCUkH00hiKES8e9sj0vv2qATYLNdyiJX45kOeVVLj0RqFhezFryMBcBu7gZjBDAAfioST63xo5d/jzi5zH5not8R0uckfnYezzGNTb/3If1dUQ==
X-Gm-Message-State: AOJu0YxPgjQJMdymN6K10WP9r+ZnUl//nYHpaG59jzB+gDGYYIBHHh4A
	G6xSQMPtYzf5jfWrzF9lwKjfRKyFTqYYl9epMddEaiGQFwx25LgA0bx/8cf/KeE=
X-Google-Smtp-Source: AGHT+IGCvLrXWzySAlrNqbCAvh3eBYrqwRFPdz21iCBkv/nqIVi2SUvaRkJ9vc+Fe8iroSuxGmGXCw==
X-Received: by 2002:a17:902:ce81:b0:1f7:2bed:226 with SMTP id d9443c01a7336-1fa23ecee77mr197498935ad.36.1719597871540;
        Fri, 28 Jun 2024 11:04:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e53e:a53d:f473:181e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8695sm18341165ad.109.2024.06.28.11.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:04:30 -0700 (PDT)
Date: Fri, 28 Jun 2024 12:04:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm
 memory if missing
Message-ID: <Zn77K/nny10G4sXN@p14s>
References: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>

On Thu, Jun 27, 2024 at 05:20:55PM -0400, Nícolas F. R. A. Prado wrote:
> The current code doesn't check whether platform_get_resource_byname()
> succeeded to get the l1tcm memory, which is optional, before attempting
> to map it. This results in the following error message when it is
> missing:
> 
>   mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
> 
> Add a check so that the remapping is only attempted if the memory region
> exists. This also allows to simplify the logic handling failure to
> remap, since a failure then is always a failure.
> 
> Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b885a9a041e4..b17757900cd7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1344,14 +1344,12 @@ static int scp_probe(struct platform_device *pdev)
>  
>  	/* l1tcm is an optional memory region */
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> -	scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp_cluster->l1tcm_base)) {
> -		ret = PTR_ERR(scp_cluster->l1tcm_base);
> -		if (ret != -EINVAL)
> -			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> +	if (res) {
> +		scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(scp_cluster->l1tcm_base))
> +			return dev_err_probe(dev, PTR_ERR(scp_cluster->l1tcm_base),
> +					     "Failed to map l1tcm memory\n");
>  
> -		scp_cluster->l1tcm_base = NULL;
> -	} else {

Much better - I have applied this patch.

Regards,
Mathieu

>  		scp_cluster->l1tcm_size = resource_size(res);
>  		scp_cluster->l1tcm_phys = res->start;
>  	}
> 
> ---
> base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> change-id: 20240627-scp-invalid-resource-l1tcm-9f7cf45c17e6
> 
> Best regards,
> -- 
> Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
