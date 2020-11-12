Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E123EC2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 18:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50C072078D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 18:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6t+O0bC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgKLSln (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgKLSln (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 13:41:43 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F3AC0613D1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 10:41:43 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id z24so4947033pgk.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 10:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uh84kx/0UpHAQowU1ZKAXpJfGaxO4XDR+IHkSTgwXeA=;
        b=v6t+O0bCFVN4Kku0mr+QRN5encnGbghV+Zad9ihb+c7UxdX6eiCxoti21WDJGCoVHJ
         oi22opebfJ71IweGa+xVq6KdYVtebgDV39B6PLrl8LC9ul959jgX6N+/yUpf9//HC2JF
         UFejS5KvobwYTuOUkqt99HWcNRqyk5bApTyf4GO+p6GUFCzusLC0IRTUxV9jd8p/4MHU
         5Q9zCxGx++VbysrdxG9WqSYDKrgnO1zIAgqKqui3DfYkwVUH/Hz9RoYKxYJ1A5aBnULZ
         iygrL2wIYFqWNmwx3oyJnpd0N1LFpIATC8KFzXTHqKX7YOjJKGT3AcSY9aue0C/SH6vD
         894w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uh84kx/0UpHAQowU1ZKAXpJfGaxO4XDR+IHkSTgwXeA=;
        b=GXd5h7tHL03f53MJ9G2rsXOsmKq19sfSuDh6G/4isKa4unxWPVndjF/InZUHlmvIPA
         P/vjiikBA6wpRLyDXjFyxjQ21xb8qyABwRjOSih6VX04ZmC5PEebUgwfQIg9BDdkEDAm
         XuNz3rQDafQGUXSpHcxP/pRQ8GNOT20iD71SAfSfWfnwf61gA0oiSB+x/xyoO5QbFM1l
         x5GOob5WCUx0qyEek69k0bV6eRQCW/Gy6C9hTvmvQdpT78RSAxarKtvlkcfPmDU/nmkg
         GcsCCTh3LCHHJnJ9C7NNXhGZP053IdzNF/5GKTXtbWPhRNvNvzpWZwaDNi443db8RQtk
         aNBQ==
X-Gm-Message-State: AOAM531QlmnGU6Sz/Y0PVYe/zb7lIzaxfstYzkiV23h7i/+qkO0XtD+D
        KoIz6JDCVwg2MZu+oixuEl9ymq7p6yU5Ug==
X-Google-Smtp-Source: ABdhPJwbqnxXCH60WA2SbcNyinhUDYsMGpE/1v8XngidwSyYmZBghB/qexODo8V4whOzSFUZB0YHZw==
X-Received: by 2002:aa7:95a6:0:b029:155:336c:3494 with SMTP id a6-20020aa795a60000b0290155336c3494mr735692pfk.17.1605206502762;
        Thu, 12 Nov 2020 10:41:42 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i130sm6789328pgc.7.2020.11.12.10.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 10:41:42 -0800 (PST)
Date:   Thu, 12 Nov 2020 11:41:40 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 00/14] remoteproc: Add support for detaching from rproc
Message-ID: <20201112184140.GA3583825@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <b5cd1310-8f20-3d55-5126-bb20004db889@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5cd1310-8f20-3d55-5126-bb20004db889@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

On Thu, Nov 12, 2020 at 07:20:49PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> 
> On 10/30/20 8:56 PM, Mathieu Poirier wrote:
> > Following the work done here [1], this set provides support for the
> > remoteproc core to release resources associated with a remote processor
> > without having to switch it off. That way a platform driver can be removed
> > or the applcation processor power cycled while the remote processor is
> > still operating.
> 
> I performed some non-regression tests on firmware attachment + few tests on
> detach. I don't see any major problem introduced by this patchset (except the
> minor problem I reported in patch 11/14:remoteproc: correctly process a stop
> request when attached).
> 

Your assessment is correct - I will fix that.

> My concern is that without the bindings, we still have a problem on the recovery.

At this time (and while this feature is being worked on) we have problems with
shutdown and recovery.  The up side is that 1) we know about them and 2) we are
actively working on closing the gab.  As such I am weary of introducting
temporary measures visible to users that will have to be maintained in the
future.  I'd rather simply acknowledge that something is broken.

I will take into account your comments on the bindings (which I haven't looked
at yet).  From there I expect to spin off another revision early to middle of
next week.  If we get this part in for the v5.11 cycle then only crash scenarios
will be left to address.

Thanks for the feedback,
Mathieu

