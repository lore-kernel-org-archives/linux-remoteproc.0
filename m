Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875735CB82
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569366; cv=none; b=QK/2izkhyr3opuMSrls1v5nzx5reLS+6jMSmHDmiOrhT1Unc0YE6RK5693/IPacAc2mcHobf6Ls7XwRje5tOV2hq5b9mbi506iygOEVYtQkLSjxOiuFFL6Ty3iZLBSoExzDTSK//9SURPW1Fivna1rvRgQHx1xbw+eXkwbhNeOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569366; c=relaxed/simple;
	bh=4tZVfB9dJ+rmxklUVisjbT+aHHa2hP/95ghmvU1+jv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd36MGa1Nz3E1ZE56hW9dgQ+/cHb856jQOgvEV0VQRdCBi6yHyDfBxfUjyODw8of7fqtwCKEKoA9+tptzoiseYcYmHiqgEDV9T8gDjYB7JpL57WmkuLy6Ym4fC53pc6s/xlvwlGgshotS8fbG3w0r+eZ6r6zW0y8L8gRocBjE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xE9gufn/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xE9gufn/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso7848296b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569364; x=1764174164; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=;
        b=xE9gufn/HyPx1J1FHvG46nO5e7dC32J8ZDVbZcCfJaO7HMleyz1NWZrgOKyL9+hMMc
         ZqQB/X2etB4WKjPkf6DCLa8CTzxv+Jnt99Gh7kzXnS7EF2WmtmAE3msPLkaX9aMrImSy
         k3FjhU+nPsz0vjYtIsT4tp1UOimOhztNo16IagJB58yJoIxed/FelEMxgC+X6xIWIxbF
         WZOZhKBsD/STpXJsFG5O2UDLPK/av0kM8NJrc8OPiQgJYBU3cY+xFUKhXLCLQ4HO0N65
         BrGYOT3TZBl9m4Pbe7Vs9IbKztJzL77o2xrugqB5gSkSo/IWfZq7TR/5a0rWGqYFZgb6
         2y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569364; x=1764174164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=;
        b=eqIhz9tYO0bE9WNa7zgEpIU/Yo3XCOIUuLJg/153kR7Hd6NrUMfj1a4cCGLtQCYT5+
         /l8kJp2afUSfRf3yxvinuLNkwAu5jejLlnPCzLDyyNSi09ig02f9/ykdze3a3WSQS0Cq
         wlBekfuc0r/0m9MllfkcSuAgw2fTw3SIpwqaedI+rysWYYtakf97q2kWqZ4JhqtyOQvs
         u2gegRtAJ3CWly6Txokn6+h31KPWrQ0id7vPy4ZbqPisYCWFx3QIIf+HafsPRyFFgihl
         fkmaGfmo5WxZIM0ItxVXGmxJQE0lKUv4VM7jsQrhDrx6ip8bHYeGWuiyYwm74jLEKeK6
         2Lsw==
X-Forwarded-Encrypted: i=1; AJvYcCXtF4flSvSEEjs63Cqp5QMNbev7/KgsoRX7iow8J0hFAQZBYzfZkU4d67zT6guME9EE3gjDR0RK2yu2BpFR3vGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5C4VFHEUozAIkXUI34ftcnLXYj/chIC80SkPDIDmYMbIWm1Dh
	vkw8vut9YEp1WlfKm5un/oj3TZHYpOp5XWm/VWGwuKcQJj/Ivuwx8Z1gpZPV8ZjcSaQ=
X-Gm-Gg: ASbGncsL8zC8PVr4rwnVghZL0E0bwLZCe19plVdZh2XWI/ZyQYlgRZVUvZc765DkTTQ
	722h/rmvNmjPboB8tomRCrqW89cEsxc2Bcq56HMl3G4RXltQPAYPiZrGcsWWbWbhhHowjAogQ8w
	6SEWariu4O4NlsbXJnC2TLCnjC6jIa1WFRRts38/GvUCTVAdH+Offtkp3Eu7Lo9MaySQKyaegJF
	GAnEFYWFLEbiFJ+9UZRIJEIRNzgO3tYnZVnJZeKzm1mQmOp1Ss+2Vc0u/KGuwBEVCdTbf/gIwl/
	4e/YdlvwHuGkdCgKZ2D1EyQLzuxgpZfR8241EdGCjKsqjiIZreoRhge+BoMk6w8Qg9V0g/d3yU/
	nmPFOx5QXS8noycyV7pcd/0PFS1XA/H2pwfZJlBubj9dC4a12xE1R9qN98yyqsuBVyEMBqoLd3J
	KTa/+y3C4BU4HgTA==
X-Google-Smtp-Source: AGHT+IHuSIrZBCiLgca0WU1DQj7ineP68uKwSXumgVfu9Fe9sbAmM4VWuP+tv6PTaJCg3+0A1H698w==
X-Received: by 2002:a05:6a00:812:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7c29c492acamr4056626b3a.14.1763569364343;
        Wed, 19 Nov 2025 08:22:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f8d9:9ae3:90a2:d39e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba611682cfsm17088879b3a.26.2025.11.19.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:22:43 -0800 (PST)
Date: Wed, 19 Nov 2025 09:22:40 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 00/12] remoteproc: imx_dsp_rproc: Refactor to use new
 ops and remove switch-case logic
Message-ID: <aR3u0F7FTZUgxCQ6@p14s>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>

On Wed, Nov 19, 2025 at 12:21:45PM +0800, Peng Fan (OSS) wrote:
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
> 
> Patches 1–5: General cleanup, including code simplification and adoption
>              of the devres API.
> Patches 6–10: Transition to the new ops-based approach, removing the
>               switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
> Patch 12: Cleanup goto based logic.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Collected R-b and T-b
> - Address the build warning in patch 1
> - Add a new patch 12 to cleanup the goto based logic
> - Link to V3: https://lore.kernel.org/imx/20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com/
> 
> Changes in v3:
> - Collected R-b
> - Simplify commit log for patch 4 per Frank.
> - Link to V2: https://lore.kernel.org/all/20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com/
> 
> Changes in v2:
> - Collected R-b
> - Patch 3: Update commit per Frank/Daniel
> - patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
> - Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab
> 
> ---
> Peng Fan (12):
>       remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
>       remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>       remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>       remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
>       remoteproc: imx_dsp_rproc: Drop extra space
>       remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
>       remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
>       remoteproc: imx_rproc: Remove enum imx_rproc_method
>       remoteproc: imx_dsp_rproc: simplify start/stop error handling
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 353 +++++++++++++++++++------------------
>  drivers/remoteproc/imx_rproc.h     |  14 --

I have applied this set.

Thanks,
Mathieu

>  2 files changed, 186 insertions(+), 181 deletions(-)
> ---
> base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
> change-id: 20251119-imx-dsp-2025-11-19-fa99d7c84c91
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
