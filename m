Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FD26F289
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767648791; cv=none; b=dlP02/4U6o77E0pCkR4hXxJiSQaXI5P52BrKGTEKwts7RfJQ89/hVpt7S/SZwj1Bs1BejYSlvcx3ZomO2mjPXIihoCuhdbscOegaMADJWGn9ezVo714qx8h6Wz5WpVruMI34kFmsyuLiji1XtDm5kumeW4Bi4ui7GJSTczoWLGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767648791; c=relaxed/simple;
	bh=hvhUDXBXFTeCKUmZ3PPiyizy7WDY2pKVeynkZQWs/3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5E2zChpgqO3j3UVwbY0K7UWLHLzYqZGKKaCLYS3QSvBQGh11kxVpILanKI8FgUmmraZ/uE886aX/SZoC0XR3MzSgTJLIfy0U4rgfv8vBAuVtnfeY2InpNqF5mCVKFziRuw2Q+NJKt7bojK7XREcypBLZRIrtNVuJoxssmlFEfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dwmwqqwp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dwmwqqwp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a1022dda33so2822205ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767648789; x=1768253589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=;
        b=DwmwqqwpwPrZBuZpUXL7qhjw4wuPyG8nk2goYk+zEKmmPGaTArGEtg4TnP4s8dTTA9
         Md3koDwEs0IuKJ2x1HuZ4yDrnGxmsFbTd1JZ3ehy3gNgprV3AhSLog8zkqODLIa8Mggs
         ZPLmRZgJGF4EgM5gV1ddR98JZSvJBRWo18Km7CNEbs+l1CVXgS0xA1pnPnQ0ZNeerDCg
         6oVUOUX6ceUN/C7i48wN2JyNvmohvTT5WmJgiCOjMGGNM9aI9wZODNpdgjRtLbDzN4sW
         yVOqXbFB4jGylzHY5+Lfx+KCPOnNoj1WhFF25j2mIch5G1r1ifjcS0y4a7uAXIk1E7CK
         PWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648789; x=1768253589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=;
        b=B+W7M7bltxsF6B3Vgmfi0bEcIf02evGbwO8Bwo0ba5eUkbU35ycHkTZ7UlI57bmuHg
         cB4Z2HfQpVQJLVogho85eOaMJfTS2vosmmwJ0HDLau8Gdqpr2K8QSQBhvAjAawQMLNiv
         itJ3iIL1qKU2j5nrNZS9WTAl7JSRafI/ZjaJIeR9yHrQ1ZnqSqp4Y5IVEUhc5RhJWKbJ
         nwiQe1t1yT0KDitb6ty3CcRfvm2ifjcQdADA9tTuy1WwxpGA+Fo/iShi8+XzdLNgbf5d
         y/FCoOV0Pd8+ye6JXMpJXjoW07JuMZNswqJo3QJSY16KwLtWA4Aqt6BGFTUw8SGaalEH
         vmlg==
X-Forwarded-Encrypted: i=1; AJvYcCWI+a6MJVb09KHyZfZVpiK3XjHayEBIwfTnduGZxEOwU65Px4GwqwIz/AXhyBt4D/0KKOzQ9HXZAGahN2WR+w//@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeI8dgkgmNXIDr2vlS3/1XNQyr4TWoYmMAh86qGQd8YtP4Xns
	n2DIudILcg3j44ou7yy8sgEPxzuasbjjA4sBe//rjjGypw74i0wKsCM//qG/KceNfh4=
X-Gm-Gg: AY/fxX72wF7fytzKiyQqNk5xnB40sLRa4dQPAxhBS3De6whQ4H9Sx3umuHBkX3Q4EfK
	DQNoExIgVlKwjTy5ahawhNCDM9qRukPSHedE6tm0LQCb65mFeaJMuWRemQvRhXYsZkTKyLGn8+r
	itfnWJzhwnApsaXN/1N6KzGrIr9WTzWLmby7um5r0WNPER5bIumQykj1/PF+HVb9RxL7Xk2k21J
	eOgVyD1oKd3n3pXXHc11wLTX8EgQc8K6Bu9EbwDUdvZFIH8+z/Mr7a32fytKz7SPVOzQcQvAbpl
	0Y095GzFmLE2Q+AZVgWNZogBg2cI9Xh4naiVj60JGgtE+JBqXQu4LGjbjp5IR74rG5hzBtzS+jw
	yq8HbMxyuxmkHE6vJwUZnT+bGEVcunIkqSU+jHcj2KVugv2F1D4ZkfuZlBqcO/7wJNknRW2RzBU
	wi93mHGqDJVrPdlQ==
X-Google-Smtp-Source: AGHT+IF0bVODhApERlsNCQrrCwCXh5Bc7cgqZB6OPyCG+4xaL0MSIbArxA2Sg2gVDzhacygsGqC4xA==
X-Received: by 2002:a17:902:fe04:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a3e2cefe5fmr6801155ad.31.1767648788754;
        Mon, 05 Jan 2026 13:33:08 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a512sm1849275ad.10.2026.01.05.13.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:33:07 -0800 (PST)
Date: Mon, 5 Jan 2026 14:33:05 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] remoteproc: mtk_scp: Simplify with scoped for each
 OF child loop
Message-ID: <aVwuEZCAjscaZs7m@p14s>
References: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>

On Fri, Jan 02, 2026 at 01:48:28PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>

I have applied both patches.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..328541e62158 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1287,7 +1287,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct platform_device *cpdev;
> -	struct device_node *child;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	const struct mtk_scp_of_data **cluster_of_data;
>  	struct mtk_scp *scp, *temp;
> @@ -1296,11 +1295,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  
>  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>  
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		if (!cluster_of_data[core_id]) {
>  			ret = -EINVAL;
>  			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1308,7 +1306,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (!cpdev) {
>  			ret = -ENODEV;
>  			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1317,14 +1314,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (IS_ERR(scp)) {
>  			ret = PTR_ERR(scp);
>  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
>  		ret = rproc_add(scp->rproc);
>  		if (ret) {
>  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>  			scp_free(scp);
>  			goto init_fail;
>  		}
> -- 
> 2.51.0
> 
