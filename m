Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C203C43217
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B4A222DFB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392329AbhASSKU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392277AbhASSJc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 13:09:32 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81E6C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Jan 2021 10:08:50 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id b8so10981157plx.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Jan 2021 10:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wvYlaK07QIZvL6uFhsUqhKZQ4jBBKlHS2j7UncqtakY=;
        b=Mkq6yA+iBjprw5suWpJpUhpkHVfmrDKgTObmmt12N8gB2feJfWIQI5hWAniD7sEHGg
         BBnSb13NVmeQ8uYMv4exLU8ked39DQ0QjoVq+oc3Dimi6qkMAT8vW16G0YlapMfF9E0d
         JkqlbsBK59W4XG0z7heCQZJyvTzdsP+VnkS/aecVmfoloda89DgWHfMWsdn01ElKMpZR
         s5Og4Z8Wvgzg68rO7su9CLDninKsd1aTRkTYMzCBZ2+WPmVfHbBGVw+0HNh5rTjPdsPj
         WypuUtA4LEbkUSFe8mHHz1hX/CScLQ8ZTt/Ptjaef4sNyeiv/3FO4b7H5yqM9BgxeEz3
         IxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wvYlaK07QIZvL6uFhsUqhKZQ4jBBKlHS2j7UncqtakY=;
        b=F9dJY//ffVRT+TNF+NFHsqLsQA2kqILuEw6v/j/wuYCf6W37EddlrzsLNOBanig7pb
         ZrEkdKC2qG0Q70qYOE5EN/Z+yLD07N8rGgBM28pRKgIO2qW9XpF6odKfUv8jL8uXqXkk
         0JvHeO+hdchvXszoToYrOdz6KQi0vUkf4R81yx/7d3YKTvdrQv8xw/6W3+HO9mpdrE+5
         sl8BRdlgUarcjhbIgX5zAr8sfeg26qYCJ5zN4nvTQhG2rHkmPh+kc6QhOqBmm1HoSuJj
         1LOoU8aWy5CZj6llQQ2p1hInJHOMIi+lyKJDRORI+DQzyqP6DR/H7/UAqbk3F6OgjRkm
         cxaQ==
X-Gm-Message-State: AOAM5337OjHegdaSqYey5de7kwiUAdUpnZlWO5N/z8FKMWgdpcCexFEh
        VEnP8QjAd2UtkN3YJUINn3LMUw==
X-Google-Smtp-Source: ABdhPJwSWnMehi2EMAkRqjgJYgpaEiqN3nawkxh2hpcO62igrFxDkssm7d7nWmiv53MNOHwXjo1s+g==
X-Received: by 2002:a17:90b:350:: with SMTP id fh16mr996057pjb.232.1611079730455;
        Tue, 19 Jan 2021 10:08:50 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id gx21sm4538520pjb.31.2021.01.19.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 10:08:49 -0800 (PST)
Date:   Tue, 19 Jan 2021 11:08:48 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Daniele Alessandrelli <daniele.alessandrelli@linux.intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Fix rproc->firmware free in
 rproc_set_firmware()
Message-ID: <20210119180848.GD611676@xps15>
References: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Mon, Jan 18, 2021 at 04:59:04PM +0000, Daniele Alessandrelli wrote:
> From: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> 
> rproc_alloc_firmware() (called by rproc_alloc()) can allocate
> rproc->firmware using kstrdup_const() and therefore should be freed
> using kfree_const(); however, rproc_set_firmware() frees it using the
> simple kfree(). This causes a kernel oops if a constant string is passed
> to rproc_alloc() and rproc_set_firmware() is subsequently called.
> 
> Fix the above issue by using kfree_const() to free rproc->firmware in
> rproc_set_firmware().
> 
> Signed-off-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 2394eef383e3..ab150765d124 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1988,7 +1988,7 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
>  		goto out;
>  	}
>  
> -	kfree(rproc->firmware);
> +	kfree_const(rproc->firmware);
>  	rproc->firmware = p;

Thanks for the fix, I will pick it up shortly.

Mathieu

>  
>  out:
> 
> base-commit: 8cc8eeffd058f3e7e2d8710a514ffcbc2bd69d28
> -- 
> 2.26.2
> 
