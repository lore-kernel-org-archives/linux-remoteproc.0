Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5208FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 14:07:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3B0161208
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 14:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239877AbhJKOJw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:09:52 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:35464 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241527AbhJKOHv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 10:07:51 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BCW2ld020232;
        Mon, 11 Oct 2021 16:05:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1dbThwiElHsuq35BFv5d6kMmSzzj3+8bh0VzA+SOIko=;
 b=fN6NWTOVQ/VXtucOpx5N07Jlbq9r/q6eHFpDp9oJkwGZ1Nq1BcqHhJLZTdNydqu8fJuV
 otQqSrtnca9swv0axVojDJQwQ828PTEUnZmr1skjTzAnwGruXiNgwM5DLessWaNYeX/A
 1YL4sXTSF8M8MqRgq9XODP1rnOU1CxcFmrD/Kb4lMy/Gi9TsanQeeznaUB7OCCVyziv7
 pwBO9nZ6YDiUOUo1xiFGT3JtGGrPPoxd07WI7++axuwVlC80N4PgLYpg/On/CPH6/J3o
 m6HQdi7MGIIzgSgDoZETQRSStQ92aMPVrHqFOYdAjNOnyjGNtQdpS25R5X89iiZJzR1J og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bmgquaan1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Oct 2021 16:05:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 156BB10002A;
        Mon, 11 Oct 2021 16:05:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB6CA22D17E;
        Mon, 11 Oct 2021 16:05:38 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 16:05:38 +0200
Subject: Re: [PATCH v4 3/4] rpmsg: char: Add possibility to use default
 endpoint of the rpmsg device.
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <julien.massot@iot.bzh>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
 <20210712131900.24752-4-arnaud.pouliquen@foss.st.com>
 <YWDXfeR79u5QQvk3@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <780359a6-5a88-52e4-4404-fd6291b609da@foss.st.com>
Date:   Mon, 11 Oct 2021 16:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDXfeR79u5QQvk3@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_04,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/9/21 1:42 AM, Bjorn Andersson wrote:
> On Mon 12 Jul 06:18 PDT 2021, Arnaud Pouliquen wrote:
> 
>> Current implementation create/destroy a new endpoint on each
>> rpmsg_eptdev_open/rpmsg_eptdev_release calls.
>>
>> For a rpmsg device created by the NS announcement mechanism we need to
>> use a unique static endpoint that is the default rpmsg device endpoint
>> associated to the channel.
>>
> 
> Why do you need this endpoint associated with the channel? Afaict the
> read/write operations still operate on eptdev->ept, so who does use the
> default endpoint for the device?
> 

on virtio backend each side has its endpoint address and have to know the
destination endpoint address. When you use the rpmsg_send() this send a message
to the remote side at the default dest address.
Now if we create the local endpoint at each fopen, how to ensure that the local
address is static?
elle using a dynamic address would imply that each time we open the device we
send this new address to the remote side.

Using the default endpoint of the channel make this simple to use.


>> This patch prepares the introduction of a rpmsg channel device for the
>> char device. The rpmsg channel device will require a default endpoint to
>> communicate to the remote processor.
>>
>> Add the static_ept field in rpmsg_eptdev structure. This boolean
>> determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.
>>
>> - If static_ept == false:
>>   Use the legacy behavior by creating a new endpoint each time
>>   rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
>>   is called on /dev/rpmsgX device open/close.
>>
>> - If static_ept == true:
>>   use the rpmsg device default endpoint for the communication.
>> - Address the update of _rpmsg_chrdev_eptdev_create in e separate patch for readability.
>>
>> Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Tested-by: Julien Massot <julien.massot@iot.bzh>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 50b7d4b00175..bd728d90ba4c 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>>   * @queue_lock:	synchronization of @queue operations
>>   * @queue:	incoming message queue
>>   * @readq:	wait object for incoming queue
>> + * @static_ept: specify if the endpoint has to be created at each device opening or
>> + *              if the default endpoint should be used.
>>   */
>>  struct rpmsg_eptdev {
>>  	struct device dev;
>> @@ -59,6 +61,8 @@ struct rpmsg_eptdev {
>>  	spinlock_t queue_lock;
>>  	struct sk_buff_head queue;
>>  	wait_queue_head_t readq;
>> +
>> +	bool static_ept;
> 
> I think you can skip rpmsg_create_default_ept() if you just make this
> struct rpmsg_endpoint *.


For the static_ept, your proposal seems to me cleaner, thanks!

For the rpmsg_create_default_ept. The virtio_rpmsg_announce_create and
virtio_rpmsg_announce_destroy are based on the default endpoint.
So to be able to manage ns announcement, seems better to have a default endpoint.

Today something missing in this function is the call of announce_create ops
I was waiting for the integration of the work before sending the fix but i can
include it:

@@ -143,6 +143,7 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct
rpmsg_device *rpdev,
 						struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_endpoint *ept;
+	int err;

 	if (WARN_ON(!rpdev))
 		return NULL;
@@ -162,6 +163,9 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct
rpmsg_device *rpdev,
 	rpdev->ept = ept;
 	rpdev->src = ept->addr;

+	if (ept && rpdev->ops->announce_create)
+		err = rpdev->ops->announce_create(rpdev);
+
 	return ept;
 }

> 
>>  };
>>  
>>  int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> @@ -116,7 +120,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  
>>  	get_device(dev);
>>  
>> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> +	/*
>> +	 * If the static_ept is set to true, the rpmsg device default endpoint is used.
>> +	 * Else a new endpoint is created on open that will be destroyed on release.
>> +	 */
>> +	if (eptdev->static_ept)
>> +		ept = rpdev->ept;
> 
> This would be:
> 	if (eptdev->static_ept)
> 		ept = eptdev->static_ept;
> 
>> +	else
>> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> +
>>  	if (!ept) {
>>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>>  		put_device(dev);
>> @@ -137,7 +149,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>>  	/* Close the endpoint, if it's not already destroyed by the parent */
>>  	mutex_lock(&eptdev->ept_lock);
>>  	if (eptdev->ept) {
>> -		rpmsg_destroy_ept(eptdev->ept);
>> +		if (!eptdev->static_ept)
>> +			rpmsg_destroy_ept(eptdev->ept);
>>  		eptdev->ept = NULL;
>>  	}
>>  	mutex_unlock(&eptdev->ept_lock);
>> @@ -264,6 +277,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>>  		return -EINVAL;
>>  
>> +	/* Don't allow to destroy a default endpoint. */
>> +	if (eptdev->ept == eptdev->rpdev->ept)
> 
> And this would be if:
> 	if (eptdev->static_ept)
> 		return -EPERM;
> 
> Wouldn't -EINVAL or something be better than -EPERM when you try to
> destroy one of these endpoints?
> 
> It's not that we don't have permission, it's that it's not a valid
> operation on this object.

what about -EACCES?

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +		return -EPERM;
>> +
>>  	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>>  }
>>  
>> -- 
>> 2.17.1
>>
