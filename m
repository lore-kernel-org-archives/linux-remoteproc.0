Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8116BC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 16:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EB02206DF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 16:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgKCQci (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Nov 2020 11:32:38 -0500
Received: from mga17.intel.com ([192.55.52.151]:47964 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgKCQch (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:32:37 -0500
IronPort-SDR: /sClODo3mhsqZh6EjCqLxl9xG+pD6SqA2fVGKn3573gtACvRyCLk6X5ue8iavqeBOiiyGOfQoo
 YT5BGMeR+wiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="148938099"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="148938099"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 08:32:37 -0800
IronPort-SDR: WfgwmvfGml5BSVZD4UDOE/583Vi++IgeIZe4vunJDVytGoRRzV7GKL6JCkJ7lKmfQMUPUANIsj
 nkVs680ReJQw==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="538547046"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.32.201])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 08:32:36 -0800
Date:   Tue, 3 Nov 2020 17:32:26 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] rpmsg: Move structure rpmsg_ns_msg to header file
Message-ID: <20201103163225.GA19947@ubuntu>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
 <20201027175218.1033609-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027175218.1033609-4-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Tue, Oct 27, 2020 at 11:52:13AM -0600, Mathieu Poirier wrote:
> Move structure rpmsg_ns_msg to its own header file so that
> it can be used by other entities.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 32 +-----------------------
>  include/linux/rpmsg_ns.h         | 42 ++++++++++++++++++++++++++++++++

Sorry for a delayed comment, it just occurred to me: there is a 
include/linux/rpmsg directory already, so, perhaps it would be 
better to place the new headers there as include/linux/rpmsg/ns.h 
and include/linux/rpmsg/byteorder.h?

Thanks
Guennadi
