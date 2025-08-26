Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BD2C17A3
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 Aug 2025 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756234111; cv=none; b=AfQGf1c5E1NBAytqMmgU8W7FurBoJGoEkVgS4/IycNOrFptofqzajy7K5xp+Rld8BwRRdhtBZErgZeefBykI+O6IUeb/s7nNvIQScvODnFiDT7FEMKmBwEfFxL2xPfKzsaG/kHUyld10jBf8poNAfITuV8Y+MuM+Dv0twwjzOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756234111; c=relaxed/simple;
	bh=shZVyhzhgMSVftGjjDW5YZz+fQPrA9ORLISgrRcpfz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJ100BA3/EC9Eg55kyznZ9vSvCPkCuzM5fT02meMAQYupyl046ZVZnD7u/unrOCsW113td0M/E1CnXU41eTMsWw6fK10e0kTZo0xkkvKDyrbw0uF/Ybkk3CaILvydWuvWgsG38oScm8yU83Iluy983UA2j5kvNDP42U1mNflEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkFBPLsv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkFBPLsv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24622df0d95so36106745ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Aug 2025 11:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756234109; x=1756838909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FMvEjRZ7peseJNDS+e9oLCtx0ZTQPb3Js94QMS50KeM=;
        b=WkFBPLsvGk2xGMiBEaQijvEpUq+ZnBmkoHOf3ArpB3C2F5MaSelCg//HGUJ1nrDnXo
         8/AxSCnU7Tctbk1UHoMKoYA6v4fRgHlTjwbGmX4GTqD0quSH4DlMi36JQyQxiL9WrjkO
         rZiA0NWgw+GGafokzDrjMh6AVSuDNvkpMdy5jh57Jl0It9sXZwH5i/BR9nYn8xt2f1fW
         686yX6XizW+YThZD7LggG+rZEgYnJp90Vkcupycnz0ZruGnk8VeHVBG0lGgSyJM08LVo
         547gZfovV7DrM38mYEaxaDHC1F5jEuOUUS2lHl1uqB6eO37E54uK9FHKCeNaXCKICWVx
         39AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234109; x=1756838909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMvEjRZ7peseJNDS+e9oLCtx0ZTQPb3Js94QMS50KeM=;
        b=G1yMevhAdY+fkBzx4tPhHFvrsqmoKsE1jB+3NUYCXg6sH2pnYZBJvRoCJzKO93o+hH
         TyveHVecucqg+WTfbB+86sFR/CgHG1ObLMURzo0ZxifWlpKDF4j09sSPQaNDug9K2DAn
         sPAp+RiRTDdurAtYN4m9/rVX33CRPH2UW+TS8UD2+9abXVursFFhQns/wbjPBM2r4kiB
         MbYilXz/mSASbrvOVTI4i19NLqXQ+PmiYIP/lxkoLITKeEg53ZJxPiynddDAyzyDwxCd
         zLTYmdkayxzQzX7K+dq1Bsdz4Tc8avxQRWc0g1WdkojbBIvqn3oA3Nr0dxApNMrab2f/
         aspg==
X-Forwarded-Encrypted: i=1; AJvYcCUbguBU71SahVfO0oVTqThTv0KTo25a+A4rh7iu4ud5/q8b8m83RlHlBbogmn41Mi4UfTXjvmjlz7LDgisEc/mH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr/E+mqxPRQ0iGWSetsa23jLvelKQQRY0QFZLnlZuRyp/TcePL
	McNbmSFmBQCPVCpIJRVXl7HD34B/EGUPEzowp5D9fMU+QeifkYnGfnvDr6VK7ICYhAgowZGfwXV
	6vv3nXjo=
X-Gm-Gg: ASbGncsfSRGGJhrfSCU7pLmHFCCvi2KGEdwSfsLQIK5Z4iAVE8ktcSS3Tr6w3CMhebE
	OQHb4wlydW6/TIfs+JTPUC+30MU/Esq3Sukx1ls3b/n+zA7Y2XNjbsnC7lDVrvrNsmZgzh7fBrk
	e6CpjaLC/W5eNkKhHuPuFyaj65Jh28PuS8G/NttjznOkZKQrpyGClwD903EcCLWLb2tQ//iicxB
	RRjh9uhQ+zS1ihYOXAzIXO1hVg1Q0wdBlsLx2l+aF0MtS2e+iF5mL/4Sltwakh4ndxZ0Nl4UOIL
	8OZQZ62+NiEgS67fQ4+yKsQqG+ws7fWST9RxGUVRDWaKXxh7bPZGfgpCtTGn1+rO4FEonj9eRmA
	ITCcibauwip3eHoLEUjS+3vWbOpuqp4xIquhauwPpZIikXFSLGpZEaY4/D/7cRb0hDcDLy/yfBs
	I7z7CoaTcfnsp+BAhsZa3RR4c=
