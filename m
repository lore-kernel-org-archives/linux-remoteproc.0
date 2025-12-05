Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE532694C
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Dec 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936393; cv=none; b=RHJpL9eGGNizEOUX7A3ENTPYX7V1lpYDYZcyHauQy6ojW0ztehxYIpsKuYR4lwBN6V3AYtA6npuK9INKd1eXRk/zGP8S5ZjkbsxzX4bk2Zs8+/f8ZNYeEo2j/QoAaPTJ0+p3FALuLiYbvFZ/z963zpVfvB2ZB1r/JcJXv4HOIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936393; c=relaxed/simple;
	bh=b3J2JxspaTTVjLXRmqvhrIh34yC0/4EpcJHdaw5g5xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BW9dnRclP3bcSPvj9a/up2lKdzv2fM7Ms0ieHijAl9Elm45UBwx9wGxxIePoP3XWyMLmf6C+clL6J/5hSwkOPquSy5KbPNqo5nrdrkkH14lrSdHuCMZP81oWLWEYzetwdR/KEbVAlS1Q6oBXV9401LPGuMdhM+a1aj+G1/Z6Mz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ojNdF4lR; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ojNdF4lR"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dN98C1xGdz9tf9;
	Fri,  5 Dec 2025 13:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764936379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zogow11fEGF/ax42Rjshj60Uy4vGm+j8foKnAWrq9Ek=;
	b=ojNdF4lRY8l3FdIm6PZHGBIcjvgX8v04y5cxJ2t//j4cKYOtunUMUSkSK7TLHpeZKC/yeh
	9F0wVs/iFc82oTxWwGwTnt/Ah4IrpXPe0OjKkQUYQCF8G+m51mjG7c8gB3paX0XRkAdbXn
	ksM04mdYFnmZbkkI0FdQ5/008tkGdZYoYRuV/E2UNtWDMi6TXkFd7Jv20Mhlwi3Fx4gCgw
	xaA5A/zbZX8dUz9S6AdUxcVOcJ6s0VmoNg00pXWABLx6+fURPuB0xtGIY5jcQbEH+xIoAe
	m/i+CK00qA0Ro/1zoIVdm328tRLt6KAmydB4nB6yTqjgwojE+hTWSLQRaYSgxA==
Message-ID: <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
Date: Fri, 5 Dec 2025 13:06:17 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 304cd491a67f07ef1ad
X-MBO-RS-META: 74kkg4h7iudrfs1jzphqtzx471r6ow3a

Hi Tanmay,

On 12/4/25 17:45, Tanmay Shah wrote:
> Hello,
> 
> Thank You for your patch. Please find my comments below.
> 
> On 12/4/25 4:40 AM, Stefan Roese wrote:
>> Testing on our ZynqMP platform has shown, that some R5 messages might
>> get dropped under high CPU load. This patch creates a new high-prio
> 
> Here, I would like to understand what it means by "R5 messages might get 
> dropped"
> 
> Even under high CPU load, the messages from R5 are stored in the 
> virtqueues. If Linux doesn't read it, then it is not really lost/dropped.
> 
> Could you please explain your use case in detail and how the testing is 
> conducted?

Our use-case is, that we send ~4k messages per second from the R5 to
Linux - sometimes even a bit more. Normally these messages are received
okay and no messages are dropped. Sometimes, under "high CPU load"
scenarios it happens, that the R5 has to drop messages, as there is no
free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
from the Linux driver not emptying the RX queue.

Could you please elaborate on these virtqueues a bit? Especially why no
messages drop should happen because of these virtqueues?

Thanks,
Stefan

> Thanks,
> Tanmay
> 
>> workqueue which is now used instead of the default system workqueue.
>> With this change we don't experience these message drops any more.
>>
>> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
>> Cc: Tanmay Shah <tanmay.shah@amd.com>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>> v3:
>> - Call cancel_work_sync() before freeing ipi (suggested by Zhongqiu Han)
>>
>> v2:
>> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() (suggested 
>> by Zhongqiu Han)
>> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
>>
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/ 
>> remoteproc/xlnx_r5_remoteproc.c
>> index feca6de68da28..308328b0b489f 100644
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
>> @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>       for (i = 0; i < cluster->core_count; i++) {
>>           r5_core = cluster->r5_cores[i];
>> +        cancel_work_sync(&r5_core->ipi->mbox_work);
>>           zynqmp_r5_free_mbox(r5_core->ipi);
>>           of_reserved_mem_device_release(r5_core->dev);
>>           put_device(r5_core->dev);
>> @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>       }
>>       kfree(cluster->r5_cores);
>> +    destroy_workqueue(cluster->workqueue);
>>       kfree(cluster);
>>       platform_set_drvdata(pdev, NULL);
>>   }
>> @@ -1194,11 +1206,20 @@ static int zynqmp_r5_remoteproc_probe(struct 
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

