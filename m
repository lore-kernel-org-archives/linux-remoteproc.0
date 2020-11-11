Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A22C388F9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 Nov 2020 14:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB0222072C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 Nov 2020 14:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgKKOuB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 11 Nov 2020 09:50:01 -0500
Received: from mga09.intel.com ([134.134.136.24]:22874 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbgKKOuA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Nov 2020 09:50:00 -0500
IronPort-SDR: 1kBqAn7EfpgPGYUQ9WNbdmPq0Nhhw+bWO5h6cTqgv90y7LOx7P4Kbe53/W++sFlY/7uTowx9XX
 P8rgUdvjNNtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="170319372"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="170319372"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 06:49:58 -0800
IronPort-SDR: nszjxZ1WzIKc2Pxw8DQfnhz6/q/US7HaaQtNwKi7YUiH8A2/Sp/vYSp3/uZTbVyZVJHcDcMo/i
 bKuURJmhd+sg==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541828571"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.49.146])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 06:49:56 -0800
Date:   Wed, 11 Nov 2020 15:49:43 +0100
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201111144942.GA6403@ubuntu>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu>
 <20201106140028.GB10889@ubuntu>
 <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
 <20201109102023.GA17692@ubuntu>
 <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Tue, Nov 10, 2020 at 07:18:45PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu, Guennadi,
> 
> On 11/9/20 6:55 PM, Mathieu Poirier wrote:
> > On Mon, Nov 09, 2020 at 11:20:24AM +0100, Guennadi Liakhovetski wrote:
> >> Hi Arnaud,
> >>
> >> On Mon, Nov 09, 2020 at 09:48:37AM +0100, Arnaud POULIQUEN wrote:
> >>> Hi Guennadi, Mathieu,
> >>>
> >>> On 11/6/20 6:53 PM, Mathieu Poirier wrote:
> >>>> On Fri, Nov 06, 2020 at 03:00:28PM +0100, Guennadi Liakhovetski wrote:
> >>>>> On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
> >>>>>> Hi Mathieu, Arnaud,
> >>>>>>
> >>>>>> On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
> >>>>>>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >>>>>>>
> >>>>>>> Make the RPMSG name service announcement a stand alone driver so that it
> >>>>>>> can be reused by other subsystems.  It is also the first step in making the
> >>>>>>> functionatlity transport independent, i.e that is not tied to virtIO.
> >>>>>>
> >>>>>> Sorry, I just realised that my testing was incomplete. I haven't tested 
> >>>>>> automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded 
> >>>>>> it probes and it's working, but if it isn't loaded and instead the rpmsg 
> >>>>>> bus driver is probed (e.g. virtio_rpmsg_bus), calling 
> >>>>>> rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause 
> >>>>>> rpmsg_ns to be loaded.
> >>>>>
> >>>>> A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c 
> >>>>> but that alone doesn't fix the problem completely - the module does load then 
> >>>>> but not quickly enough, the NS announcement from the host / remote arrives 
> >>>>> before rpmsg_ns has properly registered. I think the best solution would be 
> >>>>> to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep 
> >>>>> the module name, so you could rename them to just core.c and ns.c.
> >>>>
> >>>> I'm pretty sure it is because virtio_device_ready() in rpmsg_probe() is called
> >>>> before the kernel has finished loading the name space driver.  There has to be
> >>>> a way to prevent that from happening - I will investigate further.
> >>>
> >>> Right, no dependency is set so the rpmsg_ns driver is never probed...
> >>> And  name service announcement messages are dropped if the service is not present.
> >>
> >> The mentioned change
> >>
> >> -MODULE_ALIAS("rpmsg_ns");
> >> +MODULE_ALIAS("rpmsg:rpmsg_ns");
> > 
> > Yes, I'm good with that part.
> > 
> >>
> >> is actually a compulsory fix, without it the driver doesn't even get loaded when 
> >> a device id registered, using rpmsg_ns_register_device(). So this has to be done 
> >> as a minimum *if* we keep RPNsg NS as a separate kernel module. However, that 
> >> still doesn't fix the problem relyably because of timing. I've merged both the 
> >> RPMsg core and NS into a single module, which fixed the issue for me. I'm 
> >> appending a patch to this email, but since it's a "fixup" please, feel free to 
> >> roll it into the original work. But thinking about it, even linking modules 
> >> together doesn't guarantee the order. I think rpmsg_ns_register_device() should 
> >> actually actively wait for NS device probing to finish - successfully or not. 
> >> I can add a complete() / wait_for_completion() pair to the process if you like.
> >>
> > 
> > Working with a completion is the kind of thing I had in mind.  But I would still
> > like to keep the drivers separate and that's the part I need to think about.
> 
> I reproduce the problem: the rpmsg_ns might not be probed on first message reception.
> What makes the fix not simple is that the virtio forces the virtio status to ready
> after the probe of the virtio unit [1].
> Set this status tiggs the remote processor first messages.
> 
> [1]https://elixir.bootlin.com/linux/latest/source/drivers/virtio/virtio.c#L253
> 
> Guennadi: I'm not sure that your patch will solve the problem , look like it just reduces the
> delay between the rpmsg_virtio and the rpmsg_ns probe (the module loading time is saved)

Right, as I mentioned in the email, that specific patch version only makes the
race window smaller, but doesn't close it completely. However, I think, we could
use a completion to close it fully, we discussed it with Mathieu and I think he
is working on a solution ATM.

> Based on my observations, I can see two alternatives.
> - rpmsg_ns.c is no longer an rpmsg driver but a kind of function library to manage a 
> generic name service.

Right, this is basically the current state of the virtio_rpmsg_bus.c driver. You'd 
just need to make __rpmsg_create_ept() and rpmsg_ns_cb() global and generic.

> - we implement a completion as proposed by Mathieu. 

Exactly, this is the second option. And I think if we link NS with the rpmsg core 
together (or use a different method to make sure it's loaded early), we can use 
a completion to close the raice completely. And since the waiting and the completing 
take place in the same NS driver, I think we can keep it quite simple. An updated 
version of my earlier patch is below. Note, that it also fixes a memory leak in the 
proposed NS implementation:

@@ -920,6 +920,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	return 0;
 
 free_coherent:
+	kfree(vch);
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:

Thanks
Guennadi

> I tried this second solution based on the component bind mechanism. 
> I added the patch at the end of the mail (the patch is a POC, so not ready for upstream). 
> Maybe something simpler is possible. I'm just keeping in mind that we may have to add similar
> services in the future.
> 
> Regards,
> Arnaud

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH] fixup! rpmsg: Turn name service into a stand alone driver

Link ns.c with core.c together to guarantee immediate probing.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/Makefile                        |  2 +-
 drivers/rpmsg/{rpmsg_core.c => core.c}        | 13 +++--
 drivers/rpmsg/{rpmsg_ns.c => ns.c}            | 49 ++++++++++++++-----
 drivers/rpmsg/virtio_rpmsg_bus.c              |  5 +-
 include/linux/rpmsg.h                         |  4 +-
 .../{rpmsg_byteorder.h => rpmsg/byteorder.h}  |  0
 include/linux/{rpmsg_ns.h => rpmsg/ns.h}      | 16 +++---
 7 files changed, 61 insertions(+), 28 deletions(-)
 rename drivers/rpmsg/{rpmsg_core.c => core.c} (99%)
 rename drivers/rpmsg/{rpmsg_ns.c => ns.c} (76%)
 rename include/linux/{rpmsg_byteorder.h => rpmsg/byteorder.h} (100%)
 rename include/linux/{rpmsg_ns.h => rpmsg/ns.h} (82%)

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
similarity index 76%
rename from drivers/rpmsg/rpmsg_ns.c
rename to drivers/rpmsg/ns.c
index 8e26824ca328..86c011bfb62f 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/ns.c
@@ -2,15 +2,47 @@
 /*
  * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
  */
+#include <linux/completion.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/rpmsg.h>
-#include <linux/rpmsg_ns.h>
+#include <linux/rpmsg/ns.h>
+#include <linux/slab.h>
 
 #include "rpmsg_internal.h"
 
+int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
+{
+	int ret;
+
+	strcpy(rpdev->id.name, "rpmsg_ns");
+	rpdev->driver_override = "rpmsg_ns";
+	rpdev->src = RPMSG_NS_ADDR;
+	rpdev->dst = RPMSG_NS_ADDR;
+
+	ret = rpmsg_register_device(rpdev);
+	if (ret < 0)
+		return ret;
+
+	if (!wait_for_completion_timeout(&rpdev->ns_ready,
+					 msecs_to_jiffies(1))) {
+		struct rpmsg_channel_info info = {
+			.name = "rpmsg_ns",
+			.src = rpdev->src,
+			.dst = rpdev->dst,
+		};
+
+		rpmsg_unregister_device(rpdev->dev.parent, &info);
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(rpmsg_ns_register_device);
+
 /* invoked when a name service announcement arrives */
 static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 		       void *priv, u32 src)
@@ -76,6 +108,8 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
 	}
 	rpdev->ept = ns_ept;
 
+	complete(&rpdev->ns_ready);
+
 	return 0;
 }
 
