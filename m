Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9165B26F288
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 02:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765765191; cv=none; b=pHdEQ/lVRLzagZ3kVrEwBH76lQrZEHLHr9lBnOvC3ZNH5Y6ud64ZyZaUFx7CxMTMhs429cYpB5Evg/gKC58j6Jtnz846tCnekJB6sWEyyAdQaxAqF6fbynQN2AXs81RZgbPaP0gI0mRvQX2Po1B7XQOTnxN8YsSPqdd6fE4P28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765765191; c=relaxed/simple;
	bh=aW+yQYjoTCVBtGqvUIqWfBFdLzxBL6TthkJE1sLcV4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQhPIOqbpkv8VSHnmw7TqFmUDt3wgdckGHgY+qVVWKF/fF5Ai2SoFlL4rhN+B154RczGYfH3uUOi6Jbp0yueI0tY4piO81Db6PG3Et6xDhZixw2VpAjAWFuIS8ONtSfecYG3GOJA/QmCemGoQVqIT7/ehIVnOXHQ5P2mYZJqdoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q96ijKOn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q96ijKOn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f102b013fso35459475ad.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 Dec 2025 18:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765765189; x=1766369989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=;
        b=q96ijKOnZ1xion7zUYT7C53a4KBQlsNkx4xOGp3LfyAza1WgCc+i0x9/rcpPYc7lbF
         iXJY3BZVyRBRczPlyFFwjEF0C7fXFwyNFN/rJjoP+2KNOq2kfG3c/HSH8E89K60+i9f1
         Ha1Fc6Lh/SdaDhg+7yx28jrpH9qilhtUiU3BvGlFSJ+c4vL+1iLlQZr9UOkNegcq/LhX
         rCfPN86QIdxXMnu3O79LxyU41XMwAnqCbhwbGq2qdAuxzkH6zVI7nGxMp+UZzLskFSlm
         D2qaX+RYN14uZzNne1LDaezZOaVO2xc9bcQL1BSDP154r+IHKuWKLB1D2vld2qC5h8tR
         zyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765765189; x=1766369989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=;
        b=QkjfIazWWzEwZiqpJTMHfk4aFShEWS1XGYzbKNwyj8weVRHTvdzRshIn3GBXdJoQGy
         GSioN9pwZUf0ShEvK6qBDLgnjnP3Lk0hqx4AjTs+EDZx/5gRg3O3GbcmZTxBmTWsQ+qF
         v2vit3fWy5e3ryhcpo/xOrvRpcjDbV1SIZRohvfsMA7MbqnmKGN9hWaJT8XV61waybwO
         lGWuRPYah23mAmgbKwwx00Eal7EbauQ1YEw83gui6bTFfQHd3/ugsvhebyKBxMfxKGoc
         KGYBq1xdi+aW59y5wf/qw0c4PXluU9joW1J1jB1Bw2nENjFXinCushY0nem2b0Q74DEW
         6oAA==
X-Forwarded-Encrypted: i=1; AJvYcCUzXFmLh+AO6S/mjBo7ccPsHSIkVwvIov02zjzVdzH8Tcnx4ksDniG6u23JKWxVFmPKf0vBQSCShqPAQmOiZenD@vger.kernel.org
X-Gm-Message-State: AOJu0YxujvOk2S2IsYYRG+Qn2Ydtwi/eQICyJIQIIHNTJYe+OzGK0V+R
	abovRWWn7/OhFBts8jlPgY2Hp8JZWMj1lnWJglgKh10kX0imavL7eH8+e6QGTmIUEJ4=
X-Gm-Gg: AY/fxX7TUcusaHXxbhLolUG0qgS1bnVFULNUAt/K3nUnB77Kxh42dqd0fF1t238zcUF
	K8onrltZ4BH4lop9CeII/QXF61K9kKf02+8elC29TViseDynZ3jhbwaxKNXKPgJ8K0Kr7Nsn3lI
	oOkzMjM1BQTMlbeuNwR1+qfIqZAg0+9D3zHCCcov0SUqWZEaGS5Nlwy2uN97DYEchor+L99n5Z9
	OK+06MHOgjeVo57/iR8W/yrSLLqUXp86/4ynjGmUj2yJ8Q/xSF/o2ddpmEC0idZ+bQRsuu4uaOY
	kYXlMpSZjqtET8wY0z2gOldWDs3P5wcUMewTxIQmsvnA3G7q8a2853Fc+I8Ve+ii7pwFLbrbpS4
	5N0c5npghGO0nW9qv/eW67/WbY7entr1ZIzOpsPwXHF0DR1ocFkoSiGGjyVqaQYUKzBr2VMRp4c
	QwUH8y9L3/q1ihQCDJMw9aPGbt0H6GoRK6chhpLsh7ow==
X-Google-Smtp-Source: AGHT+IHIU/jYZqSE4lK3mrtbuZ7ZFUKFi0MmSupmKRFzoKfYEL8mWKvDxqp7/lHuRh29MqAgh78KvQ==
X-Received: by 2002:a17:902:f544:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a0d6d5b935mr26580395ad.37.1765765188823;
        Sun, 14 Dec 2025 18:19:48 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0e96df1c9sm15403105ad.39.2025.12.14.18.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:19:48 -0800 (PST)
Date: Sun, 14 Dec 2025 19:19:43 -0700
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
Message-ID: <aT9wP_3olsf7WbPL@p14s>
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

Before applying this patch, I want to know how it ever worked before.  How
did DT with a suffix tested?

>  		b++;
>  	}
> -- 
> 2.43.0
> 
