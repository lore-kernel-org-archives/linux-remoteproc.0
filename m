Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90029257845
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328572; cv=none; b=o15jThL/OWyoBGPpFIfQemmLAtQwFF+IXdTAid9u+YM8bbsqupYpXVrZhN15UJhKWY4/yKd0OncMJH7+RRk6dZnFY0v3GrORxNuP6fr7B5YWGWpt1PsXAGTKVyASnfkIx5imZdrBMm0QGLAIBmjbGIPO5L9H1R3+kCm+NwknJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328572; c=relaxed/simple;
	bh=r//BOeg6hJFiIpgXCGuyUcHwsmeUXaZtItuSCfFTHEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNy3ZwxW7EVBJaWGZJPp3B8aVS2uLxVXdr9zXbQ6bfnIrxak4BmPpHLjSFK714P3XBY7r+l54X1S66P0JpORFfUMtqfpOrRMY+kQnpMEaREGxbQZdVtdHCDBmTaavUldtQqOfefqD1JhWhPmCKht//YkmYU7J6parQ1nbtbEeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnFdWvwj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnFdWvwj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7835321bc98so4534047b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759328570; x=1759933370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=;
        b=AnFdWvwjLnuMnEgtdiqGt28oZTIphJMJUYJBikA82HLCyxwwrzonbv5yZD1H0aJJtg
         eTcbUjd+0fkjE+TaiRrb7NdXz1xpGukphjKGkhkVU9B1p6YODCHMRXDD+zCXfNwmtdpC
         jiBfpLQaA3Yh8IqtlIekQ0andiiorSBV6auLv3gzc6Go2TXsyw4s9cqMuGaZCBRTpvZz
         AseDC0oD0z0o5T9BrUM1i4nNYC8m5zypDiHa1tU/t1DW3bVrPRESTLSAKOLLJd7LfwJY
         pzyCFIeZ+1yAS5334k2OPVOZhx2RtKNW2CImP5aAfd80Y7AD+NuoL7Zf63oJpKjmgvLB
         nE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759328570; x=1759933370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=;
        b=Q5J/x51+c7VxINmfrGmD3afdPBsrVeHhh0wvh1IYCXerz8ifbCzv2/flyBpb9RKxYU
         tmVotPRfV553A30eRUoSz/Tg7BhA0cHsF9fFdG6A+M7nXUYc3ua9rnPRbhSpAFsbBJth
         3J/nbWma2ZIpSzglYKzoPB5UVTvPwjMUjycOH928bLY2+tpe3V9Kq5oigRSM8Xk+39tI
         o44WmYZ0sEhU59bcI2Hc8+f1H6mq+DO1xTtNTrD0jfhlDwvclDSK43NnxpxxYMDrt1+0
         zIHdLomt1cAGC0x6imaHsNhOojMGoHjRYN638vR/qRaPDz5+zLzR6nqsbXHqNPBAW8en
         E1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBE4agEvjZ7ClfD6d/HgaNoAS4KgdsixQjpoDqjFNwzAOu/T/W1RwZWXDGUMHRLkyg2j3ltCRogmzAFoMhHGX5@vger.kernel.org
X-Gm-Message-State: AOJu0YweanEIoqYhns8rzXamDFJ+DJGQ/BXg68O9+dakf85YYSODcjEu
	x/CScwtjllRHuovKvt5uaMSp15+jFxJXvcoSbVSZHI0QAfbjhVJu2J8+R3rrwfbyr7k=
X-Gm-Gg: ASbGnctF2cmiFUURc6kJednleX+IIOVPdKBYCST1vqcTsfPdudfGpQay//+8GPBb3l4
	oXNQ6Fek0zkMAtw37va+MoxPT/zt6qjWDZytSbjjFbwxcsN9s6HKtRBoUL8En0+BeQIhg298Tdh
	1Zb3y/VkFHcQc2ywx/qeW9gtAeiGWS7LNTZa52Q8pIb9GgMY/xecLegFEN7/DBKtVad86J38Rqx
	z8+lDYn5H/h0/6Pf7Ruu+gv69Q8yIlGdco3SPcxxS2Y8T1O0H8ytp13eb3VSYwH1nhGwKpbM3g8
	rK4hA7Cf4LtMxKZYGNDsVAI2N/bCrxe3lLU5dfd0tcNp0M1tjJy4ctC3b29FFxoEiGDTNgrtdAU
	qRqacpUWQh1uZ5Io0sV4LJ3Xi0bS4R0DU42IZRym9zpynSVSu9hDihB+9xd1JoUA9kxcE+9UCa+
	hGqOwFsp9brAK4+RNjIV9/kFeO/hmGGdCt0SroZkme1qClkLy0
X-Google-Smtp-Source: AGHT+IHqVeD/wJUVy5+C2bUJIvZQddubc9m4Xd4Qgoes6H6s3Vr0Kf8vrqdjy3H/lxWJPRN6L5BOvg==
X-Received: by 2002:a17:902:f546:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-28e7f440582mr49997025ad.56.1759328569779;
        Wed, 01 Oct 2025 07:22:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8417:c9b5:17c4:6237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm186020025ad.138.2025.10.01.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:22:49 -0700 (PDT)
Date: Wed, 1 Oct 2025 08:22:46 -0600
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
Message-ID: <aN05NsINB25lW_Lg@p14s>
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

I will apply this set when 6.18-rc1 comes out.

Mathieu


> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-imx_rproc_v3-a50abed3288a
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
