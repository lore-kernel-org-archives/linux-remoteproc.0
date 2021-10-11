Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401F6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 12:53:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A9D860EE2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 12:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbhJKMzT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 08:55:19 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37874 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230061AbhJKMzS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 08:55:18 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B9GVev022125;
        Mon, 11 Oct 2021 14:53:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=D917K3Q1knSyVA1O8QE0bgZaxDjZWp8DN2uOU/as1g0=;
 b=M1gSDcan9lDvgfT74iJlLyn2Jfa6gQ0I7GiP5oyGbEkbMwcP/32QfD9lmPkSdRbbkRi1
 N3kBcNHgjSwk8aWsYZ+XO3ET+9A3T4kfxPBsmW/p0HBbHp6h+1THjEceMx4pLbOJywep
 BEagb9BKz4VYBxg98ZINDIvvY54yBeE7nf30r4Frv0s7V9swP+KAva7N0CzJcaioY8Y0
 1QqTg7JluZhbXFtOviKQQmvd9pWAnOgWly/K+68B08UawtCb3JYg2L0FAqGbTTHvgBjG
 aS850x4rhlLBUYTuTEaoKFMqKyq5JU5UlJOR8g82WDtIoSg7ASfVWS4DEoxUnpkgjw3d Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bmd35u1af-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Oct 2021 14:53:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CF5710002A;
        Mon, 11 Oct 2021 14:53:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F16B226FAB;
        Mon, 11 Oct 2021 14:53:16 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 14:53:15 +0200
Subject: Re: [PATCH v3] rpmsg: ctrl: Introduce new
 RPMSG_CREATE/RELEASE_DEV_IOCTL controls
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210712132303.25058-1-arnaud.pouliquen@foss.st.com>
 <YWDhdq4iOihzC5FI@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <277171bf-5947-9d1b-6ad5-e80dc15c4cc1@foss.st.com>
Date:   Mon, 11 Oct 2021 14:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDhdq4iOihzC5FI@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_04,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/9/21 2:25 AM, Bjorn Andersson wrote:
> On Mon 12 Jul 06:23 PDT 2021, Arnaud Pouliquen wrote:
> 
>> Allow the user space application to create and release an rpmsg device
>> by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
>> the /dev/rpmsg_ctrl interface
>>
> 
> With
> https://lore.kernel.org/linux-remoteproc/CAHk-=wgea9bo-j4+LAvZF7OKPAXKqrGgiBAhXTJ3Jv5JAZgA+A@mail.gmail.com/
> and
> https://lore.kernel.org/linux-arm-msm/1609958656-15064-1-git-send-email-hemantk@codeaurora.org/
> in mind, I would like some concrete examples of when and how this is
> going to be used.
> 
> 
> Also, as I said previously, this would have been better to put together
> with the split out of rpmsg_ctrl, because afaict this is the only reason
> for doing that. Or am I simply missing something?

This as been done by steps to ease the review. Any way, these controls also
require, to be usable for the rpmsg_char, the implementation of the rpmsg-raw
channel in the rpmsg_char.
Should i squash the 3 patchsets in one and add concrete examples in cover letter?

> 
>> The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
>> device.
>> Depending on the back-end implementation, the associated rpmsg driver is
>> probed and a NS announcement can be sent to the remote processor.
>>
> 
> So, does this imply that in order to spawn a new rpmsg_char from the
> host side, I would use RPMSG_CREATE_DEV_IOCTL and to open a channel
> announced by the remote I would use RPMSG_CREATE_EPT_IOCTL?

No, if announced by the remote side the rpmsg_char dev should be automatically
probed by the virtio bus.
The RPMSG_CREATE_EPT_IOCTL is the legacy control that is used by QCOM drivers to
creates the cdev. It doesn't really make sense for the virtio backend, as virtio
is based on a rpmsg channel that is associated to a rpmsg device.
The only use case I have in mind would be to create endpoint without channel but
using fixed addresses. No concrete use case identified in ST Microelectronics
for hardcoded endpoint addresses.

> 
>> The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
>> rpmsg device created either by the remote processor or with the
>> RPMSG_CREATE_DEV_IOCTL call.
> 
> Is this a side effect, bug or a feature?

Both a side effect but also a feature to remove a channel from the initiative of
the user application.

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Depending on the back-end implementation, the associated rpmsg driver is
>> removed and a NS destroy rpmsg can be sent to the remote processor.
>>
>> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>> update from V2
>> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> - rebased on kernel V.14-rc1 + 
>>   series V5 Restructure the rpmsg char to decorrelate the control part [1]
>>
>>
>> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=514017
>>
>> ---
>>  drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
>>  include/uapi/linux/rpmsg.h | 10 ++++++++++
>>  2 files changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> index eeb1708548c1..cb19e32d05e1 100644
>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -23,6 +23,7 @@
>>  #include <uapi/linux/rpmsg.h>
>>  
>>  #include "rpmsg_char.h"
>> +#include "rpmsg_internal.h"
>>  
>>  static dev_t rpmsg_major;
>>  
>> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
>>   * @rpdev:	underlaying rpmsg device
>>   * @cdev:	cdev for the ctrl device
>>   * @dev:	device for the ctrl device
>> + * @ctrl_lock:	serialize the ioctrls.
>>   */
>>  struct rpmsg_ctrldev {
>>  	struct rpmsg_device *rpdev;
>>  	struct cdev cdev;
>>  	struct device dev;
>> +	struct mutex ctrl_lock;
>>  };
>>  
>>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	void __user *argp = (void __user *)arg;
>>  	struct rpmsg_endpoint_info eptinfo;
>>  	struct rpmsg_channel_info chinfo;
>> -
>> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>> -		return -EINVAL;
>> +	struct rpmsg_device *rpdev;
>> +	int ret = 0;
>>  
>>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>  		return -EFAULT;
>> @@ -82,7 +84,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	chinfo.src = eptinfo.src;
>>  	chinfo.dst = eptinfo.dst;
>>  
>> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>> +	mutex_lock(&ctrldev->ctrl_lock);
>> +	switch (cmd) {
>> +	case RPMSG_CREATE_EPT_IOCTL:
>> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>> +		break;
>> +
>> +	case RPMSG_CREATE_DEV_IOCTL:
>> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
>> +		if (!rpdev) {
>> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>> +			ret = -ENXIO;
>> +		}
>> +		break;
>> +
>> +	case RPMSG_RELEASE_DEV_IOCTL:
>> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>> +		if (ret)
>> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
>> +				chinfo.name, ret);
>> +		break;
>> +
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +	mutex_unlock(&ctrldev->ctrl_lock);
>> +
>> +	return ret;
>>  };
>>  
>>  static const struct file_operations rpmsg_ctrldev_fops = {
>> @@ -119,6 +147,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>>  	device_initialize(dev);
>>  	dev->parent = &rpdev->dev;
>>  
>> +	mutex_init(&ctrldev->ctrl_lock);
>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>  	ctrldev->cdev.owner = THIS_MODULE;
>>  
>> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
>> index f5ca8740f3fb..1637e68177d9 100644
>> --- a/include/uapi/linux/rpmsg.h
>> +++ b/include/uapi/linux/rpmsg.h
>> @@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
>>   */
>>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>>  
>> +/**
>> + * Instantiate a new local rpmsg service device.
>> + */
>> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>> +
>> +/**
>> + * Release a local rpmsg device.
>> + */
>> +#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
>> +
>>  #endif
>> -- 
>> 2.17.1
>>
