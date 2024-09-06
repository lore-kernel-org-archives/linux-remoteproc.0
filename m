Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4D1D3624
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Sep 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638454; cv=none; b=AZ7gKZvM77hrA9I5PGnwxTsydRg6N3NPFZWcoUUKYgZM4uzS6SGjZEni9ik8AvveMKhN2ZbJaUz78kpi8SAQ8DReclxVgv2nOB2pXM3W6ccYLWD04ASm4bzYkM8JM0mW2OZOZ+AxQPOCD1YE7FN5lcgzA47/t+8Bez2Jl+cuA7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638454; c=relaxed/simple;
	bh=UHFZOfgD7cL5bCP/gNSO9xjB4+Tyd9BVptZzsxDdsmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlbzVh1n2bm2WtWfumuGIFWbxFiQ0ugEPyx1i7WqjzxCX4fkIXltBMICNWPAhiE1zcdevV5aoyvQn/fCPDt/PQT4ZW3LVHFjHYueXYUuXoG3SKabDMdLDNWxkMAn5bolRb+yGnc0r0AmP2zFSwI+ChuSjZH4t4l9mhiKtgcvtQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMSmkVBk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMSmkVBk"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso692951b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Sep 2024 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725638452; x=1726243252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=toTplj4KMuvyN0l5rIdW1DOLNl16Y9Fhi4hD9+9t2cM=;
        b=KMSmkVBkMWBmfykt0JomI31ht/QsAzzlbiSsal8uSniYQ1kGbWIu6pBkWihYnqjFFB
         yYtkejKBCxa6n8pVnvoazSnPwGcpMu06y6WS/l9rHqCO0J4EUDJR1ztOb2RGjsUkKB5N
         vTOXMZz9WrV1yjbs8n0bG22pZhTG8MAFv7Ynlk3M+NYUwyl3zSlE0UQGrqL1SiU56g9J
         Ba0zDMaJcBCJWDVBvoK32iE3c70l58ZbCpBXN2R6E0vWSVtXKBB4SCIImJ8K7kzivkEL
         400p8+qBt8PIc5I2SocG+PSAIfb6AiWZhR0FsdQsuEdMj09LEa60k+7heP1Odo41W55u
         fIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725638452; x=1726243252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toTplj4KMuvyN0l5rIdW1DOLNl16Y9Fhi4hD9+9t2cM=;
        b=oJU+YGP5Uox67b4Ufq8jH0OnxjqOVWgFCRgzAblWj/quoHN5bbwADAJFKzsSxq2Cql
         LfS+xRtwTRzGOUE0aeCRPPHSFogBy/JrYiSYgu4xbcttDvcMCBncQGdBNRKVSqDJ3K+f
         edlg2P6NPEbKHDT6WGZDMJd5vZtpXeFsFaqi4IwxawtShX7SnQtS14eQ+/0mu7TVlb+x
         ytksjGEqKm/Xv8sl7L3E7kD5ciapme94FQkZ/HCjU+BJrIN8TXQJnrFIQITlfbF9fQr8
         TDJyctrC730kiKS2YlULLhQyvudXL+4Ln8DZVG8IFtNoKUqsEVvnVJ6PhMfUyQkxtont
         8pAA==
X-Forwarded-Encrypted: i=1; AJvYcCUoJAkkaaOVmDadT6izMpczwpLhMOI8Dfn/yVDa7xjZvS26evejMsu4MJRWI1YHRBYUtjHsxK5u9r/uuuLG5f7o@vger.kernel.org
X-Gm-Message-State: AOJu0YydKh2dg1TdGyeJuK85xoouGofWdOJ3i0QYDELWngrq9EmMrvit
	4XiZ2PqfIUphno0OY9dduMajc/JalQ+W1odMS/Nn1kPeLqCWITgqtImR+/F3s0Q=
X-Google-Smtp-Source: AGHT+IHI88SoF8kAI8W/6QKB72EIOme+yQXLE7NZ5kvKEkTzONisVquRRU2E0mdD7Cyyd3NDl8e5ZA==
X-Received: by 2002:a05:6a21:3117:b0:1cc:f14e:b11 with SMTP id adf61e73a8af0-1ccf14e0d04mr28219394637.53.1725638452465;
        Fri, 06 Sep 2024 09:00:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b394:c2cf:8799:232f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71792ef0f4asm2546603b3a.33.2024.09.06.09.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 09:00:51 -0700 (PDT)
Date: Fri, 6 Sep 2024 10:00:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: patrice.chotard@foss.st.com, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, chenjun102@huawei.com
Subject: Re: [PATCH v2 3/3] remoteporc: ingenic: Simplify with
 devm_platform_ioremap_resource_byname()
Message-ID: <ZtsnMHHYA9zlFdDH@p14s>
References: <20240906113405.92782-1-zhangzekun11@huawei.com>
 <20240906113405.92782-4-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906113405.92782-4-zhangzekun11@huawei.com>


You still have missed several instances.  I am dropping this set.

On Fri, Sep 06, 2024 at 07:34:05PM +0800, Zhang Zekun wrote:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  drivers/remoteproc/ingenic_rproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 9902cce28692..1b78d8ddeacf 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -183,8 +183,7 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  	vpu->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, vpu);
>  
> -	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
> -	vpu->aux_base = devm_ioremap_resource(dev, mem);
> +	vpu->aux_base = devm_platform_ioremap_resource_byname(pdev, "aux");
>  	if (IS_ERR(vpu->aux_base)) {
>  		dev_err(dev, "Failed to ioremap\n");
>  		return PTR_ERR(vpu->aux_base);
> -- 
> 2.17.1
> 
