Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56825B671
	for <linux-remoteproc@vger.kernel.org>; Thu,  6 Mar 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283425; cv=none; b=r+HI3DZsPYXnwOaBN0Ta1SkyXcif64M2S1cgJO7D6OLg39+UyzTNihzPpp5wIpHKFd9Jt/pVq6NqjHgs4dR4kOPxyghvBzvyg0NaCkuDPys5DfbtDgD1edkQiUjzpbjbADwmhGxycJC1CD3GChUmTD/SsF3Q1bo1PC1CxyXGlMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283425; c=relaxed/simple;
	bh=OYwPTl37kpqpb1obSyEsyaLgdYEvB2tSrap1fnb6oEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY8wcupz+pU6jMvVw/es0vcnrZ7Cjgr/yFJq3TJZ3DfGVuLecMI5/CiYMq6EwpG9uQf8v6pqQ1lfS3Wjl/9a8PCeJh/3zg/VU1+pOUuMUCEwpL4w9XRZDbu/oAfr7haWsZ4KZiU0elFP9I8PxPG7UUVG7peRPuBJdIu5a9y1DKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCZw7zEr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCZw7zEr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso1804358a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Mar 2025 09:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741283422; x=1741888222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBQoogV3j30g7FrMy9Z3NT7u/NY7leEMjZRTS18vRj8=;
        b=rCZw7zEr7yLvJyd6sTt8XpfyXMROM7xso1Uh94y/jlfaQcnGSRatD4lg6uLKHe+2zK
         YNmtSDzIU+pJDs/9RMRAla7TYfY8SVYt16tlypexEK1dyRksLYcPaxl5tqmucVtXe/5+
         Cq8sCN4llmcPmOs73A/2kW6iGM5pQvygFJQKHcb+Wa/j5uTsXEhqScDJYXRhTgy0lxFo
         hR0tz+viIJRTNHV/UMZ99JmFFFUTh+TrDqODnqFZhZV+25xoZkyQPkMp+7jOCKCguOdz
         iu1D+VsqSVn2kw38uAxbGRs6IIo0znNELEuhcZ3Nd3JhyCxomykj97tOb3VHH/3lVRdb
         xDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283422; x=1741888222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBQoogV3j30g7FrMy9Z3NT7u/NY7leEMjZRTS18vRj8=;
        b=OaNSIh2sGxeuT/lUh7B2sM3v4zmk6nITZZhJReqjKKdrvnYUFTeIR9Ly4flerdX3Tz
         2EH1Yv6OrsjV9FZApqDga5Vdqh0wIN2U3gSnaAG380o24zo3qgHGhvrPaAllgiGAYtW7
         vRRqSf6psbnyx+w6WU4ETfsspRCW++A0Ty13P0V0K909grNZG4jHeFih7sLR33T4szRo
         qvCollfpTe2tBKx2U43wKNyrlx/5KVR46gcmCtXJrxu6Wb5yFdLnEug9TIKSCbVPPeKw
         OzSxWxMT6Tk2Gxjl5NjgMVskicPuzlK3NfLRXLYArcClk8pHgYeZtx1uXTWOQIQgwCI5
         BwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWCzl+RRgCHGjgDkD1F3nSmOze9M7FYIqipVTbNskUhmOCBcym9Sja2LMXvSYmEc9UyWFAlFYEjb2N2XYKrQdl@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBoHIM74wosjzlz9p0gEXtQgUtWJN2aOKQOrHj70xJvyNdTd9
	XjfIgX205VU5HwqSUpdGylCct3LKJu01bsOjjXfV2WmRci/gw14mGNnb6FyQtQo=
X-Gm-Gg: ASbGnctu9y5Km6ZHnm4TWF0ed6a0dfplAyAyU264vQCG0e4STjvs/RH4fSU9zZxH8h9
	hQuX05/RpLkoq1mn43TeN9V1J8N9ZV3dGFWdNkTo5lCWiVi8h5tkqQX88J6SmBCu7UXDXSo+7i3
	N+b8V63x2FHOSc6kqGCqJgUXDFvqNAGMyrkCLFwNRHg73gzwQSXQmcrQl7+ic4fMUg2ylLW6sbE
	nhkWLgvXONFIFm6j0bI6R+Eis/fyDdDvk3a3iZ5Ylq8qWkOzS+07AHFkZRtScunEk6zqN8h1wkl
	HQ+UwYQLt57CBjcxqbf7SLaoMN5nYd46XEFnr53neNKXVCE=
X-Google-Smtp-Source: AGHT+IGEuTXsYktLG7Gbe5A2wqYq14IVrHxmlthLo8VbHdBbTToc9qLW5FvoQCp4OUC59CVSGAIxyg==
X-Received: by 2002:a17:90b:1d4f:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-2ff6175a47dmr6758129a91.7.1741283422491;
        Thu, 06 Mar 2025 09:50:22 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:d45:b21a:9b36:7bcc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109fda8esm15294235ad.101.2025.03.06.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:50:21 -0800 (PST)
Date: Thu, 6 Mar 2025 10:50:18 -0700
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
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: conditionally wait for
 FW_READY
Message-ID: <Z8ngWhbkO2770qMq@p14s>
References: <20250305123923.514386-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305123923.514386-1-iuliana.prodan@oss.nxp.com>

Good morning,

