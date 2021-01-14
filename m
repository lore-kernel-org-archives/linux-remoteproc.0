Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C73C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 21:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B4B235DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 21:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbhANViu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 16:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbhANVis (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 16:38:48 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465ADC0613D6
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 13:38:08 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n10so4643347pgl.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M25f2Urs67ewtW9Uctz0Ma+cdGhcJesg41jWdEvlv+A=;
        b=uqmdvUhePZHvP+/tQJW6RM3qU8CZvdbDhob1c2l0dpQjwtQecqMjOumtUyjdUNBKCm
         IIBgLOuSPwwjDKTn+AuU/brQuU9JQK3X7iaD4rGlVnyk3okjqE3ydvwkI85MsVoGs3or
         ua7PXg6Vvj5+qBChVRxteAzc98FwM0YG/21w9V9Naq9y6ODjy8aLxPp5ES4YwVb5om9H
         SXmdAbHIjeUYLha7KX7HntlGiDcZhbNufugBp7jVoy/VXZKQl1xzZGrXf6KbwcA6396D
         twI9GzCdChg1W3bOXIBfIE0mFhT/6NK/MufyeCEVGGxCSs3cZ0YKugzZp8YYQ2xMyMg8
         mlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M25f2Urs67ewtW9Uctz0Ma+cdGhcJesg41jWdEvlv+A=;
        b=XASFhnIBNBPvRIKzWDZI12iY306sFZ4sz2/Uik/CWW0dMuHyI03f7pBhqUR4NV2lBT
         cv9/GQuzvB+qZNPL7BvT6G76u8r4musbPTEDn9jXqCotNb+c59ADmRqPRWvuXKZTtZ1O
         uDB0vx1fSSoQDgUda3lvRBYU0VZxWVfk3Zl7ssGWQSQrhtlv7cOhYkwz3///UEZ+shc4
         NfRn9BmhE5wbw/53WIFNarJbfx69do8rZvITEszbqxZ6VLdaXEaQvpveHq/zsZfSaamq
         F2u/NclCgS9Xvr2gpjAziq0VjFe3u9g9RXKcrcvHo7AShtBS0bPPcnW7yTolSr1brOOg
         P/Ig==
X-Gm-Message-State: AOAM5317aaMImHMGD/xElywDGqBO0LeoBYKNEt+C+0hMVMxEdTp8a7dG
        RDqbo+j8p5lnnR7zpFXGwu1QTO6iuGJHKQ==
X-Google-Smtp-Source: ABdhPJz7n2VtVsCkeQX6jnx37nrN+RCln1qBV28twX8SpfYzHQdWewvxVNpSLVG13Q2MdhLhvOrskw==
X-Received: by 2002:a63:dc56:: with SMTP id f22mr3631737pgj.106.1610660287861;
        Thu, 14 Jan 2021 13:38:07 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b22sm5955823pfo.163.2021.01.14.13.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 13:38:06 -0800 (PST)
Date:   Thu, 14 Jan 2021 14:38:04 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V6 07/10] remoteproc: imx_rproc: add i.MX specific parse
 fw hook
Message-ID: <20210114213804.GE255481@xps15>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
 <1610444359-1857-8-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610444359-1857-8-git-send-email-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 12, 2021 at 05:39:16PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The hook is used to parse memory-regions and load resource table
> from the address the remote processor published.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/imx_rproc.c | 93 ++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 47fc1d06be6a..3c0075dc1787 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -10,6 +10,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -241,10 +242,102 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
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
> +	u32 da;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while (of_phandle_iterator_next(&it) == 0) {
> +		/*
> +		 * Ignore the first memory region which will be used vdev buffer.
> +		 * No need to do extra handlings, rproc_add_virtio_dev will handle it.
> +		 */
> +		if (!strcmp(it.node->name, "vdevbuffer"))

Because you are doing a V8, please use "vdev0buffer" and make the change in the
.yaml file.

> +			continue;
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
