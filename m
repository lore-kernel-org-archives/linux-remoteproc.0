Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2244D582
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jan 2024 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6ojPa93"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28c0536806fso4028741a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jan 2024 10:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704912524; x=1705517324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akr6CIw5c9giePcQiETe5sre9R6VrjuOFaMQiXaiTBM=;
        b=E6ojPa93EFOMr/euUnp0YOcZwwUIHtQExFNdCm/hgprRKqfYEgdp+1bIdWAcqhQ+0P
         i3a09xa5C2Hydj36+KwVi7ftPqExQcMKCoDvXKdnoH1AP3D27rGQozywEGsjZBmpgqi8
         V9bc/87R6rEMExoDcD9NiPQ6fzsHeb0ol7d5UskI75w6MYZdsOPKnLpYzrwhbF3MQcB0
         nRrei2F828AeUxUMdqQq3birAsOj3C747rK3lMYl3ietJj/PeEqDHiQtfi13HnzScA6L
         nDh8G4k7KYIAar8LGfHvRKrM4EvpKTYiEKUi82Ze+I1OabRcZ/D9Qon7n73ssuUM33bd
         rlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704912524; x=1705517324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akr6CIw5c9giePcQiETe5sre9R6VrjuOFaMQiXaiTBM=;
        b=LN5N+SFrvi+52se94GGCCJrlZhNKTAIOdueRrWUka4dRlfvvmKqAji7zRC6XqOORS7
         1Hq0rDiX9gf17orpZtIWyvdapYKPfdo0YOdo4izznF0O2iyBzKLYvnnEuHbo6vZ9SW+H
         C9lLcaXtv8VCe5vu+Fl1wHbA0HgcMPVHQENj6tG8xWEqblkIZPmuU66V7eIUIOKZEllU
         oYKTWmFEQ8SD4SQTBUsllOidbfpYOlPz1umm3BUjUfO20JSFR736bp6TnWCz8j6lH7Cp
         6o4er7rsB8EgGiQDBknfnucOm3Z6viUHA9G0VCI8kRglcxiXVXojr83inbaughy843Ye
         2Ljg==
X-Gm-Message-State: AOJu0YxyOFsVgRIitJed5XPf6KhE4x52gXp8xWYRssfVZ60cgD7SeatH
	rBO7R4z3fkYPql4KClfmGkrHNeajVjv/5w==
X-Google-Smtp-Source: AGHT+IG+Tj79AIadsBNASJ7uqTmlb9AQRUMel1OR4eJqyenpH/pAepfhWx4MXHF4y4U5CZwCHp5GIQ==
X-Received: by 2002:a17:90a:fc96:b0:28c:4b8c:9729 with SMTP id ci22-20020a17090afc9600b0028c4b8c9729mr1191345pjb.2.1704912523945;
        Wed, 10 Jan 2024 10:48:43 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a56c:270b:b7a6:a474])
        by smtp.gmail.com with ESMTPSA id s19-20020a17090aa11300b0028ceeca04a1sm1916286pjp.19.2024.01.10.10.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:48:43 -0800 (PST)
Date: Wed, 10 Jan 2024 11:48:41 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: joakim.zhang@cixtech.com
Cc: andersson@kernel.org, arnaud.pouliquen@foss.st.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V3] remoteproc: virtio: Fix wdg cannot recovery remote
 processor
Message-ID: <ZZ7miRHTe2LJ2PAh@p14s>
References: <20231217053659.3245745-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231217053659.3245745-1-joakim.zhang@cixtech.com>

Good day Joakim,

On Sun, Dec 17, 2023 at 01:36:59PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Recovery remote processor failed when wdg irq received:
> [    0.842574] remoteproc remoteproc0: crash detected in cix-dsp-rproc: type watchdog
> [    0.842750] remoteproc remoteproc0: handling crash #1 in cix-dsp-rproc
> [    0.842824] remoteproc remoteproc0: recovering cix-dsp-rproc
> [    0.843342] remoteproc remoteproc0: stopped remote processor cix-dsp-rproc
> [    0.847901] rproc-virtio rproc-virtio.0.auto: Failed to associate buffer
> [    0.847979] remoteproc remoteproc0: failed to probe subdevices for cix-dsp-rproc: -16
> 
> The reason is that dma coherent mem would not be released when
> recovering the remote processor, due to rproc_virtio_remove()
> would not be called, where the mem released. It will fail when
> it try to allocate and associate buffer again.
> 
> Releasing reserved memory from rproc_virtio_dev_release(), instead of
> rproc_virtio_remove().
> 
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

I am in agreement with your patch.  I will apply it when 6.8-rc1 comes out.

Thanks,
Mathieu

> ---
> ChangeLogs:
> V1->V2:
> 	* the same for of_reserved_mem_device_release()
> V2->V3:
> 	* release reserved memory in rproc_virtio_dev_release()
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 83d76915a6ad..25b66b113b69 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -351,6 +351,9 @@ static void rproc_virtio_dev_release(struct device *dev)
>  
>  	kfree(vdev);
>  
> +	of_reserved_mem_device_release(&rvdev->pdev->dev);
> +	dma_release_coherent_memory(&rvdev->pdev->dev);
> +
>  	put_device(&rvdev->pdev->dev);
>  }
>  
> @@ -584,9 +587,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
>  	rproc_remove_rvdev(rvdev);
>  
> -	of_reserved_mem_device_release(&pdev->dev);
> -	dma_release_coherent_memory(&pdev->dev);
> -
>  	put_device(&rproc->dev);
>  }
>  
> -- 
> 2.25.1
> 
