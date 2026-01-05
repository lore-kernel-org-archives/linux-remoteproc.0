Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8F2DC35C
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 21:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767647364; cv=none; b=MK85jVGn2myckCLtipYNKXladCemJIVbkG0KXZD7Q54nKqygcqag8GRSb2KuojzbrUw6ZZRTlwVvdfuJ8+xKo1u1wwWyQaAJ0ZZdlAAuVDOz56ja85C6hx8d/msKIFf3bZcpn5TGDTqSx1n9vFfBQs0LJbErx8nsIlLEWOPr8UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767647364; c=relaxed/simple;
	bh=jwLkcTvlIBQUkhCwf3AoG2rQ1UjqOwQNEsd9gNEIZw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUbUDNxe4m2LC9uPBq3ssD33MWKdTolgc0WfegEQ1+FaA/cp6dc/1aofBjb25vvCM3xHekCdg4Si1ujcU5UsPDWFAWvC6CMlaLNYic2pqv5zQVG3S2yClffQ+GdgPf4MVVqflhs/3MwQnNEy1TZ6I2z/0riUWxGn1XFx/eOQpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hY06D8iw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hY06D8iw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d52768ccso3875985ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767647362; x=1768252162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=;
        b=hY06D8iwTuEhL4HHUrDEZduvvvJAEAZFZbNxmC7RwOfKCxRPZOVuuZEuOnSk1JQceQ
         8GdjoO/G6MCcl8Kjz60hI0bxeLEp7eYPLYPI2pqS780GtzgIxogEj2CDlYDBUL77V+JS
         LGVOOBh5bl0f52r6DS+BYwn2OdKClFfQB+hLTJi672y+wKGWXKziVdV/FwncDOhwJj5o
         pK1HLTpAJWP0+qWrM4du7uZlcwf5NW7f0j8g/Cx3p834DnvI+yBzWMBafOd9RLad1umr
         lLI93KSFLw+aVJ20z2cYVQYQTKwaIgPSLdIx9SYTqmm4f2GVq7s93wz56q4bgPh2a+JG
         cn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767647362; x=1768252162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=;
        b=FK6fvV9/PvgMFKZ74w78X2h5fBOxG//8+4h8zG0wxvq3tRSaaAbHFkVDamusY4aCdK
         8kvjQD3WN+Gxx3NcXdAh5FGrq2FrPPMSEfvrZIl6Kc58jzo/L60OFX88tBnxWpKezxAf
         cdwX2VSYMB5KJd0Hgxlq5l8JCM6fdt13Z4wUIo7UYm1sDrCboDjl0CEqZtijC3nKvGmG
         yuAKF6p+A9cg33TdavS3HlZQcNYq2TNd1h0AnpbZNbHYgpDOPxa2vo6HcPBIuG6YwGDO
         7LlAapulvzGjT2EjWOC7eElcEjKdVHRjSLPgAKobhuGgUmx+yBBBp8thQO/6VBYSygmo
         PVow==
X-Forwarded-Encrypted: i=1; AJvYcCVDjw9dijMMxgEfl8Hg73eP8yogNK6tJC2m5roZIn9Hb/v7ct5x0xlMOeoEsNKLdMPzv4uF2TBAKZrXLaQ3Wj0p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2u2KfMrCd4+5eUiqjjMVCSIB8XtttseyKnYCA/GksUtyOOa4s
	N69IkTszWoKUW2NxzN/rFmP01JfX5XkpZdaSt3Qj0foGInU7UVxxtKAVRIoFYaiInog=
X-Gm-Gg: AY/fxX7eArXJxa89A5liFdB4lw0u6q+Td4P9FJdE374LI6dPRsahlL6Tu7yH6hLui3l
	WJn1A22oCHzEHTboIUao/tGILfgkS11PzTBHjcRGfeqIINJXpSAbUeRH3SLm+RZGqeWKLqfVJTD
	RFy/lh/3/FajHodsgaCGrYtmJgzlXZt3qTxFbXqDWYzDgd3EdB9H0QdK0u1fHZ6uJcP0YnB5+JE
	6MRsUmx5xzJ6nDFPQXKt/r15wOhGMAxfROQbQA/VfLz8xs6htLIK6mG8KVaKn/71PpiUT5FU+Wg
	Uw+GaHq6kFnvzosXglKB//NQBOYa05WxvpxNgudEFVVPBbV3ukMMDS87RmGR0m66nsWrPo3eHSW
	VM1CxuLNcP5VLIedKkRb0mT97Mzm6rKJxBI29BhHQ+EILeJDOQJ8sEslHb4lqvbMb8U468RQCuI
	kpY5q8NM8BYSP6pw==
X-Google-Smtp-Source: AGHT+IHXo6DMFCW0WpfI4RbwmQ0/+SMw7AIolM0jI+6hLOC2qL1pTqhGB59TCu4aAjBQnNj3aCaTnQ==
X-Received: by 2002:a17:903:2f46:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a3e2d7896dmr8294395ad.4.1767647361918;
        Mon, 05 Jan 2026 13:09:21 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3ba03f9sm1721825ad.0.2026.01.05.13.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:09:21 -0800 (PST)
Date: Mon, 5 Jan 2026 14:09:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, daniel.baluta@nxp.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: only reset carveout memory
 at RPROC_OFFLINE state
Message-ID: <aVwof_w31EMxi5st@p14s>
References: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218071750.2692132-1-shengjiu.wang@nxp.com>

On Thu, Dec 18, 2025 at 03:17:50PM +0800, Shengjiu Wang wrote:
> Do not reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.
> 
> Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> changes in v2:
> - refine commit message.
>

Applied.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index d03017d6b214..ac8aa71aa56c 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	 * Clear buffers after pm rumtime for internal ocram is not
>  	 * accessible if power and clock are not enabled.
>  	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> +	if (rproc->state == RPROC_OFFLINE) {
> +		list_for_each_entry(carveout, &rproc->carveouts, node) {
> +			if (carveout->va)
> +				memset(carveout->va, 0, carveout->len);
> +		}
>  	}
>  
>  	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> -- 
> 2.34.1
> 
