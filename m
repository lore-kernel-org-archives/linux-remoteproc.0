Return-Path: <SRS0=mBHI=EM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24E5C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 14:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62765206A4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 14:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgKFOAg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Nov 2020 09:00:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:5448 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726565AbgKFOAg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Nov 2020 09:00:36 -0500
IronPort-SDR: jMoXYqN3jUrYWX2NsUGosBivCEdsu4wNeoEvh+cQNPidW72a4i+X/Q2vCuLXAwwtWMxKC6g91b
 syhUcYL0aQ+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="233710303"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="233710303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 06:00:35 -0800
IronPort-SDR: jfEEqQr+DIUmqSAevm2Rx2saI3qjkxtQLeU+nyASNQgr3QyWb72oIeMM/404eKa5zlSwQt8/S/
 JZmclzPSwnmg==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="539848120"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.35.112])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 06:00:34 -0800
Date:   Fri, 6 Nov 2020 15:00:28 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201106140028.GB10889@ubuntu>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106131545.GA10889@ubuntu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
> Hi Mathieu, Arnaud,
> 
> On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
> > From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > 
> > Make the RPMSG name service announcement a stand alone driver so that it
> > can be reused by other subsystems.  It is also the first step in making the
> > functionatlity transport independent, i.e that is not tied to virtIO.
> 
> Sorry, I just realised that my testing was incomplete. I haven't tested 
> automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded 
> it probes and it's working, but if it isn't loaded and instead the rpmsg 
> bus driver is probed (e.g. virtio_rpmsg_bus), calling 
> rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause 
> rpmsg_ns to be loaded.

A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c 
but that alone doesn't fix the problem completely - the module does load then 
but not quickly enough, the NS announcement from the host / remote arrives 
before rpmsg_ns has properly registered. I think the best solution would be 
to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep 
the module name, so you could rename them to just core.c and ns.c.

Thanks
Guennadi
