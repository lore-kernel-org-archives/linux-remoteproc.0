Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75591C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 10:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12BBC20684
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 10:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgKIKWP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 05:22:15 -0500
Received: from mga17.intel.com ([192.55.52.151]:53379 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgKIKWP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:22:15 -0500
IronPort-SDR: UOCfyFDjbMo4ko1nWe1ZIH8U53Pn+nt7kMH60ejrDK4FqBLryDh/wvtuLt28ByHlCdFq9pD/Em
 5eumu8zKGN5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="149630225"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="149630225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 02:22:15 -0800
IronPort-SDR: 5LTh1w7rwukHuQcJ5tSOiWA7rZZQkdxi9oaKieNm3somth2unXeqPqMdC81rjXtNWnxtBed+al
 54a7zX7fn5WQ==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="540788796"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.48.45])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 02:22:13 -0800
Date:   Mon, 9 Nov 2020 11:20:24 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201109102023.GA17692@ubuntu>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu>
 <20201106140028.GB10889@ubuntu>
 <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Mon, Nov 09, 2020 at 09:48:37AM +0100, Arnaud POULIQUEN wrote:
> Hi Guennadi, Mathieu,
> 
> On 11/6/20 6:53 PM, Mathieu Poirier wrote:
> > On Fri, Nov 06, 2020 at 03:00:28PM +0100, Guennadi Liakhovetski wrote:
> >> On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
> >>> Hi Mathieu, Arnaud,
> >>>
> >>> On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
> >>>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >>>>
> >>>> Make the RPMSG name service announcement a stand alone driver so that it
> >>>> can be reused by other subsystems.  It is also the first step in making the
> >>>> functionatlity transport independent, i.e that is not tied to virtIO.
> >>>
> >>> Sorry, I just realised that my testing was incomplete. I haven't tested 
> >>> automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded 
> >>> it probes and it's working, but if it isn't loaded and instead the rpmsg 
> >>> bus driver is probed (e.g. virtio_rpmsg_bus), calling 
> >>> rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause 
> >>> rpmsg_ns to be loaded.
> >>
> >> A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c 
> >> but that alone doesn't fix the problem completely - the module does load then 
> >> but not quickly enough, the NS announcement from the host / remote arrives 
> >> before rpmsg_ns has properly registered. I think the best solution would be 
> >> to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep 
> >> the module name, so you could rename them to just core.c and ns.c.
> > 
> > I'm pretty sure it is because virtio_device_ready() in rpmsg_probe() is called
> > before the kernel has finished loading the name space driver.  There has to be
> > a way to prevent that from happening - I will investigate further.
> 
> Right, no dependency is set so the rpmsg_ns driver is never probed...
> And  name service announcement messages are dropped if the service is not present.

The mentioned change

-MODULE_ALIAS("rpmsg_ns");
+MODULE_ALIAS("rpmsg:rpmsg_ns");

is actually a compulsory fix, without it the driver doesn't even get loaded when 
a device id registered, using rpmsg_ns_register_device(). So this has to be done 
as a minimum *if* we keep RPNsg NS as a separate kernel module. However, that 
still doesn't fix the problem relyably because of timing. I've merged both the 
RPMsg core and NS into a single module, which fixed the issue for me. I'm 
appending a patch to this email, but since it's a "fixup" please, feel free to 
roll it into the original work. But thinking about it, even linking modules 
together doesn't guarantee the order. I think rpmsg_ns_register_device() should 
actually actively wait for NS device probing to finish - successfully or not. 
I can add a complete() / wait_for_completion() pair to the process if you like.

Thanks
Guennadi

> if rpmsg_virtio_bus is built-in
> -> using "select RPMSG_NS" in RPMSG_VIRTIO kconfig should ensure that rpmsg_ns is also built-in 
> if rpmsg_virtio_bus is build as module rpmsg_ns.ko should be loaded first.
> -> MODULE_SOFTDEP could be used in virtio_rpmsg_bus.c
> 
> Thanks,
> Arnaud

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH] fixup! rpmsg: Turn name service into a stand alone driver