X-Google-Smtp-Source: AGHT+IHRcwQYxxPzzewXJmk7FtsIE1Bi9ofitDeay5FZuyieQ35UAnL2aLjN4DnF12wtcQC2EhI7/w==
X-Received: by 2002:a17:902:db0c:b0:240:887c:7b95 with SMTP id d9443c01a7336-2462edec14emr215403435ad.5.1756234109238;
        Tue, 26 Aug 2025 11:48:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5a7:9483:185f:8034])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466c13e13fsm101233265ad.139.2025.08.26.11.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:48:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:48:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: da8xx: Use devm action to release
 reserved memory
Message-ID: <aK4BepPvXW6u7Eui@p14s>
References: <20250814135532.638040-1-afd@ti.com>
 <20250814135532.638040-2-afd@ti.com>
 <aKyXjH-3lnCYM2rG@p14s>
 <d54e1cb6-388d-4e0e-a3a0-387ed87082ce@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d54e1cb6-388d-4e0e-a3a0-387ed87082ce@ti.com>

On Mon, Aug 25, 2025 at 01:29:26PM -0500, Andrew Davis wrote:
> On 8/25/25 12:04 PM, Mathieu Poirier wrote:
> > On Thu, Aug 14, 2025 at 08:55:31AM -0500, Andrew Davis wrote:
> > > This helps prevent mistakes like freeing out of order in cleanup functions
> > > and forgetting to free on error paths.
> > > 
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > ---
> > >   drivers/remoteproc/da8xx_remoteproc.c | 30 +++++++++++++--------------
> > >   1 file changed, 14 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> > > index 47df21bea5254..58b4f05283d92 100644
> > > --- a/drivers/remoteproc/da8xx_remoteproc.c
> > > +++ b/drivers/remoteproc/da8xx_remoteproc.c
> > > @@ -233,6 +233,13 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
> > >   	return 0;
> > >   }
> > > +static void da8xx_rproc_mem_release(void *data)
> > > +{
> > > +	struct device *dev = data;
> > > +
> > 
> > The check for dev->of_node from "free_mem" is missing.  I can add it if you
> > agree.
> > 
> 
> It should not be needed, this devm_action callback is added inside a if(dev->of_node)
> block below, so this will only be called iff dev->of_node is not null.

I agree with your assessment.  This set has been applied, along with the other
two with similar aim.  

> 
> Andrew
> 
> > > +	of_reserved_mem_device_release(dev);
> > > +}
> > > +
> > >   static int da8xx_rproc_probe(struct platform_device *pdev)
> > >   {
> > >   	struct device *dev = &pdev->dev;
> > > @@ -274,14 +281,13 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
> > >   		ret = of_reserved_mem_device_init(dev);
> > >   		if (ret)
> > >   			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
> > > +		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
> > >   	}
> > >   	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
> > >   				 sizeof(*drproc));
> > > -	if (!rproc) {
> > > -		ret = -ENOMEM;
> > > -		goto free_mem;
> > > -	}
> > > +	if (!rproc)
> > > +		return -ENOMEM;
> > >   	/* error recovery is not supported at present */
> > >   	rproc->recovery_disabled = true;
> > > @@ -294,7 +300,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
> > >   	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
> > >   	if (ret)
> > > -		goto free_mem;
> > > +		return ret;
> > >   	platform_set_drvdata(pdev, rproc);
> > > @@ -304,7 +310,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
> > >   					rproc);
> > >   	if (ret) {
> > >   		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
> > > -		goto free_mem;
> > > +		return ret;
> > >   	}
> > >   	/*
> > > @@ -314,7 +320,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
> > >   	 */
> > >   	ret = reset_control_assert(dsp_reset);
> > >   	if (ret)
> > > -		goto free_mem;
> > > +		return ret;
> > >   	drproc->chipsig = chipsig;
> > >   	drproc->bootreg = bootreg;
> > > @@ -325,22 +331,16 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
> > >   	ret = rproc_add(rproc);
> > >   	if (ret) {
> > >   		dev_err(dev, "rproc_add failed: %d\n", ret);
> > > -		goto free_mem;
> > > +		return ret;
> > >   	}
> > >   	return 0;
> > > -
> > > -free_mem:
> > > -	if (dev->of_node)
> > > -		of_reserved_mem_device_release(dev);
> > > -	return ret;
> > >   }
> > >   static void da8xx_rproc_remove(struct platform_device *pdev)
> > >   {
> > >   	struct rproc *rproc = platform_get_drvdata(pdev);
> > >   	struct da8xx_rproc *drproc = rproc->priv;
> > > -	struct device *dev = &pdev->dev;
> > >   	/*
> > >   	 * The devm subsystem might end up releasing things before
> > > @@ -350,8 +350,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
> > >   	disable_irq(drproc->irq);
> > >   	rproc_del(rproc);
> > > -	if (dev->of_node)
> > > -		of_reserved_mem_device_release(dev);
> > >   }
> > >   static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
> > > -- 
> > > 2.39.2
> > > 
> 
