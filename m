Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E02CC2D0E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 08:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E1DD239E5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 08:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIVIJ6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 04:09:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:22403 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgIVIJ5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 04:09:57 -0400
IronPort-SDR: gx0SszusU5X9CekBflUEIRUmoJdGgK7s5mrLR+5Dd8PiergPhI1MAVAzlo/SYz5LPqV1ugqkys
 q+Ik942d/lug==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="224705439"
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; 
   d="scan'208";a="224705439"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 01:09:56 -0700
IronPort-SDR: i7DFCMZeT46WErhKpRsRnSZs2581l90UwkFPUCZJVstwMaNBYaW9dVKes7AlufRBPwHUVMqVIT
 JypBlKYcV8NQ==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="485857398"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.49.176])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 01:09:47 -0700
Date:   Tue, 22 Sep 2020 10:09:44 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] rpmsg: Make RPMSG name service modular
Message-ID: <20200922080944.GB4648@ubuntu>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Thanks for the patches. I'm trying to understand the concept of 
this approach and I'm probably failing at that. It seems to me 
that this patch set is making the NS announcement service to a 
separate RPMsg device and I don't understand the reasoning for 
doing this. As far as I understand namespace announcements 
belong to RPMsg devices / channels, they create a dedicated 
endpoint on them with a fixed pre-defined address. But they 
don't form a separate RPMsg device. I think the current 
virtio_rpmsg_bus.c has that correctly: for each rpmsg device / 
channel multiple endpoints can be created, where the NS 
service is one of them. It's just an endpoing of an rpmsg 
device, not a complete separate device. Have I misunderstood 
anything?

Thanks
Guennadi

On Mon, Sep 21, 2020 at 06:09:50PM -0600, Mathieu Poirier wrote:
> Hi all,
> 
> After looking at Guennadi[1] and Arnaud's patchsets[2] it became
> clear that we need to go back to a generic rpmsg_ns_msg structure
> if we wanted to make progress.  To do that some of the work from
> Arnaud had to be modified in a way that common name service
> functionality was transport agnostic.
> 
> This patchset is based on Arnaud's work but also include a patch
> from Guennadi and some input from me.  It should serve as a
> foundation for the next revision of [1].
> 
> Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
> did not test the modularisation.   
> 
> Comments and feedback would be greatly appreciated.
> 
> Thanks,
> Mathieu 
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
> [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> 
> Arnaud Pouliquen (5):
>   rpmsg: virtio: rename rpmsg_create_channel
>   rpmsg: core: Add channel creation internal API
>   rpmsg: virtio: Add rpmsg channel device ops
>   rpmsg: Turn name service into a stand alone driver
>   rpmsg: virtio: use rpmsg ns device for the ns announcement
> 
> Guennadi Liakhovetski (1):
>   rpmsg: Move common structures and defines to headers
> 
> Mathieu Poirier (4):
>   rpmsg: virtio: Move virtio RPMSG structures to private header
>   rpmsg: core: Add RPMSG byte conversion operations
>   rpmsg: virtio: Make endianness conversion virtIO specific
>   rpmsg: ns: Make Name service module transport agnostic
> 
>  drivers/rpmsg/Kconfig            |   9 +
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
>  drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
>  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
>  include/linux/rpmsg_ns.h         |  83 +++++++++
>  include/uapi/linux/rpmsg.h       |   3 +
>  8 files changed, 487 insertions(+), 199 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>  create mode 100644 include/linux/rpmsg_ns.h
> 
> -- 
> 2.25.1
> 
