Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6A2C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 17:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ED54610A2
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 17:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240012AbhHERfY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 13:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240006AbhHERfY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 13:35:24 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23653C0613D5
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 10:35:10 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a8so10597873pjk.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/HZSC2SlqOyJDihv4vxsKTzy6sQrfkkuEXcLdxiVhMQ=;
        b=eI/71tFYEjcYB6/CO++j6gZTapqaO5ryNkQYEPpdsAz/frOsNTry4LfYQ0QzSXNtf+
         DS925dPE/n3Wfx3TuHZy9Afp415VU7zyXjHB6h8jTN1IyYY0hbx+S2/wESu1f4Na6ACz
         axYOOVvu4Et/BuRR4Ko9e5gh48j018rf3TD3DG0ZKwyiJBT4g9IaPBOS3QP61QmWbbNG
         qjxoHLpbM7FlbDASfdYfoi0H/BEbnZDuC3XXuDz/wXJXGg1TLv8OTmc4mHNY2TwYsz8T
         FxFbxNmQcqSH964h+4ptERH4+aj18nbWgPoM82MXfchXG+4Xjuc5Yj+2D2BnKvg4Zjtc
         7NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/HZSC2SlqOyJDihv4vxsKTzy6sQrfkkuEXcLdxiVhMQ=;
        b=D8YipAWZInSg32v6H7nGkxPTUQDCwtqMfmGnY+QPFD6ZuIA+zxGEqggpoh+nag/hB6
         6CLhAgOmqQEwhMTb1k7psQ8lyOwPid/nEc1/P3F+lTU5L8qdCsSf3RT545cedltMEqcT
         WAsgNEAcs0+STO6pVrdvm888butK8shIh1W0Tv/zvxOrQh94uhRrRsnwjL91jwu+dFkH
         xwcx0KEdXONgg9VOCq/T090ZMFXohdYbhCVU1b7WfayKmfpieaRI/TkVTahnjofkS8AL
         KWxq6IoSJlekjUrz/d8ICjaRTKLVRocdwITeljal98Nr7Rrlc0DeQHlbae2vxdc8d9AX
         HWUQ==
X-Gm-Message-State: AOAM530L1pvNhuojuNZMUd3g37z5Pcz9/eEnCY6YxTVW8+ztii/bm9xK
        mUyCD6NTjQCkuN3aTf1uBZ/x+g==
X-Google-Smtp-Source: ABdhPJxpXaJdQSrRMiJ4hudt/iT48xnGSS0U6y0VQSY3zd4zKUt1rVZ6sRajITbj1Qjs1j5C0gfnDQ==
X-Received: by 2002:a17:902:ab88:b029:12b:d2ee:c26f with SMTP id f8-20020a170902ab88b029012bd2eec26fmr5268043plr.38.1628184909604;
        Thu, 05 Aug 2021 10:35:09 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t30sm8977670pgl.47.2021.08.05.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 10:35:08 -0700 (PDT)
Date:   Thu, 5 Aug 2021 11:35:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] remoteproc: Add support for detach-only during
 shutdown
Message-ID: <20210805173506.GF3205691@p14s>
References: <20210723220248.6554-1-s-anna@ti.com>
 <20210723220248.6554-2-s-anna@ti.com>
 <20210802184431.GC3051951@p14s>
 <cd399fef-6db7-72eb-933f-7454a043ed14@ti.com>
 <20210803162311.GB3091608@p14s>
 <7e264184-60ea-a035-7bd3-1fc2c76a160d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e264184-60ea-a035-7bd3-1fc2c76a160d@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 04, 2021 at 02:17:22PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 8/3/21 11:23 AM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Mon, Aug 02, 2021 at 06:21:38PM -0500, Suman Anna wrote:
