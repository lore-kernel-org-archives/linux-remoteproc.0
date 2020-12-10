Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFDBC433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D3CD2310D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391873AbgLJRXM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 12:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391926AbgLJRXE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 12:23:04 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904D1C061793
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:22:24 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id o25so6551339oie.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LP8E/5zdvXhF7L0Xa3B9f4wSJGNN9FCYt/2fKTc0yL4=;
        b=bofzBQkJidwVuOorIvXOlqPnF7pzxMbxP4MMId9gjosMBxiDUvNL2ACBTB+gu5b74h
         p97hBHgekXZQ4Qu8f+hOUPwK8X0AyMQaJfuH0upcPc0IWUylHCO/UdfVOubt3IBfb6Rs
         itQUn545ChdIZQja7QQWXu9tke9zn/zXYae+14MmUcvhsME4pYZWI/tM/DiiuZJfu70Z
         XHlEdcOr/OF25g0SnPT29pMjBjrhnhQ0WzuTVnki021co3YwBswZUF6vfBuMP7yL/ZKv
         /7GzDFJxdwF03Ua5D9Lnm4JPYftS3HgA7XujO2B30NGDpxIdwpIwRQ7qwu85Z2+2cvLO
         k46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LP8E/5zdvXhF7L0Xa3B9f4wSJGNN9FCYt/2fKTc0yL4=;
        b=DimvcKFFm7PaEgYACZNvrt9OqlJbXg7Fv6NKtrJXpF+xiXCRpkMxwsxZZcVXOLm+Ep
         ldcx7Qa4+xMHb1aTYng7e+uh2sD4UTovWJip1TE3P9dIQ9lp98qlLtE5mSVHxLYLU3xw
         a+WW5pcSlYemtgpte3vKJPUHmgn0gJX02dhiMUaw0vxgV3rMB41ET/Jmtn4mP1joJQVY
         51ZQc1+9djJ8TzHX4vXxVNIBBWLaG/6nZdw7xM5kw7MVpGTRFFTh9r1YO2SkLVR+0wJY
         ntc9SZaisTDG6O9ZsoMVnukJzFAsxDiQS4Qqly5QYOrL882Egg0kcJyHncusZsPjKJ1H
         5PfA==
X-Gm-Message-State: AOAM530VxcKqKSh12xbsPcGj5Q/zYOuXLf1sGVzvyePWxB1mMbXRbHW/
        9FWVog1DzGfOg624VbFfqN+/lA==
X-Google-Smtp-Source: ABdhPJw0/6bJxyUeb6K+T3myDmq7cy6yLfVInhiMogY1aijJ2D0hb0IjRUzL4LgqE+dM2eiAYmxC2Q==
X-Received: by 2002:aca:c3c3:: with SMTP id t186mr6243589oif.53.1607620943826;
        Thu, 10 Dec 2020 09:22:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j15sm1203576ota.39.2020.12.10.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 09:22:23 -0800 (PST)
Date:   Thu, 10 Dec 2020 11:22:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v2 3/3] remoteproc: Add ftrace events to trace lifecycle
 of remoteprocs
Message-ID: <X9JZTWXND7DIEl3P@builder.lan>
References: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
 <1605563084-30385-4-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605563084-30385-4-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 16 Nov 15:44 CST 2020, Rishabh Bhatnagar wrote:

> Add trace events to trace bootup/shutdown/recovery of remote
> processors. These events are useful in analyzing the time
> spent in each step in the life cycle and can be used for
> performace analysis. Also these serve as standard checkpoints
> in debugging.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 19 +++++++-
>  include/trace/events/remoteproc.h    | 91 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+), 1 deletion(-)
>  create mode 100644 include/trace/events/remoteproc.h
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f..39da409 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -42,6 +42,9 @@
>  
>  #include "remoteproc_internal.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/remoteproc.h>
> +
>  #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
>  
>  static DEFINE_MUTEX(rproc_list_mutex);
> @@ -1164,6 +1167,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
>  	struct rproc_subdev *subdev;
>  	int ret;
>  
> +	trace_rproc_subdevices("Prepare subdevices", rproc->name);

Please use specific trace events, rather than these trace_printk() like
ones.

