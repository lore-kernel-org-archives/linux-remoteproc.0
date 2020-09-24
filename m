Return-Path: <SRS0=drqN=DB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927FCC4346E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 06:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57C4023772
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 06:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgIXGyS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Sep 2020 02:54:18 -0400
Received: from mga06.intel.com ([134.134.136.31]:23401 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726929AbgIXGyR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Sep 2020 02:54:17 -0400
IronPort-SDR: nYAqw1LkEIns6DJP5rj282muNIWF3Y7p3UPuygUPAtLAjebQw3K3U6KExCjyMTZrF/95wrZFu7
 nBBSAJreCiCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222701919"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="222701919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 23:54:15 -0700
IronPort-SDR: Yc5bUEg+fDl6o8UlPACw/kZqaN+nVfvIDqTT8WuRPNdDRO4AJU1PTlOahelklkP+c9MHo5ReGb
 qTaC2gm5LXvQ==
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="486781680"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.44.193])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 23:54:08 -0700
Date:   Thu, 24 Sep 2020 08:53:56 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] rpmsg: Make RPMSG name service modular
Message-ID: <20200924065355.GA20502@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922080944.GB4648@ubuntu>
 <CANLsYkyh16_G0y3ZP1_Fv1R1jE83xmSh1kXPpQVBBaz-kdOL4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkyh16_G0y3ZP1_Fv1R1jE83xmSh1kXPpQVBBaz-kdOL4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Sorry for a delayed response, after I'd sent that my message I've 
subscribed to remoteproc and it seems during that transition some 
messages were only delivered from the list and not directly to me 
or something similar has happened.

On Tue, Sep 22, 2020 at 01:12:41PM -0600, Mathieu Poirier wrote:
> Good day Guennadi,
> 
> On Tue, 22 Sep 2020 at 02:09, Guennadi Liakhovetski
> <guennadi.liakhovetski@linux.intel.com> wrote:
> >
> > Hi Mathieu,
> >
> > Thanks for the patches. I'm trying to understand the concept of
> > this approach and I'm probably failing at that. It seems to me
> > that this patch set is making the NS announcement service to a
> > separate RPMsg device and I don't understand the reasoning for
> > doing this. As far as I understand namespace announcements
> > belong to RPMsg devices / channels, they create a dedicated
> > endpoint on them with a fixed pre-defined address. But they
> > don't form a separate RPMsg device. I think the current
> > virtio_rpmsg_bus.c has that correctly: for each rpmsg device /
> > channel multiple endpoints can be created, where the NS
> > service is one of them. It's just an endpoing of an rpmsg
> > device, not a complete separate device. Have I misunderstood
> > anything?
> 
> This patchset does not introduce any new features - the end result in
> terms of functionality is exactly the same.  It is also a carbon copy
> of the work introduced by Arnaud (hence reusing his patches), with the
> exception that the code is presented in a slightly different order to
> allow for a complete dissociation of RPMSG name service from the
> virtIO transport mechanic.
> 
> To make that happen rpmsg device specific byte conversion operations
> had to be introduced in struct rpmsg_device_ops and the explicit
> creation of an rpmsg_device associated with the name service (that
> wasn't needed when name service was welded to virtIO).  But
> associating a rpmsg_device to the name service doesn't change anything
> - RPMSG devices are created the same way when name service messages
> are received from the host or the remote processor.

Yes, the current rpmsg-virtio code does create *one* rpmsg device when 
an NS announcement arrives. Whereas with this patch set the first rpmsg 
device would be created to probe the NS service driver and the next one 
would still be created following the code borrowed from rpmsg-virtio 
when an NS announcement arrives. And I don't see how those two devices 
now make sense, sorry. I understand one device per channel, but two, of 
which one is for a certain endpoing only, whereas other endpoints don't 
create their devices, don't seem very logical to me.

Thanks
Guennadi

> To prove my theory I ran the rpmsg_client_sample.c and it just worked,
> no changes to client code needed.
> 
> Let's keep talking, it's the only way we'll get through this.
> 
> Mathieu
> 
> >
> > Thanks
> > Guennadi
> >
> > On Mon, Sep 21, 2020 at 06:09:50PM -0600, Mathieu Poirier wrote:
> > > Hi all,
> > >
> > > After looking at Guennadi[1] and Arnaud's patchsets[2] it became
> > > clear that we need to go back to a generic rpmsg_ns_msg structure
> > > if we wanted to make progress.  To do that some of the work from
> > > Arnaud had to be modified in a way that common name service
> > > functionality was transport agnostic.
> > >
> > > This patchset is based on Arnaud's work but also include a patch
> > > from Guennadi and some input from me.  It should serve as a
> > > foundation for the next revision of [1].
> > >
> > > Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
> > > did not test the modularisation.
> > >
> > > Comments and feedback would be greatly appreciated.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
> > > [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> > >
> > > Arnaud Pouliquen (5):
> > >   rpmsg: virtio: rename rpmsg_create_channel
> > >   rpmsg: core: Add channel creation internal API
> > >   rpmsg: virtio: Add rpmsg channel device ops
> > >   rpmsg: Turn name service into a stand alone driver
> > >   rpmsg: virtio: use rpmsg ns device for the ns announcement
> > >
> > > Guennadi Liakhovetski (1):
> > >   rpmsg: Move common structures and defines to headers
> > >
> > > Mathieu Poirier (4):
> > >   rpmsg: virtio: Move virtio RPMSG structures to private header
> > >   rpmsg: core: Add RPMSG byte conversion operations
> > >   rpmsg: virtio: Make endianness conversion virtIO specific
> > >   rpmsg: ns: Make Name service module transport agnostic
> > >
> > >  drivers/rpmsg/Kconfig            |   9 +
> > >  drivers/rpmsg/Makefile           |   1 +
> > >  drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
> > >  drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
> > >  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
> > >  include/linux/rpmsg_ns.h         |  83 +++++++++
> > >  include/uapi/linux/rpmsg.h       |   3 +
> > >  8 files changed, 487 insertions(+), 199 deletions(-)
> > >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> > >  create mode 100644 include/linux/rpmsg_ns.h
> > >
> > > --
> > > 2.25.1
> > >
