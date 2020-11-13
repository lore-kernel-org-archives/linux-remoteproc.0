Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27379C63697
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4B4C2224F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwQV0SA1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgKMVgw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgKMVgu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:36:50 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077B3C08E863
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2020 13:27:59 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id j5so5154879plk.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2020 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gi84QEAwmDHFJig27p42b+yTFYku+voMitz76UvH/l4=;
        b=UwQV0SA1zbKuK3IXZHeTqvkOfNj+Ki9DDUtE8hCRZPBNaBWfL7TGm60MYJ8QgKiOcs
         Fq/m3h2LJwC7lBwDNpfaDqDeSJdWOYtKi2UxAYfwhO5tfIl2wXWFHLS4dQ1UhU2zrNHF
         DD1U9syv8SlARFCP/JHbs4GO6VQPzTPnXR8zmm1lEfV+tXHRhOSYO0m5usjqul1AItbY
         tzjWHqtE7tQ5g0+hq5uc00HuI6tRSDeuE6V0hN5PrIAfsliVLtLBYaBjNj6iOzIVMBNe
         +qlBrCC5QvdneLqZY5rkgeU6dUTHvYuNmANHkT7b1OduttWXHKxKFz+yZuAty6FyA15J
         7M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gi84QEAwmDHFJig27p42b+yTFYku+voMitz76UvH/l4=;
        b=RbqN6vcqQwZP3oWg7TD6Lw+8REl/KuuVTJz9H9FOR6kXbk2P2wPeoN3XvdoafBhJDJ
         E8gE22UUV/Vpnrruz79hMErCXUgai1i4Ih+A93QzynnvNMAXBPS/QFXs+58oBtXX2eDa
         XdiFVoXBGl3Ufxvzg8WjZnC6DcHIOx/KD6+BEC9o+/DD0K76B4uOOsSsSOVjltc60LrM
         fK7K4rOmUfh7KcutundQDeh7/C656LJsHLGc5cthXICWxFqt0EMMf2lZvlonUZ7KCjOE
         /t0Og0GAfLPZd6qYiwdjN9SptpmhAhLbfn68jNsS8vFiU02TChGx4eroVIydREzNt6/y
         IZhA==
X-Gm-Message-State: AOAM532qmqXwqv3e+ktf1pKKciOAhR5m1GQQkGhUvVG31b+qZ1kVU4tT
        DJLIIAQY1OcklDd0AuV4NQOe/w==
X-Google-Smtp-Source: ABdhPJxO23UlRMW9NPrUCIDQzrputfCnTHUBhbxqM+k3h4srwN3XakyxSVFvWWVb3Kj9Vx2kLLk95w==
X-Received: by 2002:a17:902:8c88:b029:d6:d0e4:7e1b with SMTP id t8-20020a1709028c88b02900d6d0e47e1bmr3448582plo.70.1605302876797;
        Fri, 13 Nov 2020 13:27:56 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id cu1sm11838547pjb.6.2020.11.13.13.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:27:55 -0800 (PST)
Date:   Fri, 13 Nov 2020 14:27:54 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [RFC v2 13/14] remoteproc: Add automation flags
Message-ID: <20201113212754.GB3583825@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-14-mathieu.poirier@linaro.org>
 <498ebbb1-3a27-fe48-576c-25a0856f82f4@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <498ebbb1-3a27-fe48-576c-25a0856f82f4@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Thu, Nov 12, 2020 at 02:56:20PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> Thanks for initiating the discussion!
> 
> Waiting feedback from other, please find my feedback on our proposal below.

The first version of this set has been released on August 26th and since then,
only you and Peng have given me feedback.  As such I suggest that we move
forward with the decision you and I settle on.  As usual with open source
development, people can submit new patches to enhance our solution as they see
fit.

> 
> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> > Adding flags to dictate how to handle a platform driver being removed
> > or the remote processor crashing while in RPROC_ATTACHED state.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++++
> >  include/linux/remoteproc.h           |  5 +++++
> >  2 files changed, 30 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 229fa2cad0bd..d024367c63e5 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2227,6 +2227,29 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> >  	return 0;
> >  }
> >  
> > +static void rproc_set_automation_flags(struct rproc *rproc)
> > +{
> > +	struct device *dev = rproc->dev.parent;
> > +	struct device_node *np = dev->of_node;
> > +	bool core_reboot, remote_crash;
> > +
> > +	/*
> > +	 * When function rproc_cdev_release() or rproc_del() are called and
> > +	 * the remote processor has been attached to, it will be detached from
> > +	 * (rather than turned off) if "autonomous_on_core_reboot" is specified
> > +	 * in the DT.
> > +	 */
> > +	core_reboot = of_property_read_bool(np, "autonomous_on_core_reboot");
> > +	rproc->autonomous_on_core_reboot = core_reboot;
> > +
> > +	/*
> > +	 * When the remote processor crashes it will be detached from, and
> > +	 * attached to, if "autonomous_on_remote_crash" is specified in the DT.
> > +	 */
> > +	remote_crash = of_property_read_bool(np, "autonomous_on_remote_crash");
> > +	rproc->autonomous_on_core_reboot = core_reboot;
> > +}
> > +
> 
> I wonder if the naming is not too restrictive.

