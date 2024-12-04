Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16DB20D50D
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Dec 2024 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334810; cv=none; b=mOOVDQK6qswWX/x0VRmyBrTe9Es6JqmsmZY3Go1aLTBmRIf8nIvGfJNfVAJRiYUzuVr27Z9Xu6s/pfwmv/6zs/TbmxJ/XVxAv/ko4L6aIyGWjI6gwu9dlmwlb8LyS2n/8FLnzmpiD0SID65CAZg+E8wY7BEsKMtlDNEnU+rMClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334810; c=relaxed/simple;
	bh=AyKo+YmzS+804dulbnT0hBLtMmwENaVVL5O39CWyHfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jzr2891yrg/VIHU2otxbTbIOxTsjzCIL+RZ6hgY8GO3hmKD5FjeOPCjCFRF87ML2QdVrxeQ6nyrw+n4eGkLOYHcLP+xUvzF4WpCI1zptunSNozHXKVn9+bHrW9E7Oy7X4kfsC924GUFJuiQgjWTsUdprMJFFEeLdNpcrk7wdJDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Far6yeZu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Far6yeZu"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21572ca3cccso44995ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Dec 2024 09:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733334808; x=1733939608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+EdRdjsNOeXam2HnODspyLGBuskP5LGbao1nKrj0X3k=;
        b=Far6yeZui4GxeUze7xP8uTC8M1kvxQH/RfjxgopVyrrCUd9CTFMnR6PeoMU6eV/axh
         UZWSJ9q6vuXmIbSRxoRQHWxAAvqL/P4Dn9sheA++QRB/T4wFXzbVQN3JX0HocUroNJKE
         xVALB9gJeEi2HjaLTj2lqMOatfDqDqkB20Pd5uW57QaxexUjdFVOnT42FjQTmVW+gGhY
         T8w9JrjyeeBwBJCwCOF2ct+IRVRSkh5IReCozY01UTmqIT4BUwODd4r2FXV1b9X4xgiQ
         2Wa26xaZC5Bfjp9ewuDvICvjaOUqunSgRlOw6jcbCEPAnOjA67iMXtuH3MATY05kZAp+
         UVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334808; x=1733939608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EdRdjsNOeXam2HnODspyLGBuskP5LGbao1nKrj0X3k=;
        b=FTJDzemJCtgaZ8Cw7OJPi4IqYjOkrbD9QvQaqvSMaNXAotO/Bhy3033IkZEU8cA+Hz
         hcYHu0HHFjrpDiZSUzCRA6wrrF3U0EshI/wHBXnRjG1It5rp68MBpFpWEBmwAxq7rDdz
         zVaKpXpdjR/qRNLUcONBmZPchdF/1Gz0p1g7P2P0oezR62FbNVpP+PH4b4RGtiP8tmQT
         dbs5KQ4zF3zCK8zE68sSGb/hUz0zIQO+vcSzaXkoBQAwb513sb9JZQdJKrUDgTA4jp72
         /b99DW31BDb452qJcP+k57dghqyVuvDHYT48eJskjV8kYuVdKr9q+JBNYurwJfa+poM+
         Mg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS+RYqMdBnx1vCwGsP3rZqzf4xcoSsKKuwLbxDBGuAfVhEV2EkxnC6pbZjNKWbi+y4c92Unb6iWybpA5mr8tu8@vger.kernel.org
X-Gm-Message-State: AOJu0YwanUUd1mXHi1U1YCSJ4zaJ2rMbOXGNTa+kwh/TK++HCpruuZgO
	71JLulFoiKEqVMjd544oWVNvQmPAyGfo2aAwAhnDyIBAy1leQ730fZH1bd94u4UJm+F5Q5/sXxz
	3
