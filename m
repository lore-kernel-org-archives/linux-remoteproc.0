Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D6EC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 15:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FC4560C4B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 15:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243263AbhJKPjz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 11:39:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37258 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239107AbhJKPjz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 11:39:55 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BA0RMn023426;
        Mon, 11 Oct 2021 17:37:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ldde4w3c6cZexISS8fPP8V3PPkA54Tsqr14KbTr83B8=;
 b=SvrcQ1CmqyQBeCmRPGLnOoR9cZAYwLqdCJ4OqP6fy5G3SW/6z9AjyF1RdJJMr+JY5bCn
 wwMOpI+xCeykmLN3ORPb0upzUTG+Vbe3Voay9gMm3JNsJF+O7jV9JMA2NXQyZZPwFD4Y
 Ndv4DWZS6UgjzhKBjbKk0j4PI2quWML/ZHipQx1lzirTYuW/Y2RrkvUc279ydfULuGF9
 dNaKaiyb+jRQllZ04Juy5mZeCjquThFdC+QB3aNIDsgJ91ffX/IUD/IHFhZZgaTghfkb
 SuM4wO9qb34iqzDPS9acdvU7d9pT/nCfTT3Mc0NuQmBE15oZJbnWqP+9mnhbJkKbadrk wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bmdxrkree-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Oct 2021 17:37:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A46610002A;
        Mon, 11 Oct 2021 17:37:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 585B723151C;
        Mon, 11 Oct 2021 17:37:44 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 17:37:43 +0200
Subject: Re: [PATCH v4 4/4] rpmsg: char: Introduce the "rpmsg-raw" channel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
 <20210712131900.24752-5-arnaud.pouliquen@foss.st.com>
 <YWDdCFot7G0IuQNg@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <f518791c-76a7-2e46-8815-84a2c5047e2c@foss.st.com>
Date:   Mon, 11 Oct 2021 17:37:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDdCFot7G0IuQNg@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-11_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/9/21 2:06 AM, Bjorn Andersson wrote:
> On Mon 12 Jul 06:19 PDT 2021, Arnaud Pouliquen wrote:
> 
>> Allows to probe the endpoint device on a remote name service announcement,
>> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
>>
>> With this patch the /dev/rpmsgX interface can be instantiated by the remote
>> firmware.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Tested-by: Julien Massot <julien.massot@iot.bzh>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 75 +++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 73 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index bd728d90ba4c..1b7b610e113d 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -25,6 +25,8 @@
>>  
>>  #include "rpmsg_char.h"
>>  
>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>> +
>>  static dev_t rpmsg_major;
>>  static struct class *rpmsg_class;
>>  
>> @@ -421,6 +423,61 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>  
>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_channel_info chinfo;
>> +	struct rpmsg_eptdev *eptdev;
>> +	struct rpmsg_endpoint *ept;
>> +
>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> 
> The length should relate to the size of the destination buffer.
> This looks like an excellent job for strscpy_pad()
Thanks for pointing it, i will have alook
> 
>> +	chinfo.src = rpdev->src;
>> +	chinfo.dst = rpdev->dst;
>> +
>> +	eptdev =  __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo);
> 
> Note that this creates a new endpoint device as a child of the rpdev,
> while new endpoints created by RPMSG_CREATE_EPT_IOCTL are parented by
> the rpmsg_ctrl device.

Right this is probed by the rpmsg bus.

> 
> So it is possible to create two /dev/rpmsgN nodes for the same endpoint,
> I believe with the outcome that this one will be open but
> __rpmsg_create_ept() in virtio_rpmsg_bus should return NULL if the user
> tries to open the other one.

I do not observe this behavior on virtio backend. In my test I create 2
instances based on the ns announcement, /dev/rpmsg0 & /dev/rpmsg1 is created
Then I create a new instance using RPMSG_CREATE_EPT_IOCTL that create the
/dev/rpmsg2

The use of ida_simple_get in __rpmsg_chrdev_eptdev_create should prevent such
use case
Do you observe such behavior on your side, or only a concern?

> 
>> +	if (IS_ERR(eptdev))
>> +		return PTR_ERR(eptdev);
>> +
>> +	/*
>> +	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
>> +	 * structure as callback private data.
>> +	 */
>> +	ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> 
> Why don't you just set rpdev->priv to eptdev and make rpmsg_ept_cb the
> callback of your rpmsg_driver?

you mean ept->priv i suppose.

Because the priv parameter is managed by the rpmsg backend, so I have to assume
that it is used for some other purposes in the backend.

> 
>> +	if (!ept) {
>> +		dev_err(&rpdev->dev, "failed to create %s\n", eptdev->chinfo.name);
>> +		put_device(&eptdev->dev);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
>> +	 * reuse the default endpoint instead
>> +	 */
> 
> What happens when __rpmsg_chrdev_eptdev_create() delivers a uevent and
> user space quickly calls open() on the newly created /dev/rpmsgN, before
> the next line?

Right, here I can see 2 solutions:
- the use of a mutex to block the open
- move the rpmsg_create_default_ept in the open but in this case i need to keep
the eptdev->static_ept bool

A preference or an alternative?

> 
>> +	eptdev->static_ept = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>> +{
>> +	int ret;
>> +
>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>> +	if (ret)
>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>> +}
>> +
>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>> +	{ .name	= RPMSG_CHAR_DEVNAME },
> 
> I would expect that this list would grow, but you hard coded
> RPMSG_CHAR_DEVNAME in probe, so that won't work.

The point here is more the use of RPMSG_CHAR_DEVNAME in
 memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
right?

I can change this by rpdev->id->name and suppress RPMSG_CHAR_DEVNAME

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +	{ },
>> +};
>> +
>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>> +	.probe = rpmsg_chrdev_probe,
>> +	.remove = rpmsg_chrdev_remove,
>> +	.id_table = rpmsg_chrdev_id_table,
>> +	.drv.name = "rpmsg_chrdev",
>> +};
>> +
>>  static int rpmsg_chrdev_init(void)
>>  {
>>  	int ret;
>> @@ -434,16 +491,30 @@ static int rpmsg_chrdev_init(void)
>>  	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>>  	if (IS_ERR(rpmsg_class)) {
>>  		pr_err("failed to create rpmsg class\n");
>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> -		return PTR_ERR(rpmsg_class);
>> +		ret = PTR_ERR(rpmsg_class);
>> +		goto free_region;
>> +	}
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>> +	if (ret < 0) {
>> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
>> +		goto free_class;
>>  	}
>>  
>>  	return 0;
>> +
>> +free_class:
>> +	class_destroy(rpmsg_class);
>> +free_region:
>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> +
>> +	return ret;
>>  }
>>  postcore_initcall(rpmsg_chrdev_init);
>>  
>>  static void rpmsg_chrdev_exit(void)
>>  {
>> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>  	class_destroy(rpmsg_class);
>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>  }
>> -- 
>> 2.17.1
>>
