Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DE5274FFF
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Apr 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645285; cv=none; b=FLJvH/I7Ls67Utwy7HgLKOIikGjL1Oev3Ed0R+CloMn/pq3hKL74NXsYoyFPYDXbekzgvMPHFeXeespZP+cJYe4hIxBFLVNr5N379nJlm5o963KTQLyIFsHlL/61WOodj+AW0CgBgGl7fDWfWgn8OYzb8YajkHbW/O15bwSjX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645285; c=relaxed/simple;
	bh=pB129lonjxg4XBJVe106Pew5GKhSxXmd0b/2PNR8UBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3c6dVmq/fa12F4qWyYqW12NbVFtA1f+GpQiBtfg5MYmGYTSRgxv6EGGdwIn0za4T/kokJBdzNMBEAmylHYDIlxFhU2kd7FXg+C7OCNoUoRMfpx+0ceZnLXmFV7mnMYi0N5/Sv98TW7B/YyhV5fvf0X6UQbyczaV91yAUpvLzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwE6jZt2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwE6jZt2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22548a28d0cso66494855ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Apr 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744645282; x=1745250082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=elgj3ZOFdOekNxu9YHg784/p7U8yNMODKbzLcLEGcmw=;
        b=dwE6jZt2IUbhmah3cwE0TDOcHi0tYy9ZZt7JfTXHmow7XSvJVXLt41FSif5FoAujpK
         Ll8+ify3FblT5SMKnpgpBq7ZCR7O1a+uI+upCSzJ0KPRGqqbgirW5gq4ZoT0sci8PbvG
         dOmmFEibWWp8uTz+20etImR4idX7EqaSzybLVPxo6XDYAXBnw4HTvpooyB0nBKHioJAx
         f0bXSAW0xt0PtmLeatoFOEBC4WyS95JZpCUzUw28qBowYDJ5pYx+0gbwgpxJCq6vOAya
         kCqTtLto1Le8mRIQYV3cB3zB365IaRwlUS48AhIpd3l+wLc9u1+MTlo4QASr0MqNJC/U
         PL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645282; x=1745250082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elgj3ZOFdOekNxu9YHg784/p7U8yNMODKbzLcLEGcmw=;
        b=LUUn7qmOfmQh80/2tFDGhJEublThUIhPT6XAWW99eE3Ilc3oPw75ncA7yNYqurmuiB
         tTOtH0m+dh7MF52bnVGUcFb+WW+Hz8Ox/zzjRHgZligC7flzLR3g76yvZwnNUnFgsu5/
         oSeOw3VSouE69cPiOqhqggAySxG0VLO/iqCk29T5KnVe8LtFpEWWKSzufdO+DCsb0qPD
         vwn/WYT0QuuxnciWiUnDtvGWwimE9azdDYW/EO3VleD9dYaN/4tNynzHr2/NR8Mn3lU2
         G7tPGwQGyIv4CWIYoEO9OJFeWLOXjB/NJw6kaB11q4qcp1CR9efdLCVINX6obqzGTHu/
         2v8w==
X-Forwarded-Encrypted: i=1; AJvYcCUlaetKPXovxIBumg1NHOlUO4gvMmy1yrZ6jIdrjzYVBHqrloMeZJbqIZiNEyr/Th1Vp0mjuFZDpUS9MeYyO11N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3DgNbvzJrOKKuUzeoiN1NEHpUQ9cODlYUgZAPLHsdE6wDNflm
	YV3mgSgr4HG+bSUlhoURQFjLN2iwc4MH9/i9jUCYmTshxU6PEqM1Enz0E0piwzc=
X-Gm-Gg: ASbGncu4aMsSudH2cxnXxqeVcDBWy6v4qM8SZaV93rQUG3Vn+Ac0FXnQUqxcWphyYL5
	jQzWoc6ZN52gBVYYor8m+8M2boLnvpvfcP/Fl4dCbbB1KUUbsjd0J+Tap+XcTgoqsq61msjITzk
	APpzjMorclqZAOXeiOgSXs32kv3NTYHXaiLbyyE82qsyF25+HJyv1+lrEJNGj82n3ZTKDJKyT3m
	RXlrkhHoS4C411T5hRvodOTWRN0uZIWDo52H8QPhAM5VMO7N7jFXQRZPD0k4pVRMqnUZkWX742v
	XTzCHznaVPiJcaCTS698sD4uN8RpBtSGb8RiKGzusA==
X-Google-Smtp-Source: AGHT+IFmaJd8K2wTbkQ9KfdS3yzMTir1mRSVtiN6w//mvc5Njk/mc7f9WAGT+beU7YlMLRaLsVEzWw==
X-Received: by 2002:a17:902:e842:b0:223:5c33:56b4 with SMTP id d9443c01a7336-22bea4ad1abmr164559865ad.20.1744645282220;
        Mon, 14 Apr 2025 08:41:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc1f:6a:9d70:9f8b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbfacsm99984745ad.249.2025.04.14.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:41:21 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:41:19 -0600
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
Subject: Re: [PATCH v4] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z_0snwzpkPTJqjWX@p14s>
References: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>

On Thu, Apr 10, 2025 at 12:30:30AM +0300, Iuliana Prodan (OSS) wrote:
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
> Changes in v4:
> - Reviews from Mathieu Poirier:
>   - Adjusted len to include the size of struct fw_rsc_imx_dsp.
>   - Updated len validation checks.
> - Review from Frank Li:
>   - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
> - In probe(), set flags to WAIT_FW_READY to ensure the host waits
> for fw_ready when no vendor-specific resource is defined.
> - Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/
> 
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
>  drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..e4212e624a91 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define WAIT_FW_READY				BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/*
> + * This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host NOT to wait for a FW_READY response.
> + */
> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
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
> @@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
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
> @@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
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
> +
> +	if (!imx_dsp_rsc) {
> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> +		return RSC_IGNORED;
> +	}
> +
> +	/* Make sure resource isn't truncated */
> +	if (sizeof(struct fw_rsc_imx_dsp) > avail ||

We agree on that part.

> +	    sizeof(struct fw_rsc_imx_dsp) < imx_dsp_rsc->len) {

From the above, "sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len" would be a
valid condition when it clearly isn't.  I am still convinced the only
valid option is:

            sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)

I am happy to change my mind but would need more information.

Thanks,
Mathieu

> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> +		return RSC_IGNORED;
> +	}
> +
> +	/*
> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
> +	 * wait for fw_ready reply (default work flow)
> +	 */
> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> +		dev_dbg(dev, "Invalid resource table magic number.\n");
> +		return RSC_IGNORED;
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
> +		return RSC_IGNORED;
> +	}
> +
> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> +		priv->flags &= ~WAIT_FW_READY;
> +
> +	return RSC_HANDLED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
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
> @@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> @@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  	priv = rproc->priv;
>  	priv->rproc = rproc;
>  	priv->dsp_dcfg = dsp_dcfg;
> +	/* By default, host waits for fw_ready reply */
> +	priv->flags |= WAIT_FW_READY;
>  
>  	if (no_mailboxes)
>  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
> -- 
> 2.25.1
> 
