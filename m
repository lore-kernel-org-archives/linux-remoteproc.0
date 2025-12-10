Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE372FD7A7
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355368; cv=none; b=OsjZax41+TnZXtfIgeZgA+GmDk82+beTOr5b02DsKXKp9Ck2wQ+pAj3vl9vYJnZ78KUbgPPTxaFV0Qi0IprxX126FT7vVTx+3lzyzbhwfyd3DbYFk+i5a5v6N8CZIxjPFrgLoLOCsxOLZFoC9SyPjIQxDabLY2rJyzS4leNhGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355368; c=relaxed/simple;
	bh=qvi74J9sGmPbv2Wwh8WA/VqFaGmAKDgSY+ejYYpI0LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqB4FSHXeoB83FIYtOW4wzfxGekoplMLmJixXwkYQjgPavYhKJKCy72tjFVy/UoBG73cEvK3rb/IAJyNmB7BC0llUKcOHEzsL5ty543uZjDckfUx9Od+Xh3Cmh0QEiP4siMhhXP08VT0YDx2x1eH28QQdY9Mw3YCFjO3NEUA1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fOaPSDWV; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fOaPSDWV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dR85S3tchz9sxW;
	Wed, 10 Dec 2025 09:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1765355356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2fAVVKkr71HL6JDJ23QePccl/g4qDPSbnYyac60MMc=;
	b=fOaPSDWVpmCb6ma+E9ClcXaf1JoJdVfnzayVT2JezGJu+ZXP4MBuMWYNvsjIF0mglff5LP
	KSYUhqpkX8/X6n8ssyLLL8SHVSR3NjH0khsoiyKJs07Wg/l9vEPar9znjMSAqapL2X7KqX
	6t5ma/qEEq4D1E5o7WEJFSKuPmyrFFRmIH6DFf2gTzoUIIz6PdPS24zpqnUktAXEl5ptnR
	IyjjQwWkR8TmAkllUy6WLvhGUEQvyS3TOuJLRVM2kpYy4d8dcNbwIL+9Ouv9lpSaSJuRTg
	10/XRiAodsbTH2WLYDidmVL6IlmgapQq9nKtKjHpNiBE5oaaEb/8PXTSVrmcjw==
Message-ID: <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
Date: Wed, 10 Dec 2025 09:29:15 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, tanmay.shah@amd.com,
 linux-remoteproc@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9f183a8da079215615a
X-MBO-RS-META: j5qmifyc5q684ia6nzb96u3duh8pcbde

Hi Tanmay,

On 12/10/25 03:51, Zhongqiu Han wrote:
> On 12/5/2025 8:06 PM, Stefan Roese wrote:
>> Hi Tanmay,
>>
>> On 12/4/25 17:45, Tanmay Shah wrote:
>>> Hello,
>>>
>>> Thank You for your patch. Please find my comments below.
>>>
>>> On 12/4/25 4:40 AM, Stefan Roese wrote:
>>>> Testing on our ZynqMP platform has shown, that some R5 messages might
>>>> get dropped under high CPU load. This patch creates a new high-prio
>>>
>>> Here, I would like to understand what it means by "R5 messages might 
>>> get dropped"
>>>
>>> Even under high CPU load, the messages from R5 are stored in the 
>>> virtqueues. If Linux doesn't read it, then it is not really lost/ 
>>> dropped.
>>>
>>> Could you please explain your use case in detail and how the testing 
>>> is conducted?
>>
>> Our use-case is, that we send ~4k messages per second from the R5 to
>> Linux - sometimes even a bit more. Normally these messages are received
>> okay and no messages are dropped. Sometimes, under "high CPU load"
>> scenarios it happens, that the R5 has to drop messages, as there is no
>> free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
>> from the Linux driver not emptying the RX queue.
>>
>> Could you please elaborate on these virtqueues a bit? Especially why no
>> messages drop should happen because of these virtqueues?
> 
> AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
> message has been successfully enqueued. The observed "drop" here appears
> to be on the R5 side, where the application discards messages when no
> entry buffer is available.

Correct.

> In the long run, while improving the Linux side is recommended,

Yes, please.

> it could
> also be helpful for the R5 side to implement strategies such as an
> application-level buffer and retry mechanisms.

