Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2B156F44;
	Wed, 18 Dec 2024 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734510207; cv=none; b=hQmlKrXqmQD3TrJh2TTptZM2e7hY5Qsr5KtYA6hFr2c4gE2h9NETnBHDtOuCJwG7gJ5T82LDddAN4eiH3ibZPdCTxIq6tpFSW9uCEOzjpHo0L0L6K9G0HlDggxNOiuNwNnDIbfF0WDEe1vRTrsrKyo9VstZiPRPbOUSH0paOnXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734510207; c=relaxed/simple;
	bh=Mtsyf9a54iJiIMxNhS6apyo/4PtNQTzkpjKH++AEDy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oSBU63JoR9F9+gxApCp1fX+odCXTcFYU9u/AXUkXbzfOq6/PTl14YicRBBUue7PejnPAtSuO7rRWjrIIK7oVzsw9AkP1QMS3KNjlspQsR0nwdK6x6htXBn5RujCw2mgEQqxiSAAjq6WyMnHZvaj1Zn/UTJyDFvj1bIkGdQBBTUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OPLXXqfI; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OPLXXqfI"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BI8NIXi050250;
	Wed, 18 Dec 2024 02:23:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734510198;
	bh=AGHqrVzM2yIL1iG2TrOD/3T4wA2HIJbJxWvOjFNCv0s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OPLXXqfIBbaJWaRnCOUpa7HYDM4jIwr34OKp2BeQSJBvwEw0ol5dv4INcBfK08lGM
	 Tr3vRhO/TkIQ5dbTt/VvwZhhJI1/k2Usz5c0aH8bn8ZBkX6iNbPkPr9HshOk2NVW0f
	 VhRK7jw6L6sP5eJ4xWSzqcSMlG/VYx9Ax76jkxu4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BI8NIrn011622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Dec 2024 02:23:18 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 02:23:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 02:23:18 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BI8NFlT044429;
	Wed, 18 Dec 2024 02:23:15 -0600
Message-ID: <e6962344-906d-44fd-a822-70a5d54f523e@ti.com>
Date: Wed, 18 Dec 2024 13:53:14 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] remoteproc: k3-r5: Use devm_ioremap_wc() helper
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241204111130.2218497-1-b-padhi@ti.com>
 <20241204111130.2218497-5-b-padhi@ti.com>
 <5c016c4a-b7f2-4e9a-bb99-f56e0bf86e6f@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <5c016c4a-b7f2-4e9a-bb99-f56e0bf86e6f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 17/12/24 21:33, Andrew Davis wrote:
> On 12/4/24 5:11 AM, Beleswar Padhi wrote:
>> Use a device lifecycle managed ioremap helper function. This helps
>> prevent mistakes like unmapping out of order in cleanup functions and
>> forgetting to unmap on all error paths.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 40 +++++-------------------
>>   1 file changed, 8 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 2966cb210403..1a7681502f62 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -1004,17 +1004,13 @@ static int k3_r5_reserved_mem_init(struct 
>> k3_r5_rproc *kproc)
>>       /* use remaining reserved memory regions for static carveouts */
>>       for (i = 0; i < num_rmems; i++) {
>>           rmem_np = of_parse_phandle(np, "memory-region", i + 1);
>> -        if (!rmem_np) {
>> -            ret = -EINVAL;
>> -            goto unmap_rmem;
>> -        }
>> +        if (!rmem_np)
>> +            return -EINVAL;
>>             rmem = of_reserved_mem_lookup(rmem_np);
>>           of_node_put(rmem_np);
>> -        if (!rmem) {
>> -            ret = -EINVAL;
>> -            goto unmap_rmem;
>> -        }
>> +        if (!rmem)
>> +            return -EINVAL;
>>             kproc->rmem[i].bus_addr = rmem->base;
>>           /*
>> @@ -1029,12 +1025,11 @@ static int k3_r5_reserved_mem_init(struct 
>> k3_r5_rproc *kproc)
>>            */
>>           kproc->rmem[i].dev_addr = (u32)rmem->base;
>>           kproc->rmem[i].size = rmem->size;
>> -        kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
>> +        kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, 
>> rmem->size);
>>           if (!kproc->rmem[i].cpu_addr) {
>>               dev_err(dev, "failed to map reserved memory#%d at %pa 
>> of size %pa\n",
>>                   i + 1, &rmem->base, &rmem->size);
>> -            ret = -ENOMEM;
>> -            goto unmap_rmem;
>> +            return -ENOMEM;
>>           }
>>             dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx 
>> va %pK da 0x%x\n",
>> @@ -1045,19 +1040,6 @@ static int k3_r5_reserved_mem_init(struct 
>> k3_r5_rproc *kproc)
>>       kproc->num_rmems = num_rmems;
>>         return 0;
>> -
>> -unmap_rmem:
>> -    for (i--; i >= 0; i--)
>> -        iounmap(kproc->rmem[i].cpu_addr);
>> -    return ret;
>> -}
>> -
>> -static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
>> -{
>> -    int i;
>> -
>> -    for (i = 0; i < kproc->num_rmems; i++)
>> -        iounmap(kproc->rmem[i].cpu_addr);
>>   }
>>     /*
>> @@ -1285,10 +1267,8 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>           }
>>             ret = rproc_add(rproc);
>> -        if (ret) {
>> -            dev_err(dev, "rproc_add failed, ret = %d\n", ret);
>> -            goto err_add;
>> -        }
>> +        if (ret)
>> +            dev_err_probe(dev, ret, "rproc_add failed\n");
>
> Did you mean to return the result of dev_err_probe() here? Without that


Thanks for catching this. Should return here. Will fix in v2.

Thanks,
Beleswar

> now anything between here and where err_add used to be will get run.
> Might be more clear that this is correct by still doing a "goto out;"
>
> Andrew
>
>>             /* create only one rproc in lockstep, single-cpu or
>>            * single core mode
>> @@ -1333,8 +1313,6 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>     err_powerup:
>>       rproc_del(rproc);
>> -err_add:
>> -    k3_r5_reserved_mem_exit(kproc);
>>   out:
>>       /* undo core0 upon any failures on core1 in split-mode */
>>       if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
>> @@ -1379,8 +1357,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>>           mbox_free_channel(kproc->mbox);
>>             rproc_del(rproc);
>> -
>> -        k3_r5_reserved_mem_exit(kproc);
>>       }
>>   }
