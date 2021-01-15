Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C0EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 09:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75946233CF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 09:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbhAOJOi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Jan 2021 04:14:38 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:11578 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725910AbhAOJOh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Jan 2021 04:14:37 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10F9862S007904;
        Fri, 15 Jan 2021 10:13:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=U279IgL5e2lt6G1hzrPoIpOYYSQYp3xq6oyfQ7iVSfQ=;
 b=m/tHxFX1wW2KAEHfFWpN0CNbBORxCxq2CCFEhsl/WxJsD7aN8BtrUegL2c1bFJkAzMaT
 VEicFdXIvfLuE8RB1VhTObZFOu5bxKojxH6pYS40RxBFo+H7KK4Q7GIu4xJADnwwWUen
 VuYnAH7Q5aU97Efj8EanA7WuLmmvybtcKBs2lXadmyKokdUoZXAALvocBIuatG27Xe22
 iBoY7OyADWiiZm+hQgQqB+oXNPavN1r6Ntq/0qWXWiKo9NeMM9ORQvGqcHTgwMeyFKDf
 z77CooZ4fKcNF+R7RYYzAoCU3kAZQ/10LuRBvtJc5/wKp5tgV+B0LawpxWFixUAQvF8Y Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35y5gxjaec-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jan 2021 10:13:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A795B10002A;
        Fri, 15 Jan 2021 10:13:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 928D62290AA;
        Fri, 15 Jan 2021 10:13:52 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Jan
 2021 10:13:51 +0100
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: return an error if device
 already open
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN - foss <arnaud.pouliquen@foss.st.com>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
 <20210114190543.GB255481@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <6de9ff8f-0be1-387a-df7e-7d77dd859513@st.com>
Date:   Fri, 15 Jan 2021 10:13:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114190543.GB255481@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-15_06:2021-01-15,2021-01-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,


On 1/14/21 8:05 PM, Mathieu Poirier wrote:
> On Wed, Jan 06, 2021 at 02:37:14PM +0100, Arnaud Pouliquen wrote:
>> The rpmsg_create_ept function is invoked when the device is opened.
>> As only one endpoint must be created per device. It is not
>> possible to open the same device twice.
>> The fix consists in returning -EBUSY when device is already
>> opened.
>>
>> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 4bbbacdbf3bb..360a1ab0a9c4 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -127,6 +127,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>>  	struct device *dev = &eptdev->dev;
>>  
>> +	if (eptdev->ept)
>> +		return -EBUSY;
>> +
> 
> I rarely had to work so hard to review a 2 line patch...

That means that my commit description was not enough explicit...

> 
> As far as I can tell the actual code is doing the right thing.  If user space is
> trying to open the same eptdev more than once function rpmsg_create_ept() should
> complain and the operation denied, wich is what the current code is doing.  
> 
> There is currently two customers for this API - SMD and GLINK.  The SMD code is
> quite clear that if the channel is already open, the operation will be
> denied [1].  The GLINK code isn't as clear but the fact that it returns NULL on
> error conditions [2] is a good indication that things are working the same way.
> 
> What kind of use case are you looking to address?  Is there any way you can use
> rpdev->ops->create_ept() as it is currently done?

This patch was part of the IOCTL rpmsg series. I sent it separately at Bjorn's
request [1].

I detect the issue using the RPMSG_ADDR_ANY for the source address when tested
it with the rpmsf_virtio bus. In this case at each sys open of the device, a new
endpoint is created because a new source address is allocated.

[1]https://patchwork.kernel.org/project/linux-remoteproc/patch/20201222105726.16906-11-arnaud.pouliquen@foss.st.com/

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
> [1]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_smd.c#L920
> [2]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_glink_native.c#L1149
> 
>>  	get_device(dev);
>>  
>>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> -- 
>> 2.17.1
>>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 
