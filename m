Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01911C388F9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 22:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8229322447
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 22:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQp3poRY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgKPWkH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 17:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgKPWkH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 17:40:07 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F64C0613D2
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 14:40:07 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id e21so14517943pgr.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 14:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zGbdjy3/Y9+rPZ81HPwnn/Mn4CrTLmwwvNtIjK4BFAY=;
        b=QQp3poRYH483KPoxMXnGMtiLPY+mYExG8sfwI7jgECqBtpm7X8O8WukPU6texnVL4A
         sJmveE+KTeIj0zJAWPIh2Tfd+jQ2ivs0QyQwHyV1rwahhZ+TaSYxClQHmjrLUhgKEtBC
         Wxeu+tzfTbfgFVWnKuMZfsp8CWHN/3qYtPoac4iQ24PxmcBQWzbauLL5e+ClIjx8B75e
         T8LBDsKjzdOx06suZOR0VekKnhydpOwbC/XG2l7SCmb3b96RRP136owiT+cF+z+rHPXI
         vAVM1bZT/Pu1dxJVacSYXusRQKwfvAcJ+uRlgkym6JX0EDCR/28RCCo2dxYJg+oPt13d
         YWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zGbdjy3/Y9+rPZ81HPwnn/Mn4CrTLmwwvNtIjK4BFAY=;
        b=l3DMCMXl7tIwewM0ionVoAN/Mf1sYganMF9Cujq3H/3GQx2uMZdK6uwio544A75fHk
         fq+UCsabpF/nC7IM7vlu8a7pyT1wyzlbxJX4fPDqHzwSrRSkJJ43UBLLqc750wKlrK6J
         4Ow3nZPRGCEvXFZsViS7Uv7Z2o9t2F/BtEHOIqDGeVg6nU9zqee/VVBgtHOfXDK9dfcU
         RvZ9+6be/cxl3hernpOLzCWdHKnbpfFhmxJnvQkaeWCOg+A9iXl6hb6IxpqsDbn4wup4
         OBjYWCnH8m4TfhS6W7hboVVgbXq0Uf0haILe3U7hXlZNFpIilQnEFJwiaVs9Xi/Y5GuI
         nE4Q==
X-Gm-Message-State: AOAM531uoZVfsH3K7MwguC+78VQrIk43MALB/INuS7OmFertdNRAR3Bh
        60Hcc4cCBwy7GJ8b6pL5a9z2Pw==
X-Google-Smtp-Source: ABdhPJw60Dx3/SOlb3Rd+KRp+qeKbsnAab5GBhz4ywnXZfxtJnGVem0Rn2kpWHma9MTuCHQBamkPJQ==
X-Received: by 2002:a63:1a4e:: with SMTP id a14mr1123233pgm.78.1605566406484;
        Mon, 16 Nov 2020 14:40:06 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id gg19sm470296pjb.21.2020.11.16.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 14:40:05 -0800 (PST)
Date:   Mon, 16 Nov 2020 15:40:03 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Message-ID: <20201116224003.GC3892875@xps15>
References: <20201109102023.GA17692@ubuntu>
 <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
 <20201111144942.GA6403@ubuntu>
 <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
 <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
 <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 04:51:52PM +0100, Arnaud POULIQUEN wrote:
