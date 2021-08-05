Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10739C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:37:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC77460EE9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhHEQhl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 12:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhHEQhl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 12:37:41 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7B5C061765
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 09:37:26 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so10888016pjb.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ScCSrb+0LlElQBDZymqW4N+GFGFpMM8jxuWTV0UN0ys=;
        b=Jq0q2K+Yrtw+0B/X0gAkJfeVD9YOMZeEG6YZmvQrAiA+EDZ9q3MyoKDSXKaFKwo3JU
         BZxgewbkNDqUGKH8AD+AvDOdLFsfan1cRt5uah5iSpqIxhmVnuQpL41kvNaTuzETq1GA
         3MjYMTKx4Vga4iNe4mBN97LoF8mEXPxB0+CCNsqkNjfKyGplFtuwAKS7rcnYahbLJbui
         cxNwt0L1Z44gr2Gl2D2x0CFBftpEUda/4d3y3UTcoNTAzux7kZBRfBgjwMgFUt+rgYQe
         0amb4iNXhdlipM8PhZvnrbsk/RVjPmufcdiNJCFf2VIAK3uDCgFf9Q9J+CdtC5IvK7GD
         HR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ScCSrb+0LlElQBDZymqW4N+GFGFpMM8jxuWTV0UN0ys=;
        b=FTc0CWs1EMIi33O6BB54gUoreG/O1kJxGC84j8soVmCQke7pByQaV7Y4ihDSUHQY6R
         +yyeLa+dId5UBXfH9FLhrYJe1KFPgGtZQM0frOfEXlCOmJ69/MGohyB9dqEd94VZ3MMf
         YGkDgdxot3YnahWhbseMIg75Ie2OvRj6TQIDYxg3WJ4tw/UiVs34OhabSr64SMXWMF6U
         7qoWy1HS7plG2uV63b7MH42BIJzgqCtZSFt5sVCZzArwqUt4+w/+AjIY9nUQR1wcre0O
         fy0rlYHIgIRU7mh7v1VMxGRMUFEJcqotdX83eQCWkylO/LCU6yhQLoRWPsI2FdUT0lJh
         yJKw==
X-Gm-Message-State: AOAM530wrbBbrB/JmYHMinuDd+qqHigrTh7uLfxNNhOQJ98RwzKuzMAs
        XcUBuhlVLLFG1CcUoY27LK5mxw==
X-Google-Smtp-Source: ABdhPJz3U5WBhG6HDzWmDkcO9tCnQS+NsBaAwcTZpQCR+8C1giZ3HKcGcTxyHZaT46ODcbTJxYLPbA==
X-Received: by 2002:a17:90b:8c5:: with SMTP id ds5mr16367049pjb.212.1628181445659;
        Thu, 05 Aug 2021 09:37:25 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w9sm7265985pfg.151.2021.08.05.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:37:25 -0700 (PDT)
Date:   Thu, 5 Aug 2021 10:37:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org, cleger@kalray.eu,
        peng.fan@nxp.com
Subject: Re: [PATCH v3 1/5] remoteproc: fix the wrong default value of
 is_iomem
Message-ID: <20210805163723.GD3205691@p14s>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805033206.1295269-1-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Please respin this set with all the RB and TB tags.

Thanks,
Mathieu

On Thu, Aug 05, 2021 at 11:32:02AM +0800, Dong Aisheng wrote:
> Currently the is_iomem is a random value in the stack which may
> be default to true even on those platforms that not use iomem to
> store firmware.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v2->v3:
>  * no changes
> v1->v2:
>  * update rproc_copy_segment as well
> ---
>  drivers/remoteproc/remoteproc_coredump.c   | 2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index aee657cc08c6..c892f433a323 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -152,8 +152,8 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
>  			       struct rproc_dump_segment *segment,
>  			       size_t offset, size_t size)
>  {
> +	bool is_iomem = false;
>  	void *ptr;
> -	bool is_iomem;
>  
>  	if (segment->dump) {
>  		segment->dump(rproc, segment, dest, offset, size);
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index e8078efb3dec..3cd1798f17a3 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -178,8 +178,8 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
>  		u64 offset = elf_phdr_get_p_offset(class, phdr);
>  		u32 type = elf_phdr_get_p_type(class, phdr);
> +		bool is_iomem = false;
>  		void *ptr;
> -		bool is_iomem;
>  
>  		if (type != PT_LOAD)
>  			continue;
> -- 
> 2.25.1
> 
