Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14619309E
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Sep 2024 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727714436; cv=none; b=sA5OgbzQEDm5p7990jCuFWQiIjy1xPbLmBxWsm4HMUrTXbcCM515YXEdNiw46ZA0a141UHAeVeYlxjdc5cOJV7v2toI+oIenw4Dvh4IT+HvhnqlqOEft5bnWHDTZbzdM2xewNdpfO+e6Q+n1f86mpVHGXeDHCT6rCHdgxSko4BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727714436; c=relaxed/simple;
	bh=dSBOhC0bjhbSESR9jo2CyhBJlSFuwF2AEg6p/4dVTQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWGYyBFHZzdq6l6f2qGclaHClXu89PHK5PMaZD/PfzVoxwp/rP3SpQz9Ov71ZXDqCYbu3Z2gIxm+vOdI2rEiRK0aDkTLJO7f1C1gb4kNB61qLVHKLj2u8a5lfZnlR3+oGQaerL1jq/bqNulUKr73QgTj78RSdVVXMQIRJU0ZxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THob8nCB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THob8nCB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b0b2528d8so50612355ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Sep 2024 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727714434; x=1728319234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XrqJ8hHUJyic1Moj+zvtd8DxfNx+7yYXWpXKI0I8z7I=;
        b=THob8nCByvhB2oPyBxU/r5IgqWd3X8XeUekioHPCbIC2OMzRK5Uqz4RqxIZE7dfn2k
         kVoSdRmvNyY8cgK2j13dZtiOJI7qF4IY3Mm0jIbMntRqGx2kfgsHBdF6OeVAsHL4Cwgz
         N5gB6wuZnIRjhF2DwM+e3OvJRRmInW1PrBM0gXSb26EQQPthalNnxzhtsaQBaGlpP+4a
         48xeuF+jRdQUMohwbdInlgBRGKSgWWOVfFBZz/D91rk0ZyuPBaWaukuhqOyhMXZBxu0G
         NespLl4YChD+08S8bgtQSHLMHjNj/AqsWj61mDf/8812J5sodRGpuCfdlnuaX93KYxRx
         PT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727714434; x=1728319234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrqJ8hHUJyic1Moj+zvtd8DxfNx+7yYXWpXKI0I8z7I=;
        b=sjWxVAn8iPKDf33/2cW+BShJhzK48RD56vVO4F65/LBzu8t1sHLgLfMfaZSpy5d+6u
         AqHLj5b/vK6OMKPjqoPi6ni2T4LK4uhhbo0su90jSRhky1oN2tgLLuA1pyjrCEV4mj7i
         We5h+/5pnKTZwCoDqHmk4cNjZ2tvtufyl9oBrJXxh3o0urHrV+LVMn8305PnoHKW9Ogo
         SpffpnTyaBw7B3q3cO3pMlIG3+s+LECCGzRBFJ04Rux+ge+T92v++FGJCzmM2RDzDZYp
         nZ4W+KnRWgBPvgd4cIjwit7m68Abdxh1+cn8dsDZi/Kzzw2zDSstIFYy16gMqWXQdLQq
         RHvg==
X-Forwarded-Encrypted: i=1; AJvYcCUrecWUr2nO0+J+jyz8LYF9bdzb9Rfu9YQmnfBKuux2ty+mj+wLhHkna7RaznKZFTGItnfjIxdKADWWvfxkk9wK@vger.kernel.org
X-Gm-Message-State: AOJu0YwHCz1YYqT9N3oz5p3qfpvxgcyrzRygIRXfnT3s7LQ4J96DG3Zk
	QAAKotNgXxeYnlP4ryxpeUA5QFqy9WjLvb0diroPLamyu8z+7LQsG0Vo9ilVRCY=
X-Google-Smtp-Source: AGHT+IHsTS8iXYCxVVG4r6awYj1PyZMeOcTmX8+hwB7h5vhx6IxPbluJrOvTMvtp8iHvvANjKW2aAA==
X-Received: by 2002:a17:902:c40a:b0:202:1bb6:1897 with SMTP id d9443c01a7336-20b367e4b7emr217898405ad.14.1727714434128;
        Mon, 30 Sep 2024 09:40:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6561:7ef:acea:822e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e357e8sm56058175ad.187.2024.09.30.09.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:40:33 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:40:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/1] remoteproc: Use iommu_paging_domain_alloc()
Message-ID: <ZvrUfoTM6s/jv9Nv@p14s>
References: <20240812072811.9737-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812072811.9737-1-baolu.lu@linux.intel.com>

On Mon, Aug 12, 2024 at 03:28:11PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in rproc_enable_iommu() and is attached to
> rproc->dev.parent in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-13-baolu.lu@linux.intel.com
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

I have applied this patch.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..eb66f78ec8b7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -109,10 +109,10 @@ static int rproc_enable_iommu(struct rproc *rproc)
>  		return 0;
>  	}
>  
> -	domain = iommu_domain_alloc(dev->bus);
> -	if (!domain) {
> +	domain = iommu_paging_domain_alloc(dev);
> +	if (IS_ERR(domain)) {
>  		dev_err(dev, "can't alloc iommu domain\n");
> -		return -ENOMEM;
> +		return PTR_ERR(domain);
>  	}
>  
>  	iommu_set_fault_handler(domain, rproc_iommu_fault, rproc);
> -- 
> 2.34.1
> 
