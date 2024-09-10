Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6319412D
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Sep 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980380; cv=none; b=hX1bOSzHUcEZXSD07css1RJ4BeNoNE/3MEv+vI75KSRGNGr+fnnsFfHej315+nB+8UFBvyZLZR8SiSeLejXTU5jrpXyTJkeM2FPOPy8j1rj5147sg1N1GFJJAjkBafEXPztd5AU8lDgQw0LHd7i419YNLVqdWg35slxCkhCcEKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980380; c=relaxed/simple;
	bh=ypw1OutxqvzKhH7UAzuZdfpbtssum4TNZOIHYJdGnuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU/rAmD9o5FKP3ZNK2MY0B/AKNOywcoFFXwZNegwDhQkXEMmTn61hdZsIA6zCjz/dWJrtAMYI9Yl8MBFJYio4AYbuqz0cLKBN6IXPN7FS7Hew/84N4R398nvCIHLNUaN5rhgDy9rMewhwQfEtlbQyPasIUEtXaLpMgQv4PT/BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWEVsg3T; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWEVsg3T"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e1ce7e71so2728246b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Sep 2024 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725980378; x=1726585178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpRX3IoFoPT57gu0cpECS5KRUcNTq+vljGu/JlO3WgM=;
        b=WWEVsg3THeE1tWBHyPgAVht2QXeN2rqcGjGGQ25ZBVdiXW7weVBvtkUK/N5ZZ7S3MY
         OtZYSG+Xr8JtUlMYVjVw6Mb59Hpmt9d9Nmvibw6N2GKCO+v+5KmxWa9GktvKgtpHgXs8
         9zmHJae/L9OOaam7wzA1UyPr+Kml71VZqpAScw6P0kJUeMei36Py2W+ceN8rJaCRuH6t
         b01nozFcCQlekjCtxUiC5GrxdgTsKkrxNl9o9bMDKRK/C76XxY9QBBwppSVsfj6APqTA
         YswamVPO+OkiFgRYdJc1fm43ZW7zxBVJHWocJ43N+vIF9xhbBePl844fvNy3JHcugbdT
         uaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980378; x=1726585178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpRX3IoFoPT57gu0cpECS5KRUcNTq+vljGu/JlO3WgM=;
        b=JG+AjZDNRGDFzEnkyKs8dLK+AXmsCUTJdps7zE1fOuLADV4OOPHeSVZL7OPkFqHmWE
         7E1NIbY5rpMoLSLHGzuYlkwckdrls2HXcXXtKo8A9Ro4oGPZonBFg9VCl1pkQ/DvnC60
         amJV3wioYrwYE05DX9ZVbiTscgEmefZz2VidoWuQNxW89oKTTa77VXR4jbbtvbsMqS5P
         zFW6d1UOJvoF2r04U7XBHN+uk0mM13YtI8XdABTxkhEpGcTBzAqxLHl333/NSsccjPXQ
         fb7uv0a5GSqoAyD2e8jPz8oJEhMNp0EDTppMTT3a92ViSyYrQNQYqi0xrubSEiKf17bO
         53WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4C4P5u2fgrSOAsZi5s1QPew8ZKj22xc3WBLo63EPYMf6UA1AL06dGCxpsiVqnjFGgfiIFgeLFbGimSm7vyWn6@vger.kernel.org
X-Gm-Message-State: AOJu0YyoBUUb0oG0kx7c7WPwNsdMh7iUpy1MBd9rDXzU/AwdlKFxzaeE
	RjhjLOVGVR1yhkxNrezn1sd2Z8qpjQd0MnmZyuy3Ulpj2b/w4ipr818Bk9zzZP0=
X-Google-Smtp-Source: AGHT+IFaHYSb4lWAp2jxDf/VcC4iPifVviwWjS/qxqmC0I1DrAgKbykwuQneHkShIJCErjeJDuNt5Q==
X-Received: by 2002:a05:6a20:d525:b0:1cf:4691:2d9 with SMTP id adf61e73a8af0-1cf5e19a169mr1367345637.35.1725980378407;
        Tue, 10 Sep 2024 07:59:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b385:464:5921:35eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fff078sm1465524b3a.88.2024.09.10.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:59:37 -0700 (PDT)
Date: Tue, 10 Sep 2024 08:59:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>,
	Martyn Welch <martyn.welch@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] mailbox, remoteproc: omap2+: fix compile testing
Message-ID: <ZuBe1g3tlpvOD5Cu@p14s>
References: <20240909203825.1666947-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909203825.1666947-1-arnd@kernel.org>

On Mon, Sep 09, 2024 at 08:38:09PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting CONFIG_OMAP2PLUS_MBOX while compile testing
> causes a build failure:
> 
> WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
>   Selected by [m]:
>   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])
> 
> Using 'select' to force-enable another subsystem is generally
> a mistake and causes problems such as this one, so change the
> three drivers that link against this driver to use 'depends on'
> instead, and ensure the driver itself can be compile tested
> regardless of the platform.
> 
> When compile-testing without CONFIG_TI_SCI_PROTOCOL=m, there
> is a chance for a link failure, so add a careful dependency
> on that.
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'
> 
> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mailbox/Kconfig        |  2 +-
>  drivers/mailbox/omap-mailbox.c |  2 +-
>  drivers/remoteproc/Kconfig     | 10 ++++------

For the remoteproc part:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  3 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 4eed97295927..ecaf78beb934 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -73,7 +73,7 @@ config ARMADA_37XX_RWTM_MBOX
>  
>  config OMAP2PLUS_MBOX
>  	tristate "OMAP2+ Mailbox framework support"
> -	depends on ARCH_OMAP2PLUS || ARCH_K3
> +	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
>  	help
>  	  Mailbox implementation for OMAP family chips with hardware for
>  	  interprocessor communication involving DSP, IVA1.0 and IVA2 in
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
> index 7a87424657a1..6797770474a5 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -603,7 +603,7 @@ static struct platform_driver omap_mbox_driver = {
>  	.driver	= {
>  		.name = "omap-mailbox",
>  		.pm = &omap_mbox_pm_ops,
> -		.of_match_table = of_match_ptr(omap_mailbox_of_match),
> +		.of_match_table = omap_mailbox_of_match,
>  	},
>  };
>  module_platform_driver(omap_mbox_driver);
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0f0862e20a93..62f8548fb46a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -330,8 +330,7 @@ config STM32_RPROC
>  config TI_K3_DSP_REMOTEPROC
>  	tristate "TI K3 DSP remoteproc support"
>  	depends on ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on OMAP2PLUS_MBOX
>  	help
>  	  Say m here to support TI's C66x and C71x DSP remote processor
>  	  subsystems on various TI K3 family of SoCs through the remote
> @@ -343,8 +342,8 @@ config TI_K3_DSP_REMOTEPROC
>  config TI_K3_M4_REMOTEPROC
>  	tristate "TI K3 M4 remoteproc support"
>  	depends on ARCH_K3 || COMPILE_TEST
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
> +	depends on OMAP2PLUS_MBOX
>  	help
>  	  Say m here to support TI's M4 remote processor subsystems
>  	  on various TI K3 family of SoCs through the remote processor
> @@ -356,8 +355,7 @@ config TI_K3_M4_REMOTEPROC
>  config TI_K3_R5_REMOTEPROC
>  	tristate "TI K3 R5 remoteproc support"
>  	depends on ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on OMAP2PLUS_MBOX
>  	help
>  	  Say m here to support TI's R5F remote processor subsystems
>  	  on various TI K3 family of SoCs through the remote processor
> -- 
> 2.39.2
> 
