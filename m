Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487A343D91
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627547; cv=none; b=brVo4SrLfAbicrvM5nNYl8B1kHsdYu1x95xDB9G7uMBxDLq82ntLCn8xRNH3x59UQGT0K+ztuH6jTnqS7fbI8whJW+mATk+hK5TF9GoTjNDGGmUNyNSkXTySExW/aU/dCDwLwvr59BqonvCCvxK/D+oTNP8faDN/xhyuoDSHFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627547; c=relaxed/simple;
	bh=yCg35r4ms7gsC/mGtCURPao3mJuEsBfHclwa8/neqMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+6iBWWpQUGeEi04SiuqmTDOHTAerheRCpleEN047WkYVUkGpmZlguwRaQGtVRfCUJMjd+Wxl9p+9h9D3FicFjmTCAeAPehy1KaNvPK+kCbiWX3iu6s21F2M7AWzhbXBE1q2wMqIDa1fbjst5SOBQz3msauCyTVmmGdGuFYDs2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7KtpM8Z; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7KtpM8Z"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso863500b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760627544; x=1761232344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ut2s/s3FIafEe4ZDshWAioE5+2hw+U5ZIXkh0yek/f4=;
        b=D7KtpM8ZqjDr8SDyt1fR1cBcERWth6ral6Br4EmIldcjUK3n+4GlY/oniLPuV+LRtT
         R5YIWzlOt/4egCI4aleRjZQYoy/C0KhxxgVq6jDWEwNRDiw84Du+scun3p6FCxQB405U
         VGCDTdIaDfXoHuqFhPC+b3QCBtiZe4NLjVG1HTa3Q2bBHLTbyXHNGIHD1lIncuH6sXAV
         Clm4vFqaL6YD7nQPeyZNkXXBmBIJ3DlgUGgj0fjTra9NPIUysZX+u8wbUQw8+UtOZzE4
         elXCMVSiDxqscLCISHjPnJ1IeW2Ln8lXUS3392UZ9g01G2jgjkrDTxd8KBgG17tGSoDD
         NQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627544; x=1761232344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut2s/s3FIafEe4ZDshWAioE5+2hw+U5ZIXkh0yek/f4=;
        b=Yn8w3RRnZrXqnirWpw2+Clxjf1uMLU+XFK5CCC7MIMy+2IF8pP25Uhfh/fQ+WwQjnU
         +aUGOTFQvqXcBXiIkxE1/j4vSEiGgQ4WgHke1K4j8STUjgSjclVd/9cAXrgkFbgUV1QO
         kWxhu0BTW7//ZwpypsLx1MLAYNN5wEFK5TBkp1nIi5BN17eHc1VPu39yjzw0NrTrpvZ8
         7IMO/rc3Rcmn4NyCw0n4DLUcBvzpTN3Aq55E2rABZk6ZyPcl1oWsc785hJHmmEPVb60v
         Xmf3r05UAS37VnJPA28A7lnwHwt9S0LPtZsJ1Nod8ilLcEsqr31sSvXjQ8NYgYGwddmz
         tGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUoXZa4GZM9QYT1bliTjxu+qn7mHgN1bdGGMRjxC++2Lr4GZpkCKbcm6BlvhfyUaiOSC1WhWdOtq065xp2u09z@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/0LO3OsqRihGbV5iHVqyNSgMW+XU9dtwHevXs3ucaG7N69lG
	44ndgg06HV7ddxizmY4Uzwa+wVIBZUerMN6X7u4HaqGAZCplGSRp8StZA1H8l19z71I=
X-Gm-Gg: ASbGnctO5N5FVqy4uvuMva7WwMup652UUAxdb9J0X4aeznD1auGqbCl8pZC8z51K2tW
	/XcCT+aIeCXi9bF1NC4wnipqKiH35Jnssf5k/28Db7ew5ID08Vjqde2CRkJQxOd3lnnpMWVf5Ik
	O5RqqnZ380IJQwappWb/VzvdkrDa5wM1xSmq4ViFW5/KqIWFCJHXsH8XYUuLTtTjsBBZY6drqGG
	rE5ZatuhwragNSMwMcsT2Acv5FtnVKq40TOn2xcG751SfTPaQoAEYL3F1NoyTYujUqDD6dcisC5
	O67nPlpuUihjCnXcVx6AsvLJeN03tj+ErI75rjqDGsPUX9xEqGC0YixMvNhZlE1IR9N3tedQFSD
	MubQu1fuTVZl8e0cInfXGhRdELIQST7sMFExUZCca8B5YXhwH7yk+CdUHhnO8T+U1JHPjYzYdKZ
	a9LOPhpR4eZ4DtmzDxLMTxaWbY
X-Google-Smtp-Source: AGHT+IELjLEOjB5GZ8wek/jbgtacavjiPcJ12k9YT8oJ8gP2sncFT79C4nC7cfzpXzG3kveX/6VhGQ==
X-Received: by 2002:a05:6a20:e212:b0:263:52cb:bc49 with SMTP id adf61e73a8af0-334a8607db3mr427025637.35.1760627544219;
        Thu, 16 Oct 2025 08:12:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c6a8:58de:b8f8:4d8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bb5b8fsm3152334a12.37.2025.10.16.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:12:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 09:12:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] remoteproc: core: full attach detach during recovery
Message-ID: <aPELVfhkk0qDXqa9@p14s>
References: <20251002153343.766352-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002153343.766352-1-tanmay.shah@amd.com>

Good morning,

On Thu, Oct 02, 2025 at 08:33:46AM -0700, Tanmay Shah wrote:
> Current recovery operation does only virtio device reset, but do not
> free and re-allocate all the resources. As third-party is booting the
> remote processor during attach-detach, it is better to free and
> re-allocate resoruces as resource table state might be unknown to linux
> when remote processor boots and reports crash.

1) When referring to "third-party", should I assume boot loader?
2) Function rproc_attach_recovery() calls __rproc_detach(), which in turn calls
rproc_reset_rsc_table_on_detach().  That function deals explicitly with the
resource table.
3) The code in this patch mixes __rproc_detach() with rproc_attach(), something
that is likely not a good idea.  We either do __rproc_detach/__rproc_attach or
rproc_detach/rproc_attach but I'd like to avoid the mix-and-match to keep the
amount of possible states to a minimum.

If I understand correctly, the main motivation for this patch is the management
of the resource table.  But as noted in (2), this should be taken care of.  Am I
missing some information?

Thanks,
Mathieu

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Note: RFC patch for design discussion. Please do not merge. 
> 
>  drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 825672100528..4971508bc5b2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1786,7 +1786,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	return __rproc_attach(rproc);
> +	/* clean up all acquired resources */
> +	rproc_resource_cleanup(rproc);
> +
> +	/* release HW resources if needed */
> +	rproc_unprepare_device(rproc);
> +
> +	rproc_disable_iommu(rproc);
> +
> +	/* Free the copy of the resource table */
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;
> +
> +	return rproc_attach(rproc);
>  }
>  
>  static int rproc_boot_recovery(struct rproc *rproc)
> 
> base-commit: 56d030ea3330ab737fe6c05f89d52f56208b07ac
> -- 
> 2.34.1
> 