X-Gm-Gg: ASbGncsMievwiFXG6pMRT4NNk4ZUhQahuZ7V7d6Bv2zJQdA2DN2Hn0O745sjJJ2rNFq
	4j2hf0EAWNe2vpZZKcl9MA9sjDjjJ0mTSG8Ye1dkDrAWLZo8uzDmiuHjtqxANt5/RJREx0SrRJO
	+N2lY/JfGIeD5rReaS86JTGxtEPlGGi/fhwKKr9UfLsYDlkD/4ZpmTuhwppSqk3J87LIhLD9GQE
	s0vSia41i/Fbgmx0GajUKsaWi4Rg/mQwM5NV6ELguyaYnoNaK49Pw==
X-Google-Smtp-Source: AGHT+IF3kCe4ZPa78Jwjel1HDu6mlsuiDp/NiBNhxqks+ew9mmhBlvqyTlfFPhbg92AJrj72T7k3kg==
X-Received: by 2002:a17:902:ea04:b0:215:7153:5697 with SMTP id d9443c01a7336-215bd200c68mr121380025ad.28.1733334807988;
        Wed, 04 Dec 2024 09:53:27 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cb58:bf7f:6102:4f57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2155249b0cesm84754705ad.211.2024.12.04.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:53:27 -0800 (PST)
Date: Wed, 4 Dec 2024 10:53:25 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 5/8] remoteproc: Make load_segments and load_fw ops
 exclusive and optional
Message-ID: <Z1CXFfXnSKkTPKU+@p14s>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128084219.2159197-6-arnaud.pouliquen@foss.st.com>

On Thu, Nov 28, 2024 at 09:42:12AM +0100, Arnaud Pouliquen wrote:
> The two methods to load the firmware to memory should be exclusive.
> 
> - make load_segments optional returning 0 if not set in
>   rproc_load_segments(),
> - ensure that load_segments() and load_fw() are not both set,
> - do not set default rproc::ops fields if load_fw() is set.

This changelog is describing "what" the patch does rather than "why".  I have
commented on that before.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 4 ++++
>  drivers/remoteproc/remoteproc_internal.h | 2 +-
>  include/linux/remoteproc.h               | 7 +++++--
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e4ad024efcda..deadec0f3474 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2477,6 +2477,10 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  
>  static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  {
> +	/* A processor with a load_segments() and a load_fw() functions makes no sense. */
> +	if (ops->load_segments && ops->load_fw)
> +		return -EINVAL;
> +

It is only a matter of time before someone needs both ->load_segments() and
->load_fw().


>  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>  	if (!rproc->ops)
>  		return -ENOMEM;
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index b898494600cf..3a4161eaf291 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -170,7 +170,7 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>  	if (rproc->ops->load_segments)
>  		return rproc->ops->load_segments(rproc, fw);
>  
> -	return -EINVAL;
> +	return 0;

Other than this hunk I would drop this patch completely.

>  }
>  
>  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 55c20424a99f..4f4c65ce74af 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -374,8 +374,9 @@ enum rsc_handling_status {
>   * @find_loaded_rsc_table: find the loaded resource table from firmware image
>   * @get_loaded_rsc_table: get resource table installed in memory
>   *			  by external entity
> - * @load_segments:	load firmware ELF segment to memory, where the remote processor
> - *			expects to find it
> + * @load_segments:	optional load firmware ELF segments to memory, where the remote processor
> + *			expects to find it.
> + *			This operation is exclusive with the load_fw()
>   * @sanity_check:	sanity check the fw image
>   * @get_boot_addr:	get boot address to entry point specified in firmware
>   * @panic:	optional callback to react to system panic, core will delay
> @@ -383,8 +384,10 @@ enum rsc_handling_status {
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
>   * @load_fw:	optional function to load non-ELF firmware image to memory, where the remote
>   *		processor expects to find it.
> + *		This operation is exclusive with the load_segments()
>   * @release_fw:	optional function to release the firmware image from memories.
>   *		This function is called after stopping the remote processor or in case of error
> + *
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> -- 
> 2.25.1
> 
