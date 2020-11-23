Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7ACC2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Nov 2020 16:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 499182076E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Nov 2020 16:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbgKWQG3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Nov 2020 11:06:29 -0500
Received: from mga12.intel.com ([192.55.52.136]:60495 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729940AbgKWQG3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Nov 2020 11:06:29 -0500
IronPort-SDR: A9uZZQtbCK6KXIbe4o9jqUO8jzwUaoFhNO9NM1YSJ/IhzhkIyHpAg7Tw3EpdOulN0KF4fXk9n6
 iErJ4hfnLdYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="151052449"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="151052449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 08:06:27 -0800
IronPort-SDR: jNXkUoJF/1AyMN8oHixSqviqJpfIMYk+35Bq+42725VrXgR/T+MXfsG1QcwXThEVv/AZHDGh1p
 QYyMlHLVpYAQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="546469412"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.39.35])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 08:06:25 -0800
Date:   Mon, 23 Nov 2020 17:06:10 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/8] rpmsg: Make RPMSG name service modular
Message-ID: <20201123160610.GA19108@ubuntu>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120214245.172963-1-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Thanks for bringing all the stuff together and for polishing it!

For the entire series:

Tested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Thanks
Guennadi

On Fri, Nov 20, 2020 at 02:42:37PM -0700, Mathieu Poirier wrote:
> This revision addresses comments received from the previous revision,
> i.e V6.  Please see details below.
> 
> It starts by making the RPMSG protocol transport agnostic by
> moving the headers it uses to generic types and using those in the
> current implementation.  From there it re-uses the work that Arnaud
> published[1] to make the name service modular.
> 
> Tested on stm32mp157 with the RPMSG client sample application.  Applies
> cleanly on rpmsg-next.
> 
> Thanks,
> Mathieu
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> 
> -------
> New for V7:
> - Fixed error path in rpmsg_probe() as reported by Guennadi
> 
> Arnaud Pouliquen (4):
>   rpmsg: virtio: Rename rpmsg_create_channel
>   rpmsg: core: Add channel creation internal API
>   rpmsg: virtio: Add rpmsg channel device ops
>   rpmsg: Turn name service into a stand alone driver
> 
> Mathieu Poirier (4):
>   rpmsg: Introduce __rpmsg{16|32|64} types
>   rpmsg: virtio: Move from virtio to rpmsg byte conversion
>   rpmsg: Move structure rpmsg_ns_msg to header file
>   rpmsg: Make rpmsg_{register|unregister}_device() public
> 
>  drivers/rpmsg/Kconfig            |   9 ++
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  14 ++-
>  drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 186 +++++++++++--------------------
>  include/linux/rpmsg.h            |  63 ++++++++++-
>  include/linux/rpmsg/byteorder.h  |  67 +++++++++++
>  include/linux/rpmsg/ns.h         |  45 ++++++++
>  include/uapi/linux/rpmsg_types.h |  11 ++
>  10 files changed, 439 insertions(+), 127 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>  create mode 100644 include/linux/rpmsg/byteorder.h
>  create mode 100644 include/linux/rpmsg/ns.h
>  create mode 100644 include/uapi/linux/rpmsg_types.h
> 
> -- 
> 2.25.1
> 