> If a crash occurs while attached to a remote processor, the remote framework is
> in an unexpected state, which requires a system reset to recover it.
> 
> To reproduce the issue, simply generate the crash :
>  cat 1 >/sys/kernel/debug/remoteproc/remoteproc0/crash
> 
> At the end of the mail, I attached a temporary patch to apply on top of this
> series, waiting for the bindings management. The patch shutdowns the attached
> remote processor instead of trying to recover it.
> 
> I wonder if we should fix this for version 4.10 based on the current
> implementation (if the patch window is not closed)...
> Please tell me what would be the best strategy. If it's not too late, I can
> prepare and send a patch tomorrow for v5.10.
> 
> Regards
> Arnaud
> > 
> > The only thing that changes in this revision are the last two patches where
> > device tree bindings to control how to handle attached remote processors have
> > been added.  More specifically two bindings are being proposed:
> > 
> > "autonomous_on_core_reboot": When rproc_cdev_release() or rproc_del() are called
> > and the remote processor has been attached to, it will be detached from (rather
> > than turned off) if "autonomous_on_core_reboot" is specified in the DT.
> > 
> > "autonomous_on_remote_crash": When a remote processor that has been attached to
> > crashes, it will be detached from if "autonomous_on_remote_crash" is specified
> > in the DT. It is _not_ used in this set and presented to show how I intend to 
> > organise things. 
> 
> 
> > 
> > I spent a fair amount of time coming up with the name for the bindings and would
> > welcome other ideas.  I will write a proper yaml file and CC the linux-kernel
> > mailing list once we have an agreement on the naming convention.
> > 
> > Applies cleanly on v5.10-rc1
> > 
> > Thanks,
> > Mathieu
> > 
> > [1]. https://lkml.org/lkml/2020/7/14/1600
> > 
> > Mathieu Poirier (14):
> >   remoteproc: Re-check state in rproc_shutdown()
> >   remoteproc: Remove useless check in rproc_del()
> >   remoteproc: Add new RPROC_ATTACHED state
> >   remoteproc: Properly represent the attached state
> >   remoteproc: Properly deal with a kernel panic when attached
> >   remoteproc: Add new detach() remoteproc operation
> >   remoteproc: Introduce function __rproc_detach()
> >   remoteproc: Introduce function rproc_detach()
> >   remoteproc: Rename function rproc_actuate()
> >   remoteproc: Add return value to function rproc_shutdown()
> >   remoteproc: Properly deal with a stop request when attached
> >   remoteproc: Properly deal with detach request
> >   remoteproc: Add automation flags
> >   remoteproc: Refactor rproc delete and cdev release path
> > 
> >  drivers/remoteproc/remoteproc_cdev.c  |  24 +++-
> >  drivers/remoteproc/remoteproc_core.c  | 183 +++++++++++++++++++++-----
> >  drivers/remoteproc/remoteproc_sysfs.c |  17 ++-
> >  include/linux/remoteproc.h            |  19 ++-
> >  4 files changed, 199 insertions(+), 44 deletions(-)
> > 
> 
> From a04866cf0add0020b65e9ab80d62d44290a1d695 Mon Sep 17 00:00:00 2001
> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Date: Thu, 12 Nov 2020 18:25:52 +0100
> Subject: [PATCH] remoteproc: core fix unexpected state on crash for attached
>  firmware
> 
> The recovery falls in an unexpected state when attached to a remote
> processor.
> As no firmware to load is found, the remote processor has
> just been stopped but associated resources are not free.
> As consequence rproc->power is remaining at 1 and it s no more
> possible to recover the remote processor.
> This patch shutdown the attached remote processor instead of trying
> to recover it.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index a0611d494758..a38209dd782c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1739,6 +1739,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  {
>  	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
>  	struct device *dev = &rproc->dev;
> +	unsigned int rproc_attached = false;
> +
> 
>  	dev_dbg(dev, "enter %s\n", __func__);
> 
> @@ -1750,15 +1752,21 @@ static void rproc_crash_handler_work(struct work_struct
> *work)
>  		return;
>  	}
> 
> +	if (rproc->state == RPROC_ATTACHED)
> +		rproc_attached = true;
> +
>  	rproc->state = RPROC_CRASHED;
>  	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
>  		rproc->name);
> 
>  	mutex_unlock(&rproc->lock);
> 
> -	if (!rproc->recovery_disabled)
> -		rproc_trigger_recovery(rproc);
> -
> +	if (!rproc->recovery_disabled) {
> +		if (!rproc_attached)
> +			rproc_trigger_recovery(rproc);
> +		else
> +			rproc_shutdown(rproc);
> +	}
>  	pm_relax(rproc->dev.parent);
>  }
> 
> @@ -1862,7 +1870,8 @@ int rproc_shutdown(struct rproc *rproc)
>  		return ret;
>  	}
> 
> -	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED &&
> +	    rproc->state != RPROC_CRASHED) {
>  		ret = -EPERM;
>  		goto out;
>  	}
> -- 
> 2.17.1
> 
> 
> 