Link ns.c with core.c together to guarantee immediate probing.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/Makefile                   |  2 +-
 drivers/rpmsg/{rpmsg_core.c => core.c}   | 13 ++++++++++---
 drivers/rpmsg/{rpmsg_ns.c => ns.c}       | 13 +++----------
 include/linux/{rpmsg_ns.h => rpmsg/ns.h} |  6 +++++-
 4 files changed, 19 insertions(+), 15 deletions(-)
 rename drivers/rpmsg/{rpmsg_core.c => core.c} (99%)
 rename drivers/rpmsg/{rpmsg_ns.c => ns.c} (87%)
 rename include/linux/{rpmsg_ns.h => rpmsg/ns.h} (95%)

diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..5aa79e167372 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+rpmsg_core-objs			:= core.o ns.o
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
-obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/core.c
similarity index 99%
rename from drivers/rpmsg/rpmsg_core.c
rename to drivers/rpmsg/core.c
index 6381c1e00741..0c622cced804 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg/ns.h>
 #include <linux/of_device.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -625,21 +626,27 @@ void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
 }
 EXPORT_SYMBOL(unregister_rpmsg_driver);
 
-
 static int __init rpmsg_init(void)
 {
 	int ret;
 
 	ret = bus_register(&rpmsg_bus);
-	if (ret)
+	if (ret) {
 		pr_err("failed to register rpmsg bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = rpmsg_ns_init();
+	if (ret)
+		bus_unregister(&rpmsg_bus);
 
 	return ret;
 }
 postcore_initcall(rpmsg_init);
 
-static void __exit rpmsg_fini(void)
+static void rpmsg_fini(void)
 {
+	rpmsg_ns_exit();
 	bus_unregister(&rpmsg_bus);
 }
 module_exit(rpmsg_fini);
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/ns.c
similarity index 87%
rename from drivers/rpmsg/rpmsg_ns.c
rename to drivers/rpmsg/ns.c
index 8e26824ca328..859c587b8300 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/ns.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/rpmsg.h>
-#include <linux/rpmsg_ns.h>
+#include <linux/rpmsg/ns.h>
 
 #include "rpmsg_internal.h"
 
@@ -84,7 +84,7 @@ static struct rpmsg_driver rpmsg_ns_driver = {
 	.probe = rpmsg_ns_probe,
 };
 
-static int rpmsg_ns_init(void)
+int rpmsg_ns_init(void)
 {
 	int ret;
 
@@ -94,15 +94,8 @@ static int rpmsg_ns_init(void)
 
 	return ret;
 }
-postcore_initcall(rpmsg_ns_init);
 
-static void rpmsg_ns_exit(void)
+void rpmsg_ns_exit(void)
 {
 	unregister_rpmsg_driver(&rpmsg_ns_driver);
 }
-module_exit(rpmsg_ns_exit);
-
-MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
-MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
-MODULE_ALIAS("rpmsg_ns");
-MODULE_LICENSE("GPL v2");
diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg/ns.h
similarity index 95%
rename from include/linux/rpmsg_ns.h
rename to include/linux/rpmsg/ns.h
index 42786bb759b5..2838788c8448 100644
--- a/include/linux/rpmsg_ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -4,8 +4,9 @@
 #define _LINUX_RPMSG_NS_H
 
 #include <linux/mod_devicetable.h>
-#include <linux/types.h>
+#include <linux/rpmsg.h>
 #include <linux/rpmsg_byteorder.h>
+#include <linux/types.h>
 
 /**
  * struct rpmsg_ns_msg - dynamic name service announcement message
@@ -56,4 +57,7 @@ static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
        return rpmsg_register_device(rpdev);
 }
 
+int rpmsg_ns_init(void);
+void rpmsg_ns_exit(void);
+
 #endif
-- 
2.28.0

