Return-Path: <SRS0=A3Cg=DI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B8EC4727F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 14:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BF71207DE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 14:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="lmaJnxIv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732207AbgJAOrD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Oct 2020 10:47:03 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:17860 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732020AbgJAOrC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Oct 2020 10:47:02 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 091EfdNK008888;
        Thu, 1 Oct 2020 16:46:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=MfBPhNoT6FPttKa4wn46gmWhQf3voOCyoRh7mAmqjtQ=;
 b=lmaJnxIvuhVdBBphI1l6uSPcpDE5J76TxZx5DxECVq/BICBYIkO6ryeTcOZR2bwfhGd+
 xcDTJIB82nD85CgadXA65Hjh+zb5+JMYXdiBL6ljuO/sFTRdhQbZamLnVA5kqJKIz/E5
 ltdVAb/405w6k1o8pQyg4LALZAfxzuIAXcTZKWFdmviyomyfzIIA6HhNWBmfXz/oGmEG
 vAHrkBC9tIX3iIWjRBQ4cRv3BAQ9Q8x8wQCJTzkcxOJ1qIos9XeOV9Awj02Cwx7che9m
 nwydvMdLV/1wqvWdNlgmRv5K0uMTGquAMhFVoljoebH9+3bEjTAJdkYbJAIsi1YjFZ0f dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33su4054tg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Oct 2020 16:46:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8251F10002A;
        Thu,  1 Oct 2020 16:46:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6EF2F2B2057;
        Thu,  1 Oct 2020 16:46:56 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 16:46:55 +0200
Subject: Re: [PATCH 02/10] rpmsg: core: Add channel creation internal API
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-3-mathieu.poirier@linaro.org>
 <20200930063553.GB20683@ubuntu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <beb0b4d9-e661-43d2-c5d5-b90eccf11036@st.com>
Date:   Thu, 1 Oct 2020 16:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930063553.GB20683@ubuntu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-01_04:2020-10-01,2020-10-01 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/30/20 8:35 AM, Guennadi Liakhovetski wrote:
> On Mon, Sep 21, 2020 at 06:09:52PM -0600, Mathieu Poirier wrote:
>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>
>> Add the channel creation API as a first step to be able to define the
>> name service announcement as a rpmsg driver independent from the RPMsg
>> virtio bus.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/rpmsg/rpmsg_core.c     | 45 ++++++++++++++++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h | 12 +++++++++
>>  2 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 91de940896e3..50a835eaf1ba 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -20,6 +20,51 @@
>>  
>>  #include "rpmsg_internal.h"
>>  
>> +/**
>> + * rpmsg_create_channel() - create a new rpmsg channel
>> + * using its name and address info.
>> + * @rpdev: rpmsg driver
> 
> device
> 
>> + * @chinfo: channel_info to bind
>> + *
>> + * Returns a pointer to the new rpmsg device on success, or NULL on error.
>> + */
>> +struct rpmsg_device *
>> +	rpmsg_create_channel(struct rpmsg_device *rpdev,
> 
> You might call this nitpicking, but we already have two indentation styles for 
> functions:
> 
> return_type function(type1 arg1,
> 			...)
> 
> (my personal preference, it also has sub-variants - depending on the aligning 
> of the second line and any following lines, and one more moving "type1 arg1" 
> to the second line)
> 
> return_type
> function(...
> 
> and now you're also introducing the third style - with "function" indented... 
> Maybe we don't need more of those, particularly since now with 100 chars per 
> line in most cases the very first style can be used.

Right, bad coding style.

> 
>> +			     struct rpmsg_channel_info *chinfo)
>> +{
>> +	if (WARN_ON(!rpdev))
>> +		return NULL;
>> +	if (!rpdev->ops || !rpdev->ops->create_channel) {
>> +		dev_err(&rpdev->dev, "no create_channel ops found\n");
>> +		return NULL;
>> +	}
>> +
>> +	return rpdev->ops->create_channel(rpdev, chinfo);
>> +}
>> +EXPORT_SYMBOL(rpmsg_create_channel);
>> +
>> +/**
>> + * rpmsg_release_channel() - release a rpmsg channel
>> + * using its name and address info.
>> + * @rpdev: rpmsg driver
> 
> device
> 
>> + * @chinfo: channel_info to bind
>> + *
>> + * Returns 0 on success or an appropriate error value.
>> + */
>> +int rpmsg_release_channel(struct rpmsg_device *rpdev,
>> +			  struct rpmsg_channel_info *chinfo)
>> +{
>> +	if (WARN_ON(!rpdev))
>> +		return -EINVAL;
>> +	if (!rpdev->ops || !rpdev->ops->release_channel) {
>> +		dev_err(&rpdev->dev, "no release_channel ops found\n");
>> +		return -EPERM;
> 
> ENOSYS or EOPNOTSUPP? I'm never sure which one is appropriate for 
> this kind of errors.

For coherency with the other RPMsg API functions, could be ENXIO...

> 
>> +	}
>> +
>> +	return rpdev->ops->release_channel(rpdev, chinfo);
>> +}
>> +EXPORT_SYMBOL(rpmsg_release_channel);
>> +
>>  /**
>>   * rpmsg_create_ept() - create a new rpmsg_endpoint
>>   * @rpdev: rpmsg channel device
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index 3fc83cd50e98..587f723757d4 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -20,6 +20,8 @@
>>  
>>  /**
>>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
>> + * @create_channel:	create backend-specific channel, optional
>> + * @release_channel:	release backend-specific channel, optional
> 
> Are they really optional? You return errors if they aren't available.

I think they are optional, the back-end might not support the operation. 
In this case, activating an RPMsg client that uses the interface should result in an
error because the service is not compatible with the back-end implementation.

Regards,
Arnaud

> 
>>   * @create_ept:		create backend-specific endpoint, required
>>   * @announce_create:	announce presence of new channel, optional
>>   * @announce_destroy:	announce destruction of channel, optional
>> @@ -29,6 +31,11 @@
>>   * advertise new channels implicitly by creating the endpoints.
>>   */
>>  struct rpmsg_device_ops {
>> +	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
>> +					     struct rpmsg_channel_info *chinfo);
>> +	int (*release_channel)(struct rpmsg_device *rpdev,
>> +			       struct rpmsg_channel_info *chinfo);
>> +
>>  	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
>>  					    rpmsg_rx_cb_t cb, void *priv,
>>  					    struct rpmsg_channel_info chinfo);
>> @@ -75,6 +82,11 @@ int rpmsg_unregister_device(struct device *parent,
>>  struct device *rpmsg_find_device(struct device *parent,
>>  				 struct rpmsg_channel_info *chinfo);
>>  
>> +struct rpmsg_device *
>> +rpmsg_create_channel(struct rpmsg_device *rpdev,
>> +		     struct rpmsg_channel_info *chinfo);
>> +int rpmsg_release_channel(struct rpmsg_device *rpdev,
>> +			  struct rpmsg_channel_info *chinfo);
>>  /**
>>   * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
>>   * @rpdev:	prepared rpdev to be used for creating endpoints
>> -- 
>> 2.25.1
>>
