Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A15C63777
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 20:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4170F22470
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 20:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtLN7H93"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731174AbgKTUlA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 15:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731558AbgKTUk7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 15:40:59 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A82C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 12:40:58 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id s2so5455229plr.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 12:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ebjaG21ahLqOB7GzmkE3D/f6CWLN6K6nTFWkGaX1NNM=;
        b=PtLN7H93kNgOSEXP23CLXFO1rBASVkinBqqC07Ua97uwb65BcWcK+UQBN3LjGtbLUA
         W1JnhtdWnDsB1VR9Ud2SpzWQ3+yJ1qeeIYFfbqtQMn1Z3EQyJhyuc55U8fRNa0pJ5+1m
         7T0KTpxo5Vw34t3co4Bl77ZoOplg6VJENXpgUF2YAhr1y7jNKpMAoE1tILufPy9SUGU9
         m9rOk61LkK8LWSzxuv2YAAiVnhjvu5WQ4IwqTc+jr1s40LPi/65XG7aNrlh+pNgeowz5
         nBfiekxyTOPTfkHzyc6kiG9UFYE7pMFNLGzWfstLct/vkKzUzTZTHxT5W1aXAWEVBp7r
         EiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ebjaG21ahLqOB7GzmkE3D/f6CWLN6K6nTFWkGaX1NNM=;
        b=eWU5P7YNj34Dr1j3vmu0vsVfPakTACVGuLpoukk7kcWsnEzNoIfUK8EhYCSPJvc0U9
         QCA0gSEFQf1Zoev2NHCRFwj1gSXy+zenGmwuq7iFt7jHkz4+YggCoP389my4vpnhGs2i
         dfjGuISSWhz5LZVLAr48GuBz/r7C2vIEpgWS1ioKYNDNj7tLgElOw+qFPjrdLbUP+wa3
         gJxDb+yWu080vE1KcpqRdJd8ALmjAOrSh5MiBeS99Ub5IRFpc1Tp2J/3jbv3AGJfWob1
         /gdT0rY0J95P4PHyE0I6YP1I80p5KY+DS4HwooMOWDeY8d3/QbH8fX3GbppxdectsxUm
         9Y0A==
X-Gm-Message-State: AOAM532SXMJ4yv9qvNnbmdP2NKjtMbNGWCYajXKld7V7acVjkMwR43xy
        T3bgwKZaGVDthVzShGOsM+65eQ==
X-Google-Smtp-Source: ABdhPJwFQ/6+kF2SrWH2O8XPotTft9/WAgvba2+pDhnh6vYmWH8txB/Klg3hnMdSyYuSBEdV1sjJAA==
X-Received: by 2002:a17:902:aa4b:b029:d8:f87e:1f3c with SMTP id c11-20020a170902aa4bb02900d8f87e1f3cmr14753101plr.23.1605904857442;
        Fri, 20 Nov 2020 12:40:57 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n72sm4579839pfd.202.2020.11.20.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 12:40:56 -0800 (PST)
Date:   Fri, 20 Nov 2020 13:40:55 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [RFC v2 13/14] remoteproc: Add automation flags
Message-ID: <20201120204055.GE4137289@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-14-mathieu.poirier@linaro.org>
 <498ebbb1-3a27-fe48-576c-25a0856f82f4@st.com>
 <20201113212754.GB3583825@xps15>
 <9dc265ba-6113-b200-1d46-f6358bd7e924@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dc265ba-6113-b200-1d46-f6358bd7e924@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 11:21:02AM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 11/13/20 10:27 PM, Mathieu Poirier wrote:
