Return-Path: <SRS0=iUhc=6W=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31595C38A2A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 May 2020 21:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F37E62173E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 May 2020 21:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMnTTh+q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgEHVB2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 May 2020 17:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbgEHVB2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 May 2020 17:01:28 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89F7C05BD43
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2020 14:01:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id a4so1419273pgc.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2020 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cDxAwTt6iHNRap4jn2QINZ2FnuFNsYt5ceGCCeY9I3A=;
        b=HMnTTh+qmFlT/70r5PgNMn76nbd8p6m61oU02b0d62505+96FUM6SdZ6A4qJPGjJF1
         vxukONL9TvlGRNvylH/4FtuehTkS4HVZXlK6Otl8A0znUfJsbn22aniSdv11Q0zHUmSn
         TDUkl4Sm4i1vxz8VPae5TRJ71jVfyelG6v/ho+L8AIw9edamyPxDtBGq0IO9IL8mid+W
         MkKHehBcAmGkLjlg5kenFJf9Wbwtc3wcdqWWIcVqDkMWbsr5iuV3OFk4PIPuSrs+PciP
         4sM8yoNNEPyQ6T8L61lKtcouyc8nmPATVnVj6sJ5ET8rG3IWsROYMVIHydeQFoIcNID+
         LuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cDxAwTt6iHNRap4jn2QINZ2FnuFNsYt5ceGCCeY9I3A=;
        b=qq83eAg2RNQaoFONHm6gb9KDfYsr4SaDkmLU8NF1iMLOQrbNDAftFXbt5zIlDsSmmB
         Xa6gKU5grI0beN1bgyGkXBa/spOQrXtx7SzjClXU6l6F4kqvJy+q4E26oNIfrJZJ+qWT
         rWFZ+ezWSqtIVeZHZRMdjUB4zLlgN1KlWx/l+AFDUhFuBli84QcRIpHXYjZy18idAtvL
         P9mINdGkaGQVk4YEP2jqYIDnJDErweJXq71VWyAoo+IAoEOjYD2FwFYyAlaX0g+nJwok
         4KwkdxZ9Iub9ObFmiZq64fhJz9Sv8mdeo7ic840mo80I4s/tACNGE8rkoh+iaRGFsIcb
         T8pA==
X-Gm-Message-State: AGi0PuZBF3e7Hgav6dcquuKfi0YodbAslrId/Vu06Ppi7h91RVQ8eGDQ
        4hI50iHvL5axb4P+vKYILhggLQ==
X-Google-Smtp-Source: APiQypIV54Zn/nN+1JzXJNcyighE4iDl9A8dAoxHnULaQncIRG5dw3sOqz8QFlTBVeLOQ4MvKWViXg==
X-Received: by 2002:a62:d458:: with SMTP id u24mr4982343pfl.275.1588971686948;
        Fri, 08 May 2020 14:01:26 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r78sm2565867pfr.10.2020.05.08.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 14:01:26 -0700 (PDT)
Date:   Fri, 8 May 2020 15:01:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] remoteproc: Add new operation and flags for
 synchronistation
Message-ID: <20200508210123.GA5650@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-4-mathieu.poirier@linaro.org>
 <20200506002253.GC2329931@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506002253.GC2329931@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 05, 2020 at 05:22:53PM -0700, Bjorn Andersson wrote:
> On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> 
> > Add a new sync_ops to support use cases where the remoteproc
> > core is synchronising with the remote processor.  Exactly when to use
> > the synchronisation operations is directed by the flags in structure
> > rproc_sync_flags.
> > 
> 
> I'm sorry, but no matter how many times I read these patches I have to
> translate "synchronising" to "remote controlled", and given the number
> of comments clarifying this makes me feel that we could perhaps come up
> with a better name?

"remote controlled" as in "someone else is managing the remote processor" ?  It
could also mean the remoteproc core is "remote controlling" the remote
processor, exactly what it currently does today...

How about "autonomous", as in the remote processor doesn't need us to boot or
switch it off.  I'm open to any other suggestions.

