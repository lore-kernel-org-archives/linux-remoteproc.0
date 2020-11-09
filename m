Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D55C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 17:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 290532067D
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 17:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2st/RnR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgKIRzk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 12:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbgKIRzj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 12:55:39 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A0BC0613D3
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2020 09:55:39 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id y7so8845974pfq.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2020 09:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BeHtapBv7r0tY9XGFh/pizxfTl1A7qsOO1pXNTgC3HQ=;
        b=Q2st/RnRSg+b6n2Y6CPRMeHOmfjA1VlDx5wdTajJ/gFoiHC5h7QWiAo5aFQ98NAR2Y
         bICCdz+ncQZpG8P2RLSSxsnP5rxTgGGXLrBEvAGhio4KBTQ2iMIKj+enOC7GugzhelcE
         il/U5BKwtxQ1yLtuviev74icM8QxVVbzdJ5JlOcYnLcyte5VYfmdT5q8r6eTU/8nyuUc
         qhsIK60LFgWy6rqm13WPS5bAGx9/yplxUg2386bwy2S3noyWpC51iRZaMx1v7B9EXw8R
         /vYgKksQia7SnrCQ3WnHQn720mD7d9EVO3AuKkB/brDVnSZZ4meFwa1SmRxD6kN9Zyld
         mJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BeHtapBv7r0tY9XGFh/pizxfTl1A7qsOO1pXNTgC3HQ=;
        b=qum4qEnmxwuW2x6V7jO3KpA8L8xrhNt/7O4n991DwlOAZCpgMZ1y/uENamwKpr44JT
         vMM9iAVcSTvn1CFslkIro9LDjaD0moRC2Zxb+eQZ7bOlBdVy+u7bNwA9dThqJUTAKOW6
         RV5NMk0frEB8NunTsqoVYWcLlsoOz46wM84EVW/cBq4ouMheZfZSPHS59CDBGzGUCk1A
         YWfn9zfNDcGF+pxh03ErL1w9n4RTl/7mVwSWV4HhX8583w0I7L8yLBgfLMSShtUo/+EK
         A1RFteBZsayeEmsppSA/H02s30g6xVUpQ2wUT90DnMuTc1bU0HbwK3McDy7mFYNjSf5s
         NByQ==
X-Gm-Message-State: AOAM531948miG7BM2dGA7Svrla10VDTogm3nbNjY/3r8YoeDUaonU2Qm
        hK6Vi7qe20uW+rzUC38yJB7luw==
X-Google-Smtp-Source: ABdhPJyJkTDtoc9MWlELQ22l2x8G2c1nTZyaqWDhFEVuQPlnaHyDpgLwMzsc367EK8/thV/RuIFRZw==
X-Received: by 2002:a62:ea0c:0:b029:164:3789:547b with SMTP id t12-20020a62ea0c0000b02901643789547bmr14455546pfh.27.1604944539040;
        Mon, 09 Nov 2020 09:55:39 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c4sm12030407pfo.62.2020.11.09.09.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:55:38 -0800 (PST)
Date:   Mon, 9 Nov 2020 10:55:36 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201109175536.GD3395222@xps15>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu>
 <20201106140028.GB10889@ubuntu>
 <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
 <20201109102023.GA17692@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109102023.GA17692@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 09, 2020 at 11:20:24AM +0100, Guennadi Liakhovetski wrote:
> Hi Arnaud,
> 
> On Mon, Nov 09, 2020 at 09:48:37AM +0100, Arnaud POULIQUEN wrote:
> > Hi Guennadi, Mathieu,
> > 
> > On 11/6/20 6:53 PM, Mathieu Poirier wrote:
> > > On Fri, Nov 06, 2020 at 03:00:28PM +0100, Guennadi Liakhovetski wrote:
> > >> On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
> > >>> Hi Mathieu, Arnaud,
> > >>>
> > >>> On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
> > >>>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > >>>>
> > >>>> Make the RPMSG name service announcement a stand alone driver so that it
> > >>>> can be reused by other subsystems.  It is also the first step in making the
> > >>>> functionatlity transport independent, i.e that is not tied to virtIO.
> > >>>
> > >>> Sorry, I just realised that my testing was incomplete. I haven't tested 
> > >>> automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded 
> > >>> it probes and it's working, but if it isn't loaded and instead the rpmsg 
> > >>> bus driver is probed (e.g. virtio_rpmsg_bus), calling 
> > >>> rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause 
> > >>> rpmsg_ns to be loaded.
> > >>
> > >> A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c 
> > >> but that alone doesn't fix the problem completely - the module does load then 
> > >> but not quickly enough, the NS announcement from the host / remote arrives 
> > >> before rpmsg_ns has properly registered. I think the best solution would be 
> > >> to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep 
> > >> the module name, so you could rename them to just core.c and ns.c.
> > > 
> > > I'm pretty sure it is because virtio_device_ready() in rpmsg_probe() is called
> > > before the kernel has finished loading the name space driver.  There has to be
> > > a way to prevent that from happening - I will investigate further.
> > 
> > Right, no dependency is set so the rpmsg_ns driver is never probed...
> > And  name service announcement messages are dropped if the service is not present.
> 
> The mentioned change
> 
> -MODULE_ALIAS("rpmsg_ns");
> +MODULE_ALIAS("rpmsg:rpmsg_ns");

Yes, I'm good with that part.

