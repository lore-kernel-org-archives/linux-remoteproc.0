Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211A8C48BE8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 09:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0D5D6128C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 09:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhFPJet (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Jun 2021 05:34:49 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8312 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231316AbhFPJet (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Jun 2021 05:34:49 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15G9SSdo008917;
        Wed, 16 Jun 2021 11:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4Mh82hbLJWcyFPjkRwL84Ww/o+yLB0D/vib4O8TJaSA=;
 b=ElKDY8G6h8No/lRk7AbCCPzeV+0VBGG82cejKnDTD3znY06x6G9qaxFMBYHX9ru4Lbmb
 l/IRC3zVq3LLYlXDRmBNJMYIJ0dAgPQONtI86ldn9EFde6cJ7NYnmBMLIEBDcK+R79iQ
 838Ij9Cwx3uiSwfn2L5rttsfCP7/3tgoaDk63TPx3zcHOpyi8/Mysq8qIe2U4q+pEopL
 w9UPubu8kEX5HQ0bAplmWM2+Zwt74g+hUvCrSdc9mBn7XVctZYw2mT4t8UU5+gSzJt5q
 L8fkvFGPJtsfd+kivhc/dM+wOngZkSD4cjZyhhaGlNwKR5mFXzkF3ALqIvsoPWVtavRu bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 396rb77fp6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Jun 2021 11:32:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C96B010009A;
        Wed, 16 Jun 2021 11:30:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1C0621BF7D;
        Wed, 16 Jun 2021 11:30:52 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:30:52 +0200
Subject: Re: [PATCH 3/4] rpmsg: ctrl: Add check on rpmsg device removability
 from user space
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-4-arnaud.pouliquen@foss.st.com>
 <20210615174634.GB604521@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b7dc5207-643b-b5e6-2bee-106b2eb87555@foss.st.com>
Date:   Wed, 16 Jun 2021 11:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615174634.GB604521@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_07:2021-06-15,2021-06-16 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 6/15/21 7:46 PM, Mathieu Poirier wrote:
> On Fri, Jun 04, 2021 at 11:14:05AM +0200, Arnaud Pouliquen wrote:
>> Using the RPMSG_RELEASE_DEV_IOCTL is possible to remove any
>> rpmsg device (such as the rpmsg ns or the rpmsg ctrldev).
>>
>> Add a new field to store the removability of the device.
>>
>> By default the rpmsg device can not be removed by user space. It is
>> set to 1 by the rpmsg ctrl on RPMSG_CREATE_DEV_IOCTL request, but
>> could also be set by an rpmsg driver during probe.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_ctrl.c | 17 ++++++++++++++++-
>>  include/linux/rpmsg.h      |  2 ++
>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> index cb19e32d05e1..e93c6ec49038 100644
>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -74,6 +74,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	struct rpmsg_endpoint_info eptinfo;
>>  	struct rpmsg_channel_info chinfo;
>>  	struct rpmsg_device *rpdev;
>> +	struct device *dev;
>>  	int ret = 0;
>>  
>>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>> @@ -95,11 +96,25 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  		if (!rpdev) {
>>  			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>>  			ret = -ENXIO;
>> +		} else {
>> +			/* Allow user space to release the device. */
>> +			rpdev->us_removable = 1;
> 
> As a rule of thumb I try really hard to avoid introducing new flags.  In this case we
> can attain the same result by looking at chinfo->name, chinfo->src and
> chinfo->dst.  I would introduce a new inline function in rpmsg_internal.h,
> something like rpmsg_chrdev_is_ctrl_dev(), and compare the specifics in chinfo
> to rpdev->id.name, rpdev->src and rpdev->dst.  If they all match then the
> operation is refused.

Something must have escaped me, because i turn around your your proposal,
without understand it.

The "us_removable" flag is not only for the rpmsg_ctrl, but for any rpmsg device
that have not to be released by user application. Either because there are core
( rpmsg_ctrl, rpmsg_ns) or because a rpmsg driver don't allow to unbind its
rpmsg devices.

look to me that rpmsg_chrdev_is_ctrl_dev just prevents rpmsg ctrl to be released
by the RPMSG_RELEASE_DEV_IOCTL.

Please, could you clarify what you have in mind here?

Thanks,
Arnaud

> 
> That way we don't introduce a new flag and there is also no need to call
> rpmsg_find_device() twice.



> 
> Thanks,
> Mathieu
> 
>>  		}
>>  		break;
>>  
>>  	case RPMSG_RELEASE_DEV_IOCTL:
>> -		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>> +		dev = rpmsg_find_device(ctrldev->rpdev->dev.parent, &chinfo);
>> +		if (!dev)
>> +			ret =  -ENXIO;
>> +
>> +		/* Verify that rpmsg device removal is allowed. */
>> +		if (!ret) {
>> +			rpdev = to_rpmsg_device(dev);
>> +			if (!rpdev->us_removable)
>> +				ret = -EACCES;
>> +		}
>> +		if (!ret)
>> +			ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>>  		if (ret)
>>  			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
>>  				chinfo.name, ret);
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index d97dcd049f18..3642aad1a789 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -47,6 +47,7 @@ struct rpmsg_channel_info {
>>   * @ept: the rpmsg endpoint of this channel
>>   * @announce: if set, rpmsg will announce the creation/removal of this channel
>>   * @little_endian: True if transport is using little endian byte representation
>> + * @us_removable: True if userspace application has permission to remove the rpmsg device
>>   */
>>  struct rpmsg_device {
>>  	struct device dev;
>> @@ -57,6 +58,7 @@ struct rpmsg_device {
>>  	struct rpmsg_endpoint *ept;
>>  	bool announce;
>>  	bool little_endian;
>> +	bool us_removable;
>>  
>>  	const struct rpmsg_device_ops *ops;
>>  };
>> -- 
>> 2.17.1
>>
