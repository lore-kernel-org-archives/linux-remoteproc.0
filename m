Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2F14E9AF
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Feb 2024 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706899285; cv=none; b=BoDM9E5FecKbNO185b1sO6g9g980rpNxlxOM9BkXovUjO2GhzlCYoIviGVQrRaCvabcbuEbaRccwjwAuwzNW1lOAd1y2XrTalAggazb6fADSIDc0sEBLNlfSjQfcixNqzMGrEDuGpGc85TLFg8ww/BDELioEYvt5nUyCDd88kQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706899285; c=relaxed/simple;
	bh=HnwgYANLMXSW1DzPAZPPhrW8OspT0pU7wCK0oKbbwlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHCX9sD8Ku/SY9GjZpCVMAE0RLyVWOFwTjRkDFj0PfO34aSjpZTUwQLFmUbde6owjIFKPgBKHKmncas6iZazxrXqGMIuwvxw1cFu/eTUWQrN004lqQMYd65pDHg1lGH8hYC9WJncg676ze/gBJp+TuuOQD9FTatPCiK+qU2v+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5XK9qvy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5XK9qvy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d76671e5a4so18862115ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Feb 2024 10:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706899284; x=1707504084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RN5ILJgfYC5Krqk3IcaE4UZm9MGXLWaA34ihsM5Im/Q=;
        b=s5XK9qvynqyaxDGma7tlhIQGYcqr+UifRNhsXSLW5j5tg5rG7wv9096OJaj0G16XSY
         shsh6M/nEL5pRKBz7X5HSXNYdPyt5K0ZYtgnhM4c+FZQ8g0vtc+9YH0maWPit3xVzc9i
         bhq6TkAT7EstkG553LeB271fwdcQfaN2ml7wH2tDwoSLR6f9NBLw5YbTNI110f5dsOwD
         UXiLrSICgxUxe8dOAiuQ+CzBnX/RlPLDT684bVCWv9Jt+0GEs/DUvJvy3dsNKCMimc9u
         RHYOdcrmlDwLzqjYRJA2hJp4cJxhTqdZZtWpnezklx2ABfhCUSKlgWeJOiLLsVb+vN3J
         hFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706899284; x=1707504084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN5ILJgfYC5Krqk3IcaE4UZm9MGXLWaA34ihsM5Im/Q=;
        b=vv8uGXiB6rf9J2iwiQuxRqljh8+OWUSpxYs/Jx20bt/EAeJ1zF86LCOqIPUQzayHUM
         pCS4wYXenUV77O5JigOF59s57Q6xbEQno70yqF+B2OOghnMq/5UalIwMCrtWJLZZ1nQv
         Fy75DC1sfr5iNeI+QKxF6ND82cWkKk1Be0bpFi1QPQmgb0goWA1/xPZaMqd4bGQSt3gC
         1TBZlf2gCzzhH/AbGyRtGqLjD8Kq1k5J2eingrkHKpO1n+G52JkaNqqqWGltbz/nKFwB
         44ofJYQYZHgcc8TCh2M3nLTABKOBu6e9d9Z0mqhfomCHhv3L/rgropk0xP4fZ3rg7MyS
         PIRg==
X-Gm-Message-State: AOJu0Yyu9hpeoK/YukNepDuGVc8NB8WFWWpCrboBjuRQJ0KwuczZHuSd
	uxNa0EwEdP0ELQ9ojMMA4uRs95uduzjug4C0R/borz12gGjyBnCZo4jjxIKX1Jk=
X-Google-Smtp-Source: AGHT+IHI5+6GlfKqM/eae+kgC9KkWpCXw9/h0VW61qBwkA94b7R7Eqhzy6DQXTdDMRIc6K3dL9c31Q==
X-Received: by 2002:a17:902:f68a:b0:1d8:fb17:a1f2 with SMTP id l10-20020a170902f68a00b001d8fb17a1f2mr12586111plg.34.1706899283798;
        Fri, 02 Feb 2024 10:41:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUVnzEB2v7TbbKqpsgt/c7PICyiD/6Uwyu7EeUzAU9R5HwoFu9fPYvE5IW2uIB8M0v0SEuFwksh87A25N1krBxkWlT9zzLQD7tiLE0ZE976/bkLAUbFdl/0tprp4Pt2UF1lR+H9syCgOmtkFUNw2iF4AHjeles10LJMnFQnAkbAa8xbpQ/Q1BTzOC/Bnx35JHOiNS+liqYwF2w3FLEHpUZbDK4j1RbQJeiSIVIS/QRZUFBnOz3Wv+GP4OcI1byvNM8y5R1Ck3BpP1uBs8ElGgi6bCjlWfuXMAoDdxzgKECoGJ/jv2mFd6JmoQHRuiwEyyFeo7NjhjGzjJOH+4tkUPhBS4tNgHODfZ2s7SDlRiyMtrTCFm/mj0ROAa19sKf1DOLtW/zuiCGrwXXBqhQneTNyY7W6fd7n9qW84P9T2vngmuXvkGFTep469o0zyWuwBPrMJI7dU+cJ25JTGKBc59q/ohjeqayAzp3n+t+Xci91MT0mCIDrVDX1GFOf9/z/w7cf+zecrUq+b8IkqBhoFg==
Received: from p14s ([2604:3d09:148c:c800:9462:f236:7267:e14e])
        by smtp.gmail.com with ESMTPSA id jh21-20020a170903329500b001d936a7bd46sm1902639plb.271.2024.02.02.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:41:22 -0800 (PST)
Date: Fri, 2 Feb 2024 11:41:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 9/9] remoteproc: stm32: Use devm_rproc_alloc() helper
Message-ID: <Zb03T2Ti2v70NUMu@p14s>
References: <20240123184632.725054-1-afd@ti.com>
 <20240123184632.725054-9-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123184632.725054-9-afd@ti.com>

On Tue, Jan 23, 2024 at 12:46:32PM -0600, Andrew Davis wrote:
> Use the device lifecycle managed allocation function. This helps prevent
> mistakes like freeing out of order in cleanup functions and forgetting to
> free on error paths.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 4f469f0bcf8b2..fed0866de1819 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -843,7 +843,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>  	if (!rproc)
>  		return -ENOMEM;
>  
> @@ -897,7 +897,6 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> -	rproc_free(rproc);
>  	return ret;
>  }
>  
> @@ -918,7 +917,6 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> -	rproc_free(rproc);
>  }

I have applied patches 1, 2, 8 and 9 of this set.  Bjorn handles the QCOM
peripherals and will take care of the remaining ones.

Thanks,
Mathieu

>  
>  static int stm32_rproc_suspend(struct device *dev)
> -- 
> 2.39.2
> 
