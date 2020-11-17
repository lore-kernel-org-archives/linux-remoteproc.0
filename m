Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682E9C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 16:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDE502220B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 16:44:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="txKTnx/g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgKQQoN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 11:44:13 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57112 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727010AbgKQQoN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 11:44:13 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AHGLdbS011324;
        Tue, 17 Nov 2020 17:44:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=gOq8PtsLPl8YcQWlI24WYrhhhkl3V8mDV43l6Fi6+4A=;
 b=txKTnx/gC3wOu0FfqhLo0//opUonK0mem30dBKDvihXJ1+Khhs56A0GlEIthIFSTxt4F
 JDhrNmNOJdcHBV9ibpbUu5iEvAr0yaGkHPjsBVUb+KyGFje3Ar6nlTcUJfmCVyKgVIqA
 4W2LRQ8a/vvbyUOWSHApoaDqmvOnzpk2dKjuJDR/BoiCH/tDUc+KVZPaSzr2vg/pPQNF
 LudocrTE6IG75W9fOUJvwphi+hTox6l7Vl312ccEgrbVTBD3p86ty5vEFyikrFgqlecD
 KyJFxFMs1Mp0X1RA62Aj9GvDZ8mwwPukRL6yLPAvINODIIE8WapNQAkwSD6jHXnQNNrU QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34t70gjndt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Nov 2020 17:44:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBFBB100034;
        Tue, 17 Nov 2020 17:44:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D97A8215D13;
        Tue, 17 Nov 2020 17:44:06 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 17:44:05 +0100
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
 <20201111144942.GA6403@ubuntu> <c31b8427-baca-5c77-6420-b592c57a3a7b@st.com>
 <20201112115115.GA11069@ubuntu> <945f377d-1975-552d-25b2-1dc25d3c3a46@st.com>
 <2d25d1aa-bd8a-f0db-7888-9f72edc9f687@st.com> <20201116151028.GA1519@ubuntu>
 <e5e49e1a-dc2a-ce16-425c-d2d87f415868@st.com>
 <20201116224003.GC3892875@xps15>
 <50549519-d9ff-9048-a3d8-dab02bfda096@st.com> <20201117160330.GA15538@ubuntu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <a653c503-7fd1-7b87-88a5-88c9002ba410@st.com>
Date:   Tue, 17 Nov 2020 17:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117160330.GA15538@ubuntu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-17_06:2020-11-17,2020-11-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/17/20 5:03 PM, Guennadi Liakhovetski wrote:
> On Tue, Nov 17, 2020 at 12:42:30PM +0100, Arnaud POULIQUEN wrote:
> 
> [snip]
> 
>> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
>> index 5bda7cb44618..80c2cc23bada 100644
>> --- a/drivers/rpmsg/rpmsg_ns.c
>> +++ b/drivers/rpmsg/rpmsg_ns.c
>> @@ -55,6 +55,39 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void
>> *data, int len,
>>  	return 0;
>>  }
>>
>> +/**
>> + * rpmsg_ns_register_device() - register name service device based on rpdev
>> + * @rpdev: prepared rpdev to be used for creating endpoints
>> + *
>> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
>> + * basis for the rpmsg name service device.
>> + */
>> +int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
>> +{
>> +#ifdef MODULES
>> +	int ret;
>> +	struct module *rpmsg_ns;
>> +
>> +	mutex_lock(&module_mutex);
>> +	rpmsg_ns = find_module(KBUILD_MODNAME);
>> +	mutex_unlock(&module_mutex);
>> +
>> +	if (!rpmsg_ns) {
>> +		ret = request_module(KBUILD_MODNAME);
> 
> Is this code requesting the module in which it is located?.. I must be missing 
> something...

Right this is stupid...Thanks to highlight this!

That being said, your remark is very interesting: we need to load the module to
access to this function. This means that calling this function ensures that the
module is loaded. In this case no need to add the piece of code to find
module... here is the call stack associated (associated patch is available below):


(rpmsg_ns_probe+0x5c/0xe0 [rpmsg_ns])
[   11.858748] [<bf00a0a0>] (rpmsg_ns_probe [rpmsg_ns]) from [<bf0005cc>]
(rpmsg_dev_probe+0x14c/0x1b0 [rpmsg_core])
[   11.869047] [<bf0005cc>] (rpmsg_dev_probe [rpmsg_core]) from [<c067cd44>]
(really_probe+0x208/0x4f0)
[   11.878117] [<c067cd44>] (really_probe) from [<c067d1f4>]
(driver_probe_device+0x78/0x16c)
[   11.886404] [<c067d1f4>] (driver_probe_device) from [<c067ad48>]
(bus_for_each_drv+0x84/0xd0)
[   11.894887] [<c067ad48>] (bus_for_each_drv) from [<c067ca9c>]
(__device_attach+0xf0/0x188)
[   11.903142] [<c067ca9c>] (__device_attach) from [<c067bb10>]
(bus_probe_device+0x84/0x8c)
[   11.911314] [<c067bb10>] (bus_probe_device) from [<c0678094>]
(device_add+0x3b0/0x7b0)
[   11.919227] [<c0678094>] (device_add) from [<bf0003dc>]
(rpmsg_register_device+0x54/0x88 [rpmsg_core])
[   11.928541] [<bf0003dc>] (rpmsg_register_device [rpmsg_core]) from
[<bf011b58>] (rpmsg_probe+0x298/0x3c8 [virtio_rpmsg_bus])
[   11.939748] [<bf011b58>] (rpmsg_probe [virtio_rpmsg_bus]) from [<c05cd648>]
(virtio_dev_probe+0x1f4/0x2c4)
[   11.949377] [<c05cd648>] (virtio_dev_probe) from [<c067cd44>]
(really_probe+0x208/0x4f0)
[   11.957454] [<c067cd44>] (really_probe) from [<c067d1f4>]
(driver_probe_device+0x78/0x16c)
[   11.965710] [<c067d1f4>] (driver_probe_device) from [<c067d548>]
(device_driver_attach+0x58/0x60)
[   11.974574] [<c067d548>] (device_driver_attach) from [<c067d604>]
(__driver_attach+0xb4/0x154)
[   11.983177] [<c067d604>] (__driver_attach) from [<c067ac68>]
(bus_for_each_dev+0x78/0xc0)
[   11.991344] [<c067ac68>] (bus_for_each_dev) from [<c067bdc0>]
(bus_add_driver+0x170/0x20c)
[   11.999600] [<c067bdc0>] (bus_add_driver) from [<c067e12c>]
(driver_register+0x74/0x108)
[   12.007693] [<c067e12c>] (driver_register) from [<bf017010>]
(rpmsg_init+0x10/0x1000 [virtio_rpmsg_bus])
[   12.017168] [<bf017010>] (rpmsg_init [virtio_rpmsg_bus]) from [<c0102090>]
(do_one_initcall+0x58/0x2bc)
[

This would make the patch very simple. I tested following patch on my platform,
applying it, i do not reproduce the initial issue.


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
index 5bda7cb44618..5867281188de 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -55,6 +55,24 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void
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
@@ -80,7 +98,7 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
 }

 static struct rpmsg_driver rpmsg_ns_driver = {
-	.drv.name = "rpmsg_ns",
+	.drv.name = KBUILD_MODNAME,
 	.probe = rpmsg_ns_probe,
 };

@@ -104,5 +122,5 @@ module_exit(rpmsg_ns_exit);

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

Thanks,
Arnaud

> 
> Thanks
> Guennadi
> 
