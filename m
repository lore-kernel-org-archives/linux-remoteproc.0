Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B926C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C56861215
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbhJEQF2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Oct 2021 12:05:28 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36344 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231513AbhJEQF1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Oct 2021 12:05:27 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195EGJJW032013;
        Tue, 5 Oct 2021 18:03:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YjHDloZxbvDPHJwf58cAVSAR8Cs92EMjLLxMd5V2oaQ=;
 b=0Yv2X/2MRYzrU6mdr1doF3eHQOLg1OoCsVJMiQOc+cv930vAddQKp6Leg4lNWikI93bs
 HbMZzYnK5tLqGi6v3ahpdPN7ui64m3nAdSga8IJzLb3kyriN82BmeQr0OpxFCgFYt1+n
 +Ojf7aEOl/34GCi4lnya2oWZgWtikcJZgFpjHf3fs6QArVauL1amVJVQ4mUNdpYN2bv9
 pb2TzEjTJly1qfnHlmy8JB7CF9IG2kFEstAwbjmxycuUTSw64FLJNc3580Sn1B709aBM
 v2NiWkiOt6eq1P6BN78uZyfdJftj44I+2U/LoOtv68Xdc7iT0WoUDA9JwpGFZoCadx3L JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bgdt9v5bq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Oct 2021 18:03:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F51810002A;
        Tue,  5 Oct 2021 18:03:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14EF9231DEB;
        Tue,  5 Oct 2021 18:03:26 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct
 2021 18:03:25 +0200
Subject: Re: [PATCH v8 2/2] tty: add rpmsg driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>, Suman Anna <s-anna@ti.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-3-arnaud.pouliquen@foss.st.com>
 <YVxMKekWW0w0+qoM@kroah.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <4cfc7497-ac85-828b-0b2f-a212c5a0503c@foss.st.com>
Date:   Tue, 5 Oct 2021 18:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVxMKekWW0w0+qoM@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_02,2021-10-04_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Greg,

On 10/5/21 2:59 PM, Greg Kroah-Hartman wrote:
> On Thu, Sep 30, 2021 at 06:05:20PM +0200, Arnaud Pouliquen wrote:
>> This driver exposes a standard TTY interface on top of the rpmsg
>> framework through a rpmsg service.
>>
>> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
>> per rpmsg endpoint.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  Documentation/serial/tty_rpmsg.rst |  15 ++
>>  drivers/tty/Kconfig                |   9 +
>>  drivers/tty/Makefile               |   1 +
>>  drivers/tty/rpmsg_tty.c            | 275 +++++++++++++++++++++++++++++
>>  4 files changed, 300 insertions(+)
>>  create mode 100644 Documentation/serial/tty_rpmsg.rst
>>  create mode 100644 drivers/tty/rpmsg_tty.c
>>
>> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
>> new file mode 100644
>> index 000000000000..b055107866c9
>> --- /dev/null
>> +++ b/Documentation/serial/tty_rpmsg.rst
>> @@ -0,0 +1,15 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=========
>> +RPMsg TTY
>> +=========
>> +
>> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for
>> +user-space programs to send and receive rpmsg messages as a standard tty protocol.
>> +
>> +The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
>> +
>> +The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented.
>> +
>> +Information related to the RPMsg and associated tty device is available in
>> +/sys/bus/rpmsg/devices/.
> 
> 
> Why is this file needed?  Nothing references it, and this would be the
> only file in this directory.

This file is created by the RPMsg framework, it allows to have information about
RPMsg endpoint addresses associated to the rpmsg tty service instance.
I can add this additional information to clarify the sentence.

> 
>> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
>> index 23cc988c68a4..5095513029d7 100644
>> --- a/drivers/tty/Kconfig
>> +++ b/drivers/tty/Kconfig
>> @@ -368,6 +368,15 @@ config VCC
>>  
>>  source "drivers/tty/hvc/Kconfig"
>>  
>> +config RPMSG_TTY
>> +	tristate "RPMSG tty driver"
>> +	depends on RPMSG
>> +	help
>> +	  Say y here to export rpmsg endpoints as tty devices, usually found
>> +	  in /dev/ttyRPMSGx.
>> +	  This makes it possible for user-space programs to send and receive
>> +	  rpmsg messages as a standard tty protocol.
> 
> What is the module name going to be?

