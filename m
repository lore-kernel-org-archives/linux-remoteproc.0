Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9FBC433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED02623BAB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389659AbgLJRDJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 12:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733071AbgLJRDA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 12:03:00 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D24C061793
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:02:20 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id q25so6457606oij.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0VaF0OOvRvbqmxI8AgMHKOr2aUIB8S8aaloJf3KMn18=;
        b=YxzxynxTNd36hMWxs7lKCsjR/Ddsg3/lt2/xiXrxkP24POFyHbXIK2byi1sBM7Uwb/
         qAOVQ/T9i2wPy/lbStrUeV/8IYYNg3lkKXuNbFqqs2ZqVgsPdVzSX0y4dRwVtjhXNcIF
         7cMUfrIanGdcD6DdwYdnqbeMThZzuTj16KXE3k0E1Tc6lYzykjEI88Jjn1cO80mp864C
         hjTOqfIzIYZZiT8WJlRj83A00C5V3/3hpY9zEcqSNd+miV1t6JmP2WnG++qYxZ4zuq6y
         vKhgFlx60x5XLOOfcc6akuw1+zou1Cp0Wgenmud5k+ZYD8ANV/MbbWuHvxINr7+uP6Xv
         NKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0VaF0OOvRvbqmxI8AgMHKOr2aUIB8S8aaloJf3KMn18=;
        b=PG1zrnIFK3LncF/5XhhMzSdcuvMA1bGs7vaI3/Wvbn24wgJVB1aPOX0e6JS1j/3HPt
         viuexTFtYxO0dQOioKmOHAB1KmGwLGe5P5uFJlF0xI0XLCXDomHOMGTp+Z0fJWlawo8D
         ie2n1xmBthvwo3gpyip9wft6EDollJESUoR4PWPSx+EqnkZCcesYtHx2IYQ8ADM8vSQu
         YF0udFi4PZVX5uplav+F8e4KmQAMf/J2zi6CWkNKlhxnJO1ugQHtHqDUDlsUbRnwAr5k
         v5GeXDmpyr/BvR1MUI6+bfOf4liZ3py+Y1DxH2DBS2IbTsiGl9Zl3pUtR6pRW2mP7gp6
         xI6w==
X-Gm-Message-State: AOAM532pCaR8TjJ2Ua2NbHgDukxDr/PQIYZhgHT6iv3Gorp3Fc5ntedJ
        7UQUd+/GZOkLxcVDlo8HPGTFjw==
X-Google-Smtp-Source: ABdhPJy62hrKm0Opsibnj0qTOS8+URi3cSwncZvHn05vkeU6wVyxwYHDIJHajWn9xWyAhd5Xk3c32w==
X-Received: by 2002:aca:5653:: with SMTP id k80mr3607428oib.0.1607619739938;
        Thu, 10 Dec 2020 09:02:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o21sm1195845otj.1.2020.12.10.09.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 09:02:19 -0800 (PST)
Date:   Thu, 10 Dec 2020 11:02:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
Message-ID: <X9JUmRarnxPaXtrZ@builder.lan>
References: <20201210054109.587795-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210054109.587795-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 09 Dec 23:41 CST 2020, Tzung-Bi Shih wrote:

> The correct MT8192 CFG register base is 0x20000 off.  Changes the
> registers accordingly.
> 
> Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

I presume there's an associated DT change with this?

I'm okay with taking this, but would like to have Matthias ack on the
fact that we're breaking backwards compatibility with older DTS.

(Or I could ack this and Matthias can take it together with the DT
change, to reduce the breakage gap in the git history?)

Regards,
Bjorn

> ---
>  drivers/remoteproc/mtk_common.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index b3397d327786..fb022ff93dc1 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -32,22 +32,22 @@
>  #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
>  #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
>  
> -#define MT8192_L2TCM_SRAM_PD_0		0x210C0
> -#define MT8192_L2TCM_SRAM_PD_1		0x210C4
> -#define MT8192_L2TCM_SRAM_PD_2		0x210C8
> -#define MT8192_L1TCM_SRAM_PDN		0x2102C
> -#define MT8192_CPU0_SRAM_PD		0x21080
> -
> -#define MT8192_SCP2APMCU_IPC_SET	0x24080
> -#define MT8192_SCP2APMCU_IPC_CLR	0x24084
> +#define MT8192_L2TCM_SRAM_PD_0		0x10C0
> +#define MT8192_L2TCM_SRAM_PD_1		0x10C4
> +#define MT8192_L2TCM_SRAM_PD_2		0x10C8
> +#define MT8192_L1TCM_SRAM_PDN		0x102C
> +#define MT8192_CPU0_SRAM_PD		0x1080
> +
> +#define MT8192_SCP2APMCU_IPC_SET	0x4080
> +#define MT8192_SCP2APMCU_IPC_CLR	0x4084
>  #define MT8192_SCP_IPC_INT_BIT		BIT(0)
> -#define MT8192_SCP2SPM_IPC_CLR		0x24094
> -#define MT8192_GIPC_IN_SET		0x24098
> +#define MT8192_SCP2SPM_IPC_CLR		0x4094
> +#define MT8192_GIPC_IN_SET		0x4098
>  #define MT8192_HOST_IPC_INT_BIT		BIT(0)
>  
> -#define MT8192_CORE0_SW_RSTN_CLR	0x30000
> -#define MT8192_CORE0_SW_RSTN_SET	0x30004
> -#define MT8192_CORE0_WDT_CFG		0x30034
> +#define MT8192_CORE0_SW_RSTN_CLR	0x10000
> +#define MT8192_CORE0_SW_RSTN_SET	0x10004
> +#define MT8192_CORE0_WDT_CFG		0x10034
>  
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 
