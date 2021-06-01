Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01642C47080
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 17:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5E65613BD
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 17:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhFARQy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhFARQy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Jun 2021 13:16:54 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C138C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jun 2021 10:15:12 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so59904pjq.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jun 2021 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U65hdesdvDmorFbtO287+I+YEZ3urVVgKrKl2j6XaOE=;
        b=lQ2a6yQOhnzrehY6i6bUnFYQhtdk49xyq3u3DAqS0+a09Kuf5d8sBn1xy56r7yaWHt
         sBEmAsPdBN6igfc5WbwC0LP6Azup6KLjdcpK/8WAZNUq7C9VfjiQjSy8b0AYlHQ5lyN/
         Vy1FMVcHCwms5Q2pMh5Rb71K/PqC+BoZrhonxDob60Bq6Q5frWNoTvycZsXsTINvgL31
         9TmxjCbxehPCXkTNlqtt3YCrxT2+vL0j817NLmy+BE1JJD9V7EKWsfosQmesLTw5X5So
         D6mEn1oGlfW2IIJYnY773fUsJudSHJLNReG3vI7VfdUoBT5Y1iqOCvfBSZz3pjcc4lAn
         nKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U65hdesdvDmorFbtO287+I+YEZ3urVVgKrKl2j6XaOE=;
        b=shusovquN4+8IS2/ecl1PEpZ7TRRAPV2vYU7sRti5Ggz2Sv6kQOW0VNpLT6t+lRd0J
         jKIzUe9xlmXwC/gZ7QLdvawhVbq162BlILonrZYJkODAg+FeS4KimZMermgefbS1BvVM
         UmDJUxwwMsatOpsbF6A1R1ZULvDlM7Vpo6Km9XhCfAxnAg3l94J1EtiH6F3fICCh8GiR
         1Q09Sw5KLHbBH5que/UG5efCRamad5N3TmPe+dYCPWt03mr9B90NuM4tnoFKistW+RdW
         7SKagJX8ANaab4Pw6azo5EnL4YooKKComMwUDWnSFbPRWA/6E6ZmSiAEHo6FyXkfZstY
         q7Ug==
X-Gm-Message-State: AOAM5312epph34Is2EluyPZIl1gMBw7WfTtsv4L2xyNzej5DREJMONyX
        FCHlDPB2n1B7c71ZTHHLEgredQ==
X-Google-Smtp-Source: ABdhPJys/Yp8G0oNUgYLPKf9H5QgDrsj8LcedkfkXi0nXaccVVUpRZqEsBhOmZkmtAWJigxiv6cNbw==
X-Received: by 2002:a17:90b:4d82:: with SMTP id oj2mr25737050pjb.61.1622567712053;
        Tue, 01 Jun 2021 10:15:12 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id pg5sm13382530pjb.28.2021.06.01.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:15:10 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:15:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] remoteproc: Add support for detach-only during
 shutdown
Message-ID: <20210601171508.GC1759269@xps15>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-3-s-anna@ti.com>
 <YLBtbHevzyxT4RTK@builder.lan>
 <da468002-580c-de1a-dcf4-275d57bb7ac7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da468002-580c-de1a-dcf4-275d57bb7ac7@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey guys,

On Fri, May 28, 2021 at 11:40:02AM -0500, Suman Anna wrote:
> Hi Bjorn,
> 
> On 5/27/21 11:11 PM, Bjorn Andersson wrote:
> > On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:
> > 
> >> The remoteproc core has support for both stopping and detaching a
> >> remote processor that was attached to previously, through both the
> >> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
> >> unconditionally only uses the stop functionality at present. This
> >> may not be the default desired functionality for all the remoteproc
> >> platform drivers.
> >>
> >> Introduce a new rproc state flag 'detach_on_shutdown' that individual
> >> remoteproc drivers can set to only allow detach in rproc_shutdown()
> >> that would have been invoked when the driver is uninstalled, so that
> >> remote processor continues to run undisturbed even after the driver
> >> removal.
> >>
> > 
> > I dislike the introduction of knobs for everything and would much rather
> > see that we define some sound defaults. Can we make shutdown just do
> > detach() if that's supported otherwise stop().
> > 
> 
> I maybe missing your point, but the change in remoteproc_core below exactly does
> that, right? Are you saying drop the checks in remoteproc_cdev and remoteproc_sysfs?
> 
> The asymmetry did bug me as well, but it is already existing even before this
> patch. I personally would have preferred a cleaner and symmetrical attach,
> start, stop, detach, but existing code has overloaded attach into start (keys
> off by RPROC_OFFLINE/RPROC_DETACHED) while introducing a separate detach from
> stop. I have retained the meaning of stop as shutdown from userspace interface
> perspective, but enforcing the checks for detach only remoteprocs.
> 
> The logic in rproc_shutdown is for driver paths.
> 
> > This still allows userspace to explicitly stop the detachable remoteproc
> > before shutdown, if for some reason that's what you want...
> 
> This is the existing behavior and the difference between stop and detach. That
> behavior is maintained for remoteprocs not setting the detach_on_shutdown flag.
> I am only restricting the behavior for those that set it.
> 
> Mathieu,
> Your thoughts on this?

