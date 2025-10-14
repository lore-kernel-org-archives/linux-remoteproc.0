Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFEB21ABD0
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455185; cv=none; b=e3GX0idaNyCJOHNxX0Idcs3Ezu8iVfuZrEkZT/3Mf/Jh04TSx5WGcyzwk9fDMUifO333FOU4iXdmx6JvrqTVv/ev6HJlJxGKfU9wUBSg5DjTVFkifTkUEuyvcltE/nS90aII7GW2nPN29wuZS20W9yq7ahvDJav6t8YIBY2L1Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455185; c=relaxed/simple;
	bh=yO2ygkBHkX0cwFC257fCD00j1go4wNKJ735oVxo9cj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIkmD4anJFN+A0h5Dl6NTURWVYhox3r5Yl4fw48oStAD+kfEr0kdgs3yokHQXGgTiOlG6+YuP854dIGQHFtj8WoawyGPfWDhgYvD9jH/HGHKhvn+1IHdiuXdNUmrf0wC8SL+YGFCefzthX6klcJv04TsVlWGvi89iRsatPTEDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6NhpyYl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6NhpyYl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7811a02316bso3842317b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760455183; x=1761059983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=;
        b=R6NhpyYlC1syj4h8jK7YlL5h24dJJXCBqGQ0+hKIr2Egrr485eL8d9Wdp08d4x55ji
         u1jMPyDpUI3aC0vNopD3ryHorQHtdxXYurCzYjWVQCM2hb/YtCFgUIgRsy/FKhW1rD68
         ndfM756QayXU/VfCb2RLRJqAlgIX5pXYRdL77rJWs2ZbkfEnqAjRWp2+QvlfHWNnpLNT
         hW1Tjx3gktO54uXgwda5yZDSMu5aeFdEUZey6npJ27GMYbs65flUznzMFFvFbH5O0/RY
         pFt74v3jxlknmH+plrCh/WSA3XwLjACFh5hguzVvqtZzydz2brUJzJams2zXvgRlspyJ
         9J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455183; x=1761059983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=;
        b=NNnQmgCTD/clfE453ZFQi/XOEf5ozvczHn90rbCL0dqU/Qa5zFME7izYBw2ezE2yOj
         I4+v0ax27ThBGptnlYQ32SOhWEC/QBjL8JIp5IYfx7frhXiTPJyHsRqRjUokSFybaLEc
         HbhU1QhEDlgKisuf9uwcgXEd3cPT7ErWzAEKtiqBH5WvqAkH6e/zoG9e7qhzVx9xqvhx
         5mNbpQhnb4d/IuO1ZRD6AgX/q9Sxw/duV1PAmwMwbEZwNz6RHnK/f8+or2h3xf/tGRy3
         VQyxwMPN4CqvE0DPO5EUsoCNXrPnOyAtVAGHNrqDPOSPcbg1AHzfJHz0LHCBMSp79m/Q
         11Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXvicl36gHs4eZi3hZQcn9S2nq4TXPPib6OSjODdfHgbYORGIfGZEfKMbW+RNDavTVccS3jssA3Hu3mNX/Pvm7o@vger.kernel.org
X-Gm-Message-State: AOJu0YwRc/x+9Bu8KemP0XHbpTLXWVcnLPeDn7NraAQfT2eWjhMdOx8q
	pFMZrfhCbm9v2iZFqYT+66cO3nPcFYMwzdlxSKXHSoW32bBLAdoVHaSmJ0FWMBc8Y68=
X-Gm-Gg: ASbGnctdAY1EdvTSJKxmqYWgtBz5CG/uXdN8JsQe5svvrwc5SFiWL67QOqfC+d4kCpP
	McbKvRgOYxlijMUFYXj1t5fw1FfLgd34Tw6Ok4AzfqepLi2xkM0Kc3iLZAJN+ENF3f1UeXS9NhP
	bEWl0JSZy6LBbNMtQMvhcTGsj8XqyW0kiTwgTRCvXqXCh5T78MCmeFxd0q9fLWO3QgKCYfm2nlX
	eTbR8kSTLam0BjY38WtmfWrHOp050GYuL9KQmYQQI04/0W9Qac3GaGQB/1dyAhIg5xQP+0a5BzF
	vFeJ9XzIrG91PyblyFFpbwo39dPrbpnCllrirOAb6T+F82zAR++29vlp1SFmKaMWs/mwThpEVdq
	LtZdV7fQA4LQeSdZhr2V8twwGqpQE8Y1Rw7UfS/+YBAPyc0rk
X-Google-Smtp-Source: AGHT+IFyB19tBrRI78lBip24cgwJen4HE5EwQh3gPEKFeov+dsUsLURXmK6mh2xyEaOoeOtVoeTxeQ==
X-Received: by 2002:a05:6a20:734b:b0:2e2:3e68:6e61 with SMTP id adf61e73a8af0-32da820723dmr32624654637.16.1760455182842;
        Tue, 14 Oct 2025 08:19:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:68ce:31e8:3a83:30af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm15282751b3a.73.2025.10.14.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:19:42 -0700 (PDT)
Date: Tue, 14 Oct 2025 09:19:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aO5qDExs3j8k5cjf@p14s>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>

On Fri, Sep 26, 2025 at 08:33:14PM +0800, Peng Fan wrote:
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Retested all the patches for V3 on above platforms. And pass build
> with patch incremental applied with ARM64 defconfig. pass build for
> imx_v6_v7_defconfig with all patches applied.
> 
> This is the 2nd series to cleanup the driver.
> 
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
> 
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path.
> 
> Thanks to Ulf for the suggestion on the runtime PM fix in patch 1.
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Follow Ulf's suggestion to address the runtime PM in patch 1, and add
>   Ulf's suggested-by tag. I dropped Frank and Daniel's tag in patch 1.
> - With the changes in patch 1, the remove() is kept, then there are very
>   minor conflicts when picking remaining patches in V2, so I still keep
>   R-b tag from Frank and Daniel for patch 2-6.
> - Link to v2: https://lore.kernel.org/r/20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com
> 
> Changes in v2:
> - Address a build warning in patch 4/6
> - Add R-b from Frank and Daniel
> - Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
>       remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
>       remoteproc: imx_rproc: Use devm_rproc_add() helper
> 
>  drivers/remoteproc/imx_rproc.c | 100 +++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 53 deletions(-)

I have applied this set.

Mathieu

> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-imx_rproc_v3-a50abed3288a
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
