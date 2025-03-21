Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974622B8BC
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572368; cv=none; b=gca8Y4wPw8x4MtTtxG8ql0Tp3WO41bwkf+r6ZU9DmDcGP98wP46OahSitViztT9Cx7MQ2GvOB+//xE8uTRU6l3QbmibIefDBposX5nGVZ5Z0QIVN1TR4mEbjg56dvbavrUYc5O/AxQ4GrKrUd4v4qwBwqYU4eq5yfCgaeeS9pKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572368; c=relaxed/simple;
	bh=xpYgzgHCL4aEs4Sob005xZZC6yqrNkMibisYuCubHz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mF+wuvCC8VuB3/CTyoJQ1JEn9mr2yzj5xtvV+s/TynO2BueLaJjKDdtoucy9aTjarjqaA/MvPXtOdm88D7oMAD5SwDIGhInrZB01FKfWiauA/VIy9Veqxuew7UjjcZHot/jrwZXSWg4C8ZuGGCRuTLznqoY2yijIockxE5Hw4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVhy2h5b; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVhy2h5b"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223fd89d036so42767545ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Mar 2025 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742572366; x=1743177166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wCFz2rwGIAFnKYLAQKQtiSfZpDubMLmmJ+Yie3s1lJI=;
        b=ZVhy2h5bc6N6kGBqvwMhqsfxNopyPNp1bZRvn8lhv6LyKpMrNojbQSw4ci9e6o1GHX
         rudNXM9Yj0dIKG6xeWTVjnJit3vHiZjccYkaQ0FRY12gf5ZCNFuaFQNEU7IBqYXkMHBh
         W8vTqck3okTLw8mS5uvK8T4GSGlfkr8uGXhJlf64FarQCINFAxF7G9kEQcK1u5ybn0eb
         OCIvV2JB5wyV1sRuUICWtFdt2EvlVXbgYBo7F2YpbDJdFuhdrtXcGWrnRBkARWDwFPHc
         qFWEqqwk2s5itoEX+GaM13MuHDVI1yrsUC429tDTp1JiWJoaxfzcNyNGqb5xpEpgIoTv
         XkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572366; x=1743177166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCFz2rwGIAFnKYLAQKQtiSfZpDubMLmmJ+Yie3s1lJI=;
        b=gshroL/N/iO9gBp7+c/W7THPB848WFFETvCX50ayx1UIhKNFQvhmssAXuDoHePSNZg
         7QfRyfsjJ2X3rP6RTKzFr/VBuiGsWSy/KRpwZp3aAft6aRwmxuInFMLNlctWY6wE+oMY
         eqfbVvbVnkOPSUuwEDshab0+0ne+sKSfWiAEirSj4rrtJN1ptod3xwn/2k49TjC8NoLA
         iNTSGf1jwiYj6OKttsRAAZ1r61b+rdTPQJbpDGKHjkJVeH69m/57jgw5glofhVMFImxk
         2R09763ndpAdXJBvZ4/iYZ0qOMytwe0wlMP5ivxKoFV98z9AKqbH4e0v8b907Mwrqz6e
         sX+g==
X-Forwarded-Encrypted: i=1; AJvYcCVvaZ6ZKLS3FPkcxZ3dia7WyPzC1umLczoJXOxw8xNbjRkAGZ1wvIrr1eA8Pvt0iaUZXvXpX77UgY2ZqPaEMEzx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3xalQGYd+hOYEKyRBvIVDQioaUOlwi51vNgf8VV98q8xaDTAS
	tiv5DMVgyZnCTtRe5J+eOjJ7is7V8HzmjQ7o7GnyJViscELFt1zHiJmA2MgQk+0=
X-Gm-Gg: ASbGnctpiixy+upC1lBros6prS41lzmUWqCszxFUe2gFrmg8e8U+ftC7AShX5dHbX6i
	x/PlwWHG4lHK5X/z2Y7ht/ORTWrqF9JYJ9m/L63NKSemxVuUUeEa6X8j7vKXIsnk8Du59uH5Lrb
	ZUsqjy9w3/gk+ubPyGoCa0d6BQIoIntfD1VoklJApCJcBVBfpHwzOhxlpe1r49l/4f2yXfBJ8wf
	Ad5pyUnZN4UWcD+CDBkKrUEGTnLtk9FwdYOZti5N/mgfSy5I2ovKqX+y7vX/mX9Yww1iUZTwP45
	jryVOvIrUtYNQr9s0/v8gN5tmoTMP+fadwo0Yz3R/bqmgA26
X-Google-Smtp-Source: AGHT+IFDoL8HtMQQvWLSLI6uOiwTX+pZ2lnqoCldu1lYiPBXMUuoqLjtzjra8Rpnqa21NHhQvW6mZg==
X-Received: by 2002:a17:903:184:b0:223:44dc:3f36 with SMTP id d9443c01a7336-22780e5fc09mr63627365ad.43.1742572366501;
        Fri, 21 Mar 2025 08:52:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9008:6e45:38ee:5d82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf63716fsm6232763a91.47.2025.03.21.08.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:52:45 -0700 (PDT)
Date: Fri, 21 Mar 2025 09:52:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 09/57] irqdomain: remoteproc: Switch to
 of_fwnode_handle()
Message-ID: <Z92LSzOZfp-OCqZt@p14s>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-10-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-10-jirislaby@kernel.org>

On Wed, Mar 19, 2025 at 10:29:02AM +0100, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
> ---
>  drivers/remoteproc/pru_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 1656574b7317..4a4eb9c0b133 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -563,7 +563,7 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  		return -ENODEV;
>  	}
>  
> -	fwspec.fwnode = of_node_to_fwnode(irq_parent);
> +	fwspec.fwnode = of_fwnode_handle(irq_parent);

Applied.

Thanks,
Mathieu

>  	fwspec.param_count = 3;
>  	for (i = 0; i < pru->evt_count; i++) {
>  		fwspec.param[0] = rsc->pru_intc_map[i].event;
> -- 
> 2.49.0
> 
