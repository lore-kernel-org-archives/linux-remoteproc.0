Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF0206F3A
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Apr 2025 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042661; cv=none; b=FpETi2iM8Kk23sO+aickiArTBdUjNF5YO9OVvL+GK4+XkUVPZC3+J3VcBwlwd2czBYRDGwDlE86t6aMY+nI8JP7+EKTpHsGxVZHkR2GXpnpuJS/JLvP84ZFyBVdRP8pkXST57YnwHfQ7Ofy6sOFjMAu6ZrKUgnEG4P03x4usGVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042661; c=relaxed/simple;
	bh=kAMMRMeA4ufN79gfLBEkYmpw8A7AKyHNPmaD9D45Zcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1LT6oIdl5+amlPbFoTRPETN0480vYV6S6PqI2nkytLHl9pAj+9Tjcu+HJvRW2yLp2qlHibmRmPAE/bwrJkx4krlaoHlI+o5F8TdcQGAPcNN3TYVy00l7StQmONkZ3BgeXrwzEMrFbxdvi+6s3NCjSl5izCk8IVlOGAOP278llk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5r8hLqw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5r8hLqw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227b650504fso40565725ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Apr 2025 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744042659; x=1744647459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YZX8FTm7gnnATlvkEU+CvdZ8Zmrv4/GwdsExPDms+c=;
        b=L5r8hLqw9pijj1su9Af6nfqoFLFBjNvxhrUoOLsz8Kcg6T0nm5bvnatyrRbJQRqYdK
         koGAv2sBcBMjfZv2KW+ByQRDd1zym9R6j3nXUHcJu4L2RwejIj3LDGVhuphcjgIqXZgP
         9Zd9TjzBn/OAXMbDmiTJf1or61cx+4fXZqenv75b6pvNLjCkmyeK1EqmxrBVDIHpOSQk
         lFlFYyMZ9Bz6x1xHNjtImF2qpkqe5Zace3hMXY9192YsQrirAuFHm/ZqDhuOcDgrDoBH
         sFOWsvkV0iVVNvOwT88MHGavfN2vvTMKcJH4bW5tVTvBoQ97vUW/mG0+4lRX9Ul9lZbD
         Yg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042659; x=1744647459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YZX8FTm7gnnATlvkEU+CvdZ8Zmrv4/GwdsExPDms+c=;
        b=KfTI3IEIGSmorDHGPKmVO0WFO5YhIkMmPE1W+W8HCpqmZeVu4NzEV/A1TlOvfHXulA
         9U3VWr9U+RUXMuF1WCy3fAHrMZY/6mGVrEg/9FnM/MEqDF1f/syPPuV9omGpTKwqw8yr
         cb2VJP4IDGHtEqhg1JwNLjcEgG8RCr6Hkwfs2vmFyFg2NJjHpyDHCOew2kKOYi6uTbPL
         rozYs3biXClOgz1oYKixsS9CA7VisAr1HjqmIaMNBur18smEQPMI8PftLU+aqq057hO4
         j+iB3kBNqDoOZNGIdcomYFtX/4K04RgpIyID5k2LWjRyqJjg9C6qMsCaD+lb0ThQ/0az
         mv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtODn/aRy04pchuKw0NOQ8ZofZ1v6O5yvGn/DAd7KN+KRgZIsjzlb2X+aCgfwwXMl/XO8745tIg5UMfZtsv8Mz@vger.kernel.org
X-Gm-Message-State: AOJu0YyQabwjR0lU75iMO3Il/jtN9p/EDpN1T0IvKqGttavS1EjQEX6D
	Inz/XXvfu769yu1JVV26YFVIutjp1RtfypZHQiK9HJ9BzUPqP5jdnnW9efewMw4=
X-Gm-Gg: ASbGnctNEd3B+aZzM3GPnixEm+5IZgkPEadmGfsYnoG+X7huTRWkaF2DOzQGxODIOhP
	Ry5GtONnianWOUiGhIrgXj4HBOs49Q5f1CfKJNNzZiKZXwM3J7OauOfj2HG0Z4SzsKRU5Kw8n31
	HugtzFk9+HwWlEyG+FtlT4e0s+i7tktVsEc/Md6zEKMznihoMyrG/gyVJrjDDUKNkBVr1cYCm9L
	zSSSirxLnnEBkEpHxMTcdoxmf0vcbGUPQ/YU56aJvqYsKBJkijPV/WbirYg8wnBjWmc0tZTfYJO
	L8PuRFt3yoq2FDv2h4h0O1TvBJPbbqKWugDfMAXubq1w7QA=
