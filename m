Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE62E2F0E
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Jul 2025 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992801; cv=none; b=KwDLfEXxQv62YXj4nMDEIixH8V8fk60bCCGKvpADH/1Bq/kuXev/ePBgTulDAjzYzdhwY7Sp3ghEKUSRARpr4FBHNsOZTr1YF7UKYXEF8eQepvM0joi1XLd17ZXuF6IjqvljPkcxTlfqvhmpSqqbbWJK6eOV6rZaYNn0DgyhOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992801; c=relaxed/simple;
	bh=XrRWcUPg0gmCaugL4AqdIxVcA/fgtzY2T3UQnwDgL/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMKxE2R9JggND2Fj8vq8pStaAipfibDW8gTZHBb9G55H8poWJwwSu4jKCqtuhB0YYKFDMy2vbbK49zGcRvYf3XPkf+TQmMPFgeCkY3ntd6s7H4SygxqIOwEJknU4cxU9zL8U+yqjma16uxMLU2XH/apeZstBUHQ7CyT821WjRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JfXMuSrx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JfXMuSrx"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2366e5e4dbaso522635ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Jul 2025 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992799; x=1752597599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=;
        b=JfXMuSrxtKdJzjetM3T0RjVe28BEdl27Mn+RHHMxIHHEBnDvavq/vcOuYUz3AttdBz
         iiOiW5UwBG1uVxBwIchXDErAf7Vv9/bhi1gBFxoI9V7o3cCOSgxlFYKFm+m6eOwsDd6w
         TuDF/CkeXMagHhHVRSc73kmS0JGEvlnT2kvB5+GBMFUCZ9oCjpMSBAsbme8wgNMK7xfn
         iUBirGjhZn1Ccc74K2U25UsmmXG+Xr5xHMC188E9omo7ySiFRtbongxC/d0frF9pZiSB
         2mXcGaYvwBhn4bJfqBClpwthzWwhzwnUlyIC2Zkx/r9AKlTVxlbN6ZkuTGzR9+ENMhLi
         pxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992799; x=1752597599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=;
        b=r6ht4iOZNWSGdcnfqZ2bPlx/sSJ28wO/89lK/qcxq0DMaMgaeOrlijqPXNVVoA3cV0
         7QPsoG+cgC5GSyuQV4nGcs44xcf6gg+qSO2jHSvluwDeTjvCDtZWYgKq5IAZdmz6RiA7
         lacRHFT6rpQYRTyxGnFCuX2EU5llzXY2VOBRigNhRezWCUGmsLQdOL55FalbOcVg4Va0
         aUz/hsh3Glx756vCWjtskBmvuFnvsaWrpBAXPZc9TXvm0hRtjPJaVSOhALGSFriS34Dj
         ixcNWX+biPRdZ7gFJNsIzqwadWx/4/aVR2TIz7p+k4+YlxIxi458pZ4hpNwatbMP4zto
         r6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUjx6BG0rc4N/82PL7sRIhCadE0ngA6E+3GNFQLxQCxrLY0/mGc8QCKc5MBcZXY+eJJAOzCONebxMQPA/lXaG83@vger.kernel.org
X-Gm-Message-State: AOJu0YyLX+CnYz5p58SprpGelDdj3RrywWzOwtLh0chq/caAqNDJeSPB
	4lWvTXvS5W0J15mvugTFMpFzu3keVtvOkIuGed5EtSaGbZFeN2O5eOUuiRWzA9cd0lw=
X-Gm-Gg: ASbGnct9ZmdU864dyO0qT5WN/s8zZmy+qFSMoE5CzgeK60L/6Vxs8PYwzC/0Qgwo4h2
	jwuhmg1JdELgWtaZOzYqzPI7oXFKKqYEm6q/58wrx8HHXox936dUl+QG9+bVKdnW8s/8A2VFSZX
	+f+25zEQrt4v+BuDHuCQcWwdB0e11GFAnAlZ0tiTdroCxSCueLjTxXSJJwn9jVi32+zxH+zVIAy
	6ZkiNF+UGlxJs1KKbURoJe6yvicYKNg7I4z7b6JHXMTNVQG+Q8Lj2B0I2AQ/9ajN2x3wE9mmGLd
	tWG12CY2rE6Zy8Vhdq11AM+J7ka54F+sUUrU9+DcpzRMQQ5BfFbOhLc+ztG9zah+ww==
X-Google-Smtp-Source: AGHT+IFj8nhxMS1GDmay5meyEAJ4wmQBHnfoxVzxfQ/DjVHpn1xffU3YRdB8/FjZpsJTq7vNTw85+g==
X-Received: by 2002:a17:902:f74e:b0:23d:d290:705 with SMTP id d9443c01a7336-23dd2900d0amr27843715ad.3.1751992798824;
        Tue, 08 Jul 2025 09:39:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c5cf:9364:ea5e:99f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e1c8sm123626055ad.42.2025.07.08.09.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:39:58 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:39:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aG1J2_nK-LkLQVRj@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>

On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -73,6 +73,10 @@
>  
>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
>  
> +/* Must align with System Manager Firmware */
> +#define IMX95_M7_CPUID			1
> +#define IMX95_M7_LMID			1

Any reason those aren't set in the device tree?

Thanks,
Mathieu

> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -126,6 +130,18 @@ struct imx_rproc {
>  	u32				flags;
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> @@ -372,6 +388,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.method		= IMX_RPROC_SMC,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
> +	.att		= imx_rproc_att_imx95_m7,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +	.method		= IMX_RPROC_SM,
> +	.cpuid		= IMX95_M7_CPUID,
> +	.lmid		= IMX95_M7_LMID,
> +};
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -1301,6 +1325,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
> +	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> 
> -- 
> 2.37.1
> 
