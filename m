Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B263314AB
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 Aug 2025 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756485365; cv=none; b=m8yeWKL/iMfrQ4pq6+59TxNzPh/oTOs4z2sP1EySUyzD+F0mTnQO+p8E2AHRi0x9Yo4ZmUYmClseR+O71bi/YNXFbj4T2SnuY/lB5NzaBACXVmMbAjJQx5W48XhmKKseW0ZGn75UXVESzjg9OUwo1LtEHm1d7EbqQOl+12VYVs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756485365; c=relaxed/simple;
	bh=g6DPg+9G+u+KXdS/aqqNtXMfZdZ9CvhJXM+Xcml6A98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSYsUkUFaj5wEQCgRxJbfnFhUuRfSQ86K3Iaigi2vPOlTLjR19auAEjU0CwpPEaWr0xNFLHLgXHtMlAZ42jjU//+AaZc5zoWbqXFYhIyO/Mri1XTLJtXsMmRniVANknbNGj/tYj2IyIjdCtbRx7W8o08HThrV6057xPHcW6UXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvJ7JhnV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvJ7JhnV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2487a60d649so26355865ad.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Aug 2025 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756485362; x=1757090162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FrgUnL2QkeFAcmcHIflVwTc+GW/TBhLQty3c0DejXRk=;
        b=rvJ7JhnVfOXBfOmVeupb+q7bhXvkBFrpMD3DSK0LVigIRp4YqL5CGwi5W6Zg7eYsm6
         NjGtUb8HL/Ff0+9OX6rgYxYlwsFVphDqgfMU9lrwH1Ly6QMM4F4+FNIfVcjhPGudgLCs
         etxTGEWAyIVgdS22B8E/WWQb+efCTGaSEnYfmsXenlIRV8fonAR85oQLczfhUknOSww+
         z5gcvZDJ/qGlats1qkzjw3Rn7kFc7ryI6/+ZzwuQvSInS31f1/7p8AER3VpSgJw0C71r
         JQe+H4HMrLIodfbG2o/RlxMtTvebAlUw9R0ROBfMlffTVronFyYGhoM61wa4xGL2MXK/
         HXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756485362; x=1757090162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrgUnL2QkeFAcmcHIflVwTc+GW/TBhLQty3c0DejXRk=;
        b=nO+8FKDweUhyxeTaVjHL2nbln8ACWj2+dU+AoTchClwJWTaHQisE1Mb55xfqyUmloZ
         gEVYSPZhrnbDaocGMIZoDvfF4ugbOKj10riSef99tlnggeThbREFSmnG31z+O+BvlMgT
         ovLXFTPYbeh4+vUbM6Dl48UiKVGHzXO/4eAx/xA4v+wLh93qUw5f09HziRjBb+jje+Gt
         +hWGAV9r9o8uhIRM3gWu0CMzheHL1niEoOwP9CznNZoGpd58oSn811RqJqgGhJ5V71Bq
         RtGnZSPEsjNCqqUXt97a0xay1z77c6CPDICTp3NFoOX3RPi53tuv5yKgZ4Mkl2B1GahZ
         1dEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo0Yzlp5h3CcMn7uiAUK9myo8G7B67uC3zf2osXeg3JsudCrcV0yFsbDWs1PZRVyahWsSbrh62xEzoC/EI5Qgy@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSKOEaRfnfiPquqvLsFoLEZ143WBX1EU1paYlnOShQXkJ7c7y
	nz8ORaNyIWRI6iDYW9CEvOfSmnK1PhAOvZ7jp7xH6OmxT4qRiRhqjOd5u0t3+SmCKtQ=
X-Gm-Gg: ASbGnctVvo28Eao7JnBP5nGMpFurdsn2ukgXD/2knmifhb3WowUjcxItAs5s2gVc+W3
	M1fPf6mENqkA9HZYU8QEg9wAWvh9+831Lj7U1qqX5kXqI7zhozgQOwvZX7iqvHB5qepE4xOI8MB
	/E4ddfvTWk9eq+YE9SzpjGOBxVOSVmZSvrpMgEyqUcLv2U9qtncLO+pIiQ+kRRTFlTlP+4TH6B0
	25tl3t+Ja3y7LNZeM+mRzunfJlrNLbo8K+GFjwD7ZSHwQ7oND1IqdfhUTtcDaZh4isPWvFQOJBp
	cAsZeJuGCyE65KhwFEn6MtepjjDyRIKLOhhoRn0HEWeaUyCmIqPa3ehhv+jKhxcuDRSBZAGKdUU
	i0iNwBWnpGKw1rxiT89UDL8GLFcHxRaauCNE6NMoDsI0nl7hjnV6Vfr1+zPmoa6NErVMh3M8XtB
	ftdPweZ2NIbnX7DAYATKauKIHDOC+hJ//LVVI=
X-Google-Smtp-Source: AGHT+IEa10BPBKAnfR2ozvF0PJ5lZsMqEaKkULfql/YRzKK0it87d7VCRM15mB363K8S4++H9Sv2rA==
X-Received: by 2002:a17:902:ce02:b0:249:26a7:f5d9 with SMTP id d9443c01a7336-24926a80b8cmr22971255ad.41.1756485362100;
        Fri, 29 Aug 2025 09:36:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c8f8:92f5:116b:3068])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490648d67dsm29530045ad.108.2025.08.29.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:36:01 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:35:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: andersson@kernel.org, ulf.hansson@linaro.org, rafael@kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] rpmsg: core: Drop dev_pm_domain_detach() call
Message-ID: <aLHW7yBvEsAlYQoK@p14s>
References: <20250827101352.927542-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827101352.927542-1-claudiu.beznea.uj@bp.renesas.com>

On Wed, Aug 27, 2025 at 01:13:52PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Starting with commit f99508074e78 ("PM: domains: Detach on
> device_unbind_cleanup()"), there is no longer a need to call
> dev_pm_domain_detach() in the bus remove function. The
> device_unbind_cleanup() function now handles this to avoid
> invoking devres cleanup handlers while the PM domain is
> powered off, which could otherwise lead to failures as
> described in the above-mentioned commit.
> 
> Drop the explicit dev_pm_domain_detach() call and rely instead
> on the flags passed to dev_pm_domain_attach() to power off the
> domain.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index bece5e635ee9..5d661681a9b6 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -479,7 +479,8 @@ static int rpmsg_dev_probe(struct device *dev)
>  	struct rpmsg_endpoint *ept = NULL;
>  	int err;
>  
> -	err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
> +	err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON |
> +					PD_FLAG_DETACH_POWER_OFF);
>  	if (err)
>  		goto out;
>  
> @@ -538,8 +539,6 @@ static void rpmsg_dev_remove(struct device *dev)
>  	if (rpdrv->remove)
>  		rpdrv->remove(rpdev);
>  
> -	dev_pm_domain_detach(dev, true);
> -
>  	if (rpdev->ept)
>  		rpmsg_destroy_ept(rpdev->ept);
>  }
> -- 
> 2.43.0
> 
