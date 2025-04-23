Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4875F28B4EB
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428462; cv=none; b=hl/ZzeqZ23jMBo2Yw9TSclxJOAUaR9CkBV0GrBYZ1CQokWFJ1NnjfKmf29Vq2dmxBoIjyh8q8FZxuCZU+Pk8u/FTe8d+2lL+jrGgM9VeQuiHb7suus2G5KbwonytwpgZSK7DMNYXXDuLAOC/HJv+23ofSNeOai03GwA9roBWpI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428462; c=relaxed/simple;
	bh=ILiHc9/+BLsPr+gKDiQnsPeVsRDiCp2pGP2GK0KliFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqDzbzbbL0gd4soZDNsI6Xqze0iCTOrY1NHD2LqHj6HsA5yDlTlvt98nJUpPvJVNc6IcosJwjRI1ixdxC+kQWes1okhOwuq+8XD8jQufuz/uRPd4djjnIE8NFPRNjZZeXWg6BPta8dXYMBy43W/BM6HzY3oPgi0jsRKpu7b5uOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xdkzd5pB; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xdkzd5pB"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af579e46b5dso4361a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428460; x=1746033260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=;
        b=Xdkzd5pBg/zwCNPN9mH+v2Zd4qVwIFA36pze/vlwim35OSRXnHSpFNodtajpfKy/tR
         xDfptLiayUlXEJYpu5e4lwr86rnfuBp6VYbpgjxKR3mRrIjStvlTaI9xok7jftUW086Y
         B22GTPCV3YaNonFhjQFBClvCvKHf1UAhZNBeJAQbcwNfiOp89XD2gejo7foJOW00Iqvw
         tQbjJk0D5/cQVvZep15Z3LU9t9YblwHxFXSQm3WR+0BU6i9swOQzOGDnT2eWRCkRRd5o
         NSI/ozVxZCQn47t+gCBRGE6A7sUIwqVuCJFFcUFSm3dJN+9jSqSdaVE6ZtYt4jB/WY8w
         7rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428460; x=1746033260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=;
        b=b2guMfmxrzNmiruzSkyAd99zgGugPhSbjGt/li/Mz0siJSUS8YDEhIxjB6GVgXUN7O
         fjCfrsms5gj5yo/RjNYVyFwrO8dtekJMkE2kSljp4F9W7ZT4WBjXPHsdN9FqAF1gfGYY
         vsnCI9qf09vEJDDtV5UhmvKBN54qamXhPBkm9oZM2t4zlOQYxej27z4AOwYOLv3wGbB9
         JV+V4AkbM4cpSjh2PoEFgzbgNxnj0WTqoKGYbi2ThGlsUfwrMpglaPT4CPEWjn4olTO8
         N+rsct3LW9YSXf6GrLyN7oGaslKRIbgnFCEEqy58Mb4yngZKJYWrYEJfSCNHxij16dUc
         naDg==
X-Gm-Message-State: AOJu0YwXrgmXlAaovRochk2djgovBxf7YVdU5Zv1p8T51+pOFBncXdfM
	/e5O4Io8Xw1PfyujN+jBQG3RGK1HKJ2w+TSualmjM9jfGSpT9LDc6kcDBL3FlBA=
X-Gm-Gg: ASbGncuPjK+6PobA1Gk7UeBCH2sTw4IF9rvCerRyj4vNbZgOTwSemKMMlhCCaWudawE
	XDAtQiLMZMiCtCkVHgwct7FaRFSCKPM/6B57m1gZeIAg6qjnihyNqO1wnUiNZ1JuQ78i69AG8xL
	A5bke8lAilbCyMDwRbQTlh1ekpeT5ZCLebx44zPybQSw8nK/sJ2e7mi53hqpFK5JU9YLZKUFCYH
	1x46cY8AwR5mwn6HF00yQFSEyD8p4u2XoqyvINIPt+TcBPlPIFKowCGItHuVfFzDM6jCGJYtLIw
	IeH58qHxsv2V7odv6VDadZO1hn0EJLAGRNKIneewWYg=
X-Google-Smtp-Source: AGHT+IFAdKiHZtT60k9AyVm2AcUDq81Ye1OBOZptRf8Zz0DnworMkFqtL7ZoS2eCNp44RT+dD3uaJA==
X-Received: by 2002:a17:90b:3a0c:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-3087bb56439mr32154912a91.14.1745428460444;
        Wed, 23 Apr 2025 10:14:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:11cc:1a38:e0c:9482])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0a9dasm1908698a91.16.2025.04.23.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:14:19 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:14:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <aAkf6bxBLjgFjvIZ@p14s>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423155131.101473-1-hiagofranco@gmail.com>

Good morning,

On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> The "clocks" device tree property is not mandatory, and if not provided
> Linux will shut down the remote processor power domain during boot if it
> is not present, even if it is running (e.g. it was started by U-Boot's
> bootaux command).

If a clock is not present imx_rproc_probe() will fail, the clock will remain
unused and Linux will switch it off.  I think that is description of what is
happening.

> 
> Use the optional devm_clk_get instead.
> 
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..45b5b23980ec 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	if (dcfg->method == IMX_RPROC_NONE)
>  		return 0;
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> +	priv->clk = devm_clk_get_optional(dev, NULL);

If my understanding of the problem is correct (see above), I think the real fix
for this is to make the "clocks" property mandatory in the bindings.

Daniel and Iuliana, I'd like to have your opinions on this.

Thanks,
Mathieu

>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		return PTR_ERR(priv->clk);
> -- 
> 2.39.5
> 
