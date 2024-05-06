Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21D15ADB6
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 May 2024 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024580; cv=none; b=fqH76RgB3buKm8SIaUyzFm9ILEh8V8zMiFcaN9H/6X6r3p71KvSzda+ZTFzQq2s6+CF+WMSGgIE91FZjEg2Lg5XJ1dXFjTclUrBvsmvJ1iDHZ0FdOJTXCI5OvXCHH1jOlZ8cHTS/kwbvuZidR56NbtbQdvP1CSddik2eQetOeFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024580; c=relaxed/simple;
	bh=h+2r0KY2d/YSb1EViAvSbFH0CkwFTDZBvlP12Ftx8GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1qqkxqUJ+99RTJx8WUK5XW+zsh6AIrBOZDj0+t39d6nyIGftE0R2TivrYieTfPz90xm3gy+vDz3uyCsIhDEhTkND5ZMTvFIsBoshTGPOxXGrpQGoi4qCkaow4sY5n4JfndoGL2sN/puvJA7dV8uHthyW1OCJObjO/QVGkl9J4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pe9Br3NS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pe9Br3NS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ec486198b6so18699025ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 May 2024 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715024578; x=1715629378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=;
        b=Pe9Br3NSEqtiC4lnjmbMr08Cd2JU8dM1J14wrr3YCH094butT6YRTQrsX1+5Dt5RU6
         YOnCR2mFsItIz7yBLDJ6+W6LHa9z7PvoIGOzS8auTPT9MDHVIA3+a8+XJdRMjM0l+AoF
         /kRp1ZkKhmMj4dq8aLwPPioLpxQcJRxL3YHG1ofWIlYMCQJRzT6pV/Wads4uS14t7Isb
         wsbzGWN0ho+x7OrUYh1P/YqDLfPR7lyh6h8KE1oby/mIyIV9UnJ2Wl1jZEuGM8kWJ661
         xknNlMif6TgKX7TI8eHNUX75gNQipK3ZNLrpBzuxR/98fBq4lV71Wk5q24zWNQWHutRd
         hLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715024578; x=1715629378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=;
        b=rZ36+yHoOPAdWWpmpB1rmMSsHDISBVZH9miQZX7ActL2v81u+aQMplm/rgxrLPlLb9
         fOf0EB+aR3rA7cCspoudjTEfz+99t05vulhULqwDZJ+hKV9Y0s6uHL0QiGQEiQFYuNPB
         V+0Rvc8BBlWD5+N1RY5Qi+dGfcu5z2s+Nu4D4EKBDnNq/aImA0etnycOqW4+/peSsxO8
         ffSOs7Hj4cdLtHCMHL5kAxxa6APpZMriQLon4Uwy3NvD2sDFBRvDSdQLbHjh/zM1KiO1
         yV0yn2s5mZPBwoneYj/8uzOjD4smeHIy8AXiaby/uiuiM3d5g64dsb1F6GzX879h9CFr
         CbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy4FmvCQP/YALPe9Kw9Fj91tyL8AaKFjSUSCSIshibb5LGappLr1AwrsxhmB7ntVz6KCH/kH5MOSItxWyWSvvWrS9lAwYXPQ8fL8idfctNTg==
X-Gm-Message-State: AOJu0YysaxUydH2gEMG11w1fDk/jGaudWNcrdxEza9u1gtz67H6iGMSr
	OyjFATQPKkoLpr8J/O8rhtp1gn3vTJ94u/kNoyo+OxleqlU9FMB6jYTYLxrUZA8=
X-Google-Smtp-Source: AGHT+IGwS1FDFCkf5egNjpQBZQYUjij5H16IdPJ7aQt+EL6jbiC0XsfnTSn1KSAGBqBRJX2WD4uCeg==
X-Received: by 2002:a17:902:c412:b0:1eb:1663:c7f7 with SMTP id k18-20020a170902c41200b001eb1663c7f7mr13806723plk.43.1715024578211;
        Mon, 06 May 2024 12:42:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d0a8:32b:6e71:43af])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001e435350a7bsm4904648pln.259.2024.05.06.12.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:42:57 -0700 (PDT)
Date: Mon, 6 May 2024 13:42:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Olivia Wen <olivia.wen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
Message-ID: <Zjkyrx5j8R+ejwbv@p14s>
References: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>

On Sat, May 04, 2024 at 02:26:46PM +0300, Dan Carpenter wrote:
> Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
> allocation failure it leads to a NULL dereference in the caller.
> 
> Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e281d28242dd..b8498772dba1 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1156,6 +1156,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	scp->share_buf = kzalloc(scp_sizes->ipi_share_buffer_size, GFP_KERNEL);
>  	if (!scp->share_buf) {
>  		dev_err(dev, "Failed to allocate IPI share buffer\n");
> +		ret = -ENOMEM;
>  		goto release_dev_mem;
>  	}

Applied

Thanks,
Mathieu

>  
> -- 
> 2.43.0
> 
