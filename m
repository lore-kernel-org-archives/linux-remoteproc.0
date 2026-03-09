Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052313BED46
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067035; cv=none; b=QX/TKB8bk9BUaqPvlHCdZY0X99XTyTd1bk29XAJY0sycdq1ru40RErtTS/lHwEf2J7UjeLqZrycARgzv76HFQaG+ybt+agrtAyjD6712h9GNak0VDYUF2EdLpnpPXB6BOU65SxZNwDvX7qNiTwJRI1RC19fa62C56m/PaFWReDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067035; c=relaxed/simple;
	bh=9wFHCio89LaMW7wPY7AbeCn2g20iYeKS9H6nhdbkUFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXi2rc2y6y0i7fhZW3CNdE/ccutmTVZwXUAoWYAEQXlGxveMUpfwhtye11oIx+MGs0uA1IFaI2C1ZWlvODnpPwuX71gJQj0mW1yvblnf3gqqVVW96EtuVN8iUAXPPxX5VVlApHWv1hosciQbyhueRFb87C/baFTmDw/Esp0luVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rK0FGgZr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rK0FGgZr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae8979dbb2so16544045ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773067033; x=1773671833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RGC50SoNQ/IL+9dTh5yK8xHvRueXeBTNyhrhCxqJ7wI=;
        b=rK0FGgZrloX0aFougthPY5DNGrwdZp1eCR818R3EntKElY7q6CaFmILqn383R369bS
         Pc4Shy3HctIOa98oLymGd+7cH5byA4ieKuY5JLz6euwzvtTbIVIN2f+eDGjUi5FGi8C7
         s98JoJ4NCIDYpecXffUOxTAp82MFZFEUAdXnZgBB+Zyg25573mvSxriYnkcHlNtDj9Bs
         k8/InPIslcIulhqdAEH71kxcDknmnq6+2JU7MJGQGQ32dS3l55yhdb4HMAXFmFHiDb+c
         774PUzF0Nz4WKm296sMJHMpTniIUuE/gU6A43dY57U+4dPf4V+yoJvPY02vDNw33i/Nn
         Srwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067033; x=1773671833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGC50SoNQ/IL+9dTh5yK8xHvRueXeBTNyhrhCxqJ7wI=;
        b=NuS0VarVq9NMCcVq+eMgKu14FPxtWCJd74ncOIvoDyxrlh9bcsxpKA5oi84qZdg3kn
         fZaar9z8iKs2ZLJM8GqWHue+pwjKtjnVJ8TYYDWqgi5isAdAiPyWXqbaNQ/z5fyFyGCS
         1CxnWxzuR2vnFQJvl7TOw9T23hCX6F8B85Jy6l7mkgLM0JB+JIi6z7dwDjChdGK1O/8B
         E9/14GBOda7SND0fIpEHuZuOq4Vl0AXo8oiT/jt/fuCwlf5HzEWl5GPAjLOJrxsnxXdJ
         asvTA6ZpzgegcHZ6VJfQm7UmelIdVOwVPCb5PJpbH1v13X21YidlLd2Gs/u0pVdyowza
         gZkg==
X-Forwarded-Encrypted: i=1; AJvYcCWccqoJC6enLeLsIER3jpcSzcXNE0CNjxwShCCNAiuA6ot1ZkRYd2PcakGAvXIHBzJ6+oz2GFYpDD4Voo0gEadA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6r91+prllRQMl8WYiVwKW9VAEB+AbVnKWHs7ZySJLm9H9B2JD
	no6hbXDR2JyzXwbt8Qer01NjPzI5lQuh3GvBUDm3Amtfwp3RPvCvPQK0G83DUme9t6oudcpccgs
	ocDIALyE=
X-Gm-Gg: ATEYQzwhzGTxWmyqTuCudNAIo22L+3FSIblZLYLBsOg1jj+Hzn/75cD0ul2JFhSfh6U
	VXhHeM3iI32He3G/znjw7ak3kqLrBe0n7yBbJNAP0RPXOAg35UaO1y8U7sTZ9zf/kLaVm21lyCR
	qsXQPymyWZkhYpeAM68VwviEgTqWYtL199Ox6I6XahtBBRNIcIwkpbCjjRPo4pCGBFvcETMhId6
	fDkQGCWJd61gdt0XpRjY+JxK/10vxfkooivAvfucgXHUbQUEnaM4F3ylAMpf4nyz7Yo+jiSsheD
	e1VTlNW1bomLKU6BlQZKvnDvDpaAbMQp2QDrGVMSVj/L8VA2PVskyD0tUpyfRcAkKx85riiNGtr
	n95dqUMrVVfbSm+UeUH/VfK2y16fCll1WTJ1Nzf3Pqu7kjoFXrCqS0IM56q03vBSb/o/8cQ7jKT
	H7EE3dnEvZjgAbxbjyOdy9U0meutc=
X-Received: by 2002:a17:903:4405:b0:2ae:4dce:7e92 with SMTP id d9443c01a7336-2ae82421b26mr106299285ad.14.1773067033127;
        Mon, 09 Mar 2026 07:37:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9504:de97:a114:6f18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm157222545ad.85.2026.03.09.07.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:37:12 -0700 (PDT)
Date: Mon, 9 Mar 2026 08:37:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: gregkh@linuxfoundation.org, Bjorn Andersson <andersson@kernel.org>,
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: rpmsg: class_destroy() is deprecated
Message-ID: <aa7bFpwOKHz2727C@p14s>
References: <20260308140850.1138376-1-jkoolstra@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308140850.1138376-1-jkoolstra@xs4all.nl>

On Sun, Mar 08, 2026 at 03:08:49PM +0100, Jori Koolstra wrote:
> The class_destroy() function documents that:
> 
>   Note, the pointer to be destroyed must have been created with a call
>   to class_create().
> 
> However, class_create() is deprecated. rpmsg already uses
> class_register() but the class_destroy() calls should also be replaced
> with class_unregister().
> 
> Link: https://lore.kernel.org/all/2023040244-duffel-pushpin-f738@gregkh/
> Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
> ---
>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Applied - thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 96964745065b..948541656950 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -650,7 +650,7 @@ static int __init rpmsg_init(void)
>  	ret = bus_register(&rpmsg_bus);
>  	if (ret) {
>  		pr_err("failed to register rpmsg bus: %d\n", ret);
> -		class_destroy(&rpmsg_class);
> +		class_unregister(&rpmsg_class);
>  	}
>  	return ret;
>  }
> @@ -659,7 +659,7 @@ postcore_initcall(rpmsg_init);
>  static void __exit rpmsg_fini(void)
>  {
>  	bus_unregister(&rpmsg_bus);
> -	class_destroy(&rpmsg_class);
> +	class_unregister(&rpmsg_class);
>  }
>  module_exit(rpmsg_fini);
>  
> 
> base-commit: d466c332e106fe666d1e2f5a24d08e308bebbfa1
> -- 
> 2.53.0
> 
