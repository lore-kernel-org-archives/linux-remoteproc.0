Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54283A0EB8
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136128; cv=none; b=EIfUJZsOjvyWXdRBSgjHBNiW9Vs/hSUf+cITzOS05Gqdp+U56HNxOU1Q4XTcSdizVJtQy5Eg9/bRbJoYs84GaqktgoYgYv52ZqTxH6nDOnYsyFkLPW7JqMnglISeW2ob0v5hcDC+YnvLaRg91BIyg2DNkzJBZIEAlCNsZWetOaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136128; c=relaxed/simple;
	bh=WTd3yzufsVxFkPGEYEeOvGW7Bj+BHGOfD5k7yFY0r90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Etd625R82il++YbHLN/T+gRszf3sJpsbvdiTdpN210ggbvj0CpjUW47zhuhztjTRlIp6y4Xg+HFRic0/Su6BRg+232FQy4jPzS5+TW9W/1WPlRAL5nIbddoSuvjVOBGJ7a/JnhXZphblcaT3wJcwpTbGxQxP7xtQ8i6ZKXd6wAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1rMKL16; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1rMKL16"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c61343f82d7so2329330a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770136126; x=1770740926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2ttDn1w1QA2Cz+Z+5lpKBPVG/z+n2qwJYLNRD++3uA=;
        b=M1rMKL16R1o23zwS/agRX9XnHKS9ccQUcJXnnPz1q9KDTtKJv1qRRmUgG86a8LaJf5
         BVRreIJ7rDOVcwIKUC2ZsFra4UvGHCuWwz8lPMIa10Zktd8UN+LOurCHpwmcAcsU8aK2
         OgwCzmvntuwqjxYlbQZ3i+gPfT+tAiRXBRRiO0K+MbTTWm30PAibhr11twJRG42hrBk6
         IWO+w81rtiywDsLJHm/SVXs1GkorHeQi8c/2Nx8erjq5tO+El8EDZ3eHbv7we8SS56yL
         IGIDOjWyCHOwQpAor6NknZTtMW9fj5eiMrlLSEw93At2ee2ef/WbjRsbn7ULKrauzdZW
         9k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136126; x=1770740926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2ttDn1w1QA2Cz+Z+5lpKBPVG/z+n2qwJYLNRD++3uA=;
        b=BtjJPH8vROxIxXjeuXdpsQKqopWETT9ZVm4DtOIAahcaxfzIPne1hz8TwfDyS9quz9
         fytF99D46HspENb/Iys+B8GDwG12wQstvs1Q5Vz0mo7L+sO29yh/l5KOZH6ZK7fMIUOJ
         AFEp5wuvmFMOuuLS02dBgczlODUqcbzEyMr9yWYvnZxHujydvhjOdswjFg1yjHGozq9V
         NCFBjgmQnREcbavnSnY0uANjZkfFF887fpNXF2wTbeqcHWNgVNU1u87bM517bjk7MgYp
         r1BqekHyjKNRiYK3+14eWVDzAFZVOQDuANOosEXE6CXwzETHQ+HbU6usazHSL+Iee5nh
         iURA==
X-Forwarded-Encrypted: i=1; AJvYcCXxvfpAsFMyjOpCcEMVkvSRYh9+Tv6bV4SEyYguxUWTLdaX8rkZg/pBmT5Bl4azuB8Fn5dyXLXhzU/oo2Ka1bRZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjSxzUCCg+LmTMn6j+nCieHuPk/zFaynYrJgLRAxKTWt2nxh2
	Eh9TjK2wyQBwOg/+PSqgNC500M1IWxIGfoNqX4sJeV6CjC0WnOOIOLeUHN+0aDO6ObM=
X-Gm-Gg: AZuq6aJEOFxE11R/1TlpG7vlTNuArNHQKZr2k0ZYccuIpdp/PAqZdBa2iWfjeN1WJh1
	oHAaWFi4GZPg71MylyXFBAhGFnx+Vt3odUFEP+FY/fZv17AdOJuFCKTATr8EQs06Oc7haH3ky9X
	rNYe9B9c+VTQvrtQ7KjjP0nTct67QEZKGZ6Mw+qNkQHdyo1K8N0tEqt+iDw5sXMW8Lloc024KnD
	ztzg3U803Rszors0FK1rlU9u9n1ARxCZwjc36SjdXxqonvUSuFuRell67F20c8toxHZXmuEDyUS
	z1o3ebc5hMUHOz7v5ok0ubyPMBbl1Qcs0ai+7ty2gwiWCIUdJBtkXtNF2L83+MfzmycJxD8OD5h
	Ug6UX1EgTngz7cdm7qXlE8L8c8R6NkO7+ngwXWDleyZumnq83gtW8W53wlme7tQDcc9WxL+ErMk
	Y/tXF9zjRkHLrw
X-Received: by 2002:a17:902:f690:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a8d81818c8mr134926125ad.50.1770136125857;
        Tue, 03 Feb 2026 08:28:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:8fb0:b75b:356:3f2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d57sm177851015ad.60.2026.02.03.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:28:45 -0800 (PST)
Date: Tue, 3 Feb 2026 09:28:42 -0700
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
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table
 detection
Message-ID: <aYIiOtUpTebzMZcd@p14s>
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>

On Thu, Jan 29, 2026 at 09:44:48AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
> 
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource
> table, rproc->table_ptr is NULL. The function still returns
> priv->rsc_table, and the remoteproc core interprets this as a valid loaded
> resource table.
> 
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
> 
> With this change, starting firmware without a resource table no longer
> triggers a crash.
> 
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Update patch subject and commit message using this one [1]
>   [1] https://lore.kernel.org/all/CANLsYkyrz+A1iEabGZ6rFybFo4=mM+TPVDRSckFB2YUS_7aKow@mail.gmail.com/
> - Link to v2: https://lore.kernel.org/r/20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com
> 
> Changes in v2:
> - Per Mathieu, Check rproc->table_ptr, update commit log
> - Include R-b from Frank
> - Link to v1: https://lore.kernel.org/r/20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d6790519360f446f063e09d018c5654953 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	/* No resource table in the firmware */
> +	if (!rproc->table_ptr)
> +		return NULL;
> +
>  	if (priv->rsc_table)
>  		return (struct resource_table *)priv->rsc_table;
>

Applied.

Thanks,
Mathieu
  
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