@@ -84,7 +118,7 @@ static struct rpmsg_driver rpmsg_ns_driver = {
 	.probe = rpmsg_ns_probe,
 };
 
-static int rpmsg_ns_init(void)
+int rpmsg_ns_init(void)
 {
 	int ret;
 
@@ -94,15 +128,8 @@ static int rpmsg_ns_init(void)
 
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
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 10a16be986fc..fdf00cc5f57f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -19,8 +19,8 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/rpmsg.h>
-#include <linux/rpmsg_byteorder.h>
-#include <linux/rpmsg_ns.h>
+#include <linux/rpmsg/byteorder.h>
+#include <linux/rpmsg/ns.h>
 #include <linux/rpmsg/virtio.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -920,6 +920,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	return 0;
 
 free_coherent:
+	kfree(vch);
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 8ee1b1dab657..71fd15ada5c0 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -10,6 +10,7 @@
 #ifndef _LINUX_RPMSG_H
 #define _LINUX_RPMSG_H
 
+#include <linux/completion.h>
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -17,7 +18,7 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
-#include <linux/rpmsg_byteorder.h>
+#include <linux/rpmsg/byteorder.h>
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
 
@@ -58,6 +59,7 @@ struct rpmsg_device {
 	struct rpmsg_endpoint *ept;
 	bool announce;
 	bool little_endian;
+	struct completion ns_ready;
 
 	const struct rpmsg_device_ops *ops;
 };
diff --git a/include/linux/rpmsg_byteorder.h b/include/linux/rpmsg/byteorder.h
similarity index 100%
rename from include/linux/rpmsg_byteorder.h
rename to include/linux/rpmsg/byteorder.h
diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg/ns.h
similarity index 82%
rename from include/linux/rpmsg_ns.h
rename to include/linux/rpmsg/ns.h
index 42786bb759b5..2499db0c8c3d 100644
--- a/include/linux/rpmsg_ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -4,8 +4,9 @@
 #define _LINUX_RPMSG_NS_H
 
 #include <linux/mod_devicetable.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/byteorder.h>
 #include <linux/types.h>
-#include <linux/rpmsg_byteorder.h>
 
 /**
  * struct rpmsg_ns_msg - dynamic name service announcement message
@@ -46,14 +47,9 @@ enum rpmsg_ns_flags {
  * This function wraps rpmsg_register_device() preparing the rpdev for use as
  * basis for the rpmsg name service device.
  */
-static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
-{
-       strcpy(rpdev->id.name, "rpmsg_ns");
-       rpdev->driver_override = "rpmsg_ns";
-       rpdev->src = RPMSG_NS_ADDR;
-       rpdev->dst = RPMSG_NS_ADDR;
-
-       return rpmsg_register_device(rpdev);
-}
+int rpmsg_ns_register_device(struct rpmsg_device *rpdev);
+
+int rpmsg_ns_init(void);
+void rpmsg_ns_exit(void);
 
 #endif
-- 
2.28.0

