Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53C31352D;
	Wed, 10 Sep 2025 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757498279; cv=none; b=uobWhONHvPk9/IFE5TqrwLVcS2qRh2tjHtaXbseTFk421Pv3vyMJKldmMLX82nrcap3AegTq9bYQzh2QWLWRwe4QsIf5v0xCGK34FQxIGEWN1zkFo1oSjhdXTKJ/HSWlvcHu8f0hyGbxHcZtrjjnTmyNRXJSCkUkSBgOIXzd5Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757498279; c=relaxed/simple;
	bh=61TLtoIGR9LQtcXsdiShIrxYqugcvLx1LXnCVhfN0G4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8Wk+HpKiTWunTPpMGcQ0bGmKwlajmSkCei2tFSF0i/KN8Sy5yyVXYmp3mMihcUFLIOqeW4f+58XgGEFm0Y135jWWaoawxfDBowrrJRxRXi7ZYL9OjxaqB2oO1iOGtuQyKAyz2024DJWfdeFenqAi7kJhEIo2qT/6Bzqvk/t7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+CAFG6H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+CAFG6H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de1084868so19207945e9.2;
        Wed, 10 Sep 2025 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757498276; x=1758103076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RuMGDqPp6O3zCh9ckBElvKfHIEjOAq1YTWVPBtWfgPU=;
        b=C+CAFG6H+kXW4EeTgt9N+Cg0hqYTS/cD0uX5hk1qbwUjsSU7KyhFmqTz60o1sDCWSe
         n1vMDvZwWqJZucDw5NNHBgT4kLCHzYHJWI+0Dfauli7/2X7jeYW2MfwStSNftQ92L+80
         0vcTZU4VIowcCcejw3ElwlgqWcbSTDx1EOrvgJ4IrVdYA++PuvbIlf1TBvcZG5+Df3Ed
         wJLqiVnkp+B6eBf6fqr6sGB21VAMxaql5Frvd5yiZbedmvH+ItQiWaIFLQmuUq+Ezw4Q
         x4uZ2Pc1Nsl98QWwIt117OykstWX8niTDP726ESS6jgQtxFxW29HVhOESbceEjDcgGbI
         xE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757498276; x=1758103076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuMGDqPp6O3zCh9ckBElvKfHIEjOAq1YTWVPBtWfgPU=;
        b=T7rFVjBtnwR9WDfuUojzWaZLnZCdxvUQYrdyry0jZo+SUF2FoKCR9XpQENBfOkhYrM
         g5X1hq75RxKEMSqT7KzzTrg540h1vCEM2dP2m7THZTj5avdC1NB+sSdAQ2nk0kXqwPTR
         A24wXeu+eoTiwVetMAHdN1gyrlf5rhgpz43gNIrxUJrjm2wj7eb6/p9l2bTJPf6gahaJ
         9Yc0gbRB9P026jHoW/3OmvIBaBkWywPgWWJP26TlgPhxjQGumEFg9KfccgG1Dd3LFYul
         jINpzEFN5A20RR75NxHCHHpIw880fLFpQj6o/nb2/Dk91n2AMc5Y+xtld0Y8sk2XEqs7
         9bnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaker0g/H0IejwW1FjT3u4SHSjoneRZjs6iywWfhh+GP/ZQYx+nRellJmwVtDHxOR71DEYQZBmxTrGc/ynegXDRQ==@vger.kernel.org, AJvYcCXU7tM2wNGIxXdpa7TY1QhaLDtimNytZsnlNjmZV/Vhadr27+d/lRjHRhVMI6bngdbby7b5rklxbBMzJlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQlwxjeqIhnTTigcWzCavu4D86hEtqT6zkjywgu3msGfWe+fS
	7S99rdcK5AGq81+gLoHCHl53j8WAwDJqmshAICRGmOe9oQMMACR04y7Q
X-Gm-Gg: ASbGncv6tW/rIT3PGzOWw0ILwT2V9KpNxF/6YFIOObV31y6sNMlZlzO1LbQn44zxYzX
	t2OMGmGDDw6MTXNDZJD2DZUt8GeZRei3LFUswBYQCch8S26HEjwVWbsTFgj1SY/BjhnlQiIhqz1
	3M8HskX4eCtg7TR/cwGc8YZT4RC2gSf2KwX7n0A2X9t0dango8Q6bqHAmPfLLvC5BfG/zcq/b8S
	cjWX+97bMnbh0HYD/TbryqFZvYm9dT35bexNTzIhauwnS8MkWt7Jt56ybr8eBJyj0rmf082prNj
	NyLSLcUETpptxOoleAX3sY+LX+uHr8uG5N1bgdFUkf/0L5boPw7sYtV3nbKJ2/haLrGTjdXvvAX
	LMmLmIR+HZt0gGrNVyzjqRRtDTwshO2RzEQIrXARt1pz4+2JiZKWGHdhIAWUqAUn+ie4T+Ewv
X-Google-Smtp-Source: AGHT+IHJ4FVPPNV1CM9DnA1ftJB0zBlFiNItUpKglY2ydIcyhI27JlokKmL712d7YlJVv+f+5ztplQ==
X-Received: by 2002:a05:600c:468a:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45ddde8bc12mr145262075e9.10.1757498276066;
        Wed, 10 Sep 2025 02:57:56 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81e4563sm22201295e9.7.2025.09.10.02.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:57:54 -0700 (PDT)
Message-ID: <661a6938-859e-412b-ba28-dc6e56c39cf9@gmail.com>
Date: Wed, 10 Sep 2025 11:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Use
 for_each_available_child_of_node_scoped()
To: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250908044348.2402981-1-fshao@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250908044348.2402981-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/09/2025 06:43, Fei Shao wrote:
> Use scoped for_each_available_child_of_node_scoped() to remove manual
> of_node_put() calls from early returns.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   drivers/remoteproc/mtk_scp.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..b123698feb52 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev_of_node(dev);
>   	struct platform_device *cpdev;
> -	struct device_node *child;
>   	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>   	const struct mtk_scp_of_data **cluster_of_data;
>   	struct mtk_scp *scp, *temp;
> @@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   
>   	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>   
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>   		if (!cluster_of_data[core_id]) {
>   			ret = -EINVAL;
>   			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>   			goto init_fail;
>   		}
>   
> @@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   		if (!cpdev) {
>   			ret = -ENODEV;
>   			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>   			goto init_fail;
>   		}
>   
> @@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   		if (IS_ERR(scp)) {
>   			ret = PTR_ERR(scp);
>   			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>   			goto init_fail;
>   		}
>   
>   		ret = rproc_add(scp->rproc);
>   		if (ret) {
>   			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>   			scp_free(scp);
>   			goto init_fail;
>   		}

