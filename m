Return-Path: <SRS0=pvyB=DF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E65FC4741F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Sep 2020 19:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15DDF2074B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Sep 2020 19:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gM+1zEKG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgI1TdO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Sep 2020 15:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgI1TdN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Sep 2020 15:33:13 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C33C061755
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2020 12:33:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 5so1762502pgf.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2020 12:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xGmHAT5QSIshHXwp7YID51MvJx+onGGMtyezVB0R6Ng=;
        b=gM+1zEKGDWb8wTk5KkBYaUZpOp7ebv776xpvu0zHj9ly4WCEPlt1llMF+eb59a5jwK
         8qBELP76Ay8flh1DeSBlj4oJqnNiNPrHBaEJJnJ2RFI0hLVuxEuYj1U/aTw9C6SRfm5B
         AENBdyETa9hiqHeHMwNet1UOtTlnU8harBniFmHbhT1WAML8NW/kNr+qCZYMNqX/gR5L
         fce7N+xKkxETMmXRPFGqy6slxFQi8mbfZJT9XtF9Zx800R19UV8l7HC3qU7H5xvxi3kX
         wRtRUMIb1kCl0lQUey1rurC/tWUMn304dxtAOosGXicHKMQ5dRiMXAYvVx6KgDcSxEdB
         Zg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xGmHAT5QSIshHXwp7YID51MvJx+onGGMtyezVB0R6Ng=;
        b=fed4AEPC7Zot5OLU2thPrWhgqlJm3W588JeK3nxD2MwH1EAiWQhhyyN+0FtfpsrlVV
         ole40HwSPw9V3CYw94iOgymdC+ja3eYYO8d/7GQw8cybcJ9syZ8P/YrV8JTfDUf8Kti5
         CuVwCVsNRAVghrIdsv4wfS2S+v9g0ZY/JD8w8TIKcTWx71TmPIOR19WrUaXm9hbujHCA
         2jhd66zn2tkBxWbJiMk8RUE8WEzaoG1KD4bBI23cJiCrWSlQnCx6lqxv5VHZmp+7HDQO
         T8UZg5G74PMHgaauiM1vLXSXCznRPE8tyaPFf+zoms89lrRQVIqpC9AA9/SEFwNIE0ua
         5lWw==
X-Gm-Message-State: AOAM531ShAeL2ET2WNY9rwZxYqQodxNJ0uNp22vppN8LuM9X9rGbrd7T
        xtg5LALPX5ZD3grH2ho7bkhN/63LrlkA6w==
X-Google-Smtp-Source: ABdhPJy4ybQGQxac1vDgAAYLrzMcGkVFJ9RWXgExQXY+uEuehtapWlxlAMRGYI2nHqneJ40dDXIM9w==
X-Received: by 2002:a17:902:a987:b029:d2:8a38:5bbe with SMTP id bh7-20020a170902a987b02900d28a385bbemr957552plb.60.1601321591154;
        Mon, 28 Sep 2020 12:33:11 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i17sm2488529pfa.29.2020.09.28.12.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 12:33:10 -0700 (PDT)
Date:   Mon, 28 Sep 2020 13:33:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] rpmsg: Make RPMSG name service modular
Message-ID: <20200928193308.GA85087@xps15>
References: <20200928094941.GA4848@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928094941.GA4848@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Guennadi,

On Mon, Sep 28, 2020 at 11:49:42AM +0200, Guennadi Liakhovetski wrote:
> (re-sending, mailing list delivery attempts last Friday failed)
> 

I got your email on Friday but had to tend to other things.

> Hi Mathieu,
> 
> On Thu, Sep 24, 2020 at 12:18:53PM -0600, Mathieu Poirier wrote:
> > On Thu, Sep 24, 2020 at 08:53:56AM +0200, Guennadi Liakhovetski wrote:
> 
> [snip]
> 
> > > Yes, the current rpmsg-virtio code does create *one* rpmsg device when 
> > > an NS announcement arrives.
> > 
> > Currently an rpmsg_device is created each time a NS announcement is received.  
> 
> Are there really cases when an NS announcement is sent multiple times by a 
> remote? But not for the same name-space, at least in virtio_rpmsg_bus.c 
> there's a check for a duplicate announcement in rpmsg_create_channel().
> 
> > > Whereas with this patch set the first rpmsg 
> > > device would be created to probe the NS service driver and the next one 
> > > would still be created following the code borrowed from rpmsg-virtio 
> > > when an NS announcement arrives. And I don't see how those two devices 
> > > now make sense, sorry. I understand one device per channel, but two, of 
> > > which one is for a certain endpoing only, whereas other endpoints don't 
> > > create their devices, don't seem very logical to me.
> > 
> > In the current implementation the NS service channel is created automatically
> > when instantiating an rproc_vdev.
> 
> I think the terminology is slightly incorrect above. It isn't a channel, it's 
> an endpoint. A channel is a synonym of a device in RPMsg (from rpmsg.txt):
> 
> "Every rpmsg device is a communication channel with a remote processor (thus
> rpmsg devices are called channels)."
> 
> > An official rpmsg_device is not needed since
> > it is implicit.
> 
> Agree.
> 
> > With this set (and as you noted above) an rpmsg_device to
> > represent the NS service is registered, the same way other services such as
> > rpmsg_chrdev are.
> 
> Oh, I think I'm getting it now. I think now I understand where the 
> disagreement lies. If I understand correctly in your model each remote 
> processor can provide multiple *devices* / *channels*. E.g. a remote

