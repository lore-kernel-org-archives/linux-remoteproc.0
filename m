Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A50205E01
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Dec 2024 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734367879; cv=none; b=j1yAxjXXU/Af6Q5xDkp5qYlnD2eZKtCbHrAaa9Vu2qga1RcUXDPq6VXdoT3bphQSKmjjp46SZUQZbU3u7n8U0V0uPzRinb0N8v4gUy+iKgtotLVJ7N+gpU95DsDDlgZye8NsURvZklh8v3O1GS8P2xSms/VHB8k97NiCGgfMD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734367879; c=relaxed/simple;
	bh=qJWpvMvaRyRncie5h9SvPMSV7VD+M79aQruQQoCxMhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGSazZaKZacxYa6G/A0mFJRdriiiQXAQtyV9af/QyAEhapF8IEkJYT7w630qzJKqTBMKxRdmdysWEycgVMAfHeSmbMVAMAqEh4Ysyt4Ff9feLhZuqefSsDxLYhlrS3Sd1ZeEEqTPLm8y22rp0w1OLGXoN8AQOdAasa8vYRSmz2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUHx6vXo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUHx6vXo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21661be2c2dso31627965ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Dec 2024 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734367877; x=1734972677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=;
        b=SUHx6vXoeJSNzsZ9GfSzXqFOh/aWEPLxD7gtJNhH080rLWxCbwITDydd45Sqthk7CX
         ijETNMdMUSgInsEag34xlN6slqBfxsX27b9zhRPVa3e9Gr894XKOweBpLpKy9Lonnv9j
         wLhvh6+nQpnOptHrBQD1ALyZ0GbZs7yz2pSEI6tMIvbIzy3iZjSyk+ZNC340taplG1D4
         NCzlZBs6kF3gWMzEvldz5BrxfEcaLe56yWjexEPIq1GZk8If6JsdVJXmG4GgA5bpLJ05
         jRvO98uCxhQFWOH27/L1zRm/HndLzZzVIk3I0K1drHOlqUvRnL/pDezAQa4E6qYyZo1A
         VC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367877; x=1734972677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=;
        b=bOsAF3wQhokNMmYP+t5knmZgQTPOXbk06buMifqvnozaCpBAedPKeRA5ZKdT90kbh3
         1zTYSb0d9HwYR/9s2Lg5Frv7CvRCQLXUUpH+0zdKe7azkU0yL+fD8ZoYcMEY0qReOpnp
         inSftbbPo/AdtGkIF+HHTzut1AXLeTp5s0rDFL9saPbjU69HUKlWC/Z+MeuYjaUZS89W
         Wk9z+au78q95DSrukt94ZWz87ty0udkXM81LFCcM1X+C1wE5InvoPudwOS0JosSvAZZE
         DCI9fV0FwzsFhvrSIWK2KO7lSB9N+Kvo6RGrdp9YXHwmWSL5QjnEhWUWKnO8+UV7Lg66
         JJlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdOYFH1rsxY1jdmIl+IhvbNEJ4inbvaYCUprfP8JfpWHayWhKbguHlnCucIfZpALM5CQBNiOKj9+s/1K2kQmUW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19AqN3WtZFmG6zthA+l7HM3sAJgPDSluPby6ZlJeHZEVNmd9U
	KZa15tgPs2MS1bN64Svat0q53ImReLp4J3E5p7gAJNmlyhfSHufpoX5TEux3XjI=
X-Gm-Gg: ASbGncso6vLdHo+IENYZTeg9Lr6rZu83iBT3bigbhx7Kf8PbWNVits716HHaGXHLGJ9
	ycFzlxx6ooLt3lIcW3Mc80cBFDQKFzKJGEun5d9eyOSbkKYoXMkhveIHQYi7AFWqLUGSuPFWNMV
	VanU5e9RPMIK/TFYkP45QuCWMJtmbD2/Gl8HpM8PvtDbt0/uCePYYEXRVUetfABWRpP6cCgV/2b
	xQwnjdYXbHxY2Fuh+t8q2BSM4SDOqEjIa14YsurE+V7zpOFeK1h8+hD5zyS
X-Google-Smtp-Source: AGHT+IFdkBr1xidp7KbBA40XTCMNem9kWeuB09hpRbnYxb2m5xLWJETb06A1ncuzZHM9HfB1Sr5h4g==
X-Received: by 2002:a17:90b:2e41:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2f28fa54f64mr20741065a91.8.1734367876736;
        Mon, 16 Dec 2024 08:51:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:13e6:498b:6054:9f90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e500b8sm43931565ad.123.2024.12.16.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:51:16 -0800 (PST)
Date: Mon, 16 Dec 2024 09:51:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Only populate devices for SCP
 cores
Message-ID: <Z2Baga9gSFLlmXll@p14s>
References: <20241211072009.120511-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211072009.120511-1-wenst@chromium.org>

On Wed, Dec 11, 2024 at 03:20:07PM +0800, Chen-Yu Tsai wrote:
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
> Changes since v1:
> - Fix commit subject: populate devices *for* SCP cores
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

I have applied this patch.

Thanks,
Mathieu

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
>  	mutex_destroy(&scp_cluster->cluster_lock);
>  }
>  
> -- 
> 2.47.0.338.g60cca15819-goog
> 
