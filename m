Return-Path: <SRS0=hTqE=EK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2B4C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 18:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 914112067C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 18:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732488AbgKDSjX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 13:39:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:27943 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730821AbgKDSjW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 13:39:22 -0500
IronPort-SDR: wjVPy/YGzPxFhulFWjpLBYVRkFmUgbMfJySLb9ggRd3WFysnU7FY+EcUUilmLbLQpu/JU7ZSBv
 FTv4ZuyGQtHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="169412349"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="169412349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 10:39:19 -0800
IronPort-SDR: TRz0ZAf1iIHhuMzYgUtUvFiTygJH/RMSNOFivvgfiA1YLcp106Gd+M+uEiDKzhK9ghV2X94iV0
 akU6sXa02c3Q==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="539016839"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.45.232])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 10:39:17 -0800
Date:   Wed, 4 Nov 2020 19:39:04 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201104183904.GA31822@ubuntu>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
 <20201027175218.1033609-9-mathieu.poirier@linaro.org>
 <20201104140143.GA30197@ubuntu>
 <20201104173424.GB2893396@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104173424.GB2893396@xps15>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Nov 04, 2020 at 10:34:24AM -0700, Mathieu Poirier wrote:
> On Wed, Nov 04, 2020 at 03:01:44PM +0100, Guennadi Liakhovetski wrote:
> > Hi Mathieu, Arnaud,
> > 
> > I've tried the patch set with my VirtIO / vhost audio implementation, 
> > in general it worked quite well, 
> 
> Very good - it would be nice if you could add your "Tested-by:" tags.

Sure, I guess it would be better if I reply with both "Tested-by" and 
"Reviewed-by" to your next version?

Thanks
Guennadi

> > On Tue, Oct 27, 2020 at 11:52:18AM -0600, Mathieu Poirier wrote:
> > > From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > > 
> > > Make the RPMSG name service announcement a stand alone driver so that it
> > > can be reused by other subsystems.  It is also the first step in making the
> > > functionatlity transport independent, i.e that is not tied to virtIO.
> > > 
> > > Co-developed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > > ---
> > 
> > [snip]
> > 
> > > diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
> > > index bb479f430080..42786bb759b5 100644
> > > --- a/include/linux/rpmsg_ns.h
> > > +++ b/include/linux/rpmsg_ns.h
> > > @@ -39,4 +39,21 @@ enum rpmsg_ns_flags {
> > >  /* Address 53 is reserved for advertising remote services */
> > >  #define RPMSG_NS_ADDR			(53)
> > >  
> > > +/**
> > > + * rpmsg_ns_register_device() - register name service device based on rpdev
> > > + * @rpdev: prepared rpdev to be used for creating endpoints
> > > + *
> > > + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> > > + * basis for the rpmsg name service device.
> > > + */
> > > +static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
> > > +{
> > > +       strcpy(rpdev->id.name, "rpmsg_ns");
> > 
> > you need to
> > 
> > #include <linux/rpmsg.h>
> 
> Of course yes - I'll simply add the header file.  I plan on having another
> revision addressing your comments out by the end of the week or early next week.
> 
> Thanks,
> Mathieu
> 
> > 
> > in this file for rpdev definition. Or you could leave this function in 
> > rpmsg_ns.c, then it's enough to forward-declare struct rpdev here.
> > 
> > Thanks
> > Guennadi
> > 
> > > +       rpdev->driver_override = "rpmsg_ns";
> > > +       rpdev->src = RPMSG_NS_ADDR;
> > > +       rpdev->dst = RPMSG_NS_ADDR;
> > > +
> > > +       return rpmsg_register_device(rpdev);
> > > +}
> > > +
> > >  #endif
> > > -- 
> > > 2.25.1
> > > 
