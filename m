Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3FFC32772
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Aug 2022 20:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbiHWUbd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiHWUbP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Aug 2022 16:31:15 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4457B786
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Aug 2022 13:06:48 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x23so13772368pll.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Aug 2022 13:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=CbkIBCLoHbH9nNnU/J2Hb+7ZqJOjL/seN2XSe7TVevU=;
        b=LyQZ8mpGnO62wtqueQ9ShrFp+nlxifSg/kxiyCwFOBEtJNosbOZLvblQHuIE6N2hjt
         V/oQePAHGmvEulJfpi7dcrOIYh/b9yyhDrE2XuKRqv8E0nfyTkN1+ziMmIjvW9Y/K2Dm
         gpTm9CNd1Wa+6RHT/+oUNI98z9jaJkAAVSirYcJZ3o3eK8zT4E3clJxiu5DdGcfxgW+Y
         lM3TMLUTtYTY1/CQPIfgl4ghw4+cy8bi6wQ79Zf9HfOm/onkXJ3UYQ4B8AerTI/HwaMu
         qAmBr35p0DqTJ+wFeG8lzBa+vgTnVmmOBu0a5bFySbiwtvL/ObBHWeWo0dUXpa5Nz96r
         gPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=CbkIBCLoHbH9nNnU/J2Hb+7ZqJOjL/seN2XSe7TVevU=;
        b=Vh0zRnIOOWxNZCUieDWnJsDqzrDHcU8sXe53oLqG7qVUaFRtNN41CbHW1shIsAe3nQ
         ezFIOhPVFNT3HAvUHi6iE1K3b973UaCdtzUPw8HVmBaOvnoREuuJ52Vb4tOOnyUsctZZ
         rdPmxLq8mjsFtYqSkzUCQs8AAEW+9B65kycRiSpQ1NoACBM+CsF/vUBqk+KddcjJwA6T
         feWYctBGryxGRZhbrm0TVohItthJzbu0ozl1JAmT6buQl9nvoZWjgJsfVra9BuaDbgZa
         +rgkeOXeNjzJW/7BhtHV9JsRwGTEjr5rKni4PoV9nMmTphtwkBD4zK9LjHFgidFjjaHL
         G0wg==
X-Gm-Message-State: ACgBeo0nQd4izHAqRm5Qn7SssHQqAha75dXNB4fNUT3EeUynIn197fFp
        nXS3L1aVLdZGmTM1H/eoQ0ri0Q==
X-Google-Smtp-Source: AA6agR5p/BTbRDFoEOMWG8yU+S+cOrL/qtvtS7f5dviOX2iNU2ka8UU1HiT4GwoLDdpIYoSb0zf/pw==
X-Received: by 2002:a17:902:cec7:b0:172:5b09:161c with SMTP id d7-20020a170902cec700b001725b09161cmr25181780plg.60.1661285207566;
        Tue, 23 Aug 2022 13:06:47 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t127-20020a625f85000000b005362baf16e4sm8574434pfb.141.2022.08.23.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 13:06:46 -0700 (PDT)
Date:   Tue, 23 Aug 2022 14:06:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: fix argument 2 of
 rproc_mem_entry_init
Message-ID: <20220823200644.GC1781852@p14s>
References: <1660567398-24495-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1660567398-24495-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Aug 15, 2022 at 08:43:18PM +0800, Shengjiu Wang wrote:
> There are sparse warning:
> drivers/remoteproc/imx_dsp_rproc.c:602:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *va @@     got void [noderef] __iomem *[assigned] cpu_addr @@
> drivers/remoteproc/imx_dsp_rproc.c:602:49: sparse:     expected void *va
> drivers/remoteproc/imx_dsp_rproc.c:602:49: sparse:     got void [noderef] __iomem *[assigned] cpu_addr
> drivers/remoteproc/imx_dsp_rproc.c:638:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *va @@     got void [noderef] __iomem *[assigned] cpu_addr @@
> drivers/remoteproc/imx_dsp_rproc.c:638:49: sparse:     expected void *va
> drivers/remoteproc/imx_dsp_rproc.c:638:49: sparse:     got void [noderef] __iomem *[assigned] cpu_addr
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ca0817f8e41e..899aa8dd12f0 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -599,7 +599,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		}
>  
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, cpu_addr, (dma_addr_t)att->sa,
> +		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
>  					   att->size, da, NULL, NULL, "dsp_mem");
>  
>  		if (mem)
> @@ -635,7 +635,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		}
>  
>  		/* Register memory region */
> -		mem = rproc_mem_entry_init(dev, cpu_addr, (dma_addr_t)rmem->base,
> +		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)rmem->base,
>  					   rmem->size, da, NULL, NULL, it.node->name);

Applied.

Thanks,
Mathieu

>  
>  		if (mem)
> -- 
> 2.34.1
> 
