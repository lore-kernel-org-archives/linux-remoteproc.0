Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCBCC2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 11:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 258C9223AB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 11:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="BH4bx7ka"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgKQLmj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 06:42:39 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:6138 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728063AbgKQLmj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 06:42:39 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AHBajvG013666;
        Tue, 17 Nov 2020 12:42:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=/O21ehixegwzLT0zbXiZEy0jXqK7hVnX6K1d1Ah0oZI=;
 b=BH4bx7kak76C6vcGBJ598wgINY2u2Co8Q1500+ZHehW0A/lqVdQPiq1ozCx1uNoh30Il
 vDSw55w6nr0gejuipthMatVRPlB7ic3Sk8cRyDv8vjn6UeMJrEJjkBq9sIeQUFTi9A9h
 YjSafTBBivfOSHKoTQs60kDkaH+vGfmi+8oqH4wo4kwrawt8/I13gPuqR1D886tWaU99
 4T6gNurWEQI/9hV/DLK41NlKSP+PO5xAaA3m2tRnLhiEuIOos6myXmZZ9ENig7ghqVHg
 XKWn34vrKnmyXGZmN6Io24O5ARMvVi1YzFLloDcqQxVwuGNJ6zC1sv59xRAorpwEYwZH pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34t58chbye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Nov 2020 12:42:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF579100034;
        Tue, 17 Nov 2020 12:42:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE17B247725;
        Tue, 17 Nov 2020 12:42:31 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 12:42:31 +0100
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201109102023.GA17692@ubuntu> <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com> <20201111144942.GA6403@ubuntu>
 <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com> <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com> <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
 <20201116224003.GC3892875@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <50549519-d9ff-9048-a3d8-dab02bfda096@st.com>
Date:   Tue, 17 Nov 2020 12:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116224003.GC3892875@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-17_03:2020-11-17,2020-11-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 11/16/20 11:40 PM, Mathieu Poirier wrote:
> On Mon, Nov 16, 2020 at 04:51:52PM +0100, Arnaud POULIQUEN wrote:
>> Hi Guennadi,
>>
>> On 11/16/20 4:10 PM, Guennadi Liakhovetski wrote:

[snip]

> I did a lot of probing, went deep in the bowels of the user mode helper
> subsystem and looked at sys_load_module().  Especially at do_init_module() where
> function do_one_initcall()[1] is called on mod->init, which happens to be
> rpmsg_ns_init() where the name space driver is registered.  I am confident we
> can rely on this mechanism.
> 
> More comments below...
> 
> [1]. https://elixir.bootlin.com/linux/v5.10-rc3/source/kernel/module.c#L3604
> 
>> So if we can't conclude, adding completion would be OK for me.
>>
>> Thanks,
>> Arnaud
>>

[snip]

