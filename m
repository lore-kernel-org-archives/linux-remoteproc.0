Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF26C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 05:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A19D20706
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 05:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgI3FeV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:34:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:20962 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgI3FeU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 01:34:20 -0400
IronPort-SDR: WlgP803IGF/6NbtxFgCYOOGcU344Xk4yvLAJnw/VySgnEFSXSTq0iFnTHA8wXQt+drAos/que9
 K7ut3rK6Py/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="163229423"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="163229423"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 22:34:17 -0700
IronPort-SDR: neqWgalgY3EQAmpRBNSfv/QGbGUrywqMU9X/HXboqYYuLYEb4FKcs2a+9jPNCKhPKtj/5BFLAE
 MrOTC4BWBJqw==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="495639263"
Received: from cchitora-mobl.ger.corp.intel.com (HELO ubuntu) ([10.252.32.32])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 22:34:16 -0700
Date:   Wed, 30 Sep 2020 07:34:07 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] rpmsg: Make RPMSG name service modular
Message-ID: <20200930053406.GA20683@ubuntu>
References: <20200928094941.GA4848@ubuntu>
 <20200928193308.GA85087@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928193308.GA85087@xps15>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Mon, Sep 28, 2020 at 01:33:08PM -0600, Mathieu Poirier wrote:
> Hey Guennadi,
> 
> On Mon, Sep 28, 2020 at 11:49:42AM +0200, Guennadi Liakhovetski wrote:
> > (re-sending, mailing list delivery attempts last Friday failed)
> > 
> 
> I got your email on Friday but had to tend to other things.

Sure, no problem, you got it directly because you were on CC, but it didn't 
make it to the mailing lists - you can check archives, it isn't there :-/ 
But thanks to your reply now it's also on the lists.

> > Hi Mathieu,
> > 
> > On Thu, Sep 24, 2020 at 12:18:53PM -0600, Mathieu Poirier wrote:
> > > On Thu, Sep 24, 2020 at 08:53:56AM +0200, Guennadi Liakhovetski wrote:
> > 
> > [snip]
> > 
> > > > Yes, the current rpmsg-virtio code does create *one* rpmsg device when 
> > > > an NS announcement arrives.
> > > 
> > > Currently an rpmsg_device is created each time a NS announcement is received.  
> > 
> > Are there really cases when an NS announcement is sent multiple times by a 
> > remote? But not for the same name-space, at least in virtio_rpmsg_bus.c 
> > there's a check for a duplicate announcement in rpmsg_create_channel().
> > 
> > > > Whereas with this patch set the first rpmsg 
> > > > device would be created to probe the NS service driver and the next one 
> > > > would still be created following the code borrowed from rpmsg-virtio 
> > > > when an NS announcement arrives. And I don't see how those two devices 
> > > > now make sense, sorry. I understand one device per channel, but two, of 
> > > > which one is for a certain endpoing only, whereas other endpoints don't 
> > > > create their devices, don't seem very logical to me.
> > > 
> > > In the current implementation the NS service channel is created automatically
> > > when instantiating an rproc_vdev.
> > 
> > I think the terminology is slightly incorrect above. It isn't a channel, it's 
> > an endpoint. A channel is a synonym of a device in RPMsg (from rpmsg.txt):
> > 
> > "Every rpmsg device is a communication channel with a remote processor (thus
> > rpmsg devices are called channels)."
> > 
> > > An official rpmsg_device is not needed since
> > > it is implicit.
> > 
> > Agree.
> > 
> > > With this set (and as you noted above) an rpmsg_device to
> > > represent the NS service is registered, the same way other services such as
> > > rpmsg_chrdev are.
> > 
> > Oh, I think I'm getting it now. I think now I understand where the 
> > disagreement lies. If I understand correctly in your model each remote 
> > processor can provide multiple *devices* / *channels*. E.g. a remote
> 
> That is correct
>  
> > processor can provide a character device, a network device etc. Each of 
> > those devices / channels would send a namespace announcement to the 
> > main processor, which then would create a respective device and probe 
> > the respective driver - all with the same remote processor over the same 
> > RPMsg bus. I understand this concept and in fact I find it logical.
> > 
> 
> Ok
> 
> > However, since I have no experience with real life RPMsg implementations 
> > I am basing my understanding of RPMsg on the little and scarce and 
> > non-conclusive documentation that I can find online. E.g. on
> > 
> > https://github.com/OpenAMP/open-amp/wiki/RPMsg-Messaging-Protocol
> > 
> > which says:
> > 
> > "Every remote core in RPMsg component is represented by RPMsg device that 
> > provides a communication channel between master and remote, hence RPMsg 
> > devices are also known as channels"
> > 
> > So, according to that definition you cannot have a remote processor, 
> > doing both a character and a network devices. However, in kernel's 
> > rpmsg.txt an *almost exact* copy of that sentence is the quote, that 
> > I've already provided above, with a subtle but important difference:
> > 
> > "Every rpmsg device is a communication channel with a remote processor 
> > (thus rpmsg devices are called channels)."
> 
> The documentation isn't easy to follow and personally got very confused when I
> started getting involved with the remoteproc/rpmsg subsystems.  I have the
> intention of doing a good revamp but there is never enough time. 
> 
> > 
> > It doesn't explicitly say, that there can be multiple devices per 
> > remote processor, but it doesn't specify, that there can be only one 
> > (TM) either, so, implicitly there can be many :-/ So, with this model, 
> > yes, I can understand, how a single instance of the RPMsg bus (in 
> > VirtIO case a pair of virtual queues) can have just *one* namespace 
> > service and serve *multiple* devices channels. In that case yes, the 
> > namespace service can be a separate device.
> 
> I will spin off a V2 of this set and we'll go from there.  I also want to get a
> look at Kishon's patchset that Arnaud and Vincent were referring to before
> making up my mind about how to move foward with your vhost RPMSG API patchset.

