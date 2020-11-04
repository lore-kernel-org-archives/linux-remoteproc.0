Return-Path: <SRS0=hTqE=EK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209CBC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 14:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9CF921734
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 14:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729816AbgKDOD2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:03:28 -0500
Received: from mga07.intel.com ([134.134.136.100]:27190 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbgKDOD1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 09:03:27 -0500
IronPort-SDR: DRjbRrghFeyDlJvwjID/0Y0FcCZVzu9Dnfaj+5a7Evbq9W/DDON+1MHqN4Xu9zuma05klU9ENs
 sq0lqnfufI9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="233380498"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="233380498"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 06:03:24 -0800
IronPort-SDR: rNSYeBg7xwZ/RmQ6D1J7PUPyO6aDtmbzWkWVDia5RsxAAG3mLr9zy5NGZtRh1ajg0N+YlhcOgU
 D6cxX22v6DYg==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="306155352"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.45.232])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 06:03:21 -0800
Date:   Wed, 4 Nov 2020 15:03:18 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] rpmsg: Move structure rpmsg_ns_msg to header file
Message-ID: <20201104140317.GB30197@ubuntu>
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

A nitpick to this one:

On Tue, Oct 27, 2020 at 11:52:13AM -0600, Mathieu Poirier wrote:
> Move structure rpmsg_ns_msg to its own header file so that
> it can be used by other entities.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---

[snip]

> diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> new file mode 100644
> index 000000000000..bb479f430080
> --- /dev/null
> +++ b/include/linux/rpmsg_ns.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _LINUX_RPMSG_NS_H
> +#define _LINUX_RPMSG_NS_H
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/types.h>
> +#include <linux/rpmsg_byteorder.h>

would be good to sort these alphabetically.

Thanks
Guennadi
