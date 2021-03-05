Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02583C433E9
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 10:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEB8364F69
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 10:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhCEKrC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 Mar 2021 05:47:02 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:60288 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229589AbhCEKqy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Mar 2021 05:46:54 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 125AcHHC020354;
        Fri, 5 Mar 2021 11:46:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dLupVWCVW75NjxCM/V3qhiOixYswGXxMdSDCqfLT35A=;
 b=s9f6Pf46WD9Oai8JQ3m99F58aV+sxgXloCqtulmlKBKy0q98eThqfoIIeB2xkKGJTwvy
 sjS43aK6wPbgi3kDKEm00fs3/sOOpw8l8wtvcif8J9j1iZOqb/OeysWFeoYOuLH7Rx76
 pbABCNnoA6H2a6ApBLVfAGQHKGZpsItHhCukCjdjgC62cGWhbOI8C0BEYkadqljTX9M8
 zLHdUjeiMQ358RV8cZUN/hxV2EVbMJXfhdc9pnrWyXh/7DurHheLNoZ4yoK+K7qgpp5O
 x4scoK26IGeQbGIqd9PZ3pJbEe3HSwlaZK8UOrA16rcvRFEpcq/O+b48C8791ECz2tBJ WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 373cb5tgk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Mar 2021 11:46:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFB4510002A;
        Fri,  5 Mar 2021 11:46:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B795C2425CC;
        Fri,  5 Mar 2021 11:46:48 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Mar
 2021 11:46:48 +0100
Subject: Re: [PATCH v5 13/16] rpmsg: char: introduce
 __rpmsg_chrdev_create_eptdev function
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
 <20210304185520.GC3854911@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <de4db82c-8136-6fe7-f17a-59d65e8b266c@foss.st.com>
Date:   Fri, 5 Mar 2021 11:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304185520.GC3854911@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-05_05:2021-03-03,2021-03-05 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/4/21 7:55 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:58PM +0100, Arnaud Pouliquen wrote:
>> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
>> the rpmsg_eptdev context structure.
>> This patch prepares the introduction of a RPMsg device for the
>> char device. the RPMsg device will need a reference to the context.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
>>  1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 09ae1304837c..66dcb8845d6c 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>>  
>> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> -			       struct rpmsg_channel_info chinfo)
>> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
>> +							 struct device *parent,
>> +							 struct rpmsg_channel_info chinfo)
>>  {
>>  	struct rpmsg_eptdev *eptdev;
>>  	struct device *dev;
>> @@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  
>>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>>  	if (!eptdev)
>> -		return -ENOMEM;
>> +		return ERR_PTR(-ENOMEM);
>>  
>>  	dev = &eptdev->dev;
>>  	eptdev->rpdev = rpdev;
>> @@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  		put_device(dev);
>>  	}
>>  
>> -	return ret;
>> +	return eptdev;
>>  
>>  free_ept_ida:
>>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
>> @@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  	put_device(dev);
>>  	kfree(eptdev);
>>  
>> -	return ret;
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo)
>> +{
>> +	struct rpmsg_eptdev *eptdev;
>> +
>> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
> 
> Shouldn't the second argument to __rpmsg_chrdev_create_eptdev() be @parent?

This keep the legacy hierarchy:
https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/rpmsg_char.c#L362

Thanks,
Arnaud


> 
>> +	if (IS_ERR(eptdev))
>> +		return PTR_ERR(eptdev);
>> +
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>  
>> -- 
>> 2.17.1
>>
