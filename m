Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF64AC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 23:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BEFE23333
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 23:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbhAFXP5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 18:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbhAFXP5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 18:15:57 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1904DC061799
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jan 2021 15:15:17 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id t6so2342320plq.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jan 2021 15:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z2HbF3Kd7nM9wygPmlCYxiwG6y4AFwQv3HT8OOOSHMQ=;
        b=iFlaLI79wgjwFEvTJdIveBCsHg6CY7wDDEiAYPhU0r5X/ym0GPr4SALgpYfzEz4vYL
         OwO2AYrEUoBy1Y13AUf2PvP2uAp+n6v5cFl0qmy4xvDO/pqFh+c3Af9B2E5kDmbd6wKc
         NL8tfziIr6ZO36TTY1yGGZEfYLJrA6nhKkDqwfLCwkGfHfMZpbOPjkDPuL+4HP7YWDeI
         P8agkefOdvsPn0aSWWm+XIdfqnLf17Smp+nQIy/RFf1CLLIE354cOWD6wRKabC+/JTxL
         aBNv9tMsOUGm1dV2cY41IqvmGAuxrq5mNtSkn7hNvkFGFgzSvwtL21j2O0sFVxNMZ9ud
         DONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z2HbF3Kd7nM9wygPmlCYxiwG6y4AFwQv3HT8OOOSHMQ=;
        b=bRiWw60H1w19QV6sWRXoTAtFpclYzhY2Lw2hUacMVKvMrDrZDS7ODFf7AbxmF2d9QX
         kkUzGo4bpdw8dFcT34cgyM+I36mNCTaWgaB1WbV1p6SR55x1PzJYk+gccGn21JO4rvf8
         SUFCidANRCr9m1XDj5I/9Ey4oBRj+ocZKHATKLR+T5jlDA8DLuWTUC85JlZO7X3Kx6Rh
         gsfTY3tObnDgo/ClIsi4AszFGpn9HTSjmVD2Ppy528VcGApNP6+WlmdaEar4dWA0w/bI
         6Bb1Flzb7BL7AMsZe7Udj+2oYm8zvu+6qKUcDSU95uNCLl0lFWLCR6pH056ZJRPfL04J
         Qxjw==
X-Gm-Message-State: AOAM531Xum18OoKqUfAcBD3uk3dVhFuDpCxSFpCFIcas5Bo1hYfW1nOd
        aFNalyGLxiXrjL3k51q9wxsSMT/CzpYY2Q==
X-Google-Smtp-Source: ABdhPJzDxsj3pgOjDMYZyKv0dxP6QZv8d4cxpZXurn6hvDguDKOMjJBOlkEXcFGD86UpPAfzYJquOw==
X-Received: by 2002:a17:90a:ae02:: with SMTP id t2mr6329731pjq.169.1609974916458;
        Wed, 06 Jan 2021 15:15:16 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t15sm3615365pfc.12.2021.01.06.15.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 15:15:15 -0800 (PST)
Date:   Wed, 6 Jan 2021 16:15:13 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
Message-ID: <20210106231513.GC9149@xps15>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214050521.845396-3-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Shih,

