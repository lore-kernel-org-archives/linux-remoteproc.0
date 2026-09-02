Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273C37188A
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367853; cv=none; b=OWWlJZ7H0EfdUVUuoYnqgX+YwQc3CBCbj9rn8uTmfPSbDWrpIm3dAac1O4ASMLqOqguH4/DXrOXCkwlwPGZKN5bpimiEgJ1TNolbO0tDpe49xoxOLk/29Q1Y6Rqhpl5ZwP21QIloKhcPKq2v7zIb9/U7QHnyZ0UsGVbhpTTnATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367853; c=relaxed/simple;
	bh=k5rRICqrRTgGgXTc3CHRsg0Ro1RiUscjPIEybIB//jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP/uvp/ZvrCHmfxFZY81hamo4cQ2lzMgP1zNYSjtqhvO6UwFZlz985urLItzI/kwMBNcaAbaAGXhYiOuwPzDCdvybWcCrFb5/+Hl/gpSqbUDQPLM0k1PFXA8eMc6w59axr7xGDYrNLNaGzS0g+rnDUsuxOucXTD/MzlkEAIZsVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEqzZQMc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEqzZQMc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8fd3b729dso11842215ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788367851; x=1788972651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=YEqzZQMc8jd+4hkdFfpRzucoHFSAhnlu2z0N7je+l6HjjbVhDRGJKLnqNN3DjiijsO
         N+T6JFLBEUVsA6Knb1EoOynl/pAq9i+GO4REhFd3CnILzvzf2gXtjlGWDWLU8YGRrlgw
         zyMvKp/+k72AaI/+8NjgYyv4VyOQn9qff//T83qaDie7cNTFQ91HSB/7hvyqGLVTBwpY
         VGgMmwp1Vw7dGUny0GKdt1vwvnOp3wb6gFwpMn5oESYOnspXZjlyG5NJbSdmY1DFaplR
         v0NpMVzX2z6HGgQcTrBylEUMMU680bzH7YaI1MoN72IoXkVI5SMPAWXIxd+pYby1Asj/
         aI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367851; x=1788972651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=q0V7VCTTRAUoD3AeOq0kz+kxmSBfNSIlB6IeLq0hsVmJhwF3ZVlEuW/acTt/+As28J
         FxOQHXRdMIcGNaR8LPu38kbfmtfLjy1yD58jkotSEUckWbT3BjyU+p1yRCHARvBYF0Ia
         DAwBPMCRW2XR2M1TYMg6zei8PJs5MNluUbbledfJi78rC4a37LTj1kYBI8tk63phWh0i
         Jz89Fa2gzHZp6JBsui/6HwG8wRpcljMmu62B9BYNE9tvsgQz9rc0Tm1sS/o7N/6M/K18
         NzlBUDcwFRswcSeloXMmhfsW1x7vsw/sAsA9NowfUAcgtHqxID8J58dirnfof61n0k0v
         H7rg==
X-Forwarded-Encrypted: i=1; AKwUvByjhPz6gz4ZjLIoqK4bRMjuS238NiYz5VMFoG/pVyzLLlk8ZcQG9gCTqnEAwCltONXvvjIJGdCNo5iD5K55SlRN@vger.kernel.org
X-Gm-Message-State: AFuF++kse1XhPFP/xIzk3dL3yTW7AfyJGtondWI2Y8XcERyVhpkJh9Kt
	NnL0kBKTf9N1fgmsnU9GhrCvhgbe5wlTZYgY+poEO4CgjV2bcYQj6PpKmY+pk8zv1EI=
X-Gm-Gg: AYBFou2GHWIAg8UHMyloNqMmVevv29DDgeli+K+KQfvyZ6OdwBVgfQIekF8vX9I+j4o
	OxcZjxigcduc89RwjMhWLdcZHrEhfkKO9NynKE+mYyfQXORMFra74UvXsTaZ4evRNJZNCv+KlJ6
	GXZszFSr88fQay2ryopwRVURvuPJrTjtOUlLd6rZSfQsMEXCqJI1Hd6J9W827B5oMYiVzv8Xp9O
	sDGdVMoXBh5LFyMBQ5vCRqCfZuc82RYiksWSA0GneKibJViJiLuUHrBJUCxRCX4kTkCikH0te4N
	fcfI3QlxAlNMhwlRf7j+XOoQMca4xqejd7XzQ4JUbWLXlDCPQmr8yqd8yLQdhvHj5+z9P8LcQ56
	NQHhmocdiG4H7XXy73zs6U9vQifKUs8asP2OuXQ4PI/dFBp/Ds1qX6bL2FMa8KC90BhrFSirATn
	hAkwqFRu3zfIIZa8gS5tnXcX4MDMD3jCIwqvyoI8rVYwsd78jfT9qg8i9i7wgg19YL
X-Received: by 2002:a17:90a:d604:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39aee16a169mr9561954a91.24.1788367850624;
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07ac1174sm341938a91.0.2026.09.02.09.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:50:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp: acquire runtime PM before adding
 carveouts
Message-ID: <aphT5wHTNcGvbkjq@p14s>
References: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830133310.6926-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 09:33:10PM +0800, Pengpeng Hou wrote:
> The prepare callback publishes DSP carveouts before acquiring the
> runtime-PM reference that establishes required clocks and mailbox state.
> A PM failure therefore leaves the prepare transaction partially
> published.
> 
> Acquire runtime PM first and drop that reference if carveout
> construction fails, so a failed prepare does not add resources before
> its hardware prerequisite.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index fd60c67ba8a9f..96d619daf3f5b 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -726,14 +726,17 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = imx_dsp_rproc_add_carveout(priv);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
> +		pm_runtime_put_sync(dev);
>  		return ret;
>  	}
>  
> -	pm_runtime_get_sync(dev);
> -

Applied.

Thanks,
Mathieu

>  	return 0;
>  }
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> -- 
> 2.50.1
> 
