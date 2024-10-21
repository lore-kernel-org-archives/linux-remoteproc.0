Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858341CCB59
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526097; cv=none; b=LaBZ2tPb6jS8ajq5chDRSm8/4s1II9U+RCL8RWAFV2wDDwcTtxmGszT+BuS2eIS4WzX1RJp85cx6XNknq/C7zCbUZMTdHwJSYjpTIvclUwcc/ieEjrLZVOgO+q/qg4cw6hkFQA/1zfytLefecJnZtW2dp9UskoSEJEJiNwBqN7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526097; c=relaxed/simple;
	bh=4nxqVSA7RPobzfnZ2nnUbYiPXxxY+p6MXf6zMR+JMvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT4YlR4XxwvfTkbO4//7D9RxgQO96qNdyIWdoIwk/kuvvPxZudLNBlP/O+JLuywCcXS2P2nUAZbn6wtBcRwGAjUfcI0D1NSjyd+qhDfQX9dbg+FOe49ZKpseu5PRQZ9yA4gDPLhtcHSPR5HejpvbazcixMjlK1Ti94h8dVLvKl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPSJQCKG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPSJQCKG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e6cec7227so3650879b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729526094; x=1730130894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2P/OAPuPPfGZgym/n673Rfg3DHU/GqTqUEFYAFx22E=;
        b=tPSJQCKGTfLByc3iumxMVXRcDaNXkkm8rPWBypjQ7KcU0xHbv5NUhp7x1IaxwHXl6i
         fspUcEEfQCEI8cj+gnqCT5eWXg2PLRjXuV5ZmZe1sHWFWXAXg1br5UqVWGhQ5L3HltEc
         yOZEwcek5mMBnfuvrm4YY+2LixDmwAYFshhkryEmuC91u5E9emo5gG4JkHiW/YjFxdTC
         bik1MIiKZIP6rOEnzhCjGKhu1hnONhUkCMKQej/gZmmoi8Qxlj5ISr8X4um4IPTU6Kpq
         9MRHiKt2pH0ClAqdaJr/F0nq7Nq8pYdz0j84CBe5QC6MUXBacBixrqY2Pj84YcwWNvNY
         z3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729526094; x=1730130894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2P/OAPuPPfGZgym/n673Rfg3DHU/GqTqUEFYAFx22E=;
        b=Vl4BYKcOxPI2MiIWzNv/uRWnouNxMnavccJhWVILA7asEVNd2spbx5iAcMYa52AaIj
         DKDcltcDApbm4op9osDWeyou9Aa7taHKwcFCm7iaBsQF6+Ls5zAxrYeOE752Obb4ZLjH
         yY7tRol4hX9K1vnsVklQkT0x6z8R/H1iRliznvLCjYQRMTyFNRqYe7fzAtIUkLvOltHy
         BOHRSDF3P7V8KDOibANHeH+9DR5N+tAfkm5lSHk508jwu7bDzvwnaBrB9caX+xMI10Fy
         Bzkic6YIP1IC3xbfMIVxyBqbnNzBt+oRin4slyMDi1NTA1/j+WutV7hgThWA0skzW9uM
         u4GA==
X-Forwarded-Encrypted: i=1; AJvYcCWYGR5xVViu2cWy2TIcTjP/SOJdk2ZmSsXHhHH3AXZIEodKTXMVjkh7grRAs3tOPVbwVXpZhhpQGhGfCY6y4nen@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYJtop9Jm9hPVgu0nAiIcmWfSpgXYuxyPgoAMy1ljtpiRiIkQ
	eiotgRRS8uKE3YAZT5ha3K0JBy/Xz+x+UgbSlZ98FYBkzWWtG/1wpr8EvPQW3lY=
X-Google-Smtp-Source: AGHT+IHXumHx1fJK7C0JJjF2aFxoJi4eyEeDsc9H2M9LdVyaQELXWb/6QAXRzMTU/kCm/w8lInBwkg==
X-Received: by 2002:a05:6a21:70cb:b0:1cf:6ef0:c6b9 with SMTP id adf61e73a8af0-1d92c56b9bdmr15675587637.32.1729526093768;
        Mon, 21 Oct 2024 08:54:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fb5e:248e:29ec:7946])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1356780sm3137641b3a.90.2024.10.21.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:54:53 -0700 (PDT)
Date: Mon, 21 Oct 2024 09:54:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 4/7] remoteproc: Introduce release_fw optional
 operation
Message-ID: <ZxZ5SdGmcBlra4zi@p14s>
References: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
 <20241009080108.4170320-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009080108.4170320-5-arnaud.pouliquen@foss.st.com>

On Wed, Oct 09, 2024 at 10:01:05AM +0200, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops struct to include an optional
> release_fw function.
> 
> The release_fw ops is responsible for releasing the remote processor
> firmware image. The ops is called in the following cases:
> 
>  - An error occurs in rproc_start() between the loading of the segments and
>       the start of the remote processor.
>  - after stopping the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Update vs v9 revision:
> - New commit that preplace previous one to introduce ops->release_fw
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  include/linux/remoteproc.h           | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..46863e1ca307 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 73f640dd0fc0..bdf4d94a9e63 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the firmware image from ROM memories.
> + *              This function is called after stopping the process or in case of an error

... after stopping the process?

>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -403,6 +405,7 @@ struct rproc_ops {
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
>  	void (*coredump)(struct rproc *rproc);
> +	void (*release_fw)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.25.1
> 
