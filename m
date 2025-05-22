Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DCE23A57F
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 May 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925278; cv=none; b=kqqESu+KK6WdtN/HSkHPDvcl7tM2/iZYwTxsA9eO6aWBKptqrk10CAqY3xvHCvL5J+U36xa3Pw7QjWlUkivTFB4IHzT59Zb9iBx36ltrTX6kn6jaJeXcU2DLbG/qS1jXhBSfpkhiHFYXosVEhmsoeEd36pIG9QBPLCSferU+Bbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925278; c=relaxed/simple;
	bh=CSsSHfl39dvzw3cAIhZcsGAqNS/b3pZ0v69mn2DAeOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvMBDi/1xsl6+dAAkWuAl+KyxZnJSPyK+2lxZbpQyNtVFgJ7j9caiHx6jBCF1OM+A73GHQW231xdp934thsNlShhAnIanvBnCGHnqTBmWjFdeTq5hF6ViiKSRv5LmagKVSDUf2TpoCiFMmMcV7HCI7NC9rdj3bwBCMMuXbvrc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wBCU4rzY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wBCU4rzY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so6803098a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 May 2025 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925275; x=1748530075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=;
        b=wBCU4rzY8FAyQcxLPAi+lZkNEPsfzQAEdI6CXToqa5fMegOxAI70MMHULs4H9p1YGR
         746qSOuJejwR1suwG3gph9THZ2KWGr14xnzt9zFEk6cOTEuyChnFY1TqeKRYerfqEzcH
         2TdlcB3rLGkPgeWmMyeDofdw0CUvA9lYsSoXmvZ7flFaTBTtQ73VAJN+gbfiJZB5MbW0
         vGcc2m1rYrmM8gLcyoXm4eNf2l7Ftu3uuScKOx6cC+GEpW5GWsfQxByH3tyFKa2rEEK0
         8AVxKcFOIO4zU5qoT7QtA3TqHjwjDp28tBmEtmezm+FcD0chVKVxHsC4U5hXSwGI8UYx
         6Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925275; x=1748530075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=;
        b=AL3pA2u5mnlfHlFNOVWVFZC12hifiHfQEGPBlh6gdax0y3A4coO8a4oaFt1BIOGTjZ
         jKP2mggPWneWGDWi0Iq0kU4F+yt6gFh3iFsejh0eeHGeCip32iNBQ1meJF6UWHiIyuIA
         eT5ozOJyjy14PvICzl1fDpgpOPjU6c/16ecGOkYSs3KmvoFAx09IMEwF0v/zNBUBU2Fv
         kVr5g5rB1p4vbW5Y7Cr1BH3+hmqp+FiQdxbqc9Yb6zVqmU5KoaflYHk5HxAVtL4UqB7R
         YU+z/rbKGFDela2apDCKOIJSOCw0u1z1GUKte3i/4Xif24gcx0v7yR5qbNNuvH9T42NT
         FtcA==
X-Forwarded-Encrypted: i=1; AJvYcCURvop4Te7AKUWt2ZABRRXXUuXWIiMIa0cKkKM4pds+0yPdFn1VoPOkmWzpPyzShmYl+HDHi1pUNULLMcEKlYFO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5icOLe6GgYBablUPB1XokfAMpIcYxGmavy7gBUQqDs/q4ZHvT
	A9LcrYkotQOwO3Z/c8/EDypN8a/TiHbc+xSP2YGKf0NedEY3lBnKyJY41TPS/89zlvoysTocfMw
	RX6XN
X-Gm-Gg: ASbGncuv/trBj34ZySk3MLOQBRC3AJ/RP8Pgxr9ZLKco/KzgjT1YDlG5cpLiQe9amIY
	VT1LNgSQn/EZnKu079r4M1PHrpYjQSD70TqGN+W/1TURWt/2pbwtX9tFTv7qD459AwarvMVDlDl
	PO+HN+yMbZ1CcZSnq8anIR74TZEJWOO7DtqI7BtRlu17q/iQEFLYdCwe8nMEYclC5lBZzXTPJhz
	VzHfi68lAXeRRB0CtJ8aI53tJVCEU7bhVXcde9v9Fm3YhszJGzX31JZ2apJw71bIe2t81krIaFz
	LFP/WWWVLhOJZMC3MSzqRIoXZlDeq218z7MWupVjFhRtSMdDrHGVdR0=
X-Google-Smtp-Source: AGHT+IG5YDZqJMGCNUR1bl3lh55nwJynldcZarNJfaMbRBZQnBUy0qDHzLUmT4VJ7H8G0EhPmNRC+w==
X-Received: by 2002:a17:90b:33c2:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-30e830f7b18mr38271134a91.8.1747925273816;
        Thu, 22 May 2025 07:47:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adb8:3fc6:e0a3:9f52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36365d9esm5641713a91.7.2025.05.22.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:47:53 -0700 (PDT)
Date: Thu, 22 May 2025 08:47:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mediatek: Add SCP watchdog handler in IRQ
 processing
Message-ID: <aC85F1Rua2dn_qTY@p14s>
References: <20250521142404.1077-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521142404.1077-1-vulab@iscas.ac.cn>

Good day,

On Wed, May 21, 2025 at 10:24:03PM +0800, Wentao Liang wrote:
> In mt8195_scp_c1_irq_handler(), only the IPC interrupt bit
> (MT8192_SCP_IPC_INT_BIT) was checked., but does not handle
> when this bit is not set. This could lead to unhandled watchdog
> events. This could lead to unhandled watchdog events. A proper
> implementation can be found in mt8183_scp_irq_handler().
>

As pointed out by Markus, this changelog needs work.

> Add a new branch to handle SCP watchdog events when the IPC
> interrupt bit is not set.
> 
> Fixes: 6a1c9aaf04eb ("remoteproc: mediatek: Add MT8195 SCP core 1 operations")
> Cc: stable@vger.kernel.org # v6.7
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..316e8c98a503 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -273,6 +273,8 @@ static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
>  
>  	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
>  		scp_ipi_handler(scp);
> +	else
> +		scp_wdt_handler(scp, scp_to_host);

I would much rather see a test for the watchdog bit than just assuming it is
a watchdog interrupt.  And while at it, please refactor the bit definition to be
platform agnostic rather than reusing 8192 definitions on an 8195 platform.

Thanks,
Mathieu

>  
>  	writel(scp_to_host, scp->cluster->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
>  }
> -- 
> 2.42.0.windows.2
> 
