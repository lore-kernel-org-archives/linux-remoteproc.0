Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFC1C6369E
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 20:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B428B21527
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 20:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgLBUki (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbgLBUki (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Dec 2020 15:40:38 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD00C0617A6
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Dec 2020 12:39:57 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id s2so1777000plr.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Dec 2020 12:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=72m1KMe+AJCSmimUFUDpNwMkVlKd/noy7/CxGMLAfU8=;
        b=wRmvCng7eaScdkobRQXOhNLwhalOoVmjpyk7RBBDGo7mYDFyeWfQZr5LMb/eCueYxQ
         w6hyM31vnB0n+q8A5rCNMQlHLJ7WzJQ1GX2Uwbe7TX54ETPkuQ3yzE32QiBWl3qVIt0t
         geT6t4wl13+UmxP9xC8Krmcl6MO9YxgkbDhMg1O9/fdZPQUnFasmHpn+IYtWtJ17JPaz
         n1CQ9x7c8m6nhW9So4Y4ab8CAIKlhb7lXi7iYkffpdHjy3pDrDiwezIkE1UO/nqpHqqN
         kJX2UtI1CC5f4SZWICp5lL33sQQz9zhhVPblAYqSI5Zt0A3O+fQEob3cAbXf7Mgd+B3p
         yg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=72m1KMe+AJCSmimUFUDpNwMkVlKd/noy7/CxGMLAfU8=;
        b=E4rSD/Ppt0S9TYQ4Qv2ZggS6mohwEr3zH+82zcnBbdTZgZCaZbkh6+KesGnvG9qpuz
         me5p6+JDs+WOM+wxaljh2CWijvSnPVHcqS4CPoPZgdalMz2oHgeuKyzdBxXkgQje72L7
         GepsEXmVv+V/FbG4/wxx5wkl1V/AOta1aWdTG10FKGwkDeYHzGcABlty46+wzKifZe+l
         N9IvQk6/vzawpNigw5d8ZEn+Nqw6Ov6lAIbZseGbJ3rbAF35PP+mauef+BBxjwTZDlm2
         CrNjF3ACqJ1ZYMPQyRUbiMrrKwj+DdRrlHVoHoTStt+ob94akt8GmI+ywO71bJok7BpC
         enLQ==
X-Gm-Message-State: AOAM532Fmlnj31e1cznX76io2baogR+RpT9NPZLqJHuo+eNLeOSPr26x
        UBPBo5s5y+g+9cNNfsjz00s0qw==
X-Google-Smtp-Source: ABdhPJw1cf0Z0S+7c/CMu2PeYxZmjqPUIZ3StipYqhj626oWKNPBJamixRQCT6VwF3HhZLku5/KtlQ==
X-Received: by 2002:a17:902:9689:b029:d8:e310:2fa2 with SMTP id n9-20020a1709029689b02900d8e3102fa2mr4130256plp.42.1606941597224;
        Wed, 02 Dec 2020 12:39:57 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z22sm624604pfn.153.2020.12.02.12.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 12:39:56 -0800 (PST)
Date:   Wed, 2 Dec 2020 13:39:54 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/8] rpmsg: Make RPMSG name service modular
Message-ID: <20201202203954.GC1282360@xps15>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
 <20201123160610.GA19108@ubuntu>
 <20201202110555.GA65230@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202110555.GA65230@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

On Wed, Dec 02, 2020 at 12:05:55PM +0100, Guennadi Liakhovetski wrote:
> Hi Mathieu,
> 
> I'd like to resume reviewing and begin upstreaming of the next steps of 
> my Audio DSP Virtualisation work, based on this your patch set. How 

I'm all for it too.

> confident are we that it's going to be upstreamed in its present form? 
> What's the plan to push it to "next?"
> 

I thought we were pretty unanimous that something like what Kishon did was the
way to go.  

> Thanks
> Guennadi
> 
> On Mon, Nov 23, 2020 at 05:06:10PM +0100, Guennadi Liakhovetski wrote:
> > Hi Mathieu,
> > 
> > Thanks for bringing all the stuff together and for polishing it!
> > 
> > For the entire series:
> > 
> > Tested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > 
> > Thanks
> > Guennadi
> > 
> > On Fri, Nov 20, 2020 at 02:42:37PM -0700, Mathieu Poirier wrote:
> > > This revision addresses comments received from the previous revision,
> > > i.e V6.  Please see details below.
> > > 
> > > It starts by making the RPMSG protocol transport agnostic by
> > > moving the headers it uses to generic types and using those in the
> > > current implementation.  From there it re-uses the work that Arnaud
> > > published[1] to make the name service modular.
> > > 
> > > Tested on stm32mp157 with the RPMSG client sample application.  Applies
> > > cleanly on rpmsg-next.
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > > [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> > > 
> > > -------
> > > New for V7:
> > > - Fixed error path in rpmsg_probe() as reported by Guennadi
> > > 
> > > Arnaud Pouliquen (4):
> > >   rpmsg: virtio: Rename rpmsg_create_channel
> > >   rpmsg: core: Add channel creation internal API
> > >   rpmsg: virtio: Add rpmsg channel device ops
> > >   rpmsg: Turn name service into a stand alone driver
> > > 
> > > Mathieu Poirier (4):
> > >   rpmsg: Introduce __rpmsg{16|32|64} types
> > >   rpmsg: virtio: Move from virtio to rpmsg byte conversion
> > >   rpmsg: Move structure rpmsg_ns_msg to header file
> > >   rpmsg: Make rpmsg_{register|unregister}_device() public
> > > 
> > >  drivers/rpmsg/Kconfig            |   9 ++
> > >  drivers/rpmsg/Makefile           |   1 +
> > >  drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
> > >  drivers/rpmsg/rpmsg_internal.h   |  14 ++-
> > >  drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 186 +++++++++++--------------------
> > >  include/linux/rpmsg.h            |  63 ++++++++++-
> > >  include/linux/rpmsg/byteorder.h  |  67 +++++++++++
> > >  include/linux/rpmsg/ns.h         |  45 ++++++++
> > >  include/uapi/linux/rpmsg_types.h |  11 ++
> > >  10 files changed, 439 insertions(+), 127 deletions(-)
> > >  create mode 100644 drivers/rpmsg/rpmsg_ns.c
> > >  create mode 100644 include/linux/rpmsg/byteorder.h
> > >  create mode 100644 include/linux/rpmsg/ns.h
> > >  create mode 100644 include/uapi/linux/rpmsg_types.h
> > > 
> > > -- 
> > > 2.25.1
> > > 
