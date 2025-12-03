Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10572CCC0
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769542; cv=none; b=gP+62MZ1yN5HJOAL9XGzmZv6W4/l6oOYGqcAgsahB0bfeu3Tlw3i37HxGoX2rzPqTZePmjJgFnK3nFDNbFN8Amso1gOgWl+77uizj8NVuSgS/hQDPLqPM+FFe/MMmcTXN+3jxw8lxxQSWXaHYzNQA/rYZ764wPF0Doj0UvBi8Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769542; c=relaxed/simple;
	bh=3O7BsqucWoTUWi1KgxG/oW8IBKSk1Hm+KrmEJbkQUf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLkBdoS7SnmsAeyxKT4vCpuMYoaChmTJdjaWUlHp4e0fcIChMriZ6pRuxwBvMxyhIbIyceMH73hcCaHylM2JCUSuu3m4J4D8z8y/QcAX6MERnBVyYm2JmXoGByVMcp60jq0h1cekWXfal3q3C72LWXhQvl6PgRgPhfo5rmz0iuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sKaag7vy; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sKaag7vy"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dLzRZ5FpVz9sjn;
	Wed,  3 Dec 2025 14:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764769530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlexLWpQYREvi2C+5BEJCHkIEl4pp/NzDH7/SKQraz8=;
	b=sKaag7vyWkyqKwGprWYGAfGZKlAM/KS/hv4SD11RYC+rEP+wImeIZyu71TcI2Mb8+A/rSW
	qcHKIzjoSChgWq1w8i/+hum4i/5Ev+UhWeKdQfy+ei3upx4O/gZjw/WnAzS+qJywht24FI
	hsJhvwt5oCALo/hLOXX4ETfTosT5TL4oZPNSYqu59jI+dVR7P8ka02COE5MI66eDZ/3Dnt
	72Fn+cMp+VHAxJEtgf6AkygY4dZHH73xLbwcXBD8aSewjNUKtCzP/USd4PA1hCqz2SAWco
	F+py91+BuLm2kpatLI9sjpi6bsF+nyWoWjsGwvkCUEfT9yRaYtT9xxq7Hs2+ew==
Message-ID: <7a0426a8-a8a3-4260-8cef-3880a1328e53@mailbox.org>
Date: Wed, 3 Dec 2025 14:45:28 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
 linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20251127130712.1190765-1-stefan.roese@mailbox.org>
 <2db4a957-4291-466c-bdb7-cee5c03a353b@oss.qualcomm.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <2db4a957-4291-466c-bdb7-cee5c03a353b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 38a8cb81e732d5dc694
X-MBO-RS-META: bno1n3bimgpqr8od96a7pwwnjhrngm6x

Hi Zhongqiu Han,

On 11/28/25 08:25, Zhongqiu Han wrote:
> On 11/27/2025 9:07 PM, Stefan Roese wrote:
>> Testing on our ZynqMP platform has shown, that some R5 messages might
>> get dropped under high CPU load. This patch creates a new high-prio
>> workqueue which is now used instead of the default system workqueue.
>> With this change we don't experience these message drops any more.
>>
>> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
>> Cc: Tanmay Shah <tanmay.shah@amd.com>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 21 ++++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/ 
>> remoteproc/xlnx_r5_remoteproc.c
>> index feca6de68da28..459373901c973 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of_reserved_mem.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/remoteproc.h>
>> +#include <linux/workqueue.h>
>>   #include "remoteproc_internal.h"
>> @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
>>       enum  zynqmp_r5_cluster_mode mode;
>>       int core_count;
>>       struct zynqmp_r5_core **r5_cores;
>> +    struct workqueue_struct *workqueue;
>>   };
>>   /**
>> @@ -174,10 +176,18 @@ static void handle_event_notified(struct 
>> work_struct *work)
>>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>   {
>>       struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>> +    struct zynqmp_r5_cluster *cluster;
>>       struct mbox_info *ipi;
>> +    struct device *dev;
>>       size_t len;
>>       ipi = container_of(cl, struct mbox_info, mbox_cl);
>> +    dev = ipi->r5_core->dev;
>> +    cluster = dev_get_drvdata(dev->parent);
>> +    if (!cluster) {
>> +        dev_err(dev->parent, "Invalid driver data\n");
>> +        return;
>> +    }
>>       /* copy data from ipi buffer to r5_core */
>>       ipi_msg = (struct zynqmp_ipi_message *)msg;
>> @@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client 
>> *cl, void *msg)
>>       if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>           dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>> -    schedule_work(&ipi->mbox_work);
>> +    queue_work(cluster->workqueue, &ipi->mbox_work);
>>   }
>>   /**
>> @@ -1194,12 +1204,21 @@ static int zynqmp_r5_remoteproc_probe(struct 
>> platform_device *pdev)
>>           return ret;
>>       }
>> +    cluster->workqueue = alloc_workqueue(dev_name(dev),
> 
> Hi Stefan,
> 
> destroy_workqueue() should also be invoked in zynqmp_r5_cluster_exit() 
> to prevent resource leaks, right?

Of course. Forgot this path. Will add in v2.

>> +                         WQ_UNBOUND | WQ_HIGHPRI, 0);
>> +    if (!cluster->workqueue) {
>> +        dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
>> +        kfree(cluster);
>> +        return -ENOMEM;
>> +    }
>> +
>>       /* wire in so each core can be cleaned up at driver remove */
>>       platform_set_drvdata(pdev, cluster);
>>       ret = zynqmp_r5_cluster_init(cluster);
>>       if (ret) {
>>           kfree(cluster);
>> +        destroy_workqueue(cluster->workqueue);
> 
> Please adjust the call seq to avoid UAF.

Ugh. My bad. Many thanks for catching.

Thanks,
Stefan

>>           platform_set_drvdata(pdev, NULL);
>>           dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");
>>           return ret;
> 
> 

