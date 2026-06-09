Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641C94014A5
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023211; cv=none; b=tSO3VbckFZew6wV7gdRY6UyiSwtpSgjMuS3n2z8209TqKMFYSJOtsRYhlLm7WpVLx50YIYUyhBTMZ8RgZlLzUZKaVfgrpWj4Gx7DPQFl8iSQjCxIVUvt2KcwxJNEiq04K7L0ozUSfL5gEPrRbT6yK5H2rOEr71tWP7PJ/Jk9bGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023211; c=relaxed/simple;
	bh=ZUYptASb2XkWgHKrB/ApK11KzwBJaSgOZ/Ih46iDuLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swm0RANIWucFlwmM7PJ0CaklT+ovpo7Fhzg3+ekv8wUHds7lTWl/PGiSs17dV0HaVjfp+AdU6I3iMJmoRhjdd1bLBdzXJHfqYgWjIQ0BgyzFNco9ac+q9QB6sTyxLix7flysGNFxMKiq/9p7BHLgJqR3/BvblzwG1PflJkzftXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODtA4XpE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODtA4XpE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0b944f6edso59566875ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781023210; x=1781628010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5HJL58J1eZJZ2b60pokq8zoselIZjiEHemGuH3SCnY=;
        b=ODtA4XpE9H5MnXecNN//PjtWEvoWWDAprtM21SP1flraUR07Lpyebfq6IAdWzfbqmZ
         dw7pqCGvsuKxIwDQQd4T4SunSXenwt44zuU624qZeS9y+Dt6UXhk6hYabPmPsxKUODlJ
         ZRpbiXvkG7Vu5JsYYB1fStUYb/D/Lp5rbwviZynBEE6eFoyNc/K/TRFVfHMMfprDTumV
         lNXH+hrqTBTzPFpUukCY7/RI9D0l02X3ZpRMCJwX4zOvfX/FdGcAiyB6O+0dzZj5/JJa
         uf1rA9G2DZL+oPCWUHhvUwWRVUJlTWtp1euUCevctAw9at7ijU8y0PBZOTqTN7B/nQab
         bWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023210; x=1781628010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5HJL58J1eZJZ2b60pokq8zoselIZjiEHemGuH3SCnY=;
        b=FoiV0teJZ8FplO6v0nqTAROtraWkrd0KIpIifIbeMczVJS6ZV2e84gN4EHWTaDi871
         ABx7jcYnPxhmpihxhinn5ykmUXqtaLBdPMF3PPWrLkTK53XoN5wzB9X8B/kjt2P8keB5
         rEqvQ+dtbEr/1DG5GPy6JbqUZmRd4pGaz9Gjco0Xx+gQ08VzPFhZRwQbsYclnG1IS8+n
         BbM0EGu8fdrRyYUoMWtdzL2KjZAxWDjqLZji6cA8DjZWb8r0VvxHAvZWSoKszs2s0yrp
         Bu1iDFqiXSLGlsVXfWifK++7WevX+albeEeLO/unVkA1Nmqdf7Y++pNccsn2Duvpa8hR
         2QRA==
X-Forwarded-Encrypted: i=1; AFNElJ9IaWMisTJGcBLuVRBivUeSo8j2PbmPEDXOZJqYrkWxfA50u/HrOrZ+u8O6TptxL0H7nZ3KsWWPgvUPw98R8bWC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/L07hGxFGKLj8P08hAYKtjxUYE6KZpDsNXZy4+dIPHRv1OgQ0
	Hbzo6nIYA4JvcIFFddZaWPbmCjpFs157ndSmlJnCJGXLnuhs5QHBKHYP0C+WkpZIeG0=
X-Gm-Gg: Acq92OGXW4qA1JP4rASxzX9XUXqGJNrwsvqTEZ76WQ4WYBshvpOwCmabC0ZC9/ArJcn
	C8EENxWxn627JQY+oGTfOPWct3r/UpzAhd0huwSfSPCk1j3BH8O74IGlB5SuACFSirAHLJc1HJv
	Nbc+wdaNBBYMitPUc0/zReYnYwxj7c/0HnoSC9Sbn922UKnfoFUBhX0UaYZQajmrmxaau6jbbOx
	N5RT6YSytnlr1kz5Bbvog8u6JcbXsHkXhsPzTYiQoHBMqCb6UnmFWw90AN4m5+e7FVUxTgq+u6w
	4rUYACyjc3rcoaCCGSAEozwQ2IebTFDciaTppn4Y/olrLMelqnLnH4W8aVLKGfmGq9//HUWsZZY
	ytcnr4M/INEm40wGIclQH86CsjaeuRpUE1pmiZQnYCVW6DKeoUcpP0POUC4Tywe5xjE4sDQ2X/8
	h9fn3It7+ISwvODsnJd12SM4beIGPESxBqamU9
X-Received: by 2002:a17:903:2450:b0:2c0:3400:5c42 with SMTP id d9443c01a7336-2c1e820bffemr225857055ad.26.1781023209568;
        Tue, 09 Jun 2026 09:40:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7f00:843c:9d87:e9dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0a2sm225550575ad.46.2026.06.09.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:40:08 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:40:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <aihB5rVLsVqzg6cb@p14s>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>

On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The names of the carveout regions are derived using the names of the
> reserved memory devicetree nodes, which are referenced using the
> "memory-region" property. This adds a restriction on the names of said
> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> specification's recommendation, which states that the devicetree node
> names should be generic.

I don't see what is so restrictive in using the node name of the reserved-memory
regions.  Function of_reserved_mem_region_to_resource() is already doing all the
parsing, packaging everything in a neat and easy to use "struct resource".  What
will you gain with this new "memory-region-names" that can't be done with the
current solution?

> 
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the carveout names can use the values
> passed via "memory-region-names", while keeping the devicetree node
> names of the reserved memory regions generic.
> 
> There are no restrictions imposed on the values of the strings passed via
> the new property since the software allows any name to be used, with some
> names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> special meaning.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..8e3e6676a95e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,10 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8
> -- 
> 2.43.0
> 