> 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  include/linux/remoteproc.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index ac4082f12e8b..ceb3b2bba824 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -353,6 +353,23 @@ enum rsc_handling_status {
> >  	RSC_IGNORED	= 1,
> >  };
> >  
> > +/**
> > + * struct rproc_sync_flags - platform specific flags indicating which
> > + *			      rproc_ops to use at specific times during
> > + *			      the rproc lifecycle.
> > + * @on_init: true if synchronising with the remote processor at
> > + *	     initialisation time
> > + * @after_stop: true if synchronising with the remote processor after it was
> > + *		stopped from the cmmand line
> > + * @after_crash: true if synchronising with the remote processor after
> > + *		 it has crashed
> > + */
> > +struct rproc_sync_flags {
> > +	bool on_init;
> 
> This indirectly splits the RPROC_OFFLINE state in an "offline" and
> "already-booted" state. Wouldn't it be clearer to represent this with a
> new RPROC_ALREADY_BOOTED state?
> 

I suggested that at some point in the past but it was in a different context.  I
will revisit to see how doing so could apply here.

> > +	bool after_stop;
> 
> What does it mean when this is true? That Linux can shut the remote core
> down, but someone else will start it?

It tells the remoteproc core how to interact with the remote processor after the
latter has been switched off.  For example, we could want to boot the remote
processor from the boot loader so that minimal functionality can be provided
while the kernel boots.  Once the kernel and user space are in place, the remote
processor is explicitly stopped and booted once again, but this time with a
firmware image that offers full functionality.

It could also be that the remoteproc core can stop the remote processor, but the
remote processor will automatically reboot itself.  In that case the remoteproc
core will simply synchronise with the remote processor, as it does when .on_init
== true.

> 
> > +	bool after_crash;
> 
> Similarly what is the expected steps to be taken by the core when this
> is true? Should rproc_report_crash() simply stop/start the subdevices
> and upon one of the ops somehow tell the remote controller that it can
> proceed with the recovery?

The exact same sequence of steps will be carried out as they are today, except
that if after_crash == true, the remoteproc core won't be switching the remote
processor on, exactly as it would do when on_init == true.

These flags are there to indicate how to set rproc::sync_with_rproc after
different events, that is when the remoteproc core boots, when the remoteproc
has been stopped or when it has crashed.

> 
> > +};
> > +
> >  /**
> >   * struct rproc_ops - platform-specific device handlers
> >   * @start:	power on the device and boot it
> > @@ -459,6 +476,9 @@ struct rproc_dump_segment {
> >   * @firmware: name of firmware file to be loaded
> >   * @priv: private data which belongs to the platform-specific rproc module
> >   * @ops: platform-specific start/stop rproc handlers
> > + * @sync_ops: platform-specific start/stop rproc handlers when
> > + *	      synchronising with a remote processor.
> > + * @sync_flags: Determine the rproc_ops to choose in specific states.
> >   * @dev: virtual device for refcounting and common remoteproc behavior
> >   * @power: refcount of users who need this rproc powered up
> >   * @state: state of the device
> > @@ -482,6 +502,7 @@ struct rproc_dump_segment {
> >   * @table_sz: size of @cached_table
> >   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >   * @auto_boot: flag to indicate if remote processor should be auto-started
> > + * @sync_with_rproc: true if currently synchronising with the rproc
> >   * @dump_segments: list of segments in the firmware
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   */
> > @@ -492,6 +513,8 @@ struct rproc {
> >  	const char *firmware;
> >  	void *priv;
> >  	struct rproc_ops *ops;
> > +	struct rproc_ops *sync_ops;
> 
> Do we really need two rproc_ops, given that both are coming from the
> platform driver and the sync_flags will define which one to look at?
> 
> Can't the platform driver just provide an ops table that works with the
> flags it passes?

That is the approach Loic took in a previous patchset [1] and that was rejected.
It also lead to all of the platform drivers testing rproc->flag before carring
different actions, something you indicated could be done in the core.  This
patch does exactly that, i.e move the testing of rproc->flag to the core and
calls the right function based on that.

The end result is the same and I'm happy with one or the other, I will need to
know which one.

The advantage with the approach I'm proposing is that everything is controlled
in the core, i.e what ops is called and when to set rproc->flag based on
different states the remote processor transitions through.

Thanks,
Mathieu


[1]. https://patchwork.kernel.org/patch/11265869/

> 
> Regards,
> Bjorn
> 
> > +	struct rproc_sync_flags sync_flags;
> >  	struct device dev;
> >  	atomic_t power;
> >  	unsigned int state;
> > @@ -515,6 +538,7 @@ struct rproc {
> >  	size_t table_sz;
> >  	bool has_iommu;
> >  	bool auto_boot;
> > +	bool sync_with_rproc;
> >  	struct list_head dump_segments;
> >  	int nb_vdev;
> >  	u8 elf_class;
> > -- 
> > 2.20.1
> > 
