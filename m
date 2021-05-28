Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DBCC2B9F7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 15:09:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3381611C2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 15:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbhE1PKw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 11:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhE1PKv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 11:10:51 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4444C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 May 2021 08:09:15 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q16so1768676pls.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 May 2021 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=COCYNxlGniVWLUglCEtbTut6ZdY+Pq4JgW48n0IpT84=;
        b=WTxda/Cp1mXnp/85bXAtFPvlw6RdyQBPOXugOPV0EJpEOxBma2Z5c6LJKbLEpIo7pR
         3EgrsQMEED2Ofj9ZyjvxDdOf0jW9WEqUSoOUuCL72kSxv6VocWBHhSWQ9b3ciC11mKZM
         b9AOElpQAYzFk33+5/7FUMAY6Snk1YBcwstg3pyaqk4L7kQ5a5hldGWfWzNll7CHC9Ev
         pr+nlv4ha1GtzyS/R7YC5U0scTUNqBnT0Za5UZpdVIB0rUotqEYWxerD3O9vJAMNNK3P
         qd4c23wLokVP9DXm4QBHz6NaVr8iEsfI+yNDER2p1dott3ZYRWwPbLssE3bj1CHWl69G
         ADxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=COCYNxlGniVWLUglCEtbTut6ZdY+Pq4JgW48n0IpT84=;
        b=l+lOXllWuWlmDytzF5ke5X7j8X8uIuCAmGB3jcCiEj3BkbsoCiF/UChW2fyGhujXOn
         7wHBNp9+irDtHE3ObnqgBW05K9cxb2+q05Yvt4XOWyvI3yuvG0NM8RB+tFpwrztrIZFz
         jwEGEF9wcAruLZiB3S1qGza9FEE1qftMVdf4Nk8gwQmCf4THXBjzYiW5t0cDyTnNisX4
         JkbICoUbyMcZwjvZiPu2cpMdGOKSQ/b3uub2ABuPPoKYtni9w9Mvid5iUq+FM8eQICtD
         JnvOw4xdbeBZeJfCncrqzZE2VeRZ/RtYnI52TLEx0dWtleYNz/PLqsQccezFj7Kubo+h
         E09A==
X-Gm-Message-State: AOAM533ziw6eA0bI2WK7O9+bc5tMFMzPXl8I/K2yiS8Ilsfus91yYDN7
        YomYGaLMnmDJRD21Tb+ENjVc8Q==
X-Google-Smtp-Source: ABdhPJxLW5HcmwR1J11w7y68nOohx1ERp10zilmYVXxKP0MKPee9RkISAIEcUT1oU2OZsuLB6giABw==
X-Received: by 2002:a17:90a:898c:: with SMTP id v12mr2134356pjn.72.1622214555324;
        Fri, 28 May 2021 08:09:15 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y129sm4382096pfy.123.2021.05.28.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:09:13 -0700 (PDT)
Date:   Fri, 28 May 2021 09:09:12 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alex Elder <elder@linaro.org>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] remoteproc: use freezable workqueue for crash
 notifications
Message-ID: <20210528150912.GA1354763@xps15>
References: <20210519234418.1196387-1-elder@linaro.org>
 <20210519234418.1196387-2-elder@linaro.org>
 <YLBpmdZoGDXNz64y@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLBpmdZoGDXNz64y@builder.lan>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 27, 2021 at 10:55:05PM -0500, Bjorn Andersson wrote:
> On Wed 19 May 18:44 CDT 2021, Alex Elder wrote:
> 
> > When a remoteproc has crashed, rproc_report_crash() is called to
> > handle whatever recovery is desired.  This can happen at almost any
> > time, often triggered by an interrupt, though it can also be
> > initiated by a write to debugfs file remoteproc/remoteproc*/crash.
> > 
> > When a crash is reported, the crash handler worker is scheduled to
> > run (rproc_crash_handler_work()).  One thing that worker does is
> > call rproc_trigger_recovery(), which calls rproc_stop().  That calls
> > the ->stop method for any remoteproc subdevices before making the
> > remote processor go offline.
> > 
> > The Q6V5 modem remoteproc driver implements an SSR subdevice that
> > notifies registered drivers when the modem changes operational state
> > (prepare, started, stop/crash, unprepared).  The IPA driver
> > registers to receive these notifications.
> > 
> > With that as context, I'll now describe the problem.
> > 
> > There was a situation in which buggy modem firmware led to a modem
> > crash very soon after system (AP) resume had begun.  The crash caused
> > a remoteproc SSR crash notification to be sent to the IPA driver.
> > The problem was that, although system resume had begun, it had not
> > yet completed, and the IPA driver was still in a suspended state.
> > 
> > This scenario could happen to any driver that registers for these
> > SSR notifications, because they are delivered without knowledge of
> > the (suspend) state of registered recipient drivers.
> > 
> > This patch offers a simple fix for this, by having the crash
> > handling worker function run on the system freezable workqueue.
> > This workqueue does not operate if user space is frozen (for
> > suspend).  As a result, the SSR subdevice only delivers its
> > crash notification when the system is fully operational (i.e.,
> > neither suspended nor in suspend/resume transition).
> > 
> 
> This makes sense to me; both that it ensures that we spend our resources
> on the actual system resume and that it avoids surprises from this
> happening while the system still is in a funky state...
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> But it would be nice to get some input from other users of the
> framework.
> 

This patch is in my review queue - I should be able to get to it by the end of
next week.

> Regards,
> Bjorn
> 
> > Signed-off-by: Alex Elder <elder@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 39cf44cb08035..6bedf2d2af239 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2724,8 +2724,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
> >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> >  		rproc->name, rproc_crash_to_string(type));
> >  
> > -	/* create a new task to handle the error */
> > -	schedule_work(&rproc->crash_handler);
> > +	/* Have a worker handle the error; ensure system is not suspended */
> > +	queue_work(system_freezable_wq, &rproc->crash_handler);
> >  }
> >  EXPORT_SYMBOL(rproc_report_crash);
> >  
> > -- 
> > 2.27.0
> > 
