Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0CE4409
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jul 2024 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107882; cv=none; b=MCbzfTIieoDN9Ix5EaDFiSdk4udeRdHyCImSZBxIOgxTPOXh/9bfv6Z2Jsb8BO9+gkPGear0I4Gi6D9AabQjZqfWMdlCUFna1Ndh/3eJC50Ll0OUmJZ9q8/q0dBW8AOUMvw+B64RZXt0Ydlt+JzrqOIvkFzDXbRfXTi//PiVewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107882; c=relaxed/simple;
	bh=o5YyURreYGQuqS7GOLdNDGbDt6jPvS7mpQOtOlZZc1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Az0d1TLcDGE0hGArtDrucKev2Ver8OIINfDE9z0ncfG6vrJl+1PFiyX6y7T9m0oM/F80OaseGKQpNkuihm/tHE4gegIqw4t/HViLz1FSg7/sYIxPmc9ippg9EjDss9Bn14LilQL4p5fL0TqTOXZyKFb4bSBng/1ElL+x4xcvD5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5GNWXp0; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5GNWXp0"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-754d2b05db5so465928a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jul 2024 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720107879; x=1720712679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=goVPoxaUI2y65aB/cJo20joVog0pnDpvEJK/omY3OKQ=;
        b=Y5GNWXp0Ru4sXyGTgzwQSQhVqrtWYGcb3BCTXjgxm6aViFSToAlJJXpe296vBmK88S
         IPpTiNoovh6rzaJw+mfSuuVhFsSMwBjRZrSQF6ojbEEMFtj59aRDniw63GdwK2zdoHvR
         e8d9w5LWgFUaBtqi5+r98bGhxZ0+Qn9LOSsgtJOgnJtWCixFW/LDqXXbnRbICyIaJP2u
         UjR1SRd6ve9F+sRD5UOgJ7mzhMylAnFzf2bgZPRvVTDcr+b4IhEpkEXQSIgZ0rzJScrm
         4P33csoK0Y3LkA7xWSMbWNKepSmqIgs0I7MMRYTrI/JQWJt4EYy7tdY32SnUM5upyOSu
         t7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720107879; x=1720712679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goVPoxaUI2y65aB/cJo20joVog0pnDpvEJK/omY3OKQ=;
        b=cKBdpXWpLfgC3C+s3NCM2cLiHWBOAbLj3ORvdfvQYapL+A1/xIdW9EmsAUqD1J2U6l
         B3Ps2VGh2A3w0ApRb+Hh+8HUUdf26tHHeBEDjbtmBeVzzLxMnJZWLfLLetcZMSWpKAZ8
         FsgpQAghqfnwtr0ud2zmiSOybxvloVktMep3/fv3v7PFzyrWAPNHzZvk8a6H1BwxSWV4
         5kOo6QXVwwEVHUtbh1IpRi13ASGyX+y59ll2gcGCz0FfA/bPCOKZgHDO6XyiZojdTAmt
         Mt6Q5utcvfFnycRge5mC5EAKRCMLXP0tDr48Q4rjshFSdE9GzNXFHlBvsm6Fvn261rrH
         7KoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Cxzt6zwptyVMeO7AqNxB45wU65vF/QDFu8oKI75nchHV8NQrNjdGa3pQEsjA+ZCN+/YSHfFgG2vhYRUgoFmCU5Z9fOfAhqlO2uARBLbU7w==
X-Gm-Message-State: AOJu0Yw4Un8dd6/+liJxp13oXzDFSgyHxOg+9qdmW1Z2plN2Ks/36TJf
	QwLfUZPPh+7MH4sTkN49K72/xdT49+I4Dd3LSlchhkG4y9jTYTT97PFbNXqLsqs=
X-Google-Smtp-Source: AGHT+IEZZAgrGC2Rfb97YGGptE4y+3B0HWnowCKHQ3/hj0ImHHV4ebI4HTp2GHw6XcgNEbHZSL5V0A==
X-Received: by 2002:a05:6a20:a10c:b0:1be:c955:4ed0 with SMTP id adf61e73a8af0-1c0cc8d7d95mr2194917637.57.1720107878967;
        Thu, 04 Jul 2024 08:44:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fb65:8622:7ca1:51c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a989416sm1685051a91.29.2024.07.04.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:44:38 -0700 (PDT)
Date: Thu, 4 Jul 2024 09:44:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Garrett Giordano <ggiordano@phytec.com>
Cc: andersson@kernel.org, w.egorov@phytec.de,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2] remoteproc: k3-dsp: Fix log levels where appropriate
Message-ID: <ZobDYz8qeKfiaG75@p14s>
References: <20240626191438.490524-1-ggiordano@phytec.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626191438.490524-1-ggiordano@phytec.com>

On Wed, Jun 26, 2024 at 12:14:38PM -0700, Garrett Giordano wrote:
> Driver was logging information as errors. Changed dev_err to dev_dbg
> where appropriate.
> 
> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
> ---
> -v2
>   - Change from dev_info to dev_dbg
>   - Drop k3-r5 PATCH
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 3555b535b168..a22d41689a7d 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -327,7 +327,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>  		goto put_mbox;
>  	}
> 
> -	dev_err(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
> +	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
>  	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
>  	if (ret)
>  		goto put_mbox;
> --
> 2.25.1
> 
