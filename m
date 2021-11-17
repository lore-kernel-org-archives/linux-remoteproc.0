Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFC3C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 17:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61C9060FED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 17:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239791AbhKQSAn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Nov 2021 13:00:43 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:46792 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239770AbhKQSAn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Nov 2021 13:00:43 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AHE9Jup025138;
        Wed, 17 Nov 2021 18:57:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4HIUPeHNHnT2ABWApLlxzCPqPmI2sh9D1w9nWA/LeDA=;
 b=lHkfaEE66Rg2UOcBB3K79s4XEBg61gOSQYK4xuk1Y7zBRtztfptRbWGy9T7UTZuo96uQ
 qBHGIdE9PGvYkoKnPp9BJ2ruFUmPlX6W4yM/w7WUU+5fXKA2GLtBWs7s7PiglwDr3Dbr
 hEi3aKHjT3ebFybTEse8eFxsRIPkBGKfe1VPy/hkBHBLChZNHRkDBwzQBNnsei1ZomGw
 NuV5Tw6Stzo8ZUq8R9A0zPHgq75TA4VouyChQ9YEKaLWPe7wi/g+/XB1uTuDDsaKYx5r
 8D67lhdrMuvU/RuvQXDZrEdk+ZpcomHHwy/emut9FKTVJApRnzVbz0aOoCYmCfWcXDkt +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ccxypk0t6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Nov 2021 18:57:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B84510002A;
        Wed, 17 Nov 2021 18:57:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42EA32C41F2;
        Wed, 17 Nov 2021 18:57:40 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 17 Nov
 2021 18:57:39 +0100
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: Re: [RFC PATCH v2 1/1] rpmsg: add syslog driver
To:     Christian Gmeiner <christian.gmeiner@gmail.com>
CC:     LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211109083926.32052-1-christian.gmeiner@gmail.com>
 <20211109083926.32052-2-christian.gmeiner@gmail.com>
 <YYq4tjyv0qh+Zpqe@ripper> <30de037d-3acd-8e9d-979c-b3d0c1c84002@foss.st.com>
 <CAH9NwWdy9WsaXW+XE06=yA9pGXGs_Ye6kRiNPMfM5D=Jd1rSGg@mail.gmail.com>
Message-ID: <90704c5c-75fa-8eb1-ef2c-19073a5a8ac9@foss.st.com>
Date:   Wed, 17 Nov 2021 18:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAH9NwWdy9WsaXW+XE06=yA9pGXGs_Ye6kRiNPMfM5D=Jd1rSGg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_06,2021-11-17_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Christian,

On 11/11/21 11:29 AM, Christian Gmeiner wrote:
> Hi Arnaud
> 
>>
>> On 11/9/21 7:06 PM, Bjorn Andersson wrote:
>>> On Tue 09 Nov 00:39 PST 2021, Christian Gmeiner wrote:
>>>
>>>> Allows the remote firmware to log into syslog.
>>>>
>>
>> For you information a similar patch has been sent few years ago:
>> https://www.spinics.net/lists/kernel/msg3045824.html
>>
> 
> Interesting - do you know why the patch was not taken?

I don't know. It might be worthwhile to contact Xiang Xiao for more details.

> 
>> The suspend /resume mechanism seems interesting to manage the low power use case.
>>
> 
> Yeah .. nothing I thought about.
> 
>>>
>>> This allows the remote firmware to print log messages in the kernel log,
>>> not the syslog (although your system might inject the kernel log into
>>> the syslog as well)
>>>
>>>> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>>>> ---
>>>>  drivers/rpmsg/Kconfig        |  8 +++++
>>>>  drivers/rpmsg/Makefile       |  1 +
>>>>  drivers/rpmsg/rpmsg_syslog.c | 65 ++++++++++++++++++++++++++++++++++++
>>>
>>> drivers/rpmsg is for rpmsg bus and transport drivers. Client drivers
>>> should live elsewhere.
>>>
>>> But perhaps, rather than having a driver for this, you could simply use
>>> rpmsg_char and a userspace tool; if you want to get the remote processor
>>> logs into syslog, instead of the kernel log?
>>
>> This is also a question that comes to me while looking at the patch.
>> rpmsg_tty service (if available in 5.16) could be another alternative.
>>
> 
> I thought about it too but I do not see how the syslog/journald can read the log
> messages from this tty device without an extra user space component.
> 
> With a syslog redirection rpmsg service this happens automatically without any
> extra user space daemon that reads from tty and writes to syslog.
> 
> Maybe I am missing something.

That's true, this is one constraint. I suppose that you already have user code
to start the remoteproc. In this case it could also launch a deamon which could
redirects and/or perhaps analyzes traces to detect errors...

That said it is my point of view, working on a general purpose platform
(stm32mp15), I guess other people have other feedbacks.

