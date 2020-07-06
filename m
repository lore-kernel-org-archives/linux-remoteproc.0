Return-Path: <SRS0=TWFy=AR=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40645C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jul 2020 12:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26A0F20720
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jul 2020 12:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgGFMrV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Jul 2020 08:47:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:58047 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729016AbgGFMrU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Jul 2020 08:47:20 -0400
IronPort-SDR: jCJFqWzRimNSzl8SHZL1t2DaN4INMrxGeVGJSWAVzJRrTKXChVL/d34lBOTFKsewS/B4TIIlUu
 YBEsoHopC9Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="148904075"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="148904075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 05:47:20 -0700
IronPort-SDR: WfBv6wWTMNqgQPWrKkii/U6AlQ/RpPxqW85Sdsc9qLRU4ee1+Izh9xigef60+affgviINT+lPb
 wbRsERFGbftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="305284658"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.45.136])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2020 05:47:18 -0700
Date:   Mon, 6 Jul 2020 14:47:17 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH v2] rpmsg: virtio: add endianness conversions
Message-ID: <20200706124716.GA5457@ubuntu>
References: <20200608123932.GF10562@ubuntu>
 <20200615204707.GA231755@xps15>
 <20200616061456.GA2999@ubuntu>
 <20200616073011.GB2999@ubuntu>
 <20200630175057.GA3831001@xps15>
 <20200701055912-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701055912-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 01, 2020 at 06:00:30AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jun 30, 2020 at 11:50:57AM -0600, Mathieu Poirier wrote:
> > On Tue, Jun 16, 2020 at 09:30:11AM +0200, Guennadi Liakhovetski wrote:
> > > According to the VirtIO 1.0 spec data, sent over virtual queues must
> > > be in little-endian format. Update the RPMsg VirtIO implementation
> > > to enforce that but let legacy configurations continue use native
> > > endianness.
> > > 
> > > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > ---
> > > 
> > > v2: Following suggestions from Michael and Mathieu switch to using virtio16/32 
> > > types and conversion functions.
> > > 
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 63 ++++++++++++++++++++++------------------
> > >  1 file changed, 35 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index 07d4f33..41025df 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -11,6 +11,8 @@
> > >  
> > >  #define pr_fmt(fmt) "%s: " fmt, __func__
> > >  
> > > +#include <asm/byteorder.h>
> > > +
> > 
> > Not sure about this header - what does it provide?

It was needed for the original cpu_to_le... and friends version of the patch.

> > 
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/jiffies.h>
> > > @@ -22,6 +24,7 @@
> > >  #include <linux/scatterlist.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/sched.h>
> > > +#include <linux/types.h>
> > 
> > This too... It should be fine with linux/virtio_config.h below since it 
> > already includes linux/virtio_byteorder.h
> 
> It's probably best to include linux/virtio_byteorder.h explicitly.

Yep, will do.

> > Moreover, please send another revision that applies on rproc-next.  The third
> > hunk in this patch doesn't apply.
> > 
> > With the above:
> > 
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > >  #include <linux/virtio.h>
> > >  #include <linux/virtio_ids.h>
> > >  #include <linux/virtio_config.h>

[snip]

> > > @@ -846,15 +853,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> > >  	/* don't trust the remote processor for null terminating the name */
> > >  	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> > >  
> > > -	dev_info(dev, "%sing channel %s addr 0x%x\n",
> > > -		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> > > -		 msg->name, msg->addr);
> > > -
> > >  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> > >  	chinfo.src = RPMSG_ADDR_ANY;
> > > -	chinfo.dst = msg->addr;
> > > +	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> > > +
> > > +	dev_info(dev, "%sing channel %s addr 0x%x\n",
> 
> 
> Let's not try tricks. Just %s and destroying/creating below.
> Wastes 3 bytes of kernel space but is clearer.

Those aren't my tricks - they're already there, but sure, I can replace that while at it.

Thanks
Guennadi

> 
> > > +		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> > > +		 "destroy" : "creat", msg->name, chinfo.dst);
> > >  
> > > -	if (msg->flags & RPMSG_NS_DESTROY) {
> > > +	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> > >  		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
> > >  		if (ret)
> > >  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> > > -- 
> > > 1.9.3
> > > 
> 
