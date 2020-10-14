Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AE8C433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 10:18:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6385921527
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 10:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgJNKSf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 06:18:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:36427 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbgJNKSe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 06:18:34 -0400
IronPort-SDR: vAaXm0Km17k+48DzlVitgPaoiKprteD+QabqE2IYbfU3nywukBPBbHvPd3YyEJ3GVSX1XaG33G
 yrEyngRdV4fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166199072"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="166199072"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:18:34 -0700
IronPort-SDR: viBr6PdzSDiLwxANqIGwkFKGrJYFhkvfS59lNtTyyDSNE81HGYJncwj8GkDcqspz5Dp/4iqOt7
 BqZJFRL2dHbA==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="530768349"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.36.119])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:18:32 -0700
Date:   Wed, 14 Oct 2020 12:18:23 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] rpmsg: Make RPMSG name service modular
Message-ID: <20201014101822.GA4847@ubuntu>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Oct 13, 2020 at 05:25:10PM -0600, Mathieu Poirier wrote:
> Good afternoon,
> 
> This set starts by making the RPMSG protocol transport agnostic by
> moving the headers it uses to generic types and using those in the
> current implementation.  From there it re-uses the work that Arnaud
> published[1] to make the name service modular. 
> 
> Tested on stm32mp157 with the RPMSG client sample application.  Applies
> cleanly on v5.9.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Thanks
Guennadi

> 
> Thanks,
> Mathieu
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> 
> ------
> New for V2:
> - Created new RPMSG types (Guennadi).
> - Re-worked byte conversion functions(Guennadi).
> - Added a single ->is_little_endian() operation (Arnaud).
> - Fixed byte conversion before making name service modular.
> 
> Arnaud Pouliquen (4):
>   rpmsg: virtio: Rename rpmsg_create_channel
>   rpmsg: core: Add channel creation internal API
>   rpmsg: virtio: Add rpmsg channel device ops
>   rpmsg: Turn name service into a stand alone driver
> 
> Mathieu Poirier (5):
>   rpmsg: Move rpmsg_endpoint_ops to rpmsg.h
>   rpmsg: Introduce __rpmsg{16|32|64} types
>   rpmsg: virtio: Move from virtio to rpmsg byte conversion
>   rpmsg: Move rpmsg_hr and rpmsg_ns_msg to header file
>   rpmsg: Make rpmsg_{register|unregister}_device() public
> 
>  drivers/rpmsg/Kconfig            |   8 ++
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_core.c       |  44 +++++++
>  drivers/rpmsg/rpmsg_internal.h   |  27 +---
>  drivers/rpmsg/rpmsg_ns.c         | 110 +++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 206 ++++++++++---------------------
>  include/linux/rpmsg.h            |  93 ++++++++++++--
>  include/linux/rpmsg_byteorder.h  |  67 ++++++++++
>  include/linux/rpmsg_ns.h         |  79 ++++++++++++
>  include/uapi/linux/rpmsg.h       |   3 +
>  include/uapi/linux/rpmsg_types.h |  11 ++
>  11 files changed, 481 insertions(+), 168 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>  create mode 100644 include/linux/rpmsg_byteorder.h
>  create mode 100644 include/linux/rpmsg_ns.h
>  create mode 100644 include/uapi/linux/rpmsg_types.h
> 
> -- 
> 2.25.1
> 
