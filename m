Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94372737E7
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765923183; cv=none; b=U6EVTpwSPM5Ej02RcmeFJnHxH8G2faUABw1yHn/rWfc8CEXrPvSK3vwuw3bgEAjDc1KZ6Se/DAt87t5rUHrGMJ8uyD+huqPiJHcN7pHzGp3y26V22nE9sgufRd4uo3dopka4Cf7sm1EIQ8hljua4dDOHiv2meTXgt4oQTx6TssA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765923183; c=relaxed/simple;
	bh=LvE6q0gKAaH+zhnu3rkz2k1a3t/HbuUKHBIYnnglztc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUXaJ4LH4aNgOicfTf016KsSAA4DmuIX20Ze0NNxlEnGhLkMYblEuKO6D2D926d436H7v57u6jAafFQ0OM8ulA8ApgIAyJ+2dYFLyp1x0rhBhLp/O00AUd2mn7gi/0GxGNdp/YVymppTGaK+/V8F3NmcjtxTnWdVqJt+xRgeAE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxIEY6nE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxIEY6nE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0a95200e8so30246495ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765923181; x=1766527981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auWb4dQBMJYzfosA/pOnNDayLZ5ZzA6A+0CwU8nFlUY=;
        b=xxIEY6nEf6zMZQYi1QZjYYfXFGRs9UoaFw7nUBYvHb8OxBqm0iNVHV9l5AznBcS1cz
         h4p0a5VIcI18wIx8cS7t53dosPHcmT6tohijJSwm02JZvNjCyaL6h3xFS6VPF5aaPMLH
         2q9pBi8q6JlSvTxh0zOpCpD8SJdZXx4qdqp3B/OmwiD0EEYoFfr0htssu4LnOztZt4jQ
         C1BRgiUKA+/oK+vjH1HyMjEvLXP/GJeNr5VyvvKbNuvOV75px2mNFBm4eGFdCUiI2j/5
         GK7A2KqXfFdHnQqCEihDsSbtKuEH8jNdsRZdGEQIjo87NoApwdTQC5+jg8CbDWXeXyIo
         Jt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765923181; x=1766527981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auWb4dQBMJYzfosA/pOnNDayLZ5ZzA6A+0CwU8nFlUY=;
        b=odweaSPRroH9gwD4GSdWHULuvDZzV4o1GUM+1DYQcEuakEfMNQkRY4J6oY2eNaBaCn
         69vm+JFAfgNWxRIqYiFJlOZ57B4a/OMKL0ssQi5iAB+cH+oJTMloaHOZNt2XYGvGbFBa
         OKIDoEI0Nh9+cXnremw7WANn7uOg5oYlr5YqNq2m291kHOhHsTTJt/0qz0/Kpp18Pgx4
         rvxYa5N3yd1rO1vphFwNlNpcHonbYDO93Fxcds//tFbNlL+KeSaQdTu4FBAWr2z4pJmA
         ysBN+RBdYmU1iw6lRBbPQ85LEXAVFrFyIfbhYrl0IxIR1lijtKfb8Y9N8j1IRnl4bEC5
         cGpw==
X-Forwarded-Encrypted: i=1; AJvYcCUOSqUW+1Ik/bQB3e5pjeWAV7ftFF6HZXHRUGykcxaQXIJN62q1izI3dAUPGkgFuXmgoAO9QLIx1eT20Me1uVZT@vger.kernel.org
X-Gm-Message-State: AOJu0YyMaleA5vSwFtl4PDPXY76Tj3rDW8MaXzrNxOAk+55lT0kQbvyr
	AFq+RzAWmEb9eWEHiQ32Kho88cux04yCiupDObBCG9jFp668vgc2xIwocGF6YKWrfks=
X-Gm-Gg: AY/fxX4Kjcy2tKdV0+VNzNkY7yqVQb5yj0kSIIetFkt1Qrfp9Qjftcil1dTlz2pQ409
	AiqjEGah8XD1QFDhDfpDLrvsSzTSoIZdNFoojawZp1SMMHezVIW6/nEEFPB1nsYTwx0Zdnq+3Ad
	MFTdOtln8gsKKA3ExBe4Hkp2hd3MI6XgYUFeVRjw5Oe/5aoMgE4T4dzhDpO07GWq+BMtouPi5+K
	z5Nknyf8GkJS4Xb968II7KYeLVhs96//cgpsL8kqxiePjhgApcMTHqld9Egec/EZ6myyyrpjotC
	kPh1NRqCVW0QFSXSJKF2IO6dGUSgR2ox7sr8wm+QuGpYI/zk2fC02cfx9F4N+EXiMb2fYlZQJ7R
	BiHPWPpoJDWOcDOJ4CdSrBrub8OzUneyZzj5xLpPYqvE5zMVHuJgJexjCbXQRommGlLwPDgI603
	GA6qmI/uO5PetkRg==
