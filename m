Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E82D8393
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896213; cv=none; b=LJ5KUGtFA8nPHvVfoijE3/yHWUxBkqkjslKfCrs2B20Pcaf8YMZPzlTZZZyncHFHnuhz52HnpqquwqmZ5TNJZ0wAwj+HKk9GSjUZtEC6ygK8HUf90EP/WVM2r8IhLTtTiNBNpZlp3pZyz4ixl3MOSo0elq4oFefq3Lm6KatGRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896213; c=relaxed/simple;
	bh=SpR0y5pS4dZjwL4Y3CJxjwmrS3n8dJSQXdVPgLQMXwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3cvV9Jch+8FC3GmCyHobtUlG7C/kV8YSkG5++BDtuXOy3gNL0gNKTpPgSHPAzJi4NG5VCeGKXpn6B6JAYWQEvO2F7r65fnPjDXmpWsR1QCvuwtWZ+5VTK15qoqBO/N/YvLBVg020ZiAII4cac7+B6o2BuOR97LDsPuEVw4eQOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bMkonieE; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bMkonieE"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dW06P6wLtz9tvd;
	Tue, 16 Dec 2025 15:43:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1765896206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c97Z6ox0Dsj+a8iJuYcIVJnCQ/MlUM99RBqOeKd9u3c=;
	b=bMkonieE8yPi90PqairhniGI0KdwiFf5bZXxLaMByL58t+xqQL25m/94x9y75FVjaqRUPQ
	nA4J5kpqDIgj6vNgJLwofC0/E3Uugpr4MvIPJOEtWAn/1tje5M3EaBQMHKcAIVLhDDuYKO
	dumkWI6NgMmVjY7TOU0LTiRdwHWZoo2leYqKBX1gIv/HxCm9/716cVJCAxcMe21Jy51ks4
	Ptlt5lvDVDWMJsQsogxC/GHEIJgPoxGeelQs5/5+EYGMTgC0/v/pHCNyaiurrtOWNygt8j
	Bbusi/YsNWKLiswwTALD72Xxj4RFQvz3Yjs3tfEsfUgM1ECJS3YpfCbR4Y/KRw==
Message-ID: <652292da-5385-4264-a11b-973ab2c35d88@mailbox.org>
Date: Tue, 16 Dec 2025 15:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: tanmay.shah@amd.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
 linux-remoteproc@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
 <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f6bbab412068c9ac906
X-MBO-RS-META: ekkxcoguqkc9cemprj4m36asxo6q7h5e

Hi Tanmay,

I just now see, that you added some more comments later in your
reply. Please find some comment below...

On 12/10/25 19:28, Tanmay Shah wrote:

<snip>

>>>>>>   /**
>>>>>> @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>>>>       for (i = 0; i < cluster->core_count; i++) {
>>>>>>           r5_core = cluster->r5_cores[i];
>>>>>> +        cancel_work_sync(&r5_core->ipi->mbox_work);
> 
> I see merge-conflict on top of the for-next branch. Please rebase the 
> patch on top of the for-next branch: https://git.kernel.org/pub/scm/ 
> linux/kernel/git/remoteproc/linux.git/log/?h=for-next

Will do in v4.

>>>>>>           zynqmp_r5_free_mbox(r5_core->ipi);
>>>>>>           of_reserved_mem_device_release(r5_core->dev);
>>>>>>           put_device(r5_core->dev);
>>>>>> @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>>>>>>       }
>>>>>>       kfree(cluster->r5_cores);
>>>>>> +    destroy_workqueue(cluster->workqueue);
>>>>>>       kfree(cluster);
>>>>>>       platform_set_drvdata(pdev, NULL);
>>>>>>   }
>>>>>> @@ -1194,11 +1206,20 @@ static int 
>>>>>> zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>>>>>>           return ret;
>>>>>>       }
>>>>>> +    cluster->workqueue = alloc_workqueue(dev_name(dev),
>>>>>> +                         WQ_UNBOUND | WQ_HIGHPRI, 0);
>>>>>> +    if (!cluster->workqueue) {
>>>>>> +        dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
>>>>>> +        kfree(cluster);
>>>>>> +        return -ENOMEM;
>>>>>> +    }
>>>>>> +
> 
> Workqueue will be unused if mbox properties are not mentioned in the 
> device-tree. So, we need to allocate workqueue only if IPI is setup for 
> at least one core. I think following logic should work:
> 
> Make decision if workqueue is needed or not, if zynqmp_r5_setup_mbox() 
> function is passing for atleast one core. If zynqmp_r5_setup_mbox() is 
> success, then set a flag to allocate workqueue, and then later right 
> before calling zynqmp_r5_core_init() allocate the workqueue for the 
> cluster.

Good idea. I'll gladly enhance this in the next patch version, if you
(still) agree that this patch is a valid solution for our use-case,
after reviewing my reply with the r5 side.

> Remoteproc can be used only to load() and start() stop() fw, and RPMsg 
> can be optional.
> 
> Also, before calling destroy_workqueue make sure to have NULL check and 
> destroy only if it was allocated.

Ack.

Thanks,
Stefan

