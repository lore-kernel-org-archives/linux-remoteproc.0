Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307A1AC42B
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Sep 2024 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070198; cv=none; b=YKnYqx9AhbIsNLX8wo+v3nYAsPQXvAXgkIt3P7E0G1dzD7M922cnIeZjXwo/hfWnC30UWOSJ3GOHV5P9ZTczg/t3DfUFOmok895O1Fha0T661TWYEHjub1Ov8AeS6zGwB+YIzfKbyFmPUJxZ+q9jD68yvphwJztDPXX7HM7rSRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070198; c=relaxed/simple;
	bh=36KlrzfsV2g215KHFOOz45t4T5Bn2rd6NGxHlDdOsuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzLLixy5HR4d5FGgjSejOCQdqop2pAHy5jP21W2vxUCF5GekUBh3NwnTHJbdF1GUhnnW5uzKjnTJzhe6wSx3JNJhG2EULrFEgh6jKBtzHHDGImXw9xaihDQn0hz1rnxzqRB/JXVr1u10Z3RYkYDPzs6xe8p+y7W9i0Dwc84zCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eT5ICDWd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eT5ICDWd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2053525bd90so412915ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Sep 2024 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726070196; x=1726674996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyEYdmmCtjL2ZglMclaQOmpZZ8FR1iFPca3qPYCy9w4=;
        b=eT5ICDWdox3B3cWNDHzc0VhPMARpfWmOpUbkivGYSls4AJ2ep8Z8GAyFdRZVQRXua1
         PUQ1YQtEAQ1McvpSvRXcBC+qWkiysPnMZt5IVUTfdxpA5PMOD7pQQ2xymudjFk9gnqAz
         MVET/XUgZ/HDnawZXGFzwgkFw+MCdeYa9i9CvPk77tuZ9JYEAeRmcaesM4uJpacQk7fb
         wIIMC+h6RHO4nHTffgGR0mIF6PQj0HTDEM8eAMFHuiXyEMFKMVEbjVmgTKYliR7Ek8jh
         hakzrcAeF9HYQKF08+EqfKH2OCFvThhUDd8pCeESZH4Qbd0hOWrmw0tob+NruXOJJArv
         Z0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726070196; x=1726674996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyEYdmmCtjL2ZglMclaQOmpZZ8FR1iFPca3qPYCy9w4=;
        b=rNPfhNhtyA6cOPNXXlFvs+XNRFW20O7l3PHck5xuVQrC2X5uv3qzYccCzlj4lz9z6O
         iIm7yMJKhxGWBrhCN5WiZWwJ4+Uplsa7eM1S1jdgMDKz5B5A8WcGBkZ0BaWnTwrGlns9
         unPHzpt6wuyHPZ7Cy2WrPht/HLgvui5OxBY5bwyE5eDbQGc6ReAVct7k7ZlqU0wzXris
         NoE2zWDJbZ9L0SyO4Au5ldHtMoyzvj3XBIZDOU43PG8/NWd/4z06+a6GOBfbjHwHcf99
         CqN3LnPBEjGalslrSToG2jPp3VfhjY+pk4fh6kdvRDZAJra+A7OV7V+9apx2Jz3KnI0d
         FBEA==
X-Forwarded-Encrypted: i=1; AJvYcCVce+XYO9dnF6mekjsA42Q3ua/MyF8xjSm92TYJHYcK9btiTiLwkg3Z1w+TRXSXn2hI2Pi+u1QrWGM2YsQkMslK@vger.kernel.org
X-Gm-Message-State: AOJu0YziiwVTBxldkDNTYxwajavLxqRGBmpqiXuE65ds90mLdEkEPYNy
	IchdG96E/A3YpBsxS8/FF+S3wj8t8jZlWHjgTxLHxvPwp2vWF5lQTVxksoAwu2uKeQFH8IJnxvw
	K
X-Google-Smtp-Source: AGHT+IGa4wRKlJxrETW0qCu5ZTTQ3xb8Do/wPK2e8jasfbzAeq1gxfAE2Mk/Fx9F2dJ/V92m0elHfA==
X-Received: by 2002:a17:902:d4cc:b0:207:3a46:345 with SMTP id d9443c01a7336-2074c761a4dmr58970435ad.51.1726070196194;
        Wed, 11 Sep 2024 08:56:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc9a:9892:2799:3634])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe9cb9sm1159555ad.193.2024.09.11.08.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:56:35 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:56:32 -0600
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
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
Message-ID: <ZuG9sOI+xX93NCQc@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>

On Fri, Aug 30, 2024 at 11:51:44AM +0200, Arnaud Pouliquen wrote:
> Add support for releasing remote processor firmware through
> the Trusted Execution Environment (TEE) interface.
> 
> The tee_rproc_release_fw() function is called in the following cases:
> 
> - An error occurs in rproc_start() between the loading of the segments and
>   the start of the remote processor.
> - When rproc_release_fw is called on error or after stopping the remote
>   processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..32052dedc149 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -29,6 +29,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/rculist.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
>  #include <linux/iommu.h>
>  #include <linux/idr.h>
>  #include <linux/elf.h>
> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);
> +

If I understand correctly, the first condition is there because the
attach/detach scenario does not yet support management by the TEE.  I would
simply move the check to tee_rproc_release_fw() with a comment to that effect.

>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	if (ret) {
>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		goto reset_table_ptr;
> +		goto release_fw;
>  	}
>  
>  	/* power up the remote processor */
> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	rproc->ops->stop(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
> -reset_table_ptr:
> +release_fw:

I would have kept the old label.

> +	if (rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);
>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
> -- 
> 2.25.1
> 