That is correct
 
> processor can provide a character device, a network device etc. Each of 
> those devices / channels would send a namespace announcement to the 
> main processor, which then would create a respective device and probe 
> the respective driver - all with the same remote processor over the same 
> RPMsg bus. I understand this concept and in fact I find it logical.
> 

Ok

> However, since I have no experience with real life RPMsg implementations 
> I am basing my understanding of RPMsg on the little and scarce and 
> non-conclusive documentation that I can find online. E.g. on
> 
> https://github.com/OpenAMP/open-amp/wiki/RPMsg-Messaging-Protocol
> 
> which says:
> 
> "Every remote core in RPMsg component is represented by RPMsg device that 
> provides a communication channel between master and remote, hence RPMsg 
> devices are also known as channels"
> 
> So, according to that definition you cannot have a remote processor, 
> doing both a character and a network devices. However, in kernel's 
> rpmsg.txt an *almost exact* copy of that sentence is the quote, that 
> I've already provided above, with a subtle but important difference:
> 
> "Every rpmsg device is a communication channel with a remote processor 
> (thus rpmsg devices are called channels)."

The documentation isn't easy to follow and personally got very confused when I
started getting involved with the remoteproc/rpmsg subsystems.  I have the
intention of doing a good revamp but there is never enough time. 

> 
> It doesn't explicitly say, that there can be multiple devices per 
> remote processor, but it doesn't specify, that there can be only one 
> (TM) either, so, implicitly there can be many :-/ So, with this model, 
> yes, I can understand, how a single instance of the RPMsg bus (in 
> VirtIO case a pair of virtual queues) can have just *one* namespace 
> service and serve *multiple* devices channels. In that case yes, the 
> namespace service can be a separate device.

I will spin off a V2 of this set and we'll go from there.  I also want to get a
look at Kishon's patchset that Arnaud and Vincent were referring to before
making up my mind about how to move foward with your vhost RPMSG API patchset.

This is certainly taking longer than expected but I'd rather take the time to
explore all aspects of the question rather than having to live with a solution
that is not adequate.

Thanks for the patience,
Mathieu

> 
> Thanks
> Guennadi
> 
> > After that nothing else changes and no other rpmgs_device
> > are created until NS request come in.  When an NS request does come in an
> > rpmsg_device is created, and that for each request that is received.
> > 
> > > 
> > > Thanks
> > > Guennadi
> > > 
> > > > To prove my theory I ran the rpmsg_client_sample.c and it just worked,
> > > > no changes to client code needed.
> > > > 
> > > > Let's keep talking, it's the only way we'll get through this.
> > > > 
> > > > Mathieu
> > > > 
> > > > >
> > > > > Thanks
> > > > > Guennadi
> > > > >
> > > > > On Mon, Sep 21, 2020 at 06:09:50PM -0600, Mathieu Poirier wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > After looking at Guennadi[1] and Arnaud's patchsets[2] it became
> > > > > > clear that we need to go back to a generic rpmsg_ns_msg structure
> > > > > > if we wanted to make progress.  To do that some of the work from
> > > > > > Arnaud had to be modified in a way that common name service
> > > > > > functionality was transport agnostic.
> > > > > >
> > > > > > This patchset is based on Arnaud's work but also include a patch
> > > > > > from Guennadi and some input from me.  It should serve as a
> > > > > > foundation for the next revision of [1].
> > > > > >
> > > > > > Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
> > > > > > did not test the modularisation.
> > > > > >
> > > > > > Comments and feedback would be greatly appreciated.
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
> > > > > > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> > > > > >
> > > > > > Arnaud Pouliquen (5):
> > > > > >   rpmsg: virtio: rename rpmsg_create_channel
> > > > > >   rpmsg: core: Add channel creation internal API
> > > > > >   rpmsg: virtio: Add rpmsg channel device ops
> > > > > >   rpmsg: Turn name service into a stand alone driver
> > > > > >   rpmsg: virtio: use rpmsg ns device for the ns announcement
> > > > > >
> > > > > > Guennadi Liakhovetski (1):
> > > > > >   rpmsg: Move common structures and defines to headers
> > > > > >
> > > > > > Mathieu Poirier (4):
> > > > > >   rpmsg: virtio: Move virtio RPMSG structures to private header
> > > > > >   rpmsg: core: Add RPMSG byte conversion operations
> > > > > >   rpmsg: virtio: Make endianness conversion virtIO specific
> > > > > >   rpmsg: ns: Make Name service module transport agnostic
> > > > > >
> > > > > >  drivers/rpmsg/Kconfig            |   9 +
> > > > > >  drivers/rpmsg/Makefile           |   1 +
> > > > > >  drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
> > > > > >  drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
> > > > > >  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
> > > > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
> > > > > >  include/linux/rpmsg_ns.h         |  83 +++++++++
> > > > > >  include/uapi/linux/rpmsg.h       |   3 +
> > > > > >  8 files changed, 487 insertions(+), 199 deletions(-)
> > > > > >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> > > > > >  create mode 100644 include/linux/rpmsg_ns.h
> > > > > >
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> 
> ----- End forwarded message -----
