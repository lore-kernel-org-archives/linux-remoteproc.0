Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C332C4338F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Aug 2021 16:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DACBB60EB2
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Aug 2021 16:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbhHCQYR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Aug 2021 12:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbhHCQXZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Aug 2021 12:23:25 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD65C06175F
        for <linux-remoteproc@vger.kernel.org>; Tue,  3 Aug 2021 09:23:14 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so5441311pjb.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Aug 2021 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jkw6T5ev+Fs+Fpp8cUH9tIjFS5V4c7J1YQazOGamb6w=;
        b=tEjPC6XTpj3hMilcc3IEqfPUn54plIKY7ZNrNJ3lyv3781aWbfE8V8sIeCGi+5Cq3E
         d6UO/q3AlmrklGSX86HTvJNYunrgjgWEBDT4UK1+LOujVuVBfF0iT+6gGez9/MiquJiX
         g8oA5V4859WIeL03mPCsaLakeYW9fATd/njiOxfuxZQxhKl5o7yiclgkrN9ivMjZOomW
         2kY7nXcmsoPRzB4BtlZkY2uf13ujl1OeT4TqHKVhhktlyRDKgmAyntx6l8n/jgIHSW8d
         KBp0osA298v+lZ8N5bf0FiLt8Hc8MJ1JfE/WZc0EA2P+AHDUnvdzBjxZ7q/mDuxQAG+4
         +2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jkw6T5ev+Fs+Fpp8cUH9tIjFS5V4c7J1YQazOGamb6w=;
        b=gHy+C7FZHpSfv1UDe6CWj77BUC7ocoVEOsxGpDeIqygoTSN5R7sPhuHxLma52y/6Az
         Svs9ckBmFj+vGg6fGWLGFHKeq3pZZ7nRYY7OoVzvy422j85o/T36LpW5sgU/LsyqhCmj
         2Ovzco+Gf41VlVZxbnxCa4dCqDv/LyWEP6hGmRU1IfmLNi4xJfBCvhqcHP8uIBjbMt/y
         GP3VCu9SFHlBeMoYMZZ/eS0bgPLtX+k5vBCPMLwWRDFKeFIh86NsJHMv3R82WbpDaG/z
         4qPlk4HygPS3GOUArrQSxlPdcEYtIihocu7SZfqCKMhyp2vKg+3m9gIgZYUQ7Dl9qRI3
         CCow==
X-Gm-Message-State: AOAM532bc1ynH4SZMFJPvK88kW0atZAV3ZoOopxjMmkLR9EwsEqA9bI1
        sqUDPJ1GZELgNE52n6Gugmejgw==
X-Google-Smtp-Source: ABdhPJxY+66Jmd0X0MXxt2obmlJFXlC1SFco3jraQ+LL1Pu2ExK9k8a8svl3a2ik8y+q5nqyn3bhRg==
X-Received: by 2002:a17:902:850a:b029:12c:8da9:8bd2 with SMTP id bj10-20020a170902850ab029012c8da98bd2mr19301659plb.58.1628007793996;
        Tue, 03 Aug 2021 09:23:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t1sm15125166pgr.65.2021.08.03.09.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 09:23:13 -0700 (PDT)
Date:   Tue, 3 Aug 2021 10:23:11 -0600
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
Message-ID: <20210803162311.GB3091608@p14s>
References: <20210723220248.6554-1-s-anna@ti.com>
 <20210723220248.6554-2-s-anna@ti.com>
 <20210802184431.GC3051951@p14s>
 <cd399fef-6db7-72eb-933f-7454a043ed14@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd399fef-6db7-72eb-933f-7454a043ed14@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Mon, Aug 02, 2021 at 06:21:38PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 8/2/21 1:44 PM, Mathieu Poirier wrote:
