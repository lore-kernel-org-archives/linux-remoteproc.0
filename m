Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08A9E7D0AB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Sep 2023 21:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbjIUVDB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 21 Sep 2023 17:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjIUVCo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Sep 2023 17:02:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A184EC8281
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Sep 2023 11:18:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50300cb4776so2313438e87.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Sep 2023 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695320307; x=1695925107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7aGXpKSZd0nkaqg7goI4xd52TS77NJzRSHYqFQggM8=;
        b=XdDDv9qxsbmOAmxt3P6zaQWYiNfMPX1XKM3aLLUxUMMRCF3TeWJUIbXwa3+6d/TMJV
         0XN+2SspHVUExIJNFybyyaR8JacnF6ZOWd74OsCm64ZTuT+dksPmB9e5WV7KqzvhM5l5
         Fx4FWBbHCj6xfn8vDmJIs2q588CVMEh1QbVoTlF2gsz9DOYKTILvoOnSS5BlNNM1FRty
         EpuS8tXwwEXcg91HtJJLnUuIc14wndDX+pLhgebqTbJiAqWp+QIWJs9e4Fg6GUers+6A
         Th9fhM+u7g/t44GlUkVXIAuK+TEMbZTUYOjjrThrKLEl1gKM6bj0bsGKRiGk7kRr33a6
         aNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695320307; x=1695925107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7aGXpKSZd0nkaqg7goI4xd52TS77NJzRSHYqFQggM8=;
        b=MTRcmv+/4W05kMBxs4YaAs4LiMd1cURrWFHdbObpicOCrJRiwJnRN2qAfwDOEQwSoE
         LDFElKz9tYR13K5eKidTi58Dw2/Ut62T362B1DNlPYxhHJX8rdfhHpE52DtFcFHIcdoL
         0A2uJydIsb/moFkabhhjGHSwiUQjWTEv2baQ1vrX9w349sFvBmxhT46ykXmVXCvUhYjN
         aD49EuagBg1sVgmr/Fpry16U5GOLTl6Opw/gEMSsJwg8wfEz8kFp4i3+Sz9OgYl1GsL/
         BBbqDmT61HVh2oxqr6K73JQEDiEsbexqdXeBpvBoImFxtUR3y/QcgQ0GW72lWC+mIRbh
         J+1A==
X-Gm-Message-State: AOJu0YyXBQlG3iph+qSo0HHBWGOs8QA5CRwYjHGdDloWu9Fx+Wq84c9w
        dXeCqmwQUO/HSWgGj6NLUCjTsikKLYZt2RsFik9Vlw==
X-Google-Smtp-Source: AGHT+IEUZqEOYV4M6SlzSpxNp5dBDgvjEldvmzJ6hEHHcdY4tYiha+4k/ZKwAc0oUEQlmz9ki3DsiQ==
X-Received: by 2002:a17:906:29a:b0:9ae:522e:8f71 with SMTP id 26-20020a170906029a00b009ae522e8f71mr3578502ejf.7.1695300691322;
        Thu, 21 Sep 2023 05:51:31 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id lz1-20020a170906fb0100b0099b5a71b0bfsm1002039ejb.94.2023.09.21.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:51:30 -0700 (PDT)
Date:   Thu, 21 Sep 2023 06:51:29 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     andersson@kernel.org, matthias.bgg@gmail.com,
        tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wenst@chromium.org,
        kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix
 retrocompatibility
Message-ID: <ZQw8UdZ9vhsrggky@p14s>
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

Applied.

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