> Hi Guennadi,
> 
> On 11/16/20 4:10 PM, Guennadi Liakhovetski wrote:
> > Hi Arnaud,
> > 
> > On Mon, Nov 16, 2020 at 03:43:35PM +0100, Arnaud POULIQUEN wrote:
> >> Hi Guennadi, Mathieu,
> > 
> > [snip]
> > 
> >> I tried the find_module API, it's quite simple and seems to work well. just need
> >> to be protected by #ifdef MODULE
> >>
> >> I also added a select RMPS_NS in the RPMSG_VIRTIO for compatibility with the legacy.
> >>
> >> look to me that this patch is a simple fix that should work also for the vhost...
> >> that said, the question is can we use this API here?
> >>
> >> I attached the patch at the end of the mail.
> > 
> > Thanks for the patch. Yes, this would guarantee, that the NS module is loaded. But 
> > does it also guarantee, that the NS probing completes faster than an NS announcement 
> > arrives? We have a race here:
> > 
> > rpmsg_ns_register_device() -----------------\
> >      |                                      |
> > virtio_device_ready()                       |
> >      |                                      |
> > remote sends NS announcement      rpmsg_register_device()
> >      |                                      |
> >      |                            rpmsg_ns_probe()
> >      |                                      |
> >      |                            rpmsg_create_ept()
> > rpmsg_ns_cb()
> > 
> > In practice we *should* be fine - maybe the whole probing (the right branch) happens 
> > synchronously on the same core as where rpmsg_ns_register_device() was called, or 
> > even if not, the probing runs locally and the NS announcement either talks to a 
> > remote core or a VM. So, it *should* be safe, but unless we can make guarantee, that 
> > the probing is synchronous, I wouldn't rely on this. So, without a completion this 
> > still seems incomplete to me.
> 
> Thanks for this description!
> I tested on a dual core, and I expected what you are describing above but in
> fact I observed following:
> 
>  rpmsg_ns_register_device()
>       |
>  rpmsg_register_device()
>       |
>  rpmsg_ns_probe()
>       |
>  rpmsg_create_ept()
>       |
>  virtio_device_ready()
>       |
>  remote sends NS announcement
>  rpmsg_ns_cb()
> 
> Here is the associated call stack generated in rpmsg_ns_probe using "warn_on"
> 
> [   11.498678] CPU: 1 PID: 348 Comm: systemd-udevd Not tainted 5.10.0-rc2 #54
> [   11.504106] Hardware name: STM32 (Device Tree Support)
> [   11.509271] [<c011062c>] (unwind_backtrace) from [<c010c528>]
> (show_stack+0x10/0x14)
> [   11.516992] [<c010c528>] (show_stack) from [<c0ad1360>] (dump_stack+0xb8/0xcc)
> [   11.524204] [<c0ad1360>] (dump_stack) from [<c0120478>] (__warn+0xd8/0xf0)
> [   11.531066] [<c0120478>] (__warn) from [<c0acd2a0>] (warn_slowpath_fmt+0x64/0xc4)
> [   11.538547] [<c0acd2a0>] (warn_slowpath_fmt) from [<bf01505c>]
> (rpmsg_ns_probe+0x5c/0xe0 [rpmsg_ns])
> [   11.547681] [<bf01505c>] (rpmsg_ns_probe [rpmsg_ns]) from [<bf0005cc>]
> (rpmsg_dev_probe+0x14c/0x1b0 [rpmsg_core])
> [   11.557933] [<bf0005cc>] (rpmsg_dev_probe [rpmsg_core]) from [<c067ae44>]
> (really_probe+0x208/0x4f0)
> [   11.567050] [<c067ae44>] (really_probe) from [<c067b2f4>]
> (driver_probe_device+0x78/0x16c)
> [   11.575305] [<c067b2f4>] (driver_probe_device) from [<c0678e44>]
> (bus_for_each_drv+0x84/0xd0)
> [   11.583822] [<c0678e44>] (bus_for_each_drv) from [<c067ab9c>]
> (__device_attach+0xf0/0x188)
> [   11.592075] [<c067ab9c>] (__device_attach) from [<c0679c0c>]
> (bus_probe_device+0x84/0x8c)
> [   11.600248] [<c0679c0c>] (bus_probe_device) from [<c0676194>]
> (device_add+0x3b0/0x7b0)
> [   11.608165] [<c0676194>] (device_add) from [<bf0003dc>]
> (rpmsg_register_device+0x54/0x88 [rpmsg_core])
> [   11.617486] [<bf0003dc>] (rpmsg_register_device [rpmsg_core]) from
> [<bf00ab84>] (rpmsg_probe+0x2c4/0x3f4 [virtio_rpmsg_bus])
> [   11.628696] [<bf00ab84>] (rpmsg_probe [virtio_rpmsg_bus]) from [<c05cb748>]
> (virtio_dev_probe+0x1f4/0x2c4)
> [   11.638352] [<c05cb748>] (virtio_dev_probe) from [<c067ae44>]
> (really_probe+0x208/0x4f0)
> [   11.646406] [<c067ae44>] (really_probe) from [<c067b2f4>]
> (driver_probe_device+0x78/0x16c)
> [   11.654658] [<c067b2f4>] (driver_probe_device) from [<c067b648>]
> (device_driver_attach+0x58/0x60)
> [   11.663522] [<c067b648>] (device_driver_attach) from [<c067b704>]
> (__driver_attach+0xb4/0x154)
> [   11.672134] [<c067b704>] (__driver_attach) from [<c0678d64>]
> (bus_for_each_dev+0x78/0xc0)
> [   11.680300] [<c0678d64>] (bus_for_each_dev) from [<c0679ebc>]
> (bus_add_driver+0x170/0x20c)
> [   11.688599] [<c0679ebc>] (bus_add_driver) from [<c067c22c>]
> (driver_register+0x74/0x108)
> [   11.696662] [<c067c22c>] (driver_register) from [<bf01006c>]
> (rpmsg_init+0x6c/0x1000 [virtio_rpmsg_bus])
> [   11.706136] [<bf01006c>] (rpmsg_init [virtio_rpmsg_bus]) from [<c0102090>]
> (do_one_initcall+0x58/0x2bc)
> [   11.713616] usb33: supplied by vdd_usb
> [   11.715500] [<c0102090>] (do_one_initcall) from [<c01b6608>]
> (do_init_module+0x60/0x248)
> [   11.715525] [<c01b6608>] (do_init_module) from [<c01b86fc>]
> (load_module+0x12e8/0x1638)
> [   11.715546] [<c01b86fc>] (load_module) from [<c01b8cd4>]
> (sys_finit_module+0xd4/0x130)
> [   11.715575] [<c01b8cd4>] (sys_finit_module) from [<c0100060>]
> (ret_fast_syscall+0x0/0x54)
> 
> Having said that, does this guarantee the probe, a good question!
> Maybe you or Mathieu have the answer, not me...

