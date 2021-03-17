Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EA9C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Mar 2021 19:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F0BD64F4D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Mar 2021 19:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbhCQTPP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbhCQTOo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 15:14:44 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42970C06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 12:14:44 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id c12-20020a4ae24c0000b02901bad05f40e4so819964oot.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 12:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g9fo32zIMywDmkalH1qKvmJRPNyM2Hr5LB6vnu4P+0A=;
        b=g8Wd5Cg42nwpe8q2cavQbP3Wwt39ymrMQf067hKxjVTbSTWB5/pj6/VICVYsqE5Phr
         cKabUG58b0efCxHe60fSf+//Pv0lghf/IfqzIr8Q5PVtcxsUvWaed49LyriX24N3Owq+
         F4VQY29T8/yqel+EsuXXSbkHJG/N08jyzVuskPRtLd3dEygz1igdxDNXCm058omcP1y7
         cdvabGQJcO6u3tn5MMzoQrL2ZoZVsJNcHSFCIcg8gDvzqTqJOoqNdpdEXWc0cMVJFjIs
         2Oh3FkFeejKot97G3VPwpS8yE3jpjnjFflly1ixatGqyudXVnoeBw5xuZeZqV02M96sn
         StcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g9fo32zIMywDmkalH1qKvmJRPNyM2Hr5LB6vnu4P+0A=;
        b=tLRTYFNTCWdXT7AS2ONo5K/7DdyKOHR44XBAo4KdrWReNNtDQWDoQYOhIWjFaNxOB8
         RZzmLG2ELlwE3HhiJ9Bc7icPDcid8ZiKaTDARbKnHEKdgQHkGr/W+9mg2SMLDTUGy/FX
         0oFySQ1iHaICcO5NtaodBKDRruPlQYLkvp1L9iEhyMLmajuhLX3fnC3jvYFUb54gDkjN
         oCO190pAJH0pDr5W6xiyO62ibzfLBJXhXRJ1JKBsND7zUrlSycV75+Xk4IiPUlOpZdJj
         ubo9KqlW3Yer6eQ2PyNAHAYdg54ZZZeFUjYnCZnl6XBrD7GnrqJO1ORdRyMFCGkhrZQn
         Za6A==
X-Gm-Message-State: AOAM532KYhwL+axPI/kV5JfsiOcggcy0ERsKU8Irb2pAEvOsvpwnHQdF
        LAq1HDki0Yb/vlkGOTRhhIIgaw==
X-Google-Smtp-Source: ABdhPJxruRMgj2ESsfTROG9di9oS8+XDw7YgLmoAT+Pnji2hikqyt+89hEKD0W3IIBE7eOYel4NUWA==
X-Received: by 2002:a4a:395d:: with SMTP id x29mr4461590oog.41.1616008483668;
        Wed, 17 Mar 2021 12:14:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 64sm8714987oob.12.2021.03.17.12.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:14:43 -0700 (PDT)
Date:   Wed, 17 Mar 2021 14:14:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192
 SCP
Message-ID: <YFJVIfTPnZe/SfgX@builder.lan>
References: <20210317034311.2281708-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317034311.2281708-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 16 Mar 22:43 CDT 2021, Tzung-Bi Shih wrote:

> DEVAPC (device access permission control) is a MPU (memory protection
> unit) in MT8192.
> 
> To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> domain.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

As written here Tinghan is the author of the commit, but the author of
the patch is Tzung-Bi. Please resolve this.

Regards,
Bjorn

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 2 ++
>  drivers/remoteproc/mtk_scp.c    | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 61901f5efa05..2aa9fdf5e59b 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -51,6 +51,8 @@
>  #define MT8192_CORE0_WDT_IRQ		0x10030
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
> +#define MT8192_SCP_DEVAPC_DOMAIN	0x85080
> +
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e..50bdec5a97e3 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
>  
> +	/* set to DEVAPC (device access permission control) domain 3 */
> +	writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
> +
>  	return 0;
>  }
>  
> -- 
> 2.31.0.rc2.261.g7f71774620-goog
> 
