Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2D1ABEDB
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Sep 2024 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726068031; cv=none; b=SQQ+zpFEKDXZGBVrfXKK7vCgcOTS8gz0ZXDPBvORr7gvSsAWSrXw7R3bzU7YY01eHwLT9wJYVyOCl0a12uigI5WXf5ByKEFW/iO60xFNQYZnT+Ld3RB8qeN81ncloDDTFbBYDv47TwBsnWuC0SQqbDcLaIfjN/MpLqkcNKPNAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726068031; c=relaxed/simple;
	bh=h1IZOH7/jMEJ6Q+LRccc6HsCSL0I04Yr9fwpPaCiu0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyze8/mP5Os3K+cD+6ZPs0Ftl1XuREgp6qd5cOHofNgZ4zLj7iiaZkBjQGrcwEju/+eU+Qy7AsRer9P1zdJaXnRirCZCPEwv1O2jYU60F7C8vJbCmwv+BbF7NRS6coEyslkZBxgO6BBzzmMwt94NNKSbwYz7Y33NhQDO5ZsYUFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ToWkr1H1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ToWkr1H1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7179802b91fso4424813b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Sep 2024 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068029; x=1726672829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QsnF80Nnvoo/JnHghxBCTtAMnmOaIQ36MmFNNxPphg=;
        b=ToWkr1H1K3GrmyZs65aLcdN0Z53cxRkPNTqRGeHi46bH2dPPvaGFjkhiKK4C2WgpXr
         BSm01UxUrPi5JlMPfYNhinWspvvAGtFe4EyknvPLArSQAUG32UcSG5r9TiW16DXoxMrG
         pCQLF2dZbx1YoGegnQLZkYZI/2bTQ5Y7PnzXOpGyhQBY/a/Dku+wIvXzXHYv+yBxAvLk
         pM+Ba2LPx+9He6aXde51hwpQn5yRO+KaufjZoBLtZULaHt+VJSITSYLZll46UgTBxRsd
         rnHojbHjkW7JVuhRcXtiwChhVq0WGl2Ck0FhJIZmB5U3JcyLuEXNDg3MycuOs7FMse4S
         kb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068029; x=1726672829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QsnF80Nnvoo/JnHghxBCTtAMnmOaIQ36MmFNNxPphg=;
        b=nMs6bKUtkFG9461I3b01Xz1o5aqQfdq7xf5R5he7P8gLC4HZFzrhKJ7pX5wfj7Q93u
         hOz8Wy1RBSPglY7157Mh6kyMpTgeRBAmV0fMOeVxDA+O9UWN9I2SrpihdXJfycs684KC
         Z2MKvlKdRhvO2/Adfk9CJ8zqfa7RYfLoyQftgR3JUoxl0fxmkVDShPiICKUm/wZBYyZU
         WZESV7ZGJXgZN2rq54sukLJryBC1SflZSQRMlRWtguPhC7KIyazrghRO819xSKKiUps0
         e4Wxetwxp/98ivg1IvvbkmO1QTlJa2Qn2eAZZdYeEODccJjs47KiuvnLqT/X9bKDxHfI
         mR3w==
X-Forwarded-Encrypted: i=1; AJvYcCXWmcEaworj8YsI6kN2pL3g9fkHl3ZNPSb052A+6QS4xrNZCSPuL7iggHjrii647LXQzVcLp9bNJnHol9/PylCZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy58pomtA/KQX3Yk/5Icl7TmoExIqnGJ36Hy4qRud8if9GQbKe7
	0QY+GRld+CILyWwX7P4LfkE6VUCUQ+vDahc+2+e7c+6ljaSqqx5k+vCJwpflg2A=
X-Google-Smtp-Source: AGHT+IF62OJJay2y+CU+PR4n787g3j2oQeP+yBY3R968kbDmjxolxaxWKCPxr0TAOuJnc1ZT8F6S1Q==
X-Received: by 2002:a05:6a00:92a6:b0:706:b10c:548a with SMTP id d2e1a72fcca58-718d5f06a3emr22601898b3a.22.1726068029283;
        Wed, 11 Sep 2024 08:20:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc9a:9892:2799:3634])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090ada75sm3099467b3a.162.2024.09.11.08.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:20:28 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:20:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/7] remoteproc: core: Refactor resource table cleanup
 into rproc_release_fw
Message-ID: <ZuG1OiYO7YA+c81G@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-4-arnaud.pouliquen@foss.st.com>

On Fri, Aug 30, 2024 at 11:51:43AM +0200, Arnaud Pouliquen wrote:
> This patch centralizing the cleanup of the resource table into a new
> helper function rproc_release_fw().
> 

Sure, but you did not explain _why_ the change is needed.

> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ace11ea17097..7694817f25d4 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1256,6 +1256,13 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static void rproc_release_fw(struct rproc *rproc)
> +{
> +	/* Free the copy of the resource table */
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;
> +}
>  
>  /**
>   * rproc_resource_cleanup() - clean up and free all acquired resources
> @@ -1485,9 +1492,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  
>  clean_up_resources:
>  	rproc_resource_cleanup(rproc);
> -	kfree(rproc->cached_table);
> -	rproc->cached_table = NULL;
> -	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  unprepare_rproc:
>  	/* release HW resources if needed */
>  	rproc_unprepare_device(rproc);
> @@ -2067,10 +2072,7 @@ int rproc_shutdown(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> -	/* Free the copy of the resource table */
> -	kfree(rproc->cached_table);
> -	rproc->cached_table = NULL;
> -	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> @@ -2133,10 +2135,7 @@ int rproc_detach(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> -	/* Free the copy of the resource table */
> -	kfree(rproc->cached_table);
> -	rproc->cached_table = NULL;
> -	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> -- 
> 2.25.1
> 