On Wed, Mar 05, 2025 at 02:39:23PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Some DSP firmware requires a FW_READY signal before proceeding,
> while others do not.
> Introduce imx_dsp_rproc_wait_fw_ready() to check the resource table
> and determine if waiting is needed.
> 
> Use the WAIT_FW_READY flag (bit 1) to distinguish cases where
> waiting is required, as bit 0 is reserved for VIRTIO_RPMSG_F_NS
> in OpenAMP and mentioned in rpmsg documentation (not used in Linux,
> so far).

VIRTIO_RPMSG_F_NS is used in [1].

[1]. https://elixir.bootlin.com/linux/v6.14-rc5/source/drivers/rpmsg/virtio_rpmsg_bus.c#L1051

> This flag is set by the remote processor in the dfeatures member of
> struct fw_rsc_vdev, indicating supported virtio device features.
> 
> Update imx_dsp_rproc_start() to handle this condition accordingly.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 84 +++++++++++++++++++++++++++---
>  1 file changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..8eefaee28061 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright 2021 NXP */
> +/* Copyright 2021, 2025 NXP */
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> @@ -38,6 +38,15 @@ MODULE_PARM_DESC(no_mailboxes,
>  #define REMOTE_IS_READY				BIT(0)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/*
> + * This flag is set by the remote processor in the dfeatures member of
> + * struct fw_rsc_vdev, indicating supported virtio device features
> + *
> + * Use bit 1 since bit 0 is used for VIRTIO_RPMSG_F_NS
> + * in OpenAMP and mentioned in kernel's rpmsg documentation
> + */
> +#define WAIT_FW_READY				BIT(1)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -300,13 +309,74 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	return -ETIMEDOUT;
>  }
>  
> +/*
> + * Determines whether we should wait for a FW_READY reply
> + * from the remote processor.
> + *
> + * This function inspects the resource table associated with the remote
> + * processor to check if the firmware has indicated that waiting
> + * for a FW_READY signal is necessary.
> + * By default, wait for FW_READY unless an RSC_VDEV explicitly
> + * indicates otherwise.
> + *
> + * Return:
> + *   - true: If we should wait for FW READY
> + *   - false: If FW_READY wait is not required
> + */
> +static bool imx_dsp_rproc_wait_fw_ready(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	struct fw_rsc_hdr *hdr;
> +	struct fw_rsc_vdev *rsc;
> +	int i, offset, avail;
> +
> +	/*
> +	 * If there is no resource table, wait for FW_READY
> +	 * unless no_mailboxes module param is used
> +	 */
> +	if (!rproc->table_ptr)
> +		return true;
> +
> +	/* Iterate over each resource entry in the resource table */
> +	for (i = 0; i < rproc->table_ptr->num; i++) {
> +		offset = rproc->table_ptr->offset[i];
> +		hdr = (void *)rproc->table_ptr + offset;
> +		avail = rproc->table_sz - offset - sizeof(*hdr);
> +
> +		/* Ensure the resource table is not truncated */
> +		if (avail < 0) {
> +			dev_err(dev, "Resource table is truncated\n");
> +			return true;
> +		}
> +
> +		/* Check if the resource type is a virtio device */
> +		if (hdr->type == RSC_VDEV) {
> +			rsc = (struct fw_rsc_vdev *)((void *)hdr + sizeof(*hdr));
> +
> +			/* vdev does not require waiting for FW_READY */
> +			return !!(rsc->dfeatures & WAIT_FW_READY);

From a virtIO perspective where one virtIO device pertains to one virtIO driver,
your approach is valid.  From a remoteproc perspecrtive though, we have one
virtIO driver [2] used by several implementation (NXP, ST, TI, ...).  So far,
information conveyed by rsc->dfeatures was applicable to all implementation and
things need to remain that way.  Otherwise, it is a matter of time before custom
and global features start clashing.

Using rsc->dfeatures in the way you do above means the resource table in the FW
image needs to be mofidied.  As such, you could take advantage of the vendor
specific resource table entry already supported by the remoteproc framework [3].
From there you provide a resource handler specific to the iMX DSP driver and
things just work.  Moreover, you wouldn't have to parse the whole resource table
every time imx_dsp_rproc_start() is called.

Hopefully this works for you.

Thanks,
Mathieu

[2]. https://elixir.bootlin.com/linux/v6.14-rc5/source/drivers/rpmsg/virtio_rpmsg_bus.c#L1054
[3]. https://elixir.bootlin.com/linux/v6.14-rc5/source/drivers/remoteproc/remoteproc_core.c#L1044

> +		}
> +	}
> +
> +	/*
> +	 * By default, wait for the FW_READY
> +	 * unless a vdev entry disables it
> +	 */
> +	return true;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> - * There is a handshake for start procedure: when DSP starts, it
> - * will send a doorbell message to this driver, then the
> - * REMOTE_IS_READY flags is set, then driver will kick

> - * a message to DSP.
> + * The start procedure involves a handshake: when the DSP starts, it
> + * sends a doorbell message to this driver, which sets the
> + * REMOTE_IS_READY flag. The driver then sends a message to the DSP.
> + *
> + * Before proceeding, the driver checks if it needs to wait for a
> + * firmware ready reply using imx_dsp_rproc_wait_fw_ready().
> + * If waiting is required, it calls imx_dsp_rproc_ready() to complete
> + * the initialization.
> + * If waiting is not required, the start function returns.
>   */
>  static int imx_dsp_rproc_start(struct rproc *rproc)
>  {
> @@ -335,8 +405,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (imx_dsp_rproc_wait_fw_ready(rproc))
> +		return imx_dsp_rproc_ready(rproc);
>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 