A last question: Do you manage the traces enable/disable and trace level during
runtime?

Regards,
Arnaud

> 
>> Regards,
>> Arnaud
>>
>>>
>>>>  3 files changed, 74 insertions(+)
>>>>  create mode 100644 drivers/rpmsg/rpmsg_syslog.c
>>>>
>>>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>>>> index 0b4407abdf13..801f9956ec21 100644
>>>> --- a/drivers/rpmsg/Kconfig
>>>> +++ b/drivers/rpmsg/Kconfig
>>>> @@ -73,4 +73,12 @@ config RPMSG_VIRTIO
>>>>      select RPMSG_NS
>>>>      select VIRTIO
>>>>
>>>> +config RPMSG_SYSLOG
>>>> +    tristate "SYSLOG device interface"
>>>> +    depends on RPMSG
>>>> +    help
>>>> +      Say Y here to export rpmsg endpoints as device files, usually found
>>>> +      in /dev. They make it possible for user-space programs to send and
>>>> +      receive rpmsg packets.
>>>> +
>>>>  endmenu
>>>> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
>>>> index 8d452656f0ee..75b2ec7133a5 100644
>>>> --- a/drivers/rpmsg/Makefile
>>>> +++ b/drivers/rpmsg/Makefile
>>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
>>>>  obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
>>>>  obj-$(CONFIG_RPMSG_QCOM_SMD)        += qcom_smd.o
>>>>  obj-$(CONFIG_RPMSG_VIRTIO)  += virtio_rpmsg_bus.o
>>>> +obj-$(CONFIG_RPMSG_SYSLOG)  += rpmsg_syslog.o
>>>> diff --git a/drivers/rpmsg/rpmsg_syslog.c b/drivers/rpmsg/rpmsg_syslog.c
>>>> new file mode 100644
>>>> index 000000000000..b3fdae495fd9
>>>> --- /dev/null
>>>> +++ b/drivers/rpmsg/rpmsg_syslog.c
>>>> @@ -0,0 +1,65 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/rpmsg.h>
>>>> +
>>>> +static int rpmsg_syslog_cb(struct rpmsg_device *rpdev, void *data, int len,
>>>> +                       void *priv, u32 src)
>>>> +{
>>>> +    const char *buffer = data;
>>>> +
>>>> +    switch (buffer[0]) {
>>>> +    case 'e':
>>>> +            dev_err(&rpdev->dev, "%s", buffer + 1);
>>>> +            break;
>>>> +    case 'w':
>>>> +            dev_warn(&rpdev->dev, "%s", buffer + 1);
>>>> +            break;
>>>> +    case 'i':
>>>> +            dev_info(&rpdev->dev, "%s", buffer + 1);
>>>> +            break;
>>>> +    default:
>>>> +            dev_info(&rpdev->dev, "%s", buffer);
>>>> +            break;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
>>>> +{
>>>> +    struct rpmsg_endpoint *syslog_ept;
>>>> +    struct rpmsg_channel_info syslog_chinfo = {
>>>> +            .src = 42,
>>>> +            .dst = 42,
>>>> +            .name = "syslog",
>>>> +    };
>>>> +
>>>> +    /*
>>>> +     * Create the syslog service endpoint associated to the RPMsg
>>>> +     * device. The endpoint will be automatically destroyed when the RPMsg
>>>> +     * device will be deleted.
>>>> +     */
>>>> +    syslog_ept = rpmsg_create_ept(rpdev, rpmsg_syslog_cb, NULL, syslog_chinfo);
>>>
>>> The rpmsg_device_id below should cause the device to probe on the
>>> presence of a "syslog" channel announcement, so why are you creating a
>>> new endpoint with the same here?
>>>
>>> Why aren't you just specifying the callback of the driver?
>>>
>>>> +    if (!syslog_ept) {
>>>> +            dev_err(&rpdev->dev, "failed to create the syslog ept\n");
>>>> +            return -ENOMEM;
>>>> +    }
>>>> +    rpdev->ept = syslog_ept;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static struct rpmsg_device_id rpmsg_driver_syslog_id_table[] = {
>>>> +    { .name = "syslog" },
>>>> +    { },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_syslog_id_table);
>>>> +
>>>> +static struct rpmsg_driver rpmsg_syslog_client = {
>>>> +    .drv.name       = KBUILD_MODNAME,
>>>> +    .id_table       = rpmsg_driver_syslog_id_table,
>>>> +    .probe          = rpmsg_syslog_probe,
>>>> +};
>>>> +module_rpmsg_driver(rpmsg_syslog_client);
>>>
>>> I would expect that building this as a module gives you complaints about
>>> lacking MODULE_LICENSE().
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> --
>>>> 2.33.1
>>>>
> 
> 
> 