> > Hi,
> > 
> > On Thu, Nov 12, 2020 at 02:56:20PM +0100, Arnaud POULIQUEN wrote:
> >> Hi Mathieu,
> >>
> >> Thanks for initiating the discussion!
> >>
> >> Waiting feedback from other, please find my feedback on our proposal below.
> > 
> > The first version of this set has been released on August 26th and since then,
> > only you and Peng have given me feedback.  As such I suggest that we move
> > forward with the decision you and I settle on.  As usual with open source
> > development, people can submit new patches to enhance our solution as they see
> > fit.
> > 
> >>
> >> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> >>> Adding flags to dictate how to handle a platform driver being removed
> >>> or the remote processor crashing while in RPROC_ATTACHED state.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++++
> >>>  include/linux/remoteproc.h           |  5 +++++
> >>>  2 files changed, 30 insertions(+)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>> index 229fa2cad0bd..d024367c63e5 100644
> >>> --- a/drivers/remoteproc/remoteproc_core.c
> >>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>> @@ -2227,6 +2227,29 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> >>>  	return 0;
> >>>  }
> >>>  
> >>> +static void rproc_set_automation_flags(struct rproc *rproc)
> >>> +{
> >>> +	struct device *dev = rproc->dev.parent;
> >>> +	struct device_node *np = dev->of_node;
> >>> +	bool core_reboot, remote_crash;
> >>> +
> >>> +	/*
> >>> +	 * When function rproc_cdev_release() or rproc_del() are called and
> >>> +	 * the remote processor has been attached to, it will be detached from
> >>> +	 * (rather than turned off) if "autonomous_on_core_reboot" is specified
> >>> +	 * in the DT.
> >>> +	 */
> >>> +	core_reboot = of_property_read_bool(np, "autonomous_on_core_reboot");
> >>> +	rproc->autonomous_on_core_reboot = core_reboot;
> >>> +
> >>> +	/*
> >>> +	 * When the remote processor crashes it will be detached from, and
> >>> +	 * attached to, if "autonomous_on_remote_crash" is specified in the DT.
> >>> +	 */
> >>> +	remote_crash = of_property_read_bool(np, "autonomous_on_remote_crash");
> >>> +	rproc->autonomous_on_core_reboot = core_reboot;
> >>> +}
> >>> +
> >>
> >> I wonder if the naming is not too restrictive.
> > 
> > I'm happy to have this conversation, which is really the point of this second
> > revision.  I turned names and ideas around in my head for a long time and the above is
> > the best I came up with.  Your insight gave me food for thought - see below.
> 
> 
> > 
> >>
> >> I think here we probably need first to identify the use cases we want to support
> >> to determine which use cases should be addressed and deduce DT fields.
> >>
> >> Please find my view below:
> >>
> >> 1) Attach to a remote processor on boot.
> >> This is the "attach" you introduced in a previous series. I wonder here if a DT
> >> field should not be introduce for platform which are not able to dynamically
> >> determines the remote processor state. Something like "remote-boot-on" or
> >> "autonomous-boot-on".
> > 
> > Right - I think "autonomous-on-core-boot" would be best as it really spells out
> > what is going on. I did not include it in the "attach" patchset because there
> > wasn't a need for it.  Both ST and NXP are able to determine the state of the
> > remote processor from a platform driver.  My initial strategy was to introduce
> > the functionality when the need for it comes up.  I can revisit if you feel
> > strongly about adding it immediately. 
> 
> No problem to add it later. I mentioned it here only trying to have a complete
> view of the use cases.
> 
> > 
> >>
> >> 2) Detach from a remote processor on Linux kernel shutdown
> >> Two possible actions: shutdown the remote processor or detach from it.
> >> A DT field could be used to determine the expected behavior.
> >>
> > 
> > That is what the "autonomous-on-core-reboot" was for but reading your
> > description I think "autonomous-on-core-shutdown" is best to describe the
> > scenario.
> >  
> >> 3) Linux core reboot on crash
> >> Two possible actions: shutdown and restart the remote processor or
> >> detach/re-attach from/to it.
> >> Is same DT field than 2) can be used for this . Or should be determine by a
> >> new sysfs recovery option [1]?
> > 
> > As far as I can tell nothing happens to drivers when the kernel crashes.  To
> > take action when the kernel crashes each driver needs to register explicitly
> > with the panic notifier, which the remoteproc doesn't currently do.  That's a
> > different feature that I would like to delay for another time.
> > 
> > If and when that time comes we can either reuse "autonomous-on-core-shutdown"
> > or introduce "autonomous-on-core-crash", depending on the level of granularity
> > needed.
> 
> Right, i don't know if it possible to determine boot reason on remoteproc probe.
> (first boot or re-boot after crash). This information will be needed to
> determine if the firmware has to be re-attached or re-started.
> 
> > 
> >>
> >> [1]
> >> https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/remoteproc/remoteproc_sysfs.c#L45
> >>
> >> 4) The remote processor need to reboot on crash.
> >> 3 possible actions:
> >>  - shutdown and restart the remote processor
> > 
> > That is currently the default behavior _if_ recovery is enabled.
> > 
> >>  - detach and re-attach from/to it.
> > 
> > That is how I intend to use "autonomous-on-remote-crash", _if_ recovery is
> > enabled.
> > 
> >>  - Just shutdown, as no recovery possible without a system reset.
> > 
> > That is the current behavior if recovery is _not_ enabled.
> > 
> 
> The recovery is a user interface, for my pov the recovery sysfs/debugfs is used
> to allow userland to chose behavior on crash
> - automatic recovery
> - asynchronous recovery ( recovery trigged by the userspace)
> - no recovery
> 
> As the userspace should be hardware independent, the platform driver should
> provide information on the capabilities I list above.
> That's why i proposed to not have a boolean but an enum to handle the crash
> 
> > Dealing with crash scenarios is a little more complex and requires some
> > refactoring.  That is why I wanted to solely concentrate on the shutdown scenario
> > in this set.
> 
> Yes, my feedback was mainly to determine if the properties allow to cover the
> use cases, to avoid to refactor them later. let start with the shutdown.
> 
> > 
> >>
> >> 5) Detach/re-attach on Linux suspend/resume
> >> Perhaps better to manage this in platform drivers without a generic DT field?
> > 
> > I think that falls in the same category as power management and is too specific
> > to be handled in the remoteproc core.  As you suggest, it is probably best to
> > leave that to platform drivers for the time being. 
> > 
> >>
> >> If i try to apply this on the remote proc boot and shutdown sequences:
> >>
> >> 1) on remoteproc device add:
> >> - Need to determine if the remote processor is already running:
> >>    - started by another entity
> >>    - Linux reboot after crash
> >>
> >> 2) On remoteproc device release.
> >> - Need to determine if the remote processor need to be shutdown or detached:
> >>    - Linux kernel crash
> >>    - Linux kernel graceful shutdown with remote processor keeping ON.
> >>
> >> 3) On remote processor crash
> >> - Need to determine if the remote processor will be restarted by an external
> >> entity or by the remoteproc framework, or if simply not possible to recover
> >> without a system reset.
> >>
> >> Regarding these use cases here is an alternative proposal(inspired by regulator
> >> framework):
> >> - "remote-boot-on": determine on probe if the remoteproc firmware is already
> >> booted. This field is optional, use by a platform driver which can not
> >> determine the state of the remote processor. Could be dynamically updated by the
> >> platform driver to manage Kernel crash...
> >>
> >> - "remote-always-on": means that the detach has to be privileged on
> >> shutdown. Need also to be managed by platform driver as it can be
> >> compared to the remote processor current state.
> >>
> >> - "remoteproc-crash-recovery": crash recovery mode:
> >>    possible value: "SHUTDOWN", "DETACH", "DISABLED"
> > 
> > I think all of the above scenarios can be managed with a combination of the
> > proposed bindings , i.e "autonomous-on-core-shutdown" and
> > "autonomous-on-remote-crash".  The latter would be used in conjuction with the
> > recovery mechanic already available. 
> > 
> > Let me know what you think.
> 
> "autonomous-on-core-shutdown" is fine and sufficient for this series. So as you
> suggest let's start with that.

