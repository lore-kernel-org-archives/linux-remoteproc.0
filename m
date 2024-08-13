Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD82AF0D
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Aug 2024 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723564511; cv=none; b=pcBAbcmyRWcLrmWVk5UaWMl2uGJSJIy+0WytVOUcOw665W9YbyQx26zNoJ0HLQvoBP8msucZ+e7720etcwNsbNbkCb0htNR37VuOrtKXDYvd/Kc6+xG9rYYvc5KIu3U91CGVvUR+/BcRrbB9fjtrQN3xiHXWRMmTv/vyobuCmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723564511; c=relaxed/simple;
	bh=ofzzO/MDsGwGtQPGj1xQIn1dKHbuD3rWUlrc0rP5vzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvSmn6tkuAYQ3ky60oYND7Iwmvdm8ynqW3L6zVSoUgZn65eIDeMwpr8SoctGwohTN7YiJjdNFg+bCIj42jyEDJpSBxqJhNqE+ykolBBtOwmx12dAo7eeUwYdGTWHPY2fnTiaDdv76n/c4nZLwOHZH9nbeIv77T1KZWb69pevGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlhHEa+Q; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlhHEa+Q"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-201d5af11a4so247275ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Aug 2024 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723564509; x=1724169309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XA69NfodEyCttT6a+GrneJTF8uIIfegjqkueNkAJX18=;
        b=OlhHEa+QUH22Kg0KKji9HZSAHrncprzcurOYQqWDHT9KMKI5Fwg8ryT6g8XrzB7kK0
         BflecDhnkalJJokAKchgRmC5vYHQ2hUVnmhQTUOxoDQEhNNKZNwxyHi49Kg+tfzeOyZr
         3tp0UD0Cg7nlAyfpKjIfJnDuBsIiu8bh/qkXJIOqsJ49nzJw7pWuR65GwptsOv5uUrg9
         ByJ96ORctt0LETNt08zKVgjC/qPkuYU8WS9NYKpAnEMUM0w+GE7YN24/5uOJpweEZ9aw
         sEMb4Y7oQuSb5tx2XsZwMFnsS45KnUNFAw69K2ocp94nF/qTB2lXEIfk3TDVUl91P3El
         mShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723564509; x=1724169309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA69NfodEyCttT6a+GrneJTF8uIIfegjqkueNkAJX18=;
        b=Rrm3QmM3o81WgcQLu29nqoYBV5I4Jh7YREqMV4aev7a4k/Mpu1h6r8MSR7+cAD42/5
         8QFReoEWpF6Zz11Ya1WI5pEjOTKqzg7GGfRSZP85OsnoBNm1a6nU1kQosQlAnKtsG14K
         wnCMay6Aeu1+v+4L+e8Hadfesk3xFYrRi6IDDBl+5+3Dtvrf2SGPzZxku1xvMWO4/zky
         m6EkOfpxF2gXmbuVyINjKxCtQcMeh4PVOQ5DrOMzFuhAWiSkFb5ciBV9skY2Erv9ir7l
         nLlxYUPZ585sb56VAQ4UNmVypWkxu1+lCIMP2FDoBNv1IsqNsni8xAId3H2mOMqg+HO9
         lV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+RnPV9ZJpl+xw7HA2BKpeTYyalaczTxFxA3AlFk2EyicBl6msXE4xp4jitWsYFju7CZ9fBwqwugs+yHOdRwNnzQAQhCBK0djIXpPlV6G71w==
X-Gm-Message-State: AOJu0YwxYg1rQiIJYG2j8lAxZSOz895CcdepREG4tXXua+9bKUD4h6tn
	VwOvHN+8/AW3DNH1naTZ3EpvOxE2dK6qTW3my0ok3DblDj2J6z9peTyomCQAPVI=
X-Google-Smtp-Source: AGHT+IG9G6M+t+VKPSzwKnxIYBB8RhmRRqGfZJq4Bi9ZrcsR6TvNvFeeyp7dUt+EdE/zkwku9m48sA==
X-Received: by 2002:a17:903:230a:b0:1fb:a38b:c5a7 with SMTP id d9443c01a7336-201ca185904mr58149375ad.13.1723564509168;
        Tue, 13 Aug 2024 08:55:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d596:d55b:d99d:7ece])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1a93d7sm15220855ad.149.2024.08.13.08.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 08:55:08 -0700 (PDT)
Date: Tue, 13 Aug 2024 09:55:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] remoteproc: keystone: Use devm action to release
 reserved memory
Message-ID: <ZruB2VhA78GRWG9X@p14s>
References: <20240802182300.244055-1-afd@ti.com>
 <20240802182300.244055-3-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802182300.244055-3-afd@ti.com>

On Fri, Aug 02, 2024 at 01:22:56PM -0500, Andrew Davis wrote:
> This helps prevent mistakes like freeing out of order in cleanup functions
> and forgetting to free on error paths.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/keystone_remoteproc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 8f0f7a4cfef26..033e573544fef 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -358,6 +358,13 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static void keystone_rproc_mem_release(void *data)
> +{
> +	struct device *dev = data;
> +
> +	of_reserved_mem_device_release(dev);
> +}
> +
>  static int keystone_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -434,8 +441,14 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  		goto disable_clk;
>  	}
>  
> -	if (of_reserved_mem_device_init(dev))
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret) {
>  		dev_warn(dev, "device does not have specific CMA pool\n");
> +	} else {
> +		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
> +		if (ret)
> +			return ret;

It gets sorted out in the next patches but we still need to "goto disable_clk"
to avoid git-bisect problems.

I have applied the first two patches of this set so no need to resend them.

Thanks,
Mathieu

> +	}
>  
>  	/* ensure the DSP is in reset before loading firmware */
>  	ret = reset_control_status(ksproc->reset);
> @@ -459,7 +472,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  release_mem:
> -	of_reserved_mem_device_release(dev);
>  	gpiod_put(ksproc->kick_gpio);
>  disable_clk:
>  	pm_runtime_put_sync(dev);
> @@ -476,7 +488,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
>  	gpiod_put(ksproc->kick_gpio);
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	of_reserved_mem_device_release(&pdev->dev);
>  }
>  
>  static const struct of_device_id keystone_rproc_of_match[] = {
> -- 
> 2.39.2
> 
