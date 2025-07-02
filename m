Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3A28B41A
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Jul 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466354; cv=none; b=blsYtOQ+UE7PwioyqgocbFCiN+56O/9dqi6wn5OYmDWHPmOGLWYymuFXlaJR2XcSjnsTmXSjwSfb/tdXv3YeCxyGrpmky9+GLQLSZy3O9dNNpcIqCVvMdw7e6UsxJ8wCiNC3lSJ6TIQ9hRFuhJedrBEX107gQ7HSMLYrFj+IsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466354; c=relaxed/simple;
	bh=XI2aabHxDjSDZsjSbjqRlue+1AmCMU13tnFObRNUcYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNbp7oEIO/OXt5jNHLb3Ttpv4GqBh/eJUU/pGEqGX7TH6EuO5twTo2LbWSEEeH63cjXQrpjUv6AvSmvGno7NOCUxO0Qm6K12ySuHuECOIeX8BdkI+gciwLEWrclEh7hY66miOVK2eo8+dSIe8kDn5L5H3gIoVdVm9MemtIaNSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+JNuQkj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+JNuQkj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234bfe37cccso83393395ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Jul 2025 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751466351; x=1752071151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E1kr9u8m8E4TPdeiQ7uwSuSGKdX9x6J9xyjPynOJkDg=;
        b=a+JNuQkj35N0lPgIX+2ayY7f3pVANPHKaMqsIHTp57eIp3LHVucrOuoB4r3EDqmvJN
         8sG+6EyrM/2dYnf+HRuz7qtZeiDCIzdPuiWdsnH6g4N7gpbwJj4pnbigq8mUrO+ZzRYX
         vqcX8S1fq+CaQGk+cEAM+t+XNx8GaF1fWSS6Xua7uxcYG+Z5FvEhxwCg3POyHyRamV9a
         14gSq0F0sLVIO6OF8tMXayMWzr6KiAieYOWclDIutrxfJzDr2fSHoS4XXXItVTAMBMtR
         7ONjDDQ+m5IjFWQTcaQKVWg/Zu8G02Mo6X+vZU2DWiSCepJQPG5MjznAeIiyzVHava1m
         zBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466351; x=1752071151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1kr9u8m8E4TPdeiQ7uwSuSGKdX9x6J9xyjPynOJkDg=;
        b=raDsCa0kwHWCspAWQVfflpW5o5+CRXAyOAXePRrOx5aFCtkXIxK6S/bxugVVOhto8t
         X4LU5Dytd3OHDjyxyxBKQI7UExNYKpv3uyE3SkTrEk0T58cwxKOX2ngYv6yy7ThyhACm
         jNegbrWs2PIV2efYxAkLfuJVxDBmiF67cAPzqnX/N5Az8rRau2sK13gCk40d8/c7Z/iW
         TDrcx7m/wAclhlA6rEinl802zr6a3rc1gigU3quKC/d5WW9WVrJ9G7xijdu5NC9XK0Eb
         3Hr2p71bRRHP1IwYUFNWXurjPf/9NVXssR4B2b49TsGA7wnyTlnWAWPCgvsw2B8VYGmx
         7mFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC7zo3tPL3NW5osletqRuU5iZBY5y5O/V3rcZlsP+fC8b8swsff3mqxqEbTe3OrugC4CtRPXLzA+/+TiQxhyvl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb48kRlaqwauGfesJYogv2GPx8PefQrfNKPY+2zn44gbbI8eqf
	NqnaXT5zVDMXMJor34Bp/Nefnn31E4KyAF9Tdya5aiwtdGvXhWBlju+V+NGmU8k3fy0UYgixts7
	pRyWPeSA=
