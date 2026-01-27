Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9635EDD4
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534000; cv=none; b=VzGe65OoJpdalWbfuardYaAqYif7flZ7pI/uAc669w7oti+/SqR6lm0Di0bElbr8xjSFXxM51CTvJkuq/YOu0BfC10BZzNK85VukqBLzQKnmzNZFDEPLsQWp7fAe3u9QbI65t9qcr3q2Ldqm9HMt43pQ5GwXiXcfVBTPU6h/Wqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534000; c=relaxed/simple;
	bh=2qV6LKnVcRj8sQxBTM+zUKdNbhUjcG9xl8L/49JJEok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYRKuksKqNgXdG7YzrGKnAPY13rf9RC2CtECxHP15V1J6yCepLvEQM3TKcFBvYKOF4ysJQy4uInkegufbkMQLaU+fFPkEh2jMMdsO8yx3XQg25p+wFbZDQbFIZMy3DcAilN0p3thSNYvquFgOrYwDZVMeQsdr6QtVnrH9NZc8ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mj4p6cPK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mj4p6cPK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0c20ee83dso54939405ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 09:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769533998; x=1770138798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=agfJUc5KsSJBcH21DdIZrBPenVYNGLTuQIkxtglloIs=;
        b=mj4p6cPKMMELElVySSJnHYSakPYj/+G+kdgqfRUophYM3v3MgZVYpIpBk+WHMVAsr9
         2niqk1jdIiwg85Rdvgzb7J/nFUe8plA5/Pa+0jZKNv0xuFdSe2FbKrVZAMUOKHcfr26t
         IKVSTk5TFdhZfraTefqDG2ATeWlZDfKzLssr3EZ4nqMrS/Uu7VLeyfWWingMRFZLk1t2
         daWehNAijEZlN+KrroqrV7ynn1bQ6wxSatden0c/6MQQvczWIAHEmOsxKTmC/+SSaTui
         eBYp7Wvii+LGAiiqrixUbr/ds4LI0PgxD1Gcuh6eZ79rlcN5cIdBXWqE23l5vvOVoo2o
         OVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533998; x=1770138798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agfJUc5KsSJBcH21DdIZrBPenVYNGLTuQIkxtglloIs=;
        b=buYwhRfQzQH71wbh+u2PaDFhNn+r7QR5wOLYnp5SIiOUyK6Fqi5iKl7EfWTjCy85Iq
         BuCI0BEd/tal116MBsGjkTaBnpeSsUlu/8GU2GcmNgBLkDrehREKK33gRSc+AwLpbP4M
         MmROswOFnIUle8I6mn/DA7OtMXDvtJ8mGDDi/5avvBQw4Rk1njbg1yXEQy+1O6abu2cs
         OJ/GTrB09SeRp1N0xtQL7WLYFSRbjB/m7wMmFCTVIXGi3chKdxUn1ZTI6kQJWkNxZy+9
         jbYsJHLWJfcJStnB6xK5w8lVzuoswChNp6i7/h3FKhTdx2Fmca9wCB0fPLmlu667ATdO
         zO/w==
X-Forwarded-Encrypted: i=1; AJvYcCV7abGbMBjb9KuHUdef5FJeNKKjZwnnj7JAbf0K50hBjg8ll2tiD6uFVrec4bAVS0QCA+UXxI71Er7G5h6Bqj5m@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqhCDjE/bzMGnw9aW2oZ6/YhT3Hl+TQsJ5lCCImRdifowTxG0
	TbAeNnbBKzUDU5AOILfyReu6rUsYClwhQCZncrM+H0s4dHbKUYyNF5zlj2k4jpsHcypRVvKEOwm
	dXkA5Gxc=
X-Gm-Gg: AZuq6aKe9dxT1Isg9OMnN8SIMeQxSy9rVR7QQpMYAun+wJoc0CApjEpRx2usRj45PI2
	XCpT3l6yXUDCmDWslIKeJvccDxjanFijmvzstiG2A6/0CdK5IMXosl8wc8QrzUdzejHUFlH31MT
	LprxqE2IfUaPjp52ENC3p5uD5PZhq8hsVQk4jOR+hxa2DZ0NPoUmWCtgtiYQrT9MJoD2PFlK6VP
	fbCYajM7yLvETrj4pFXivHtJtot0tOvj6d/EepHsWWxCEwzcVtU+g3lNVWxHPLUK+QlhmxxKsEo
	EiqaYK4ZLsChY2QiJx1Ird0ODCqFmSuI+AkpQ62kQuHf4ZtTSOCrChva1i0mEZXEwLS3gd5WpjC
	jpOK29Jkwlw7tp7kte/WGV3RGeAX5tmYT7mdeLuAe1gUbI1TkcEtjvLzXWDxgx5m96jwo6Fe6Ql
	zWt0p0vksUihK/mA==
