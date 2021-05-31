Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA71C47080
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 May 2021 17:46:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C1961186
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 May 2021 17:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhEaRrt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 31 May 2021 13:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbhEaRrd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 May 2021 13:47:33 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77D9C0612A7
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 May 2021 10:21:56 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id v12so5508983plo.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 May 2021 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0UQpSMC1R+2Xa12LBVW7x40T3z3R/9Jq0QsvLZP5FHQ=;
        b=PY3S1B9SWEFG0pRMqrSIevRJgIxUSSfpOJJdgMmbTjBoNfuIY1YJqsev+Zba8gWNKm
         5Po7yoXdfbuFzLxk8kaUv9fmsMs8pMf+NaeANmMiOJyRGb+8Zrfad0a3g5qCdnh3vJrN
         nkvmY3+mUugnrb7gZgUTicN7K9AjoPcP9ZwPeTAqzT6oJqcKcaHkz2GnIRKOZNQ/9doY
         yyLiErefayU3NndHJrsb0XrUC8ZRXetV6rbEfqW3bCnuD0dSj6YWsoPg/0UlpMW58pCj
         csF6LbOIhqmfEwTpTDa/cthrUsEPH+xf+DzMF5qFm3MYqs4Qw/4nb21+eut3gbbRfGcf
         xofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0UQpSMC1R+2Xa12LBVW7x40T3z3R/9Jq0QsvLZP5FHQ=;
        b=SsjOzFJX2BTpFHw7j+/6nkSrdwk6E68iUHhszE5+6fVyrxLrKzoZNuUBxlyLuuPV5+
         /YRFb+Iuiv+b8MlKk9Sjb6SnHAmu2+aB30bCfhyw9PTIBEeKtPppnuRsvnLKTB2btkpP
         39BlLfVt8gie8kTnj/NHCo9ok0mxcxxKHvih/wSQfj0BIMmrNW/8BvNOyamF1YIX5n0R
         Nrcx2oFY7yBBaDUVvabezmVKtiDNchZ/NVjxg6yMOcJ40KDUY2j/rddDP35C7rTSj5GY
         TqEgyRwxwzER1+TE/7/NEA+5GuJ3Vdmzsds1eCYq/05BjFdE47A9/FNWBza+Bu5TbceF
         cQkw==
X-Gm-Message-State: AOAM531LPH25u+gVcz3Ymns4VqEncuUH6XHiFk5zpYcIQTZvumkKm8nk
        95k78+5CI2RErio6DEYxVyls9g==
X-Google-Smtp-Source: ABdhPJyw8c3ul2d++LmMlDYbGKPjam5vYQe6BylRMfbw8bv6kYr1+2w2Q/QebtifI4VcbrsCqsQa0Q==
X-Received: by 2002:a17:90b:1b4f:: with SMTP id nv15mr183861pjb.56.1622481716289;
        Mon, 31 May 2021 10:21:56 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t14sm10642295pfg.168.2021.05.31.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:21:55 -0700 (PDT)
Date:   Mon, 31 May 2021 11:21:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alex Elder <elder@linaro.org>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] remoteproc: use freezable workqueue for crash
 notifications
Message-ID: <20210531172153.GA1718330@xps15>
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

This is a very tight race condition - I agree with you that it is next to
impossible to test.

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

I think the real fix for this problem should be in the platform driver where
the remoteproc interrupt would be masked while suspending and re-enabled again
when resuming.  The runtime PM API would work just fine for that...  But doing
so wouldn't guarantee that other drivers, i.e IPA, would be operational.  Unless
of one is a child of the other or using a bus like mechanic, and getting
to that point will introduce a lot more churn than what this patch does. 

The proposed solution will work since user space is expected to resume when
the kernel and drivers are fully operational.  As you pointed out the only
concern is with other users, which may not be noticeable given the very small
delay that is introduced.  As such:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro>

But be mindful the patch will have to be reverted if someone complains, whether
that happens in two weeks or 10 months.

Thanks,
Mathieu

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
