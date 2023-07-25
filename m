Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121E6C0015E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 Jul 2023 20:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjGYT76 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjGYT75 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Jul 2023 15:59:57 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1112688
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Jul 2023 12:59:48 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8ad8383faso45173985ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Jul 2023 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690315188; x=1690919988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCIAEkv+xo6a49Qxw52m347tO8F3UsV4ScqWgSVtBQo=;
        b=qF9waU9+2RMo/5zIqF66WCIqhSsv8BKJs/OYENeuVcblNZi/YbyvAY+j7734s2X7ku
         uTLI476KfO3Czm7k0elNhrBsmPKb/ToDS9X3WFxWoSRJUg2vIM7pQJT/rGgPjkJX5rN0
         K7gyMiXy6D/BVBkmUbWhuzaIJScKRgA1kLtpDWA7tpdIvv1cVzF9KkR6bmc5nYNCfrwB
         bploaPpfjsKEo+9F7nz9vD37aTfP5m28YvI8nv5V4V2AVYMn5ezFOM9Zx0Q3OSTzCYx4
         VAMhuLcBkgK4EhdG+szZZ8wKTzhtORVAEQRkNbLRrNoh4US57B+0xo9rtwv0PTYfyPf0
         vhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690315188; x=1690919988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCIAEkv+xo6a49Qxw52m347tO8F3UsV4ScqWgSVtBQo=;
        b=SZ49GG+IxdxXhuofq+U8q9V4f4VGeqjCg9zX3YA8FBTZgDz+ZRIKHNX5QU/YRRdvp4
         r3bMr26OCjNZEHXKyXpMLF1w616M/vKaYZIQYjnAcHE/5oe4FoV8mFTRnU3YgQtLAGDR
         NdDymY04qJdPAkWQb7zQ40ukgFJnRchfHQy6VSC2fE6ibr6TV83F/ZAHucGK2bTpyEQ+
         YWy0Eev+BmAAuURFaxCwgDPWPW3BXR+6zUKB/g0PHxlemky+UDUaVaWeox/5+MQplKRh
         ezCLU4VT9dh1gK45dv1YcmZD9IO6CYJ27+Z24al+QzLReJYfqZ355enK/1mUxCcX8sRk
         /ncA==
X-Gm-Message-State: ABy/qLYD2DkzicrqlwTd2LSE+rudfs3CBl90kEqrRmXKPbSzjbbHS89x
        gWSw0PjsfHx5p5C1uSZOg1IPMw==
X-Google-Smtp-Source: APBJJlF1l2EcR2KvAHiOLZNdxhN7VEpRtLbQN/aC9DJyjv6CyzU2xaQ3vc5pri03CX6P4rhkc43o6g==
X-Received: by 2002:a17:902:d2c4:b0:1bb:14e7:4fdf with SMTP id n4-20020a170902d2c400b001bb14e74fdfmr244864plc.22.1690315187915;
        Tue, 25 Jul 2023 12:59:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2116:2b1f:2fd8:ec8d])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902e9d400b001bba27d1b65sm4939667plk.85.2023.07.25.12.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:59:47 -0700 (PDT)
Date:   Tue, 25 Jul 2023 13:59:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v15 07/13] remoteproc: mediatek: Probe SCP cluster on
 multi-core SCP
Message-ID: <ZMApsFKHbj2WPLE8@p14s>
References: <20230721024132.6548-1-tinghan.shen@mediatek.com>
 <20230721024132.6548-8-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721024132.6548-8-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 21, 2023 at 10:41:26AM +0800, Tinghan Shen wrote:
> The difference of single-core SCP and multi-core SCP device tree is
> the presence of child device nodes described SCP cores. The SCP
> driver populates the platform device and checks the child nodes
> to identify whether it's a single-core SCP or a multi-core SCP.
> 
> Add the remoteproc instances of multi-core SCP to the SCP cluster list.
> When the SCP driver is removed, it cleanup resources by walking
> through the cluster list.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 118 +++++++++++++++++++++++++++++++++--
>  1 file changed, 113 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index d67dcabdab9e..34095a461e15 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -855,7 +855,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  }
>  
>  static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> -				      struct mtk_scp_of_cluster *scp_cluster)
> +				      struct mtk_scp_of_cluster *scp_cluster,
> +				      const struct mtk_scp_of_data *of_data)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -878,7 +879,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	scp = rproc->priv;
>  	scp->rproc = rproc;
>  	scp->dev = dev;
> -	scp->data = of_device_get_match_data(dev);
> +	scp->data = of_data;
>  	scp->cluster = scp_cluster;
>  	platform_set_drvdata(pdev, scp);
>  
> @@ -951,15 +952,15 @@ static void scp_free(struct mtk_scp *scp)
>  	mutex_destroy(&scp->send_lock);
>  }
>  
> -static int scp_cluster_init(struct platform_device *pdev,
> -			    struct mtk_scp_of_cluster *scp_cluster)
> +static int scp_add_single_core(struct platform_device *pdev,
> +			       struct mtk_scp_of_cluster *scp_cluster)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	struct mtk_scp *scp;
>  	int ret;
>  
> -	scp = scp_rproc_init(pdev, scp_cluster);
> +	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
>  	if (IS_ERR(scp))
>  		return PTR_ERR(scp);
>  
> @@ -975,6 +976,102 @@ static int scp_cluster_init(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int scp_add_multi_core(struct platform_device *pdev,
> +			      struct mtk_scp_of_cluster *scp_cluster)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct platform_device *cpdev;
> +	struct device_node *child;
> +	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
> +	const struct mtk_scp_of_data **cluster_of_data;
> +	struct mtk_scp *scp, *temp;
> +	int core_id = 0;
> +	int ret;
> +
> +	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> +
> +	for_each_available_child_of_node(np, child) {
> +		if (!cluster_of_data[core_id]) {
> +			ret = -EINVAL;
> +			dev_err(dev, "Not support core %d\n", core_id);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		cpdev = of_find_device_by_node(child);
> +		if (!cpdev) {
> +			ret = -ENODEV;
> +			dev_err(dev, "Not found platform device for core %d\n", core_id);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
> +		put_device(&cpdev->dev);
> +		if (IS_ERR(scp)) {
> +			ret = PTR_ERR(scp);
> +			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> +			of_node_put(child);
> +			goto init_fail;
> +		}
> +
> +		ret = rproc_add(scp->rproc);
> +		if (ret) {
> +			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> +			of_node_put(child);
> +			scp_free(scp);
> +			goto init_fail;
> +		}
> +
> +		list_add_tail(&scp->elem, scp_list);
> +		core_id++;
> +	}
> +
> +	platform_set_drvdata(pdev, list_first_entry(scp_list, struct mtk_scp, elem));

(sigh)

Why is list_first_entry() used here rather than just @scp?  What is the purpose
of using the list API?

> +
> +	return 0;
> +
> +init_fail:
> +	list_for_each_entry_safe_reverse(scp, temp, scp_list, elem) {
> +		list_del(&scp->elem);
> +		rproc_del(scp->rproc);
> +		scp_free(scp);
> +	}
> +
> +	return ret;
> +}
> +
> +static int scp_is_single_core(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct device_node *child;
> +
> +	child = of_get_next_available_child(np, NULL);
> +	if (!child)
> +		return dev_err_probe(dev, -ENODEV, "No child node\n");
> +
> +	of_node_put(child);
> +	return of_node_name_eq(child, "cros-ec-rpmsg");
> +}
> +
> +static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
> +{
> +	int ret;
> +
> +	ret = scp_is_single_core(pdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		ret = scp_add_single_core(pdev, scp_cluster);
> +	else
> +		ret = scp_add_multi_core(pdev, scp_cluster);
> +
> +	return ret;
> +}
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1007,6 +1104,10 @@ static int scp_probe(struct platform_device *pdev)
>  
>  	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>  
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
> +
>  	ret = scp_cluster_init(pdev, scp_cluster);
>  	if (ret)
>  		return ret;
> @@ -1101,12 +1202,19 @@ static const struct mtk_scp_of_data mt8195_of_data_c1 = {
>  	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
>  };
>  
> +static const struct mtk_scp_of_data *mt8195_of_data_cores[] = {
> +	&mt8195_of_data,
> +	&mt8195_of_data_c1,
> +	NULL
> +};
> +
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
>  	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
> +	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> -- 
> 2.18.0
> 