We already did this. We've added an additional buffer mechanism to the
R5, which improved this "message drop situation" a bit. Still it did not
fix it for all our high message rate situations - still resulting in
frame drops on the R5 side (the R5 is a bit resource restricted).

Improving the responsiveness on the Linux side seems to be the best way
for us to deal with this problem.

Thanks,
Stefan

> 
>>
>> Thanks,
>> Stefan
>>
>>> Thanks,
>>> Tanmay
>>>
>>>> workqueue which is now used instead of the default system workqueue.
>>>> With this change we don't experience these message drops any more.
>>>>
>>>> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
>>>> Cc: Tanmay Shah <tanmay.shah@amd.com>
>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>> ---
>>>> v3:
>>>> - Call cancel_work_sync() before freeing ipi (suggested by Zhongqiu 
>>>> Han)
>>>>
>>>> v2:
>>>> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() 
>>>> (suggested by Zhongqiu Han)
>>>> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
>>>>
>>>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
>>>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/ 
>>>> remoteproc/xlnx_r5_remoteproc.c
>>>> index feca6de68da28..308328b0b489f 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -16,6 +16,7 @@
>>>>   #include <linux/of_reserved_mem.h>
>>>>   #include <linux/platform_device.h>
>>>>   #include <linux/remoteproc.h>
>>>> +#include <linux/workqueue.h>
>>>>   #include "remoteproc_internal.h"
>>>> @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
>>>>       enum  zynqmp_r5_cluster_mode mode;
>>>>       int core_count;
>>>>       struct zynqmp_r5_core **r5_cores;
>>>> +    struct workqueue_struct *workqueue;
>>>>   };
>>>>   /**
>>>> @@ -174,10 +176,18 @@ static void handle_event_notified(struct 
>>>> work_struct *work)
>>>>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>   {
>>>>       struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>>> +    struct zynqmp_r5_cluster *cluster;
>>>>       struct mbox_info *ipi;
>>>> +    struct device *dev;
>>>>       size_t len;
>>>>       ipi = container_of(cl, struct mbox_info, mbox_cl);
>>>> +    dev = ipi->r5_core->dev;
>>>> +    cluster = dev_get_drvdata(dev->parent);
>>>> +    if (!cluster) {
>>>> +        dev_err(dev->parent, "Invalid driver data\n");
>>>> +        return;
>>>> +    }
>>>>       /* copy data from ipi buffer to r5_core */
>>>>       ipi_msg = (struct zynqmp_ipi_message *)msg;
>>>> @@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct 
>>>> mbox_client *cl, void *msg)
>>>>       if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>>>           dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>>>> -    schedule_work(&ipi->mbox_work);
>>>> +    queue_work(cluster->workqueue, &ipi->mbox_work);
>>>>   }
>>>>   /**
>>>> @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>>       for (i = 0; i < cluster->core_count; i++) {
>>>>           r5_core = cluster->r5_cores[i];
>>>> +        cancel_work_sync(&r5_core->ipi->mbox_work);
>>>>           zynqmp_r5_free_mbox(r5_core->ipi);
>>>>           of_reserved_mem_device_release(r5_core->dev);
>>>>           put_device(r5_core->dev);
>>>> @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>>       }
>>>>       kfree(cluster->r5_cores);
>>>> +    destroy_workqueue(cluster->workqueue);
>>>>       kfree(cluster);
>>>>       platform_set_drvdata(pdev, NULL);
>>>>   }
>>>> @@ -1194,11 +1206,20 @@ static int zynqmp_r5_remoteproc_probe(struct 
>>>> platform_device *pdev)
>>>>           return ret;
>>>>       }
>>>> +    cluster->workqueue = alloc_workqueue(dev_name(dev),
>>>> +                         WQ_UNBOUND | WQ_HIGHPRI, 0);
>>>> +    if (!cluster->workqueue) {
>>>> +        dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
>>>> +        kfree(cluster);
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>>       /* wire in so each core can be cleaned up at driver remove */
>>>>       platform_set_drvdata(pdev, cluster);
>>>>       ret = zynqmp_r5_cluster_init(cluster);
>>>>       if (ret) {
>>>> +        destroy_workqueue(cluster->workqueue);
>>>>           kfree(cluster);
>>>>           platform_set_drvdata(pdev, NULL);
>>>>           dev_err_probe(dev, ret, "Invalid r5f subsystem device 
>>>> tree\n");
>>>
>>
> 
> 

