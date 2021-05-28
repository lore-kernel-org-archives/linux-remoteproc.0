Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF5CC47087
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA3786139A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236389AbhE1D4m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 May 2021 23:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbhE1D4l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:56:41 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB55AC061760
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:55:07 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so2316597otg.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=th3cMW/uHqfkYc4UAOg+68J71gkXcehibaZ/5iZlr+s=;
        b=xBfmnwAvVEUMVB/IoBr91C77WEN0JHUM8/mdBFp5ZizTxDt+Mv6uWo0VjT8fzACfEs
         XtVuTNhwb2YaLBZtFccc8jGKJpTcQTO9mkadStybxRRlDqbufgp88Gxc6KQtYWHhzve9
         QGkAvnIzkVk2BSpKrf6De3UXb0a+5GPd3oLxRfWkdljlXF2sD1OL1siIApk7/v14MJw+
         K6MSgJu8dghGFKRzzBKk/RyTYm6kZcYp6cqH1bfk1HjSaDJjlQE5kgKkyFLxnW5/tlP5
         EU1CcbTS04Q5shgEuch0xXhwTzHmmwSTW9hPvpgEz7GUSYPa2Gj8jcgkUxDPOA7nMejn
         6FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=th3cMW/uHqfkYc4UAOg+68J71gkXcehibaZ/5iZlr+s=;
        b=bo/xCaM0BChCZf6NoCiXXPHu1dv8XuHexddNOih2L4awLQ1eAz4xOZCZ/rYAgqCIv5
         Xcmg/NKWjB2RT14PKwJd7y98Ith3D9KAFhy5q/rcOUZBIJIICwnQCS9MlgCgMMZ0OY/o
         fOko3hI7qk7JWIXjfiQ6tn+jN9nc9/Btq2Qddv0Q/Gz9QWUHKDPIgmMqTKMbDnt2+op/
         WBqDAm1FLnU7Gk2P1Mz35se00GEUYeZui341suVRcRoKXVLqRUM3og/UquynbgMohm/r
         qXbRY/RVLkjQkmsYSwebKUs92ArjMHzMFei1pqWoS+TrHnS1hx4yafrjijr8Cj40cdCk
         i+jw==
X-Gm-Message-State: AOAM530rpeVnanz36ETHnIQ+XXjK36T1rFqe3//z2nV8IrkpouYIBps5
        KP1xuc7A2N1EhHBWDLxOa/Sh1Q4uLiNkzA==
X-Google-Smtp-Source: ABdhPJyDjy4sDP0bdooOXQLn6eUpfZaVIiDaLEexdnEGytBrx8jC2j+YdBBJpdpi5+1rOt/08jbEgw==
X-Received: by 2002:a05:6830:20ce:: with SMTP id z14mr5570554otq.87.1622174107241;
        Thu, 27 May 2021 20:55:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z15sm922202otp.20.2021.05.27.20.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:55:06 -0700 (PDT)
Date:   Thu, 27 May 2021 22:55:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] remoteproc: use freezable workqueue for crash
 notifications
Message-ID: <YLBpmdZoGDXNz64y@builder.lan>
References: <20210519234418.1196387-1-elder@linaro.org>
 <20210519234418.1196387-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519234418.1196387-2-elder@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 19 May 18:44 CDT 2021, Alex Elder wrote:

> When a remoteproc has crashed, rproc_report_crash() is called to
> handle whatever recovery is desired.  This can happen at almost any
> time, often triggered by an interrupt, though it can also be
> initiated by a write to debugfs file remoteproc/remoteproc*/crash.
> 
> When a crash is reported, the crash handler worker is scheduled to
> run (rproc_crash_handler_work()).  One thing that worker does is
> call rproc_trigger_recovery(), which calls rproc_stop().  That calls
> the ->stop method for any remoteproc subdevices before making the
> remote processor go offline.
> 
> The Q6V5 modem remoteproc driver implements an SSR subdevice that
> notifies registered drivers when the modem changes operational state
> (prepare, started, stop/crash, unprepared).  The IPA driver
> registers to receive these notifications.
> 
> With that as context, I'll now describe the problem.
> 
> There was a situation in which buggy modem firmware led to a modem
> crash very soon after system (AP) resume had begun.  The crash caused
> a remoteproc SSR crash notification to be sent to the IPA driver.
> The problem was that, although system resume had begun, it had not
> yet completed, and the IPA driver was still in a suspended state.
> 
> This scenario could happen to any driver that registers for these
> SSR notifications, because they are delivered without knowledge of
> the (suspend) state of registered recipient drivers.
> 
> This patch offers a simple fix for this, by having the crash
> handling worker function run on the system freezable workqueue.
> This workqueue does not operate if user space is frozen (for
> suspend).  As a result, the SSR subdevice only delivers its
> crash notification when the system is fully operational (i.e.,
> neither suspended nor in suspend/resume transition).
> 

This makes sense to me; both that it ensures that we spend our resources
on the actual system resume and that it avoids surprises from this
happening while the system still is in a funky state...

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

But it would be nice to get some input from other users of the
framework.

Regards,
Bjorn

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 39cf44cb08035..6bedf2d2af239 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2724,8 +2724,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -	/* create a new task to handle the error */
> -	schedule_work(&rproc->crash_handler);
> +	/* Have a worker handle the error; ensure system is not suspended */
> +	queue_work(system_freezable_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> -- 
> 2.27.0
> 
