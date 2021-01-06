Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4237EC43332
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 23:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 276A022D6F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 23:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbhAFXTZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 18:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbhAFXTO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 18:19:14 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B8AC06135D
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jan 2021 15:18:13 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id f14so261340pju.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jan 2021 15:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=indQo8BcjWbRXzRZ0T8BngRVCv//mmmu0O844tiaT4g=;
        b=R8nV230zvQAnflbm4TeJlSDkjzREroj58pd6hDZK7uB7vV6VtYIOaZuv5w38c9QHj7
         UA4xDdfcDZmIR0xBCSBHV1mtB2xAe80/b6Dg1PjDZEfo9Un4IO+2yPrfErAiIULydpdG
         Bnq8gZblQhNmbRn2tm8X21MO9nwLo2gZCPM2w+LYhiB7HRixkj2lqx186QmCHAM4Hc6Z
         RKIdDjqZ+QfTey3SmJKv1MX+CODbYSKRE+LW+NX/6ynEvyJGgc5iRz4+ZEUcARXUQ0zJ
         4EnGVigdZEexJfUSkDFMfJN8bNNb894d074MIjiIuIH2+7/nhSgakZ7UeBfhhq7LWqQj
         tbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=indQo8BcjWbRXzRZ0T8BngRVCv//mmmu0O844tiaT4g=;
        b=pTOkkSti7Tcg3xpYvDTdNnzjkWbnUEwwa/HM1PC8GlCDJzbjHPPMgxBpqoybMjWJlh
         oolMRpcVhcpqmpVeQZnCTUIfZ4R58JJ/J1Vs+Nzxo/Fn/vs1ou9ktoX9GmWGJPWFrg1W
         /4UqC1a7B9luc8tC5Kz4YB/aEC3ay/T0GhFPLIs/2QzsNX6me4WEoUeUss3pokaI8YKO
         X0LS0O/EM9ZCsumTh6PHk2alUKwXGATTWB9h+XuvP9tsSHQvdfmpQkilZuSBc73yE/pt
         OGk5ImRUcfz1Qy1RGyXeuT6nNVlY6OuW+9RKXzEhp4zwmrNsdHEch2ImokLGNRkBM+FD
         /w4A==
X-Gm-Message-State: AOAM530LESOpdkYYP62R+ziIzXD5TVob+opBHvircW3/H1PBUSI0FCEc
        3ISs0q9kVi9D8wa739ZmEkeSYw==
X-Google-Smtp-Source: ABdhPJzdPs9nu4RV1o0ddWjYjCwy9pG3y21ZR8W8u9VqtmvdUWGqYr5OjPi8n+0KGl3quDn9wHwdZw==
X-Received: by 2002:a17:90b:4d07:: with SMTP id mw7mr5008012pjb.172.1609975092947;
        Wed, 06 Jan 2021 15:18:12 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t25sm3827483pgv.30.2021.01.06.15.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 15:18:12 -0800 (PST)
Date:   Wed, 6 Jan 2021 16:18:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc/mediatek: enable MPU for all memory regions
 in MT8192 SCP
Message-ID: <20210106231810.GD9149@xps15>
References: <20201214051047.859110-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214051047.859110-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Dec 14, 2020 at 01:10:47PM +0800, Tzung-Bi Shih wrote:
> Enables MPU for all memory regions in MT8192 SCP.

Ok but how was it working before this patch?  Why is this suddently needed?  A
changelog that explains all this would certainly be appreciated.

Thanks,
Mathieu

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 1 +
>  drivers/remoteproc/mtk_scp.c    | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 94bc54b224ee..5f7cd2336cef 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -47,6 +47,7 @@
>  
>  #define MT8192_CORE0_SW_RSTN_CLR	0x10000
>  #define MT8192_CORE0_SW_RSTN_SET	0x10004
> +#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
>  #define SCP_FW_VER_LEN			32
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index f025aba67abc..130c0b9511df 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
>  	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
>  
> +	/* enable MPU for all memory regions */
> +	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> +
>  	return 0;
>  }
>  
> -- 
> 2.29.2.684.gfbc64c5ab5-goog
> 
