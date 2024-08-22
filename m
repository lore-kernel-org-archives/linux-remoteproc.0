Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04141CCEC9
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Aug 2024 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343484; cv=none; b=qzaMdfvYE/Cb/cwI94tYUaNhz+vAJXkYrCMO17bA353CXl4FQg+AuQ4L1FMq0tkzI96lEu51jHPiPuMjqQB4xqsESamLmchwBcEidSv1bMqDh3uNpj38ZF3UsvuS8GEtm7zzsqSzqoKsWZfpJqmJMl96ABB/pCHUAIDKLupKL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343484; c=relaxed/simple;
	bh=pzVZClyB/Tio3abHqD3qwB+FNWLpxRxIcAYuvZ9PxoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxDSlZyVXxqU8JLvzZ77veJkm6sCiCFNJJG6OJf3aZNnvKgoI0p1XBHyserVAqj3mbUKhDt6TojLq45ppBaJn+2Oscu/WCZhnjAeKxbLiBcTHwba26RbDLDQqapl0ntlz3Btur+VB46BnR4QpqOcJbZ+j4Me4XWiO7dGQSqPfd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErMl/PT0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErMl/PT0"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-714263cb074so901483b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Aug 2024 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724343481; x=1724948281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fw2jQnFKYplOXyWl2+iotSK1aecdZdvMgRYo2XdZaM4=;
        b=ErMl/PT0YOutdQu/tK4s0MN0tuyweMWELAxXPTSoD7aiVIDUsMa7Wh0lOGpcttSx7M
         u22NJPPEQeNUHF0UVTvWzUP5/tQ8lTw8Ul/bjy93D1y3PUbI3HDQNaDuzrHeDC0Sajqj
         PLfM4+MwDyI2MuWTK7gKdIwgMFvCvqhAbaV9UImWxGpu7lmuQLEGyp+BtWP12JZhjanU
         JCnh8Uui/d1ohENImurllQ5Xxsd66ogl0R58SGbACt6TTHEKy5kNGl/2d4WVzjJLEaDe
         qNWMuND1c7adEcOIPvrBmS5XTTp8PYfn8gChhI7subP5ASanjngahamf5mAIgWgfDdsh
         Pj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724343481; x=1724948281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2jQnFKYplOXyWl2+iotSK1aecdZdvMgRYo2XdZaM4=;
        b=dtlF8jCkZWbjFXbyJr3qNkAjKXOFIgv4Zw1IbMr6xbrTZdvpHGO4urEHOitXdyEP6k
         4fSVVGc8stTaZYVv8QKBS8UENwTvZDxZYiiD4XYPVTKR1sB7GPRhBmwB7wroWMlTVc1Y
         dzQmeCr2hZZdppeocfOYDZMBNY3wwS/2xo1gJjBwxCF/ewr3ccCb5q+Dn+guSYjuplVr
         yt2uhZOPDLwPnRHIG8Uyq05QkKuQKdZAEy/TKOAIQqJ/EG9vqkj+cP1/bz2fx+rGzPIi
         9LpDzdvU+13qh89TfZn2oGTx1JAgi6+KFDabscow62wCVx74z5fpt2I7BCItq/WG6aGJ
         7F3w==
X-Forwarded-Encrypted: i=1; AJvYcCXDdQkD/ItkalcZUty+YwcV45er8PV6kJW2/+iTpEZtSz90B7ocNh+GFGlg2OUPlpE/XN7XN3nq+4qUi1mcF9Ie@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2BJwmNz2mPqgZOp4/HWdRDrixb54K5Fh7weuXCGQZ7yGoCZMS
	L4dOyDODmKzmtyUUF6+364QXsXaUa45S502QUbInyUkQtRZd+E5GLeUGsqAmb0E=
X-Google-Smtp-Source: AGHT+IGuZxjm5RjDz4gxgtOdv4bxrkYUPOtjFJ+HJu04rbWtzx4ldCQFpMKwqAlGokpUal4t0n5B6w==
X-Received: by 2002:a05:6a20:9f9b:b0:1c4:9ef6:499b with SMTP id adf61e73a8af0-1caeb21cd5fmr2760744637.29.1724343480886;
        Thu, 22 Aug 2024 09:18:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:778:8246:31d8:e3fd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acdb54asm1563295a12.42.2024.08.22.09.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:17:59 -0700 (PDT)
Date: Thu, 22 Aug 2024 10:17:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lu Baolu <baolu.lu@linux.intel.com>, andersson@kernel.org, afd@ti.com,
	nm@ti.com, hnagalla@ti.com, b-padhi@ti.com
Cc: Bjorn Andersson <andersson@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/1] remoteproc: Use iommu_paging_domain_alloc()
Message-ID: <ZsdktJEqR9BOgivK@p14s>
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

Hi Baolu,

Sorry for the late reply, this slipped through the cracks.

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

I'm a little hesitant here.  Function iommu_domain_alloc() passes NULL two the
second argument of __iommu_domain_alloc() while iommu_paging_domain_alloc()
provides a 'dev'.  I don't have any HW to test on and I am not familiar enough
with the IOMMU subsystem to confidently more forward.

I am asking the Qualcomm (Bjorn and friends) and TI crew (Beleswar, Andrew,
Nishanth and Hari) to test this patch on their IOMMU devices and get back to me
with a "Tested-by".

Thanks,
Mathieu

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