X-Gm-Gg: ASbGncvIKPwya+R8F9rx5/feX9etR8vhU3Ykn7DItZA01wpxAD7F+EIpwTZxYKw+9vI
	cC0cYBoK+Irk3+6FkHw6PdPtb0pMeMReFQGSaJi7lL38gQQT/cl29CT984gDCMRSLMXYjj9B9PF
	vGDkxID9+67Rpcqzr8E5wVU1uYdCzkBRa1hmnENMjKtG3+7Un7dzbX5xEJypegDolj9MWzvpGKL
	WERkRcHo1xMtjqyi0BNov4sUARyyBICLX+ch8xXWihfLfbvCBkxYIJpDt+iePiUrIDJ3Pxv/zvy
	N4BgXy1ZiNl5HMPDDVzzG0Luy3sgEZDJ5EbUWJ3CEuh+g6b5XW3ADrn9UN9hG0M9YA==
X-Google-Smtp-Source: AGHT+IGACXNzORcOLr63yAnV+v1XsFnEOTBrD3FtNZjqSYPdOEFrg73DioscuFNcU4UYVROnpOULxg==
X-Received: by 2002:a17:902:cccc:b0:234:c22:c612 with SMTP id d9443c01a7336-23c6e61daf1mr43537575ad.43.1751466351325;
        Wed, 02 Jul 2025 07:25:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8b86:98d8:fd22:2368])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ad16fsm140424455ad.141.2025.07.02.07.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:50 -0700 (PDT)
Date: Wed, 2 Jul 2025 08:25:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: add shutdown callback
Message-ID: <aGVBbPO28LlLlZmT@p14s>
References: <20250620195728.3216935-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620195728.3216935-1-tanmay.shah@amd.com>

On Fri, Jun 20, 2025 at 12:57:28PM -0700, Tanmay Shah wrote:
> In case of kexec call, each driver's shutdown callback is called. Handle
> this call for rproc driver and shutdown/detach each core that was powered
> on before. This is needed for proper Life Cycle Management of remote
> processor. Otherwise on next linux boot, remote processor can't be
> started due to bad refcount of power-domain managed by platform
> management controller.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 40 +++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>

I have applied your patch.  

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 1af89782e116..30294e7fbc79 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1463,6 +1463,45 @@ static void zynqmp_r5_cluster_exit(void *data)
>  	platform_set_drvdata(pdev, NULL);
>  }
>  
> +/*
> + * zynqmp_r5_remoteproc_shutdown()
> + * Follow shutdown sequence in case of kexec call.
> + *
> + * @pdev: domain platform device for cluster
> + *
> + * Return: None.
> + */
> +static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
> +{
> +	const char *rproc_state_str = NULL;
> +	struct zynqmp_r5_cluster *cluster;
> +	struct zynqmp_r5_core *r5_core;
> +	struct rproc *rproc;
> +	int i, ret = 0;
> +
> +	cluster = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < cluster->core_count; i++) {
> +		r5_core = cluster->r5_cores[i];
> +		rproc = r5_core->rproc;
> +
> +		if (rproc->state == RPROC_RUNNING) {
> +			ret = rproc_shutdown(rproc);
> +			rproc_state_str = "shutdown";
> +		} else if (rproc->state == RPROC_ATTACHED) {
> +			ret = rproc_detach(rproc);
> +			rproc_state_str = "detach";
> +		} else {
> +			ret = 0;
> +		}
> +
> +		if (ret) {
> +			dev_err(cluster->dev, "failed to %s rproc %d\n",
> +				rproc_state_str, rproc->index);
> +		}
> +	}
> +}
> +
>  /*
>   * zynqmp_r5_remoteproc_probe()
>   * parse device-tree, initialize hardware and allocate required resources
> @@ -1524,6 +1563,7 @@ static struct platform_driver zynqmp_r5_remoteproc_driver = {
>  		.name = "zynqmp_r5_remoteproc",
>  		.of_match_table = zynqmp_r5_remoteproc_match,
>  	},
> +	.shutdown = zynqmp_r5_remoteproc_shutdown,
>  };
>  module_platform_driver(zynqmp_r5_remoteproc_driver);
>  
> 
> base-commit: d293da1e4dbebb40560e4c6a417b29ce3393659a
> -- 
> 2.34.1
> 
