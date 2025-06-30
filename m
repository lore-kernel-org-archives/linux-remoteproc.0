Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0869419C553
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Jun 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302594; cv=none; b=WpZ/cbZhyXDBguySEmBWaP5Lw/LPM2HWQBDEDEh1KfQJIR1QBFQVxQRDLvXIsOZOSjEThv2NL6tCyg7MdhOK8i+3yvNH9KSPp4UmpXUMdvDqBlfjKWRYSNwzJe/OM/TmxKXNG0LA3s1Jj5/N9VQcvKtMI7I+AdK9oBsJlmgaUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302594; c=relaxed/simple;
	bh=QvWVQDEMrJPEoKCjlEPBqgdJEtzpm/ZPTWF2ZHyA28Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3jLIp0Q2jA5PEI/T80TTMLwiLPTS+0jVLwGucS3znOAUjQn9ltkNv6k2kyIKkWtDXgGzofnNy00H4XakkAHF5ZT3OJs3lCPRvqWoi/JC7FiJ3Xt1tzLC3Aw/6YrZmIMIuMOiAlf2l2A3jQ6Xe8q87J/bZxpZTEh+Ig5z54MSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A31KMlth; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A31KMlth"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311a6236effso1521250a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Jun 2025 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302592; x=1751907392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=;
        b=A31KMlthlEev/0WRpBmkOr83YBdBjwkcjL9k8/x/EDZDn2yzaFXv/ZSqSwICrNz8Dv
         FTkapKhIdG8j/cf1Hy9xVaO2kGF1VX8ofPDvwj14qr/Tcpa7Zg5esiGOqFeKNgKOkvoo
         i0ZXX1eSjvtASS8Z92lbwKM9kolIWJU9Xj1ANqeBYF0mgdBYCz5qTUj70oaR1DQfnsdx
         ug99eO8F56K68tOkbOtWCDiyKQp/zZtKHUTCM8Xx8lP7C+AngB3/dbxHsIvEbl77z1s3
         rkeRfB6ahTLvXqrUuhqj7ALylskY/E07RLjgZy2wE7kDDVo1xNvgS78IoDCYG0V7ARDp
         1bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302592; x=1751907392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbkSOKv1c6+ZeTPPDtxvzHXfz9bRwbs8SlvC2AxNK4U=;
        b=kY0mI/TnRlxGBgnnAifpC7d/IKLUepTlt7oUMVBD4jXmydq0GWC3oqzuV2DtbRokL0
         p2FbW+UOU5On9SF8/3KpnfARbXcHHNqGl48knmGpNIBt3Rdx4Id31BtVcAxzmhfw1k14
         tuywyUqMoMBeWH7mrPjQ0LB/KSdtGCgasI9+0Nkh/h5Bj4nfMxrC7VEeit8el8C7KBBL
         nzidui8eC5BieMECGNcCeO6doUbkAwyUHOAvrKRQreTQURXGfyhF8XrRkMoGPgw+++jA
         0NJYQ2lTEc8xZgYYutHhyReFhpoYJkaC88lgmdgyvtvD96L/K+rH4H9cLOfP9dMO2O0l
         unGg==
X-Forwarded-Encrypted: i=1; AJvYcCXla/xY2IMRKnw2jSRfJS4DvpRkqS6Xa/An+lZQ6lPSvUFn9YOlODFTjVpxdno9D6ItQcMTiV68OLZR41v4ldUP@vger.kernel.org
X-Gm-Message-State: AOJu0YyqaaDg0CRARnuWBfc753wn3LYj2UcXe7zFJzfvi7GEH5xS8HH/
	Sa9A3365WASIohOjMrJGZ1hzdsF1jIrFUV9b5Zi/ZJURGItpxEZpyFQBIkCueLdj9VQ=
X-Gm-Gg: ASbGncvS4wRmUSEdLxXKiS+w6kEHiotDGJo5UUDgYSiGglInlkVAuaLRfXFPWEgSzf4
	Wxk34Ju5vS3MsAxSdoYWbEpe7bR/r8GR6ewWrTb4748Wq1tCgU12ZEIbRSPiF3jccItVNCk7A20
	yOV9QAGb+zfISH9z+ic5kLnyFtl4n2NbFe+r7EiRJX8MBL96E80mys0Unv9i7G6Xtd4yjjkC4m4
	TJU+FLCre8lzDRANv6j4wi0Np1pgJ7uGkyaf8mEGZaGHLhqfy/kxhDTdpRGHfP40/A5e1inOYsn
	RVY1cK0iYUWj45IMP3UJc2B9teffpEhPy2uFYDa73cCA1T6xK4ZXWltmLoxtF6yVig==
X-Google-Smtp-Source: AGHT+IGWDgD+VJi4svWBlq3PHDkqo771atH5H1zxELbsknAHDzHX9IJdZF8QLWZ//OrPu/7q7cX3qA==
X-Received: by 2002:a17:90a:d2ce:b0:312:1ae9:1533 with SMTP id 98e67ed59e1d1-318c911beaamr17432196a91.1.1751302592257;
        Mon, 30 Jun 2025 09:56:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3274:25ba:45cc:d85d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fd6a9sm9115056a91.40.2025.06.30.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:56:31 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:56:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGLBvXtSRlaKujqM@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618062644.3895785-3-shengjiu.wang@nxp.com>

On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report an error "ELF class is not set".
> 
> Remove the DSP IRAM and DRAM segment in coredump list, because after
> stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 9b9cddb224b0..9e7efb77b6e5 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
>  					   att->size, da, NULL, NULL, "dsp_mem");
>  
> -		if (mem)
> -			rproc_coredump_add_segment(rproc, da, att->size);
> -		else
> +		if (!mem)

Flag rproc->recovery_disabled is never set to true, meaning that since this
driver was introduced, some kind of recovery was available.

I worry that your work will introduce regression for other users.  Daniel and
Iuliana, once again have to ask you to look at this patchset.

Thanks,
Mathieu

>  			return -ENOMEM;
>  
>  		rproc_add_carveout(rproc, mem);
> @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		goto err_detach_domains;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> +
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.34.1
> 
