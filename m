Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA5C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Mar 2022 18:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349050AbiCHSQK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 8 Mar 2022 13:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345355AbiCHSQK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Mar 2022 13:16:10 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EAD4C788
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Mar 2022 10:15:12 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id l24-20020a4a8558000000b00320d5a1f938so10464884ooh.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Mar 2022 10:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K4GIB1a+cgx4ASeA8RiYFt2Phvx3d2n9qYtTtjZSkjo=;
        b=UuFWGLCWyKSF1937a9Wv2qLhK28Wkbk9bEbbmmrrfvDRJ1Wtzfdj1sks2P69kNILqn
         EPQd5G/VRqb8jjyzV2yyXcuczhNYHyervElZWFcN0DuJdw2O34wuDg6AGovcTtMiCRjr
         PxPxce4e0JuQN4adwPVYMGDm5lUSUNp6hxV2hQBpnRWATRqv8QHWJURKk83phuW448Vb
         NUXR5P8PFZudugMtiyCTu9nfk/2lQ1jwnS06yyX5/MJH9l5qdypLdYhDePlgoTLWudmv
         dQB7ILfS0cZb1jrTD9P7lfXH6OmQOQWT15Fhdbrby8crHAMSNLJi3aCzTz8B36Fo0hb2
         7u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K4GIB1a+cgx4ASeA8RiYFt2Phvx3d2n9qYtTtjZSkjo=;
        b=xv/+t+5R7R9kmRVVfBa1PWyS4nG4sfmfHMuudsJL6yJuZyirLrF1wRrztXFdQA3qh8
         ngp3mPwED13c1eJh/FNalT66wgc9x6i4znP6JIEWOS3AJQVfoebIVMTNoRWpSZeslGtf
         GIo6XZD6cPkYWJrnsXyRGB+Z83JaIFWH/rvWvGhLPM0PLftn9cmHlYdfuJM0LaUfWOGW
         tJcCiNyQpKKvKX+yJoAQIxUHTXrLKoNNlgbsWh1RyVaxYxBYj6r3NErRLlK/mKCZ5Vmh
         oSt5cGh0qhFjyi5z38A9uYjkqMnNXC+V/0cJavTGkj+//cbaS3OM5HBk5NoaSzvyP08U
         Bnbg==
X-Gm-Message-State: AOAM531eFGlGOsKLLSBZe8KKLbB6EjDIJ2PXJFsOVFrrVqB9uugEW+rk
        QyGgGJia6zNL60oaEtmfsli0ag==
X-Google-Smtp-Source: ABdhPJxMxiUBjaZfyfik8ZsFdtHh5D/+Th3AexX3SwQukuqx41mBNh7mZv7BtOgxyId3ct0kIoaJlA==
X-Received: by 2002:a05:6870:3049:b0:da:371b:5864 with SMTP id u9-20020a056870304900b000da371b5864mr3179434oau.105.1646763311852;
        Tue, 08 Mar 2022 10:15:11 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 37-20020a9d0328000000b005b2265711fcsm4672999otv.16.2022.03.08.10.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 10:15:11 -0800 (PST)
Date:   Tue, 8 Mar 2022 10:16:54 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Drew Fustini <dfustini@baylibre.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [PATCH] remoteproc: move rproc_da_to_va declaration to
 remoteproc.h
Message-ID: <YiedlvZWpHd8HP40@ripper>
References: <20220308172515.29556-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308172515.29556-1-dfustini@baylibre.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 08 Mar 09:25 PST 2022, Drew Fustini wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The rproc_da_to_va() API is an exported function, so move its
> declaration from the remoteproc local remoteproc_internal.h
> to the public remoteproc.h file.
> 
> This will allow drivers outside of the remoteproc folder to be
> able to use this API.
> 

Can you explain why drivers outside of the remoteproc folder should be
able to poke straight into the memory of the remoteproc?

Your reasoning makes sense, but we've on purpose kept it out of
remoteproc.h because no one has had a proper reason for it and I sense
that we might open the door for some new creative solutions...

Regards,
Bjorn

> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> [adjusted line numbers to apply]
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
> Note: I previously posted this patch as part of a series:
> [PATCH 00/11] soc: ti: wkup_m3_ipc: support vtt toggle, io isolation & voltage scaling
> https://lore.kernel.org/linux-omap/20220219215328.485660-1-dfustini@baylibre.com/
> 
> I was advised to break that series up into smaller pieces, so I am
> submitting this patch individually. I will in the future post a series
> to support i2c voltage scaling which will utilize rproc_da_to_va() from 
> drivers/soc/ti/wkup_m3_ipc.c
> 
>  drivers/remoteproc/remoteproc_internal.h | 1 -
>  include/linux/remoteproc.h               | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index a328e634b1de..72d4d3d7d94d 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -84,7 +84,6 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>  
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e0600e1e5c17..cc9dc9aef0c0 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -673,6 +673,7 @@ void rproc_shutdown(struct rproc *rproc);
>  int rproc_detach(struct rproc *rproc);
>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
>  void rproc_coredump_using_sections(struct rproc *rproc);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> -- 
> 2.32.0
> 
