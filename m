Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98355C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 17:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1880A22276
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 17:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CcFt0Pm9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgJSRs3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 13:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgJSRs3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 13:48:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B663C0613CE
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 10:48:29 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id j8so176456pjy.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dso7M3xII/d9TKbRCRuszeJJswC1SL7FTDyN4dGwTeo=;
        b=CcFt0Pm9mjjVEQ7mkd4yCYWpK9UuRSpK/ijbWer/u18VicXWAzXN8uOKKepO6mSiWg
         dl4kNqKrIpENjIttY26O6QQ3pk7Qv3rIMfKunOqaSxEK/+Mad9Pf3mBziVN6jqjr525N
         0MEi/M5JZFFOZGw1HRw8yjKhgbvhEHdABHMsyuw/88QNCTDe/DLDnl3o9T42ZDnTZyV+
         AXVS7bq6dhmY1oNUzbCumllcEgbervieVv2+0Gv7N0crTg1vSP3JeFFjln3XSmZREiM/
         TBFg12toP1BM7DznumODy6jZR45zDLYBrhF4Xz4+gcnaRJ1ar3U2W3mbbhMCyPDZ4uFU
         Ed4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dso7M3xII/d9TKbRCRuszeJJswC1SL7FTDyN4dGwTeo=;
        b=bZVupW6nXX050wcD0iEky7pY49cKknw62eN4yqgCqLGvLD/r2yQC3rKKzapfeFZiIz
         AkouvNgADPvHxi9DyAqde2ZBWarN3duvu3Hw61L6Yk9QJs6r1PxlggcuLSVgj7x16Un/
         jgzEU7PoOHsbm/o4gKswUIsA8JhjRHnRE33LDdoXT9dXjLG7WXUPjYfVD0wUwh17sueW
         ATf9K3Spfe2+bLsZAsJC2VkNCw5EKtJy2LawYSaW2BrtrChsdDwHpqpnEwbDjy1dR443
         WrP2xrQ+1YiyLEXYnH5c/UoquNrU12fmqDHq64QBp8UVfSgsrbn5Lhx9SDtDq7DMnPCm
         FtMw==
X-Gm-Message-State: AOAM533Cviu1/N0HoBWQ2nQKheOBhpN4ptQvpO9kH3Oj0X9JEZya7uvN
        uXEnQB7YajtQgG3NMC+aWX1qIg==
X-Google-Smtp-Source: ABdhPJxGOjlveq0QvBQshUJ3ZRbENBe+0PU1D2L6KI4JoW1bo3CSLcSYGypzIiOaerFdzfE632l6UQ==
X-Received: by 2002:a17:902:8f82:b029:d4:bf4f:13da with SMTP id z2-20020a1709028f82b02900d4bf4f13damr921208plo.40.1603129708929;
        Mon, 19 Oct 2020 10:48:28 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z28sm407957pfk.213.2020.10.19.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 10:48:28 -0700 (PDT)
Date:   Mon, 19 Oct 2020 11:48:26 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V2 5/7] remoteproc: imx_rproc: add i.MX specific parse fw
 hook
Message-ID: <20201019174826.GC496175@xps15>
References: <20200927064131.24101-1-peng.fan@nxp.com>
 <20200927064131.24101-6-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927064131.24101-6-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Sep 27, 2020 at 02:41:29PM +0800, Peng Fan wrote:
> The hook is used to parse memory-regions and load resource table
> from the address the remote processor published.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 97 ++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 48ce09e857ee..bd3a42892b22 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -11,6 +11,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -243,10 +244,106 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  	return va;
>  }
>  
> +static int imx_rproc_mem_alloc(struct rproc *rproc,
> +			       struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va)) {
> +		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_mem_release(struct rproc *rproc,
> +				 struct rproc_mem_entry *mem)
> +{
> +	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_parse_memory_regions(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device_node *np = priv->dev->of_node;
> +	struct of_phandle_iterator it;
> +	struct rproc_mem_entry *mem;
> +	struct reserved_mem *rmem;
> +	int index = 0;
> +	u32 da;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while (of_phandle_iterator_next(&it) == 0) {
> +		/*
> +		 * Ignore the first memory region which will be used vdev buffer.
> +		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
> +		 */
> +		if (!index && !strcmp(it.node->name, "vdevbuffer")) {
> +			index ++;

How many vdevs is there in your scenario?  Since most of this code is taken from
stm32 anyway I would suggest to use "vdev0buffer" and get rid of the "index ++".  It
adds needless complexity and doesn't pass the checkpatch test.

With the above:
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +			continue;
> +		}
> +
> +		rmem = of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			dev_err(priv->dev, "unable to acquire memory-region\n");
> +			return -EINVAL;
> +		}
> +
> +		/* No need to translate pa to da, i.MX use same map */
> +		da = rmem->base;
> +
> +		/* Register memory region */
> +		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)rmem->base, rmem->size, da,
> +					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> +					   it.node->name);
> +
> +		if (mem)
> +			rproc_coredump_add_segment(rproc, da, rmem->size);
> +		else
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +		index++;
> +	}
> +
> +	return  0;
> +}
> +
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret = imx_rproc_parse_memory_regions(rproc);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.da_to_va       = imx_rproc_da_to_va,
> +	.load		= rproc_elf_load_segments,
> +	.parse_fw	= imx_rproc_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
>  static int imx_rproc_addr_init(struct imx_rproc *priv,
> -- 
> 2.28.0
> 