> >> Hi Mathieu,
> >>
> >> On 8/2/21 1:44 PM, Mathieu Poirier wrote:
> >>> On Fri, Jul 23, 2021 at 05:02:44PM -0500, Suman Anna wrote:
> >>>> The remoteproc core has support for both stopping and detaching a
> >>>> remote processor that was attached to previously, through both the
> >>>> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
> >>>> unconditionally only uses the stop functionality at present. This
> >>>> may not be the default desired functionality for all the remoteproc
> >>>> platform drivers.
> >>>>
> >>>> Enhance the remoteproc core logic to key off the presence of the
> >>>> .stop() ops and allow the individual remoteproc drivers to continue
> >>>> to use the standard rproc_add() and rproc_del() API. This allows
> >>>> the remoteproc drivers to only do detach if supported when the driver
> >>>> is uninstalled, and the remote processor continues to run undisturbed
> >>>> even after the driver removal.
> >>>>
> >>>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>>> ---
> >>>> v2: Addressed various review comments from v1
> >>>>  - Reworked the logic to not use remoteproc detach_on_shutdown and
> >>>>    rely only on rproc callback ops
> >>>>  - Updated the last para of the patch description
> >>>> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-3-s-anna@ti.com/
> >>>>
> >>>>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
> >>>>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
> >>>>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
> >>>>  3 files changed, 17 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> >>>> index 4ad98b0b8caa..16c932beed88 100644
> >>>> --- a/drivers/remoteproc/remoteproc_cdev.c
> >>>> +++ b/drivers/remoteproc/remoteproc_cdev.c
> >>>> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
> >>>>  		    rproc->state != RPROC_ATTACHED)
> >>>>  			return -EINVAL;
> >>>>  
> >>>> +		if (rproc->state == RPROC_ATTACHED &&
> >>>
> >>> This is already checked just above.
> >>>
> >>>> +		    !rproc->ops->stop) {
> >>
> >> Well, this is checking for both conditions, and not just the stop ops
> >> independently. We expect to have .stop() defined normally for both regular
> >> remoteproc mode and attached mode where you want to stop (and not detach), but
> >> as you can see, I am supporting only detach and so will not have .stop() defined
> >>  with RPROC_ATTACHED.
> >>
> >>>
> >>> This is checked in rproc_stop() where -EINVAL is returned if ops::stop has not
> >>> been provided.
> >>
> >> rproc_shutdown() actually doesn't return any status, so all its internal
> >> checking gets ignored and a success is returned today.
> >>
> > 
> > That is correct, and I have suggested to add a return value in my previous
> > review.
> 
> Yeah ok. I can add a separate patch fixing that, and couple of these checks then
> become redundant.
> 
> > 
> >>>
> >>>> +			dev_err(&rproc->dev,
> >>>> +				"stop not supported for this rproc, use detach\n");
> >>>
> >>> The standard error message from the shell should be enough here, the same way it
> >>> is enough when the "start" and "stop" scenarios fail.
> >>
> >> Thought this was a bit more informative, but sure this trace can be dropped.
> >>
> >>>
> >>>> +			return -EINVAL;
> >>>> +		}
> >>>> +
> >>>>  		rproc_shutdown(rproc);
> >>>>  	} else if (!strncmp(cmd, "detach", len)) {
> >>>>  		if (rproc->state != RPROC_ATTACHED)
> >>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>>> index 7de5905d276a..ab9e52180b04 100644
> >>>> --- a/drivers/remoteproc/remoteproc_core.c
> >>>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>>> @@ -2075,7 +2075,10 @@ void rproc_shutdown(struct rproc *rproc)
> >>>>  	if (!atomic_dec_and_test(&rproc->power))
> >>>>  		goto out;
> >>>>  
> >>>> -	ret = rproc_stop(rproc, false);
> >>>> +	if (rproc->state == RPROC_ATTACHED && !rproc->ops->stop)
> >>>> +		ret = __rproc_detach(rproc);
> >>>> +	else
> >>>> +		ret = rproc_stop(rproc, false);
> >>>
> >>> As I indicated in my last review I think rproc_shutdown() and rproc_del() should
> >>> be decoupled and the right call made in the platform drivers based on the state
> >>> of the remote processor.  
> >>
> >> We have various remoteproc API provided in pairs - rproc_alloc()/rproc_free(),
> >> rproc_add()/rproc_del(), rproc_boot()/rproc_shutdown() and
> >> rproc_attach()/rproc_detach(). The drivers are configuring conditions for
> >> auto-boot and RPROC_DETACHED. The reason they are coupled is primarily because
> >> of the auto-boot done during rproc_add(). And we handle the RPROC_DETACHED case
> >> just as well in rproc_boot().
> >>
> > 
> > The difference with rproc_boot() is that we are checking only the state of the
> > remoteproc, everything else related to the remote processor operations is
> > seamlessly handles by the state machine.  It is also tied to the
> > rproc_trigger_auto_boot() mechanic - decoupling that would be messy without
> > bringing any advantages other than keeping with a semantic symmetry.
> 
> Most of this is actually tied to auto_boot if you think about it, not just the
> rproc state. If we have auto_boot set to false, then rproc_add() would not do
> anything, and the decision to start or attach can either be done through the
> sysfs/cdev or a kernel remoteproc or some consumer driver. And the state machine
> is getting influenced by this flag. auto-boot is a very useful feature.
> 
> You are asking is to do things differently between the regular start/stop case
> and attach/detach case ignoring the auto-boot. The semantic symmetry actually
> makes it easier to follow the state machine given that there are some internal
> reference counts as well.

I am definitely not asking to ignore the auto-boot flag.  All I said is that I
did not split the semantic in rproc_boot() because of the auto-boot flag and the
mechanic to handle it.

> 
> Note that we also have the devres API, and rproc_alloc()/rproc_free() and
> rproc_add()/rproc_del() form the main remoteproc subsystem API. The drivers
> would end up using matching calls if we don't have auto_boot.
> 
> > 
> >> While what you have suggested works, but I am not quite convinced on this
> >> asymmetric usage, and why this state-machine logic should be split between the
> >> core and remoteproc drivers differently between attach and detach. To me,
> >> calling rproc_detach() in remoteproc drivers would have made sense only if they
> >> are also calling rproc_attach().
> > 
> > As pointed out above I see rproc_boot() as a special case but if that really
> > concerns you I'm open to consider patches that will take rproc_attach() out of
> > rproc_boot(). 
> > 
> 
> We are talking about a bigger behavioral change to remoteproc core here. So I
> would definitely want to hear from others as well on this before we spend any
> time reworking code.
> 
> Meanwhile, how do I take this series forward? One option I can probably do is
> turn off auto-boot for early-boot case in my drivers and do the matching
> attach/detach.
>

I don't think there is a need to turn off auto-boot for early boot, rproc_boot()
will to the right thing.

As for the way forward, the easiest way I see is to call either rproc_shutdown()
or rproc_detach() based on rproc->state in rproc_del().  That will work with
devm_rproc_remove() and it is still possible for platorm drivers to explicitly
call rproc_shutdown() before rproc_del() to force a remote processor that was
attached to be switched off when the driver is removed.

That is all the time I had for remoteproc - I am officially away for the next two weeks.  

Thanks,
Mathieu

> regards
> Suman
> 
> >>
> >>
> >> Conditions such as the above make the core code
> >>> brittle, difficult to understand and tedious to maintain.
> >>
> >> The logic I have added actually makes rproc_shutdown behavior to be on par with
> >> the rproc_boot().
> >>
> >> regards
> >> Suman
> >>
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>>  	if (ret) {
> >>>>  		atomic_inc(&rproc->power);
> >>>>  		goto out;
> >>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> >>>> index ea8b89f97d7b..133e766f38d4 100644
> >>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >>>> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
> >>>>  		    rproc->state != RPROC_ATTACHED)
> >>>>  			return -EINVAL;
> >>>>  
> >>>> +		if (rproc->state == RPROC_ATTACHED &&
> >>>> +		    !rproc->ops->stop) {
> >>>> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
> >>>> +			return -EINVAL;
> >>>> +		}
> >>>> +
> >>>>  		rproc_shutdown(rproc);
> >>>>  	} else if (sysfs_streq(buf, "detach")) {
> >>>>  		if (rproc->state != RPROC_ATTACHED)
> >>>> -- 
> >>>> 2.32.0
> >>>>
> >>
> 
