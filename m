Return-Path: <SRS0=DmTc=76=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B8BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Jun 2020 19:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECEEE20884
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Jun 2020 19:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com header.b="fLTT4ce6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgFQTYy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Jun 2020 15:24:54 -0400
Received: from smtp2.axis.com ([195.60.68.18]:13084 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgFQTYy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Jun 2020 15:24:54 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jun 2020 15:24:53 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=849; q=dns/txt; s=axis-central1;
  t=1592421894; x=1623957894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CoUUOiZsKnhfZqKAoIVjBNqmCj7KbvkrBiiGm12QUvk=;
  b=fLTT4ce6FvCdr7SPkTWjXKMxp0NGkXFnSbrFCtgWGAhxs06ODfRgqGhM
   o77Mdo9PBopqbKgUTRcwFDe+7JBlSkIdd+sJgH6Lyrh1tmnw933HG6MP8
   R3YEpJ6iBXHJYOvRttsyusgjLaF46pQ2NJV2WvDF+hLcZwPYyLx/3zwdI
   EGEd4iTo6KThZLpxoebuFvqWWdt8G4sUOyggpcJCnQHbnLyfQ8q1hJBl8
   rm11QmDc4f/J0p2YJQyiu+PDDfxpl3n6R11o/sCtQ1scBqIFDRJxE8kvO
   BuHohtbGzOqqQTai7AT/dvgWTph83ArLizGjsAfQtzAgAjaLqctIzIjHJ
   A==;
IronPort-SDR: 50gvyFBNjMKUk/jDHf+ZW0rKM/PX94/QfJ2H/hQVUTkuOhRG7tSy1HEPaCQN8cGV3u0BQQf5yz
 fnNsWYdK4cje1vxXsJJWOlkqkzQrolqA0EkbYD1VqeDnLBQMoq6zy3abPfLaGze7gIk8zsJvEd
 +GXNNz64YbIU8/cF66x62jk94fPDL6KP3ZO37r28eTVj6WNHkUzZh9cZEi0luEdkaoGLcvGtjM
 Cm3xOoFqdtXohCBzU8Gf/EwwXLmFGW1uVf+GdxOPJ0Xobup1pE7tNGtw091SdnZc3WmPOUXa1K
 GkA=
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; 
   d="scan'208";a="9645544"
Date:   Wed, 17 Jun 2020 21:17:42 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC:     <kvm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <sound-open-firmware@alsa-project.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200617191741.whnp7iteb36cjnia@axis.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 27, 2020 at 08:05:41PM +0200, Guennadi Liakhovetski wrote:
> Linux supports running the RPMsg protocol over the VirtIO transport
> protocol, but currently there is only support for VirtIO clients and
> no support for a VirtIO server. This patch adds a vhost-based RPMsg
> server implementation.

This looks really useful, but why is it implemented as an API and not as
a real vhost driver which implements an rpmsg bus?  If you implement it
as a vhost driver which implements rpmsg_device_ops and
rpmsg_endpoint_ops, then wouldn't you be able to implement your
vhost-sof driver using the normal rpmsg APIs?

I tried quickly hooking up this code to such a vhost driver and I was
able to communicate between host and guest systems with both
rpmsg-client-sample and rpmsg-char which almost no modifications to
those drivers.
