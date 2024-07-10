Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94659194135
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720626997; cv=none; b=TCmFK6tr0f6RRnKQu8BxqZYw/itdg7xad2kkMc+Eemd790R90ZlNKtKuvDKjuo5133OK9YYAtnmc3wxXE2zbq7/f5DTCN0LgpqgkeHwCO+2TKcl1itsjqCvqMSpiqpAGoeYDFZogoZ9jQD0ruFMOph6HyMIQy2gPvEy281C/9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720626997; c=relaxed/simple;
	bh=kZ4X/X7uweqQlVqpnE7kg/TNuLAZPIXBexv3MMulPcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP3fncAAIq2L52CdPw6OfvwVLAfTkS3ugTRjiOGXqWuXBp05P5rgPdVjTHSnlOvVX6AwtsoKa8fRNKphXuXxfcLrNKKFuAu8JcQOfQhfhg3KRjz2YfrTO9rcxWDBWyJ6Lqvr6fHryOmfVzg+DIhnn/ugzjneQNrK0R+XxWkyOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xdTbbfyf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdTbbfyf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c9a8313984so4416128a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720626995; x=1721231795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBj2YmtSTrFPZPUbLzrldXTaT0nXgCHgIoklfp+Mzk8=;
        b=xdTbbfyf3cZrh4Gq6g7lHD/zJkP5S5lF5naGD7NQBYy7jeAtkfBuah17bt7YuonDYx
         cgBZly9KBPi/KoK93HOcBRjdz0EbBYiSdIvsxHIlOjMKA518OUlLzuP+u8RjwN8xwvmB
         ompwQ2+GCArt/riX+lzcK8FMxuy+JUXM6KCEMFK+az1HGlU+07RPbXfr3A9eijbF5dFA
         +pfob5rXTwLwaV3cGZ+g7HQBvZbTqhZ5FAu8qBQkYGvvC3b9CuFdWwjiLk4UHkS21/Zb
         wmH1achojxWOxrCsMCIhj8Sg0rOVH0iKl4QS/wnXpmVYYrhFrj1e+lxVtLyb+6hzGsuv
         9ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626995; x=1721231795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBj2YmtSTrFPZPUbLzrldXTaT0nXgCHgIoklfp+Mzk8=;
        b=OplFaioJH1JQfK/G2zA1bigKl+43NiCMgFbXyFMgFGGHddSZ9vIOr2r0sNCErQ+Ksx
         CH0GAKVAabxoqMQwMKyCIUHPWlgwhoGXmZy0ni0FXWxK8/0lfASr0sAnho1y+WuBCfep
         hmaBI3wkH6J1Npixp1n+UBdiwkPz1iJ1mkxpRNGDd+9qFtdo2Wjcywpe46DbN8Y/QFyI
         WIVq7tuqDihsOr1PuvX83BNQuyRs+h0Rrw4tylLPlBxGRhciy25Nsdbdem086zLbV4Ds
         anStKvNEovcDbD+CUAQA7ZWan70KnsJjiAO8vDgemTPkAfK6IG2ZOMAtJxEhsHy5D9hr
         9GBg==
X-Forwarded-Encrypted: i=1; AJvYcCXryMruNBJRoSFI9Do+wQr7zlzS+M710I2ZPJhUurTZ7EIWacR/qVl/65S9PECI8LMKDQVIqparENriCVXLnBfrv3XGa5SQvWWoVqF9Z8K3uQ==
X-Gm-Message-State: AOJu0YwLqkyOZEDwPFsU0StEU2TncCYcyTjLcge6sP5HZG8kpdUy6JtW
	ZGO4/htjM09GQ0lq7Q+2J4z4wT40eXtJlmnzqrAQ8Z50Yvs8MhhRKMuW4GJQrs4=
X-Google-Smtp-Source: AGHT+IER42wfBDvYrn5WVV2tIZB6J3uCihrTxDQpbbWz7C02veVVpbReOeakDmwhl/pQRtvuZYvxfA==
X-Received: by 2002:a17:90a:c385:b0:2c9:66d3:4663 with SMTP id 98e67ed59e1d1-2ca35d58971mr4748875a91.43.1720626994926;
        Wed, 10 Jul 2024 08:56:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8408:4ecd:288d:848b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca34e6fc0csm3985584a91.21.2024.07.10.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:56:34 -0700 (PDT)
Date: Wed, 10 Jul 2024 09:56:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shun-yi Wang <shun-yi.wang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
	teddy.chen@mediatek.com, olivia.wen@mediatek.com
Subject: Re: [PATCH 1/1] remoteproc: mediatek: Support multiple reserved
 memory regions
Message-ID: <Zo6vMPaefxCaDe7D@p14s>
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
 <20240703115308.17436-2-shun-yi.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703115308.17436-2-shun-yi.wang@mediatek.com>

On Wed, Jul 03, 2024 at 07:53:08PM +0800, Shun-yi Wang wrote:
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
> 
> SCP supports multiple reserved memory regions, intended for
> specific hardwards.
>
> Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9ecd5ea04b5f3..1902826cea0af 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1006,22 +1006,31 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
>  
>  static int scp_map_memory_region(struct mtk_scp *scp)
>  {
> -	int ret;
> +	int ret, i, err;
>  	const struct mtk_scp_sizes_data *scp_sizes;
> +	struct device_node *node = scp->dev->of_node;
> +	struct of_phandle_iterator it;
> +
> +	i = 0;
> +	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
> +		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
> +
> +		if (ret) {
> +			dev_err(scp->dev, "failed to assign memory-region: %s\n",
> +				it.node->name);
> +			of_node_put(it.node);
> +			return -ENOMEM;
> +		}

With this patch the code is out of sync with the bindings which are still
specifying a maxItems of 1 - please address.

Thanks,
Mathieu

>  
> -	ret = of_reserved_mem_device_init(scp->dev);
> +		i++;
> +	}
>  
>  	/* reserved memory is optional. */
> -	if (ret == -ENODEV) {
> +	if (!i) {
>  		dev_info(scp->dev, "skipping reserved memory initialization.");
>  		return 0;
>  	}
>  
> -	if (ret) {
> -		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
> -		return -ENOMEM;
> -	}
> -
>  	/* Reserved SCP code size */
>  	scp_sizes = scp->data->scp_sizes;
>  	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
> -- 
> 2.18.0
> 