> > On Fri, Jul 23, 2021 at 05:02:44PM -0500, Suman Anna wrote:
> >> The remoteproc core has support for both stopping and detaching a
> >> remote processor that was attached to previously, through both the
> >> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
> >> unconditionally only uses the stop functionality at present. This
> >> may not be the default desired functionality for all the remoteproc
> >> platform drivers.
> >>
> >> Enhance the remoteproc core logic to key off the presence of the
> >> .stop() ops and allow the individual remoteproc drivers to continue
> >> to use the standard rproc_add() and rproc_del() API. This allows
> >> the remoteproc drivers to only do detach if supported when the driver
> >> is uninstalled, and the remote processor continues to run undisturbed
> >> even after the driver removal.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >> v2: Addressed various review comments from v1
> >>  - Reworked the logic to not use remoteproc detach_on_shutdown and
> >>    rely only on rproc callback ops
> >>  - Updated the last para of the patch description
> >> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-3-s-anna@ti.com/
> >>
> >>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
> >>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
> >>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
> >>  3 files changed, 17 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> >> index 4ad98b0b8caa..16c932beed88 100644
> >> --- a/drivers/remoteproc/remoteproc_cdev.c
> >> +++ b/drivers/remoteproc/remoteproc_cdev.c
> >> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
> >>  		    rproc->state != RPROC_ATTACHED)
> >>  			return -EINVAL;
> >>  
> >> +		if (rproc->state == RPROC_ATTACHED &&
> > 
> > This is already checked just above.
> > 
> >> +		    !rproc->ops->stop) {
> 
> Well, this is checking for both conditions, and not just the stop ops
> independently. We expect to have .stop() defined normally for both regular
> remoteproc mode and attached mode where you want to stop (and not detach), but
> as you can see, I am supporting only detach and so will not have .stop() defined
>  with RPROC_ATTACHED.
> 
> > 
> > This is checked in rproc_stop() where -EINVAL is returned if ops::stop has not
> > been provided.
> 
> rproc_shutdown() actually doesn't return any status, so all its internal
> checking gets ignored and a success is returned today.
> 

That is correct, and I have suggested to add a return value in my previous
review.

> > 
> >> +			dev_err(&rproc->dev,
> >> +				"stop not supported for this rproc, use detach\n");
> > 
> > The standard error message from the shell should be enough here, the same way it
> > is enough when the "start" and "stop" scenarios fail.
> 
> Thought this was a bit more informative, but sure this trace can be dropped.
> 
> > 
> >> +			return -EINVAL;
> >> +		}
> >> +
> >>  		rproc_shutdown(rproc);
> >>  	} else if (!strncmp(cmd, "detach", len)) {
> >>  		if (rproc->state != RPROC_ATTACHED)
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 7de5905d276a..ab9e52180b04 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -2075,7 +2075,10 @@ void rproc_shutdown(struct rproc *rproc)
> >>  	if (!atomic_dec_and_test(&rproc->power))
> >>  		goto out;
> >>  
> >> -	ret = rproc_stop(rproc, false);
> >> +	if (rproc->state == RPROC_ATTACHED && !rproc->ops->stop)
> >> +		ret = __rproc_detach(rproc);
> >> +	else
> >> +		ret = rproc_stop(rproc, false);
> > 
> > As I indicated in my last review I think rproc_shutdown() and rproc_del() should
> > be decoupled and the right call made in the platform drivers based on the state
> > of the remote processor.  
> 
> We have various remoteproc API provided in pairs - rproc_alloc()/rproc_free(),
> rproc_add()/rproc_del(), rproc_boot()/rproc_shutdown() and
> rproc_attach()/rproc_detach(). The drivers are configuring conditions for
> auto-boot and RPROC_DETACHED. The reason they are coupled is primarily because
> of the auto-boot done during rproc_add(). And we handle the RPROC_DETACHED case
> just as well in rproc_boot().
>

The difference with rproc_boot() is that we are checking only the state of the
remoteproc, everything else related to the remote processor operations is
seamlessly handles by the state machine.  It is also tied to the
rproc_trigger_auto_boot() mechanic - decoupling that would be messy without
bringing any advantages other than keeping with a semantic symmetry.

> While what you have suggested works, but I am not quite convinced on this
> asymmetric usage, and why this state-machine logic should be split between the
> core and remoteproc drivers differently between attach and detach. To me,
> calling rproc_detach() in remoteproc drivers would have made sense only if they
> are also calling rproc_attach().

As pointed out above I see rproc_boot() as a special case but if that really
concerns you I'm open to consider patches that will take rproc_attach() out of
rproc_boot(). 

> 
> 
> Conditions such as the above make the core code
> > brittle, difficult to understand and tedious to maintain.
> 
> The logic I have added actually makes rproc_shutdown behavior to be on par with
> the rproc_boot().
> 
> regards
> Suman
> 
> > 
> > Thanks,
> > Mathieu
> > 
> >>  	if (ret) {
> >>  		atomic_inc(&rproc->power);
> >>  		goto out;
> >> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> >> index ea8b89f97d7b..133e766f38d4 100644
> >> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
> >>  		    rproc->state != RPROC_ATTACHED)
> >>  			return -EINVAL;
> >>  
> >> +		if (rproc->state == RPROC_ATTACHED &&
> >> +		    !rproc->ops->stop) {
> >> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
> >> +			return -EINVAL;
> >> +		}
> >> +
> >>  		rproc_shutdown(rproc);
> >>  	} else if (sysfs_streq(buf, "detach")) {
> >>  		if (rproc->state != RPROC_ATTACHED)
> >> -- 
> >> 2.32.0
> >>
> 
