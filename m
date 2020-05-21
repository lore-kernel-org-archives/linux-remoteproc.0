Return-Path: <SRS0=YNmX=7D=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16525C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 May 2020 21:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D749F207D3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 May 2020 21:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p4V+0rmw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbgEUVzs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 21 May 2020 17:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730122AbgEUVzs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 May 2020 17:55:48 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B8EC05BD43
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 14:55:48 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id q8so7892165iow.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ngJe4jgX7tR2LJh4cMj7e9asfe5LKoGFApN1LKGww8=;
        b=p4V+0rmwPq3KhVZUwChMIXQPKtDe0SQs7+O9Sd6YkQIgZn6mYlzDCpTcarqISAWotX
         Sl1hba+jjqEahAIIhy2SBeGNxltcjfVRPZYA3czLEUozn5oJFpwHPE7V5E5arOMeuL6h
         rrdUsnWuXnmdt73Ly40tLugDSw4+XGpf/25nUDduHdsyAITd1Gbs6DwwFZwIYEVllpsL
         Z7P6hOGiIgdpNSr77v0GK+ocagMhl5Q5ZFaWWBadUpFT1y5W12boGmmOUvMgSkpmyCMP
         BEEt6DfZMcoq6IeMCofMxa1MWkxF4d800/nntHKrRVfDPS0uSjAra1Yf6n9TsxJHRcc+
         Dl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ngJe4jgX7tR2LJh4cMj7e9asfe5LKoGFApN1LKGww8=;
        b=p+m+fZwxTzt81X/7QILk8Hv//hk8SDHQO01nYJ55DNRWoKcUzQMPl7dKoejZUdsV04
         e9AnaWvUOUFb1SJeAFSsG4B4mpWde2sE74CNwzAQAgg05IagjJuwSx+7RY/69iRUTLCj
         icruNLnWtHsh62BF6ldSA2AZwd7bq3KzL9faxSVv0/g1zOfEyzFOwmU5a3ZUeqbPQEVl
         bK+izc+tjeabUe4ppBRWC2/9t1JDFmUwwurrACwrJMZ2PvulDmRblglWNq23n7JJePDt
         sfHHg0ovlKsvcQ31+1uXCiwyZydzlbVddLLc1Dj4I12NP90AQaU3BU/4XLVjAegpS/G4
         bhcg==
X-Gm-Message-State: AOAM531L/u8LIFrWrSeRvNI0dUnRPTtVwpncLTJ6KAo5NW/kCWZU2g/U
        5iKLQXdsDxSGeleOkroFIYhnde5XdD0jW/VSkAWpJQ==
X-Google-Smtp-Source: ABdhPJwp0141VZ2jQt2GFxHaft179Kbjsz1atVtDN1BhiNPjuMh66TxGz/mxw+JrjXxZLr/67DWL2oJ95sPfwROV350=
X-Received: by 2002:a05:6602:2e96:: with SMTP id m22mr603283iow.165.1590098147218;
 Thu, 21 May 2020 14:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-4-mathieu.poirier@linaro.org> <20200506002253.GC2329931@builder.lan>
 <20200508210123.GA5650@xps15> <20200514013224.GE16107@builder.lan>
 <20200515192443.GA24201@xps15> <20200519005500.GR2165@builder.lan>
 <20200520220653.GA23552@xps15> <20200521052155.GE11847@yoga>
