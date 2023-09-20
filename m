Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85505CE79D0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Sep 2023 13:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbjITN3E (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Sep 2023 09:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbjITN3D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Sep 2023 09:29:03 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C603CA
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Sep 2023 06:28:57 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9adca291f99so694536466b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Sep 2023 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695216535; x=1695821335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKKE8RPYAnWlMmqVMLxDoN9viEYmRbfdJ1ZPSe1owbM=;
        b=mkjtQWNOYZE3Z/NEYSqYX08XnqIq8jkkLKlKtXEIskCUgEpKf2Gyh/TKkbvdER2ydU
         SZT6xzJn6SN2TVt9NY9Gws3ZdQi/fPHczmcDBiT3fJTL9uhM8uVP3Z6/xb7wjXALB//o
         EphpyGHbyFWHC1UVpVjL7jaDPfqc3bhh4AynArEWd8U9kW0WZxesyXMlepbgT9voY4go
         F1RLl0j0+43szoYRfl1etPh1qAF9kZez8qdI5dogTO5lM8kqGwdE6COGBkuj6v2pJum+
         P9omN2WYKjbfKCvdjKfTi6AB3zW/e2pWl+TxaHIGNgHf+vg4sQ1iuNf8mCDnF+UiFxDj
         asqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695216535; x=1695821335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKKE8RPYAnWlMmqVMLxDoN9viEYmRbfdJ1ZPSe1owbM=;
        b=wscfzm3mVhScGxQx2PoFsPQPKxfcXzL9/FuQ2ep+Y/Npn637rRjynvod7hw+HeNyLP
         zKt6g/vK46uTaHN40b7T+nOotaKTpWjNkgniSKWWGwmh5DgI5FcYPAikBBGa4UYcpU0H
         IlIgf3vxrcbQFrdJkdEji7/9pLv6bZJhTEVqE1L2tTYj6idKNjOUTMy0tCj8Ye5o+ou2
         S8b9u6b/htQt/ZHnJnV/huRFRdUhjk0BG+3tMT4euQWQwQBunwrZ2FjS96nsIshcsvsb
         jb1EdtjNBoAwbvC5AfWE7p3GUerCfYNNxvrNJdkyMq6sfwOEWqvN0F0MmOItCeO6aBPv
         6KtQ==
X-Gm-Message-State: AOJu0Yz/M2uLZk3R72kHCZbacNl70XH/A9rxs8kKVZdT9dWRFIgxEuYT
        WheBEfE7HD4HiKqgvZpW0HtxCw==
X-Google-Smtp-Source: AGHT+IEMb0ZK8g7jPPFXjiWmXny/RUobbu8OKSNXezHxqkqePH36qIeLezlT4sN2iWm9Y9gneehnUw==
X-Received: by 2002:a17:906:23e9:b0:9aa:209f:20c3 with SMTP id j9-20020a17090623e900b009aa209f20c3mr2062185ejg.68.1695216535584;
        Wed, 20 Sep 2023 06:28:55 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906560a00b0099d0c0bb92bsm9237058ejq.80.2023.09.20.06.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 06:28:55 -0700 (PDT)
Date:   Wed, 20 Sep 2023 07:28:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, wenst@chromium.org,
        laura.nao@collabora.com, tinghan.shen@mediatek.com
Cc:     andersson@kernel.org, matthias.bgg@gmail.com,
        tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wenst@chromium.org,
        kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix
 retrocompatibility
Message-ID: <ZQrzlcVpvYUY11G5@p14s>
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 19, 2023 at 11:23:36AM +0200, AngeloGioacchino Del Regno wrote:
> In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
> instead of the newer "cros-ec-rpmsg", but this driver is now checking
> only for the latter, breaking compatibility with those.
> 
> Besides, we can check if the SCP is single or dual core by simply
> walking through the children of the main SCP node and checking if
> if there's more than one "mediatek,scp-core" compatible node.
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 

I find this patch to be the most appropriate to fix this problem.  Laura,
Chen-Yu and Tinghan, please test the patch and reply public with your Testeb-by
tags.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ea227b566c54..a35409eda0cf 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1144,29 +1144,25 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	return ret;
>  }
>  
> -static int scp_is_single_core(struct platform_device *pdev)
> +static bool scp_is_single_core(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct device_node *child;
> +	int num_cores = 0;
>  
> -	child = of_get_next_available_child(np, NULL);
> -	if (!child)
> -		return dev_err_probe(dev, -ENODEV, "No child node\n");
> +	for_each_child_of_node(np, child)
> +		if (of_device_is_compatible(child, "mediatek,scp-core"))
> +			num_cores++;
>  
> -	of_node_put(child);
> -	return of_node_name_eq(child, "cros-ec-rpmsg");
> +	return num_cores < 2;
>  }
>  
>  static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
>  {
>  	int ret;
>  
> -	ret = scp_is_single_core(pdev);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (ret)
> +	if (scp_is_single_core(pdev))
>  		ret = scp_add_single_core(pdev, scp_cluster);
>  	else
>  		ret = scp_add_multi_core(pdev, scp_cluster);
> -- 
> 2.42.0
> 
