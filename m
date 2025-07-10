Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFE725D550
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jul 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158952; cv=none; b=a/+kka+WQf0xZEkW51o17Vh8H6wDGqe6aqnboSwK1YR2e324wCPJwWIwViIzMCadGZTVQzzwJpE+KVXErik+hUzxNmjbf30CvSY4K+Rvg4ffXxTaHXdAkCC+TFr+vw8l+xsGFAGzMzqY7GaNXmhT/07qIWrMyJ2jVVJIhRuAaRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158952; c=relaxed/simple;
	bh=m4ghKtwKJrUsSVXZHTvI5Ps+AMXUxsLNPsCHx2vmZI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6AF68I1D/bmvzqCJ7aGxtqNvFMps28otR48jhSgmhNqI3dcQn6Mu4v+Dhb9AROR2sC+N0MQSzR77XydNWCSNV0rSDesddEsMDEYp11CcfZdUuWek1uddkPSXs8Ss9H/qilWLmC7mrzBKqMxFda816x35vGr6nm0df3UGcIcVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOxJ/l8v; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOxJ/l8v"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363616a1a6so9461765ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jul 2025 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158950; x=1752763750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=;
        b=sOxJ/l8v6Z58KHZnCcUzSfOcvrpJ/yer5qzvZlm+VppQBRoB6yIbW4JCnOIVfPsQxk
         kMCffVe7CKytB1gmneSGGYtiGH/LSOxhmfzjnubDpbH2T2rs5bs5w4BtsAgMuKhd1dHC
         HZ/GL8XDm2Hr+Jy38fVUVwJDwUVuShG40IRDohq9scravM3cQ3h0r1xPC0eJTzaB+eRU
         vdC6+SMmdiQQS3TT7Zx19vu3bpfSkMmYBEcsQk3B0Bdzc2YTYQI1rBIR/BVVPsiX5rQI
         dc4OaHBVy7b2oxiftdVMzunuLIYbxAySMVwBtfNGNxbI0674Pc7ZzReKfMN1NMJqf3tT
         YwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158950; x=1752763750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=;
        b=Mnqxrj7W8hosiQHmJgcPCKwZc8LERss21h2Ms3HpaesV4CKsF3yUKRitLJq87rYSY0
         HTugCVsU0NbJT5s1WG6IHyEKKHM9I+/trKrxcD8bqf63FBJ1X4mi+vLDwrO3n8TiIImx
         +iSkONNUkZiKkkBukm8uXojkDellPsjhgYNbYEEviqWocM1jnZOQPr1H+tI8FCy8b3wa
         HI4Iz+klkkOYXt90EmDlAWyYxaIDjC+iBd8hR/ytGw36+R3+xrFcFNdLPLNg5Gf3nmot
         9AEddO/jCorYMUUGD5dYYCvQ3BuTubaIUyifzuuzJ34iHTAdPsuvVVx8E5WVmKZs2Wr+
         EHCA==
X-Forwarded-Encrypted: i=1; AJvYcCUPR2xgsIjmgX+kJidDN61fuQOPM4mttFxrEI1Qln2XOcjSxbVnG+7yZ/nt6o1vP18xTm+iImuOcr54opdMceWM@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAuHYdGe3/TsguP45OgVrQTxRoFOT8USmi5ZYXoqe6BPO827v
	EInUZKeFyr3qv57bME2z13WC2V2AOv7DCDlvKDHmM9W/pn6ywo0Q3tIVbxDz+D9s/CQ=
X-Gm-Gg: ASbGncuRlnoLBhnsadAKdcsmIj9kc5+6qBjZM9zLgsZJIfb+9dUD5Q8uassxjHw+Fcd
	6GToNA0R2Rj0ioRKKrdCAdE+p/8BCY6GOdGner+9MhpNMRSTXyzUM6mIItV7hiFsjNw7mFdCq7C
	7r/JLgpzIU0yfhfzkj6lhURG6qvbKrrgMkkGcQ52TH0ahAogfn18cuauU0xPQ7jvkXoWPp0E/Rd
	3VXUPX80MUa/c9UsTvtH89gb8pcOHoPKhQaDXmaQa9QJZvO4VobjcRsRSrn7MRS0qgG2AcAjTq7
	xG6ZMVyI+yygcGlaVgqR5JIndH4psgvxzUZ5cY2HQZ6kdqAS6VrR6cqFatRYEskA
X-Google-Smtp-Source: AGHT+IHLOaTbeIxYAUR/yv9JVTQenD6oK2Ov/QMFGUQSqoTLIPq/eEsamfgUWhDnHyTHM/izk94ISw==
X-Received: by 2002:a17:902:e84a:b0:235:eb71:a386 with SMTP id d9443c01a7336-23de48b620bmr42210185ad.50.1752158950381;
        Thu, 10 Jul 2025 07:49:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c1:4dff:9df5:b97c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c301a8862sm5390817a91.37.2025.07.10.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:49:09 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:49:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aG_S4xA1uwbwVimP@p14s>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704052529.1040602-3-shengjiu.wang@nxp.com>

On Fri, Jul 04, 2025 at 01:25:29PM +0800, Shengjiu Wang wrote:
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report error "ELF class is not set".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ba764fc55686..6e78a01755c7 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1205,6 +1205,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		goto err_detach_domains;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> +

The previous patch is small enough that this should be folded in it.

Thanks,
Mathieu

>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.34.1
> 