In-Reply-To: <20200521052155.GE11847@yoga>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 21 May 2020 15:55:35 -0600
Message-ID: <CANLsYkyQJ30tyoKctsYyy8iSxwanampEmRX1Mkoc4RyUvhvQow@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] remoteproc: Add new operation and flags for synchronistation
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Loic PALLARDY <loic.pallardy@st.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Suman Anna <s-anna@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Jon Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 20 May 2020 at 23:22, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 20 May 15:06 PDT 2020, Mathieu Poirier wrote:
>
> > On Mon, May 18, 2020 at 05:55:00PM -0700, Bjorn Andersson wrote:
> > > On Fri 15 May 12:24 PDT 2020, Mathieu Poirier wrote:
> > >
> > > > Good day Bjorn,
> > > >
> > > > On Wed, May 13, 2020 at 06:32:24PM -0700, Bjorn Andersson wrote:
> > > > > On Fri 08 May 14:01 PDT 2020, Mathieu Poirier wrote:
> > > > >
> > > > > > On Tue, May 05, 2020 at 05:22:53PM -0700, Bjorn Andersson wrote:
> > > > > > > On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> [..]
> > > > > > > > + bool after_crash;
> > > > > > >
> > > > > > > Similarly what is the expected steps to be taken by the core when this
> > > > > > > is true? Should rproc_report_crash() simply stop/start the subdevices
> > > > > > > and upon one of the ops somehow tell the remote controller that it can
> > > > > > > proceed with the recovery?
> > > > > >
> > > > > > The exact same sequence of steps will be carried out as they are today, except
> > > > > > that if after_crash == true, the remoteproc core won't be switching the remote
> > > > > > processor on, exactly as it would do when on_init == true.
> > > > > >
> > > > >
> > > > > Just to make sure we're on the same page:
> > > > >
> > > > > after_crash = false is what we have today, and would mean:
> > > > >
> > > > > 1) stop subdevices
> > > > > 2) power off
> > > > > 3) unprepare subdevices
> > > > > 4) generate coredump
> > > > > 5) request firmware
> > > > > 6) load segments
> > > > > 7) find resource table
> > > > > 8) prepare subdevices
> > > > > 9) "boot"
> > > > > 10) start subdevices
> > > >
> > > > Exactly
> > > >
> > > > >
> > > > > after_crash = true would mean:
> > > > >
> > > > > 1) stop subdevices
> > > > > 2) "detach"
> > > > > 3) unprepare subdevices
> > > > > 4) prepare subdevices
> > > > > 5) "attach"
> > > > > 6) start subdevices
> > > > >
> > > >
> > > > Yes
> > > >
> > > > > State diagram wise both of these would represent the transition RUNNING
> > > > > -> CRASHED -> RUNNING, but somehow the platform driver needs to be able
> > > > > to specify which of these sequences to perform. Per your naming
> > > > > suggestion above, this does sound like a "autonomous_recovery" boolean
> > > > > to me.
> > > >
> > > > Right, semantically "rproc->autonomous" would apply quite well.
> > > >
> > > > In function rproc_crash_handler_work(), a call to rproc_set_sync_flag() has been
> > > > strategically placed to set the value of rproc->autonomous based on
> > > > "after_crash".  From there the core knows which rproc_ops to use.  Here too we
> > > > have to rely on the rproc_ops provided by the platform to do the right thing
> > > > based on the scenario to enact.
> > > >
> > >
> > > Do you think that autonomous_recovery would be something that changes
> > > for a given remoteproc instance? I envisioned it as something that you
> > > know at registration time, but perhaps I'm missing some details here.
> >
> > I don't envision any of the transision flags to change once they are set by the
> > platform.   The same applies to the new rproc_ops, it can be set only once.
> > Otherwise combination of possible scenarios becomes too hard to manage, leading
> > to situations where the core and MCU get out of sync and can't talk to each
> > other.
> >
>
> Sounds good, I share this expectation, just wanted to check with you.
>
> > >
> > > > >
> > > > > > These flags are there to indicate how to set rproc::sync_with_rproc after
> > > > > > different events, that is when the remoteproc core boots, when the remoteproc
> > > > > > has been stopped or when it has crashed.
> > > > > >
> > > > >
> > > > > Right, that was clear from your patches. Sorry that my reply didn't
> > > > > convey the information that I had understood this.
> > > > >
> > > > > > >
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  /**
> > > > > > > >   * struct rproc_ops - platform-specific device handlers
> > > > > > > >   * @start:       power on the device and boot it
> > > > > > > > @@ -459,6 +476,9 @@ struct rproc_dump_segment {
> > > > > > > >   * @firmware: name of firmware file to be loaded
> > > > > > > >   * @priv: private data which belongs to the platform-specific rproc module
> > > > > > > >   * @ops: platform-specific start/stop rproc handlers
> > > > > > > > + * @sync_ops: platform-specific start/stop rproc handlers when
> > > > > > > > + *             synchronising with a remote processor.
> > > > > > > > + * @sync_flags: Determine the rproc_ops to choose in specific states.
> > > > > > > >   * @dev: virtual device for refcounting and common remoteproc behavior
> > > > > > > >   * @power: refcount of users who need this rproc powered up
> > > > > > > >   * @state: state of the device
> > > > > > > > @@ -482,6 +502,7 @@ struct rproc_dump_segment {
> > > > > > > >   * @table_sz: size of @cached_table
> > > > > > > >   * @has_iommu: flag to indicate if remote processor is behind an MMU
> > > > > > > >   * @auto_boot: flag to indicate if remote processor should be auto-started
> > > > > > > > + * @sync_with_rproc: true if currently synchronising with the rproc
> > > > > > > >   * @dump_segments: list of segments in the firmware
> > > > > > > >   * @nb_vdev: number of vdev currently handled by rproc
> > > > > > > >   */
> > > > > > > > @@ -492,6 +513,8 @@ struct rproc {
> > > > > > > >   const char *firmware;
> > > > > > > >   void *priv;
> > > > > > > >   struct rproc_ops *ops;
> > > > > > > > + struct rproc_ops *sync_ops;
> > > > > > >
> > > > > > > Do we really need two rproc_ops, given that both are coming from the
> > > > > > > platform driver and the sync_flags will define which one to look at?
> > > > > > >
> > > > > > > Can't the platform driver just provide an ops table that works with the
> > > > > > > flags it passes?
> > > > > >
> > > > > > That is the approach Loic took in a previous patchset [1] and that was rejected.
> > > > > > It also lead to all of the platform drivers testing rproc->flag before carring
> > > > > > different actions, something you indicated could be done in the core.  This
> > > > > > patch does exactly that, i.e move the testing of rproc->flag to the core and
> > > > > > calls the right function based on that.
> > > > > >
> > > > >
> > > > > I think I see what you mean, as we use "start" for both syncing and
> > > > > starting the core, a { on_init = true, after_stop = false } setup either
> > > > > needs two tables or force conditionals on the platform driver.
> > > > >
> > > > > > The end result is the same and I'm happy with one or the other, I will need to
> > > > > > know which one.
> > > > > >
> > > > >
> > > > > How about adding a new ops named "attach" to rproc_ops, which the
> > > > > platform driver can specify if it supports attaching an already running
> > > > > processor?
> > > >
> > > > Using "attach_ops" works for me.  But would "autonomous_ops", to correlate with
> > > > rproc::autonomous, add clarity?  Either way work equally well for me.
> > > >
> > >
> > > What I meant was that we add a function "attach" to the existing
> > > rproc_ops. In the case of OFFLINE->RUNNING we continue to call
> > > rproc->ops->start() and DETACHED->RUNNING we call this
> > > rproc->ops->attach().
> >
> > If I read the above properly we'd end up with:
> >
> > struct rproc_ops {
> >       int (*start)(struct rproc *rproc);
> >       int (*stop)(struct rproc *rproc);
> >       int (*attach)(struct rproc *rproc);
> >       int (*detach)(struct rproc *rproc);
> >         ...
> >         ...
> > };
>
> Yes, that's what I meant.
>
> >
> > But wed'd have to deal with other operations that are common to both scenarios
> > such as parse_fw() and find_loaded_rsc_table().
> >
>
> I would prefer that we don't parse_fw(NULL), perhaps we can turn that
> upside down and have the platform_driver just provide the information to
> the core as it learns about it during probe?

I need to think about that...  We may have to discuss this again in a
not so distant future.

>
> > So far lot of improvement have already been suggested on this revision.  I
> > suggest to spin off a new patchset that only handles the DETACHED->RUNNING
> > scenario and split common functions such as rproc_fw_boot().  From there we can
> > see if other refinements (such as what you suggest above) are mandated.
> >
>
> As far as I can see, if we take the approach of introducing the DETACHED
> state we can add the various transitions piecemeal. So I'm definitely in
> favour of starting off with DETACHED->RUNNING, then figure out
> "autonomous recovery" and RUNNING->DETACHED in two subsequent series.
>
> > One last thing...  Upon reflecting on all this I think using "attach" is better
> > than "autonomous", the latter is heavy to drag around.
> >
>
> For the action of going from DETACHED->RUNNING I too find "attach" to
> better represent what's going on. The part where I think we need
> something more is to communicate if it's Linux that's in charge or not
> for taking the remote processor through RUNNING->CRASHED->RUNNING. For
> that the word "autonomous" makes sense to me, but let's bring that up
> again after landing this first piece(s).

I agree.

>
> Regards,
> Bjorn
