Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3071411C7
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Apr 2024 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900765; cv=none; b=UM9Y3ZDxgtOi/gRHBpD8D/m5f9VhtF/gP4tfGUj2Kj6TSAP1qM/Nd+gWEOglDwcaAVGNtsZ4mNAtnsKHbKGWhnzh2CD9AbJ/TTxV6+eU1cl9O7xPXWf2/yFgMGspusbZfWIGippdx/vjaCVvugGfzo2p8TV3BwfNh/PtewFjwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900765; c=relaxed/simple;
	bh=Yg9JT0GPJ5FCanV1IVJLCalS6j631626ieKfDNZIsrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hk6oe7pk5zwk1DAUDRHlef7lRG6cl4zzrgTXDDYVzP0bg/Am2LySquux6yk+FuqjNAWZyT6le2RD+0g8kNeR24Ytj6KwZC8EQxg0408B7yTHemQ7nDgTlPtSLqISkQDJ/e7plqjjkawwZf3Z6ZnL2o/5VduUhrm4+qSDe4OcNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSFWSgOT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSFWSgOT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e65b29f703so46840725ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Apr 2024 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713900763; x=1714505563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGaS/zfSaOemq/5va4z7SgRNYZdnHSSpsk3opQQf4+o=;
        b=QSFWSgOTGdoDN6D4+fkm8QQmoqGM567uVjKxahKv8GcfdHg4qbtiNIJ/yNAzkf/lPf
         ATkMA2JtHEJbBeegOKAkWz1RssVdzMvHYeQ+TOugGd2N5AQodzrpJRblCNARB72e8k4Q
         fEbQO09BRJzxTXeIq4XKptITqn0l9wEKc6CHjQjEprLRf6mgN1DPEQPkM/LOom4ES/6A
         9K1psgyIoGJip1jjnZqZ4sdNyx3Wzmuu5kYyZiqfYr9A9Ln7urdj1jn8xHsy3AFBvTui
         i568gwc11HvadS35bFiWpetuizEdpmAWst5FxXwq9MZsPXzP1+D91ZXFpN3EwU8VwqBX
         YbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713900763; x=1714505563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGaS/zfSaOemq/5va4z7SgRNYZdnHSSpsk3opQQf4+o=;
        b=cjdQ7YJHuql3/aVtM6NQ1nL2sCRGSDBcohldHnmSQPms14TOfGV75UYn9+Q3N60ASh
         KVvl2IM1lPtTET0cuJsyPaB6XR63NK1yRe8EtrX84ZI2oxgo8mvTDp9hQQwWgSO7N9w6
         eBxQXmx6FUKzH5hMcBJxZdRaFXB3KhYqzQrhcsUWOsd5IlpmPU/vr6lclvNlyTzZG7CC
         Xr9XW/M2ZmXDIH6mhymq0wgFAuH+gpNg7D74kdKg2NRDXm7azd8qYhbtTg2RrqErMN8z
         jPuGAMdMrw+e9oOJ8hzee3LOVic2Z9wW3uj79Hx+eVFSdwTHet5WHl2dbMA3v+wZvBed
         5eRw==
X-Forwarded-Encrypted: i=1; AJvYcCUdlnf9DmsPRnkhScTcu9PAtD6SXyGsWmZ69cFo/Ou/ZbHZY8ETyFtJp/O5xc1cV9S2GZNzQqmfGPCIeFvxqXSlrWYbufOh8FNUaMTGSBIFpw==
X-Gm-Message-State: AOJu0YzL+xqdgKkc2cHxSgSZsaRFOekROY1RFWS1PuCHIwVA3vwE/Ax0
	wm7t3/ETLwv7xPpdPbnPk4gRxlVKUpuU+W5vq5vi4b7TG8QFItJmcB3GjusFdHI=
X-Google-Smtp-Source: AGHT+IE7HckQKrB7EekRQpTfXp8JNrKSb1ZYBxmPz3IOLyDMxafIxaoffEuDaKvno/obq55gOhpMuQ==
X-Received: by 2002:a17:902:cf11:b0:1e9:55f:f3be with SMTP id i17-20020a170902cf1100b001e9055ff3bemr533792plg.43.1713900763238;
        Tue, 23 Apr 2024 12:32:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:951d:44de:e424:2887])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001e435fa2521sm10401699pll.249.2024.04.23.12.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 12:32:42 -0700 (PDT)
Date: Tue, 23 Apr 2024 13:32:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drivers: remoteproc: xlnx: fix uninitialize variable use
Message-ID: <ZigM2KORFbsJgHEW@p14s>
References: <20240423170210.1035957-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423170210.1035957-1-tanmay.shah@amd.com>

On Tue, Apr 23, 2024 at 10:02:11AM -0700, Tanmay Shah wrote:
> Fix following warning for clang compiler with W=1 option:
> initialize the variable 'ret' to silence this warning
>      907 |         int ret, i;
>          |                ^
>          |                 = 0
> 
> Fixes: a6b974b40f94 ("drivers: remoteproc: xlnx: Add Versal and Versal-NET support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404231839.oHiY9Lw8-lkp@intel.com/
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index a6d8ac7394e7..d98940d7ef8f 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -904,7 +904,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  {
>  	struct device *dev = cluster->dev;
>  	struct zynqmp_r5_core *r5_core;
> -	int ret, i;
> +	int ret = -EINVAL, i;
>

Applied - thanks,
Mathieu

>  	r5_core = cluster->r5_cores[0];
>  
> 
> base-commit: e99fcac055b3325283d6c5c61a117651fb147686
> -- 
> 2.25.1
> 