I did a lot of probing, went deep in the bowels of the user mode helper
subsystem and looked at sys_load_module().  Especially at do_init_module() where
function do_one_initcall()[1] is called on mod->init, which happens to be
rpmsg_ns_init() where the name space driver is registered.  I am confident we
can rely on this mechanism.

More comments below...

[1]. https://elixir.bootlin.com/linux/v5.10-rc3/source/kernel/module.c#L3604

> So if we can't conclude, adding completion would be OK for me.
> 
> Thanks,
> Arnaud
> 
> > 
> > Thanks
> > Guennadi
> > 
> >>>> Why can it not be called in rpmsg_ns_probe()? The only purpose of this completion 
> >>>> is to make sure that rpmsg_create_ept() for the NS endpoint has completed before 
> >>>> we begin communicating with the remote / host, e.g. by calling 
> >>>> virtio_device_ready() in case of the VirtIO backend, right?
> >>>
> >>> How the module driver are probed during device registration is not cristal clear
> >>> for me here...
> >>> Your approach looks to me a good compromize, I definitively need to apply and
> >>> test you patch to well understood the associated scheduling...
> >>
> >> I looked in code, trying to understand behavior on device registration.
> >>
> >> my understanding is: if driver is already registered (basic built-in or module
> >> previously loaded) the driver is probed on device registration. No asynchronous
> >> probing through a work queue or other.
> >>
> >> So it seems, (but i'm not enough expert to be 100% sure) that ensuring that the
> >> rmpsg_ns module is loaded (and so driver registered) before the device register
> >> is enough, no completion mechanism is needed here.
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>
> >>> Thanks,
> >>> Arnaud
> >>>
> >>>>
> >>>> Thanks
> >>>> Guennadi
> >>>>
> >>>>> Thanks,
> >>>>> Arnaud
> >>>>>
> >>
> >> [...]
> >>
> >> From 2629298ef1b7eea7a3a7df245abba03914c09e6b Mon Sep 17 00:00:00 2001
> >> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >> Date: Mon, 16 Nov 2020 15:07:14 +0100
> >> Subject: [PATCH] rpmsg: specify dependency between virtio rpmsg and virtio_ns
> >>
> >> The rpmsg_ns service has to be registered before the first
> >> message reception. When used as module, this imply and
> >> dependency of the rpmsg virtio on the rpmsg_ns module.
> >> this patch solve the dependency issue.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >> ---
> >>  drivers/rpmsg/Kconfig            |  1 +
> >>  drivers/rpmsg/rpmsg_ns.c         |  2 +-
> >>  drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
> >>  3 files changed, 24 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> >> index c3fc75e6514b..1394114782d2 100644
> >> --- a/drivers/rpmsg/Kconfig
> >> +++ b/drivers/rpmsg/Kconfig
> >> @@ -71,5 +71,6 @@ config RPMSG_VIRTIO
> >>  	depends on HAS_DMA
> >>  	select RPMSG
> >>  	select VIRTIO
> >> +	select RPMSG_NS
> >>
> >>  endmenu
> >> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> >> index 5bda7cb44618..f19f3cbd2526 100644
> >> --- a/drivers/rpmsg/rpmsg_ns.c
> >> +++ b/drivers/rpmsg/rpmsg_ns.c
> >> @@ -104,5 +104,5 @@ module_exit(rpmsg_ns_exit);
> >>
> >>  MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
> >>  MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> >> -MODULE_ALIAS("rpmsg_ns");
> >> +MODULE_ALIAS("rpmsg:rpmsg_ns");
> >>  MODULE_LICENSE("GPL v2");
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> index 338f16c6563d..f032e6c3f9a9 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -1001,6 +1001,28 @@ static int __init rpmsg_init(void)
> >>  {
> >>  	int ret;
> >>
> >> +#ifdef MODULE
> >> +	static const char name[] = "rpmsg_ns";
> >> +	struct module *ns;
> >> +
> >> +	/*
> >> +	 * Make sur that the rpmsg ns module is loaded in case of module.
> >> +	 * This ensures that the rpmsg_ns driver is probed immediately when the
> >> +	 * associated device is registered during the rpmsg virtio probe.
> >> +	 */
> >> +	mutex_lock(&module_mutex);
> >> +	ns = find_module(name);
> >> +	mutex_unlock(&module_mutex);
> >> +
> >> +	if (!ns) {
> >> +		ret = request_module(name);
> >> +		if (ret) {
> >> +			pr_err("can not find %s module (err %d)\n", name, ret);
> >> +			return ret;
> >> +		}
> >> +	}
> >> +#endif

We came up with almost exactly the same thing:

diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index 5bda7cb44618..ab86b603c54e 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -81,6 +81,7 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
 
 static struct rpmsg_driver rpmsg_ns_driver = {
        .drv.name = "rpmsg_ns",
+       .drv.mod_name = "rpmsg_ns",
        .probe = rpmsg_ns_probe,
 };
 
@@ -104,5 +105,5 @@ module_exit(rpmsg_ns_exit);
 
 MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
 MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
-MODULE_ALIAS("rpmsg_ns");
+MODULE_ALIAS("rpmsg:rpmsg_ns");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
index e267dd5f909b..28251fd1b2e0 100644
--- a/include/linux/rpmsg/ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -3,6 +3,7 @@
 #ifndef _LINUX_RPMSG_NS_H
 #define _LINUX_RPMSG_NS_H
 
+#include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
@@ -49,11 +50,27 @@ enum rpmsg_ns_flags {
  */
 static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
 {
+       int ret;
+       struct module *rpmsg_ns;
+       const char name[] = "rpmsg_ns";
+
        strcpy(rpdev->id.name, "rpmsg_ns");
        rpdev->driver_override = "rpmsg_ns";
        rpdev->src = RPMSG_NS_ADDR;
        rpdev->dst = RPMSG_NS_ADDR;
 
+#ifdef CONFIG_MODULES
+       mutex_lock(&module_mutex);
+       rpmsg_ns = find_module(name);
+       mutex_unlock(&module_mutex);
+
+       if (!rpmsg_ns) {
+               ret = request_module(name);
+               if (ret)
+                       pr_err("Can not find module %s (err %d)\n", name, ret);
+       }
+#endif
+

I think it is better to be in rpmsg_ns_register_devices() because it makes the
solution stand by itself, i.e no need to call the registration code from another
driver.  Everything is self contained.

Also note the drv.mod_name = "rpmsg_ns" part.  I took a look at find_module()
and that is what is supposed to be used.

That works on my side - please test on your setup.  

> >> +
> >>  	ret = register_virtio_driver(&virtio_ipc_driver);
> >>  	if (ret)
> >>  		pr_err("failed to register virtio driver: %d\n", ret);
> >> -- 
> >> 2.17.1
