Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77902C6FD19
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Mar 2023 18:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjCPSPT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Mar 2023 14:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjCPSPT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Mar 2023 14:15:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33E5CB076
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Mar 2023 11:14:56 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h8so2666284plf.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Mar 2023 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678990493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqp+Ruz/AdnKmnGI6Zv/MF4JDiJ9A6hS03v38ROXSso=;
        b=SoOra7MYJ9yivi4lQa+vmZdoc/naYbQn9Og1Qszg3CNCnmunbPcxN6IQPbIdWCxvjX
         A2CGlAaXFkP3JeXKtzf1JiVPR9liWuArRur29p8mmckt6mm4C3MeEgpD2na9oUeLn4JG
         cjzIf2GrTGasQgwLHVk9vzwdwfWyvLsybrVQuf14AnoHT+hWYDtRbhd/4DO0O/bAFjZ4
         hHR01N0LyzuCTjuvpm1C+u2llD2UfK/+mmfns+5H4nH0ZCHpS0w3L50138PZXXyslGT/
         RWes9KJ2go8TmDh2f3qiTVEIckz1KrlgU4QOWerkkpSKlWqRSn4VFGgsv2ljPQAZm7x6
         3LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678990493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqp+Ruz/AdnKmnGI6Zv/MF4JDiJ9A6hS03v38ROXSso=;
        b=T4WH9yAyiCWMdIMCeTdroOuiq9ZPcJVUor+c8kp5sK1KlsWLry9PnYZaXfDQkegtfI
         gZQEyF+NKuadTu0CzKYoZA1HlnC5CCKzhSd+f4As+oXyBwi6tk0nD4QTzz7WuwzTv3O9
         Sgfak3NkF7fR4W2ILaekr4S+wuqBDhhvuHbElL0kqWFygXgxyTT42WwBszmtj8CcCaeW
         BEWTMKpMyZ4s6hQ6fgEgY+EZ+VETjtQx2gMouDzel5YzGsPG80Kt2zQSQYL4sa4yOrF1
         6td7hwtfLMEHcpHXGMcsjpQ7PuMrrsDdHpmBPCOs5etpsGJhVdXI3BrCgXJ6rh3qTkRw
         nNEQ==
X-Gm-Message-State: AO0yUKWgvRZXMLveCubzVJOcNUYD6V1/POcWqIwi2oIlE0KBIPMlZEB3
        Qr/SHnw1fYtYEcEzzVyB9Jiypg==
X-Google-Smtp-Source: AK7set+RPXOketPy5+X+PCkBvQftwRTp+x6bJhpmW+1XHc3+dvZDWj/l3PB2TxM/AHSGIWzWn0XNJg==
X-Received: by 2002:a05:6a20:8b90:b0:d3:5b84:6fcd with SMTP id m16-20020a056a208b9000b000d35b846fcdmr4638504pzh.12.1678990493121;
        Thu, 16 Mar 2023 11:14:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5997:2b9a:5757:d5f4])
        by smtp.gmail.com with ESMTPSA id r20-20020a63ec54000000b004ff6b744248sm5436710pgj.48.2023.03.16.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 11:14:52 -0700 (PDT)
Date:   Thu, 16 Mar 2023 12:14:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     andersson@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] remoteproc/mtk_scp: Fix one kernel-doc comment
Message-ID: <20230316181450.GA2421452@p14s>
References: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 16, 2023 at 04:40:11PM +0800, Yang Li wrote:
> Fixs the function name in kernel-doc comments to clear the below
> warning:
> 
> drivers/remoteproc/mtk_scp_ipi.c:136: warning: expecting prototype for scp_ipi_lock(). Prototype was for scp_ipi_unlock() instead
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4544
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/remoteproc/mtk_scp_ipi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index fc55df649b40..9c7c17b9d181 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -125,7 +125,7 @@ void scp_ipi_lock(struct mtk_scp *scp, u32 id)
>  EXPORT_SYMBOL_GPL(scp_ipi_lock);
>  
>  /**
> - * scp_ipi_lock() - Unlock after operations of an IPI ID
> + * scp_ipi_unlock() - Unlock after operations of an IPI ID

I have applied this patch.

Thanks,
Mathieu

>   *
>   * @scp:	mtk_scp structure
>   * @id:		IPI ID
> -- 
> 2.20.1.7.g153144c
> 
