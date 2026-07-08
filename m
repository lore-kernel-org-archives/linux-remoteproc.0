Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963BF47D920
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529561; cv=none; b=jseAKD0gcaZOmVEBzJrAHRGEtVV2aLb56EhiJisBrwg+Ez5IhGogP2zTTI3lXt0LtRMqIrquyzr/4xWl6bUogB+Zdj9F4M1G+Q5GLEpAjN6BbYnjZhTzn0o+DsG/0a6dcFWQm9Kqh44WvnxhtR5HyW6dFYpNKf4M2YBRRF/zOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529561; c=relaxed/simple;
	bh=UKK74oBj//dCoC8VMB1RGDEsrghOWG3yhyS/irSiIew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTGPvJsGJ4uvh9SP6XW+vSNo0s6Qy9z6e4ZSbOh9sxljXZ8XQQWW/lYB78zZt5GfeBp7PAhS5ctGFqfP6Lu9Pf78Muz2LN3VsPl32IEPwgd+yBgVaVCapJ0ESpcKSZ0zsGjLrtyNZ5HefzMoghGxVKtfKgwEkfcoqTzDaCtVMv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWMBlrAK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWMBlrAK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8471013fac2so26446b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783529550; x=1784134350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/8he9g4g1EMf9ol1adAgO+GmtYoJo0irIC09VPP3sRw=;
        b=uWMBlrAKA+p/r80KrSKHTkaihixMlml3bQXkAYEt2fw5pix+yDdX3rob4lmWYUK9st
         BroqTrGx54/+MNJMZQjYjmk0iw1vABpOezXkWoEtFK9AFFvhRjSuobTmJB93OGdb0oN6
         QGr1AaYv7o21KrL2cAlkfPQABhKfxauaY4tL1UMisvDltl9r+XS4dz7ZxP+m9x+tw2yf
         tCPx/XfnhyJvxEjOIUSyIFBt9AgQL7yli8clxLUOni61hjJXVlepoMkUTinQiRYfvYPh
         pEg+1WV7wBgTzeWiX7Xmqoaxe/hsHnm+jR8r+o5XCDsNoHTzeSQ/KPYeS8WBIApBWPH5
         NOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529550; x=1784134350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8he9g4g1EMf9ol1adAgO+GmtYoJo0irIC09VPP3sRw=;
        b=clcItK8Qht8UMjqQ3ME0GBZBXYRARBh8DvpgXoE72CjODJ1eBjH+hOtAWkBIU7SKv6
         WS14aozGcEp+iX9Xfe0J6H9+AwXwSrrM4BrqDblIPdv7E6JaMH/XI7HjhhZWWXiREtdC
         72eg23yZtpwsog98M2fR3TC17Gi8cByuEaoBDvayuwFmctpgSRnsD0Lbi0uk/9TpK1ei
         X6lAu5T1LhiJVSHDPSLxkt3VP3vS38fH/ZKIz/rnrcSddMofaV/rZ6GL7MH4C8sWndso
         hkENhCaxrm7jtJOCH/LLhEfiXXEH0BoD2hlbL74R1RG95g6RVBDJpANhCj4FulCSm81b
         jhjQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9c7cSZkfnW0mIQrWdrb8VfPaIC3rXxYHEoGUEm5lsPBOfXyJ9n1NbmxJx+wO4CDR+SxGUgGvcr+OWHepmlVh/@vger.kernel.org
X-Gm-Message-State: AOJu0YzF805j4McJQvd8nLIzsk3SMw+LvnzYjlDwctBq7pc6zcv7XbVd
	DF+J5KwF8hEuuSiujQurBXgMY91cVQ7W/gJuRT3gprjc9nkmxghAjUwfOQ/aVsJhjAqvCHvu/uz
	f6zCft2E=
X-Gm-Gg: AfdE7cmn0c8V3KEE8w+J8LU8E5BS/l+oQ/QNXyaj8eumQvQyWiQhr8zKDZ6zex+honz
	4XjYZwcEXUF+n5jOJGsC5Vfh1oFsrslxxk5r55w6+OzJPWDTJhmvMMG8q/K7SxWU+7+faaiG/44
	hVjSF4Ye2d0zNw9CX+scshdJg454xt+oUUkuavbl4qM7lUzqjclo6HrXNX9mByB1opglXth1gGw
	LPls7kVSzi4FgoCgF7tkt+4MvJ4nv2ydBTPVLedHX21ncxdUEG1A19eSoKMFW3dFYAuhl14LOs5
	yp8ZO5ivU9nNvsn+aYohAzDGMV/HeWBzb5h0KlziXx8CaMZ3wRLmejYA2LMyTqNsI/7KYWY/80g
	wZ4bCOHVTqYrGzZNKcv4JBHBO5FAZ05Gfkq2k+vtjIDQIpgkhPzTEbNBckXQeBsUDjRrVYjeVns
	EfO1zK2aZjL8ve7kpJ37FciAEPBE4=
X-Received: by 2002:a05:6a00:182a:b0:848:2f6e:e538 with SMTP id d2e1a72fcca58-84843241b9dmr3348154b3a.76.1783529550483;
        Wed, 08 Jul 2026 09:52:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:da71:a4fe:1ac2:9750])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84846b8a576sm1169973b3a.15.2026.07.08.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:29 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:52:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: ti_k3_r5: Drop redundant NULL check on reset
 control get
Message-ID: <ak6AS7NmN8Lw0v3b@p14s>
References: <20260705172353.119031-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705172353.119031-2-krzysztof.kozlowski@oss.qualcomm.com>

On Sun, Jul 05, 2026 at 07:23:54PM +0200, Krzysztof Kozlowski wrote:
> devm_reset_control_get_exclusive() does not return NULL (only valid
> clock or ERR pointer in case for non-optional get), so simplify the code
> to drop redundant IS_ERR_OR_NULL().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 04f23295ffc1..b1d04d082e44 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1074,11 +1074,9 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  		}
>  
>  		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
> -		if (IS_ERR_OR_NULL(kproc->reset)) {
> -			ret = PTR_ERR_OR_ZERO(kproc->reset);
> -			if (!ret)
> -				ret = -ENODEV;
> -			dev_err_probe(cdev, ret, "failed to get reset handle\n");
> +		if (IS_ERR(kproc->reset)) {
> +			ret = dev_err_probe(cdev, PTR_ERR(kproc->reset),
> +					    "failed to get reset handle\n");
>  			goto out;
>  		}
>  
> -- 
> 2.53.0
> 