X-Received: by 2002:a17:903:4b07:b0:2a0:c1fc:3de5 with SMTP id d9443c01a7336-2a870de57c6mr17694475ad.51.1769533998175;
        Tue, 27 Jan 2026 09:13:18 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:89d2:9516:bf0b:fe8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa66asm121765205ad.9.2026.01.27.09.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:13:17 -0800 (PST)
Date: Tue, 27 Jan 2026 10:13:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RFC PATCH] remoteproc: core: support fixed device index from DT
 aliases
Message-ID: <aXjyKzINfpwkv2Fi@p14s>
References: <20260127130555.3211411-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127130555.3211411-1-arnaud.pouliquen@foss.st.com>

Good morning,

On Tue, Jan 27, 2026 at 02:05:55PM +0100, Arnaud Pouliquen wrote:
> On systems with multiple remote processors, the remoteproc device
> enumeration is not stable as it depends on the probe ordering.
> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
> always refer to the same remote processor instance, which complicates
> userspace applications.
> 
> Inspired by the SPI implementation, this commit allows board-specific
> numbering to be defined in device tree while still supporting dynamically
> registered remote processors.
> 
> For instance, on STM32MP25 Soc this can be used by defining:
> 
>     aliases {
>         remoteproc0 = &m33_rproc;
>         remoteproc1 = &m0_rproc;
>     };
> 
> When a "remoteproc<x>" DT alias is present, use it to assign a fixed
> "/sys/class/remoteproc/remoteproc<x>" entry.
> If no remoteproc alias is defined, keep the legacy index allocation.
> If only some remoteproc instances have an alias, allocate dynamic
> index starting after the highest alias index declared.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Notes:
> 
> - This patch is submitted as an RFC in this first version.
>   The main reason is that support for the Cortex-M33 and Cortex-M0 on
>   the STM32MP25 SoC is not yet upstream. The primary objective is to
>   trigger discussion on the concept; if there is agreement, I can drop
>   the RFC tag in a next version.

I think this is a good idea.

> 
> - The keystone_remoteproc driver also uses DT aliases. As it uses the
>   "rproc" alias only to construct the firmware name, it should remain
>   compatible with this change.

But we won't have "rproc" and "remoteproc" as aliases - it will have to be the
former since TI is already using it.  I also suggest doing a #define in
include/linux/remoteproc.h.  There is a possibility for backward compatibility
issues but we'll have to let the feature in next long enough to find out.

> ---
>  drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..8da6c410870a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2461,6 +2461,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  			  const char *firmware, int len)
>  {
>  	struct rproc *rproc;
> +	int index = -ENODEV;
> +	int first_dynamic;
>  
>  	if (!dev || !name || !ops)
>  		return NULL;
> @@ -2481,8 +2483,27 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.driver_data = rproc;
>  	idr_init(&rproc->notifyids);
>  
> -	/* Assign a unique device index and name */
> -	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);

        rproc->index = rproc_get_index(dev);

> +	/*
> +	 * Assign a unique device index and name
> +	 * Look for a static index coming from the "remoteproc" DT alias
> +	 * (e.g. "remoteproc0"). If none is found, start allocating
> +	 * dynamic IDs after the highest alias in use.
> +	 */
> +	if (dev->of_node)
> +		index = of_alias_get_id(dev->of_node, "remoteproc");
> +	if (index < 0) {
> +		first_dynamic = of_alias_get_highest_id("remoteproc");
> +		if (first_dynamic < 0)
> +			first_dynamic = 0;
> +		else
> +			first_dynamic++;
> +		rproc->index = ida_alloc_range(&rproc_dev_index, first_dynamic,
> +					       ~0, GFP_KERNEL);
> +	} else {
> +		rproc->index = ida_alloc_range(&rproc_dev_index, index,
> +					       index, GFP_KERNEL);
> +	}
> +

I find the above hard to read and even harder to maintain.  I suggest spinning
off a new function as depicted here:


>>>>>>>>>>>>>>>
/*
 * Assign a unique device index and name
 * Look for a static index coming from the "rproc" DT alias
 * (e.g. "rproc0"). If none is found, start allocating
 * dynamic IDs after the highest alias in use.
 */
static int rproc_get_index(struct device *dev)
{
        int index;

        /* No DT to deal with */
        if (!dev->of_node)
                goto legacy;

        /* See if an alias has been assigned to this remoteproc */
        index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
        if (index >= 0)
                return index; 

        /*
         * No alias has been assigned to this remoteproc.  See if any
         * "rproc" aliases have been assigned and start allocating after
         * the highest one if it is the case.
         */ 
        index = of_alias_get_highest_id(RPROC_ALIAS);
        if (index >= 0)
                return = ida_alloc_range(&rproc_dev_index, index + 1,
                                         ~0, GFP_KERNEL);

legacy:
        return ida_alloc(&rproc_dev_index, GFP_KERNEL);
}
<<<<<<<<<<<<<<<



>  	if (rproc->index < 0) {
>  		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>  		goto put_device;
> 
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> -- 
> 2.43.0
> 
