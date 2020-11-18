Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4943C5519F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 07:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65D162223D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 07:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgKRHIt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 02:08:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:38655 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgKRHIs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 02:08:48 -0500
IronPort-SDR: HahwTZMmUkfup9oorMyFMpB2xJ+6DRK++R30+Qtb0e4wvNQ962sJzx+qT3h0iDW3efqpOskKfJ
 0ukZPjtuHIXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189148083"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="189148083"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 23:08:48 -0800
IronPort-SDR: cT4WzMgjqK8TlRhjvo48Va8QYGVafVzmvb42xKU62dJudr3ZMyaeI/ee3H2cpINZgP2wiwZZK0
 ZJVjmFwpKNeg==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="544381148"
Received: from atimm-mobl1.ger.corp.intel.com (HELO ubuntu) ([10.252.38.47])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 23:08:46 -0800
Date:   Wed, 18 Nov 2020 08:08:36 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201118070836.GA19190@ubuntu>
References: <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
 <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
 <20201116224003.GC3892875@xps15>
 <50549519-d9ff-9048-a3d8-dab02bfda096@st.com>
 <20201117160330.GA15538@ubuntu>
 <a653c503-7fd1-7b87-88a5-88c9002ba410@st.com>
 <20201118000647.GA4113759@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118000647.GA4113759@xps15>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 17, 2020 at 05:06:47PM -0700, Mathieu Poirier wrote:

[snip]

> I confirm that all this is working as expected - I will send a new revision of
> this set tomorrow afternoon.  
> 
> Guennadi, can I add a Co-developed-by and Signed-off-by with your name on the
> patch?

You can add the "Co-developed-by" tag, sure, if you like. As for the SOB: I'm 
not sure if this is a proper use of it? AFAIK SOB is used when that person 
"transmitted" the patch, e.g. if they developed and submitted it to a list, 
or if they received it from someone and forwarded it upstream (maintainer 
case). I'm not sure about this case, but well, feel free, don't think we'd 
be violating anything since I did send versions of code, similar to parts of 
that, some with my SOF, so, should be fine.

Thanks
Guennadi
