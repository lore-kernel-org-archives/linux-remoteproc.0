Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C08AC48BE5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 09:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F29611B0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 09:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhFUJiQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 05:38:16 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60944 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229618AbhFUJiQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:38:16 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15L9V95k004978;
        Mon, 21 Jun 2021 11:35:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cEKfFG+DvVlEzva9JAEDZw+BFhMbND+iXMTgwIbDSvY=;
 b=NbIkgOsWnZyN7hP4zE1bCsj7r8ck8dLuDDY/L+SshVxz07AWPlIEy5jMsvTtwgHUkLLg
 7RFHA0+6WjQPlv7lLA+F6nS3nJ+1Xbu0yG1pBoE9MKIAWl94IFCVwaiqqpXT+/66+Ncf
 r4kEZ2M+LO7oKua4PHuGe08M8LQQ43qtmQq3juB6yW8IU3xlwzBxBooPXTVCr+DVX+ee
 jZU9N+nQhtm4nJ599tE3av0zEA0MWwXpyF+Vge9GgnYFEThMRcPzUxVNcx5Da8tLzteq
 d/Xbb0a9nRUtGqIOBx16Lk1oyVtI/BG0yuZU6bOHUxLXPT/k7WVfKiOLpCpGA97dxlcM Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39a5bhcet0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Jun 2021 11:35:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C700110002A;
        Mon, 21 Jun 2021 11:35:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3035321CA90;
        Mon, 21 Jun 2021 11:35:57 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun
 2021 11:35:56 +0200
Subject: Re: [PATCH 1/4] rpmsg: ctrl: Introduce RPMSG_CREATE_DEV_IOCTL
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-2-arnaud.pouliquen@foss.st.com>
 <20210615175334.GD604521@p14s>
 <1645a516-1d83-27bd-e9ed-c78a18bf4c52@foss.st.com>
Message-ID: <adec5564-e38a-b50b-3216-255fd931a966@foss.st.com>
Date:   Mon, 21 Jun 2021 11:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1645a516-1d83-27bd-e9ed-c78a18bf4c52@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-21_03:2021-06-20,2021-06-21 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 6/16/21 10:12 AM, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 6/15/21 7:53 PM, Mathieu Poirier wrote:
>> On Fri, Jun 04, 2021 at 11:14:03AM +0200, Arnaud Pouliquen wrote:
>>> Implement the RPMSG_CREATE_DEV_IOCTL to allow the user application to
>>> initiate a communication through a new rpmsg channel.
>>> This Ioctl can be used to instantiate a local rpmsg device.
>>> Depending on the back-end implementation, the associated rpmsg driver is
>>> probed and a NS announcement can be sent to the remote processor.
>>>
>>> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>> ---
>>>  drivers/rpmsg/rpmsg_ctrl.c | 30 ++++++++++++++++++++++++++----
>>>  include/uapi/linux/rpmsg.h |  5 +++++
>>>  2 files changed, 31 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>>> index eeb1708548c1..4aa962df3661 100644
>>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>>> @@ -23,6 +23,7 @@
>>>  #include <uapi/linux/rpmsg.h>
>>>  
>>>  #include "rpmsg_char.h"
>>> +#include "rpmsg_internal.h"
>>>  
>>>  static dev_t rpmsg_major;
>>>  
>>> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
>>>   * @rpdev:	underlaying rpmsg device
>>>   * @cdev:	cdev for the ctrl device
>>>   * @dev:	device for the ctrl device
>>> + * @ctrl_lock:	serialize the ioctrls.
>>>   */
>>>  struct rpmsg_ctrldev {
>>>  	struct rpmsg_device *rpdev;
>>>  	struct cdev cdev;
>>>  	struct device dev;
>>> +	struct mutex ctrl_lock;
>>>  };
>>>  
>>>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>>> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>>  	void __user *argp = (void __user *)arg;
>>>  	struct rpmsg_endpoint_info eptinfo;
>>>  	struct rpmsg_channel_info chinfo;
>>> -
>>> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>>> -		return -EINVAL;
>>> +	struct rpmsg_device *rpdev;
>>> +	int ret = 0;
>>>  
>>>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>>  		return -EFAULT;
>>> @@ -82,7 +84,26 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>>  	chinfo.src = eptinfo.src;
>>>  	chinfo.dst = eptinfo.dst;
>>>  
>>> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>>> +	mutex_lock(&ctrldev->ctrl_lock);
>>
>> Do we need a lock here?  I thought the character device layer would guarantee
>> accesses on a file handler would be atomic...  Am I wrong?
>>
> 
> It is a good point! from my understanding, using "unlocked_ioctl" ops, the
> driver has to handle is own atomic protection.
> I will try to hack the code to verify this.

I confirm without lock there is no atomic access, re-entrance is possible in
rpmsg_ctrldev_ioctl. Keeping lock to serialize the controls seems safer to me to
avoid race condition.

Regards
Arnaud

> 
> Thanks,
> Arnaud
> 
>>> +	switch (cmd) {
>>> +	case RPMSG_CREATE_EPT_IOCTL:
>>> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>>> +		break;
>>> +
>>> +	case RPMSG_CREATE_DEV_IOCTL:
>>> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
>>> +		if (!rpdev) {
>>> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>>> +			ret = -ENXIO;
>>> +		}
>>> +		break;
>>> +
>>> +	default:
>>> +		ret = -EINVAL;
>>> +	}
>>> +	mutex_unlock(&ctrldev->ctrl_lock);
>>> +
>>> +	return ret;
>>>  };
>>>  
>>>  static const struct file_operations rpmsg_ctrldev_fops = {
>>> @@ -119,6 +140,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>>>  	device_initialize(dev);
>>>  	dev->parent = &rpdev->dev;
>>>  
>>> +	mutex_init(&ctrldev->ctrl_lock);
>>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>>  	ctrldev->cdev.owner = THIS_MODULE;
>>>  
>>> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
>>> index f5ca8740f3fb..f9d5a74e7801 100644
>>> --- a/include/uapi/linux/rpmsg.h
>>> +++ b/include/uapi/linux/rpmsg.h
>>> @@ -33,4 +33,9 @@ struct rpmsg_endpoint_info {
>>>   */
>>>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>>>  
>>> +/**
>>> + * Instantiate a rpmsg service device.
>>> + */
>>> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>>> +
>>>  #endif
>>> -- 
>>> 2.17.1
>>>
