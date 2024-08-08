Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFB2F50;
	Thu,  8 Aug 2024 05:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723093844; cv=none; b=HXDcEjHzMnvGFnvtBUkJgwWcYyjchnEkV6jQgZ0SH31BkdEMZzUITYst7w8Nrz0M/xNcnMCpcCXANs1tgcYLVhh2Fn6KTwXXp57sD0ZxWuIrVdhdslvPl6vjjnHL9WDAjTNruSNripvECC1E8nxBFz3CMsRw02rlnDN1wpa2OM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723093844; c=relaxed/simple;
	bh=GEBUNzKqeGAOq3KLlqNx4q1RtbETlHljI0lC3/qcXKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Up8nChGVJoAshEs3wwg4lGd1Qn/VuKfSlE6dsfJj5bZj9TzycRKFxTmLFZIfc1uevtsBmo0jkK4/BDnO8dzE2KTeI0kyxqvfZN253j7AKM2PophR7xwHRKDluxkbls4EOewrpx0pnFCYw9AKpAOpYaubq9eqYJdJB/sBigJjuNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FR0bBEb1; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FR0bBEb1"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4785AcI3080354;
	Thu, 8 Aug 2024 00:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723093838;
	bh=HymC+3OI2VIgi/7rto3aB7hoHHD2MD+8NAq3AuO8yWM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FR0bBEb15Py0vwuNnNZXligpx9lnVp6DmIUVmpdpsRfEyuMjuINKGNcmvCj04YY8a
	 vZX2DUHUG3zQYjd3B3wVeR3AFJwDXtRyQvgTkCfMAIG8L4tcMyNyo52w4Up0JCewC5
	 usVxHcMUVgP2Y4thiXBK3s73iKBNMzYrFaHz0W0M=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4785AccS121641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 00:10:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 00:10:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 00:10:38 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4785AZRM040275;
	Thu, 8 Aug 2024 00:10:36 -0500
Message-ID: <b4c405a0-bb35-4408-a356-9e26c6f1d19e@ti.com>
Date: Thu, 8 Aug 2024 10:40:35 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240807062256.1721682-1-b-padhi@ti.com>
 <20240807062256.1721682-2-b-padhi@ti.com>
 <0bba5293-a55d-4f13-887c-272a54d6e1ca@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <0bba5293-a55d-4f13-887c-272a54d6e1ca@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andrew,

On 07/08/24 19:07, Andrew Davis wrote:
> On 8/7/24 1:22 AM, Beleswar Padhi wrote:
>> Use the device lifecycle managed allocation function. This helps prevent
>> mistakes like freeing out of order in cleanup functions and forgetting
>> to free on error paths.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 39a47540c590..dbcd8840ae8d 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -1259,8 +1259,8 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>               goto out;
>>           }
>>   -        rproc = rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
>> -                    fw_name, sizeof(*kproc));
>> +        rproc = devm_rproc_alloc(cdev, dev_name(cdev), 
>> &k3_r5_rproc_ops,
>> +                     fw_name, sizeof(*kproc));
>>           if (!rproc) {
>>               ret = -ENOMEM;
>>               goto out;
>> @@ -1352,7 +1352,6 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>   err_add:
>>       k3_r5_reserved_mem_exit(kproc);
>>   err_config:
>> -    rproc_free(rproc);
>>       core->rproc = NULL;
>
> I'd remove this line too, we don't check for NULL later, we check
> core->rproc->status, which will cause a nullptr dereference error
> instead of correctly detecting that the core is "offline".


Thanks for catching this! Will post revision with this change.

>
> Same below.
>
> Andrew
>
>>   out:
>>       /* undo core0 upon any failures on core1 in split-mode */
>> @@ -1399,7 +1398,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>>             k3_r5_reserved_mem_exit(kproc);
>>   -        rproc_free(rproc);
>>           core->rproc = NULL;
>>       }
>>   }
