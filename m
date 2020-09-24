Return-Path: <SRS0=drqN=DB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C28C4727E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 18:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 960632311B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 18:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UF9Vjbaj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgIXSS4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Sep 2020 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbgIXSS4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Sep 2020 14:18:56 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AE9C0613D3
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2020 11:18:56 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so85058pgl.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2020 11:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kMOo3KJOc2PkcKyNcQfsNJAsR6f1LNJwtWex0bOgd4U=;
        b=UF9Vjbajp3t54efxJmM5yiZOcksaGSimduU4WCEIVRQgT9ybDXJHKE7XVVH9i/nojc
         C40JEOUUteqYEOHflO+errQaVhlV5MPfyKO/4ltZCTTUgsXXbizA4CJKX4F3CYN2Oi/N
         +RUupw5ssFBrbYHaGgnswbGTNYRU9NkQ0b/+Nyd1emjUJT68xU4kW/ZlabBVcKFhajuX
         T3COmAclEof6trd3+WKkbzEkKdFhuQrLOICiXd6RIg3JAvU+NzqEG3D9aNGxzyP76j4m
         eu6Yh4tV2hUyAM11mq9cd/Jbphs9fnNAcFmcfpSHFF1EMip60Vj1QDQJ1on8qwtaYgwb
         /1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kMOo3KJOc2PkcKyNcQfsNJAsR6f1LNJwtWex0bOgd4U=;
        b=icdIqya0KVJ0uYyBM1jDGtyW77IP6bJQJBLbU57ZuvJKlTrMNhrrYJWRAzzzbX/1SK
         5WlFuFmBGY4omftBzTCRnyY/hMF1BNz9TX8aJvDZ3sqOVG6AFba83+LbNxa4EV2NXCwL
         AgAyHl7Gr2JxyeyY+IS141ld8fIEXp2NOf6dIeLS0Zyfzjnm2tVAxIxbLNyO3O8T5J5r
         zFquGREouC3LwqulrMLdDTjgllEu8eAbNsXg7+eiymYAq2F9eBwekuYzWVhVB8exCZZd
         l6VVnjo/BnRaQgkvTahxLC9+BMIrdKz1z34/SduRVt8NnR055+kDpaR+DO+8TIsGBrvg
         yH6Q==
X-Gm-Message-State: AOAM530V32ecS7y6Pw7LLXO7o1eLDgFEOjrLbWwIl7nysxNEshU1tXMb
        1j/JMnr7YsO0lBzm7I7Zv9GtJg==
X-Google-Smtp-Source: ABdhPJzWWolsPBNCZ7SjOc0mBzGWK3XO0MUbcfIpHW3PyUEUNg7ig5lUo8kWNHk7e9tx2r4xxj6bkg==
X-Received: by 2002:a05:6a00:1695:b029:142:2501:34e4 with SMTP id k21-20020a056a001695b0290142250134e4mr288221pfc.61.1600971535820;
        Thu, 24 Sep 2020 11:18:55 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id s24sm35509pjp.53.2020.09.24.11.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 11:18:55 -0700 (PDT)
Date:   Thu, 24 Sep 2020 12:18:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] rpmsg: Make RPMSG name service modular
Message-ID: <20200924181853.GA1177445@xps15>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922080944.GB4648@ubuntu>
 <CANLsYkyh16_G0y3ZP1_Fv1R1jE83xmSh1kXPpQVBBaz-kdOL4Q@mail.gmail.com>
 <20200924065355.GA20502@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924065355.GA20502@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 24, 2020 at 08:53:56AM +0200, Guennadi Liakhovetski wrote:
> Hi Mathieu,
> 
> Sorry for a delayed response, after I'd sent that my message I've 
> subscribed to remoteproc and it seems during that transition some 
> messages were only delivered from the list and not directly to me 
> or something similar has happened.
>

Ok
 