Ok - I'll spin off another revision with this binding and a proper yaml file.

> 
> As explained above for the "autonomous-on-remote-crash" property i would prefer
> an enum to also be able to prohibit the recovering as well, especially if the
> recovering is migrating to the sysfs. let's discuss this in a second step.
> 

I understand where you are coming from.  The problem with an enumeration is that
it conflicts with rproc::recovery, which still has to be taken into account.

Platform drivers can access and set rproc::recovery so any specific case can be
handled there.  And with regards to sysfs, changing the setting requires root
access.  Someone with this kind of previleges should know what they are
doing - if they don't then they'll learn very quickly.

Have a good weekend,
Mathieu

> Thanks,
> Arnaud
> 
> > 
> > Mathieu
> > 
> >>
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>  /**
> >>>   * rproc_alloc() - allocate a remote processor handle
> >>>   * @dev: the underlying device
> >>> @@ -2285,6 +2308,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >>>  	if (rproc_alloc_ops(rproc, ops))
> >>>  		goto put_device;
> >>>  
> >>> +	rproc_set_automation_flags(rproc);
> >>> +
> >>>  	/* Assign a unique device index and name */
> >>>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> >>>  	if (rproc->index < 0) {
> >>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >>> index 71d4d4873164..9a6e79ef35d7 100644
> >>> --- a/include/linux/remoteproc.h
> >>> +++ b/include/linux/remoteproc.h
> >>> @@ -516,6 +516,9 @@ struct rproc_dump_segment {
> >>>   * @nb_vdev: number of vdev currently handled by rproc
> >>>   * @char_dev: character device of the rproc
> >>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> >>> + * @autonomous_on_core_reboot: true if the remote processor should be detached from
> >>> + *			       (rather than turned off) when the remoteproc core
> >>> + *			       goes away.
> >>>   */
> >>>  struct rproc {
> >>>  	struct list_head node;
> >>> @@ -554,6 +557,8 @@ struct rproc {
> >>>  	u16 elf_machine;
> >>>  	struct cdev cdev;
> >>>  	bool cdev_put_on_release;
> >>> +	bool autonomous_on_core_reboot	: 1,
> >>> +	     autonomous_on_remote_crash	: 1;
> >>>  };
> >>>  
> >>>  /**
> >>>
