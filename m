Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B232570A
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918428; cv=none; b=JRQC8ixYX6l0y9AngN5bDbkNkh9rjBy1jaAtC7NsHbDg0I2wNstLHkjfdpZk6ruVc3VI593oEuMJMoDu0S/ZmK7YAAunGDnrQu07B3TdKPuHJsjTEP+yJqGMXS3jYM6+N4mlgY8vRODC5iO7t2UOEVnmHNQgbkqbYoRhPx6LuGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918428; c=relaxed/simple;
	bh=SsDoW1F9IimdUbums/aXlP3kPueowrzS3rjSQAcbVNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGiEfr8tCBx87qHIXFXqVCIiLY4W2y15y2sK3YdX9T4S89B+yFgHJvw5sYLGwMBGuAFFPxZM/b68iAeQcwYmizQGw/hNwSJ3iJX1Nawf8w83yf3zqpsQylOAEUzkcXs/RGK1w17DoEgHcNRVbhC+3F5SNft6uWLLOveSrIbE84E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4HT+o3Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4HT+o3Q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso4178372b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765918425; x=1766523225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=;
        b=O4HT+o3QRmo7ripJLGRia7ttzYeJQU5iqNG5eE96jAKso3mmPSFWkXpqkOpOrQyTWG
         FTQfaOYjrWm2Bztz8pyMPvh4NWPIyBm5AfY9fL8laW+FQHr9NyHaVi7Og3T/U1wRWG+Q
         dK6TWQ67WPGQVQyZCRJJqbukskcaajxhUyb48ND3wWVp0JqAx2JlZAKu4DTr8YOUYRmw
         exCJqLuNpiB3TgSSiRPkxzcxKXcrZIRvxTqEK4kz9ESMEtWtcPMZTPH61NY5fcbnSv5X
         szIdF+yAPwjljJg45IYYzvdx46QN+VPGPwazmgWh9p9m/QLadLfdc8VuxxMSaC/8W1Q3
         StFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918425; x=1766523225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=;
        b=ot9q8wXD5j8T8qWaXLb4Pwl65qRW3sgD3QdrJY6s+3RNNDwW2+cVqulqD5hPnOp2Zt
         qKP5vfCJ2fP8QNRD544F1YMrAEbWar8vWlx0OO+EVlJgSxswEOagCLdzZ5S7HjOpPyGs
         F1RI8b0bWxdIU/KJpXESJ2/iXtoqmvR01p5KoudtGsHieLyPEXgjxqlgLJvf85Yz7chl
         eSatVuxQbY/EOm0dPq1UdlDMd4Pz56n4U1bJ9KW2+YhdGzru3FNnKYFawEY/vCopllFl
         ++AeAN3xI604fgUXEDlYi023HL8HBaaUCUG2GEr6gCWmCwPd+6iWam6U3kt7xxWvl1vV
         z9hg==
X-Forwarded-Encrypted: i=1; AJvYcCUT82BhyjI/2VzoWvJ6TFqflN+tnhCWSYwUni5T2n0emeoPClkmulMIVLlQ/GKdjft5XCKIh7IabI0wFYq5C6Wt@vger.kernel.org
X-Gm-Message-State: AOJu0YwSVFZenPsBRrlWh8LWAI7T42JBnbzlIKVRF5iek+dK6LYOxzv5
	gOiM8VmRZwp9Wg6cTtdlEJvonY42rF0l/23hjNV59XNUUUbJcB09Z6nhA1flysEuSEI=
X-Gm-Gg: AY/fxX5H2/KOcGOkioChP2muKDXzWe/n61A8LCVOVB5zJpsdcC1n7pzxEvNujM5GCvU
	GrzOs3kHBmy0gEZZ9GDcqPWcUF20TJgL8io2IvX/+JfmCueIFtNo1Xuk0xvktlMVdyela5RfPtQ
	OFFUQvg2UU5abKXN29cVbmzZbTxdRtX5i69T+EjlqMr3lTHk++4sSoesYMUtAJkp8gPqLShfrSu
	PnXrUqN/G7AtF8TUAj3k4b42FE98ptKXPOytzie3gWi/zrckNe6a/FAQeTFPAIZhf0JisQLQ9wz
	EoI0+F0TovpWpgXGtFo5bMdtROk0Udjk2xKL4Yzj+MPiBocwlEF5+7JWejXGMAiTk51ezjXplie
	UhKM88uS3b3IPzHt7+mEc1jscoKTQ0oZtAJ1sQFIRSkbL2I6q33Bryy2gvWKrAzmAUrkypBQz+L
	KCjPJ0TyO4C7s24g==
X-Google-Smtp-Source: AGHT+IGF2rbTSI4Q4t7Hy49LQZnu0ZesdmocTDZQXJHCS+mdCGABBHatiVGmZZZWsxcTaHxupGoA3w==
X-Received: by 2002:a05:6a00:a118:b0:7e8:4587:e8c2 with SMTP id d2e1a72fcca58-7f669898f41mr16662303b3a.53.1765918425228;
        Tue, 16 Dec 2025 12:53:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb5c6d9acsm482316b3a.0.2025.12.16.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 12:53:44 -0800 (PST)
Date: Tue, 16 Dec 2025 13:53:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Message-ID: <aUHG1svhft249rn8@p14s>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>

On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
> -- 
> 2.43.0
> 