> 
> We came up with almost exactly the same thing:>
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index 5bda7cb44618..ab86b603c54e 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -81,6 +81,7 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>  
>  static struct rpmsg_driver rpmsg_ns_driver = {
>         .drv.name = "rpmsg_ns",
> +       .drv.mod_name = "rpmsg_ns",

This does not work for me, in built-in the kernel freezes on start
i just have the " Starting kernel ..." print

Are you sure that is useful? it working for me without this.

>         .probe = rpmsg_ns_probe,
>  };
>  
> @@ -104,5 +105,5 @@ module_exit(rpmsg_ns_exit);
>  
>  MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
>  MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> -MODULE_ALIAS("rpmsg_ns");
> +MODULE_ALIAS("rpmsg:rpmsg_ns");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
> index e267dd5f909b..28251fd1b2e0 100644
> --- a/include/linux/rpmsg/ns.h
> +++ b/include/linux/rpmsg/ns.h
> @@ -3,6 +3,7 @@
>  #ifndef _LINUX_RPMSG_NS_H
>  #define _LINUX_RPMSG_NS_H
>  
> +#include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/rpmsg.h>
>  #include <linux/rpmsg/byteorder.h>
> @@ -49,11 +50,27 @@ enum rpmsg_ns_flags {
>   */
>  static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
Agree with the Guennadi's pertinent remarks, better to put this in rpmsg_ns.c

>  {
> +       int ret;
> +       struct module *rpmsg_ns;
> +       const char name[] = "rpmsg_ns";
> +
>         strcpy(rpdev->id.name, "rpmsg_ns");
>         rpdev->driver_override = "rpmsg_ns";
>         rpdev->src = RPMSG_NS_ADDR;
>         rpdev->dst = RPMSG_NS_ADDR;
>  
> +#ifdef CONFIG_MODULES

This piece of code is executed also if rppmsg_ns is built-in

> +       mutex_lock(&module_mutex);
> +       rpmsg_ns = find_module(name);
> +       mutex_unlock(&module_mutex);
> +
> +       if (!rpmsg_ns) {
> +               ret = request_module(name);
> +               if (ret)
> +                       pr_err("Can not find module %s (err %d)\n", name, ret);

As consequence for built-in this error is printed.
To avoid this
- #ifdef CONFIG_MODULES
+ #ifdef MODULES

Then for me here we should return the error.

> +       }
> +#endif
> +
> 
> I think it is better to be in rpmsg_ns_register_devices() because it makes the
> solution stand by itself, i.e no need to call the registration code from another
> driver.  Everything is self contained.

That's a very good idea!

In addition I would keep dependency between virtio and rpmsg_ns in kconfig. This
would ensure that rpmsg ns is built for the virtio bus. Then the device will be
probed on demand.

> 
> Also note the drv.mod_name = "rpmsg_ns" part.  I took a look at find_module()
> and that is what is supposed to be used.
> 
> That works on my side - please test on your setup.  

Please find update of your patch integrating my remarks:
- suppress drv.mod_name,
- migrate rpmsg_ns_register_device in rpmsg_ns.c,
- use KBUILD_MODNAME for the module name,
- add select RPMSG_NS for RPMSG_VIRTIO config.

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index c3fc75e6514b..1394114782d2 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -71,5 +71,6 @@ config RPMSG_VIRTIO
 	depends on HAS_DMA
 	select RPMSG
 	select VIRTIO
+	select RPMSG_NS

 endmenu
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index 5bda7cb44618..80c2cc23bada 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -55,6 +55,39 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void
*data, int len,
 	return 0;
 }

+/**
+ * rpmsg_ns_register_device() - register name service device based on rpdev
+ * @rpdev: prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * basis for the rpmsg name service device.
+ */
+int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
+{
+#ifdef MODULES
+	int ret;
+	struct module *rpmsg_ns;
+
+	mutex_lock(&module_mutex);
+	rpmsg_ns = find_module(KBUILD_MODNAME);
+	mutex_unlock(&module_mutex);
+
+	if (!rpmsg_ns) {
+		ret = request_module(KBUILD_MODNAME);
+	if (ret)
+		pr_err("Can not find module %s (err %d)\n", KBUILD_MODNAME, ret);
+	}
+#endif
+
+	strcpy(rpdev->id.name, KBUILD_MODNAME);
+	rpdev->driver_override = KBUILD_MODNAME;
+	rpdev->src = RPMSG_NS_ADDR;
+	rpdev->dst = RPMSG_NS_ADDR;
+
+	return rpmsg_register_device(rpdev);
+}
+EXPORT_SYMBOL(rpmsg_ns_register_device);
+
 static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_endpoint *ns_ept;
@@ -80,7 +113,7 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
 }

 static struct rpmsg_driver rpmsg_ns_driver = {
-	.drv.name = "rpmsg_ns",
+	.drv.name = KBUILD_MODNAME,
 	.probe = rpmsg_ns_probe,
 };

@@ -104,5 +137,5 @@ module_exit(rpmsg_ns_exit);

 MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
 MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
-MODULE_ALIAS("rpmsg_ns");
+MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
index bdc1ea278814..68eac2b42075 100644
--- a/include/linux/rpmsg/ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -41,21 +41,6 @@ enum rpmsg_ns_flags {
 /* Address 53 is reserved for advertising remote services */
 #define RPMSG_NS_ADDR			(53)

-/**
- * rpmsg_ns_register_device() - register name service device based on rpdev
- * @rpdev: prepared rpdev to be used for creating endpoints
- *
- * This function wraps rpmsg_register_device() preparing the rpdev for use as
- * basis for the rpmsg name service device.
- */
-static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
-{
-	strcpy(rpdev->id.name, "rpmsg_ns");
-	rpdev->driver_override = "rpmsg_ns";
-	rpdev->src = RPMSG_NS_ADDR;
-	rpdev->dst = RPMSG_NS_ADDR;
-
-	return rpmsg_register_device(rpdev);
-}
+int rpmsg_ns_register_device(struct rpmsg_device *rpdev);

 #endif

Regards,
Arnaud

