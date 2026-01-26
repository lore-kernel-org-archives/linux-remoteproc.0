Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526B8348886
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jan 2026 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446187; cv=none; b=EEtBADVt7+iqA8ifWki56fj1Ue64LOekNZhCJjVWW3nW1eCVyab3wmDWvKrZeSyiAQUyJGdwtZUlrmbcOyaoGKWwF2PU7LA2T7HEdkNi8k4u8rIKAmFbE0EbY00hxVuDkysjTRmvTHTQoKBRTzOVsiuqkNbd33J1jL6OxaPopxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446187; c=relaxed/simple;
	bh=wcDl92qrj6gtr3M+a+7Ixmj+6kaZn8WOD9ZkxcA6MLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDGgfECgsBpX4qI+P8o92WCqwT9rmv/rqupqf2WWcy1mxSu9/f/gLt5i4zBh6y6wAzZdsxXWgineSuK5oT5mlOQ3imISVcAtv3XEx5mm+d7K/+uRRW1HBPqJYwkgeYrPc4roHUKLwI4C+djSo5KCNctGd8ZrbGJl95NPAfUWsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjM4epAa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjM4epAa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a12ebe4b74so46099585ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jan 2026 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769446182; x=1770050982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=;
        b=BjM4epAaJ4p2jQsPCwsNkegXG/zmd8pGi/mGOhx5MLMIuJVCQ7pE4FyKKf7Lh9YEf0
         IY1wk3IwexyaCM7LALsPFyygxcFjb+ePi0u7OTKdtgEQY86GKfOz/4u9upQ6PcyvBXE/
         KPwg5RctjbNe0fQsur+3Tfaj1IzLZnhyCDCoXW3yUll6VX3jsTezIEj0XztL1dJVrVx7
         y74VTKB/o91Ol6aNomJahfygQPJTrrBz0IcoZCvM1iO4sE/WHrDpJGM6CgQnVOrewrdj
         1wFgmOK7AMLXkn7XnDyEr930adCuHOd/EEkBlWY3Jvwl/F4XJnebfyw1YreNGdQGOSuM
         /I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446182; x=1770050982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKR5exgvtJ4nN+wmy7UGkJjcYwJf1VIP0gn7pcEz2lI=;
        b=tcVs+afJpIPy6BshztxRepMznpGdCcCDnTsZUWX9/5F288ajROZD5oJOv7dyRvp1Dc
         trTNtruiAz5elWieOHdsisq5ZO8vAoX4MA2vnoMWDF0K+CU6g+s25wxsmZz5zGgfR5fG
         FVRJkIt3t545iW2/daWyMCk6XOO4P4+nB2SA5QvniOyyeDLv5XBjeJC1+Yn1Cl9LJLbM
         VpNtXw1xtqvc//8MfJYqge0JKw6/JM8RTJGe335DZ3YYwDkMk+Zh2le8BXVDGR/ivrQR
         TIBA2rLD0d5Jx8GEYWdLce3S5XmB77XxsU/o3j04NLpsCfr6XM3UW+IhFHGYbMGPPvfI
         7tXA==
X-Forwarded-Encrypted: i=1; AJvYcCXgbPp8Ai5oGstI/SPQe5xjIBJLtPLSnTRv4JBPgLrih83sNb7tKh0LTKcW6Bm8jwfSECz+/P0zmCGLHgf3Scl4@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnHdOHPQ3qmZRx1in57J8CibH5IU15yAGpvinU3yO0aLvzGAf
	zpie1D3LJuul40WGxJFaZAEIIe/k/b4z9Dv7xdU3YeW4skWJOelHYBWE56Uwa99RJoQ=
X-Gm-Gg: AZuq6aJGJJLCeUX/ES7etB2q4bpgTsJUfB/XXW3oePpDJN8G/ynEm8OsxY/nqFHOD8V
	xSfQ3bloQ3PtjBnLh73dJMmuke2+erK2A58AygearjYQAPBa2zaD4dWAttjPzVRllI5xmZY0k8J
	PFOpJkNpcbOy/2HqwFBe0/tQScuyadXzmWGR6I0B54XLuSgZ/mAZ/J24mh7OitxUxvd1NijKDqA
	NAUQBkNDId2to9ktq/+Na5E3L1YIe7yTRoSlun3CveStc1BQHqJ/AwuBBNMmEMR9wKAPwSbiVTi
	vpO9/8LUI4m6gVFKiWYbeCACg6S4cv3l9AKJsj8c7a4fhqS6EKK4OqGRjqcMMCzBhDbPZvY+2/z
	0Iaax/YxE5FV7hql97QRCijjquqHxGJXVcO4Ay6Q9hf8v/mV5/ZFG3AsWE1lgSzUFuXJSUgTU1F
	a2hkk5Sw9fRrqV+Q==
X-Received: by 2002:a17:903:11c3:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a845224d47mr49945825ad.16.1769446182265;
        Mon, 26 Jan 2026 08:49:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6260:7bcf:7e2d:fa8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcdb8csm94531115ad.31.2026.01.26.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:49:41 -0800 (PST)
Date: Mon, 26 Jan 2026 09:49:39 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Not report loaded resource table
 when none
Message-ID: <aXebIztkPihBsLRK@p14s>
References: <20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com>

Good day,

On Thu, Jan 22, 2026 at 11:24:43AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When starting a firmware without a resource table after previously running
> one that had a resource table, imx_rproc_elf_find_loaded_rsc_table() may
> incorrectly return a valid device memory pointer (priv->rsc_table).

priv->rsc_table is not NULL if the DT has a "rsc-table" entry, indicating that
_if_ there is a resource table in memory, that's where it should be.  Function
imx_rproc_elf_find_loaded_rsc_table() is buggy so the narrative about a
previously running FW with a valid resource table can be dropped.

> 
> In this case rproc->cached_table is NULL because the current firmware does
> not contain a resource table, but the remoteproc core still interprets the
> non-NULL return value as a loaded resource table and attempts to memcpy()
> from rproc->cached_table, leading to a NULL pointer dereference and kernel
> panic.
> 
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no cached resource table for the current firmware. This ensures
> that a loaded resource table is only reported when a valid cached_table
> exists, which matches the remoteproc core expectations.
> 
> This issue can be reproduced by:
>   1) start a firmware with a resource table
>   2) stop the remote processor
>   3) start a firmware without a resource table
> 
> With this change, starting a firmware without a resource table no longer
> causes kernel dump.
> 
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..cf044b385b58fe1e17d0fc440c243d76ecf020ae 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	/* No resource table in the firmware */
> +	if (!rproc->cached_table)
> +		return NULL;
> +

I think rproc->cached_table should be kept for internal remoteproc core usage
only.  Please use rproc->table_ptr.

Thanks,
Mathieu

>  	if (priv->rsc_table)
>  		return (struct resource_table *)priv->rsc_table;
>  
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
