Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8914C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 06:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99EF72468B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 06:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgKQGqF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 01:46:05 -0500
Received: from mga04.intel.com ([192.55.52.120]:29108 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgKQGqF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 01:46:05 -0500
IronPort-SDR: a1sVP0jDy3TdTmOGdRdiXw0E8SATfGe7gxDBsyChQzdkIg553EBdLiKeuBsCaXUFJtSpX4pVAu
 HYfFE96UGhxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="168295858"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="168295858"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 22:46:04 -0800
IronPort-SDR: oPByFUcIR23Myifk+UBC6rKyN+Ak6PGMMeO1W0YSO+b61rD/oBl1lHFMcd4E634XG5VHfgfNRH
 NDylH3oPKxQw==
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="310116791"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.34.253])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 22:46:03 -0800
Date:   Tue, 17 Nov 2020 07:45:54 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201117064553.GA10837@ubuntu>
References: <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
 <20201111144942.GA6403@ubuntu>
 <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
 <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
 <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
 <20201116224003.GC3892875@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116224003.GC3892875@xps15>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Mon, Nov 16, 2020 at 03:40:03PM -0700, Mathieu Poirier wrote:
> On Mon, Nov 16, 2020 at 04:51:52PM +0100, Arnaud POULIQUEN wrote:

[snip]

> > Having said that, does this guarantee the probe, a good question!
> > Maybe you or Mathieu have the answer, not me...
> 
> I did a lot of probing, went deep in the bowels of the user mode helper
> subsystem and looked at sys_load_module().  Especially at do_init_module() where
> function do_one_initcall()[1] is called on mod->init, which happens to be
> rpmsg_ns_init() where the name space driver is registered.  I am confident we
> can rely on this mechanism.

Thanks for investigating and confirming that! So, we can be confident, that 
if the module is already loaded at the time when the NS device is registered, 
the probing happens synchronously. Now, as for how to actually load the 
module, I'd really propose to move rpmsg_ns_register_device() into the .c 
file and then the problem will be resolved automatically: as a symbol 
dependence the module will be loaded whenever another module, calling 
rpmsg_ns_register_device() is loaded.

Thanks
Guennadi