> 
> is actually a compulsory fix, without it the driver doesn't even get loaded when 
> a device id registered, using rpmsg_ns_register_device(). So this has to be done 
> as a minimum *if* we keep RPNsg NS as a separate kernel module. However, that 
> still doesn't fix the problem relyably because of timing. I've merged both the 
> RPMsg core and NS into a single module, which fixed the issue for me. I'm 
> appending a patch to this email, but since it's a "fixup" please, feel free to 
> roll it into the original work. But thinking about it, even linking modules 
> together doesn't guarantee the order. I think rpmsg_ns_register_device() should 
> actually actively wait for NS device probing to finish - successfully or not. 
> I can add a complete() / wait_for_completion() pair to the process if you like.
> 

Working with a completion is the kind of thing I had in mind.  But I would still
like to keep the drivers separate and that's the part I need to think about.

> Thanks
> Guennadi
> 
> > if rpmsg_virtio_bus is built-in
> > -> using "select RPMSG_NS" in RPMSG_VIRTIO kconfig should ensure that rpmsg_ns is also built-in 
> > if rpmsg_virtio_bus is build as module rpmsg_ns.ko should be loaded first.
> > -> MODULE_SOFTDEP could be used in virtio_rpmsg_bus.c
> > 
> > Thanks,
> > Arnaud
> 
> From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Subject: [PATCH] fixup! rpmsg: Turn name service into a stand alone driver
> 
> Link ns.c with core.c together to guarantee immediate probing.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  drivers/rpmsg/Makefile                   |  2 +-
>  drivers/rpmsg/{rpmsg_core.c => core.c}   | 13 ++++++++++---
>  drivers/rpmsg/{rpmsg_ns.c => ns.c}       | 13 +++----------
>  include/linux/{rpmsg_ns.h => rpmsg/ns.h} |  6 +++++-
>  4 files changed, 19 insertions(+), 15 deletions(-)
>  rename drivers/rpmsg/{rpmsg_core.c => core.c} (99%)
>  rename drivers/rpmsg/{rpmsg_ns.c => ns.c} (87%)
>  rename include/linux/{rpmsg_ns.h => rpmsg/ns.h} (95%)
> 
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee..5aa79e167372 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +rpmsg_core-objs			:= core.o ns.o
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> -obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/core.c
> similarity index 99%
> rename from drivers/rpmsg/rpmsg_core.c
> rename to drivers/rpmsg/core.c
> index 6381c1e00741..0c622cced804 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/core.c
> @@ -14,6 +14,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/rpmsg.h>
> +#include <linux/rpmsg/ns.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -625,21 +626,27 @@ void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
>  }
>  EXPORT_SYMBOL(unregister_rpmsg_driver);
>  
> -
>  static int __init rpmsg_init(void)
>  {
>  	int ret;
>  
>  	ret = bus_register(&rpmsg_bus);
> -	if (ret)
> +	if (ret) {
>  		pr_err("failed to register rpmsg bus: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = rpmsg_ns_init();
> +	if (ret)
> +		bus_unregister(&rpmsg_bus);
>  
>  	return ret;
>  }
>  postcore_initcall(rpmsg_init);
>  
> -static void __exit rpmsg_fini(void)
> +static void rpmsg_fini(void)
>  {
> +	rpmsg_ns_exit();
>  	bus_unregister(&rpmsg_bus);
>  }
>  module_exit(rpmsg_fini);
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/ns.c
> similarity index 87%
> rename from drivers/rpmsg/rpmsg_ns.c
> rename to drivers/rpmsg/ns.c
> index 8e26824ca328..859c587b8300 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/ns.c
> @@ -7,7 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/rpmsg.h>
> -#include <linux/rpmsg_ns.h>
> +#include <linux/rpmsg/ns.h>
>  
>  #include "rpmsg_internal.h"
>  
> @@ -84,7 +84,7 @@ static struct rpmsg_driver rpmsg_ns_driver = {
>  	.probe = rpmsg_ns_probe,
>  };
>  
> -static int rpmsg_ns_init(void)
> +int rpmsg_ns_init(void)
>  {
>  	int ret;
>  
> @@ -94,15 +94,8 @@ static int rpmsg_ns_init(void)
>  
>  	return ret;
>  }
> -postcore_initcall(rpmsg_ns_init);
>  
> -static void rpmsg_ns_exit(void)
> +void rpmsg_ns_exit(void)
>  {
>  	unregister_rpmsg_driver(&rpmsg_ns_driver);
>  }
> -module_exit(rpmsg_ns_exit);
> -
> -MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
> -MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> -MODULE_ALIAS("rpmsg_ns");
> -MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg/ns.h
> similarity index 95%
> rename from include/linux/rpmsg_ns.h
> rename to include/linux/rpmsg/ns.h
> index 42786bb759b5..2838788c8448 100644
> --- a/include/linux/rpmsg_ns.h
> +++ b/include/linux/rpmsg/ns.h
> @@ -4,8 +4,9 @@
>  #define _LINUX_RPMSG_NS_H
>  
>  #include <linux/mod_devicetable.h>
> -#include <linux/types.h>
> +#include <linux/rpmsg.h>
>  #include <linux/rpmsg_byteorder.h>
> +#include <linux/types.h>
>  
>  /**
>   * struct rpmsg_ns_msg - dynamic name service announcement message
> @@ -56,4 +57,7 @@ static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
>         return rpmsg_register_device(rpdev);
>  }
>  
> +int rpmsg_ns_init(void);
> +void rpmsg_ns_exit(void);
> +
>  #endif
> -- 
> 2.28.0
> 
