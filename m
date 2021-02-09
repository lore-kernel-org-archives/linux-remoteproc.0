Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B03C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 23:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A160060202
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 23:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbhBIXvE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Feb 2021 18:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234141AbhBIWO5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 17:14:57 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601DFC08EB26
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 Feb 2021 13:49:00 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u11so17221plg.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Feb 2021 13:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gz4cNSN6A5yTbdaLYEqUq37CdDcqhCeiQUxDlnUTM6s=;
        b=qi5AQqU93CXsSebvhKZL6ame+n1zAShfw9b9yavPQPwywrZuvz29AeStiQY9H0fI+f
         2btsjg0PARbxBvIRBIM1nYhyx4WxD4dvH1vrhccs4NiVYyeHDcl66kfWrLk1icHzQmq4
         7Qvb8oUBsV/KzSJ+I1XBXGbM6ACq2B7oCovjDXpIiCX1irW6E8P14h8HunTIRI4EIfmz
         8X8ObDrvnEvx/NAWAkfG83JDvaMO4azz2EHGiI1wW0gsDLS1/151aE7Mk+YO+2orxaFQ
         2K4hMfGdbDt0Ns6QnAD8ATyeBFn3wFO+FyMaKcNcscrG0ZYLAhhEx1KeQzSTeGcGvNHx
         svWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gz4cNSN6A5yTbdaLYEqUq37CdDcqhCeiQUxDlnUTM6s=;
        b=V6aIkiovn/z6GBm5TZtcQoYOazMOFbM9oxMDhNCZHEp6ZLgoCuRQ4zAOHbHAEQGkCf
         2mhxMee7zvFfTEn15VFduTr3JGhsLDcdzxM9jqa3Wk50MoRdE391j4KFCrBFHPw+w5yY
         EVeZTeFH4Fzqe6TKN4j5lAQLSKBSlmWvMbX1mMlKjjId3Rop1+Ly5KXSUGp6XmDR46VF
         Z1zbxqlFZ6agEB5xXJmriYRFMzqIRsWtZOAgyktenQoTlvNdh4uEwBRl6K6XNTMZ27aq
         JnRJsiz3c7BeU1yjV46PQihScUJ6/glBAp16tA2J//UEg/VNk9r3azJ5xfdMozTjDN5M
         3jjA==
X-Gm-Message-State: AOAM531lMErvFwsCGrIeKrpc7LJ979V3mU5R+DfsnQTFHA8x6O+WIn+h
        64MV2I4fV78EvanBOsZlbNqE/t18cLDFqg==
X-Google-Smtp-Source: ABdhPJy5ia1/mrkP0Jb/NtSg0QqKCH8IuYUT4GczrGwmNSXp7BR3Xwl/d8Djnmqz+T+9FOU5O2mwQQ==
X-Received: by 2002:a17:902:d20e:b029:e1:79fe:2f89 with SMTP id t14-20020a170902d20eb02900e179fe2f89mr22779307ply.9.1612907339994;
        Tue, 09 Feb 2021 13:48:59 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a5sm23045567pgl.41.2021.02.09.13.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 13:48:59 -0800 (PST)
Date:   Tue, 9 Feb 2021 14:48:57 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Daniele Alessandrelli <daniele.alessandrelli@linux.intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Fix rproc->firmware free in
 rproc_set_firmware()
Message-ID: <20210209214857.GB1582054@xps15>
References: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  out:
> 
> base-commit: 8cc8eeffd058f3e7e2d8710a514ffcbc2bd69d28
> -- 
> 2.26.2
> 
