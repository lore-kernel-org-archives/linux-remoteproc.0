Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66490C4361A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 20:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A09221EA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 20:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729461AbgLCUoV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Dec 2020 15:44:21 -0500
Received: from mga01.intel.com ([192.55.52.88]:22277 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgLCUoU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Dec 2020 15:44:20 -0500
IronPort-SDR: +KMhmcFACkdt/BLeKRgAyFGjcV0ZCNJi/C1fVchdRsUfkkvxqmzoCcHARD8r3v9RVzP3opWuA2
 Hmb/cYgyAlrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="191510832"
X-IronPort-AV: E=Sophos;i="5.78,390,1599548400"; 
   d="scan'208";a="191510832"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 12:42:31 -0800
IronPort-SDR: J2KPvm5Uf/dBjZ1ek6IiSg4rl1HyySv4c5BDquc+PpnYMnUm/GvlryY95YDkNVDZIZ1XcSArHq
 dG1SuaZpJ8NQ==
X-IronPort-AV: E=Sophos;i="5.78,390,1599548400"; 
   d="scan'208";a="550657488"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.47.47])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 12:42:28 -0800
Date:   Thu, 3 Dec 2020 21:42:18 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v7 0/8] rpmsg: Make RPMSG name service modular
Message-ID: <20201203204218.GA13001@ubuntu>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
 <20201123160610.GA19108@ubuntu>
 <20201202110555.GA65230@ubuntu>
 <20201202203954.GC1282360@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202203954.GC1282360@xps15>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

(adding vhost maintainers and the author of [1])

Hi,

I'm working on an Audio DSP virtualisation solution [2] and the next 
step in its upstreaming should be an RPMsg vhost implementation, based 
on [3], which contains a simple addition to the current library-style 
vhost API. Later in [1] a different approach has been presented, 
converting the vhost framework to a proper bus-type and device driver. 
Therefore my questions:

1. if the latter approach is prefered, should we expect follow up 
versions of [1] and their upstreaming?
2. judging by the size and complexity of [1] would it maybe be 
preferable to first extract a minimum patch set just to add vhost 
rpmsg? Looking at the patch set it should be doable and not too 
difficult? Kishon, would it be something you could submit?
3. or would it be preferable to keep vhost in its present form, use 
[3] for rpmsg support and re-implement [1] based on a different 
vhost / vringh approach?

Thanks
Guennadi

[1] https://www.spinics.net/lists/kvm/msg219632.html
[2] https://mailman.alsa-project.org/pipermail/sound-open-firmware/2020-April/003766.html
[3] https://www.spinics.net/lists/linux-virtualization/msg43359.html

On Wed, Dec 02, 2020 at 01:39:54PM -0700, Mathieu Poirier wrote:
> Good day,
> 
> On Wed, Dec 02, 2020 at 12:05:55PM +0100, Guennadi Liakhovetski wrote:
> > Hi Mathieu,
> > 
> > I'd like to resume reviewing and begin upstreaming of the next steps of 
> > my Audio DSP Virtualisation work, based on this your patch set. How 
> 
> I'm all for it too.
> 
> > confident are we that it's going to be upstreamed in its present form? 
> > What's the plan to push it to "next?"
> > 
> 
> I thought we were pretty unanimous that something like what Kishon did was the
> way to go.  
> 
> > Thanks
> > Guennadi
> > 
> > On Mon, Nov 23, 2020 at 05:06:10PM +0100, Guennadi Liakhovetski wrote:
> > > Hi Mathieu,
> > > 
> > > Thanks for bringing all the stuff together and for polishing it!
> > > 
> > > For the entire series:
> > > 
> > > Tested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > 
> > > Thanks
> > > Guennadi
> > > 
> > > On Fri, Nov 20, 2020 at 02:42:37PM -0700, Mathieu Poirier wrote:
> > > > This revision addresses comments received from the previous revision,
> > > > i.e V6.  Please see details below.
> > > > 
> > > > It starts by making the RPMSG protocol transport agnostic by
> > > > moving the headers it uses to generic types and using those in the
> > > > current implementation.  From there it re-uses the work that Arnaud
> > > > published[1] to make the name service modular.
> > > > 
> > > > Tested on stm32mp157 with the RPMSG client sample application.  Applies
> > > > cleanly on rpmsg-next.
> > > > 
> > > > Thanks,
> > > > Mathieu
> > > > 
> > > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> > > > 
> > > > -------
> > > > New for V7:
> > > > - Fixed error path in rpmsg_probe() as reported by Guennadi
> > > > 
> > > > Arnaud Pouliquen (4):
> > > >   rpmsg: virtio: Rename rpmsg_create_channel
> > > >   rpmsg: core: Add channel creation internal API
> > > >   rpmsg: virtio: Add rpmsg channel device ops
> > > >   rpmsg: Turn name service into a stand alone driver
> > > > 
> > > > Mathieu Poirier (4):
> > > >   rpmsg: Introduce __rpmsg{16|32|64} types
> > > >   rpmsg: virtio: Move from virtio to rpmsg byte conversion
> > > >   rpmsg: Move structure rpmsg_ns_msg to header file
> > > >   rpmsg: Make rpmsg_{register|unregister}_device() public
> > > > 
> > > >  drivers/rpmsg/Kconfig            |   9 ++
> > > >  drivers/rpmsg/Makefile           |   1 +
> > > >  drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
> > > >  drivers/rpmsg/rpmsg_internal.h   |  14 ++-
> > > >  drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++
> > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 186 +++++++++++--------------------
> > > >  include/linux/rpmsg.h            |  63 ++++++++++-
> > > >  include/linux/rpmsg/byteorder.h  |  67 +++++++++++
> > > >  include/linux/rpmsg/ns.h         |  45 ++++++++
> > > >  include/uapi/linux/rpmsg_types.h |  11 ++
> > > >  10 files changed, 439 insertions(+), 127 deletions(-)
> > > >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> > > >  create mode 100644 include/linux/rpmsg/byteorder.h
> > > >  create mode 100644 include/linux/rpmsg/ns.h
> > > >  create mode 100644 include/uapi/linux/rpmsg_types.h
> > > > 
> > > > -- 
> > > > 2.25.1
> > > > 