> On Tue, Sep 22, 2020 at 01:12:41PM -0600, Mathieu Poirier wrote:
> > Good day Guennadi,
> > 
> > On Tue, 22 Sep 2020 at 02:09, Guennadi Liakhovetski
> > <guennadi.liakhovetski@linux.intel.com> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > Thanks for the patches. I'm trying to understand the concept of
> > > this approach and I'm probably failing at that. It seems to me
> > > that this patch set is making the NS announcement service to a
> > > separate RPMsg device and I don't understand the reasoning for
> > > doing this. As far as I understand namespace announcements
> > > belong to RPMsg devices / channels, they create a dedicated
> > > endpoint on them with a fixed pre-defined address. But they
> > > don't form a separate RPMsg device. I think the current
> > > virtio_rpmsg_bus.c has that correctly: for each rpmsg device /
> > > channel multiple endpoints can be created, where the NS
> > > service is one of them. It's just an endpoing of an rpmsg
> > > device, not a complete separate device. Have I misunderstood
> > > anything?
> > 
> > This patchset does not introduce any new features - the end result in
> > terms of functionality is exactly the same.  It is also a carbon copy
> > of the work introduced by Arnaud (hence reusing his patches), with the
> > exception that the code is presented in a slightly different order to
> > allow for a complete dissociation of RPMSG name service from the
> > virtIO transport mechanic.
> > 
> > To make that happen rpmsg device specific byte conversion operations
> > had to be introduced in struct rpmsg_device_ops and the explicit
> > creation of an rpmsg_device associated with the name service (that
> > wasn't needed when name service was welded to virtIO).  But
> > associating a rpmsg_device to the name service doesn't change anything
> > - RPMSG devices are created the same way when name service messages
> > are received from the host or the remote processor.
> 
> Yes, the current rpmsg-virtio code does create *one* rpmsg device when 
> an NS announcement arrives.

Currently an rpmsg_device is created each time a NS announcement is received.  

> Whereas with this patch set the first rpmsg 
> device would be created to probe the NS service driver and the next one 
> would still be created following the code borrowed from rpmsg-virtio 
> when an NS announcement arrives. And I don't see how those two devices 
> now make sense, sorry. I understand one device per channel, but two, of 
> which one is for a certain endpoing only, whereas other endpoints don't 
> create their devices, don't seem very logical to me.

In the current implementation the NS service channel is created automatically
when instantiating an rproc_vdev.  An official rpmsg_device is not needed since
it is implicit.  With this set (and as you noted above) an rpmsg_device to
represent the NS service is registered, the same way other services such as
rpmsg_chrdev are.  After that nothing else changes and no other rpmgs_device
are created until NS request come in.  When an NS request does come in an
rpmsg_device is created, and that for each request that is received.

> 
> Thanks
> Guennadi
> 
> > To prove my theory I ran the rpmsg_client_sample.c and it just worked,
> > no changes to client code needed.
> > 
> > Let's keep talking, it's the only way we'll get through this.
> > 
> > Mathieu
> > 
> > >
> > > Thanks
> > > Guennadi
> > >
> > > On Mon, Sep 21, 2020 at 06:09:50PM -0600, Mathieu Poirier wrote:
> > > > Hi all,
> > > >
> > > > After looking at Guennadi[1] and Arnaud's patchsets[2] it became
> > > > clear that we need to go back to a generic rpmsg_ns_msg structure
> > > > if we wanted to make progress.  To do that some of the work from
> > > > Arnaud had to be modified in a way that common name service
> > > > functionality was transport agnostic.
> > > >
> > > > This patchset is based on Arnaud's work but also include a patch
> > > > from Guennadi and some input from me.  It should serve as a
> > > > foundation for the next revision of [1].
> > > >
> > > > Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
> > > > did not test the modularisation.
> > > >
> > > > Comments and feedback would be greatly appreciated.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
> > > > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> > > >
> > > > Arnaud Pouliquen (5):
> > > >   rpmsg: virtio: rename rpmsg_create_channel
> > > >   rpmsg: core: Add channel creation internal API
> > > >   rpmsg: virtio: Add rpmsg channel device ops
> > > >   rpmsg: Turn name service into a stand alone driver
> > > >   rpmsg: virtio: use rpmsg ns device for the ns announcement
> > > >
> > > > Guennadi Liakhovetski (1):
> > > >   rpmsg: Move common structures and defines to headers
> > > >
> > > > Mathieu Poirier (4):
> > > >   rpmsg: virtio: Move virtio RPMSG structures to private header
> > > >   rpmsg: core: Add RPMSG byte conversion operations
> > > >   rpmsg: virtio: Make endianness conversion virtIO specific
> > > >   rpmsg: ns: Make Name service module transport agnostic
> > > >
> > > >  drivers/rpmsg/Kconfig            |   9 +
> > > >  drivers/rpmsg/Makefile           |   1 +
> > > >  drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
> > > >  drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
> > > >  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
> > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
> > > >  include/linux/rpmsg_ns.h         |  83 +++++++++
> > > >  include/uapi/linux/rpmsg.h       |   3 +
> > > >  8 files changed, 487 insertions(+), 199 deletions(-)
> > > >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> > > >  create mode 100644 include/linux/rpmsg_ns.h
> > > >
> > > > --
> > > > 2.25.1
> > > >