>  	list_for_each_entry(subdev, &rproc->subdevs, node) {
>  		if (subdev->prepare) {
>  			ret = subdev->prepare(subdev);
> @@ -1188,6 +1192,7 @@ static int rproc_start_subdevices(struct rproc *rproc)
>  	struct rproc_subdev *subdev;
>  	int ret;
>  
> +	trace_rproc_subdevices("Start subdevices", rproc->name);
>  	list_for_each_entry(subdev, &rproc->subdevs, node) {
>  		if (subdev->start) {
>  			ret = subdev->start(subdev);
> @@ -1211,6 +1216,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
>  {
>  	struct rproc_subdev *subdev;
>  
> +	trace_rproc_subdevices("Stop subdevices", rproc->name);
>  	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
>  		if (subdev->stop)
>  			subdev->stop(subdev, crashed);
> @@ -1221,6 +1227,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
>  {
>  	struct rproc_subdev *subdev;
>  
> +	trace_rproc_subdevices("Unprepare subdevices", rproc->name);
>  	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
>  		if (subdev->unprepare)
>  			subdev->unprepare(subdev);
> @@ -1357,6 +1364,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	trace_rproc_boot("loading firmware segments into memory", rproc->name);
>  	/* load the ELF segments to memory */
>  	ret = rproc_load_segments(rproc, fw);
>  	if (ret) {
> @@ -1385,6 +1393,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  		goto reset_table_ptr;
>  	}
>  
> +	trace_rproc_boot("starting remoteproc", rproc->name);
>  	/* power up the remote processor */
>  	ret = rproc->ops->start(rproc);
>  	if (ret) {
> @@ -1402,6 +1411,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  
>  	rproc->state = RPROC_RUNNING;
>  
> +	trace_rproc_boot("remoteproc is up", rproc->name);
>  	dev_info(dev, "remote processor %s is now up\n", rproc->name);
>  
>  	return 0;
> @@ -1648,6 +1658,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	/* the installed resource table is no longer accessible */
>  	rproc->table_ptr = rproc->cached_table;
>  
> +	trace_rproc_shutdown("Stopping the remoteproc", rproc->name);
>  	/* power off the remote processor */
>  	ret = rproc->ops->stop(rproc);
>  	if (ret) {
> @@ -1697,6 +1708,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	if (rproc->state != RPROC_CRASHED)
>  		goto unlock_mutex;
>  
> +	trace_rproc_recovery("Recover remoteproc", rproc->name);
>  	dev_err(dev, "recovering %s\n", rproc->name);
>  
>  	ret = rproc_stop(rproc, true);
> @@ -1716,6 +1728,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	/* boot the remote processor up again */
>  	ret = rproc_start(rproc, firmware_p);
>  
> +	trace_rproc_recovery("Recovery completed", rproc->name);
>  	release_firmware(firmware_p);
>  
>  unlock_mutex:
> @@ -1796,6 +1809,7 @@ int rproc_boot(struct rproc *rproc)
>  	/* skip the boot or attach process if rproc is already powered up */
>  	if (atomic_inc_return(&rproc->power) > 1) {
>  		ret = 0;
> +		trace_rproc_boot("Incrementing ref count and exiting", rproc->name);

Why tracing only this case? If you really would like to know if this
ends up booting the core or not perhaps we could include the refcount in
the event?

>  		goto unlock_mutex;
>  	}
>  
> @@ -1804,6 +1818,7 @@ int rproc_boot(struct rproc *rproc)
>  
>  		ret = rproc_actuate(rproc);
>  	} else {
> +		trace_rproc_boot("requesting firmware", rproc->name);

I can see how this would be useful, but don't you want to know the
firmware name? And why not just include it in the trace_rproc_boot event?

>  		dev_info(dev, "powering up %s\n", rproc->name);
>  
>  		/* load firmware */
> @@ -1858,8 +1873,10 @@ void rproc_shutdown(struct rproc *rproc)
>  	}
>  
>  	/* if the remote proc is still needed, bail out */
> -	if (!atomic_dec_and_test(&rproc->power))
> +	if (!atomic_dec_and_test(&rproc->power)) {
> +		trace_rproc_shutdown("Decrementing ref count and exiting", rproc->name);

As above, why not trace all calls to rproc_shutdown()?

>  		goto out;
> +	}
>  
>  	ret = rproc_stop(rproc, false);
>  	if (ret) {
> diff --git a/include/trace/events/remoteproc.h b/include/trace/events/remoteproc.h
> new file mode 100644
> index 0000000..341bf4b
> --- /dev/null
> +++ b/include/trace/events/remoteproc.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM remoteproc
> +
> +#if !defined(_TRACE_REMOTEPROC_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_REMOTEPROC_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(rproc_boot,
> +
> +	TP_PROTO(const char *event, const char *rproc_name),
> +
> +	TP_ARGS(event, rproc_name),
> +
> +	TP_STRUCT__entry(
> +		__string(event, event)
> +		__string(rproc_name, rproc_name)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(event, event);
> +		__assign_str(rproc_name, rproc_name);
> +	),
> +
> +	TP_printk("rproc_boot: %s: %s", __get_str(rproc_name), __get_str(event))

As with the other patch, please don't duplicate the event name in the
printk format.

Regards,
Bjorn

> +);
> +
> +TRACE_EVENT(rproc_shutdown,
> +
> +	TP_PROTO(const char *event, const char *rproc_name),
> +
> +	TP_ARGS(event, rproc_name),
> +
> +	TP_STRUCT__entry(
> +		__string(event, event)
> +		__string(rproc_name, rproc_name)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(event, event);
> +		__assign_str(rproc_name, rproc_name);
> +	),
> +
> +	TP_printk("rproc_shutdown: %s: %s", __get_str(rproc_name), __get_str(event))
> +);
> +
> +TRACE_EVENT(rproc_recovery,
> +
> +	TP_PROTO(const char *event, const char *rproc_name),
> +
> +	TP_ARGS(event, rproc_name),
> +
> +	TP_STRUCT__entry(
> +		__string(event, event)
> +		__string(rproc_name, rproc_name)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(event, event);
> +		__assign_str(rproc_name, rproc_name);
> +	),
> +
> +	TP_printk("rproc_recovery: %s: %s", __get_str(rproc_name), __get_str(event))
> +);
> +
> +TRACE_EVENT(rproc_subdevices,
> +
> +	TP_PROTO(const char *event, const char *rproc_name),
> +
> +	TP_ARGS(event, rproc_name),
> +
> +	TP_STRUCT__entry(
> +		__string(event, event)
> +		__string(rproc_name, rproc_name)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(event, event);
> +		__assign_str(rproc_name, rproc_name);
> +	),
> +
> +	TP_printk("rproc_subdevices: %s: %s", __get_str(rproc_name), __get_str(event))
> +);
> +#endif
> +#include <trace/define_trace.h>
> +
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
