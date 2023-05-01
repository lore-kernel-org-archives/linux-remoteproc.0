Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FB2C77B73
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 May 2023 22:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbjEAWEu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 May 2023 18:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjEAWEt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 May 2023 18:04:49 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7441EB
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 May 2023 15:04:47 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64115e652eeso30131376b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 May 2023 15:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682978687; x=1685570687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33Bampzsakr/crgaHJHp7xndLeMaLgrKD7UUnUyXAko=;
        b=GTtx/EwB6OUDEm8F2BtQvDHv5sn8Kro2jtft5Adv1xbkUy2WH8HF+eYehd125z4f64
         IJaWG+nbFQ/1M9Gc2PZbGCpSW5oKvjXFujb/8VFTnXuEIMfWV9MXZ9rFMZLCBLtGddUy
         MC55SCFqK7QVwhVuh3/kD2XQ2VVmcqy3gPpzJLqDwau4cw44GLASADAW1peFlMNfyiPD
         ceF2ly963ol1VnTQDjsbtXBUS0Ym+GDua/UAFx/hgemxAMvjoeCAM90yoaA3/y4rCXqC
         DWL4wb9n1q0z1fqWr1+LL+HpmZ5vC3bjtcDlepW+rdLgNKD7F6vOBeieDTOLAgHwK1di
         9/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682978687; x=1685570687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33Bampzsakr/crgaHJHp7xndLeMaLgrKD7UUnUyXAko=;
        b=Y5ck5Zxyq6vbanx/Qj3UDxJEPVXuxMzTBtIpEBhsIV4Wqog+Oh3pEhV7r9Wa8hSe74
         UwyVg+RguPf52iyynbWiwjoEvHjB9wIL5SU1Zbn2ZFLcWSnSYOV6OdfUhqSt0HPsDaf0
         sStC33dIiXfAKgcXMsAbFciophvbiRK+to1UNJFTVvHd3FgNgR5CJnJ8KpYRRT7/OSJr
         gGvM+PdmtdP4uUDg0jW9gDybFa/Q0eqUjAayrIxTwYNfn4zGp2d2AIK2dr7WXOK0z7fJ
         XHeBViGyyG9dWa44rOXl1qZK7Qn8F8gxuxGvxa0hBmvMtwKleIC594F+fSf2ARMOH5mh
         MbZw==
X-Gm-Message-State: AC+VfDwoTstTmdSgYM3a/Mx5xzLFHuACQT4XP6b1SpknZWpgcFpzYUVC
        bnMz7fAm86uxKE8ZDJxnszZl9Q==
X-Google-Smtp-Source: ACHHUZ72ooUKVcU7aFvBu1kP8+O/eJEXa3RTieJH4Q+j1jZFthIAARYtWggVORzWo0ofK7MnZRvv7Q==
X-Received: by 2002:a17:902:f688:b0:1a6:4c2b:9e7f with SMTP id l8-20020a170902f68800b001a64c2b9e7fmr24094525plg.1.1682978687024;
        Mon, 01 May 2023 15:04:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2609:c92d:9942:6f79])
        by smtp.gmail.com with ESMTPSA id ge14-20020a17090b0e0e00b0024e069c4099sm1769200pjb.46.2023.05.01.15.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:04:46 -0700 (PDT)
Date:   Mon, 1 May 2023 16:04:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v10 05/11] remoteproc: mediatek: Extract remoteproc
 initialization flow
Message-ID: <ZFA3fAeBV7T35Fkx@p14s>
References: <20230426091211.21557-1-tinghan.shen@mediatek.com>
 <20230426091211.21557-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426091211.21557-6-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Tinghan,

On Wed, Apr 26, 2023 at 05:12:05PM +0800, Tinghan Shen wrote:
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reused to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 69 ++++++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 2bf66b1a8d80..5e4982f4d5dc 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -23,6 +23,13 @@
>  #define MAX_CODE_SIZE 0x500000
>  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
>  
> +struct mtk_scp_of_cluster {
> +	void __iomem *reg_base;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
> +};