Introducing knobs in such a way makes the code very difficult to understand and
maintain.  It is also a matter of time before another knob is introduced to
modify the behavior of this knob.  

Function rproc_detach() is exported and should be used in the platform driver if
the state of the remote processor mandates it.  Function rproc_del() calls
rproc_shutdown() but the latter will return immediately because of rproc->power.
So calling rproc_detach() followed by rproc_del() will work as expected.  The
real fix is to de-couple rproc_shutdown from rproc_del() and do the right calls
in the platform drivers using them.

With regards to rproc_cdev_write(), the state of the remote processor is
advertised in sysfs.  As such it should be easy to write "stop" or "detach" to
the character interface.  If a command to stop the remote processor is not
supported in a scenario then rproc_ops::stop should reflect that.  If that is
the case then rproc_shutdown() should be modified to return an error code, the
same way rproc_detach() was done.

> 
> regards
> Suman
> 
> 
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
> >>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
> >>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
> >>  include/linux/remoteproc.h            | 3 +++
> >>  4 files changed, 20 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> >> index 0b8a84c04f76..473467711a09 100644
> >> --- a/drivers/remoteproc/remoteproc_cdev.c
> >> +++ b/drivers/remoteproc/remoteproc_cdev.c
> >> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
> >>  		    rproc->state != RPROC_ATTACHED)
> >>  			return -EINVAL;
> >>  
> >> +		if (rproc->state == RPROC_ATTACHED &&
> >> +		    rproc->detach_on_shutdown) {
> >> +			dev_err(&rproc->dev,
> >> +				"stop not supported for this rproc, use detach\n");
> >> +			return -EINVAL;
> >> +		}
> >> +
> >>  		rproc_shutdown(rproc);
> >>  	} else if (!strncmp(cmd, "detach", len)) {
> >>  		if (rproc->state != RPROC_ATTACHED)
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 6019f46001c8..e8ab3eb41f00 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -2074,7 +2074,10 @@ void rproc_shutdown(struct rproc *rproc)
> >>  	if (!atomic_dec_and_test(&rproc->power))
> >>  		goto out;
> >>  
> >> -	ret = rproc_stop(rproc, false);
> >> +	if (rproc->detach_on_shutdown && rproc->state == RPROC_ATTACHED)
> >> +		ret = __rproc_detach(rproc);
> >> +	else
> >> +		ret = rproc_stop(rproc, false);
> >>  	if (ret) {
> >>  		atomic_inc(&rproc->power);
> >>  		goto out;
> >> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> >> index ea8b89f97d7b..1785fbcb1075 100644
> >> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
> >>  		    rproc->state != RPROC_ATTACHED)
> >>  			return -EINVAL;
> >>  
> >> +		if (rproc->state == RPROC_ATTACHED &&
> >> +		    rproc->detach_on_shutdown) {
> >> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
> >> +			return -EINVAL;
> >> +		}
> >> +
> >>  		rproc_shutdown(rproc);
> >>  	} else if (sysfs_streq(buf, "detach")) {
> >>  		if (rproc->state != RPROC_ATTACHED)
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index 42a1f30e33a7..35ef921676a1 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -530,6 +530,8 @@ struct rproc_dump_segment {
> >>   * @elf_machine: firmware ELF machine
> >>   * @cdev: character device of the rproc
> >>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> >> + * @detach_on_shutdown: flag to indicate if remoteproc cannot be shutdown in
> >> + *			attached state and _only_ support detach
> >>   */
> >>  struct rproc {
> >>  	struct list_head node;
> >> @@ -569,6 +571,7 @@ struct rproc {
> >>  	u16 elf_machine;
> >>  	struct cdev cdev;
> >>  	bool cdev_put_on_release;
> >> +	bool detach_on_shutdown;
> >>  };
> >>  
> >>  /**
> >> -- 
> >> 2.30.1
> >>
> 
