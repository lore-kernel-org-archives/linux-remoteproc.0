Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7F8C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jul 2022 17:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiGDRWK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jul 2022 13:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiGDRWJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jul 2022 13:22:09 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227F9C42
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jul 2022 10:22:08 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id f85so5633654pfa.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jul 2022 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vRC8pIQf0We13zLtIDGhR39LQaKZSAzTrltz62jYPX8=;
        b=WNcAvObM2RP4nCiHMJfhi4m6omuJBahSsG10OSs8QGfF2tQsqCOlmbvj88FuzeLdPU
         3CuyWxh+YV8w5M6HsO8nW9yvNgGEPMEWjgjHm94bLk9tRlDacqR+nfeTIGNWYf9KNesR
         xNqtSR68+hv7Sc//cvW0tiiT9PgcYrJHwyL7gbG3WVlW2QX/7WVoOMqeHdk0No2Jxn+Q
         /cYEvacVhpvYBBJixF3F6Q/ANCOSo6uqejXKKfkMdD3DQxXcS70+Y+5xeuZuh793bdk6
         SqcQ6MGvtUU8iZ0egNJlzoQ2iCXdze8GdNevApBJvFyBDIVacIdhHwjAg//XGfZOfk9m
         7Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vRC8pIQf0We13zLtIDGhR39LQaKZSAzTrltz62jYPX8=;
        b=DXftDtxdVw/u5uikL6hqeAYN9bSX3Eyqx+F+NuqwQ6umqkgiPWb2KCXnw6z0QolOCS
         B379NYxfZrbNEh3LRSG3PIjd34ttiLuaeqZZffbhG/8yF0EBv66tuzyHD2O2HM19+rRC
         LHPUx3f8GAEg2VCXSLtvPGk8hwbNgtB0+pBDQezk6lgWJhPtpqpUKIaRWhU5awS2nKo4
         nE5gck4cj9R8Dd9Kn3Z2J+qXvZOmnGgrApM0qMoy+/xhGTSL1bBKb4RDIjZ9beP1kIDV
         AuqHq227fdL6ueLdieQI1WI1GjZn/2fjSBM+qIq8VjlFOGnAtpkgPq1HhommVSo4LwVC
         xx4w==
X-Gm-Message-State: AJIora+LnvZA3XshAJA1iCMoNhAjYaBNlNSJbFWG/AjD1/AYnpV4nmON
        PikE8pVi8JQ6wDD/VXDRNe5UFA==
X-Google-Smtp-Source: AGRyM1uVDQ+hPip9IBzuK8uCdyPMNrrRXAss4SBldNQ7p4p9W/HScpc43T2gjutc2uCEzIh6NdOWCA==
X-Received: by 2002:a05:6a00:f8f:b0:525:537d:69b1 with SMTP id ct15-20020a056a000f8f00b00525537d69b1mr38074857pfb.52.1656955327682;
        Mon, 04 Jul 2022 10:22:07 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l189-20020a6225c6000000b005255263a864sm21321486pfl.169.2022.07.04.10.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:22:06 -0700 (PDT)
Date:   Mon, 4 Jul 2022 11:22:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 1/1] remoteproc: mediatek: enable cache for mt8186 SCP
Message-ID: <20220704172204.GB2375750@p14s>
References: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
 <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 01, 2022 at 08:12:29PM +0800, Allen-KH Cheng wrote:
> This patch is for enableing cache in SCP. There is not enough space
> on the SRAM of SCP. We need to run programs in DRAM. The DRAM power
> and latency is much larger than SRAM, so cache is used to mitigate
> the negative effects for performance. we set SCP registers for cache

s/we/We

> size before loading SCP FW. (8KB+8KB) and also adjust ipi_buf_offset
> in SRAM from 0x7bdb0 to 0x3BDB0 for enableing cache.

s/0x3BDB0/0x3bdb0

s/enableing/enabling

> 
> This patch was tested on MediaTek mt8186.
> 

If we keep the above statement it will be in the kernel's changelog for ever.
Comments such as this one are usually found in the cover letter or between "---"
lines after the SoB.

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 47b2a40e1b4a..5b2ad789e720 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -401,6 +401,14 @@ static int mt8186_scp_before_load(struct mtk_scp *scp)
>  	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
>  	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
>  
> +	/*
> +	 * Set I-cache and D-cache size before loading SCP FW.
> +	 * SCP SRAM logical address may change when cache size setting differs.
> +	 */
> +	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
> +	       scp->reg_base + MT8183_SCP_CACHE_CON);
> +	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
> +
>  	return 0;
>  }
>  
> @@ -943,7 +951,7 @@ static const struct mtk_scp_of_data mt8186_of_data = {
>  	.scp_da_to_va = mt8183_scp_da_to_va,
>  	.host_to_scp_reg = MT8183_HOST_TO_SCP,
>  	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> -	.ipi_buf_offset = 0x7bdb0,
> +	.ipi_buf_offset = 0x3bdb0,
>  };

I have made the above corrections and applied this patch.

Thanks,
Mathieu

>  
>  static const struct mtk_scp_of_data mt8192_of_data = {
> -- 
> 2.18.0
> 