This is a good start.

> +
>  /**
>   * scp_get() - get a reference to SCP.
>   *
> @@ -855,10 +862,11 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  	}
>  }
>  
> -static int scp_probe(struct platform_device *pdev)
> +static int scp_rproc_init(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> +	struct mtk_scp_of_cluster *of_cluster = platform_get_drvdata(pdev);

1) Because of the work done in the next patch, I think a "struct
mtk_scp_of_cluster *" should be given as a parameter to scp_rproc_init().

2) I would rename of_cluster to scp_cluster.

>  	struct mtk_scp *scp;
>  	struct rproc *rproc;
>  	struct resource *res;
> @@ -879,6 +887,11 @@ static int scp_probe(struct platform_device *pdev)
>  	scp->data = of_device_get_match_data(dev);
>  	platform_set_drvdata(pdev, scp);
>  
> +	scp->reg_base = of_cluster->reg_base;
> +	scp->l1tcm_base = of_cluster->l1tcm_base;
> +	scp->l1tcm_size = of_cluster->l1tcm_size;
> +	scp->l1tcm_phys = of_cluster->l1tcm_phys;
> +
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(scp->sram_base))
> @@ -888,24 +901,6 @@ static int scp_probe(struct platform_device *pdev)
>  	scp->sram_size = resource_size(res);
>  	scp->sram_phys = res->start;
>  
> -	/* l1tcm is an optional memory region */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> -	scp->l1tcm_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp->l1tcm_base)) {
> -		ret = PTR_ERR(scp->l1tcm_base);
> -		if (ret != -EINVAL) {
> -			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> -		}
> -	} else {
> -		scp->l1tcm_size = resource_size(res);
> -		scp->l1tcm_phys = res->start;
> -	}
> -
> -	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> -	if (IS_ERR(scp->reg_base))
> -		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
> -				     "Failed to parse and map cfg memory\n");
> -
>  	ret = scp->data->scp_clk_get(scp);
>  	if (ret)
>  		return ret;
> @@ -957,6 +952,42 @@ static int scp_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int scp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_scp_of_cluster *of_cluster;
> +	struct resource *res;
> +	int ret;
> +
> +	of_cluster = devm_kzalloc(&pdev->dev, sizeof(*of_cluster), GFP_KERNEL);
> +	if (!of_cluster)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> +	of_cluster->reg_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(of_cluster->reg_base))
> +		return dev_err_probe(dev, PTR_ERR(of_cluster->reg_base),
> +				     "Failed to parse and map cfg memory\n");
> +
> +	/* l1tcm is an optional memory region */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> +	of_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(of_cluster->l1tcm_base)) {
> +		ret = PTR_ERR(of_cluster->l1tcm_base);
> +		if (ret != -EINVAL)
> +			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> +
> +		of_cluster->l1tcm_base = NULL;
> +	} else {
> +		of_cluster->l1tcm_size = resource_size(res);
> +		of_cluster->l1tcm_phys = res->start;
> +	}
> +
> +	platform_set_drvdata(pdev, of_cluster);
> +

In scp_rproc_init() pdev->dev->driver_data is set to a *scp, which
defeats the purpose of setting here.  Once the driver data for @pdev is set, it
doesn't change after that.

> +	return scp_rproc_init(pdev);

Function scp_rproc_init() needs to return an *scp and that scp needs to be added
to the list of SCPs in scp_cluster.

> +}
> +
>  static int scp_remove(struct platform_device *pdev)
>  {
>  	struct mtk_scp *scp = platform_get_drvdata(pdev);

This should be:

        struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(pdev);

And then iterate over the list of SCPs to remove each scp.  That way things work
the same way regardless of the amount of scp in the system.


> -- 
> 2.18.0
> 
