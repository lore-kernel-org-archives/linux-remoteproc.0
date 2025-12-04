Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC13321C6
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Dec 2025 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844980; cv=none; b=baip3O+NOvdhbz39IkAWe0kIjXjy6Ds77ZZvBr3j3F0697EUUX4esWzo+KrkkK9E9NZAKFBet8tslYiLsGMRgMlklTVoJjsQZWLfoLdCDHs+kf7OkVh+0iOYyRdsCVTIPxwxWiTFT7bmaygFFZdc1mQrXaDpRmIkv56i6527boY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844980; c=relaxed/simple;
	bh=lVT40/jiAHXnoFujp49ONQ4CxY7rIoT45/Ld188ZgCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9RQkDpikE5qKRq9rChvx+SiObEVbczIhDFv0hsjNWl8SW4nRHX3QUJiqImn04nNgMJAgNUIS0DiLiZaahKi6AIfXDe1lqFCsNkMq4U0rJWyUj61nmv8+xEtpSi89bA4I4T58mRTSXP88HRETJ8U9UILEhMELA4q2/oBIF5y2Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Mf61IHoO; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Mf61IHoO"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dMWLP5Z5Qz9sqQ;
	Thu,  4 Dec 2025 11:42:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764844973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGOt1eY0PAwWA5/qydvHrlNWMZsmb7BfEjobmJaqi4M=;
	b=Mf61IHoOHzMVKJjaC5itbcY3q+EOtt9MUoOAR0hBoBVPsQOQxPFlIUdgRu1b2ifj818+YG
	bwxwOaEHJ5jmfQc4rJZRZwciRHkBHaM96Vp9B2pqmZrq7lYJdIMmwSKAF/eaC5DGWFtRg8
	LEkzRFUtmDOUDvX57dQy/wONm2kSi1VTxdzNqJd4XH3qY3LhwipgRnygIR5uEvNoAD/pDR
	qcsO3gcFPMeTCfqx8GoRiUXrybFSmkVVBZDQzDy9hbwYEKN8dUNjKb81/yo1cGE3CaPuow
	LcMM/UM/wnSsx+1zwgXcpWPlVHTyxy3MmZzIs0ymxQdarxLB8S4HtLt9kwKAug==
Message-ID: <0993fc0f-473a-4299-9fa2-464ce325e03a@mailbox.org>
Date: Thu, 4 Dec 2025 11:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
 linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251203135057.140349-1-stefan.roese@mailbox.org>
 <70c1d755-8ac3-4c3a-bbd8-5dfafd32059d@oss.qualcomm.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <70c1d755-8ac3-4c3a-bbd8-5dfafd32059d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: uti5mwrhi9wge37jwy19bodxb4tc54ib
X-MBO-RS-ID: 4aaf932162ab1613a21

Hi Zhongqiu Han,

On 12/4/25 07:53, Zhongqiu Han wrote:
> On 12/3/2025 9:50 PM, Stefan Roese wrote:
>> Testing on our ZynqMP platform has shown, that some R5 messages might
>> get dropped under high CPU load. This patch creates a new high-prio
>> workqueue which is now used instead of the default system workqueue.
>> With this change we don't experience these message drops any more.
>>
>> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
>> Cc: Tanmay Shah <tanmay.shah@amd.com>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
>> ---
>> v2:
>> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() (suggested 
>> by Zhongqiu Han)
>> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
>>
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/ 
>> remoteproc/xlnx_r5_remoteproc.c
>> index feca6de68da28..42c8884bc760f 100644
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
>> @@ -1162,6 +1172,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>       }
>>       kfree(cluster->r5_cores);
>> +    destroy_workqueue(cluster->workqueue);
> 
> Hi Stefan,
> Thanks for your patchset v2.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/ 
> tree/drivers/remoteproc/xlnx_r5_remoteproc.c?h=rproc-next
> 
> static void zynqmp_r5_cluster_exit(void *data)
> {
>      struct platform_device *pdev = data;
>      struct zynqmp_r5_cluster *cluster;
>      struct zynqmp_r5_core *r5_core;
>      int i;
> 
>      cluster = platform_get_drvdata(pdev);
>      if (!cluster)
>          return;
> 
>      for (i = 0; i < cluster->core_count; i++) {
>          r5_core = cluster->r5_cores[i];
>          zynqmp_r5_free_mbox(r5_core->ipi);  <--------freeing ipi
>          iounmap(r5_core->rsc_tbl_va);
>          of_reserved_mem_device_release(r5_core->dev);
>          put_device(r5_core->dev);
>          rproc_del(r5_core->rproc);
>          rproc_free(r5_core->rproc);
>      }
> 
>      kfree(cluster->r5_cores);
>      kfree(cluster);
>      platform_set_drvdata(pdev, NULL);
> }
> 
> 
> Please consider calling cancel_work_sync before freeing ipi to avoid
> potential UAF.

Added to v3, even though I forgot to put you on Cc this time (sorry).

Thanks,
Stefan

> 
> 
>>       kfree(cluster);
>>       platform_set_drvdata(pdev, NULL);
>>   }
>> @@ -1194,11 +1205,20 @@ static int zynqmp_r5_remoteproc_probe(struct 
>> platform_device *pdev)
>>           return ret;
>>       }
>> +    cluster->workqueue = alloc_workqueue(dev_name(dev),
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
>> +        destroy_workqueue(cluster->workqueue);
>>           kfree(cluster);
>>           platform_set_drvdata(pdev, NULL);
>>           dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");
> 
> 

