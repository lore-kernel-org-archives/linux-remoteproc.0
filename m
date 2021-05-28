Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B16C47087
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E599613C9
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhE1ENt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 00:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhE1ENp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 00:13:45 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F6EC061761
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:11:27 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so2333607otk.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NLZGZk1IIUiKipUefoX6gAEG+SOaK13kBUUCFsP8sw8=;
        b=h2/FxC+BMuT6MTN05CbIXCkDh70SSJ/JVH1Z6T8TxND5Svhp95Zko9eP+iIt7pKZRU
         Jv6RUjaR0W+NhmIssmJ4yvw4s27vA5tm8+IzV/7eIfCz2vTDs9iFgOae+3KYcXjYfaDH
         7X++Z6CSq9QTJvFF7ZO+fHxm08UuhK0UEyCQQzQXPiPGoCo+ZUk0oanWAOZv4q8M9E6x
         TxYeAkHVcXZ41f76kM6RZDa8yxAj6Q6Ax+cfETcvgX7/FbhsV7NbER/+GYqvf9U9yZwQ
         MP/fSY+sWAdS1rW/9Fkevf/6VKJzMjz98kkB8FDXlJ7+3xLc8rFv/NBfknUqj93KEqTp
         Y3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NLZGZk1IIUiKipUefoX6gAEG+SOaK13kBUUCFsP8sw8=;
        b=BeRhbaA623VoSnWxufG9/23IeUzU70kAQ6jNY9SYRnnectQkV4166SSeZwZccYwLhH
         TTztfzhEyp21fk5JAsh3IEgEFWIJ6WyoBvOOeSnew+1xSTMmbAhIs982IspRy9zsA0cc
         k/USEbZrJhBKlWnVrkXBUbpDONw+EWN9AlqkxXQTwM86AG3T1HFejwi0F/TSdKZ6/n3I
         QulH+Mnezuxal4fvnIxBKmHIZsjdm/LQ4fmMjcoloYICr7p8vZrrlmZz8TG4d0eIgVtF
         t5I1UbRE//eMEzs794FvAGRX2AJgRIuiGmMspwIXR8wZCc+CZBDlm2xPN385R16vVKab
         8/dg==
X-Gm-Message-State: AOAM530JDiQigR1KXm1ihBiFD9A2PIWgPKApX7/QYsB+vtvJDKuHvDzS
        ALZC9DuACFbyCUf2cbMRyR9qLA==
X-Google-Smtp-Source: ABdhPJwbvxEw3q/rplu08WTagIMx82WZaclJjEH+c1ed8iW5Cla9oL9CC7SALMVKw9KE6kg1IQEeRQ==
X-Received: by 2002:a9d:73d8:: with SMTP id m24mr5398946otk.269.1622175086540;
        Thu, 27 May 2021 21:11:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l9sm863355oou.43.2021.05.27.21.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 21:11:26 -0700 (PDT)
Date:   Thu, 27 May 2021 23:11:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] remoteproc: Add support for detach-only during
 shutdown
Message-ID: <YLBtbHevzyxT4RTK@builder.lan>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522000309.26134-3-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:

> The remoteproc core has support for both stopping and detaching a
> remote processor that was attached to previously, through both the
> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
> unconditionally only uses the stop functionality at present. This
> may not be the default desired functionality for all the remoteproc
> platform drivers.
> 
> Introduce a new rproc state flag 'detach_on_shutdown' that individual
> remoteproc drivers can set to only allow detach in rproc_shutdown()
> that would have been invoked when the driver is uninstalled, so that
> remote processor continues to run undisturbed even after the driver
> removal.
> 

I dislike the introduction of knobs for everything and would much rather
see that we define some sound defaults. Can we make shutdown just do
detach() if that's supported otherwise stop().

This still allows userspace to explicitly stop the detachable remoteproc
before shutdown, if for some reason that's what you want...

Regards,
Bjorn

> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>  include/linux/remoteproc.h            | 3 +++
>  4 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index 0b8a84c04f76..473467711a09 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
> +		if (rproc->state == RPROC_ATTACHED &&
> +		    rproc->detach_on_shutdown) {
> +			dev_err(&rproc->dev,
> +				"stop not supported for this rproc, use detach\n");
> +			return -EINVAL;
> +		}
> +
>  		rproc_shutdown(rproc);
>  	} else if (!strncmp(cmd, "detach", len)) {
>  		if (rproc->state != RPROC_ATTACHED)
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 6019f46001c8..e8ab3eb41f00 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2074,7 +2074,10 @@ void rproc_shutdown(struct rproc *rproc)
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
>  
> -	ret = rproc_stop(rproc, false);
> +	if (rproc->detach_on_shutdown && rproc->state == RPROC_ATTACHED)
> +		ret = __rproc_detach(rproc);
> +	else
> +		ret = rproc_stop(rproc, false);
>  	if (ret) {
>  		atomic_inc(&rproc->power);
>  		goto out;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index ea8b89f97d7b..1785fbcb1075 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
>  		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
> +		if (rproc->state == RPROC_ATTACHED &&
> +		    rproc->detach_on_shutdown) {
> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
> +			return -EINVAL;
> +		}
> +
>  		rproc_shutdown(rproc);
>  	} else if (sysfs_streq(buf, "detach")) {
>  		if (rproc->state != RPROC_ATTACHED)
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 42a1f30e33a7..35ef921676a1 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -530,6 +530,8 @@ struct rproc_dump_segment {
>   * @elf_machine: firmware ELF machine
>   * @cdev: character device of the rproc
>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> + * @detach_on_shutdown: flag to indicate if remoteproc cannot be shutdown in
> + *			attached state and _only_ support detach
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -569,6 +571,7 @@ struct rproc {
>  	u16 elf_machine;
>  	struct cdev cdev;
>  	bool cdev_put_on_release;
> +	bool detach_on_shutdown;
>  };
>  
>  /**
> -- 
> 2.30.1
> 