I'm happy to have this conversation, which is really the point of this second
revision.  I turned names and ideas around in my head for a long time and the above is
the best I came up with.  Your insight gave me food for thought - see below.

> 
> I think here we probably need first to identify the use cases we want to support
> to determine which use cases should be addressed and deduce DT fields.
> 
> Please find my view below:
> 
> 1) Attach to a remote processor on boot.
> This is the "attach" you introduced in a previous series. I wonder here if a DT
> field should not be introduce for platform which are not able to dynamically
> determines the remote processor state. Something like "remote-boot-on" or
> "autonomous-boot-on".

Right - I think "autonomous-on-core-boot" would be best as it really spells out
what is going on. I did not include it in the "attach" patchset because there
wasn't a need for it.  Both ST and NXP are able to determine the state of the
remote processor from a platform driver.  My initial strategy was to introduce
the functionality when the need for it comes up.  I can revisit if you feel
strongly about adding it immediately. 

> 
> 2) Detach from a remote processor on Linux kernel shutdown
> Two possible actions: shutdown the remote processor or detach from it.
> A DT field could be used to determine the expected behavior.
>

That is what the "autonomous-on-core-reboot" was for but reading your
description I think "autonomous-on-core-shutdown" is best to describe the
scenario.
 
> 3) Linux core reboot on crash
> Two possible actions: shutdown and restart the remote processor or
> detach/re-attach from/to it.
> Is same DT field than 2) can be used for this . Or should be determine by a
> new sysfs recovery option [1]?

As far as I can tell nothing happens to drivers when the kernel crashes.  To
take action when the kernel crashes each driver needs to register explicitly
with the panic notifier, which the remoteproc doesn't currently do.  That's a
different feature that I would like to delay for another time.

If and when that time comes we can either reuse "autonomous-on-core-shutdown"
or introduce "autonomous-on-core-crash", depending on the level of granularity
needed.

> 
> [1]
> https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/remoteproc/remoteproc_sysfs.c#L45
> 
> 4) The remote processor need to reboot on crash.
> 3 possible actions:
>  - shutdown and restart the remote processor

That is currently the default behavior _if_ recovery is enabled.

>  - detach and re-attach from/to it.

That is how I intend to use "autonomous-on-remote-crash", _if_ recovery is
enabled.

>  - Just shutdown, as no recovery possible without a system reset.

That is the current behavior if recovery is _not_ enabled.

Dealing with crash scenarios is a little more complex and requires some
refactoring.  That is why I wanted to solely concentrate on the shutdown scenario
in this set.

> 
> 5) Detach/re-attach on Linux suspend/resume
> Perhaps better to manage this in platform drivers without a generic DT field?

I think that falls in the same category as power management and is too specific
to be handled in the remoteproc core.  As you suggest, it is probably best to
leave that to platform drivers for the time being. 

> 
> If i try to apply this on the remote proc boot and shutdown sequences:
> 
> 1) on remoteproc device add:
> - Need to determine if the remote processor is already running:
>    - started by another entity
>    - Linux reboot after crash
> 
> 2) On remoteproc device release.
> - Need to determine if the remote processor need to be shutdown or detached:
>    - Linux kernel crash
>    - Linux kernel graceful shutdown with remote processor keeping ON.
> 
> 3) On remote processor crash
> - Need to determine if the remote processor will be restarted by an external
> entity or by the remoteproc framework, or if simply not possible to recover
> without a system reset.
> 
> Regarding these use cases here is an alternative proposal(inspired by regulator
> framework):
> - "remote-boot-on": determine on probe if the remoteproc firmware is already
> booted. This field is optional, use by a platform driver which can not
> determine the state of the remote processor. Could be dynamically updated by the
> platform driver to manage Kernel crash...
> 
> - "remote-always-on": means that the detach has to be privileged on
> shutdown. Need also to be managed by platform driver as it can be
> compared to the remote processor current state.
> 
> - "remoteproc-crash-recovery": crash recovery mode:
>    possible value: "SHUTDOWN", "DETACH", "DISABLED"

I think all of the above scenarios can be managed with a combination of the
proposed bindings , i.e "autonomous-on-core-shutdown" and
"autonomous-on-remote-crash".  The latter would be used in conjuction with the
recovery mechanic already available. 

Let me know what you think.

Mathieu

> 
> 
> Regards,
> Arnaud
> 
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2285,6 +2308,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  	if (rproc_alloc_ops(rproc, ops))
> >  		goto put_device;
> >  
> > +	rproc_set_automation_flags(rproc);
> > +
> >  	/* Assign a unique device index and name */
> >  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> >  	if (rproc->index < 0) {
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 71d4d4873164..9a6e79ef35d7 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -516,6 +516,9 @@ struct rproc_dump_segment {
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   * @char_dev: character device of the rproc
> >   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> > + * @autonomous_on_core_reboot: true if the remote processor should be detached from
> > + *			       (rather than turned off) when the remoteproc core
> > + *			       goes away.
> >   */
> >  struct rproc {
> >  	struct list_head node;
> > @@ -554,6 +557,8 @@ struct rproc {
> >  	u16 elf_machine;
> >  	struct cdev cdev;
> >  	bool cdev_put_on_release;
> > +	bool autonomous_on_core_reboot	: 1,
> > +	     autonomous_on_remote_crash	: 1;
> >  };
> >  
> >  /**
> > 
