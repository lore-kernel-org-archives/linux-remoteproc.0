Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79B9C07E95
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Jul 2021 17:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC18360725
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Jul 2021 17:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbhGMRJc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Jul 2021 13:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbhGMRJc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Jul 2021 13:09:32 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0A1C0613E9
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jul 2021 10:06:41 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id d12so22146926pgd.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jul 2021 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QArzQ0W00D/rVP8EGx2qH04dhUL8Nmjd4SowzwPfG+E=;
        b=oDlv3oMGj49avEx981/x3Q1OUGWWU+RvRtSApC2aCbAq31sTbYz1HeIou9K4iufsWE
         FjyDDTT4n69TNlOtKh4Al0Hw4wd4dl5hYyx1v9FeHeNIfHqvoJB5V5JwUaPLHd+2/fXn
         C54g1GAlizqokAsgOD32uAqZxYvUwKXLQtPTIBTCqhkDB41hxFxx3LzZ1cxPkn1V+hc7
         MddtRMsf3xGVdoLdXVCxSN9zhoa/Sbv8rVBoSadI1TRRKO0MV4/wamMWEN1vR7ODoEaN
         GEiX0NhqjsFoVHAtGeyhRV1T1yzMX1jFbuQhsyalgJ79EOo/y3jrnnvgVZroUUyw5XnO
         xDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QArzQ0W00D/rVP8EGx2qH04dhUL8Nmjd4SowzwPfG+E=;
        b=PdjpJGnNA0T7vJR9B+ugz8zlJFEserQJV1BIEWuJ86upvucycirpIiBnVp9Yq35f1h
         D4mrzEbhS7Rpi+bEm6E2cuZLGjaTpw3XcE/1u6onEtczykTP/1dPdoM1v5nl38Zyqovk
         vSUQX8RHIrFebKEGIu8VFBshIpgVBheI/sUcuJ7zSDDA7X/OkTbE85UtQJBaxC2/Fuoh
         MpmVi3grilYDvFUAFIAXlZm71gY+xcuMbLP/hHbPlOKLF5o3yWniJy33liJwkv66C/pD
         fe6UE5mII+wiwoKT4i5ORjd3Fkev5OVZ8gzfiZItnoSiSgrvLuZjyLeWI5Moa+aecIgy
         fYag==
X-Gm-Message-State: AOAM533pyzixTirJsnQu4NzLcA4KCELbWsfBX4ksiZUEO1UnbU2Ee998
        iyZtNCEAcLkZ24MyY579qULDxQ==
X-Google-Smtp-Source: ABdhPJwhdHhKNch3dmExiOnwJJAwpEILRF/J+Bbti4veWAi68kMTHQqvaDHL20vCPFA9/ogPjjnB9w==
X-Received: by 2002:aa7:990b:0:b029:327:6b3f:8a1c with SMTP id z11-20020aa7990b0000b02903276b3f8a1cmr5486444pff.26.1626196001413;
        Tue, 13 Jul 2021 10:06:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d15sm6948261pfl.82.2021.07.13.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 10:06:40 -0700 (PDT)
Date:   Tue, 13 Jul 2021 11:06:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Message-ID: <20210713170638.GA1816225@p14s>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
 <20210707094033.1959752-5-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707094033.1959752-5-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 07, 2021 at 05:40:33PM +0800, Dong Aisheng wrote:
> DRAM is not io memory, so changed to ioremap_wc. This is also
> aligned with core io accessories. e.g. memcpy/memset and cpu direct
> access.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v1->v2:
>  * new patch

It's a new patch and yet Peng's RB tag is already on it...

> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index ff620688fad9..4ae416ba5080 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  			break;
>  
>  		/* Not use resource version, because we might share region */
> -		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
> +		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));

How was it working before?  Will it really work for all platforms and was this
extensively tested?

Peng - I will need an explicit reply from you that you are in agreement with
this change.  I will also need you to review patch 01 and 02 of this set.

Thanks,
Mathieu

>  		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
>  			return -ENOMEM;
> -- 
> 2.25.1
> 
