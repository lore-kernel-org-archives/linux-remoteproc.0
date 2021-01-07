Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559BAC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 21:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DBA723406
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 21:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbhAGVvg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jan 2021 16:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbhAGVvg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 16:51:36 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1173EC0612F4
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 13:50:56 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id 4so4502414plk.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 13:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uw28iSl5y8aqxwZIYKIrfSUBToG10LDkBuDH9Apkh7o=;
        b=V99HHI70hgC8uhJ4/d1qVv4HDq07qqzh23fVSWdmXaH8TEoYOCeclao664ZEDxV0n+
         ERR7J42+75Ho6Sw64CRGX8b43xem9LrXd4PhC8BEFYkVlX/1VjV9QucFC9BmwsT4diZG
         3hf572OsZvtU66+/ofAKW7IEIAmaU9XbfkykqzppFUNX5/UIXkzgFr8VIwlYNsn97mT9
         Fpis7AfqrsvyCyx3AVsJh1NPEDe9VIwTbC1vyO9llYUAQBeFM9KL1+MBUtE2cKPtqGBY
         sX3RekgctotcR5peaoxSIpVL5xrDWik74DGcajR/DHQb/jrc97f2upijcBtzr0FTI6/Z
         V7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uw28iSl5y8aqxwZIYKIrfSUBToG10LDkBuDH9Apkh7o=;
        b=FPqsiuEJLQsL4bFhZdOdWzlThp4iIK8eLb+qNW5XsEIeIOYSQ/FSttUGBX6EbJhH/q
         flckEp5QG0+gNrADHR6PmCTbetVkxqJYT+5rXoZGj7bSUnQhDevZQ6k4hj4P2UY++0dw
         1gtcLuRL2V9Fb1KoQqY5tvAUWf0nRpGMg+98ZTGDZO4jN97dMqMiq+uj8q4lqVjty1qh
         DH3eF8KMYFw4H5P5XPeP2+PzZvMM3GQTS4KNiEZLedEotEvwuEK1DHIqhlfRJ/jyrjF2
         yk/UTs4f8S0zDDQOoMc1uhPBQsDY3fl1Dm53nfiW78wG2gYp9VhC/M1dKuZQRHvhvSST
         NmwA==
X-Gm-Message-State: AOAM5338SGdTugXdrxq0h8snfEW+eSVqCEGY3z+5eR/MFReg9xyZ/rZY
        m4WZOHci6qz09LqHIiF1e4Y96w==
X-Google-Smtp-Source: ABdhPJwAWY4rbvoPuyfQ9PF72eamwyBXspTaMcknhM0xeBVWbdgpL023Ily+Xrw9JvD0wx4wRpwVbQ==
X-Received: by 2002:a17:90a:fb97:: with SMTP id cp23mr453605pjb.215.1610056255559;
        Thu, 07 Jan 2021 13:50:55 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 92sm2974663pjv.15.2021.01.07.13.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 13:50:54 -0800 (PST)
Date:   Thu, 7 Jan 2021 14:50:53 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc/mediatek: enable MPU for all memory
 regions in MT8192 SCP
Message-ID: <20210107215053.GA43045@xps15>
References: <20210107023020.3224002-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107023020.3224002-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 07, 2021 at 10:30:20AM +0800, Tzung-Bi Shih wrote:
> The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
> memory region.  It defines whether a memory region can be managed by MPU
> or not.
> 
> In the past, due to the default settings in the register, MT8192 SCP
> works luckily.  After enabling L1TCM, SCP starts to access memory region
> that is not included in the default settings.  As a result, SCP hangs.
> 
> Enables MPU for all memory regions in MT8192 SCP.
> 
> Note that the register is read only once when SCP resets.  Thus, it must
> be set from kernel side.

Much better - now I understand what is going on.  

Based on the description of the problem please add a "Fixes" tag and CC stable.
I also suggest you bundle this patch with your other patchset [1] once you have
make the modifications for devm_platform_ioremap_resource_byname().

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v1[1]:
> - Adds more details in commit message.
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214051047.859110-1-tzungbi@google.com/ 
> 
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
> 2.29.2.729.g45daf8777d-goog
> 
