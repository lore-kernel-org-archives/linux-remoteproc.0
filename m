Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19D1DFDB1
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Oct 2024 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396779; cv=none; b=ut75E25Runm0aXHXbUk3plGFqfuxY94NwvR/MdCg2wIi2a31UVFEy28xUquqNNhBQun+SvymCzAq+2wHV/F3QCKolerQrJBtVX6m5ODgcJAnM0PIR+3EFBWi8HDzFC00xZfpi3fiwbFniFqfOQ3NH5kBD9n9WvRFyoLB77G8F8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396779; c=relaxed/simple;
	bh=68NbXlc6ErTKvDdKfTBzhFam0ZAZ3bvQYRdnZfnDNO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZvxmdYltTGM+B6pb19t1B9rU+jlEIvl3IVDCTfmmy9aapF5DfMJcLV1l9IhDML8EO+IBfhnygloD6jpW2iWMWNkyK0GYYABJ1P1T63z+BIJv84EudjglayM+GmegysLflANMy9PYEPjZwD0SxsRRJ5d1jPqABgCvufqOEYmvTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ty/r3emr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ty/r3emr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20ba6b39a78so40842385ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Oct 2024 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396777; x=1729001577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fdz/P/YgLIpgF5LDJZ0vnmgihR7pjVttUHO6lvnedj8=;
        b=Ty/r3emr+9NUHXqwaXLxaPkTvkz6n6UoMolI6Pf7xoJCS3KxlSqSSybOV2z9XkA4RV
         7D8bkKp72mdO4sxu18dP5yiHXc1Yztc8uCi0ZOD3w3DQfXXfvksJzYQQ/WEbbNXfIJcj
         77zEPu4zpd50TARrjB1yTBUmD5gLJXNlRhqCHiDcq1o2/wkxbeCRu4D+soUTlFh65Itw
         QQ8hQawmzTJYCjGlG4VXxJbFLDpB0ZXMIk4xeO69ePPQf8B7xZttKCxcloDTxPI4pRQH
         CTNUX7RupGhYszDnbF+S4SW+yCzwnKySh71x6YuYGfJZE6fZKsRJblyztUoFrFRqEAA7
         YDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396777; x=1729001577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fdz/P/YgLIpgF5LDJZ0vnmgihR7pjVttUHO6lvnedj8=;
        b=Bndx8P0ojJ5Hnb9m5ie4WYTptxYOTWM3ML6riT7p0hGhm4Xyf+GOhUTS7XnnvHXMd9
         jl1Yx6UWJKw889ZLqMtG+7Rx0Ho+1c43lyjq+nXQiZUhWbiaamQQsZuf0ysXsKMIaa7m
         zw+UGu6zGtaJ9l4U/6HK43/fVulRqybClKvy5nE20VXFRU9+8wUKUDsoQ4XRqkbYoQJH
         o58lOQOaG739n3gTp3NpyUzGX1Mi8mhVNq0F0gQ1KZXtUWBZBk0yklm4SHlqUCUiYeSt
         u1WAIt7N6udnb9dgZ0771/55aX2MYM9UqZ6mAN7mEk6UNXrn91fvHEMbmrEiUEe27FlT
         DAbw==
X-Forwarded-Encrypted: i=1; AJvYcCWqb8DHV4AlgEz7YEFTBIkL7Tj+RvPS4/yAN0QbvPXy3n9kjAof/rL488ocNbzyaq1BwBUUI3GOFNgSs2KYdNG3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/jx/Oc2Yhp8tvxmZcdbsTW1OkYmcQifMnjX4GejkKTEHJ1M5
	0C9eChDlINl4WDyFDHP5hnl2dZWHTedCQ6ap8D+24H59Gdoal0B6OTFBMADv1I4R/y8JbxrP7jP
	3
X-Google-Smtp-Source: AGHT+IETIz9D680TqfPPi14OhcJTCce++YlCJVtGFCgaeiH2J9QxoyUipjIog0IewX5/qXnrJYcwqQ==
X-Received: by 2002:a17:902:b201:b0:20b:968e:2583 with SMTP id d9443c01a7336-20bfe023e04mr150588355ad.2.1728396777142;
        Tue, 08 Oct 2024 07:12:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e3a0:1c0:95c8:8b16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1393a292sm56215365ad.173.2024.10.08.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 07:12:56 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:12:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrew Davis <afd@ti.com>,
	Martyn Welch <martyn.welch@collabora.com>,
	Hari Nagalla <hnagalla@ti.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
Message-ID: <ZwU95d+JjoipFy0s@p14s>
References: <20241007132441.2732215-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007132441.2732215-1-arnd@kernel.org>

On Mon, Oct 07, 2024 at 01:23:57PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The k3-m4 remoteproc driver was merged with incorrect dependencies.
> Despite multiple people trying to fix this, the version 6.12-rc2
> remains broken and causes a build failure with CONFIG_TI_SCI_PROTOCOL=m
> when the driver is built-in.
>

(Sigh)

I will do my own testing and will get back to you.

> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'
> 
> Fix the dependency again to make it work in all configurations.
> The 'select OMAP2PLUS_MBOX' no longer matches what the other drivers
> dependencies. The link failure can be avoided with a simple 'depends
> do, so turn that into the same 'depends' to ensure we get no circular
> on TI_SCI_PROTOCOL', but the extra COMPILE_TEST alternative is what
> we use elsehwere. On the other hand, building for OMAP2PLUS makes
> no sense since the hardware only exists on K3.
> 
> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> Fixes: ba0c0cb56f22 ("remoteproc: k3-m4: use the proper dependencies")
> Fixes: 54595f2807d2 ("mailbox, remoteproc: omap2+: fix compile testing")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 955e4e38477e..62f8548fb46a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -341,9 +341,9 @@ config TI_K3_DSP_REMOTEPROC
>  
>  config TI_K3_M4_REMOTEPROC
>  	tristate "TI K3 M4 remoteproc support"
> -	depends on ARCH_OMAP2PLUS || ARCH_K3
> -	select MAILBOX
> -	select OMAP2PLUS_MBOX
> +	depends on ARCH_K3 || COMPILE_TEST
> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
> +	depends on OMAP2PLUS_MBOX
>  	help
>  	  Say m here to support TI's M4 remote processor subsystems
>  	  on various TI K3 family of SoCs through the remote processor
> -- 
> 2.39.2
> 
