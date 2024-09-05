Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C9D4AEF5
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Sep 2024 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553748; cv=none; b=u52YyqNAxvSrfHfdJpgVSgCq3Tb8SEDU1moEI3dKs3FRD6vZlT9zm0ULnGDepVgAkLpR0xMPq+cyMjGEJPvXdRDVUQgOmH4Dl8Tv+1BHW75Cc+J5q5vQzLaxT80CcOw9v0a7GAwhEF+OO4mUvdxatjq1hwBrV7gfrykFN9lZIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553748; c=relaxed/simple;
	bh=dkkZTNWxVUpcM+8yL3tPwuBjInUdDuQrLlllvYF7qmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INJcO51bykc+BEYQ4WfAHQuPrIFELtuggWBJmX7YCBe6ZMBbT40sahNQfy+y+yqKoXTfFJ3lhG+blzi6Vnxx0EhcGpYre3+sabHrGYlliOlCrhRSoFithBRYEGNYELjBdqwFF5mMPtCIijnSLs/MaUheFB0ybeO4S2obDulzMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HObYrcgF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HObYrcgF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71798661a52so287622b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Sep 2024 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725553746; x=1726158546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzXzI8B3RfBT8LMbjd33LAsI2Inzx4xG+pAVHD1cUE4=;
        b=HObYrcgFakPya0D+HXqrMtYd7YXwXJg3LjLdjwF87UojuhK4y/MG1ItX7u/lUnaDLE
         UruM28dfTsICrJdJz4HLSLz+hD7/KOpxCMZpntKcHvZCHBZxvCFbjaT9u9snbTeXkmfJ
         18r5zSvNj/GgxAT+tBz2y8GCWbOS8ddsfku+DJw6o5M0LBUJSQ4OGtV1iWzX4SB2ZshJ
         FytNjw4XMWqJbSnnEOni/ULntkmrhLrEPL4KKuAr9QWpq3qgGKJiPPSK1dTL/o9npAUJ
         r5uI8HlGpbEWful8zn4K1M3+wyNBGM1SOTIW5q0H4jVFukrKrmyHA1eV5bSOvhc5jKeC
         CTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553746; x=1726158546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzXzI8B3RfBT8LMbjd33LAsI2Inzx4xG+pAVHD1cUE4=;
        b=rfM8LONnCmQfX450/qExH42ROHTns9nIY9BfIi7BjkSVdofr+lgfybsNSyuKosLFNh
         9JlqZVVSzMkTJNvjzlrKROnj+3w95vrwNOHePPJ7IEAhelf1xDFh9Q+2IogEgyxAl2a4
         I9/drkp6md9rhhXLwd5Z9pCllmzJ/nU5gSGw+tsCKnmuuDpQ4ETIYUwmfgmky9DuCHr0
         n2ow4Rrq47yKnFjkRQDMmE6Y43Mpo3C7LZ7pPONnVLvs+wI28pZYLwpoCNoKfDistYsP
         TJLX7bRTnSPQ69ZbyYYoWPuOpAk6mZvMwgwj/hHB4AKZI8JBaZzD/QwMlPd+KSvNmMNA
         d2dg==
X-Forwarded-Encrypted: i=1; AJvYcCX/EPeWc/xIyIITQ8CCt9lvFZthfLbVIhFz2ScovD5NvPyxXnQV8O967tUxQ1ttoFcY/DgFFuTWY5kfl66a3s2l@vger.kernel.org
X-Gm-Message-State: AOJu0Ywam3UN+6U/DD4pFxqpSC6YzJByj2aR7a4ekiMoqLxDYzPuJvOc
	WHCUXmESgYCAwzOswNG/nHSTdqs2A3TsGifsGrBcYD7AWR+86fWXbH8ZOoxPU7I=
X-Google-Smtp-Source: AGHT+IFM6sMtrtkbQg14N9UtwPfPIgb+1zMojniV+9LplXVwkjJPOq9KxBJH4N1cSd0ym81QI2N5cw==
X-Received: by 2002:a05:6a21:e8d:b0:1c4:779b:fb02 with SMTP id adf61e73a8af0-1cf081cc80cmr13234968637.21.1725553745918;
        Thu, 05 Sep 2024 09:29:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3b5d:f081:c58f:f7e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7178acfa04fsm1604892b3a.215.2024.09.05.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:29:05 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:29:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: patrice.chotard@foss.st.com, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Use devm_platform_ioremap_resource_byname()
 helper function
Message-ID: <ZtncTgIS6EU1A2Kz@p14s>
References: <20240905120501.131046-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905120501.131046-1-zhangzekun11@huawei.com>

Hi,

On Thu, Sep 05, 2024 at 08:05:01PM +0800, Zhang Zekun wrote:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  drivers/remoteproc/st_slim_rproc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index d17719384c16..5412beb0a692 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -259,16 +259,14 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  		slim_rproc->mem[i].size = resource_size(res);
>  	}
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
> -	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
> +	slim_rproc->slimcore = devm_platform_ioremap_resource_byname(pdev, "slimcore");
>  	if (IS_ERR(slim_rproc->slimcore)) {
>  		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
>  		err = PTR_ERR(slim_rproc->slimcore);
>  		goto err;
>  	}
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
> -	slim_rproc->peri = devm_ioremap_resource(dev, res);
> +	slim_rproc->peri = devm_platform_ioremap_resource_byname(pdev, "peripherals");

There are several instances of the above in other drivers of the remoteproc
susbsystem.  Please send another patch with those corrected as well.

Thanks,
Mathieu

>  	if (IS_ERR(slim_rproc->peri)) {
>  		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
>  		err = PTR_ERR(slim_rproc->peri);
> -- 
> 2.17.1
> 
