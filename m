Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066E8C4361B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 22:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B860F22CF8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 22:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbgLOWzw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Dec 2020 17:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729921AbgLOWzq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Dec 2020 17:55:46 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F1CC061793
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Dec 2020 14:55:05 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id b24so3575621otj.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Dec 2020 14:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WfTxGeZcQbEkDfESo7Zide/rgubu463P4yV1OlAr/Es=;
        b=wvVXfUa/Q1rbsphDSY8y1GB2Fih6ml2zI7YmbQnNhd9+P9IFpx2LKDa+2kiTnL4W0a
         3pFRWyvZODNQcP77Fkddq3FXpfJFgzUPIssb6f/9UN4ToMmjbTAmrrTuQIYTDbBAZ8kU
         a/eqVE0xDKBdUF/8DbxjOHJTByS2R0oofrA2U99bRvw3ZoNWRnhkcK497qXbKRUbFP4g
         B7TOMZi6sWBMyjGkEmO7x1eGGc21/elGiRWWqH0Neoyg/e6rv8YlOKKhAzQKWrQtZXiE
         fpeqkTuFFjKQuzF1xTpaIiHLYzVZ6LrZDt2DWu/ZfMCAQPaqs8/7z09BCmuYLEEPyGBe
         I5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WfTxGeZcQbEkDfESo7Zide/rgubu463P4yV1OlAr/Es=;
        b=nWZAkkiWZTYOQovlYhxQ6r4oHXisjk7RYQLHU1C5pFvg7dajLVh8fVzIhVTzlLAhCu
         EYJNi/bJk9vE9VIwpyloJiLMewZ+laPbIUbGeo36tRIty7Of0FflSSvXGsB+h/G4H2ks
         GLXeTxH19d4/N/mhoDf0Y26rCoqJOg6j5/8xU5MKwH5uSVVduzwtZHXOvPFb5GnLSQCc
         5n3xXMaw5ehfJoE7DRr/EO9AKE5xujgwlyQ6du2tG5yiJS0XbanMJ4kXLTRoOXsaOcdS
         YG+BwGaJev0xdS4o62h96kL4ANh+ycTL4qsA1oFXNu1QUgE5woku92ZKXktIfBvDSkNl
         GX6w==
X-Gm-Message-State: AOAM532ycJwJ1YMCDI9Gqn5SHDD2GyClKoQXcQyq/8tyeq9ewvvfWPKF
        igeMNaCSCgK7cESqsD4BkMkg9Q==
X-Google-Smtp-Source: ABdhPJwkom0uuTtRSsvlyvDYFUcA87mN0YNXvKqstkNhDakeOds/pc5oYPozNb5OSZl9bi8HHhWbZQ==
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr24529265otb.59.1608072905203;
        Tue, 15 Dec 2020 14:55:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 8sm58567oii.45.2020.12.15.14.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 14:55:04 -0800 (PST)
Date:   Tue, 15 Dec 2020 16:55:02 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, elder@linaro.org
Subject: Re: [PATCH] remoteproc: Create a separate workqueue for recovery
 tasks
Message-ID: <X9k+xmg9SULEbJXe@builder.lan>
References: <1607806087-27244-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607806087-27244-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat 12 Dec 14:48 CST 2020, Rishabh Bhatnagar wrote:

> Create an unbound high priority workqueue for recovery tasks.

This simply repeats $subject

> Recovery time is an important parameter for a subsystem and there
> might be situations where multiple subsystems crash around the same
> time.  Scheduling into an unbound workqueue increases parallelization
> and avoids time impact.

You should be able to write this more succinctly. The important part is
that you want an unbound work queue to allow recovery to happen in
parallel - which naturally implies that you care about recovery latency.

> Also creating a high priority workqueue
> will utilize separate worker threads with higher nice values than
> normal ones.
> 

This doesn't describe why you need the higher priority.


I believe, and certainly with the in-line coredump, that we're running
our recovery work for way too long to be queued on the system_wq. As
such the content of the patch looks good!

Regards,
Bjorn

> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 46c2937..8fd8166 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -48,6 +48,8 @@ static DEFINE_MUTEX(rproc_list_mutex);
>  static LIST_HEAD(rproc_list);
>  static struct notifier_block rproc_panic_nb;
>  
> +static struct workqueue_struct *rproc_wq;
> +
>  typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
>  				 void *, int offset, int avail);
>  
> @@ -2475,7 +2477,7 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  		rproc->name, rproc_crash_to_string(type));
>  
>  	/* create a new task to handle the error */
> -	schedule_work(&rproc->crash_handler);
> +	queue_work(rproc_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> @@ -2520,6 +2522,10 @@ static void __exit rproc_exit_panic(void)
>  
>  static int __init remoteproc_init(void)
>  {
> +	rproc_wq = alloc_workqueue("rproc_wq", WQ_UNBOUND | WQ_HIGHPRI, 0);
> +	if (!rproc_wq)
> +		return -ENOMEM;
> +
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
>  	rproc_init_cdev();
> @@ -2536,6 +2542,7 @@ static void __exit remoteproc_exit(void)
>  	rproc_exit_panic();
>  	rproc_exit_debugfs();
>  	rproc_exit_sysfs();
> +	destroy_workqueue(rproc_wq);
>  }
>  module_exit(remoteproc_exit);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