X-Google-Smtp-Source: AGHT+IGV6fnvs4sscSKdOoEFY19/hs9fXnSrUMMOtavJUI+vrIykhaiZctAqp+tkYlgjXDshCo3m3A==
X-Received: by 2002:a17:902:d501:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22a8a06b403mr178027265ad.23.1744042659200;
        Mon, 07 Apr 2025 09:17:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8a1d:e713:b97:3a58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7be3sm8995261b3a.175.2025.04.07.09.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:17:38 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:17:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z_P6n5wQfGuSmV2B@p14s>
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>

Good morning,

On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.
> 
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.
> 
> Update imx_dsp_rproc_start() to handle this condition accordingly.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes in v3:
> - Reviews from Mathieu Poirier:
>   - Added version and magic number to vendor-specific resource table entry.
>   - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
>     - By default, wait for `fw_ready`, unless specified otherwise.
> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
> 
> Changes in v2:
> - Reviews from Mathieu Poirier:
>   - Use vendor-specific resource table entry.
>   - Implement resource handler specific to the i.MX DSP.
> - Revise commit message to include recent updates.
> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..80d4470cc731 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define WAIT_FW_READY				BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/* This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host NOT to wait for a FW_READY response.
> + */
> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
>  
>  #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
>  
> +#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
> +						 (uint32_t)'x' << 16 |	\
> +						 (uint32_t)'p' << 8 |	\
> +						 (uint32_t)'s')
>  /*
>   * enum - Predefined Mailbox Messages
>   *
> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
>  	int (*reset)(struct imx_dsp_rproc *priv);
>  };
>  
> +/**
> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> + *
> + * @len: length of the resource entry
> + * @magic_num: 32-bit magic number
> + * @version: version of data structure
> + * @features: feature flags supported by the i.MX DSP firmware
> + *
> + * This represents a DSP-specific resource in the firmware's
> + * resource table, providing information on supported features.
> + */
> +struct fw_rsc_imx_dsp {
> +	uint32_t len;
> +	uint32_t magic_num;
> +	uint32_t version;
> +	uint32_t features;
> +} __packed;
> +
>  static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	return -ETIMEDOUT;
>  }
>  
> +/**
> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> + * @rproc: remote processor instance
> + * @rsc_type: resource type identifier
> + * @rsc: pointer to the resource entry
> + * @offset: offset of the resource entry
> + * @avail: available space in the resource table
> + *
> + * Parse the DSP-specific resource entry and update flags accordingly.
> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> + * to signal readiness before proceeding with execution.
> + *
> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> + */
> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> +				    void *rsc, int offset, int avail)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> +	struct device *dev = rproc->dev.parent;
> +	size_t expected_size;
> +
> +	if (!imx_dsp_rsc) {
> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> +		goto ignored;
> +	}
> +
> +	/* Make sure resource isn't truncated */
> +	expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);

Something seems odd with this check... I don't see how adding
imx_dsp_rsc->len with 4 will give us any indication of the expected size.  To me
two checks are required here:

1) if (sizeof(*rsc) > avail)

2) if (sizeof(*rsc) != imx_dsp_rsc->len)

Otherwise I'm good with this new revision.

Thanks,
Mathieu

> +	if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> +		goto ignored;
> +	}
> +
> +	/*
> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
> +	 * wait for fw_ready reply (default work flow)
> +	 */
> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> +		dev_dbg(dev, "Invalid resource table magic number.\n");
> +		goto ignored;
> +	}
> +
> +	/*
> +	 * For now, in struct fw_rsc_imx_dsp, version 0,
> +	 * only FEATURE_DONT_WAIT_FW_READY is valid.
> +	 *
> +	 * When adding new features, please upgrade version.
> +	 */
> +	if (imx_dsp_rsc->version > 0) {
> +		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
> +			 imx_dsp_rsc->version);
> +		goto ignored;
> +	}
> +
> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> +		priv->flags &= ~WAIT_FW_READY;
> +	else
> +		priv->flags |= WAIT_FW_READY;
> +
> +	return RSC_HANDLED;
> +
> +ignored:
> +	priv->flags |= WAIT_FW_READY;
> +	return RSC_IGNORED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (priv->flags & WAIT_FW_READY)
> +		return imx_dsp_rproc_ready(rproc);
>  
>  	return ret;
>  }
> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -- 
> 2.25.1
> 
