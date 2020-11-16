Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65080C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 14:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D06932223D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 14:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="WObx4mD5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgKPOnq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 09:43:46 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:59639 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728041AbgKPOnp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 09:43:45 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AGEhNdZ030618;
        Mon, 16 Nov 2020 15:43:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=LwR4yrprsgW+QN0EePgfGiNlcC/O/EsLqdHupnfKvbQ=;
 b=WObx4mD5zsyyyowH1DTJjAxbCtMIOZ4rrtNk3agNqn+OMj+ABpsaxyobqFk+fhk7NlBv
 63JsJKlKYl4HHKP5PlrHESnsAso5vm5o0OO4F2ZpA8Mqa/Vp7zJhO0rNQmFLNgUOkXW+
 vSLC4StrcRFZE9qFw9SimfpOUJ4Spvje747IQi2NdTeky8DxwgawSKUjXrMTz/93X9KZ
 daHQfckCfvXNnE8vti+CE3OG9YUAnMjRNFpE9i8BLw9VSnBMTfwtMUc4j8s0lVJ5uwoM
 okulMH+RLxsbMH5cRA5TxC4RUo5oOmDXAVRQf3rhgLpzZQzFINcdoOng+FacEKyKArCA 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34t5k4uepn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Nov 2020 15:43:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0A3D10002A;
        Mon, 16 Nov 2020 15:43:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9044020D63C;
        Mon, 16 Nov 2020 15:43:36 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Nov
 2020 15:43:35 +0100
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu> <20201106140028.GB10889@ubuntu>
 <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com> <20201109102023.GA17692@ubuntu>
 <20201109175536.GD3395222@xps15>
 <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com> <20201111144942.GA6403@ubuntu>
 <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com> <20201112115115.GA11069@ubuntu>
 <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
Message-ID: <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com>
Date:   Mon, 16 Nov 2020 15:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-16_08:2020-11-13,2020-11-16 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Guennadi, Mathieu,