X-Google-Smtp-Source: AGHT+IG5tChOpyR0Nhxu0Rhdpo8VAFsmpzSG4K1uTUFmNnHdpvpNSpU1hBhSP/GWyCviK9VF9gEm4g==
X-Received: by 2002:a17:903:1986:b0:295:738f:73fe with SMTP id d9443c01a7336-29f23c7d087mr141376425ad.30.1765923181120;
        Tue, 16 Dec 2025 14:13:01 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea0594e8sm172904795ad.87.2025.12.16.14.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:13:00 -0800 (PST)
Date: Tue, 16 Dec 2025 15:12:57 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, m.szyprowski@samsung.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	arnaud.pouliquen@foss.st.com, robh@kernel.org,
	geert+renesas@glider.be, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 operations
Message-ID: <aUHZaapZ1IAs_mRE@p14s>
References: <20251210154906.99210-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210154906.99210-1-daniel.baluta@nxp.com>

Good day,

On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> functions for "memory-region"") following commands with
> imx-dsp-rproc started to fail:
> 
> $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> $ echo start > /sys/class/remoteproc/remoteproc0/state
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> -sh: echo: write error: Device or resource busy
> 
> This happens because aforementioned commit replaced devm_ioremap_wc with
> devm_ioremap_resource_wc which will "reserve" the memory region with the
> first start and then will fail at the second start if the memory
> region is already reserved.
> 
> Even partially reverting the faulty commit won't fix the
> underlying issue because we map the address in prepare() but we never
> unmap it at unprepare(), so we will keep leaking memory regions.
> 
> So, lets use alloc() and release() callbacks for memory carveout
> handling. This will nicely map() the memory region at prepare() time
> and unmap() it at unprepare().
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
>  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp.com/T/#t 
>  * took a different approach and instead of partially reverting the
>   faulty patch, used alloc() and release() callbacks to handle memory
>   region mapping.
>  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..83468558e634 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  	mbox_free_channel(priv->rxdb_ch);
>  }
>  
> +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> +				   struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> +				     struct rproc_mem_entry *mem)
> +{
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
>  /**
>   * imx_dsp_rproc_add_carveout() - request mailbox channels
>   * @priv: private data pointer
> @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
>  	struct rproc_mem_entry *mem;
> -	void __iomem *cpu_addr;
>  	int a, i = 0;
>  	u64 da;
>  
> @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da))
>  			return -EINVAL;
>  
> -		cpu_addr = devm_ioremap_wc(dev, att->sa, att->size);
> -		if (!cpu_addr) {
> -			dev_err(dev, "failed to map memory %p\n", &att->sa);
> -			return -ENOMEM;
> -		}
> -
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> -					   att->size, da, NULL, NULL, "dsp_mem");
> +		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> +					   att->size, da, imx_dsp_rproc_mem_alloc,
> +					   imx_dsp_rproc_mem_release, "dsp_mem");

Was there a reason you kept those here rather than moving them to probe() as
Iuliana suggested?  Note that I would be fine with this solution since this is
how it was before, but if we have to go through a refactoring we may as well
take those things into account.

>  
>  		if (mem)
>  			rproc_coredump_add_segment(rproc, da, att->size);
> @@ -709,15 +729,11 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
>  			return -EINVAL;
>  
> -		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (IS_ERR(cpu_addr)) {
> -			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return PTR_ERR(cpu_addr);
> -		}
> -
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)res.start,
> -					   resource_size(&res), da, NULL, NULL,
> +		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
> +					   resource_size(&res), da,
> +					    imx_dsp_rproc_mem_alloc,
> +					    imx_dsp_rproc_mem_release,
>  					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);

I'm fine with this part.

Thanks,
Mathieu

>  		if (!mem)
>  			return -ENOMEM;
> -- 
> 2.45.2
> 
