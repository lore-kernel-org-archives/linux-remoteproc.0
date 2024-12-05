Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460621D588
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Dec 2024 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417268; cv=none; b=uUM32IDSFPuy4pEgiBto5TS2AXKBHamLoXt3qebSTKdnTVhgVx/pezQYbSjaq89NHoSPy0uqTlSzfGnMu1hmaERlEVMa85i5P4cmrzn7ICoHMqwlsA4wXQn5/ooT84rD2H8aZn/0EwQNcU5Y7jvzOCVqm9/ztAO9skPYWBaHGf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417268; c=relaxed/simple;
	bh=IQ/HGqC2oOZDUVKenCFCVNfvlZ9uRU2FlW6Axzv+8fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWN/NgiOCDZhBqB5X6nzkdz83VPyXmY7rbjQJAVOul/mG2SVRQh++CDLsY2PfRBhYLcOxmvpNGMtyHNs5BLhBo6sTKrX77eNRWyxXXgvJ5+x7GCmrSNhogtd7KSNxryx/mOkf+UTBbxZhq4xBs7H8juFaPi9C27RgVpSIIVs3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fcl+UDwF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fcl+UDwF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so1046725a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Dec 2024 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733417266; x=1734022066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=;
        b=Fcl+UDwFlfPaRNg6DgOueZOabHX5Mzj2OrS0QgksiQpp8V1zfn/LMI+xIEXpUnDyHU
         RsRuBOBAWe5OavhdSrQFkClcduzGKI3QlVbPimsjrz0W72PG5sHzKlXMxQjaDCfXmuZP
         lpfd3+j3+G8vnImYoJN93BcrcJ9cgc6mpYvc8+RApu0MwUbQz/nQcPc8n2UKE+paUR6L
         tVNjnQd8WXJ2lYguObG6tgDvM+9+aNFJEXZQgw+RM05OSbPbf8t9KwXgLVcurjcuv1Ce
         IFSpoyAo/4v6dGswA1jn7FiOv4aWaZYgT41fY5p5KfczxBagxmqurQv1BMLe1V7yrg+H
         3JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417266; x=1734022066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=;
        b=ejePXxV9UJ5JCYVl0i0QrtaRvrkBR0e/UEAqpS+pWm4LQN6jrI2u+EDT3wqoXDkqGr
         GGhQO8gXawYahTSGdCJdGMxmT11XEd9cTNk/lvml3lAvrrRhOXM9XBaPNoRcab5PVacC
         T6oJXG0Isv9KN+cajRnCkvXbGiGJ3skYE//tqOzNdROCbIO732TR/XUfw9S56BeDiafU
         HLlpefJJ79G0XXZGQMZfm9pQoOArol2FrY5gJ4zaR8LJE6YH8iirioJxSds+lxHWMjI+
         jKEp/3hXEeSynuKB0XLS2pBwA9gQgbKEsDF5S1PAZ9ocrT4mwvXIUVAoAed5EEYD7LQG
         B7dw==
X-Forwarded-Encrypted: i=1; AJvYcCVO+AaPky0yg3HBH3E7jc6ZmJ7w/ZRgmWDEsRjMBZE/9Ot1HY3zzUeBaTjmK3Kzvw1hFE+zVL+YbcGUUQPZcDTV@vger.kernel.org
X-Gm-Message-State: AOJu0YzuYcZMjlqm7T+22jmtXNRhi+1whwWEFT9kLdmsh0lfUokIfK2h
	q5dXaoi766vUsORXyjCVhVLSJ3dTbpbCDP7cVGjCLn3SE+S50jgOYtpxU6gFDnE=
X-Gm-Gg: ASbGncun8f/Hvb0Bppp7RayZZIi8gLEmQwCzoJmr78CNOxnnqC51y4GtjNXGU7beIHy
	7HxGKVQ1SNL8nKN5qk8rw9C8bSX1jynCKGUP5HKAm+SGxWBMP9bb0RDMYAb78PbEIxh3jDX0MIp
	jXqqti+7z1jrzc2Hud8mSOAIMrexQkwB7FaoAkY2EMO7HlZtQf2EXtrmH/k4OcM9a8owyAJ2b49
	QjucODEwLI5E8nTF21ifbKWnSqcwz9EI33K909EWekCaruuZg8nzVEFZg==
X-Google-Smtp-Source: AGHT+IHfdbN7q7iMS+18SQtbAa3CGAk6K7rAAw0BzwESRhSc460Et6yhn4diWwlO/9cKamVNlnvLvw==
X-Received: by 2002:a17:90b:1d03:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2ef011fbabcmr14575579a91.11.1733417265830;
        Thu, 05 Dec 2024 08:47:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cdba:9225:289d:fd74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff780bsm1605849a91.42.2024.12.05.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:47:45 -0800 (PST)
Date: Thu, 5 Dec 2024 09:47:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
Message-ID: <Z1HZLq4iJQGmKDgM@p14s>
References: <20241202062826.66619-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202062826.66619-1-wenst@chromium.org>

Good day,

On Mon, Dec 02, 2024 at 02:28:25PM +0800, Chen-Yu Tsai wrote:
> When multi-core SCP support was added, the driver was made to populate
> platform devices for all the sub-nodes. This ended up adding platform
> devices for the rpmsg sub-nodes as well, which never actually get used,
> since rpmsg devices are registered through the rpmsg interface.
> 
> Limit of_platform_populate() to just populating the SCP cores with a
> compatible string match list.
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Cc: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..8206a1766481 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_clus
>  	return ret;
>  }
>  
> +static const struct of_device_id scp_core_match[] = {
> +	{ .compatible = "mediatek,scp-core" },
> +	{}
> +};
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>  	mutex_init(&scp_cluster->cluster_lock);
>  
> -	ret = devm_of_platform_populate(dev);
> +	ret = of_platform_populate(dev_of_node(dev), scp_core_match, NULL, dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
>  
>  	ret = scp_cluster_init(pdev, scp_cluster);
> -	if (ret)
> +	if (ret) {
> +		of_platform_depopulate(dev);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> @@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev)
>  		rproc_del(scp->rproc);
>  		scp_free(scp);
>  	}
> +	of_platform_depopulate(&pdev->dev);

This looks like a sensible addition to me but I'll give Angelo some time to
chime in.

Regards,
Mathieu

>  	mutex_destroy(&scp_cluster->cluster_lock);
>  }
>  
> -- 
> 2.47.0.338.g60cca15819-goog
> 