On Mon, Dec 14, 2020 at 01:05:21PM +0800, Tzung-Bi Shih wrote:
> L1TCM is a high performance memory region in MT8192 SCP.
> 
> Reads L1TCM memory region from DTS to determine if the machine supports.
> Loads L1TCM memory region to SCP sys if the firmware provides.
> 
> Starts from MT8192 SCP, the firmware contains physical addresses for
> each memory region, for instance:
> 
> Program Headers:
>   Type   Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>   LOAD   0xXXXXXX 0xXXXXXXXX 0x10500000 0xXXXXX 0xXXXXX XXX 0xXXXX
>   LOAD   0xXXXXXX 0xXXXXXXXX 0x10700000 0xXXXXX 0xXXXXX XXX 0xXXXX
>   LOAD   0xXXXXXX 0xXXXXXXXX 0x50000000 0xXXXXX 0xXXXXX XXX 0xXXXX
> 
> Kernel driver can use the "PhysAddr" (i.e. da in the da_to_va callbacks)
> to know the ELF segment belongs to which region.
> 
> To backward compatible to MT8183 SCP, separates the da_to_va callbacks
> for new and legacy version.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h |  5 +++
>  drivers/remoteproc/mtk_scp.c    | 54 +++++++++++++++++++++++++++++++--
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 988edb4977c3..94bc54b224ee 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -75,6 +75,7 @@ struct mtk_scp_of_data {
>  	void (*scp_reset_assert)(struct mtk_scp *scp);
>  	void (*scp_reset_deassert)(struct mtk_scp *scp);
>  	void (*scp_stop)(struct mtk_scp *scp);
> +	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> @@ -89,6 +90,10 @@ struct mtk_scp {
>  	void __iomem *reg_base;
>  	void __iomem *sram_base;
>  	size_t sram_size;
> +	phys_addr_t sram_phys;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
>  
>  	const struct mtk_scp_of_data *data;
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e0c235690361..f025aba67abc 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -458,9 +458,8 @@ static int scp_start(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
>  {
> -	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
>  	int offset;
>  
>  	if (da < scp->sram_size) {
> @@ -476,6 +475,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  	return NULL;
>  }
>  
> +static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
> +{
> +	int offset;
> +
> +	if (da >= scp->sram_phys &&
> +	    (da + len) <= scp->sram_phys + scp->sram_size) {
> +		offset = da - scp->sram_phys;
> +		return (void __force *)scp->sram_base + offset;
> +	}
> +
> +	/* optional memory region */
> +	if (scp->l1tcm_size &&
> +	    da >= scp->l1tcm_phys &&
> +	    (da + len) <= scp->l1tcm_phys + scp->l1tcm_size) {
> +		offset = da - scp->l1tcm_phys;
> +		return (void __force *)scp->l1tcm_base + offset;
> +	}
> +
> +	/* optional memory region */
> +	if (scp->dram_size &&
> +	    da >= scp->dma_addr &&
> +	    (da + len) <= scp->dma_addr + scp->dram_size) {
> +		offset = da - scp->dma_addr;
> +		return scp->cpu_addr + offset;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +{
> +	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
> +
> +	return scp->data->scp_da_to_va(scp, da, len);
> +}
> +
>  static void mt8183_scp_stop(struct mtk_scp *scp)
>  {
>  	/* Disable SCP watchdog */
> @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  	}
>  	scp->sram_size = resource_size(res);
> +	scp->sram_phys = res->start;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> +	if (res) {

As far as I can tell the if() condition isn't needed since
platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
is capable of handling that condition.  As such the code to parse "l1tcm" can be
the same as what is done for "sram".

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +		scp->l1tcm_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR((__force void *)scp->l1tcm_base)) {
> +			dev_err(dev, "Failed to parse and map l1tcm memory\n");
> +			ret = PTR_ERR((__force void *)scp->l1tcm_base);
> +			goto free_rproc;
> +		}
> +		scp->l1tcm_size = resource_size(res);
> +		scp->l1tcm_phys = res->start;
> +	}
>  
>  	mutex_init(&scp->send_lock);
>  	for (i = 0; i < SCP_IPI_MAX; i++)
> @@ -803,6 +851,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>  	.scp_reset_assert = mt8183_scp_reset_assert,
>  	.scp_reset_deassert = mt8183_scp_reset_deassert,
>  	.scp_stop = mt8183_scp_stop,
> +	.scp_da_to_va = mt8183_scp_da_to_va,
>  	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>  	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
>  	.ipi_buf_offset = 0x7bdb0,
> @@ -814,6 +863,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_reset_assert = mt8192_scp_reset_assert,
>  	.scp_reset_deassert = mt8192_scp_reset_deassert,
>  	.scp_stop = mt8192_scp_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>  };
> -- 
> 2.29.2.684.gfbc64c5ab5-goog
> 
