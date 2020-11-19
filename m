Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB0BC56201
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 17:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5814241A6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 17:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbgKSRLG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 12:11:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:15573 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728511AbgKSRLG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 12:11:06 -0500
IronPort-SDR: 16gkPpprIQTxa5ynhEfVQWC4Gfw7i2jIDSutdaMM8o4gxJ33t6tzAS7XGnBZvgqxBNPHXvZv3P
 qaXVPgsZ70lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="235474206"
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; 
   d="scan'208";a="235474206"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 09:11:06 -0800
IronPort-SDR: iSchIvvKK82twu/wnA3A21/yAi2w577jmVsHprnWNLy6hJ4eNVp5eYk1uU+7yZKI60QgoIkXKC
 rzjHENa9MwHg==
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; 
   d="scan'208";a="476889840"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.39.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 09:11:04 -0800
Date:   Thu, 19 Nov 2020 18:10:51 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201119171051.GA6464@ubuntu>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
 <20201118213700.74106-9-mathieu.poirier@linaro.org>
 <447fdbd6-2e3d-2786-c444-25148efcb9f8@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <447fdbd6-2e3d-2786-c444-25148efcb9f8@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

I haven't tested it yet, but I've compared it to the previous version 
and all the changed except the one, mentioned by Arnaud, seem to be 
there! So, let's just fix this one and should be good to go!

Thanks
Guennadi

On Thu, Nov 19, 2020 at 03:52:50PM +0100, Arnaud POULIQUEN wrote:

[snip]

> As Guennadi mentionned in a previous mail
> a kfree(vch) is missing on error
> 
> @@ -949,10 +949,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	dev_info(&vdev->dev, "rpmsg host is online\n");
> 
>  	return 0;
> 
>  free_coherent:
> +	kfree(vch);
>  	dma_free_coherent(vdev->dev.parent, total_buf_space,
>  			  bufs_va, vrp->bufs_dma);
>  vqs_del:
> 
> Otherwise i tested this series successfully.
> 
> Thanks,
> Arnaud
