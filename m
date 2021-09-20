Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1AEC433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 18:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A681D613E8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 18:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351759AbhITSRI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376693AbhITSOP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Sep 2021 14:14:15 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32699C08EBB4
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Sep 2021 09:59:24 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c1so13904310pfp.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Sep 2021 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Znx150GeQHqCUDq1R5d3pbprQ1CNmBnhDQEfjRdzInA=;
        b=pLmoJql/uGd9y5YWMAaw23mJ/vvCcu2k97DZKvIRYqbFMrYUm4dT4kQ4Q/XPnZvNC+
         oOxZBB/3kgNwkvpjvXgXm+QwBLSStHjRTqnRkp8ZZfgsuCGqwjUPVMZaG+iKm/Kb5qlR
         0SaSi98FfWbkAWnKUagCCoqsQASzkdigyscJfhv3hy32ZIy/g2QTMISwJIuPxPlPqdRO
         nMEQDXZzD6hM6bjCSbyVXTUD1XHKnbU96X5PfWR3h5b8/rjdqqbSa1nKZ5rwbbYGz2gp
         bu9qaDDjmkiOXJx4LNxm1JOGQ9ZZ0WRGz+i02B8nuhAbIEoGhDCH+w0XHwBR90Ac9jZj
         L9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Znx150GeQHqCUDq1R5d3pbprQ1CNmBnhDQEfjRdzInA=;
        b=KGXhttOcjjMmKmOPSKQ8wpj41XrJew4zbE9ZrdsqsKuxH6y5YqjdL9/XJR5oU26IT0
         VtjIpf3sp3JJ/EyvpERxvueEo4F72NOgm9zkkFuTVb9W0bOgEVZ1gBgwJ+jYXwNtFejP
         57pdqUj+cQcPrEtVsF5VJhAI3JG1frh8pXqwecKAzGTnUpeYz/Z6OUTaTNdJbABAP2L6
         YF0SqxrSROzwdijqPjPXJIaMbSgw7J1bIjaN0/LNa/G1I+2hOOs01T5EZgmZZQuoSzPx
         V5T0SMFX3vDWQ9MQAIocezASZX+o3XmccA/7xtg+dcPx2oW6l/PTvGzHBa+ZxxRSF+Ym
         8aUw==
X-Gm-Message-State: AOAM531LeHAqpsNfJjTbz39Rvt/zIkYwu7WTjsM1xq5S/dJO6XFQNFXm
        bFyL8MWIjTyGuOp3Wrm7+pHhbA==
X-Google-Smtp-Source: ABdhPJy+qOdkSC9jNqC3UEqmCXYsNkb5VXxTMgrzHv1FNEw0Rc2NO4A+eMxQtG3Q0T82v9bvnKTcuQ==
X-Received: by 2002:a05:6a00:22d5:b0:440:3750:f5f4 with SMTP id f21-20020a056a0022d500b004403750f5f4mr26496924pfj.64.1632157163696;
        Mon, 20 Sep 2021 09:59:23 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k127sm15590110pfd.1.2021.09.20.09.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:59:22 -0700 (PDT)
Date:   Mon, 20 Sep 2021 10:59:20 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 3/6] remoteproc: imx_rproc: fix TCM io memory type
Message-ID: <20210920165920.GC2023964@p14s>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
 <20210910090621.3073540-4-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910090621.3073540-4-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 10, 2021 at 05:06:18PM +0800, Peng Fan (OSS) wrote:
> From: Dong Aisheng <aisheng.dong@nxp.com>
> 
> is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> is_iomem to da_to_va"), but the driver seemed missed to provide the io
> type correctly.
> This patch updates remoteproc driver to indicate the TCM on IMX are io
> memories. Without the change, remoteproc kick will fail.

If the kick fails on all these platforms, why was patch 40df0a91b2a5 ever
submitted at all?  To me this is a serious problem that should have been caught
before it got sent to the mailing list.

I have applied this patch but based on the blatant problems this patchset
underscores, how can I trust future patches coming from NXP?

> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
> Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 35 ++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index d88f76f5305eb..71dcc6dd32e40 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -71,6 +71,7 @@ struct imx_rproc_mem {
>  /* att flags */
>  /* M4 own area. Can be mapped at probe */
>  #define ATT_OWN		BIT(1)
> +#define ATT_IOMEM	BIT(2)
>  
>  /* address translation table */
>  struct imx_rproc_att {
> @@ -117,7 +118,7 @@ struct imx_rproc {
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* ITCM   */
> -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> +	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
>  	/* OCRAM */
> @@ -131,7 +132,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
>  	/* DTCM */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S - alias */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> @@ -147,7 +148,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCML - alias */
> -	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
> +	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00008000, 0 },
>  	/* OCRAM */
> @@ -159,9 +160,9 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
>  	/* TCML */
> -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
> +	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
>  	/* TCMU */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
>  	/* OCRAM_S */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> @@ -199,12 +200,12 @@ static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
>  	/* OCRAM_PXP (Code) - alias */
>  	{ 0x00940000, 0x00940000, 0x00008000, 0 },
>  	/* TCML (Code) */
> -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* DDR (Code) - alias, first part of DDR (Data) */
>  	{ 0x10000000, 0x80000000, 0x0FFF0000, 0 },
>  
>  	/* TCMU (Data) */
> -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM (Data) */
>  	{ 0x20200000, 0x00900000, 0x00020000, 0 },
>  	/* OCRAM_EPDC (Data) */
> @@ -218,18 +219,18 @@ static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
>  static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCML (M4 Boot Code) - alias */
> -	{ 0x00000000, 0x007F8000, 0x00008000, 0 },
> +	{ 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
>  	/* OCRAM_S (Code) */
>  	{ 0x00180000, 0x008F8000, 0x00004000, 0 },
>  	/* OCRAM_S (Code) - alias */
>  	{ 0x00180000, 0x008FC000, 0x00004000, 0 },
>  	/* TCML (Code) */
> -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* DDR (Code) - alias, first part of DDR (Data) */
>  	{ 0x10000000, 0x80000000, 0x0FFF8000, 0 },
>  
>  	/* TCMU (Data) */
> -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S (Data) - alias? */
>  	{ 0x208F8000, 0x008F8000, 0x00004000, 0 },
>  	/* DDR (Data) */
> @@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>  }
>  
>  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
> -			       size_t len, u64 *sys)
> +			       size_t len, u64 *sys, bool *is_iomem)
>  {
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	int i;
> @@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  			unsigned int offset = da - att->da;
>  
>  			*sys = att->sa + offset;
> +			if (is_iomem)
> +				*is_iomem = att->flags & ATT_IOMEM;
>  			return 0;
>  		}
>  	}
> @@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	 * On device side we have many aliases, so we need to convert device
>  	 * address (M4) to system bus address first.
>  	 */
> -	if (imx_rproc_da_to_sys(priv, da, len, &sys))
> +	if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
>  		return NULL;
>  
>  	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
> @@ -553,8 +556,12 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		if (b >= IMX_RPROC_MEM_MAX)
>  			break;
>  
> -		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> -						     att->sa, att->size);
> +		if (att->flags & ATT_IOMEM)
> +			priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
> +							     att->sa, att->size);
> +		else
> +			priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
> +								att->sa, att->size);
>  		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
>  			return -ENOMEM;
> -- 
> 2.25.1
> 
