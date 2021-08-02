Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFFDC4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 18:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1BCC60EC0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 18:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhHBSoo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Aug 2021 14:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhHBSoo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Aug 2021 14:44:44 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959E4C06175F
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Aug 2021 11:44:34 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k1so20678463plt.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Aug 2021 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xw9+sFIfMAH/HmCEcLTBDtyZL+QXMp45a8jz7EGFlQs=;
        b=lNUAgm4cfsGZpZpOBIfUNmXtN6bpNAsKBZqaVqUSw76PKDLn42SaFj8qzAJtj2dzvE
         X67IJRtds0aeKGgwCMiEAGAZ1aAX39E+ydYZIM1LgOvTKRVeLOvahqyDUKBIl2E0l6Bh
         /n1F/7zdCGy7oZW7a6+q2RdIDS8pC4A/kvjJPLsre65I03Hg0sqnJvovMmg9jtrmOWNd
         P6ZRhHSTDpirTHe3z2O8cYy2lfv0S9UZ57R7zL5eAfduBATsD7JiAmcZiIN9lYZhAn6b
         jRH+52ZfFZzX0FucOrM8BEPJCNxNfJwNQYGeZ5c1rTIO82QtkN0Z/4l74GEGJIbOFZnq
         z9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xw9+sFIfMAH/HmCEcLTBDtyZL+QXMp45a8jz7EGFlQs=;
        b=dVMNEfz99Q6G6e24Fdgsfdz7e9g/IYsyVafapX+xLe3zUl+e7+3m9k7jaj1XEAfaxd
         2MCS0RihrWz4maqxwyyEYA0L0z95HI2+X3Fr/ngpWO63pEcQ0bYAstbjhl49XLSqcCeJ
         hO+pNKS5gYnFFS0ie7JgtpuTmJwXYmy1T08E8+9Rx4o+NU3D5hwCwoWPlc7qZqZrLZrJ
         GVkuYDhVLG+iBJS8vl/DlNChLK4GuwOBsWOyq9A39ureTM50Lp7hWQKtH/m9spXe2LF4
         KImLMuSu6zoeN5RlfSA9hWI9thRuyhMaFbIJ/oLiRndL2shaJTL32Ukbw8EoB4bWhN4U
         QMKA==
X-Gm-Message-State: AOAM530uhTcCRnYTedzktpz+N8Sxu7ko1c+5nWkjvr9Oq+M6mLA6mliZ
        B1Wh2cREaPhD+HxZxUbfCu2wfw==
X-Google-Smtp-Source: ABdhPJzPw/PEJ0SUwgLcAc/Q/l57IlRuaGBJVb9uZRO2pi9zMLrb7kvAqwkZ0Qx/l0JuxwvxTl36FA==
X-Received: by 2002:a17:90a:1196:: with SMTP id e22mr271872pja.168.1627929874131;
        Mon, 02 Aug 2021 11:44:34 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r13sm14163627pgi.78.2021.08.02.11.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 11:44:33 -0700 (PDT)
Date:   Mon, 2 Aug 2021 12:44:31 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] remoteproc: Add support for detach-only during
 shutdown
Message-ID: <20210802184431.GC3051951@p14s>
References: <20210723220248.6554-1-s-anna@ti.com>
 <20210723220248.6554-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723220248.6554-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 23, 2021 at 05:02:44PM -0500, Suman Anna wrote:
> The remoteproc core has support for both stopping and detaching a
> remote processor that was attached to previously, through both the
> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
> unconditionally only uses the stop functionality at present. This
> may not be the default desired functionality for all the remoteproc
> platform drivers.
> 
> Enhance the remoteproc core logic to key off the presence of the
> .stop() ops and allow the individual remoteproc drivers to continue
> to use the standard rproc_add() and rproc_del() API. This allows
> the remoteproc drivers to only do detach if supported when the driver
> is uninstalled, and the remote processor continues to run undisturbed
> even after the driver removal.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Addressed various review comments from v1
>  - Reworked the logic to not use remoteproc detach_on_shutdown and
>    rely only on rproc callback ops
>  - Updated the last para of the patch description
> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-3-s-anna@ti.com/
> 
>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index 4ad98b0b8caa..16c932beed88 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
> +		if (rproc->state == RPROC_ATTACHED &&

This is already checked just above.

> +		    !rproc->ops->stop) {

This is checked in rproc_stop() where -EINVAL is returned if ops::stop has not
been provided. 

> +			dev_err(&rproc->dev,
> +				"stop not supported for this rproc, use detach\n");

The standard error message from the shell should be enough here, the same way it
is enough when the "start" and "stop" scenarios fail.

> +			return -EINVAL;
> +		}
> +
>  		rproc_shutdown(rproc);
>  	} else if (!strncmp(cmd, "detach", len)) {
>  		if (rproc->state != RPROC_ATTACHED)
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7de5905d276a..ab9e52180b04 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2075,7 +2075,10 @@ void rproc_shutdown(struct rproc *rproc)
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
>  
> -	ret = rproc_stop(rproc, false);
> +	if (rproc->state == RPROC_ATTACHED && !rproc->ops->stop)
> +		ret = __rproc_detach(rproc);
> +	else
> +		ret = rproc_stop(rproc, false);

As I indicated in my last review I think rproc_shutdown() and rproc_del() should
be decoupled and the right call made in the platform drivers based on the state
of the remote processor.  Conditions such as the above make the core code
brittle, difficult to understand and tedious to maintain.

Thanks,
Mathieu

>  	if (ret) {
>  		atomic_inc(&rproc->power);
>  		goto out;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index ea8b89f97d7b..133e766f38d4 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
>  		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
> +		if (rproc->state == RPROC_ATTACHED &&
> +		    !rproc->ops->stop) {
> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
> +			return -EINVAL;
> +		}
> +
>  		rproc_shutdown(rproc);
>  	} else if (sysfs_streq(buf, "detach")) {
>  		if (rproc->state != RPROC_ATTACHED)
> -- 
> 2.32.0
> 