I should have a look at the remaining patches from your v1, hopefully my 
problem with sending emails to vger is either already resolved or gets resolved 
very soon.

> This is certainly taking longer than expected but I'd rather take the time to
> explore all aspects of the question rather than having to live with a solution
> that is not adequate.

Yes, this is just the first step in my audio DSP virtualisation patch set, 
once the kernel has a vhost side RPMsg support, I can continue with upstreaming 
of the next step.

Thanks
Guennadi

> Thanks for the patience,
> Mathieu
> 
> > 
> > Thanks
> > Guennadi
> > 
> > > After that nothing else changes and no other rpmgs_device
> > > are created until NS request come in.  When an NS request does come in an
> > > rpmsg_device is created, and that for each request that is received.
> > > 
> > > > 
> > > > Thanks
> > > > Guennadi
> > > > 
> > > > > To prove my theory I ran the rpmsg_client_sample.c and it just worked,
> > > > > no changes to client code needed.
> > > > > 
> > > > > Let's keep talking, it's the only way we'll get through this.
> > > > > 
> > > > > Mathieu
> > > > > 
> > > > > >
> > > > > > Thanks
> > > > > > Guennadi
> > > > > >
> > > > > > On Mon, Sep 21, 2020 at 06:09:50PM -0600, Mathieu Poirier wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > After looking at Guennadi[1] and Arnaud's patchsets[2] it became
> > > > > > > clear that we need to go back to a generic rpmsg_ns_msg structure
> > > > > > > if we wanted to make progress.  To do that some of the work from
> > > > > > > Arnaud had to be modified in a way that common name service
> > > > > > > functionality was transport agnostic.
> > > > > > >
> > > > > > > This patchset is based on Arnaud's work but also include a patch
> > > > > > > from Guennadi and some input from me.  It should serve as a
> > > > > > > foundation for the next revision of [1].
> > > > > > >
> > > > > > > Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
> > > > > > > did not test the modularisation.
> > > > > > >
> > > > > > > Comments and feedback would be greatly appreciated.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Mathieu
> > > > > > >
> > > > > > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
> > > > > > > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> > > > > > >
> > > > > > > Arnaud Pouliquen (5):
> > > > > > >   rpmsg: virtio: rename rpmsg_create_channel
> > > > > > >   rpmsg: core: Add channel creation internal API
> > > > > > >   rpmsg: virtio: Add rpmsg channel device ops
> > > > > > >   rpmsg: Turn name service into a stand alone driver
> > > > > > >   rpmsg: virtio: use rpmsg ns device for the ns announcement
> > > > > > >
> > > > > > > Guennadi Liakhovetski (1):
> > > > > > >   rpmsg: Move common structures and defines to headers
> > > > > > >
> > > > > > > Mathieu Poirier (4):
> > > > > > >   rpmsg: virtio: Move virtio RPMSG structures to private header
> > > > > > >   rpmsg: core: Add RPMSG byte conversion operations
> > > > > > >   rpmsg: virtio: Make endianness conversion virtIO specific
> > > > > > >   rpmsg: ns: Make Name service module transport agnostic
> > > > > > >
> > > > > > >  drivers/rpmsg/Kconfig            |   9 +
> > > > > > >  drivers/rpmsg/Makefile           |   1 +
> > > > > > >  drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
> > > > > > >  drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
> > > > > > >  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
> > > > > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
> > > > > > >  include/linux/rpmsg_ns.h         |  83 +++++++++
> > > > > > >  include/uapi/linux/rpmsg.h       |   3 +
> > > > > > >  8 files changed, 487 insertions(+), 199 deletions(-)
> > > > > > >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> > > > > > >  create mode 100644 include/linux/rpmsg_ns.h
> > > > > > >
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >
> > 
> > ----- End forwarded message -----
