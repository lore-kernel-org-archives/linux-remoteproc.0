Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD9C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Mar 2022 23:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiCKXDP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Mar 2022 18:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiCKXDF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Mar 2022 18:03:05 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E326E10E55B
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 14:58:03 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id v75so2179278oie.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 14:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ouXKxtl+8G+GwtOSfWWV903AmhWVHKS99b2n31iKIp0=;
        b=O1KTLBkViqTZcE4jO3SOzLYQ8Mei2Q0WFKGyWQ7q1Z8YSG0iZna9ofEhD8FI7UWF6z
         tPER/jc5vn1cs81+THtmfmovsASEuu8cL32uJb60hesZuTGIhUY65eyZMFg2cc47Q73Q
         FuhcV/gVHTTrsUcWIYK3CUEyun16UeMGBpUYAvy41TxF1qtIZaveH3q6GuDpVV7wiXnZ
         i1dmjE90JWtGhYePMiyO51edeJlKCZz5Vea3iD7NHYxibiq//Ld9uhfyIyRWRQFWl/7P
         tSq33q/j6F+ToeLOezKn+VNRlqO0s0NXR7GYYAyHhIcT6ZCffDol6e78+d61FdBJ6Ywf
         VMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ouXKxtl+8G+GwtOSfWWV903AmhWVHKS99b2n31iKIp0=;
        b=7tD52GRDIScY0i4pIUa6CxowoJyFpxvYLlMAcKI+03IeSRgY6PY90zCkWw63XgqaAn
         cyfdjp3hbmplsP7tMXZKv/4zBK5lA7P8b0ZOvSo//M5oz9VH9U+QPYlKZrJ7i7hlVuOO
         etLVcX1H4XfV7HfB50pdCBDCH5gjqpahk96IZQQXesaU4/vWCscyvzxk07kXLNHh1rTf
         ZST8xjLIR7uU7mjt5Y3YGcBra9BFEtAhOFH1YVWmTMrU9lN43Yh9708V4RjJJ3l6l1pU
         udrJMVbO+AUest21ABL3FiaT97x6mIb6Urt1sVaThnsiYvl2qnS7twGvwxe34k5MtqXY
         mfKw==
X-Gm-Message-State: AOAM533/gTqzSKNJ42tXOkS0pxSzucBDWdH8V9lwYBuyUqnyaiLk1J7g
        L0GYyIhTPFQ7/LhY3XvqK5SBSz+FrMx1/Q==
X-Google-Smtp-Source: ABdhPJy5imBF8v+itpeZObmG9hNl+BNIFPxFEpa5iCCi6LwHq9hqq00WyZ3eP2YdWvG14iZkBA/VnA==
X-Received: by 2002:a05:6870:b42a:b0:d4:fc95:35e8 with SMTP id x42-20020a056870b42a00b000d4fc9535e8mr11876861oap.4.1647032510568;
        Fri, 11 Mar 2022 13:01:50 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j10-20020a4ad2ca000000b0031c515672d0sm4112516oos.23.2022.03.11.13.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 13:01:50 -0800 (PST)
Date:   Fri, 11 Mar 2022 15:01:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org
Subject: Re: [PATCH] remoteproc: Use unbounded/high priority workqueue for
 recovery work
Message-ID: <Yiu4vKuqWHQ5wfZ1@builder.lan>
References: <1642620644-19297-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642620644-19297-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 19 Jan 13:30 CST 2022, Mukesh Ojha wrote:

> There could be a scenario where there is too much load(n number
> of tasks which is affined) on a core on which rproc recovery
> is queued. Due to which, it takes number of seconds to complete
> the recovery.
> 
> If we make this queue unbounded and move it to high priority worker
> pool then this work can be attempted to finished in less time.

I unfortunately find this reasoning for adding WQ_HIGHPRI rather
speculative. Please describe a concrete case that warrants the new
work queue to be high priority.

What is "number of seconds", what is "less time" and why is it more
important to recover some remote processor than whatever else the system
is busy doing?

Thanks,
Bjorn

> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 69f51ac..efb6316 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -59,6 +59,7 @@ static int rproc_release_carveout(struct rproc *rproc,
>  
>  /* Unique indices for remoteproc devices */
>  static DEFINE_IDA(rproc_dev_index);
> +static struct workqueue_struct *rproc_recovery_wq;
>  
>  static const char * const rproc_crash_names[] = {
>  	[RPROC_MMUFAULT]	= "mmufault",
> @@ -2752,8 +2753,10 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -	/* Have a worker handle the error; ensure system is not suspended */
> -	queue_work(system_freezable_wq, &rproc->crash_handler);
> +	if (rproc_recovery_wq)
> +		queue_work(rproc_recovery_wq, &rproc->crash_handler);
> +	else
> +		queue_work(system_freezable_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> @@ -2802,6 +2805,11 @@ static void __exit rproc_exit_panic(void)
>  
>  static int __init remoteproc_init(void)
>  {
> +	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq", WQ_UNBOUND |
> +				WQ_HIGHPRI | WQ_FREEZABLE, 0);
> +	if (!rproc_recovery_wq)
> +		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
> +
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
>  	rproc_init_cdev();
> @@ -2818,6 +2826,8 @@ static void __exit remoteproc_exit(void)
>  	rproc_exit_panic();
>  	rproc_exit_debugfs();
>  	rproc_exit_sysfs();
> +	if (rproc_recovery_wq)
> +		destroy_workqueue(rproc_recovery_wq);
>  }
>  module_exit(remoteproc_exit);
>  
> -- 
> 2.7.4
> 