On 11/12/20 2:27 PM, Arnaud POULIQUEN wrote:
> 
> 
> On 11/12/20 12:51 PM, Guennadi Liakhovetski wrote:
>> Hi Arnaud,
>>
>> On Thu, Nov 12, 2020 at 11:17:54AM +0100, Arnaud POULIQUEN wrote:
>>> Hi Guennadi,
>>>
>>> On 11/11/20 3:49 PM, Guennadi Liakhovetski wrote:
>>>> Hi Arnaud,
>>
>> [snip]
>>
>>>> From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>>>> Subject: [PATCH] fixup! rpmsg: Turn name service into a stand alone driver
>>>>
>>>> Link ns.c with core.c together to guarantee immediate probing.
>>>>
>>>> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>>>> ---
>>>>  drivers/rpmsg/Makefile                        |  2 +-
>>>>  drivers/rpmsg/{rpmsg_core.c => core.c}        | 13 +++--
>>>>  drivers/rpmsg/{rpmsg_ns.c => ns.c}            | 49 ++++++++++++++-----
>>>>  drivers/rpmsg/virtio_rpmsg_bus.c              |  5 +-
>>>>  include/linux/rpmsg.h                         |  4 +-
>>>>  .../{rpmsg_byteorder.h => rpmsg/byteorder.h}  |  0
>>>>  include/linux/{rpmsg_ns.h => rpmsg/ns.h}      | 16 +++---
>>>>  7 files changed, 61 insertions(+), 28 deletions(-)
>>>>  rename drivers/rpmsg/{rpmsg_core.c => core.c} (99%)
>>>>  rename drivers/rpmsg/{rpmsg_ns.c => ns.c} (76%)
>>>>  rename include/linux/{rpmsg_byteorder.h => rpmsg/byteorder.h} (100%)
>>>>  rename include/linux/{rpmsg_ns.h => rpmsg/ns.h} (82%)
>>>>
>>>> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
>>>> index 8d452656f0ee..5aa79e167372 100644
>>>> --- a/drivers/rpmsg/Makefile
>>>> +++ b/drivers/rpmsg/Makefile
>>>> @@ -1,7 +1,7 @@
>>>>  # SPDX-License-Identifier: GPL-2.0
>>>> +rpmsg_core-objs			:= core.o ns.o
>>>>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>>>>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
>>>> -obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>>>>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>>>>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>>>>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
>>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/core.c
>>>> similarity index 99%
>>>> rename from drivers/rpmsg/rpmsg_core.c
>>>> rename to drivers/rpmsg/core.c
>>>> index 6381c1e00741..0c622cced804 100644
>>>> --- a/drivers/rpmsg/rpmsg_core.c
>>>> +++ b/drivers/rpmsg/core.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include <linux/kernel.h>
>>>>  #include <linux/module.h>
>>>>  #include <linux/rpmsg.h>
>>>> +#include <linux/rpmsg/ns.h>
>>>>  #include <linux/of_device.h>
>>>>  #include <linux/pm_domain.h>
>>>>  #include <linux/slab.h>
>>>> @@ -625,21 +626,27 @@ void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
>>>>  }
>>>>  EXPORT_SYMBOL(unregister_rpmsg_driver);
>>>>  
>>>> -
>>>>  static int __init rpmsg_init(void)
>>>>  {
>>>>  	int ret;
>>>>  
>>>>  	ret = bus_register(&rpmsg_bus);
>>>> -	if (ret)
>>>> +	if (ret) {
>>>>  		pr_err("failed to register rpmsg bus: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = rpmsg_ns_init();
>>>> +	if (ret)
>>>> +		bus_unregister(&rpmsg_bus);
>>>>  
>>>>  	return ret;
>>>>  }
>>>>  postcore_initcall(rpmsg_init);
>>>>  
>>>> -static void __exit rpmsg_fini(void)
>>>> +static void rpmsg_fini(void)
>>>>  {
>>>> +	rpmsg_ns_exit();
>>>>  	bus_unregister(&rpmsg_bus);
>>>>  }
>>>>  module_exit(rpmsg_fini);
>>>
>>> The drawback of this solution is that it makes the anoucement service ns
>>> mandatory, but it is optional because it depends on the RPMsg backend bus.
>>> RPMsg NS should be generic but optional.
>>> What about calling this in rpmsg_virtio?
>>
>> This just registers a driver. If the backend doesn't register a suitable 
>> device by calling rpmsg_ns_register_device(); nothing happens. But if 
>> you're concerned about wasted memory, we can make it conditional on a 
>> configuration option.
> I'm not worried about memory, but I'm trying to understand why this can't be
> done in the background rather than the kernel. Doing this in the kernel can be
> confusing enough to backend such as GLINK bus that does not use this service.
> 
> I saw also this alternative to keep module independent, but i did not test it yet.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L2274
> 

[...]
I tried the find_module API, it's quite simple and seems to work well. just need
to be protected by #ifdef MODULE

I also added a select RMPS_NS in the RPMSG_VIRTIO for compatibility with the legacy.

look to me that this patch is a simple fix that should work also for the vhost...
that said, the question is can we use this API here?

I attached the patch at the end of the mail.

>>
>> Why can it not be called in rpmsg_ns_probe()? The only purpose of this completion 
>> is to make sure that rpmsg_create_ept() for the NS endpoint has completed before 
>> we begin communicating with the remote / host, e.g. by calling 
>> virtio_device_ready() in case of the VirtIO backend, right?
> 
> How the module driver are probed during device registration is not cristal clear
> for me here...
> Your approach looks to me a good compromize, I definitively need to apply and
> test you patch to well understood the associated scheduling...

I looked in code, trying to understand behavior on device registration.

my understanding is: if driver is already registered (basic built-in or module
previously loaded) the driver is probed on device registration. No asynchronous
probing through a work queue or other.

So it seems, (but i'm not enough expert to be 100% sure) that ensuring that the
rmpsg_ns module is loaded (and so driver registered) before the device register
is enough, no completion mechanism is needed here.

Regards,
Arnaud

> 
> Thanks,
> Arnaud
> 
>>
>> Thanks
>> Guennadi
>>
>>> Thanks,
>>> Arnaud
>>>

[...]

From 2629298ef1b7eea7a3a7df245abba03914c09e6b Mon Sep 17 00:00:00 2001
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Date: Mon, 16 Nov 2020 15:07:14 +0100
Subject: [PATCH] rpmsg: specify dependency between virtio rpmsg and virtio_ns

The rpmsg_ns service has to be registered before the first
message reception. When used as module, this imply and
dependency of the rpmsg virtio on the rpmsg_ns module.
this patch solve the dependency issue.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/Kconfig            |  1 +
 drivers/rpmsg/rpmsg_ns.c         |  2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

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
index 5bda7cb44618..f19f3cbd2526 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -104,5 +104,5 @@ module_exit(rpmsg_ns_exit);

 MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
 MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
-MODULE_ALIAS("rpmsg_ns");
+MODULE_ALIAS("rpmsg:rpmsg_ns");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 338f16c6563d..f032e6c3f9a9 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1001,6 +1001,28 @@ static int __init rpmsg_init(void)
 {
 	int ret;

+#ifdef MODULE
+	static const char name[] = "rpmsg_ns";
+	struct module *ns;
+
+	/*
+	 * Make sur that the rpmsg ns module is loaded in case of module.
+	 * This ensures that the rpmsg_ns driver is probed immediately when the
+	 * associated device is registered during the rpmsg virtio probe.
+	 */
+	mutex_lock(&module_mutex);
+	ns = find_module(name);
+	mutex_unlock(&module_mutex);
+
+	if (!ns) {
+		ret = request_module(name);
+		if (ret) {
+			pr_err("can not find %s module (err %d)\n", name, ret);
+			return ret;
+		}
+	}
+#endif
+
 	ret = register_virtio_driver(&virtio_ipc_driver);
 	if (ret)
 		pr_err("failed to register virtio driver: %d\n", ret);
-- 
2.17.1
