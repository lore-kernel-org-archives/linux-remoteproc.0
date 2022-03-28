Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707F3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Mar 2022 15:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239832AbiC1PxJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Mar 2022 11:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239525AbiC1PxH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Mar 2022 11:53:07 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05647100
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Mar 2022 08:51:27 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id o8so12557162pgf.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Mar 2022 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YLjtm7ydfZZ+BXGynkLIc/rSRJ55DVwtbrz/Kmyg7SM=;
        b=b2mu2ZP7QZ2d/n6GJTOzSW2QHzIdw63a2QvmZWuoK3Vu3SNOuFFEDTuR/cBg0Mj71C
         qrz0gFMK5N6N8ReSiF2ex9DgpbFwZLx7V0opO/pEU5uEEi5hopshnYXrM1UWbQ68rhex
         2Sy7AIq4Av7NMkSUFvCPT6pjCzwQ5oQehLmapCUxmBhVQho7Et3uKeUf5WXL9EkrzaQ7
         Ux7Aqq4i8pq+uVujVt+E4n/WBGjtalFTUhoLRXz71l3pet8o2RgE1YPhFqCos07+gBne
         vQrVFuZ4e+gpvD573487NSTmQOcbvDNQAQ309hMN9Oa0hdR/cfHqtwwAbRUUL2FTHkY+
         WXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YLjtm7ydfZZ+BXGynkLIc/rSRJ55DVwtbrz/Kmyg7SM=;
        b=2c4uoYizJS4GSGfQPv9txQJCSqGV9N+fa7aGd23WoiOg55vVZIVcZQyaigqqc7fSk/
         vV/pW2/0gWBm+st5Eszu0bAu4HKocfgOtjfanNKObJIT6StSBDjQvOzw/fJuf6ILAbp8
         SQDvlMaPin4Yftc+JOy3xwBdlAP5pX0BAkmhrZIyZv6plJphhw1tdbhrFmyBkIqPkohE
         BiPBeDO3LJHAOoDqHCLYt/i+RACsJ7U9xjTTtiu5MAA4I8kIUI+fnl1onXDp9yslSh2w
         nqHH+OpzsQR9cd8kl/2vShrhnqWZVjPExDS+HNQhR4oDoQwN4mlgeCEgN6VYq31kVbvA
         n2aA==
X-Gm-Message-State: AOAM533Nd1YmiMYA1ig42TKgqb7tzf9t7TJH21ShP4+lZGXgrucRZl4z
        TJMJNWgAX4rDiPzHoauCXdyt504Djhksqg==
X-Google-Smtp-Source: ABdhPJwdh2kWwn2syZGg4nZ7z+V9UcQou30wQ07zYHRtiv0sTdiCzaPg+4DL7WSLGEhr7aGs8RhG3g==
X-Received: by 2002:a63:86:0:b0:36c:48e8:627e with SMTP id 128-20020a630086000000b0036c48e8627emr10906948pga.53.1648482686553;
        Mon, 28 Mar 2022 08:51:26 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w8-20020a63a748000000b0038117e18f02sm13472788pgo.29.2022.03.28.08.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 08:51:25 -0700 (PDT)
Date:   Mon, 28 Mar 2022 09:51:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Don't bother checking the return value of
 debugfs_create*
Message-ID: <20220328155123.GA3722211@p14s>
References: <20220324181224.21542-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324181224.21542-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mani,

On Thu, Mar 24, 2022 at 11:42:24PM +0530, Manivannan Sadhasivam wrote:
> DebugFS APIs are designed to return only the error pointers and not NULL
> in the case of failure. So these return pointers are safe to be passed on
> to the successive debugfs_create* APIs.
> 
> Therefore, let's just get rid of the checks.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index b5a1e3b697d9..2e2c4a31c154 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -386,16 +386,8 @@ void rproc_remove_trace_file(struct dentry *tfile)
>  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
>  				       struct rproc_debug_trace *trace)
>  {
> -	struct dentry *tfile;
> -
> -	tfile = debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
> +	return debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
>  				    &trace_rproc_ops);
> -	if (!tfile) {
> -		dev_err(&rproc->dev, "failed to create debugfs trace entry\n");
> -		return NULL;
> -	}
> -
> -	return tfile;

Please see this thread [1] for an earlier conversation on this topic.

[1]. https://lore.kernel.org/lkml/20220105131022.25247-1-linmq006@gmail.com/T/

>  }
>  
>  void rproc_delete_debug_dir(struct rproc *rproc)
> @@ -411,8 +403,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
>  		return;
>  
>  	rproc->dbg_dir = debugfs_create_dir(dev_name(dev), rproc_dbg);
> -	if (!rproc->dbg_dir)
> -		return;
> 
>  	debugfs_create_file("name", 0400, rproc->dbg_dir,
>  			    rproc, &rproc_name_ops);
> @@ -430,11 +420,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
>  
>  void __init rproc_init_debugfs(void)
>  {
> -	if (debugfs_initialized()) {
> +	if (debugfs_initialized())
>  		rproc_dbg = debugfs_create_dir(KBUILD_MODNAME, NULL);
> -		if (!rproc_dbg)
> -			pr_err("can't create debugfs dir\n");
> -	}

The above two are fine since debugfs_create_file() and debugfs_create_dir() can
deal with @parent being an error code.

Thanks,
Mathieu

>  }
>  
>  void __exit rproc_exit_debugfs(void)
> -- 
> 2.25.1
> 