I will add information

> 
> 
>> +
>>  endif # TTY
>>  
>>  source "drivers/tty/serdev/Kconfig"
>> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
>> index a2bd75fbaaa4..07aca5184a55 100644
>> --- a/drivers/tty/Makefile
>> +++ b/drivers/tty/Makefile
>> @@ -26,5 +26,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>>  obj-$(CONFIG_VCC)		+= vcc.o
>> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>>  
>>  obj-y += ipwireless/
>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
>> new file mode 100644
>> index 000000000000..0c99f54c2911
>> --- /dev/null
>> +++ b/drivers/tty/rpmsg_tty.c
>> @@ -0,0 +1,275 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> 
> Copyright needs a year, right?

The year is present, but indicated after the company, to inverse

> 
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/slab.h>
>> +#include <linux/tty.h>
>> +#include <linux/tty_flip.h>
>> +
>> +#define MAX_TTY_RPMSG	32
> 
> Why have a max at all?

This is linked to tty_alloc_driver in the module init
It is multi instance but need pre-allocation.
I did not find a proper way to do this. Any suggestion is welcome.

> 
> 
>> +
>> +static DEFINE_IDR(tty_idr);	/* tty instance id */
>> +static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */
> 
> I didn't think an idr needed a lock anymore, are you sure this is
> needed?

recognized in ird_alloc header for multi instance:
https://elixir.bootlin.com/linux/v5.15-rc1/source/lib/idr.c#L60

> 
> 
>> +
>> +static struct tty_driver *rpmsg_tty_driver;
>> +
>> +struct rpmsg_tty_port {
>> +	struct tty_port		port;	 /* TTY port data */
>> +	int			id;	 /* TTY rpmsg index */
>> +	struct rpmsg_device	*rpdev;	 /* rpmsg device */
>> +};
>> +
>> +static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>> +{
>> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
>> +	int copied;
>> +
>> +	if (!len)
>> +		return -EINVAL;
> 
> How can len be 0?

In the RPMsg framework, nothing prevents a RPMsg with len = 0 (means header with
no payload).
It should be possible that the remote processor firmware bug generates such message.

> 
> 
>> +	copied = tty_insert_flip_string(&cport->port, data, len);
>> +	if (copied != len)
>> +		dev_dbg(&rpdev->dev, "Trunc buffer: available space is %d\n",
>> +			copied);
> 
> Is this the proper error handling?

Right, as a part of the message is lost, should be an error.

> 
> 
>> +	tty_flip_buffer_push(&cport->port);
> 
> Shouldn't you return the number of bytes sent?

For the RPMsg framework you mean? No, because for another RPMsg services, it
might not make sense. Return 0 seems to me more generic.
In any case today the RPMsg framework doesn't test the callback return,
associated action would depend on the service.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
>> +{
>> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
>> +
>> +	if (!cport) {
>> +		dev_err(tty->dev, "Cannot get cport\n");
> 
> How can this happen?

Right over protection!

> 
> 
>> +		return -ENODEV;
>> +	}
>> +
>> +	tty->driver_data = cport;
>> +
>> +	return tty_port_install(&cport->port, driver, tty);
>> +}
>> +
>> +static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
>> +{
>> +	return tty_port_open(tty->port, tty, filp);
>> +}
>> +
>> +static void rpmsg_tty_close(struct tty_struct *tty, struct file *filp)
>> +{
>> +	return tty_port_close(tty->port, tty, filp);
>> +}
>> +
>> +static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
>> +{
>> +	struct rpmsg_tty_port *cport = tty->driver_data;
>> +	struct rpmsg_device *rpdev;
>> +	int msg_max_size, msg_size;
>> +	int ret;
>> +
>> +	rpdev = cport->rpdev;
>> +
>> +	dev_dbg(&rpdev->dev, "Send msg from tty->index = %d, len = %d\n", tty->index, len);
> 
> ftrace is your friend, is this really still needed?
> 

Yes, but unfortunately not the friend of all our customers :)
I will clean this log. The RPMsg dynamic traces already allows to trace the
messages, which should be enough for a first level of debug.

I will send a new revision integrating your comments.

Thanks & Regards,
Arnaud

> thanks,
> 
> greg k-h
> 
