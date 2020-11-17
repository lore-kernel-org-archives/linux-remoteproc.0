Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE4BC63777
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 20:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7751222E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 20:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgKQUkl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 15:40:41 -0500
Received: from mga03.intel.com ([134.134.136.65]:19638 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbgKQUkl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 15:40:41 -0500
IronPort-SDR: azWK+q+exYxhbsvL6CFkA1uokF15Silq0/KRqVnahBFML5JZABYIkHeCSF7iGd3dBmLj8ujAUt
 XeE1z50V0irw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="171103547"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="171103547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 12:40:39 -0800
IronPort-SDR: TSx5QXqK9wP0dqSvKoHiVm3SypOSWWd0FF3Tz7HYDxWTjjGe0qDjnb+Z3VdA5moPvIre84FcAA
 uihhRCqli/RQ==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="544202466"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.34.253])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 12:40:37 -0800
Date:   Tue, 17 Nov 2020 21:40:33 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201117204032.GC15538@ubuntu>
References: <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
 <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
 <20201116224003.GC3892875@xps15>
 <50549519-d9ff-9048-a3d8-dab02bfda096@st.com>
 <20201117160330.GA15538@ubuntu>
 <a653c503-7fd1-7b87-88a5-88c9002ba410@st.com>
 <20201117165816.GB15538@ubuntu>
 <16e07968-d783-8bcc-cec1-fd02cd717ddd@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e07968-d783-8bcc-cec1-fd02cd717ddd@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 17, 2020 at 06:30:54PM +0100, Arnaud POULIQUEN wrote:

[snip]

> It's not a good day for me today... it seems I read your explanation too quickly
> this morning, which is, however, very clear.
> My apologies

Oh, I did the same to one of your earlier emails one of these days - 
I missed a paragraph at the end and then "re-discovered" it in a 
later email, so, I can do that too! :-D

Cheers
Guennadi
